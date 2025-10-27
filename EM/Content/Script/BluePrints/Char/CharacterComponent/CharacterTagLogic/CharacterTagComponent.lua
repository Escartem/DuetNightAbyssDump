require("UnLua")
local CharacterFSM = require("BluePrints.Char.CharacterComponent.CharacterTagLogic.CharacterFSM")
local PlayerTagRule = require("BluePrints.Char.CharacterComponent.CharacterTagLogic.PlayerCharacterTagRule")
local MonsterTagRule = require("BluePrints.Char.CharacterComponent.CharacterTagLogic.MonsterCharacterTagRule")
local Component = {}

function Component:ApplyLeaveCharacterTag(OldTag, NewTag)
  local Leave = "Leave"
  local TagStr = "Tag"
  local FunctionName = Leave .. OldTag .. TagStr
  if nil ~= self[FunctionName] then
    self[FunctionName](self, NewTag)
    return true
  end
  return false
end

function Component:ApplyEnterCharacterTag(NewTag)
  if self.EMAnimInstance ~= nil then
    self.EMAnimInstance.CharacterTag = NewTag
  end
  if nil ~= self.NpcAnimInstance then
    self.NpcAnimInstance.CharacterTag = NewTag
  end
  local Enter = "Enter"
  local TagStr = "Tag"
  local FunctionName = Enter .. NewTag .. TagStr
  if nil ~= self[FunctionName] then
    self[FunctionName](self)
    return true
  end
  return false
end

function Component:CanLeaveCharacterTag(Tag)
  return true
end

function Component:GetCharacterTag()
  return self.AutoSyncProp.CharacterTag
end

function Component:CharacterInTag(Tag)
  return Tag == self.AutoSyncProp.CharacterTag
end

function Component:GetStateMachineInfo(Tag)
  if self:IsPlayer() then
    return DataMgr.PlayerStateMachine[Tag]
  else
    return DataMgr.MonsterStateMachine[Tag]
  end
end

function Component:GetStateLimitInfo(Tag)
  if self:IsPlayer() then
    return DataMgr.PlayerStateLimit[Tag]
  else
    return DataMgr.MonsterStateLimit[Tag]
  end
end

function Component:GetStateLimitTagTypeMap(StateLimitInfo)
  local TagTypeMap = {}
  if StateLimitInfo.TagType then
    for _, TagType in pairs(StateLimitInfo.TagType) do
      TagTypeMap[TagType] = true
    end
  end
  return TagTypeMap
end

return Component
