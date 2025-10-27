require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self:AddInputMethodChangedListen()
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.ShopItemData = Params.ShopItemData
  self.Shop_Item_PC:InitShopItem(self.ShopItemData.ItemId)
  self.Shop_Item_PC.Lock:SetVisibility(ESlateVisibility.Collapsed)
  if DataMgr.ShopTabSub[self.ShopItemData.SubTabId].TabType == "Pack" then
    self.Shop_Item_PC.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  end
  if DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId] then
    self.Shop_Item_PC.WS_PriceSign:SetActiveWidgetIndex(1)
  else
    self.Shop_Item_PC.WS_PriceSign:SetActiveWidgetIndex(0)
  end
  if self.ShopItemData.StartTime and self.ShopItemData.EndTime then
    self.Group_Time:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_TimeSpace:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:UpdateLimitTime()
    self:AddTimer(1, self.UpdateLimitTime, true, 0, "UpdateShopItemEndRefreshTime", true)
  else
    self.Group_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_TimeSpace:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Name:SetText(GText("UI_Shop_Contain"))
  local ItemData = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId]
  self.WrapBox_Content:ClearChildren()
  local Rewards = DataMgr.Reward[ItemData.RewardId]
  if Rewards then
    self.RewardList = {}
    local RewardIds = Rewards.Id
    local RewardCounts = Rewards.Count
    local RewardTypes = Rewards.Type
    for i = 1, #RewardIds do
      local ItemId = RewardIds[i]
      local Count = RewardUtils:GetCount(RewardCounts[i])
      local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
      local ItemType = RewardTypes[i]
      local RewardContent = {
        Id = ItemId,
        Type = ItemType,
        ItemCount = Count,
        Icon = Icon,
        Rarity = Rarity
      }
      table.insert(self.RewardList, RewardContent)
    end
    local ItemList = {}
    for ItemId, ItemInfo in pairs(self.RewardList) do
      local Item = self:CreateWidgetNew("ShopPackageCell")
      Item.Parent = self
      self.WrapBox_Content:AddChild(Item)
      local Events = {}
      Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
      Item.Package_Item:BindEvents(self, Events)
      Item:Init(ItemInfo.Type, ItemInfo.Id, ItemInfo.ItemCount)
      table.insert(ItemList, Item)
    end
    for Index, ItemUI in pairs(ItemList) do
      if 1 == Index % 2 then
        if Index + 1 <= #ItemList then
          ItemUI:SetNavigationRuleExplicit(EUINavigation.Right, ItemList[Index + 1])
        end
      elseif Index - 1 > 0 then
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Left, ItemList[Index - 1])
      end
      if Index - 2 > 0 then
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Up, ItemList[Index - 2])
      end
      if Index + 2 <= #ItemList then
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Down, ItemList[Index + 2])
      end
    end
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  if PurchaseLimit > -1 then
    self.Group_BuyLeftTimes:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_BuyLeftTitle:SetText(GText("UI_Shop_Remain"))
    self.Text_BuyLeftTimes:SetText(PurchaseLimit)
  else
    self.Group_BuyLeftTimes:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:AddTimer(0.1, function()
    if self.ScrollBox_Package:GetScrollOffsetOfEnd() > 0 then
      self:ShowGamepadScrollBtn(true)
    end
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
  end)
  self.OpenTipsButtonIndex = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.ButtonIndexB = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.ButtonIndexA = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.Group_BuyLeftTimes:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_BuyLeftSpace:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Time:SetVisibility(ESlateVisibility.Collapsed)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if self.ShopItemData.ItemDes then
    self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnDescOpenChanged)
    self.Group_BtnDetail:SetVisibility(ESlateVisibility.Visible)
    self.Button_Detail.OnClicked:Add(self, self.OnBtnDetailClick)
  else
    self.Group_BtnDetail:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnDescOpenChanged(bOpen)
  self.bIsOpen = bOpen
  local CurMode = UIUtils.UtilsGetCurrentInputType()
  if CurMode ~= ECommonInputType.Gamepad then
    return
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:RefreshDialogButton()
end

function M:UpdateLimitTime()
  if not self.ShopItemData.EndTime then
    self:RemoveTimer("UpdateShopItemEndRefreshTime")
  end
  if TimeUtils.NowTime() >= self.ShopItemData.EndTime then
    self:CleanTimer()
    self.Group_Time:SetVisibility(ESlateVisibility.Collapsed)
    local ConfirmPanel = UIManager(self):ShowCommonPopupUI(100016, {
      RightCallbackObj = self,
      RightCallbackFunction = function(Obj, PackageData)
        self:Close()
      end
    }, self)
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
  self.Text_Time:SetText(string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr))
end

