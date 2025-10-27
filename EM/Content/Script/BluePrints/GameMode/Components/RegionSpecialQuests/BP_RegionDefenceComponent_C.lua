require("UnLua")
local BP_RegionDefenceComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_RegionDefenceComponent_C:InitRegionDefenceComponent()
  DebugPrint("RegionDefenceComponent: Init!")
  self.GameMode = self:GetOwner()
end

function BP_RegionDefenceComponent_C:WaveStart()
  self.MonsterTotalNum = self.MonsterTotalBaseNum + math.random(0, 2)
  self.GameMode:TriggerCreateMonsterSpawn(self:GetMonsterSpawnId())
  self.bMonRuleReseted = false
end

function BP_RegionDefenceComponent_C:GetMonsterSpawnId()
  local RealIndex = self:GetWaveIndex() % #self.MonsterSpawnIds
  if 0 == RealIndex then
    RealIndex = #self.MonsterSpawnIds
  end
  return self:TableToTArray(self.MonsterSpawnIds[RealIndex])
end

function BP_RegionDefenceComponent_C:TriggerMonsterDead(Monster)
  if Monster.CreatorType and Monster.CreatorId and Monster:GetCamp() == ECampName.Monster then
    self.MonsterTotalNum = self.MonsterTotalNum - 1
    if self.MonsterTotalNum <= 0 then
      if self:GetMonsterNum() <= 6 and self:GetMonsterNum() > 0 then
        for _, Monster in pairs(self.GameMode.EMGameState.MonsterMap) do
          if IsValid(Monster) and not Monster:IsDead() and "Monster" == Monster.UnitType and self.GameMode:CheckCanGuide(Monster.UnitId, Monster.UnitType) then
            self.GameMode.EMGameState:AddGuideEid(Monster.Eid)
          end
        end
        if not self.bMissionSwitched then
          self.bMissionSwitched = true
          self.GameMode:TriggerGameModeEvent("OnShowRemainMonster")
        end
      elseif 0 == self:GetMonsterNum() then
        self.bMissionSwitched = false
      end
      if not self.bMonRuleReseted then
        self.bMonRuleReseted = true
        self.GameMode:DestroyAllMonsterSpawn()
        self:AddTimer(3.5, function()
          self:AddTimer(2, self.MonsterNumCheck, true, 0, "MonsterNumCheck")
        end, false, 0, "MonRuleReset")
      end
    end
  end
end

function BP_RegionDefenceComponent_C:MonsterNumCheck()
  if 0 == self:GetMonsterNum() and self.MonsterTotalNum <= 0 then
    self.GameMode:PostCustomEvent("DefenceWaveEnd")
    self:RemoveTimer("MonsterNumCheck")
    self.GameMode:TriggerGameModeEvent("OnShowDefenceTarget")
  end
end

function BP_RegionDefenceComponent_C:GetMonsterNum()
  return self.GameMode.EMGameState.MonsterNum
end

function BP_RegionDefenceComponent_C:GetWaveIndex()
  return self.GameMode.EMGameState.DefenceWave
end

function BP_RegionDefenceComponent_C:AddWaveIndex(Value)
  self.GameMode.EMGameState:SetDefenceWave(self.GameMode.EMGameState.DefenceWave + Value)
end

function BP_RegionDefenceComponent_C:SetWaveIndex(Value)
  self.GameMode.EMGameState:SetDefenceWave(Value)
end

function BP_RegionDefenceComponent_C:TableToTArray(table)
  local ResTArray = TArray(0)
  if table then
    for _, Item in ipairs(table) do
      ResTArray:Add(Item)
    end
  end
  return ResTArray
end

return BP_RegionDefenceComponent_C
