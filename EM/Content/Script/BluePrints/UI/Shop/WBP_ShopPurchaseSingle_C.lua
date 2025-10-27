require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self.TypeSort = {
    self.SubItem01.Com_Item_1,
    self.SubItem02.Com_Item_1,
    self.SubItem02.Com_Item_2,
    self.SubItem03.Com_Item_1,
    self.SubItem03.Com_Item_2,
    self.SubItem03.Com_Item_3
  }
  self.Text_RewardDesc:SetText(GText("UI_Reward_Walnut_Preview"))
  self.Text_CanUpgrade:SetText(GText("UI_RougeLike_Blessing_CanUpgrade"))
  self.Text_Exchange:SetText(GText("UI_Shop_ExchangeAmount"))
  self.Text_BuyLeftTitle:SetText(GText("UI_SHOP_SHOPITEMLIMIT"))
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self:AddInputMethodChangedListen()
  self.ShopItemData = setmetatable({}, {
    __index = Params.ShopItemData
  })
  self.ShopType = Params.ShopType
  self.ShopId = Params.ShopId
  self.SingleItemNotInteractive = Params.SingleItemNotInteractive
  self.CurrentCount = 1
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Com_Time_Remainder.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  self.Com_Time_Remainder.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self.Com_Time_Refresh.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  self.Com_Time_Refresh.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self:InitUI(self.ShopType)
  self:AddTimer(0.1, function()
    if self.ShopItemData.ItemType ~= "Walnut" and self.ScrollBox_0:GetScrollOffsetOfEnd() > 0 then
      self:ShowGamepadScrollBtn(true)
    end
    if 6 == self.ShopItemData.PurchaseFailRes then
      self:BroadcastDialogEvent("UpdateDialogTipText", {
        Tips = {
          GText("UI_SHOP_ALREADYOWNED")
        },
        DialogItemIndex = 1,
        bShowTip = true
      })
    else
      self:BroadcastDialogEvent("UpdateDialogTipText", {
        Tips = {
          GText("UI_SHOP_SOLDOUT")
        },
        DialogItemIndex = 1,
        bShowTip = true
      })
    end
  end)
  if not self.ShopItemData.ItemType or self.ShopItemData.ItemType ~= "WeaponSkin" then
    self.OpenTipsButtonIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  end
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
  local Key_RewardDesc_Params = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText
      }
    }
  }
  self.Key_RewardDesc:CreateCommonKey(Key_RewardDesc_Params)
  if self.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
    self.Key_RewardDesc:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Key_RewardDesc:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.bTipsOpen = false
  self.FocusOnSubItem = false
  self:SetGamepadButtonState(false, false, not self.SingleItemNotInteractive)
end

function M:MinusBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdatePricePanel()
end

function M:AddBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdatePricePanel()
end

function M:SliderChangeCallback(Value)
  self.CurrentCount = Value
  self:UpdatePricePanel()
end

