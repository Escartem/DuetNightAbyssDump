local BaseTagInfo = require("BluePrints.Char.CharacterComponent.CharacterTagLogic.BaseTagInfo")
local TagRules = {}

function TagRules:GetTagInfo(TagName)
  if not TagName then
    return nil
  end
  if not self[TagName] then
    self[TagName] = setmetatable({}, BaseTagInfo)
    self[TagName].Name = TagName
    self[TagName].ForbidTags = self:GetStateMachineInfo(TagName) or {}
    self[TagName].StateLimitInfo = self:GetStateLimitInfo(TagName) or {}
  end
  return self[TagName]
end

function TagRules:GetStateMachineInfo(TagName)
  return nil
end

function TagRules:GetStateLimitInfo(TagName)
  return nil
end

function TagRules:OnTagChanged(OldTag, NewTag)
end

function TagRules:CheckCanEnterTag(Owner, CurTag, NewTag, CustomCheckers)
  if not CurTag then
    return true
  end
  local CurTagInfo = self:GetTagInfo(CurTag)
  local NewTagInfo = self:GetTagInfo(NewTag)
  if CurTagInfo.ForbidTags and 1 == CurTagInfo.ForbidTags[NewTag] then
    return false
  end
  if not Owner:CheckBuffCanEnterTag(NewTag) then
    return false
  end
  if not Owner:CheckSuperArmorEnterTag(NewTag) then
    return false
  end
  if CustomCheckers then
    for Name, Checker in pairs(CustomCheckers) do
      if not Checker(CurTagInfo, NewTagInfo) then
        DebugPrint("Tianyi@ Cannot enter tag " .. NewTag .. " because of " .. Name)
        return false
      end
    end
  end
  if CurTagInfo and not CurTagInfo.CanLeaveTag(Owner) then
    return false
  end
  return true
end

function TagRules:GetDefaultTag(Owner)
  if Owner.BuffManager and Owner.BuffManager.CurrentSetCharacterTag then
    return Owner.BuffManager.CurrentSetCharacterTag
  elseif Owner.EMAnimInstance and (Owner.IsInAir or Owner.EMAnimInstance.CurrentJumpState ~= Const.NormalState) then
    return "Falling"
  elseif not Owner:IsDead() then
    return "Idle"
  end
end

local IdleInfo = TagRules:GetTagInfo("Idle")

function IdleInfo.OnEnterTag(Owner)
  Owner:SetHitFlyState("NotHitFly")
end

function IdleInfo.OnLeaveTag(Owner)
end

local FallingInfo = TagRules:GetTagInfo("Falling")

function FallingInfo.OnEnterTag(Owner)
end

function FallingInfo.OnLeaveTag(Owner)
end

local HitFlyInfo = TagRules:GetTagInfo("HitFly")

function HitFlyInfo.OnEnterTag(Owner)
  Owner:SetHitFlyState("HitFly")
  if Owner.EMAnimInstance then
    Owner:SetCurrentJumpState(Const.NormalState)
  end
end

function HitFlyInfo.OnLeaveTag(Owner)
end

local HeavyHitInfo = TagRules:GetTagInfo("HeavyHit")

function HeavyHitInfo.OnEnterTag(Owner)
end

function HeavyHitInfo.OnLeaveTag(Owner)
end

return TagRules
