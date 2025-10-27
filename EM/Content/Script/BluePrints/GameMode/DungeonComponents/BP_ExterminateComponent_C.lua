require("UnLua")
local BP_ExterminateComponent_C = Class({
  "BluePrints.GameMode.DungeonComponents.BP_ExterminateBaseComponent_C"
})

function BP_ExterminateComponent_C:InitExterminateComponent()
  self:InitExterminateBaseComponent()
end

function BP_ExterminateComponent_C:InitExterminateBaseInfo()
  self:InitGuideUpdateTimerLogic()
end

function BP_ExterminateComponent_C:GetDataMgrInfo()
  return DataMgr.Exterminate[self.GameMode.DungeonId]
end

return BP_ExterminateComponent_C
