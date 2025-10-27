local TagRules = Class("BluePrints.Char.CharacterComponent.CharacterTagLogic.BaseCharacterTagRule")
TagRules = setmetatable(TagRules, {
  __index = TagRules.Super
})

function TagRules:GetStateMachineInfo(TagName)
  return DataMgr.PlayerStateMachine[TagName]
end

function TagRules:GetStateLimitInfo(TagName)
  return DataMgr.PlayerStateLimit[TagName]
end

function TagRules:OnTagChanged(OldTag, NewTag)
end

local IdleInfo = TagRules:GetTagInfo("Idle")

function IdleInfo.OnEnterTag(Owner)
end

function IdleInfo.OnLeaveTag(Owner)
end

function IdleInfo.CanLeaveTag(Owner)
  return true
end

return TagRules
