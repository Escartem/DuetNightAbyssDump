local BP_DefenceMoveComponent_C = Class({
  "BluePrints.GameMode.DungeonComponents.BP_DefenceComponent_C"
})

function BP_DefenceMoveComponent_C:InitDefenceMoveComponent()
  self:InitDefenceComponent()
end

function BP_DefenceMoveComponent_C:GetDataMgrInfo()
  return DataMgr.DefenceMove[self.GameMode.DungeonId]
end

return BP_DefenceMoveComponent_C
