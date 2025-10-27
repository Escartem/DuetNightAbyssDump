local TagRules = Class("BluePrints.Char.CharacterComponent.CharacterTagLogic.BaseCharacterTagRule")

function TagRules:GetStateMachineInfo(TagName)
  return DataMgr.MonsterStateMachine[TagName]
end

function TagRules:GetStateLimitInfo(TagName)
  return DataMgr.MonsterStateLimit[TagName]
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
