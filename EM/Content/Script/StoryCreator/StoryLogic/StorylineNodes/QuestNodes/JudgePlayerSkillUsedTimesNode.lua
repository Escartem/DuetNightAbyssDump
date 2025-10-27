local JudgePlayerSkillUsedTimesNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function JudgePlayerSkillUsedTimesNode:Execute()
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local UsedTimes = PlayerCharacter:GetCountPlayerSkillUsedTimes(self.SkillId) or 0
  local Result = false
  if 0 == self.CompareFunc then
    Result = UsedTimes > self.Times
  elseif 1 == self.CompareFunc then
    Result = UsedTimes < self.Times
  elseif 2 == self.CompareFunc then
    Result = UsedTimes >= self.Times
  elseif 3 == self.CompareFunc then
    Result = UsedTimes <= self.Times
  elseif 4 == self.CompareFunc then
    Result = UsedTimes == self.Times
  elseif 5 == self.CompareFunc then
    Result = UsedTimes ~= self.Times
  end
  local Branch = "False"
  if Result then
    Branch = "True"
  end
  return Branch
end

return JudgePlayerSkillUsedTimesNode
