require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local M = Class("BluePrints.UI.Shop.WBP_Shop_Item_Base_C")
local CommonPopupUIID_Locked = 100103
local CommonPopupUIID_UnLocked = 100112
local GameInputModeTag = "ImpressionShopItem"

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self:InitShopItem(Content.ShopItemData, Content.ShopUI)
end

function M:InitShopItem(ShopItemData, ShopUI)
  self:ResetItem()
  if not ShopItemData then
    self.Com_Item_Shop:Init(self.Content)
    self:InitEmptyItem()
    return
  end
  self.ShopUI = ShopUI
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:SetVisibility(ESlateVisibility.Visible)
  self.ShopItemData = ShopItemData
  self.ImpressionAreaId = ShopItemData.RegionId
  self:InitCommonItem(ShopItemData)
  self:InitCheckData(ShopItemData)
  self:InitItemLock(ShopItemData)
  self:InitItemName(ShopItemData)
  self:InitItemPrice(ShopItemData)
  self:InitGTexts()
  self:InitHardLevel(ShopItemData)
  self:InitCurrency()
  self:InitVisibility()
  self:InitItemNum()
  self:InitSoldOutInfo()
  self:InitColor()
end

function M:InitEmptyItem()
  self.Group_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitCommonItem(ShopItemData)
  local ItemContent = {}
  ItemContent.ShopItemId = ShopItemData.ItemId
  ItemContent.Icon = ItemUtils.GetItemIconPath(ShopItemData.ItemId, ShopItemData.ItemType)
  ItemContent.Rarity = DataMgr[ShopItemData.ItemType][ShopItemData.ItemId].Rarity or DataMgr[ShopItemData.ItemType][ShopItemData.ItemId][ShopItemData.ItemType .. "Rarity"]
  self.Com_Item_Shop:Init(ItemContent)
end

function M:InitColor()
  local Avatar = GWorld:GetAvatar()
  local bEnoughDice = false
  if Avatar then
    bEnoughDice = Avatar:CanImpressionCheck(self.ImpressionAreaId).bCanCheck
  end
  if not bEnoughDice then
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
  else
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  end
end

function M:InitCheckData(ShopItemData)
  for _, ImpressionType in pairs(ImpressionTypes) do
    local CheckInfo = DataMgr.ImpressionCheck[ShopItemData.ImprCheckId]
    local CheckValue = CheckInfo[ImpressionType .. "Check"]
    if CheckValue > 0 then
      self.CheckType = ImpressionType
      self.CheckValue = CheckValue
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      local Impression = Avatar:GetRegionImpression(self.ImpressionAreaId)
      self.PlayerValue = Impression:GetImpressionValueByType(self.CheckType)
    end
  end
end

function M:InitItemName(ShopItemData)
  local ItemName = ""
  if ShopItemData.ItemType == "Draft" then
    ItemName = ItemUtils:GetDraftName(self.ShopItemData.ItemId)
  else
    ItemName = ItemUtils:GetDropName(self.ShopItemData.ItemId, self.ShopItemData.ItemType)
  end
  if ShopItemData.TypeNum and ShopItemData.TypeNum > 1 then
    ItemName = ItemName .. " x" .. ShopItemData.TypeNum
  end
  self.Text_Name:SetText(ItemName)
end

function M:InitItemPrice(ShopItemData)
  self.Text_Undiscounted_Price:SetVisibility(ESlateVisibility.Collapsed)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Error InitItemPrice: Avatar\228\184\141\229\173\152\229\156\168")
  end
  local ImpressionResourceInfo = DataMgr.ImpressionResource[self.ImpressionAreaId]
  self.Text_Price:SetText(ImpressionResourceInfo.Count)
end

function M:InitGTexts()
  self.Text_SoldOut:SetText(GText("UI_SHOP_SOLDOUT"))
  self.Text_HardTitle:SetText(GText("Impression_UI_CheckSuccRate") .. " " .. tostring(0) .. "%")
  self.Text_TypeTitle:SetText(GText("Impression_UI_Check_" .. self.CheckType))
end

