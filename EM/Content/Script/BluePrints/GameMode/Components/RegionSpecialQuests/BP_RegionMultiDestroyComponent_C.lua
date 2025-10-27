require("UnLua")
local BP_RegionMultiDestroyComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_RegionMultiDestroyComponent_C:InitRegionMultiDestroyComponent()
  DebugPrint("RegionMultiDestroyComponent: Init!")
  self.GameMode = self:GetOwner()
end

function BP_RegionMultiDestroyComponent_C:SetProgressUIState(UIIndex, NewState)
  local ProgressUI = UIManager(self):GetUIObj("RegionMultiDestroyProgress")
  if ProgressUI then
    ProgressUI:SetPointState(UIIndex, NewState)
  end
end

return BP_RegionMultiDestroyComponent_C
