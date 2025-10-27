local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local EDialogueNodeType = TalkUtils.EDialogueNodeType

local function ShowUIDialoguePanel(UI)
  UI.Dialogue_Boss:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

local function CollapseUIDialoguePanel(UI)
  if IsValid(UI) then
    UI.Dialogue_Boss:SetVisibility(ESlateVisibility.Collapsed)
  end
end

local M = Class("BluePrints.Story.Talk.Controller.LightTalkTask")

function M:Start(TalkTaskData, TaskFinished_Callback)
  M.Super.Start(self, TalkTaskData, TaskFinished_Callback)
  EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, self.HandleOnTeamRecoveryStateChange)
  local PlayerCharacter = GWorld:GetMainPlayer()
  if PlayerCharacter:IsDead() then
    CollapseUIDialoguePanel(self.UI)
  else
    ShowUIDialoguePanel(self.UI)
  end
end

function M:PlayDialogue(bPauseResume)
  local NodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if NodeType ~= EDialogueNodeType.Dialogue then
    DebugPrint("lhr@Dialogue Iteration Error: NodeType", NodeType, "\228\184\141\229\144\136\230\179\149")
    return
  end
  local CurrentDialogue = self.DialogueIterationComponent:GetDialogue()
  if not CurrentDialogue then
    DebugPrint("lhr@Dialogue Iteration Error: Dialogue\228\184\186\231\169\186")
    return
  end
  local Content = TalkUtils:DialogueIdToContent(CurrentDialogue.DialogueId)
  if not Content then
    self:IterateDialogue()
    return
  end
  self:OnPlayingDialogue(CurrentDialogue)
  self.UI.Text_Boss:SetText(Content)
  local Duration = CurrentDialogue.Duration or 1
  if CurrentDialogue.VoiceName then
    self.TalkAudioComp:PlayDialogue(CurrentDialogue, self.TalkTaskData, self, {
      Func = function()
        self:_LatentNextDialogue(Duration)
      end
    }, true, nil, nil, bPauseResume)
  else
    self:_LatentNextDialogue(Duration)
  end
end

function M:_LatentNextDialogue(DelaySeconds)
  self.TalkContext.TalkTimerManager:AddTimer(self, DelaySeconds, nil, nil, nil, function()
    self:IterateDialogue()
  end)
end

function M:InitUI()
  self.UI = self:CreateBattleMainUI()
end

function M:CreateBattleMainUI()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  return BattleMain
end

function M:HandleOnTeammateRecovery(Eid)
  local Entity = GWorld.Battle:GetEntity(Eid)
  if Entity and Entity.IsMainPlayer and Entity:IsMainPlayer() then
    ShowUIDialoguePanel(self.UI)
  end
end

function M:HandleOnCharWaitingResurgence(Eid)
  local Entity = GWorld.Battle:GetEntity(Eid)
  if Entity and Entity.IsMainPlayer and Entity:IsMainPlayer() then
    CollapseUIDialoguePanel(self.UI)
  end
end

function M:HandleOnTeamRecoveryStateChange(Eid, State, PrevState)
  if State == UE4.ETeamRecoveryState.IsWaitingRecover and PrevState == UE4.ETeamRecoveryState.Dying then
    self:HandleOnCharWaitingResurgence(Eid)
  elseif State == UE4.ETeamRecoveryState.Alive and PrevState == UE4.ETeamRecoveryState.IsWaitingRecover then
    self:HandleOnTeammateRecovery(Eid)
  end
end

function M:Clear()
  M.Super.Clear(self)
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, self)
end

function M:ClearUI()
  CollapseUIDialoguePanel(self.UI)
end

return M
