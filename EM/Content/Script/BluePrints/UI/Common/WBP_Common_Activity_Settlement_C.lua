require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitParams(Params)
  self.Params = Params
  self.Btn_Exit.Button_Area.OnClicked:Add(self, self.OnExitClicked)
  self.Btn_Continue.Button_Area.OnClicked:Add(self, self.OnContinueClicked)
  self:InitUI()
  if Params.IsWin then
    self:PlayAnimation(self.In)
    if self.EventSettlementPage and self.EventSettlementPage.WinSound then
      AudioManager(self):PlayUISound(self, self.EventSettlementPage.WinSound, "ActivitySettlement", nil)
    end
  else
    self:PlayAnimation(self.Fail_In)
    if self.EventSettlementPage and self.EventSettlementPage.FailSound then
      AudioManager(self):PlayUISound(self, self.EventSettlementPage.FailSound, "ActivitySettlement", nil)
    end
  end
  self:AddTimer(0.1, function()
    self:SetFocus()
  end)
  self.RemainTime = 100
  self:AddTimer(1, self.CountDown, true, -1, "ActivitySettlementCountDown")
  self:SetupGamepadControls()
  self:UpdateBottomKeyInfo(false)
end

function M:CountDown()
  local Text = string.format(GText("UI_Text_ExitTime"), self.RemainTime)
  self.Text_ExitTime:SetText(Text)
  if self.RemainTime <= 0 then
    self:OnExitClicked()
    self:RemoveTimer("ActivitySettlementCountDown")
  end
  self.RemainTime = self.RemainTime - 1
end

function M:InitUI()
  local EventSettlementPage = DataMgr.EventSettlementPage[1]
  for Id, ConfigData in pairs(DataMgr.EventSettlementPage) do
    if ConfigData.EventId == self.Params.ActivityId and ConfigData.DungeonId == self.Params.DungeonId then
      EventSettlementPage = ConfigData
    end
  end
  self.EventSettlementPage = EventSettlementPage
  if not EventSettlementPage then
    return
  end
  if EventSettlementPage.DungeonPassTitle then
    if self.Params.Text_TotalScore then
      self.Settlement_Title.Text_TotalScore:SetText(GText(EventSettlementPage.DungeonPassTitle))
    else
      self.Settlement_Title.Text_TotalScore:SetText(GText("UI_SettlementPage_TotalScore"))
    end
  end
  if self then
    self.Num_Score:SetText(self.Params.LevelScore)
    self.Text_NewRecord:SetText(GText("UI_SettlementPage_NewRecord"))
    if self.Params.IsNewRecord then
      self.Text_NewRecord:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.Text_NewRecord:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if self.Text_Title then
    if self.Params.IsWin then
      self.Text_Title:SetText(GText("EventDungeonPass_Title1"))
      if self.Text_Title_1 then
        self.Text_Title_1:SetText(GText("EventDungeonPass_Title1"))
      end
    else
      self.Text_Title:SetText(GText("EventDungeonPass_Title2"))
      if self.Text_Title_1 then
        self.Text_Title_1:SetText(GText("EventDungeonPass_Title2"))
      end
    end
  end
  if self.Params.TitleColor and self.Text_Title then
    self.Text_Title:SetColorAndOpacity(self.Params.TitleColor)
  end
  if self.Params.ScoreLineColor and self.Line then
    self.Line:SetBrushTintColor(self.Params.ScoreLineColor)
  end
  local RewardWidget = self.Settlement_RewardItem
  if RewardWidget then
    if self.Params.RewardIds then
      RewardWidget:SetVisibility(UE4.ESlateVisibility.Visible)
      for _, rewardId in ipairs(self.Params.RewardIds) do
        local RewardInfo = DataMgr.Reward[rewardId]
        if RewardInfo then
          local Ids = RewardInfo.Id or {}
          local RewardCount = RewardInfo.Count or {}
          local TableName = RewardInfo.Type or {}
          for i = 1, #Ids do
            self.CanFocusList = true
            local ItemId = Ids[i]
            local Count = RewardUtils:GetCount(RewardCount[i])
            local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
            local ItemType = TableName[i]
            local Content = NewObject(UIUtils.GetCommonItemContentClass())
            Content.Count = Count
            Content.Id = ItemId
            Content.Icon = DataMgr[ItemType][ItemId].Icon
            Content.ItemType = ItemType
            Content.Rarity = Rarity
            Content.IsShowDetails = true
            Content.OnMenuOpenChangedEvents = {
              Obj = self,
              Callback = self.ItemMenuAnchorChanged
            }
            RewardWidget.List_Reward:AddItem(Content)
          end
        end
      end
      if RewardWidget.Text_GetReward then
        if self.Params.Text_GetReward and RewardWidget.Text_GetReward then
          RewardWidget.Text_GetReward:SetText(GText(self.Params.Text_GetReward))
        else
          RewardWidget.Text_GetReward:SetText(GText("UI_COMMON_REWARD"))
        end
      end
    else
      RewardWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self:InitScoreInfo(self.Params.ScoreInfo, self.List_ScoreItem)
  if self.Params.Btn_Exit_Text and self.Btn_Exit.Text_Button then
    self.Btn_Exit:SetText(GText(self.Params.Btn_Exit_Text))
  else
    self.Btn_Exit:SetText(GText("UI_CTL_Quit"))
  end
  if self.Params.Btn_Continue_Text and self.Btn_Continue.Text_Button then
    self.Btn_Continue:SetText(GText(self.Params.Btn_Continue_Text))
  else
    self.Btn_Continue:SetText(GText("UI_TEMPLE_RESTART"))
  end
  if self.Params.IsWin then
    if EventSettlementPage.IsShowTitle then
      self.Panel_Title:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.Panel_Title:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if EventSettlementPage.IsShowScore then
      self.VB_Score:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.VB_Score:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if EventSettlementPage.IsShowCondition then
      self.List_ScoreItem:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.List_ScoreItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if EventSettlementPage.IsShowReward then
      self.Settlement_RewardItem:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.Settlement_RewardItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function M:ItemMenuAnchorChanged(IsOpen)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.IsOpenItemMenu = IsOpen
  if IsOpen then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    local BottomKeyInfo = {}
    self.Key_GamePad:UpdateKeyInfo(BottomKeyInfo)
    self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    local RewardWidget = self.Settlement_RewardItem
    if RewardWidget and RewardWidget.List_Reward then
      RewardWidget.List_Reward:SetFocus()
    end
    self:UpdateBottomKeyInfo(true)
  end
