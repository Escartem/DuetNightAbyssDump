local Component = {}

function Component:InitComponent()
  self.MonShareSkillCdBattleGroup = {}
  self.MonShareSkillCdMap = {}
end

function Component:BuildMonShareSkillCdGroup(BattleGroupId)
  if not DataMgr.MonBattleMgrData[BattleGroupId] then
    return
  end
  local SkillShareRules = DataMgr.MonBattleMgrData[BattleGroupId].SkillShareRule
  for i = 1, #SkillShareRules do
    local SkillShareRule = SkillShareRules[i]
    if not self.MonShareSkillCdBattleGroup[BattleGroupId] then
      self.MonShareSkillCdBattleGroup[BattleGroupId] = {}
    end
    self.MonShareSkillCdBattleGroup[BattleGroupId][SkillShareRule.SkillId] = SkillShareRule.Count
    self.MonShareSkillCdMap[SkillShareRule.SkillId] = SkillShareRule.SkillCd
  end
end

function Component:GetMonShareSkillCount(BattleGroupId, SkillId)
  if not self.MonShareSkillCdBattleGroup[BattleGroupId] then
    return 0
  end
  if not self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] then
    return 0
  end
  return self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId]
end

function Component:CheckUseMonShareSkill(BattleGroupId, SkillId)
  if not BattleGroupId or 0 == BattleGroupId then
    return true
  end
  if not self.MonShareSkillCdBattleGroup[BattleGroupId] then
    self:BuildMonShareSkillCdGroup(BattleGroupId)
  end
  if not self.MonShareSkillCdBattleGroup[BattleGroupId] then
    return true
  end
  if not self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] then
    return true
  end
  return self:GetMonShareSkillCount(BattleGroupId, SkillId) > 0
end

function Component:HandleUseMonShareSkill(BattleGroupId, SkillId)
  if not (BattleGroupId and self.MonShareSkillCdBattleGroup[BattleGroupId]) or not self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] then
    return
  end
  local Count = self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] - 1
  self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] = Count >= 0 and Count or 0
  local SkillCd = self.MonShareSkillCdMap[SkillId]
  self:AddTimer(SkillCd, function()
    self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] = self.MonShareSkillCdBattleGroup[BattleGroupId][SkillId] + 1
  end)
end

return Component