function M:InitHardLevel(ShopItemData)
  local Avatar = GWorld:GetAvatar()
  local SuccRate = Avatar:GetSuccRate(self.PlayerValue, self.CheckValue)
  self.Text_HardTitle:SetText(GText("Impression_UI_CheckSuccRate") .. " " .. tostring(SuccRate) .. "%")
  local ImpressionConfigInfo = DataMgr.ImpressionConfig[self.CheckType]
  local IconTexture = LoadObject(ImpressionConfigInfo.StatusCommonIcon)
  self.Image_TypeIcon:SetBrushFromTexture(IconTexture)
  local DifficultyInfo = Avatar:GetDifficultyInfo(SuccRate)
  local DifficultyColor_ImageBG = self:SwitchDifficultyColor(DifficultyInfo.DifficultyId)
  self.Image_LevelBG:SetColorAndOpacity(DifficultyColor_ImageBG)
end

function M:InitCurrency()
  local ResourceData = self:GetSelfResourceData()
  local ResourceId = ResourceData.ResourceId
  self.Img_Currency:SetBrushResourceObject(ItemUtils.GetItemIcon(ResourceId, "Resource"))
end

function M:InitVisibility()
  self.VX_Loop:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:GetImprShopUnlockInfo()
  local ConditionId = self.ShopItemData.UnlockCondition
  local ConditionData = DataMgr.Condition[ConditionId]
  local ImprShopUnlock = ConditionData.ConditionMap.ImprShopUnlock[1]
  local ItemImpressionAreaId = ImprShopUnlock[1]
  local Type = ImprShopUnlock[2]
  local Value = ImprShopUnlock[3]
  return ItemImpressionAreaId, GText(Type), Value
end

function M:GetGTextCheckType(Type)
  if "Any" == Type then
    return GText("UI_ImpressionShop_UnlockCon_Any")
  elseif "All" == Type then
    return GText("UI_ImpressionShop_UnlockCon_All")
  elseif "Benefit" == Type then
    return GText("Impression_Name_Benefit")
  elseif "Morality" == Type then
    return GText("Impression_Name_Morality")
  elseif "Wisdom" == Type then
    return GText("Impression_Name_Wisdom")
  elseif "Empathy" == Type then
    return GText("Impression_Name_Empathy")
  elseif "Chaos" == Type then
    return GText("Impression_Name_Chaos")
  end
end

function M:InitItemLock(ShopItemData)
  local bLocked = not self.ShopUI:IsShopItemUnlocked(self.ShopItemData)
  if bLocked then
    self.Group_HardLevel:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Type:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_TypeTitle:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local ItemImpressionAreaId, Type, Value = self:GetImprShopUnlockInfo()
    local RealType = self:GetGTextCheckType(Type)
    self.Text_Lock:SetText(string.format(GText("UI_ImpressionShop_UnlockCondition_01"), GText(RealType), tonumber(Value)))
  else
    self.Group_HardLevel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Type:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_TypeTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Lock:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ResetItem()
  self.Group_Item:SetVisibility(ESlateVisibility.Visible)
  self.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Item:SetVisibility(ESlateVisibility.Visible)
end

function M:SwitchDifficultyColor(DifficultyId)
  if "Easy" == DifficultyId then
    return self.HardBG_Level01
  elseif "Middle" == DifficultyId then
    return self.HardBG_Level02
  elseif "Hard" == DifficultyId then
    return self.HardBG_Level03
  elseif "Impossible" == DifficultyId then
    return self.HardBG_Level04
  end
end

function M:InitItemNum()
  if not self.ShopItemData.PurchaseLimit then
    self.Text_Limit:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Text_Limit:SetVisibility(ESlateVisibility.HitTestInvisible)
  local AvailableTime, LimitTime = self.ShopUI:GetShopItemNum(self.ShopItemData)
  self.Text_Limit:SetText(GText("UI_SHOP_SHOPITEMLIMIT") .. AvailableTime .. "/" .. LimitTime)
end

function M:InitSoldOutInfo()
  local bSoldOut = self.ShopUI:IsShopItemSoldOut(self.ShopItemData)
  DebugPrint("WBP_Impression_ShopItem:InitSoldOutInfo", bSoldOut)
  if bSoldOut then
    self.Panel_SoldOut:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Group_HardLevel:SetVisibility(ESlateVisibility.Collapsed)
    self.Button_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:AddParamItemList(Params)
  Params.ItemList = {}
  self.bSingleShopItem = true
  local ItemList = {
    ItemId = self.ShopItemData.ItemId,
    ItemType = self.ShopItemData.ItemType,
    ItemNum = self.ShopItemData.TypeNum
  }
  table.insert(Params.ItemList, ItemList)
end

