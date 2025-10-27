require("UnLua")
local BP_RegionDefenceProComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_RegionDefenceProComponent_C:InitRegionDefenceProComponent()
  DebugPrint("RegionDefenceProComponent: Init!")
  self.GameMode = self:GetOwner()
end

return BP_RegionDefenceProComponent_C
