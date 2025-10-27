require("UnLua")
local BP_InteractiveTriggerComponent_C = Class()

function BP_InteractiveTriggerComponent_C:OnTalkLocked(bIsLocked)
  self:SetIsCanTrigger(not bIsLocked)
end

function BP_InteractiveTriggerComponent_C:SetInteractiveTriggerDistance(NewDistance)
  self:SetSphereRadius(NewDistance, true)
end

function BP_InteractiveTriggerComponent_C:GetInteractiveTriggerDistance()
  return self.SphereRadius
end

return BP_InteractiveTriggerComponent_C
