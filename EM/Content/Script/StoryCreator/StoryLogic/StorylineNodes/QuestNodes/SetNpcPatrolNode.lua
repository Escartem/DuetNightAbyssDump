local SetNpcPatrolNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SetNpcPatrolNode:Init()
  self.NpcId = 0
  self.PatrolId = 0
end

function SetNpcPatrolNode:Start(Context)
  self.Context = Context
  print("-----------------------------------SetNpcPatrolNode node start-----------------------------------")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if not IsValid(GameMode) then
    return
  end
  self.NpcPrePatrolId = 0
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local Npc = GameState:GetNpcInfo(self.NpcId)
    if Npc then
      self.NpcPrePatrolId = Npc.PatrolId
    end
  end
  GameMode:SetNpcPatrol(self.NpcId, self.PatrolId)
  self:FinishAction()
end

function SetNpcPatrolNode:FinishAction()
  self:Finish()
end

function SetNpcPatrolNode:OnQuestlineFail()
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if not IsValid(GameMode) then
    return
  end
  GameMode:SetNpcPatrol(self.NpcId, self.NpcPrePatrolId)
end

return SetNpcPatrolNode
