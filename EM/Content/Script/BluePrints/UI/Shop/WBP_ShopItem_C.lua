require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class("BluePrints.UI.Shop.WBP_Shop_Item_Base_C")

function M:Destruct()
  self:CleanTimer()
end

function M:OnListItemObjectSet(Content)
  self.ShopId = Content.ShopId
  self.IsSelect = Content.IsSelect
  self:InitShopItem(self.ShopId)
  if self.IsSelect then
    self:ShowItemDetail()
  end
end

function M:InitShopItem(ShopItemId)
  self:ResetItem()
  local ShopItemData
  if ShopItemId and DataMgr.ShopItem[ShopItemId] then
    ShopItemData = setmetatable({}, {
      __index = DataMgr.ShopItem[ShopItemId]
    })
  end
  self:EMShowReddot(false, EReddotType.New, 0)
  if not ShopItemData then
    local ItemContent = {}
    self.Group_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Item_Shop:Init(ItemContent)
    return
  end
  self.ShopItemData = ShopItemData
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ItemData = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId]
  if not ItemData then
    return
  end
  self.bNewShopItem = Avatar:CheckShopItemEnhanceRedDot(ShopItemId)
  if self.bNewShopItem then
    self:EMShowReddot(true, EReddotType.New, 0)
  end
  self.IsFree = ShopUtils:IsFree(ShopItemId)
  if self.IsFree then
    self:EMShowReddot(true, EReddotType.Normal, 0)
  end
  if not self.IsFree and not self.bNewShopItem then
    local ShopTabConf = DataMgr.ShopTabSub[self.ShopItemData.SubTabId]
    local NodeName = ShopTabConf and ShopTabConf.ReddotNode
    if NodeName then
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
      if CacheDetail[self.ShopId] and CacheDetail[self.ShopId] ~= Const.ShopCacheReason.Read then
        self:EMShowReddot(true, EReddotType.New, 0)
      end
    end
  end
  local ItemName = ItemUtils:GetDropName(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
  if self.ShopItemData.ItemType == "Draft" then
    ItemName = ItemUtils:GetDraftName(ItemData.DraftId)
  end
  if self.ShopItemData.TypeNum and self.ShopItemData.TypeNum > 1 then
    ItemName = ItemName .. " x" .. self.ShopItemData.TypeNum
  end
  self.Text_Name:SetText(ItemName)
  self.Text_Name_NoQuality:SetText(ItemName)
  self:Set_Text_Height()
  local CurrentCount = Avatar:GetResourceNum(self.ShopItemData.PriceType)
  local Cost = ShopUtils:GetShopItemPrice(ShopItemData.ItemId)
  self.CutoffData = ShopUtils:GetShopItemCutoffData(ShopItemData.ItemId)
  self.Text_Undiscounted_Price:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.CutoffData then
    self.Text_Discount:SetText(100 - self.CutoffData.CutoffShow)
    self.Text_Undiscounted_Price:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Undiscounted_Price:SetText(self.ShopItemData.Price)
    self.Panel_Discount:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CutoffData.CutoffEndTime then
      self.Panel_Time:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:UpdateCutoffTime(self.CutoffData.CutoffEndTime)
      self:AddTimer(1, self.UpdateCutoffTime, true, 0, "RefreshCutoffTimer", true, self.CutoffData.CutoffEndTime)
    else
      self.Text_Undiscounted_Price:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Text_Price:SetText(math.ceil(self.ShopItemData.Price))
      self.Panel_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  elseif ShopItemData.StartTime and ShopItemData.EndTime then
    self.Panel_Time:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:UpdateLimitTime()
    self:AddTimer(1, self.UpdateLimitTime, true, 0, "RefreshEndTimer", true)
  else
    self.Panel_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateShopItemRefreshTime(ShopItemData.RefreshTime)
  self:RefreshSoldOutInfo()
  local Rarity = DataMgr[ShopItemData.ItemType][ShopItemData.TypeId].Rarity or DataMgr[ShopItemData.ItemType][ShopItemData.TypeId][ShopItemData.ItemType .. "Rarity"]
  self.WS_Name:SetActiveWidgetIndex(0)
  if not Rarity then
    self.WS_Name:SetActiveWidgetIndex(1)
  end
  local ItemContent = {}
  ItemContent.ShopItemId = ShopItemId
  ItemContent.Icon = ItemUtils.GetItemIconPath(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
  ItemContent.Rarity = Rarity
  self.Item_Shop:Init(ItemContent)
  self.Walnut_Number:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Price:SetText(math.ceil(Cost))
  if 0 == Cost then
    self.Text_Price:SetText(GText("UI_FREE"))
    self.Group_Currency:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Currency:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if CurrentCount < Cost then
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
  else
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  end
  self.Img_Currency:SetBrushResourceObject(ItemUtils.GetItemIcon(self.ShopItemData.PriceType, "Resource"))
  if ShopItemData.UnlockLevel and Avatar.Level < ShopItemData.UnlockLevel then
    self.Lock.Text_Lock:SetText(GText("UI_Player_Level") .. ShopItemData.UnlockLevel)
    self.Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Lock:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ResetItem()
  self.Group_Item:SetVisibility(ESlateVisibility.Visible)
  self.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Discount:SetVisibility(ESlateVisibility.Collapsed)
end

function M:RefreshSoldOutInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  if PurchaseLimit > -1 then
    self.Group_BuyLimit:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Limit:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Limit:SetText(GText("UI_SHOP_SHOPITEMLIMIT") .. PurchaseLimit .. "/" .. self.ShopItemData.PurchaseLimit)
    if 0 == PurchaseLimit or Avatar:CheckShopItemUnique(self.ShopItemData.ItemId) then
      if 0 ~= PurchaseLimit and Avatar:CheckShopItemUnique(self.ShopItemData.ItemId) then
        self.Text_SoldOut:SetText(GText("UI_SHOP_ALREADYOWNED"))
      else
        self.Text_SoldOut:SetText(GText("UI_SHOP_SOLDOUT"))
      end
      self.Panel_Discount:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Group_BuyLimit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_Limit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateCutoffTime(EndTime)
  local CurrentTime = TimeUtils.NowTime()
  local RemainRefreshTime = EndTime - CurrentTime
  if RemainRefreshTime <= 0 then
    self:RemoveTimer("RefreshCutoffTimer")
    self:InitShopItem(self.ShopId)
  end
  local RemainTimeStr = ShopUtils:GetRefreshTimeStr(RemainRefreshTime)
  self.Text_Time:SetText(RemainTimeStr)
  self:RefreshSoldOutInfo()
end

function M:UpdateLimitTime()
  if not self.ShopItemData.EndTime then
    self:CleanTimer()
    return
  end
  local StartTiem = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(TimeUtils.NowTime())
  local EndTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(self.ShopItemData.EndTime)
  local RemainTime = UKismetMathLibrary.Subtract_DateTimeDateTime(EndTime, StartTiem)
  local RemainTimeStr = ""
  local TimeCount = 0
  if UKismetMathLibrary.GetDays(RemainTime) > 0 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(RemainTime))
  end
  if UKismetMathLibrary.GetHours(RemainTime) > 0 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), UKismetMathLibrary.GetHours(RemainTime))
  end
  if UKismetMathLibrary.GetMinutes(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), UKismetMathLibrary.GetMinutes(RemainTime))
  end
  if UKismetMathLibrary.GetSeconds(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), UKismetMathLibrary.GetSeconds(RemainTime))
  end
  self.Text_Time:SetText(RemainTimeStr)
