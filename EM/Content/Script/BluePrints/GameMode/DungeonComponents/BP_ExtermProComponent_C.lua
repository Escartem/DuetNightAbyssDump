require("UnLua")
local BP_ExtermProComponent_C = Class({
  "BluePrints.GameMode.DungeonComponents.BP_ExterminateComponent_C"
})

function BP_ExtermProComponent_C:InitExtermProComponent()
  self:InitExterminateBaseComponent()
  if self.ExterminateInfo then
    self.OnInitSpawnRule:Clear()
    for _, SpawnId in pairs(self.ExterminateInfo.OnInitSpawnRule or {}) do
      self.OnInitSpawnRule:Add(SpawnId)
    end
  else
    GameState(self):ShowDungeonError("ExtermProComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
  end
end

function BP_ExtermProComponent_C:InitExtermProBaseInfo()
  self:InitGuideUpdateTimerLogic()
end

function BP_ExtermProComponent_C:GetDataMgrInfo()
  return DataMgr.ExtermPro[self.GameMode.DungeonId]
end

function BP_ExtermProComponent_C:OnEliteNumClear()
  self.GameMode:TriggerGameModeEvent("Event_OnEliteNumClear")
end

return BP_ExtermProComponent_C
