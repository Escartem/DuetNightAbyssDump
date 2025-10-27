local FinishCountPlayerSkillUsedTimesNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function FinishCountPlayerSkillUsedTimesNode:Execute()
  local GameInstance = GWorld.GameInstance
  self.ListenTarget = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.ListenTarget:ResetNeedCountPlayerSkillUsedTimes(self.SkillId)
  if self.bClearTimes then
    self.ListenTarget:ResetCountPlayerSkillUsedTimes(self.SkillId)
  end
end

function FinishCountPlayerSkillUsedTimesNode:OnQuestlineSuccess()
  self.ListenTarget:SavePlayerSkillUsedTimes()
  self.Count = nil
end

function FinishCountPlayerSkillUsedTimesNode:OnQuestlineFail()
  local Count = self.ListenTarget:GetPlayerUseSkillTimesFromCache(self.SkillId)
  self.ListenTarget:ResetPlayerUseSkillTimes(self.SkillId, Count, true)
end

return FinishCountPlayerSkillUsedTimesNode