end

function M:UpdateShopItemRefreshTime(RefreshTime)
  if not RefreshTime then
    self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:RefreshShopRefreshTime(RefreshTime)
    self:AddTimer(1, self.RefreshShopRefreshTime, true, 0, "RefreshTimeTimer", true, RefreshTime)
  end
end

function M:IsLaterThanNow(Time)
  local CurrentYear = os.date("*t", TimeUtils.NowTime()).year
  local CurrentMonth = os.date("*t", TimeUtils.NowTime()).month
  local CurrentDay = os.date("*t", TimeUtils.NowTime()).day
  local CurrentHour = os.date("*t", TimeUtils.NowTime()).hour
  if CurrentYear > Time.year then
    return false
  elseif CurrentYear == Time.year then
    if CurrentMonth > Time.month then
      return false
    elseif CurrentMonth == Time.month then
      if CurrentDay > Time.day then
        return false
      elseif CurrentDay == Time.day and CurrentHour >= Time.hour then
        return false
      end
    end
  end
  return true
end

function M:RefreshShopRefreshTime(RefreshTime)
  local ShopRefreshBeginTime = CommonConst.ShopRefreshBeginTime
  local StartTime = os.time({
    year = ShopRefreshBeginTime[1],
    month = ShopRefreshBeginTime[2],
    day = ShopRefreshBeginTime[3],
    hour = ShopRefreshBeginTime[4],
    min = ShopRefreshBeginTime[5],
    sec = ShopRefreshBeginTime[6]
  })
  local NextRefreshTimeTable = os.date("*t", StartTime)
  local CurrentTime = TimeUtils.NowTime()
  local Interval = 0
  local timeDifference = 0
  local RemainRefreshTime = 0
  if RefreshTime.HOUR then
    Interval = RefreshTime.HOUR * 60 * 60
    timeDifference = CurrentTime - StartTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.DAY then
    Interval = RefreshTime.DAY * 60 * 60 * 24
    timeDifference = CurrentTime - StartTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.WEEK then
    StartTime = StartTime - CommonConst.SECOND_IN_WEEKDAY
    local refresh_hms = CommonConst.GAME_REFRESH_HMS
    local LastRefreshTime = TimeUtils.NextWeeklyRefreshTime(StartTime, refresh_hms)
    Interval = RefreshTime.WEEK * 7 * 60 * 60 * 24
    timeDifference = CurrentTime - LastRefreshTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.MONTH then
    while self:IsLaterThanNow(NextRefreshTimeTable) == false do
      if NextRefreshTimeTable.month + RefreshTime.MONTH > 12 then
        NextRefreshTimeTable.year = NextRefreshTimeTable.year + 1
        NextRefreshTimeTable.month = NextRefreshTimeTable.month + RefreshTime.MONTH - 12
      else
        NextRefreshTimeTable.month = NextRefreshTimeTable.month + RefreshTime.MONTH
      end
    end
    local NextRefreshTime = os.time(NextRefreshTimeTable)
    RemainRefreshTime = os.difftime(NextRefreshTime, TimeUtils.NowTime())
  end
  local RemainTimeStr = ""
  local TimeCount = 0
  if RemainRefreshTime > 86400 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), math.floor(RemainRefreshTime / 86400))
    RemainRefreshTime = RemainRefreshTime % 86400
  end
  if RemainRefreshTime > 3600 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), math.floor(RemainRefreshTime / 3600))
    RemainRefreshTime = RemainRefreshTime % 3600
  end
  if RemainRefreshTime > 60 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), math.floor(RemainRefreshTime / 60))
    RemainRefreshTime = RemainRefreshTime % 60
  end
  if RemainRefreshTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), RemainRefreshTime)
  end
  self.Text_RefreshTime:SetText(RemainTimeStr)
