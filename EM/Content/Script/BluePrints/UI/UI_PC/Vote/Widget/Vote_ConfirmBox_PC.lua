require("UnLua")
local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local M = Class("BluePrints.UI.BP_UIState_C")
for key, value in pairs(Decorator) do
  M[key] = value
end
setmetatable(M, getmetatable(Decorator))

function M:Init(Type, RootPage)
  self.VoteMain = RootPage
  self.bPress = false
  self.bClick = false
  if "Continue" == Type then
    self:InitContinue(Type)
  else
    self:InitLeave(Type)
  end
  self.Type = Type
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CachedDungeonProgressRewards = Avatar:GetCachedDungeonProgressRewards()
  local DefenceWave = self.VoteMain.CurrentWave
  if CachedDungeonProgressRewards[DefenceWave] then
    self:GetAllRewardsList(DefenceWave)
  else
    EventManager:AddEvent(EventID.OnUpdateRewardProgress, self, self.GetAllRewardsList)
  end
end

function M:InitContinue(Type)
  self.IsContinuePanel = true
  self.Text_Title:SetText(GText("UI_Vote_Continue_Expect"))
  self.Text_Bonus:SetText(GText("UI_Vote_Continue_Add"))
  self.Switch_Type:SetActiveWidgetIndex(1)
  self.Switch_Btn:SetActiveWidgetIndex(1)
  self.Switch_Tips:SetActiveWidgetIndex(1)
  self:GetActionPoint()
  self.Cost:InitContent({
    ResourceId = 103,
    bShowNumerator = true,
    bShowDenominator = true,
    Numerator = self.CurrentActionPoint,
    Denominator = self.CostActionPoint,
    CostText = GText("UI_Vote_Finish_Continue")
  })
  self.Cost.Common_Item_Icon:BindEvents(self.VoteMain, {
    OnMenuOpenChanged = self.VoteMain.OnItemMenuOpenChanged
  })
  self.Text_Continue:SetText(GText("UI_Vote_Finish_Continue"))
  
  local function SetBtnVisibility()
    self.Btn_Continue:SetVisibility(ESlateVisibility.Visible)
  end
  
  self.VoteMain:BindToAnimationFinished(self.VoteMain.Auto_In, {self, SetBtnVisibility})
  self.Btn_Continue.OnClicked:Add(self, self.OnClickContinue)
  self.Btn_Continue.OnPressed:Add(self, self.OnPressContinue)
  self.Btn_Continue.OnHovered:Add(self, self.OnMouseEnterButton)
  self.Btn_Continue.OnUnhovered:Add(self, self.OnMouseLeaveButton)
  self.Box_Continue:SetControlScrollbarInside(true)
  self.Box_Continue:ClearListItems()
  if self.VoteMain.DeviceInPc then
    self.Key_Continue:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          ClickCallback = self.OnClickContinue,
          Owner = self
        }
      },
      bLongPress = true
    })
  end
  self:PlayAnimation(self.Normal)
  self:OnReleaseContinue(true)
end

function M:InitLeave(Type)
  self.IsContinuePanel = false
  self.Text_Title:SetText(GText("UI_Vote_Retreat_Current"))
  self.Text_Tips:SetText(GText("UI_Vote_Retreat_Reward"))
  self.Panel_Bonus:SetVisibility(ESlateVisibility.Hidden)
  self.Switch_Type:SetActiveWidgetIndex(0)
  self.Switch_Btn:SetActiveWidgetIndex(0)
  self.Switch_Tips:SetActiveWidgetIndex(0)
  self.Text_Leave:SetText(GText("UI_Vote_Finish_Retreat"))
  
  local function SetBtnVisibility()
    self.Btn_Leave:SetVisibility(ESlateVisibility.Visible)
  end
  
  self.VoteMain:BindToAnimationFinished(self.VoteMain.Auto_In, {self, SetBtnVisibility})
  self.Btn_Leave.OnClicked:Add(self, self.OnClickLeave)
  self.Btn_Leave.OnPressed:Add(self, self.OnPressLeave)
  self.Btn_Leave.OnHovered:Add(self, self.OnMouseEnterButton)
  self.Btn_Leave.OnUnhovered:Add(self, self.OnMouseLeaveButton)
  self.Box_Leave:SetControlScrollbarInside(true)
  self.Box_Leave:ClearListItems()
  if self.VoteMain.DeviceInPc then
    self.Key_Leave:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
          ClickCallback = self.OnClickLeave,
          Owner = self
        }
      },
      bLongPress = true
    })
  end
  self:PlayAnimation(self.Normal)
  self:OnReleaseLeave(true)
end

