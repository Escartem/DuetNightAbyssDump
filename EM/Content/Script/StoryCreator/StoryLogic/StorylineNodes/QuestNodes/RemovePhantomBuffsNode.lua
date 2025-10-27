local RemovePhantomBuffsNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function RemovePhantomBuffsNode:Init()
  self.RemoveBuffs = {}
end

function RemovePhantomBuffsNode:Start(Context)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Phantoms = PlayerCharacter:GetPhantomTeammates(false)
  local PhantomsTable = Phantoms:ToTable()
  for _, Teammate in pairs(PhantomsTable) do
    if Teammate.CurrentRoleId == self.PhantomRoleId then
      for _, BuffId in pairs(self.RemoveBuffs) do
        Battle(PlayerCharacter):RemoveBuffFromTarget(Teammate, Teammate, BuffId, false, -1)
      end
      self:FinishAction()
      return
    end
  end
end

function RemovePhantomBuffsNode:FinishAction()
  self:Finish()
end

return RemovePhantomBuffsNode
