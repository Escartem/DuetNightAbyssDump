require("UnLua")
local BP_SabotageProComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_SabotageProComponent_C:InitSabotageProComponent()
  self.GameMode = self:GetOwner()
  self.SabotageProInfo = DataMgr.SabotagePro[self.GameMode.DungeonId]
  if not self.SabotageProInfo then
    GameState(self):ShowDungeonError("SabotageProComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonsterSpawnId1:Clear()
  for _, SpawnId in pairs(self.SabotageProInfo.MonsterSpawnIds or {}) do
    self.MonsterSpawnId1:Add(SpawnId)
  end
  DebugPrint("BP_SabotageProComponent_C InitSabotageProComponent")
end

function BP_SabotageProComponent_C:InitSabotageProBaseInfo()
end

function BP_SabotageProComponent_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  if "SabotageMonsterGuide" == EventName then
    DebugPrint("BP_SabotageProComponent_C OnStaticCreatorEvent Eid", Eid, "UnitId", UnitId)
  end
end

return BP_SabotageProComponent_C
