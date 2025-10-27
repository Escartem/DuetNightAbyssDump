local BP_RegionCaptureComponent_C = Class()

function BP_RegionCaptureComponent_C:InitRegionCaptureComponent()
  DebugPrint("RegionCaptureComponent: Init!")
  self.GameMode = self:GetOwner()
end

return BP_RegionCaptureComponent_C