function M:Purchase()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
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
      local TrackInfo = {}
      TrackInfo.product_id = DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId]
      if self.ShopItemData.ItemId then
        TrackInfo.item_id = self.ShopItemData.ItemId
        TrackInfo.product_type = DataMgr.ShopItem[self.ShopItemData.ItemId].ItemType
      end
      TrackInfo.game_order_id = OrderId
      TrackInfo.order_create_time = TimeUtils.NowTime()
      HeroUSDKSubsystem(self):UploadTrackLog_Lua("charge_client", TrackInfo)
    end)
    return
  end
  if 0 ~= self.ShopItemData.PurchaseFailRes then
    if 1 == self.ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    elseif 2 == self.ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[self.ShopItemData.PriceType].ResourceName)), 1.0)
    elseif 3 == self.ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), self.ShopItemData.UnlockLevel), 1.0)
    elseif 6 == self.ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1.0, "CommonToastMain")
    elseif 4 == self.ShopItemData.PurchaseFailRes then
      local PopUpId = 100136
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      local ItemName = ItemUtils:GetDropName(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
      local PriceCount = Avatar.Resources[self.ShopItemData.PriceType] and Avatar.Resources[self.ShopItemData.PriceType].Count or 0
      local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
      if string.find(PopoverText, "&ResourceName&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName1&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName2&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ItemName))
      end
      if string.find(PopoverText, "&Num1&") then
        PopoverText = string.gsub(PopoverText, "&Num1&", self.CurrentCount * self.UnitPrice - PriceCount)
      end
      if string.find(PopoverText, "&Num2&") then
        PopoverText = string.gsub(PopoverText, "&Num2&", self.CurrentCount)
      end
      
      local function Confirm()
        local Coin4Count = 0
        if Avatar.Resources[CommonConst.Coins.Coin4] then
          Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4].Count
        end
        if Coin4Count < self.CurrentCount * self.UnitPrice - PriceCount then
          local function JumpToShop()
            PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
          end
          
          local Params = {}
          Params.LeftCallbackObj = self
          Params.RightCallbackObj = self
          Params.RightCallbackFunction = JumpToShop
          self.PopupUI = UIManager(self):ShowCommonPopupUI(100137, Params, self)
        else
          ShopUtils:SendExchangeRequest(self.ShopItemData.ItemId, self.CurrentCount)
        end
      end
      
      local ItemList = {}
      local Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4] and Avatar.Resources[CommonConst.Coins.Coin4].Count or 0
      table.insert(ItemList, {
        ItemId = CommonConst.Coins.Coin4,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Coin4Count,
        ItemNeed = self.CurrentCount * self.UnitPrice - PriceCount
      })
      local Params = {
        RightCallbackFunction = Confirm,
        ItemList = ItemList,
        ShortText = PopoverText
      }
      self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
    elseif 5 == self.ShopItemData.PurchaseFailRes then
      local function JumpToShop()
        PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
      end
      
      local Params = {}
      Params.LeftCallbackObj = self
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = JumpToShop
      self.PopupUI = UIManager(self):ShowCommonPopupUI(100137, Params, self)
    end
    return
  end
  local ShopMain = UIManager(self):GetUIObj("ShopMain")
  ShopMain:BlockAllUIInput(true)
  Avatar:PurchaseShopItem(self.ShopItemData.ItemId, 1)
end

function M:OnBtnDetailClick()
  local Content = {}
  Content.ItemType = "Tips"
  Content.Type = self.ShopItemData.ItemType
  Content.ItemId = self.ShopItemData.TypeId
  Content.Tips = self.ShopItemData.ItemDes
  Content.MenuPlacement = 7
  self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
end

function M:UpdateDialogBtn()
  self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(not ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, self.CurrentCount * ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)))
end

function M:PackageData()
  return {
    CallObj = self,
    CallFunc = self.Purchase
  }
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
  end
  return IsEventHandled
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    local Item = self.WrapBox_Content:GetChildAt(0)
    Item:SetFocus()
    self.FocusOnSubItem = true
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.FocusOnSubItem then
      IsEventHandled = true
      self.FocusOnSubItem = false
      self.Owner:SetFocus()
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft and not self.FocusOnSubItem then
    self:OnBtnDetailClick()
  end
  self:RefreshDialogButton()
  return IsEventHandled
end

function M:RefreshDialogButton()
  if self.FocusOnSubItem then
    self:ShowGamepadShortcut(self.ButtonIndexA)
    self:ShowGamepadShortcut(self.ButtonIndexB)
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self:SetGamepadBtnKeyVisibility(false)
    self.Key_BtnDetail:SetVisibility(ESlateVisibility.Collapsed)
  elseif self.bIsOpen then
    self:SetGamepadBtnKeyVisibility(false)
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
    if self.ShopItemData.ItemDes then
      self.Key_BtnDetail:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
    if self.ShopItemData.ItemDes then
      self.Key_BtnDetail:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:ShowGamepadShortcut(self.OpenTipsButtonIndex)
    if self.ScrollBox_Package:GetScrollOffsetOfEnd() > 0 then
      self:ShowGamepadScrollBtn(true)
    end
    self:SetGamepadBtnKeyVisibility(true)
  end
end

function M:ItemMenuAnchorChanged(bIsOpen)
  self.bTipsOpen = bIsOpen
  local CurMode = UIUtils.UtilsGetCurrentInputType()
  if CurMode ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self:SetGamepadBtnKeyVisibility(false)
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self:ShowGamepadScrollBtn(false)
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
  else
    self:RefreshDialogButton()
  end
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.ScrollBox_Package:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.ScrollBox_Package:GetScrollOffsetOfEnd())
    self.ScrollBox_Package:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad then
    if self.ShopItemData.ItemDes then
      self.Key_BtnDetail:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_BtnDetail:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText
          }
        }
      })
    end
  else
    self.Key_BtnDetail:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
