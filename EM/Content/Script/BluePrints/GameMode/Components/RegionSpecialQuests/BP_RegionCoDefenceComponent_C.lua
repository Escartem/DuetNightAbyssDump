local BP_RegionCoDefenceComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_RegionCoDefenceComponent_C:InitRegionCoDefenceComponent()
  DebugPrint("RegionCoDefenceComponent: Init!")
  self.GameMode = self:GetOwner()
end

function BP_RegionCoDefenceComponent_C:ClearRegionCoDefenceComponent()
end

function BP_RegionCoDefenceComponent_C:SetProgressUIState(PointIndex, NewStateIndex, TimerHandleName)
  local ProgressUI = UIManager(self):GetUIObj("RegionCoDefenceProgress")
  if ProgressUI then
    ProgressUI:SetPointState(PointIndex, NewStateIndex, TimerHandleName)
  end
end

function BP_RegionCoDefenceComponent_C:UpdateProgressToTarget(PointIndex)
  local ProgressUI = UIManager(self):GetUIObj("RegionCoDefenceProgress")
  if ProgressUI then
    ProgressUI:UpdateWaterLevelTickTime()
    ProgressUI:UpdateProgressToTarget(PointIndex)
  end
end

return BP_RegionCoDefenceComponent_C
