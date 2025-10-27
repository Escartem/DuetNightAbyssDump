require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Reward:SetText(GText("UI_BattlePass_QuestRewardClaim"))
  self.Btn_Reward:SetDefaultGamePadImg("A")
  self.Btn_Goto:SetText(GText("UI_BattlePass_QuestJump"))
  self.Btn_Goto:SetDefaultGamePadImg("A")
  self.Btn_Goto:OverrideGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_UnFinish:SetText(GText("UI_BattlePass_QuestToBeFinish"))
  
  local function EmptyFunction()
  end
  
  self.Btn_Reward:TryOverrideSoundFunc(EmptyFunction)
  self.Btn_Reward:BindEventOnClicked(self, self.OnBtnRewardClicked)
  self.Btn_Goto:TryOverrideSoundFunc(EmptyFunction)
  self.Btn_Goto:BindEventOnClicked(self, self.OnBtnGotoClicked)
  self.Btn_Goto:RefreshIconAndGamePadVisibility()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.Entry = self
  self:Refresh()
  self:PlayAnimation(self.In)
end

function M:OnBtnRewardClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_crystal_btn_content", nil, nil)
  self.Content.Parent:GetMissionReward(self.Content.Type, self.Content.ID)
end

function M:OnBtnGotoClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  local TaskInfo = DataMgr.BattlePassTask[self.Content.ID]
  self.Content.Parent:JumptoOtherUI(TaskInfo.JumpUIId)
end

function M:Refresh()
  if self.Content.IsEmpty then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  local TaskInfo = DataMgr.BattlePassTask[self.Content.ID]
  self.Text_Mission:SetText(GText(TaskInfo.BattlePassTaskDes))
  self.Num_Now:SetText(self.Content.Progress)
  self.Num_Total:SetText(self.Content.Target)
  if self.Content.TaskEndTime then
    self.Panel_Time:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:TryRefreshTime()
  else
    self.Panel_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.WB_Item:ClearChildren()
  for _, RewardId in pairs(TaskInfo.QuestReward) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        local Content = {}
        Content.IsShowDetails = true
        Content.Id = ItemId
        Content.UnitId = ItemId
        Content.Count = RewardUtils:GetCount(RewardCount[i])
        Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        Content.HandleMouseDown = true
        Content.Parent = self
        local Widget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
        self.WB_Item:AddChild(Widget)
        Widget:Init(Content)
      end
    end
  end
  if self.Content.RewardsGot then
    self:PlayAnimation(self.Finished)
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(3)
  else
    self:PlayAnimation(self.Normal)
    if self.Content.Target > self.Content.Progress then
      if TaskInfo.JumpUIId then
        self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
      else
        self.WidgetSwitcher_Btn:SetActiveWidgetIndex(2)
      end
    else
      self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
    end
  end
end

function M:ClickMissionList()
  local Index = self.WidgetSwitcher_Btn:GetActiveWidgetIndex()
  if 0 == Index then
    self:OnBtnRewardClicked()
  elseif 1 == Index then
    self:OnBtnGotoClicked()
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function M:InitGamepadView()
  self.Gamepad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:InitKeyboardView()
  self.Gamepad:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitWidgetInfoInGamePad()
  self.Key_Check_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      IsEventHandled = true
      self.Content.Parent:TryEnterSelectMode(self)
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self.Content.Parent:TryLeaveSelectMode(self)
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:EnterSelectMode()
  self:UpdateUIStyle(false)
  local Reward = self.WB_Item:GetChildAt(0)
  Reward:SetFocus()
end

function M:LeaveSelectMode()
  self:UpdateUIStyle(true)
  self:SetFocus()
end

function M:BP_GetDesiredFocusTarget()
  self.Content.Parent:TryChangeCurFocusedMissionList(self)
  self:BeginHover()
  if self.Content.Parent.InSelectMode then
    local Reward = self.WB_Item:GetChildAt(0)
    self:UpdateUIStyle(false)
    return Reward
  else
    return self
  end
end

function M:BeginHover()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:PlayAnimation(self.Gamepad_Hover)
    self:UpdateUIStyle(true)
  end
end

function M:StopHover(InSwitch)
  if InSwitch or UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:PlayAnimationReverse(self.Gamepad_Hover)
    self:UpdateUIStyle(false)
  end
end

function M:UpdateUIStyle(IsVisible)
  if IsVisible then
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Goto:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Goto:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:TryRefreshTime()
  if self.Content.TaskEndTime then
    local RemainTimeDictTask = UIUtils.GetLeftTimeStrStyle2(self.Content.TaskEndTime)
    self.Com_Time:SetTimeText(GText("UI_BattlePass_RemainTime"), RemainTimeDictTask)
  end
end

return M