end

function M:ShowItemDetail()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:CheckShopItemEnhanceRedDot(self.ShopItemData.ItemId) then
    Avatar:CleanShopItemEnhanceRedDot(self.ShopId, function()
      self:EMShowReddot(false, EReddotType.New, 0)
    end)
  end
  if DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId] then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return false
    end
    if not HeroUSDKSubsystem():IsHeroSDKEnable() then
      local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
      GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "sgm pgi " .. DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId])
      return
    end
    Avatar:RequestPay(DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId], function(ret, OrderId, CallbackUrl)
      if not ErrorCode:Check(ret) then
        return
      end
      local PaymentParameters = FHeroUPaymentParameters()
      PaymentParameters.goodsId = DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId]
      PaymentParameters.cpOrder = OrderId
      PaymentParameters.callbackUrl = CallbackUrl
      local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
      HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
    end)
  else
    AudioManager(self):PlayItemSound(self, self.ShopItemData.TypeId, "Click", self.ShopItemData.ItemType)
    local RemainTimes = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
    local ItemData = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId]
    local bForbidden = not ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId))
    local CommonPopupUIID
    if self.ShopItemData.ItemType == "CharAccessory" or self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "WeaponSkin" or self.ShopItemData.ItemType == "Skin" or self.ShopItemData.ItemType == "Resource" and DataMgr.Resource[self.ShopItemData.TypeId] and DataMgr.Resource[self.ShopItemData.TypeId].ResourceSType == "GestureItem" then
      UIManager(self):LoadUINew("SkinPreview", self.ShopItemData, self)
    elseif self.ShopItemData.ItemType == "Reward" and (DataMgr.Reward[ItemData.RewardId].Mode == "Fixed" or DataMgr.Reward[ItemData.RewardId].Mode == "Once") then
      if 1 == self.ShopItemData.Bg then
        UIManager(self):LoadUINew("PayGiftPopup_Yellow", self.ShopItemData, self)
      elseif 2 == self.ShopItemData.Bg then
        UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
      else
        UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
      end
    elseif 0 == RemainTimes or 6 == self.ShopItemData.PurchaseFailRes then
      CommonPopupUIID = 100042
    else
      CommonPopupUIID = 100041
    end
    if not CommonPopupUIID then
      return
    end
    local Funds = {}
    Funds[1] = {}
    Funds[1].FundId = self.ShopItemData.PriceType
    Funds[1].FundNeed = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
    local CommonDialog = UIManager(self):ShowCommonPopupUI(CommonPopupUIID, {
      ShopItemData = self.ShopItemData,
      ShopType = 0,
      Funds = Funds,
      ShowParentTabCoin = true,
      LeftCallbackObj = self,
      LeftCallbackFunction = function(Obj, PackageData)
        local Shop = UIManager(self):GetUIObj("ShopMain")
        if Shop then
          Shop:SetFocus()
        end
      end,
      RightCallbackObj = self,
      RightCallbackFunction = function(Obj, PackageData)
        PackageData.Content_1.CallFunc(PackageData.Content_1.CallObj)
      end,
      ForbiddenRightCallbackObj = self,
      ForbiddenRightCallbackFunction = function(Obj, PackageData)
        PackageData.Content_1.CallFunc(PackageData.Content_1.CallObj)
      end,
      DontFocusParentWidget = true,
      CloseBtnCallbackObj = self,
      CloseBtnCallbackFunction = function(Obj, PackageData)
        local Shop = UIManager(self):GetUIObj("ShopMain")
        if Shop then
          Shop:SetFocus()
        end
      end,
      ForbidRightBtn = not ShopUtils:CanPurchase(self.ShopItemData, Funds[1].FundId, Funds[1].FundNeed)
    }, UIManager(self):GetUIObj("ShopMain"))
  end