function M:GetAllRewardsList(MaxProgress)
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId() or 90401
  local DefenceWave = self.VoteMain.CurrentWave
  if MaxProgress < DefenceWave then
    return
  end
  local Dungeon = DataMgr.Dungeon[DungeonId]
  local DungeonRewardArray = Dungeon.DungeonReward
  local Idx = 0
  self.Box_Continue:ClearListItems()
  self.Box_Leave:ClearListItems()
  for i = 1, DefenceWave do
    Idx = Idx % #DungeonRewardArray + 1
    if self.Type == "Leave" then
      local RealWave = DefenceWave + 1 - i
      self:GetRewardsList(false, "Leave", RealWave, DungeonRewardArray[(RealWave - 1) % #DungeonRewardArray + 1], DefenceWave)
    end
  end
  if DefenceWave < 3 then
    self.Box_Leave:SetEmptyGridItemCount(math.max(0, 3 - DefenceWave))
    for i = DefenceWave + 1, 3 do
      if self.Type == "Leave" then
        self:GetRewardsList(false, "Leave", DefenceWave + 1 - i, -1, DefenceWave)
      end
    end
  end
  local MaxRound = DataMgr.GlobalConstant.DungeonMaxRound.ConstantValue
  self.Box_Continue:SetEmptyGridItemCount(math.max(0, DefenceWave + 3 - MaxRound))
  for i = DefenceWave + 1, DefenceWave + 3 do
    if MaxRound >= i then
      Idx = Idx % #DungeonRewardArray + 1
      if self.Type == "Continue" then
        local RealWave = i
        self:GetRewardsList(i == DefenceWave + 1, "Continue", i, DungeonRewardArray[(RealWave - 1) % #DungeonRewardArray + 1])
      end
    else
      self:GetRewardsList(false, "Continue", DefenceWave + 1 - i, -1, DefenceWave)
    end
  end
end

function M:GetRewardsList(IsCurrentWave, Type, CurrentDungeonProgress, RewardId, DefenceWave)
  local Class = LoadClass("/Game/UI/WBP/Vote/Widget/Vote_WaveReward_Content.Vote_WaveReward_Content")
  local Obj = NewObject(Class)
  Obj.IsCurrentWave = IsCurrentWave
  Obj.Type = Type
  Obj.CurrentDungeonProgress = CurrentDungeonProgress
  Obj.RewardId = RewardId
  Obj.DefenceWave = DefenceWave
  if "Continue" == Type then
    self.Box_Continue:AddItem(Obj)
  else
    self.Box_Leave:AddItem(Obj)
  end
end

function M:OnPressContinue()
  if self.bPress then
    return
  end
  self.bPress = true
  self:PlayAnimation(self.Press)
end

M:LimitCall(1)

function M:OnClickContinue()
  if self.bClick then
    return
  end
  self.bClick = true
  if self.CurrentActionPoint < self.CostActionPoint then
    return
  end
  self.VoteMain:Vote(true)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Click)
  self.WS_Controller01:SetActiveWidgetIndex(0)
  self.WS_Controller02:SetActiveWidgetIndex(0)
  self.Text_Continue:SetText(GText("UI_Vote_Finish_Continued"))
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function M:OnReleaseContinue(bInit)
  self:StopAnimation(self.UnHover)
  self:StopAnimation(self.Click)
  self:PlayAnimation(self.Normal)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  if not bInit and CurMode == ECommonInputType.Gamepad then
    self.WS_Controller01:SetActiveWidgetIndex(1)
    self.WS_Controller02:SetActiveWidgetIndex(1)
    self:ResetGamepadButton()
  end
  self.Text_Continue:SetText(GText("UI_Vote_Finish_Continue"))
  self.bPress = false
  self.bClick = false
  self:RemoveTimer("OnGamepadPressContinue")
end

function M:OnGamepadClickContinue()
  self:AddTimer(0.1, self.OnClickContinue)
end

function M:OnGamepadPressContinue()
  if self.VoteMain.SelectContinue then
    return
  end
  self.Key_Continue:OnButtonPressed()
end

function M:OnGamepadReleaseContinue()
  if self.VoteMain.SelectContinue then
    return
  end
  self.Key_Continue:OnButtonReleased()
end

function M:OnPressLeave()
  if self.bPress then
    return
  end
  self.bPress = true
  self:PlayAnimation(self.Press)
end

M:LimitCall(1)

function M:OnClickLeave()
  if self.bClick then
    return
  end
  self.bClick = true
  self.VoteMain:Vote(false)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Click)
  self.WS_Controller01:SetActiveWidgetIndex(0)
  self.WS_Controller02:SetActiveWidgetIndex(0)
  self.Text_Leave:SetText(GText("UI_Vote_Finish_Retreated"))
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function M:OnReleaseLeave(bInit)
  self:StopAnimation(self.UnHover)
  self:StopAnimation(self.Click)
  self:PlayAnimation(self.Normal)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  if not bInit and CurMode == ECommonInputType.Gamepad then
    self.WS_Controller01:SetActiveWidgetIndex(1)
    self.WS_Controller02:SetActiveWidgetIndex(1)
    self:ResetGamepadButton()
  end
  self.Text_Leave:SetText(GText("UI_Vote_Finish_Retreat"))
  self.bPress = false
  self.bClick = false
end

function M:OnGamepadClickLeave()
  self:AddTimer(0.1, self.OnClickLeave)
end

function M:OnGamepadPressLeave()
  if self.VoteMain.SelectContinue == false then
    return
  end
  self.Key_Leave:OnButtonPressed()
end

function M:OnGamepadReleaseLeave()
  if self.VoteMain.SelectContinue == false then
    return
  end
  self.Key_Leave:OnButtonReleased()
end

function M:OnMouseEnterButton()
  if self.VoteMain.SelectContinue == nil or self.IsContinuePanel ~= self.VoteMain.SelectContinue then
    self:StopAnimation(self.UnHover)
    self:PlayAnimation(self.Hover)
    self.bPress = false
    self.bClick = false
  end
end

function M:OnMouseLeaveButton()
  if self.VoteMain.SelectContinue == nil or self.IsContinuePanel ~= self.VoteMain.SelectContinue then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
    self.bPress = false
    self.bClick = false
  end
end

function M:GetActionPoint()
  local Avatar = GWorld:GetAvatar()
  local CurrentActionPoint = 0
  if not Avatar then
    self.CurrentActionPoint = 50
  else
    self.CurrentActionPoint = Avatar.ActionPoint
  end
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId() or 90401
  if not DataMgr.Dungeon[DungeonId] then
    return
  end
  local MaxCostWave = #DataMgr.Dungeon[DungeonId].DungeonCost
  local CurrentCostIdx = self.VoteMain.CurrentWave % MaxCostWave + 1
  self.CostActionPoint = DataMgr.Dungeon[DungeonId].DungeonCost[CurrentCostIdx]
  if Avatar and Avatar.bDungeonDoubleCost and not DataMgr.Dungeon[DungeonId].IsWalnutDungeon then
    self.CostActionPoint = self.CostActionPoint * 2
  end
end

function M:UpdateActionPoint()
  self:GetActionPoint()
  self.Cost:SetPossess(self.CurrentActionPoint)
end

function M:BP_GetDesiredFocusTarget()
  if self.IsContinuePanel then
    return self.Box_Continue
  else
    return self.Box_Leave
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  print(_G.LogTag, "LXZ RefreshOpInfoByInputDevice", CurInputDevice)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.VoteMain.DeviceInPc then
    self.WS_Controller01:SetActiveWidgetIndex(0)
    self.WS_Controller02:SetActiveWidgetIndex(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.VoteMain.DeviceInPc and not self.bClick then
    self.WS_Controller01:SetActiveWidgetIndex(1)
    self.WS_Controller02:SetActiveWidgetIndex(1)
    self:ResetGamepadButton()
  elseif CurInputDevice == ECommonInputType.Touch then
  end
end

function M:OnDpadRight()
  local Content
  local IsContinue = false
  if self.IsContinuePanel then
    Content = self.Box_Continue:BP_GetSelectedItem()
    IsContinue = true
  else
    Content = self.Box_Leave:BP_GetSelectedItem()
    IsContinue = false
  end
  print(_G.LogTag, "LXZ OnDpadRight", Content)
  if not Content or IsContinue then
  else
  end
end

function M:OnDpadLeft()
  local Content
  if self.IsContinuePanel then
    Content = self.Box_Continue:BP_GetSelectedItem()
  else
    Content = self.Box_Leave:BP_GetSelectedItem()
  end
  print(_G.LogTag, "LXZ OnDpadRight", Content)
  if Content then
  end
end

function M:ResetGamepadButton()
  self.Key_Leave:_ResetState(self.Key_Leave.LongPress)
  self.Key_Leave:PlayAnimation(self.Key_Leave.Normal)
  self.Key_Continue:_ResetState(self.Key_Continue.LongPress)
  self.Key_Continue:PlayAnimation(self.Key_Continue.Normal)
end

function M:OnClose()
  EventManager:RemoveEvent(EventID.OnUpdateRewardProgress, self)
end

return M
