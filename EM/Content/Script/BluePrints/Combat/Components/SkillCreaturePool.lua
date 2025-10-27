local SkillCreaturePool = {}

function SkillCreaturePool:GetSkillCreaturePoolRefreshTime()
  return Const.SkillCreaturePoolRefreshTime
end

function SkillCreaturePool:GetSkillCreaturePoolCleanTime()
  return Const.SkillCreaturePoolCleanTime
end

function SkillCreaturePool:PreloadSkillCreature_Lua(Source, Weapon, bPersistent)
  local BulletNum = math.max(Weapon.Data.BulletInit or 0, Weapon.Data.MagazineCapacity or 0)
  if 0 == BulletNum then
    BulletNum = Const.SkillCreaturePoolDefaultPreloadNum
  end
  local Skills = Weapon:GetSkills()
  for _, SKillId in ipairs(Skills) do
    local Skill = Source:GetSkill(SKillId)
    self:PreloadSkillCreatureBySkill(Skill, bPersistent, BulletNum)
  end
end

function SkillCreaturePool:PreloadSkillCreatureBySkill(Skill, bPersistent, BulletNum)
  if not Skill then
    return
  end
  local BeginNodeId = Skill.Data.BeginNodeId
  local AllSkillNode = {}
  if not BeginNodeId then
    return
  end
  AllSkillNode[BeginNodeId] = true
  local TempSkillList = {BeginNodeId}
  while #TempSkillList > 0 do
    local SkillNodeId = table.remove(TempSkillList, #TempSkillList)
    local SkillNodeData = DataMgr.SkillNode[SkillNodeId]
    if SkillNodeData then
      if SkillNodeData.SkillNodeEffects then
        for _, SkillNodeEffectId in pairs(SkillNodeData.SkillNodeEffects) do
          local SKillEffectData = DataMgr.SkillEffects[SkillNodeEffectId]
          local TaskEffects = SKillEffectData.TaskEffects or {}
          for _, Effect in ipairs(TaskEffects) do
            if Effect.Function == "CreateSkillCreature" then
              local CreatureData = DataMgr.SkillCreature[Effect.CreatureId]
              local BPPath = CreatureData.BPPath or "/Game/BluePrints/Combat/SkillCreatures/BP_SkillCreature.BP_SkillCreature"
              if CreatureData.EnterPool and not CreatureData.BPPath and not CreatureData.UseBulletCreature then
                self:PreloadSkillCreature(Effect.CreatureId, BPPath, bPersistent, BulletNum)
              end
            end
          end
        end
      end
      local NextNodeId = SkillNodeData.NextNodeId
      local ExtraNextNodeId = SkillNodeData.ExtraNextNodeId
      if NextNodeId and not AllSkillNode[NextNodeId] then
        AllSkillNode[NextNodeId] = true
        table.insert(TempSkillList, NextNodeId)
      end
      if ExtraNextNodeId and not AllSkillNode[ExtraNextNodeId] then
        AllSkillNode[ExtraNextNodeId] = true
        table.insert(TempSkillList, ExtraNextNodeId)
      end
    end
  end
end

return SkillCreaturePool
