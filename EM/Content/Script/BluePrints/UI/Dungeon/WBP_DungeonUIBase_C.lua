local WBP_DungeonUIBase_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DungeonUIBase_C:OnLoaded(...)
  self:OnDungeonUIStateUpdated()
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI then
    self:AddTimer(0.1, self.AddToBattleMain, true, 0, "AddSelfToBattleMain")
    return
  end
  if not self.bNotAddToTaskPanel then
    self:AddTaskToOverlay(BattleMainUI)
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    UIManager(self):ChangeUserWidgetToNewParent(self.WidgetName)
    self.AlreadyAdd = true
    DebugPrint("DungeonUI: AddedToBattleMain", self:GetName())
    self:AfterAddToParent()
  end
end

function WBP_DungeonUIBase_C:AddToBattleMain()
  DebugPrint("DungeonUI: TryAddedToBattleMainByTimer", self:GetName())
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI then
    return
  end
  if not self.bNotAddToTaskPanel and not self.AlreadyAdd then
    self:AddTaskToOverlay(BattleMainUI)
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    UIManager(self):ChangeUserWidgetToNewParent(self.WidgetName)
    DebugPrint("DungeonUI: AddedToBattleMainByTimer", self:GetName())
    self:AfterAddToParent()
  end
  self:InitListenEvent()
  self:RemoveTimer("AddSelfToBattleMain")
end

function WBP_DungeonUIBase_C:OnButtonBackClicked()
  DebugPrint("WBP_DungeonUIBase_C:OnButtonBackClicked")
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:TryShowDungeonFirstGuide(GameState.GameModeType)
end

function WBP_DungeonUIBase_C:OnImageGuideBecameRelative(Index)
end

function WBP_DungeonUIBase_C:InitListenEvent()
  self:AddDispatcher(EventID.OnDungeonUIStateUpdated, self, self.OnDungeonUIStateUpdated)
end

function WBP_DungeonUIBase_C:OnDungeonUIStateUpdated()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local DungeonUIState = GameState.DungeonUIState
  DebugPrint("OnDungeonUIStateUpdated:", EDungeonUIState:GetNameByValue(DungeonUIState))
  if DungeonUIState == Const.EDungeonUIState.None then
    self:UIStateChange_None()
  elseif DungeonUIState == Const.EDungeonUIState.BeforeTarget then
    self:UIStateChange_BeforeTarget()
  elseif DungeonUIState == Const.EDungeonUIState.OnTarget then
    self:UIStateChange_OnTarget()
  elseif DungeonUIState == Const.EDungeonUIState.AfterTarget then
    self:UIStateChange_AfterTarget()
  end
end

function WBP_DungeonUIBase_C:UIStateChange_None()
end

function WBP_DungeonUIBase_C:UIStateChange_BeforeTarget()
end

function WBP_DungeonUIBase_C:UIStateChange_OnTarget()
end

function WBP_DungeonUIBase_C:UIStateChange_AfterTarget()
end

function WBP_DungeonUIBase_C:OnDungeonVoteBegin()
end

function WBP_DungeonUIBase_C:AfterAddToParent()
end

function WBP_DungeonUIBase_C:AddTaskToOverlay(BattleMainUI)
  BattleMainUI.Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMainUI.Task:AddChildToOverlay(self)
end

return WBP_DungeonUIBase_C