function M:InitUI(ShopType)
  self.WS_Item:SetActiveWidgetIndex(ShopType)
  self.WS_BuyDetail:SetActiveWidgetIndex(ShopType)
  self:SetWidgetVisibility(ShopType)
  local ItemName, ItemDesc
  if 0 == ShopType then
    local ItemData = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId]
    if not ItemData then
      return
    end
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = self.ShopItemData.TypeId
    Content.ItemType = self.ShopItemData.ItemType
    Content.Icon = ItemUtils.GetItemIconPath(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
    Content.Rarity = ItemData.Rarity or ItemData[self.ShopItemData.ItemType .. "Rarity"] or 0
    Content.IsShowDetails = true
    Content.UIName = "ShopMain"
    Content.NotInteractive = self.SingleItemNotInteractive
    if self.ShopItemData.ItemType == "Char" then
      Content.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = self.OpenCharDetails,
        Params = {
          self.ShopItemData.TypeId
        }
      }
    end
    self:SetNameRarity(Content.Rarity)
    self.SingleItem:Init(Content)
    local Events = {}
    Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
    self.SingleItem:BindEvents(self, Events)
    ItemName = ItemUtils:GetDropName(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
    if self.ShopItemData.TypeNum and self.ShopItemData.TypeNum > 1 then
      ItemName = ItemName .. " x" .. self.ShopItemData.TypeNum
    end
    self.Group_TimeSpace:SetVisibility(ESlateVisibility.Collapsed)
    self.CutoffData = ShopUtils:GetShopItemCutoffData(self.ShopItemData.ItemId)
    if self.CutoffData and self.CutoffData.CutoffEndTime then
      self.Group_RemainderTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Group_TimeSpace:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:UpdateShopItemCutoffRefreshTime()
      self:AddTimer(1, self.UpdateShopItemCutoffRefreshTime, true, 0, "UpdateShopItemCutoffRefreshTime", true)
    elseif self.ShopItemData.StartTime and self.ShopItemData.EndTime then
      self.Group_RemainderTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Group_TimeSpace:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:UpdateLimitTime()
      self:AddTimer(1, self.UpdateLimitTime, true, 0, "UpdateShopItemEndRefreshTime", true)
    else
      self.Group_RemainderTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:UpdateShopItemRefreshTime(self.ShopItemData.RefreshTime, self.Com_Time_Refresh.Text_TimeDesc)
    ItemDesc = GText(ItemData.Description or ItemData[self.ShopItemData.ItemType .. "Description"] or ItemData[self.ShopItemData.ItemType .. "Describe"] or ItemData.DetailDes or ItemData.Des)
    if self.ShopItemData.ItemType == "Draft" then
      ItemDesc = "UI_DraftDes_General"
      ItemName = ItemUtils:GetDraftName(ItemData.DraftId)
    end
    self.Text_Name:SetText(GText(ItemName))
    if self.ShopItemData.ItemType == "Resource" then
      self.Text_Describe:SetText(GText(ItemData.FunctionDes))
      self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    elseif self.ShopItemData.ItemType == "WeaponSkin" then
      self.Text_Describe:SetText(GText(ItemData.Dec))
      self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.ShopItemData.ItemType == "Mod" then
      self.WS_Info:SetActiveWidgetIndex(1)
      local ModData = DataMgr.Mod[Content.Id]
      self:UpdataModDetails(ModData, 0)
    else
      self.WS_Info:SetActiveWidgetIndex(0)
      for i = 1, 6 do
        local Img_Star = self["Shop_ItemStar_PC_" .. i]
        local Rarity = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId].Rarity or DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId][self.ShopItemData.ItemType .. "Rarity"] or 0
        Img_Star:SetLight(i <= Rarity)
      end
      self.Text_Desc:SetText(GText(ItemDesc))
    end
    self.UnitPrice = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
    self:UpdatePricePanel(true)
    local ShopItemRemainTimes = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
    local TotalPurchaseLimit = self.ShopItemData.PurchaseLimit
    if ShopItemRemainTimes > -1 then
      self.Group_BuyLeftTimes:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Text_BuyLeftTimes:SetText(ShopItemRemainTimes .. "/" .. TotalPurchaseLimit)
    else
      self.Group_BuyLeftTimes:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:BindDialogEvent("UpdatePricePanel", self.UpdateDialogBtn)
    if self.ShopItemData.ItemDes then
      self.Button_Detail:SetVisibility(ESlateVisibility.Visible)
      self.Button_Detail.OnClicked:Add(self, self.OnBtnDetailClick)
    else
      self.Button_Detail:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if self.ShopItemData.ItemType == "Walnut" then
    self.WidgetSwitcher_0:SetActiveWidgetIndex(1)
    local WalnutDataTable = DataMgr.Walnut[self.ShopItemData.TypeId]
    local RewardLst = {}
    for i = 1, 6 do
      local Content
      local RewardId = WalnutDataTable.Id[i]
      local RewardType = WalnutDataTable.Type[i]
      local RewardCount = WalnutDataTable.Count[i][1]
      local RewardDataTable = DataMgr[RewardType]
      if RewardDataTable then
        local RewardConfigData = RewardDataTable[RewardId]
        if RewardConfigData then
          Content = {
            Id = RewardId,
            ItemType = RewardType,
            Icon = ItemUtils.GetItemIconPath(RewardId, RewardType),
            Rarity = ItemUtils.GetItemRarity(RewardId, RewardType),
            Count = RewardCount,
            IsShowDetails = true,
            OnMenuOpenChangedEvents = {
              Obj = self,
              Callback = self.ItemMenuAnchorChanged
            }
          }
          if self.TypeSort[i] then
            self.TypeSort[i]:Init(Content)
          end
          table.insert(RewardLst, Content)
        end
      end
    end
    for Index, ItemUI in pairs(self.TypeSort) do
      if Index + 1 <= #self.TypeSort then
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Right, self.TypeSort[Index + 1])
      end
      if Index - 1 > 0 then
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Left, self.TypeSort[Index - 1])
      end
    end
  else
    self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
  end
  local ConfigData = {
    InitValue = 1,
    MinValue = 1,
    MaxValue = self:GetMaxCount(),
    ClickInterval = 1,
    MinusBtnCallback = self.MinusBtnCallback,
    AddBtnCallback = self.AddBtnCallback,
    SliderChangeCallback = self.SliderChangeCallback,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus"
    },
    OwnerPanel = self,
    PlatformName = "PC",
    EnableMiniBtn = true,
    EnableMaxBtn = true
  }
  if 1 == self.ShopItemData.PurchaseLimit then
    self.VB_BottomInfo:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.VB_BottomInfo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.Com_Slider:Init(ConfigData)
