local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Skill = Class("Skill", CustomTypes.CustomAttr)
Skill.__Props__ = {
  SkillId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  ExtraLevel = prop.prop("Int", "client save", 0),
  LockState = prop.prop("Int", "client save", 1)
}

function Skill:Init(SkillId, Level, ExtraLevel)
  if not SkillId then
    return
  end
  self.SkillId = SkillId
  if Level then
    self.Level = Level
  end
  if nil ~= ExtraLevel then
    self.ExtraLevel = ExtraLevel
  end
end

function Skill:InitLockState()
  self:UnLock()
end

function Skill:Lock()
  self.LockState = 1
end

function Skill:UnLock()
  self.LockState = 0
end

function Skill:IsLocked()
  return 1 == self.LockState
end

function Skill:Data()
  return DataMgr.Skill[self.SkillId][self.Level][self.GradeLevel]
end

function Skill:GetRealSkill()
  return self.Level + self.ExtraLevel, self.ExtraLevel
end

function Skill:LevelUpData()
  local SkillLevelUpInfo = DataMgr.SkillLevelUp[self.SkillId]
  if not SkillLevelUpInfo then
    return nil
  end
  return SkillLevelUpInfo[self.Level]
end

function Skill:Update(GradeLevel, EnhanceLevel)
  self.GradeLevel = GradeLevel or 0
  self.EnhanceLevel = EnhanceLevel or 0
  self:InitLockState()
end

function Skill:LevelUp()
  local MaxLevel = self:GetMaxLevel()
  if MaxLevel > self.Level then
    self.Level = self.Level + 1
    return true
  end
  return false
end

function Skill:GMSetLevel(level)
  level = level or 1
  level = math.max(0, math.min(level, self:GetMaxLevel()))
  self.Level = level
end

function Skill:GetMaxLevel()
  local SkillLevelUpInfo = DataMgr.SkillLevelUp[self.SkillId]
  if SkillLevelUpInfo then
    return #SkillLevelUpInfo + 1
  end
end

function Skill:GetLevelUpItems()
  local LevelUpInfo = self:LevelUpData()
  if not LevelUpInfo then
    return
  end
  local result = {}
  for index, ItemId in pairs(LevelUpInfo.ItemId) do
    if LevelUpInfo.ItemNum and LevelUpInfo.ItemNum[index] then
      result[ItemId] = LevelUpInfo.ItemNum[index]
    end
  end
  return result
end

function Skill:AddExtraLevel(Level)
  if type(Level) ~= "number" or Level <= 0 then
    return
  end
  self.ExtraLevel = self.ExtraLevel + Level
end

function Skill:CheckCanLevelUp()
  local LevelUpInfo = self:LevelUpData()
  if not LevelUpInfo then
    return false
  end
  if self.EnhanceLevel < LevelUpInfo.CharBreakLevel then
    return false
  end
  return true
end

FormatProperties(Skill)
local SkillList = Class("SkillList", CustomTypes.CustomList)
SkillList.ValueType = Skill

function SkillList:NewSkill(SkillId, Level, ExtraLevel)
  Level = Level or 0
  local _Skill = Skill(SkillId, Level, ExtraLevel)
  return _Skill
end

local SkillTreeNode = Class("SkillTreeNode", CustomTypes.CustomAttr)
SkillTreeNode.__Props__ = {
  TargetId = prop.prop("Int", "client save"),
  SkillOrAttr = prop.prop("Int", "client save", 0),
  LockState = prop.prop("Int", "client save", 1)
}

function SkillTreeNode:Init(TargetId, SkillOrAttr, LockState)
  if not TargetId then
    return
  end
  self.TargetId = TargetId
  if SkillOrAttr then
    self.SkillOrAttr = SkillOrAttr
  end
  if LockState then
    self.LockState = LockState
  end
end

function SkillTreeNode:Lock()
  self.LockState = 1
end

function SkillTreeNode:UnLock()
  self.LockState = 0
end

function SkillTreeNode:IsLocked()
  return 1 == self.LockState
end

function SkillTreeNode:IsSkill()
  return 0 == self.SkillOrAttr
end

FormatProperties(SkillTreeNode)
local SkillTreeNodes = Class("SkillTreeNodes", CustomTypes.CustomList)
SkillTreeNodes.ValueType = SkillTreeNode

function SkillTreeNodes:NewSkillTreeNode(TargetId, SkillOrAttr, LockState)
  local _SkillTreeNode = SkillTreeNode(TargetId, SkillOrAttr, LockState)
  return _SkillTreeNode
end

local SkillTree = Class("SkillTree", CustomTypes.CustomList)
SkillTree.ValueType = SkillTreeNodes

function SkillTree:NewSkillTreeNodes()
  return SkillTreeNodes()
end

return {
  Skill = Skill,
  SkillList = SkillList,
  SkillTreeNode = SkillTreeNode,
  SkillTreeNodes = SkillTreeNodes,
  SkillTree = SkillTree
}
