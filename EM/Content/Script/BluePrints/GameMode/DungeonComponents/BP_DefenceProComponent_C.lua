require("UnLua")
local BP_DefenceComponent_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.DungeonComponents.BP_DefenceComponent_C"
})

function BP_DefenceComponent_C:InitDefenceProComponent()
  self.GameMode = self:GetOwner()
  self.GameMode.EMGameState:SetDefenceWaveInterval(DataMgr.GlobalConstant.DefenceWaveInterval.ConstantValue or 5)
  self.DefenceProInfo = DataMgr.DefencePro[self.GameMode.DungeonId]
  if not self.DefenceProInfo then
    GameState(self):ShowDungeonError("DefenceProComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonsterWave1:Clear()
  for _, SpawnRule in pairs(self.DefenceProInfo.WaveSpawnRule or {}) do
    self.MonsterWave1:Add(SpawnRule)
  end
end

function BP_DefenceComponent_C:InitEliteMonsterSpawm()
  if not self.DefenceProInfo then
    return
  end
  if not self.DefenceProInfo.EliteSpawnTime then
    return
  end
  local FinalEliteSpawnTime = 0
  if 1 == #self.DefenceProInfo.EliteSpawnTime then
    FinalEliteSpawnTime = self.DefenceProInfo.EliteSpawnTime[1]
  else
    FinalEliteSpawnTime = math.random(self.DefenceProInfo.EliteSpawnTime[1], self.DefenceProInfo.EliteSpawnTime[2])
  end
  DebugPrint("DefenceProComponent: " .. FinalEliteSpawnTime .. "\231\167\146\229\144\142\229\136\183\230\150\176\229\141\147\232\182\138\232\128\133")
  self:AddTimer(FinalEliteSpawnTime, function()
    local SpawnRule = TArray(0)
    for _, EliteSpawnRule in pairs(self.DefenceProInfo.EliteSpawnRule or {}) do
      SpawnRule:Add(EliteSpawnRule)
    end
    DebugPrint("DefenceProComponent: \229\136\183\230\150\176\229\141\147\232\182\138\232\128\133!")
    self.GameMode:TriggerCreateMonsterSpawn(SpawnRule)
  end)
end

function BP_DefenceComponent_C:TryDefenceProEnd()
  DebugPrint("DefenceProComponent: \229\188\128\229\144\175\230\163\128\230\181\139\229\137\169\228\189\153\230\128\170\232\174\161\230\151\182!")
  self:AddTimer(2, self.CheckMonsterNum, true, 0, "DefenceProEnd")
end

function BP_DefenceComponent_C:CheckMonsterNum()
  DebugPrint("DefenceProComponent: \230\163\128\230\181\139\229\137\169\228\189\153\230\128\170\232\174\161\230\151\182\239\188\140\229\137\169\228\189\153\230\149\176\233\135\143\239\188\154" .. self.GameMode.EMGameState.MonsterNum)
  if self.GameMode.EMGameState.MonsterNum > 0 then
    return
  end
  self:RemoveTimer("DefenceProEnd")
  self.GameMode:TriggerGameModeEvent("OnDefenceProEnd")
end

return BP_DefenceComponent_C