end

function M:OpenCharDetails(CharId)
  local CommonDialog = UIManager(self):GetUI("CommonDialog")
  if CommonDialog then
    if CommonDialog.CloseBtnCallbackFunction then
      local Data = CommonDialog:PackageResult()
      CommonDialog.CloseBtnCallbackFunction(CommonDialog.CloseBtnCallbackObj, Data)
    end
    CommonDialog:Close()
  end
  local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
  ShopMain.SelectShopItemId = self.ShopItemData.ItemId
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {CharId},
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    OnCloseDelegate = {
      ShopMain,
      ShopMain.ShowItemDetail
    }
  })
end

function M:SetNameRarity(Rarity)
  local FontMaterial = self.Text_Name:GetDynamicFontMaterial()
  if 6 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_6)
  elseif 5 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_5)
  elseif 4 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_4)
  elseif 3 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_3)
  elseif 2 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_2)
  elseif 1 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_1)
  else
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_0)
  end
end

function M:SetWidgetVisibility(ShopType)
  if 0 == ShopType then
    self.Group_Slider:SetVisibility(UE4.ESlateVisibility.Visible)
  elseif 1 == ShopType then
    self.Group_Slider:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
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

function M:GetMaxCount()
  local Avatar = GWorld:GetAvatar()
  local CoinCount = Avatar.Resources[self.ShopItemData.PriceType] and Avatar.Resources[self.ShopItemData.PriceType].Count or 0
  local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  if 0 == self.UnitPrice then
    return PurchaseLimit
  end
  if PurchaseLimit < 0 then
    return math.floor(CoinCount / self.UnitPrice)
  end
  local MaxCount = math.min(math.floor(CoinCount / self.UnitPrice), PurchaseLimit)
  return MaxCount
end

function M:UpdateLimitTime()
  if not self.ShopItemData.EndTime then
    self:RemoveTimer("UpdateShopItemEndRefreshTime")
  end
  local EndTime = self.ShopItemData.EndTime
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
  local EndTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(EndTime)
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
  self.Com_Time_Remainder.Text_TimeDesc:SetText(string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr))
end

function M:UpdateShopItemCutoffRefreshTime()
  local CurrentTime = TimeUtils.NowTime()
  local EndTime = self.CutoffData.CutoffEndTime
  local RemainRefreshTime = EndTime - CurrentTime
  local RemainTimeStr = ShopUtils:GetRefreshTimeStr(RemainRefreshTime)
  self.Com_Time_Remainder.Text_TimeDesc:SetText(RemainTimeStr)
end