end

function M:InitScoreInfo(ScoreInfo, ListWidget)
  if ScoreInfo then
    local IsMobile = ModController:IsMobile()
    ListWidget:ClearListItems()
    for i, item in ipairs(ScoreInfo) do
      local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
      ItemContent.Text = GText(item.text)
      ItemContent.IsFinish = item.isFinish
      ItemContent.IsMobile = IsMobile
      ItemContent.ParentWidget = self
      ItemContent.Idx = i
      ListWidget:AddItem(ItemContent)
    end
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local isHandle = false
  if self.IsFocusList then
    if "Gamepad_FaceButton_Right" == InKeyName then
      if self.IsOpenItemMenu then
        return UE4.UWidgetBlueprintLibrary.UnHandled()
      end
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self.IsFocusList = false
      local RewardWidget = self.Settlement_RewardItem
      if RewardWidget and RewardWidget.Key_GamePad then
        RewardWidget.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
      end
      self.Btn_Exit:SetGamePadVisibility(UE4.ESlateVisibility.Visible)
      self.Btn_Continue:SetGamePadVisibility(UE4.ESlateVisibility.Visible)
      self:UpdateBottomKeyInfo(false)
      isHandle = true
    end
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self:OnExitClicked()
    isHandle = true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self:OnContinueClicked()
    isHandle = true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if not self.CanFocusList then
      return UE4.UWidgetBlueprintLibrary.UnHandled()
    end
    local RewardWidget = self.Settlement_RewardItem
    if RewardWidget and RewardWidget.List_Reward then
      RewardWidget.List_Reward:SetFocus()
    end
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self.IsFocusList = true
    if RewardWidget and RewardWidget.Key_GamePad then
      RewardWidget.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.Btn_Exit:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_Continue:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    self:UpdateBottomKeyInfo(true)
    isHandle = true
  end
  if isHandle then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnExitClicked()
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDungeonSettlement()
  EventManager:AddEvent(EventID.OnExitDungeon, self, self.DefaultExit)
end

function M:DefaultExit()
  EventManager:RemoveEvent(EventID.OnExitDungeon, self)
  if self.Params.IsWin then
    self:PlayAnimation(self.Out)
  else
    self:PlayAnimation(self.Fail_Out)
  end
end

function M:OnContinueClicked()
  if self.Params.ContinueCallback then
    self.Params.ContinueCallback(self)
  end
  if self.Params.IsWin then
    self:PlayAnimation(self.Out)
  else
    self:PlayAnimation(self.Fail_Out)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out or InAnimation == self.Fail_Out then
    self:BlockAllUIInput(false)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self:Close()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("jly    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    if ModController:IsMobile() then
      return
    end
    local RewardWidget = self.Settlement_RewardItem
    if RewardWidget and RewardWidget.Key_GamePad then
      RewardWidget.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.IsFocusList = false
    self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    if self.IsFocusList then
      local RewardWidget = self.Settlement_RewardItem
      if RewardWidget and RewardWidget.List_Reward then
        RewardWidget.List_Reward:SetFocus()
      end
    else
      self:SetFocus()
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local RewardWidget = self.Settlement_RewardItem
    if RewardWidget and RewardWidget.Key_GamePad then
      RewardWidget.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.MaxListScrollOffset then
    self.MaxListScrollOffset = UIUtils.GetMaxScrollOffsetOfListView(self.List_ScoreItem)
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.5
  if math.abs(AddOffset) < 0.01 then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.List_ScoreItem:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.MaxListScrollOffset)
    self.List_ScoreItem:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:UpdateBottomKeyInfo(IsFocusList)
  if not self.Key_GamePad then
    return
  end
  self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if IsFocusList then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_Tips_Close")
      }
    }
    self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Key_GamePad:UpdateKeyInfo(BottomKeyInfo)
  else
    local BottomKeyInfo = {}
    if CommonUtils.TableLength(self.Params.ScoreInfo) > 3 then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "RV"}
          },
          Desc = GText("UI_CTL_CheckCondition")
        }
      }
      self.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    self.Key_GamePad:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:SetupGamepadControls()
  local RewardWidget = self.Settlement_RewardItem
  if RewardWidget and RewardWidget.Key_GamePad then
    RewardWidget.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self.IsFocusList = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self.Btn_Exit:SetGamePadImg("B")
  self.Btn_Continue:SetGamePadImg("Y")
end

function M:SequenceEvent_PlayScoreItemAnim()
  self.List_ScoreItem:RequestPlayEntriesAnim()
end

return M