function M:AddParamFunds(Params)
  local ImpressionResourceInfo = DataMgr.ImpressionResource[self.ShopItemData.RegionId]
  local Funds = {}
  Funds[1] = {}
  Funds[1].FundId = ImpressionResourceInfo.ResourceId
  Funds[1].FundNeed = ImpressionResourceInfo.Count
  Funds[1].CostText = GText("UI_Armory_Trace_Cost")
  Params.Funds = Funds
end

function M:SwitchCommonPopupUIId()
  local bUnlocked = self.ShopUI:IsShopItemUnlocked(self.ShopItemData)
  if bUnlocked then
    return CommonPopupUIID_UnLocked
  else
    return CommonPopupUIID_Locked
  end
end

function M:PlayClickAudio()
  AudioManager(self):PlayItemSound(self, self.ShopItemData.ItemId, "Click", self.ShopItemData.ItemType)
end

function M:ShowItemDetail()
  self:PlayClickAudio()
  local Params = {}
  self:AddParamItemList(Params)
  self:AddParamFunds(Params)
  Params.DontFocusParentWidget = true
  Params.ShowParentTabCoin = true
  Params.OnCloseCallbackFunction = self.OnPopUIEnd
  Params.OnCloseCallbackObj = self
  Params.LeftCallbackFunction = self.OnPurchaseEnd
  Params.LeftCallbackObj = self
  Params.CloseBtnCallbackFunction = self.OnPurchaseEnd
  Params.CloseBtnCallbackObj = self
  Params.ShortTextParams = {
    self:GetGTextCheckType(self.CheckType),
    self.CheckValue
  }
  Params.OnKeyDownCallbackObj = self
  Params.OnKeyDownCallbackFunction = self.OnPopUIKeyDown
  self:SwitchSetPopupUIRightButton(Params)
  local CommonPopupUIID = self:SwitchCommonPopupUIId()
  self.PopupUI = UIManager(self):ShowCommonPopupUI(CommonPopupUIID, Params, self.ShopUI)
  self:InitPopupKeys()
  self:InitListenEvent()
  local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
  if ItemWidget then
    local Item = ItemWidget.Item:GetChildAt(0)
    local Events = {
      OnMenuOpenChanged = self.ItemMenuAnchorChanged
    }
    Item:BindEvents(self, Events)
    if self.bSingleShopItem then
      Item.bIsFocusable = false
      Item.NotInteractive = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
    end
  end
end

function M:SwitchSetPopupUIRightButton(Params)
  local bUnlocked = self.ShopUI:IsShopItemUnlocked(self.ShopItemData)
  local Avatar = GWorld:GetAvatar()
  local bEnoughDice = false
  if Avatar then
    bEnoughDice = Avatar:CanImpressionCheck(self.ImpressionAreaId).bCanCheck
  end
  if bUnlocked then
    Params.Tips = {}
    if bEnoughDice then
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = self.OnPopUIConfirmed
    else
      Params.ForbidRightBtn = true
      Params.DontCloseWhenRightBtnClicked = true
      Params.ForbiddenRightCallbackObj = self
      Params.ForbiddenRightCallbackFunction = self.OnNoneDiceForbiddenPopUIConfirmed
      Params.Tips = {
        GText("Impression_UI_Recheck_03")
      }
    end
  else
    local Tips = DataMgr.CommonPopupUIContext[CommonPopupUIID_Locked].Tip
    if Tips then
      local ItemImpressionAreaId, Type, Value = self:GetImprShopUnlockInfo()
      local RealType = self:GetGTextCheckType(Type)
      Params.Tips = {
        string.format(GText(Tips[1]), GText(RealType), tonumber(Value))
      }
    end
    Params.ForbidRightBtn = true
    Params.DontCloseWhenRightBtnClicked = true
    Params.ForbiddenRightCallbackObj = self
    Params.ForbiddenRightCallbackFunction = self.OnLockedForbiddenPopUIConfirmed
  end
end

function M:OnPopUIConfirmed()
  DebugPrint("WBP_Impression_ShopItem:\231\161\174\232\174\164\232\180\173\228\185\176")
  self:ShowCheckUI()
end

function M:OnLockedForbiddenPopUIConfirmed()
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_ImpressionShop_LockToast"), 1.5)
end

function M:OnNoneDiceForbiddenPopUIConfirmed()
  UIManager(self):ShowUITip("CommonToastMain", GText("Impression_UI_Recheck_03"), 1.5)
end