end

function M:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.Item_Shop:StopAllAnimations()
  self.Item_Shop:PlayAnimation(self.Item_Shop.Hover)
end

function M:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.Item_Shop:StopAllAnimations()
  self.Item_Shop:PlayAnimation(self.Item_Shop.Normal)
end

function M:OnBtnPressed()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.StartPressTime = os.clock()
  self.Item_Shop:PlayAnimation(self.Item_Shop.Press)
  local ShopTabConf = DataMgr.ShopTabSub[self.ShopItemData.SubTabId]
  local NodeName = ShopTabConf and ShopTabConf.ReddotNode
  if NodeName and not self.IsFree and not self.bNewShopItem and ReddotManager.DecreaseLeafNodeCount(ShopTabConf.ReddotNode, 1, {
    ShopItemId = self.ShopId
  }) then
    self:EMShowReddot(false, EReddotType.New, 0)
  end
end

function M:OnBtnReleased()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.PressedTime = os.clock() - self.StartPressTime or os.clock()
  if self.PressedTime > 0.2 then
    self.IsLongPress = true
    self.Item_Shop:PlayAnimation(self.Item_Shop.Normal)
  end
end

function M:OnBtnClicked()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if not self.IsLongPress then
    self.Item_Shop:PlayAnimation(self.Item_Shop.Click)
    self:ShowItemDetail()
  end
  self.IsLongPress = false
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return M
