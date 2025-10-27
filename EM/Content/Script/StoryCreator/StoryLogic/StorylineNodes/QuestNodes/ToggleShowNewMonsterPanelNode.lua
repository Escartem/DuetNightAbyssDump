local ToggleShowNewMonsterPanelNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function ToggleShowNewMonsterPanelNode:Init()
end

function ToggleShowNewMonsterPanelNode:Start(Context)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  self.EnableBefore = GameState.MonsterFirstSeenEnabled
  GameState.MonsterFirstSeenEnabled = self.Enable
  self:Finish()
end

function ToggleShowNewMonsterPanelNode:OnQuestlineSuccess()
end

function ToggleShowNewMonsterPanelNode:OnQuestlineFail()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  GameState.MonsterFirstSeenEnabled = self.EnableBefore
end

return ToggleShowNewMonsterPanelNode