function M:HandleCheck()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Error: No Avatar\239\188\140\230\151\160\230\179\149\232\191\155\232\161\140\229\141\176\232\177\161\230\163\128\229\174\154")
    self.ImpressionResultUI:Close()
    return
  end
  local ImpressionResourceInfo = DataMgr.ImpressionResource[self.ImpressionAreaId]
  local DiceNum = Avatar:GetResourceNum(ImpressionResourceInfo.ResourceId)
  local ImpressionShopId = self.ShopItemData.ImpressionShopId
  DebugPrint("WBP_Impression_ShopItem:HandleCheck \229\143\145\232\181\183\232\175\183\230\177\130", ImpressionShopId, DiceNum)
  Avatar:PurchaseImpressionShopItem({
    self,
    self.OnReceiveServerPurchaseCallback
  }, tonumber(ImpressionShopId), tonumber(DiceNum))
end

function M:OnReceiveServerPurchaseCallback(Ret, IsCheckSuccess, Rand1, Rand2, PurchaseRewards)
  DebugPrint("WBP_Impression_ShopItem:OnReceiveServerPurchaseCallback", Ret, IsCheckSuccess, Rand1, Rand2, PurchaseRewards)
  if not ErrorCode:Check(Ret) then
    self.ImpressionResultUI:Close()
    return
  end
  if IsCheckSuccess then
    self.ImpressionResultUI:SetOnCloseDelegate({
      self,
      self.OnSelfSold
    })
    self.PurchaseRewards = PurchaseRewards
  end
  self.ImpressionResultUI:OnReceiveImpressionShopRequestResult(Ret, IsCheckSuccess, Rand1, Rand2)
end

function M:OnSelfSold()
  self.ShopUI:OnShopItemSold()
  self:ShowGetItemUI()
end

function M:ShowGetItemUI()
  local PurchaseRewards = self.PurchaseRewards
  local Id = self.ShopItemData.ItemId
  local Type = self.ShopItemData.ItemType
  if "Reward" == Type then
    local RewardData = DataMgr.Reward[Id]
    if RewardData then
      local ItemPageUI = UIManager(GWorld.GameInstance):LoadUINew("GetItemPage", RewardData.Type[1], RewardData.Id[1], RewardData.Count[1][1], PurchaseRewards)
      self:BindItemPageUICloseEvent(ItemPageUI)
    end
  else
    local ItemPageUI = UIManager(GWorld.GameInstance):LoadUINew("GetItemPage", Type, Id, self.ShopItemData.TypeNum)
    self:BindItemPageUICloseEvent(ItemPageUI)
  end
end

function M:BindItemPageUICloseEvent(ItemPageUI)
  if ItemPageUI and ItemPageUI.BindActionOnClosed then
    ItemPageUI:BindActionOnClosed(self.OnPurchaseEnd, self)
  end
end

function M:ShowCheckUI()
  DebugPrint("WBP_Impression_ShopItem: ShowCheckUI")
  self.ShopUI.bCannotResponseEscape = true
  local ImpressionResultUI = self.ShopUI:CreateWidgetNew("ImperssionResult")
  ImpressionResultUI:AddToViewport()
  self.ImpressionResultUI = ImpressionResultUI
  local CheckParams = self:GenerateUICheckParams()
  if not CheckParams then
    self:OnPurchaseEnd()
    return
  end
  DebugPrintTable(CheckParams)
  ImpressionResultUI:ChangeToImpressionShopMode(function()
    self:HandleCheck()
  end, CheckParams)
  ImpressionResultUI:SetOnCloseDelegate({
    self,
    self.OnPurchaseEnd
  })
  ImpressionResultUI:SetOnInterruptedExitDelegate({
    self,
    self.OnPurchaseEnd
  })
end

function M:GenerateUICheckParams()
  DebugPrint("WBP_Impression_ShopItem: GenerateUICheckParams")
  local CheckParams = {
    CheckValue = self.CheckValue,
    ImpressionAreaId = self.ImpressionAreaId,
    PlayerValue = self.PlayerValue,
    CheckType = self.CheckType
  }
  return CheckParams
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitPopupKeys()
  if not self.PopupUI then
    return
  end
  self.OpenTipsButtonIndex = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.ButtonIndexB = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.ButtonIndexA = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.PopupUI:HideGamepadShortcut(self.ButtonIndexA)
  self.PopupUI:HideGamepadShortcut(self.ButtonIndexB)
end

