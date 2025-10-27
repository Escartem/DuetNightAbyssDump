local ConditionNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ConditionNode:Execute()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Res = ConditionUtils.CheckCondition(Avatar, self.ConditionId)
  return Res and "Success" or "Fail"
end

return ConditionNode
