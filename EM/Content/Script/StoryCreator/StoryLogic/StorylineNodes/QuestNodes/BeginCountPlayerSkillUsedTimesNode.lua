local BeginCountPlayerSkillUsedTimesNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function BeginCountPlayerSkillUsedTimesNode:Execute()
  local GameInstance = GWorld.GameInstance
  self.ListenTarget = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.ListenTarget:StartPlayerUseSkillTimes(self.SkillId)
  self.Count = self.ListenTarget:GetCountPlayerSkillUsedTimes(self.SkillId) or 0
end

function BeginCountPlayerSkillUsedTimesNode:OnQuestlineSuccess()
  self.ListenTarget:SavePlayerSkillUsedTimes()
end

function BeginCountPlayerSkillUsedTimesNode:OnQuestlineFail()
  self.ListenTarget:ResetPlayerUseSkillTimes(self.SkillId, self.Count, false)
end

return BeginCountPlayerSkillUsedTimesNode
