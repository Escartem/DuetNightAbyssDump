local BattlePassUtils = require("BluePrints.UI.WBP.BattlePass.BattlePassUtils")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local STATE_GAMEPAD_FOCUS = {
  FOCUS_DIALOG = 1,
  FOCUS_REWARD = 2,
  FOCUS_CURRENCY = 3,
  FOCUS_CURRENCY_TAB = 4
}

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:InitContent")
  self.PackageKey = "BattlePass"
  self:InitLevelSlider(Params.MinLevel, Params.MaxLevel)
  self.OKCallback = Params.RightCallbackFunction
  self.OKCallbackObj = Params.RightCallbackObj
  self.CurrencyGamepadKey = Params.CurrencyGamepadKey
  self:InitGamepadView()
  self.bIsFocusable = true
  self:BindDialogEvent(DialogEvent.OnCurrencyItemSelected, self.Focus2CurrencyItem)
end

function M:InitGamepadView()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitLevelSlider(MinLevel, MaxLevel)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:InitLevelSlider", MinLevel, MaxLevel)
  self.MinLevel = MinLevel
  self.MaxLevel = MaxLevel
  self.Com_Slider:Init({
    MinValue = MinLevel,
    MaxValue = MaxLevel,
    OwnerPanel = self,
    MinusBtnCallback = self.OnMinusNumClicked,
    AddBtnCallback = self.OnAddNumClicked,
    SliderChangeCallback = self.OnNumChanged,
    EnableMiniBtn = true,
    EnableMaxBtn = true,
    bForbidPressAccelerate = true
  })
  self:OnNumChanged(MinLevel)
end

function M:OnMinusNumClicked(CurrentCount)
  self:OnNumChanged(CurrentCount)
end

function M:OnAddNumClicked(CurrentCount)
  self:OnNumChanged(CurrentCount)
end

function M:OnNumChanged(Value)
  if Value > self.MaxLevel or Value < self.MinLevel then
    DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:OnNumChanged", Value, self.CurrentCount, debug.traceback())
    return
  end
  if Value ~= self.CurrentCount then
    self.CurrentCount = Value
    self:RefreshRewardList()
    self:RefreshCurrency()
    self:RefreshBtnState()
  end
end

function M:RefreshRewardList()
  self.Avatar = GWorld:GetAvatar()
  if self.Avatar then
    local SelectedLevel = self.CurrentCount
    local AvatarLevel = self.Avatar.BattlePassLevel
    local TargetLevel = AvatarLevel + SelectedLevel
    DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:RefreshRewardList", AvatarLevel, SelectedLevel)
    self:SetRewardList(AvatarLevel + 1, TargetLevel)
    self.Text_Title:SetText(string.format(GText("UI_BATTLEPASS_PURCHASE_DIALOG_LABEL"), TargetLevel))
    self.Text_Purchase:SetText(GText("UI_BattlePass_BuyLevel"))
    self.Num_Purchase:SetText(tostring(SelectedLevel))
  end
end

