local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.Eid2TickInterval = {}
end

function M:OnActorOverlap(OtherActor, TriggerType)
  if OtherActor.InitSuccess then
    local InteractiveComponent = OtherActor:GetComponentByClass(UInteractiveTriggerComponent)
    if InteractiveComponent then
      if "BeginOverlap" == TriggerType then
        self.Eid2TickInterval[OtherActor.Eid] = InteractiveComponent:GetComponentTickInterval()
        InteractiveComponent:SetComponentTickInterval(self.TargetInterval)
        DebugPrint("BP_AOITriggerBox_PickupEnhance_C SetComponentTickInterval Begin", self.TargetInterval)
      elseif "EndOverlap" == TriggerType then
        InteractiveComponent:SetComponentTickInterval(self.Eid2TickInterval[OtherActor.Eid])
        DebugPrint("BP_AOITriggerBox_PickupEnhance_C SetComponentTickInterval End", self.Eid2TickInterval[OtherActor.Eid])
        self.Eid2TickInterval[OtherActor.Eid] = nil
      end
    end
  end
end

function M:CheckCanTrigger(TriggerActor)
  return true
end

return M