function M:UpdateShopItemRefreshTime(RefreshTime)
  if not RefreshTime then
    self.Group_RefreshTime:SetVisibility(ESlateVisibility.Collapsed)
    self.Com_Time_Refresh:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_RefreshTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Com_Time_Refresh:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_TimeSpace:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    ShopUtils:RefreshShopRefreshTime(RefreshTime, self.Com_Time_Refresh.Text_TimeDesc)
    self:AddTimer(1, ShopUtils.RefreshShopRefreshTime, true, 0, "RefreshTimeTimer", true, RefreshTime, self.Com_Time_Refresh.Text_TimeDesc)
  end
end

function M:UpdatePricePanel(bInit)
  local MaxCount = self:GetMaxCount()
  if MaxCount <= 0 then
    self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Num_Max_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Group_Slider:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Split:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Num_Max_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Num_Max_1:SetText(tostring(MaxCount))
  end
  self.Num_Exchange:SetText(tostring(self.CurrentCount))
  local Funds = {}
  Funds[1] = {}
  Funds[1].FundId = self.ShopItemData.PriceType
  Funds[1].FundNeed = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId) * self.CurrentCount
  self:BroadcastDialogEvent("UpdateFunds", {Funds = Funds})
  if not self.ShopItemData.ItemType or self.ShopItemData.ItemType ~= "WeaponSkin" then
    self:BroadcastDialogEvent("UpdatePricePanel")
  end
end

function M:OnSliderValueChanged(Value)
  local MaxCount = self:GetMaxCount()
  self.CurrentCount = math.ceil(Value * (MaxCount - 1) + 1)
  self:UpdatePricePanel()
end

function M:UpdataModDetails(ModDataInfo, ModLevel)
  self.Text_Polarity01:SetText(GText("UI_Tips_Polarity_Cost"))
  if -1 ~= ModDataInfo.Polarity then
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Visible)
    if ModDataInfo.Polarity ~= CommonConst.NonePolarity then
      local PolarityText = ModController:GetModel():GetPolarityText(ModDataInfo.Polarity)
      self.Text_Polarity:SetText(PolarityText)
    end
  else
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Level:SetText("0")
  self.Text_MaxLevel:SetText(ModDataInfo.MaxLevel)
  self.Text_Polarity02:SetText(ModDataInfo.Cost)
  self.VB_PolarityDetail:ClearChildren()
  local ModAttrs = ModDataInfo.AddAttrs
  if ModAttrs then
    for _, ModAttr in ipairs(ModAttrs) do
      local AttrConfig = DataMgr.AttrConfig[ModAttr.AttrName]
      if not AttrConfig then
      else
        local _, ValueStr = ArmoryUtils:GenModAttrData(ModAttr, ModLevel, AttrConfig, ModDataInfo.Id)
        local ModAttrText = GText(AttrConfig.Name) .. ValueStr
        local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
        EffectItem.Text_Effect:SetText(ModAttrText)
        EffectItem.Switch_Type:SetActiveWidgetIndex(0)
        self.VB_PolarityDetail:AddChild(EffectItem)
      end
    end
  end
  if ModDataInfo.PassiveEffectsDesc then
    local ModDescText = ArmoryUtils:GenModPassiveEffectDesc(ModDataInfo, ModLevel)
    local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
    EffectItem.Text_Effect01:SetText(GText("UI_MOD_Effect") .. ModDescText)
    EffectItem.Switch_Type:SetActiveWidgetIndex(1)
    self.VB_PolarityDetail:AddChild(EffectItem)
  end
end

function M:Purchase()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
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
        PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin1].ResourceName))
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
      
      local PopupId
      if self.ShopItemData.PriceType == CommonConst.Coins.Coin1 then
        PopupId = 100137
      elseif self.ShopItemData.PriceType == CommonConst.Coins.Coin4 then
        PopupId = 100263
      end
      if not PopupId then
        return
      end
      local Params = {}
      Params.LeftCallbackObj = self
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = JumpToShop
      self.PopupUI = UIManager(self):ShowCommonPopupUI(PopupId, Params, self)
    end
    return
  end
  ShopUtils:SendPurchaseRequest(self.ShopItemData.ItemId, self.CurrentCount)
end

function M:OpenExchangeDialog()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:TransformCoin4ToCoin1()
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if ShopMain then
      ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap)
      ShopMain:SetFocus()
    end
    self:Close()
  end
end