function M:SetRewardList(StartLevel, EndLevel)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:GetRewardList", StartLevel, EndLevel)
  local NowVersion = self.Avatar.BattlePassVersion
  local BattlePassRewardData = BattlePassUtils:GetBattlePassReward(NowVersion)
  local Rewards = {}
  for Level = StartLevel, EndLevel do
    if BattlePassRewardData and BattlePassRewardData[Level] then
      local RewardInfo = BattlePassRewardData[Level]
      table.insert(Rewards, RewardInfo.Rank1Reward)
      if self.Avatar.BattlePassUnlockRank2 then
        table.insert(Rewards, RewardInfo.Rank2Reward)
      end
    else
      DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:GetRewardList", Level)
    end
  end
  self.List_Reward:ClearListItems()
  local RewardItemList = {}
  local ItemId2Content = {}
  for _, RewardId in pairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        if nil == ItemId2Content[ItemId] then
          table.insert(RewardItemList, ItemId)
          local Content = NewObject(UIUtils.GetCommonItemContentClass())
          Content.UIName = "BattlePassPurchaseDialog"
          Content.IsShowDetails = true
          Content.Id = ItemId
          Content.Count = RewardUtils:GetCount(RewardCount[i])
          Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
          Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          Content.ItemType = TableName[i]
          Content.Parent = self
          Content.bHasGot = false
          ItemId2Content[ItemId] = Content
        else
          local Content = ItemId2Content[ItemId]
          Content.Count = Content.Count + RewardUtils:GetCount(RewardCount[i])
        end
      end
    end
  end
  table.sort(RewardItemList, function(ItemId1, ItemId2)
    local ItemContent1 = ItemId2Content[ItemId1]
    local ItemContent2 = ItemId2Content[ItemId2]
    local Rarity1 = ItemContent1.Rarity
    local Rarity2 = ItemContent2.Rarity
    if Rarity1 == Rarity2 then
      return ItemId1 < ItemId2
    else
      return Rarity1 > Rarity2
    end
  end)
  for _, ItemId in ipairs(RewardItemList) do
    local Content = ItemId2Content[ItemId]
    if Content then
      Content.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.ItemMenuAnchorChanged
      }
      self.List_Reward:AddItem(Content)
    end
  end
end

function M:PackageData()
  local PackageResult = {}
  PackageResult.Level = self.CurrentCount or 1
  return PackageResult
end

function M:RefreshCurrency()
  local CurrentCount = self.CurrentCount or 1
  local Params = {
    Funds = {
      {
        FundId = DataMgr.GlobalConstant.BattlePassBuyLvMoney.ConstantValue,
        FundNeed = DataMgr.GlobalConstant.BattlePassBuyLvPrice.ConstantValue * CurrentCount
      }
    },
    CurrencyGamepadKey = self.CurrencyGamepadKey
  }
  self:BroadcastDialogEvent("UpdateFunds", Params)
end

function M:RefreshBtnState()
  local FundId = DataMgr.GlobalConstant.BattlePassBuyLvMoney.ConstantValue
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Resource = Avatar.Resources[FundId] or {Count = 0}
  local AvatarCount = Resource.Count
  local NeedCount = DataMgr.GlobalConstant.BattlePassBuyLvPrice.ConstantValue * (self.CurrentCount or 1)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:RefreshBtnState", AvatarCount, NeedCount)
  if AvatarCount < NeedCount then
  else
    self.Owner:ForbidRightBtn(false)
  end
  self.bCanBuy = AvatarCount >= NeedCount
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Touch then
    self.List_Reward:SetVisibility(ESlateVisibility.Visible)
    self.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    self.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshGamepadShortCut(false)
    self.List_Reward:SetVisibility(ESlateVisibility.Visible)
  else
    self.UsingGamepad = true
    self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_DIALOG)
    self.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      },
      Desc = GText("UI_Controller_CheckReward")
    })
    self.Key_GamePad:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:OnKeyDown", MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return self.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:OnContentKeyDown", InKeyName)
  local IsEventHandled
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return true
  end
  if InKeyName == Const.GamepadLeftThumbstick then
    IsEventHandled = false
  elseif InKeyName == Const.GamepadRightThumbstick then
    self:Focus2CurrencyTab()
    self.Super.OnContentKeyDown(self, MyGeometry, InKeyEvent)
    IsEventHandled = false
  elseif InKeyName == Const.GamepadFaceButtonRight then
    IsEventHandled = self:HandleCancel()
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
  if IsEventHandled then
    return true
  end
  return IsEventHandled
end

function M:OnGamePadDown(InKeyName)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:OnGamePadDown", InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  if not IsEventHandled then
    if InKeyName == Const.GamepadLeftThumbstick then
      IsEventHandled = false
    elseif InKeyName == Const.GamepadFaceButtonLeft then
      self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_REWARD)
      IsEventHandled = true
    elseif InKeyName == Const.GamepadFaceButtonRight then
    elseif InKeyName == Const.GamepadFaceButtonDown then
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