function M:RefreshDialogButton()
  if not self.PopupUI then
    return
  end
  if self.FocusOnSubItem then
    self.PopupUI:ShowGamepadShortcut(self.ButtonIndexA)
    self.PopupUI:ShowGamepadShortcut(self.ButtonIndexB)
    self.PopupUI:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self.PopupUI:SetGamepadBtnKeyVisibility(false)
  else
    self.PopupUI:HideGamepadShortcut(self.ButtonIndexA)
    self.PopupUI:HideGamepadShortcut(self.ButtonIndexB)
    self.PopupUI:ShowGamepadShortcut(self.OpenTipsButtonIndex)
    self.PopupUI:SetGamepadBtnKeyVisibility(true)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if not self.PopupUI then
    return
  end
  local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
  if not ItemWidget or not ItemWidget.Item then
    return
  end
  local Item = ItemWidget.Item:GetChildAt(0)
  if not Item then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad then
    self:RefreshDialogButton()
    if self.bTipsOpen then
      self:ItemMenuAnchorChanged(true)
    elseif self.bSingleShopItem then
      self.PopupUI:SetFocus()
    elseif self.FocusOnSubItem then
      Item:SetFocus()
    end
  end
  if self.bSingleShopItem then
    Item.NotInteractive = CurInputDevice == ECommonInputType.Gamepad
  end
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if not self.PopupUI then
    return
  end
  self.bTipsOpen = bIsOpen
  local CurMode = UIUtils.UtilsGetCurrentInputType()
  if CurMode ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self.PopupUI:SetGamepadBtnKeyVisibility(false)
    self.PopupUI:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self.PopupUI:HideGamepadShortcut(self.ButtonIndexA)
    self.PopupUI:HideGamepadShortcut(self.ButtonIndexB)
  else
    self:RefreshDialogButton()
  end
end

function M:OnPopUIKeyDown(InKeyName)
  if not self.PopupUI then
    return
  end
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    if not self.FocusOnSubItem then
      local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
      if ItemWidget then
        local Item = ItemWidget.Item:GetChildAt(0)
        if self.bSingleShopItem then
          self.FocusOnSubItem = false
          Item:OpenItemMenu()
          Item.Item:PlayAnimation(Item.Item.Click)
          Item.Item.ItemDetails_MenuAnchor:SetLastFocusWidget(self.PopupUI)
        else
          self.FocusOnSubItem = true
          self.PopupUI.DontCloseWhenLeftBtnClicked = true
          Item:SetFocus()
          self:RefreshDialogButton()
        end
      end
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.FocusOnSubItem then
    self.FocusOnSubItem = false
    self:AddTimer(0.1, function()
      self.PopupUI.DontCloseWhenLeftBtnClicked = false
    end, nil, nil, nil, true)
    self:RefreshDialogButton()
  end
end

function M:OnPopUIEnd()
  if self.PopupUI then
    UIManager(GWorld.GameInstance):UnLoadUINew("CommonDialog")
    self.PopupUI = nil
  end
  self:RemoveListenEvent()
end

function M:OnPurchaseEnd()
  self.ShopUI:SetFocus()
  self.ShopUI.bCannotResponseEscape = false
end

function M:CanPurchase(PriceType, Price)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  self.ShopItemData.PurchaseFailRes = 0
  local ShopItemRemainTimes = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  if 0 == ShopItemRemainTimes then
    self.ShopItemData.PurchaseFailRes = 1
    return false
  end
  local PriceCount = Avatar.Resources[PriceType] and Avatar.Resources[PriceType].Count or 0
  if Price > PriceCount then
    self.ShopItemData.PurchaseFailRes = 2
    return false
  end
  return true
end

function M:GetSelfResourceData()
  if self.ResourceData then
    return self.ResourceData
  end
  local Data = DataMgr.ImpressionResource[self.ImpressionAreaId]
  self.ResourceData = Data
  return Data
end

function M:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.Com_Item_Shop:StopAllAnimations()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Hover)
end

function M:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.Com_Item_Shop:StopAllAnimations()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Normal)
end

function M:OnBtnPressed()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.StartPressTime = os.clock()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Press)
end

function M:OnBtnReleased()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.PressedTime = os.clock() - self.StartPressTime or os.clock()
  if self.PressedTime > 0.2 then
    self.IsLongPress = true
    self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Normal)
  end
end

function M:OnBtnClicked()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if not self.IsLongPress then
    self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Click)
    self:ShowItemDetail()
  end
  self.IsLongPress = false
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.UnHover then
    self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Normal)
  end
end

return M