function M:SetSliderState(enabled)
  self.Com_Slider:SetEnabled(enabled)
  self.Com_Slider:ForbidMinOperation(not enabled)
  self.Com_Slider:ForbidAddOperation(not enabled)
end

function M:UpdateUIElementsVisibility(isSubItemFocused, isTipsOpen)
  local shouldShowScrollBtn = not isSubItemFocused and not isTipsOpen and self.ShopItemData.ItemType ~= "Walnut" and self.ScrollBox_0:GetScrollOffsetOfEnd() > 0
  self:ShowGamepadScrollBtn(shouldShowScrollBtn)
  local keyRewardVisibility = ESlateVisibility.Collapsed
  local keyBtnDetailVisibility = ESlateVisibility.Collapsed
  if not isTipsOpen and not isSubItemFocused then
    keyRewardVisibility = ESlateVisibility.SelfHitTestInvisible
  end
  self.Key_RewardDesc:SetVisibility(keyRewardVisibility)
  self.Key_BtnDetail:SetVisibility(keyBtnDetailVisibility)
end

function M:SetGamepadButtonState(showA, showB, showTips)
  if showB then
    self:ShowGamepadShortcut(self.ButtonIndexB)
  else
    self:HideGamepadShortcut(self.ButtonIndexB)
  end
  if showA then
    self:ShowGamepadShortcut(self.ButtonIndexA)
  else
    self:HideGamepadShortcut(self.ButtonIndexA)
  end
  if showTips then
    self:ShowGamepadShortcut(self.OpenTipsButtonIndex)
  else
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
  end
end

function M:UpdateUIByCurrentState()
  local isFocusOnSubItem = self.FocusOnSubItem
  local isTipsOpen = self.bTipsOpen
  self:SetSliderState(not isFocusOnSubItem and not isTipsOpen)
  self:SetGamepadBtnKeyVisibility(not isFocusOnSubItem and not isTipsOpen)
  if isTipsOpen then
    self:SetGamepadButtonState(false, false, false)
  elseif isFocusOnSubItem then
    self:SetGamepadButtonState(true, true, false)
  else
    self:SetGamepadButtonState(false, false, not self.SingleItemNotInteractive)
  end
  self:UpdateUIElementsVisibility(isFocusOnSubItem, isTipsOpen)
  if not isFocusOnSubItem and not isTipsOpen then
    self:UpdatePricePanel()
  end
end

function M:ItemMenuAnchorChanged(bIsOpen)
  local wasOpen = self.bTipsOpen
  self.bTipsOpen = bIsOpen
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if wasOpen and not bIsOpen and not self.FocusOnSubItem then
    self.Owner:SetFocus()
  end
  self:UpdateUIByCurrentState()
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

function M:OnContentKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadUp(InKeyName)
  end
  return IsEventHandled
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    if self.ShopItemData.ItemType ~= "WeaponSkin" and not self.SingleItemNotInteractive then
      self.SingleItem:OpenItemMenu()
    end
  elseif self.ShopItemData.ItemType == "Walnut" and InKeyName == UIConst.GamePadKey.SpecialLeft then
    self.TypeSort[1]:SetFocus()
    self.FocusOnSubItem = true
    self:UpdateUIByCurrentState()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.FocusOnSubItem then
    self.FocusOnSubItem = false
    self.Owner:SetFocus()
    self:UpdateUIByCurrentState()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnGamePadUp(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  return IsEventHandled
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.ScrollBox_0:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.ScrollBox_0:GetScrollOffsetOfEnd())
    self.ScrollBox_0:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:UpdateDialogBtn()
  self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(not ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, self.CurrentCount * ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)))
end

function M:PackageData()
  return {
    CallObj = self,
    CallFunc = self.Purchase,
    CallFuncRougeShop = self.RougePurchase
  }
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == UE4.ECommonInputType.Gamepad then
    self:UpdateUIByCurrentState()
  else
    if not self.bTipsOpen then
      self.Owner:SetFocus()
      self.FocusOnSubItem = false
    end
    self.Key_RewardDesc:SetVisibility(ESlateVisibility.Collapsed)
    self:UpdateUIElementsVisibility(false, self.bTipsOpen)
  end
end

return M