function M:OnGamePadUp(InKeyName)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:OnGamePadUp", InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  if InKeyName == Const.GamepadFaceButtonRight then
    if self.TipsOpening then
      self.List_Reward:SetFocus()
      self.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
      IsEventHandled = false
    else
      IsEventHandled = self:HandleCancel()
    end
  elseif InKeyName == Const.GamepadFaceButtonDown then
    if self.FocusState == STATE_GAMEPAD_FOCUS.FOCUS_DIALOG and self.bCanBuy then
      self.OKCallback(self.OKCallbackObj, {
        BattlePass = self:PackageData()
      })
      self.Owner:OnCloseBtnClicked()
    end
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:Change2State(State)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:RefreshFocusState", State, debug.traceback())
  self.FocusState = State
  if State == STATE_GAMEPAD_FOCUS.FOCUS_DIALOG then
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self:SetFocus()
    self.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
    self:RefreshGamepadShortCut(false)
    self.Key_GamePad:SetVisibility(ESlateVisibility.HitTestInvisible)
  elseif State == STATE_GAMEPAD_FOCUS.FOCUS_REWARD then
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
    self.List_Reward:SetVisibility(ESlateVisibility.Visible)
    self.List_Reward:SetFocus()
    self:RefreshGamepadShortCut(true)
    self.Key_GamePad:SetVisibility(ESlateVisibility.HitTestInvisible)
  elseif State == STATE_GAMEPAD_FOCUS.FOCUS_CURRENCY_TAB then
    self:RefreshGamepadShortCut(true)
    self.Key_GamePad:SetVisibility(ESlateVisibility.HitTestInvisible)
  elseif State == STATE_GAMEPAD_FOCUS.FOCUS_CURRENCY then
    local Params = {
      bFocus2Currency = true,
      DialogItemIndex = 1,
      CurrencyIndex = 1
    }
    self:BroadcastDialogEvent("Focus2Currency", Params)
    self:RefreshGamepadShortCut(true)
    self.Key_GamePad:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:RefreshGamepadShortCut(bShow)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:RefreshGamepadShortCut", bShow)
  if bShow then
    if not self.RewardShowReturn then
      self.RewardShowReturn = self:ShowGamepadShortcutBtn({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_CTL_Quit")
      })
    end
    if not self.RewardShowDisplay then
      self.RewardShowDisplay = self:ShowGamepadShortcutBtn({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Select")
      })
    end
    self.Owner:ShowGamepadShortcut(self.RewardShowReturn)
    self.Owner:ShowGamepadShortcut(self.RewardShowDisplay)
    self:SetGamepadBtnKeyVisibility(true)
  else
    if self.RewardShowReturn then
      self.Owner:HideGamepadShortcut(self.RewardShowReturn)
    end
    if self.RewardShowDisplay then
      self.Owner:HideGamepadShortcut(self.RewardShowDisplay)
    end
    if self.UsingGamepad then
      self:SetGamepadBtnKeyVisibility(true)
    else
      self:SetGamepadBtnKeyVisibility(false)
    end
  end
end

function M:Focus2CurrencyItem(bFocus)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:Focus2CurrencyItem", bFocus)
  if bFocus then
    self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_CURRENCY)
  else
    self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_DIALOG)
    self:RefreshGamepadShortCut(false)
  end
end

function M:Focus2CurrencyTab()
  self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_CURRENCY_TAB)
end

function M:ItemMenuAnchorChanged(bIsOpen)
  self:AddTimer(0.1, function()
    self.TipsOpening = bIsOpen
  end)
end

function M:HandleDialogFocused()
  return self
end

function M:HandleCancel()
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:HandleCancel", self.FocusState)
  if self.FocusState == STATE_GAMEPAD_FOCUS.FOCUS_DIALOG then
  elseif self.FocusState == STATE_GAMEPAD_FOCUS.FOCUS_REWARD then
    if self.TipsOpening then
      return true
    else
      self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_DIALOG)
      return true
    end
  else
    self:Change2State(STATE_GAMEPAD_FOCUS.FOCUS_DIALOG)
    return true
  end
  return false
end

return M
