require("UnLua")
local BP_DeliveryInteractiveComponent_C = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})
local BP_InteractiveBaseComponent_C = require("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
local TrainingDeliveryId = 900001

function BP_DeliveryInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Owner = self:GetOwner()
  if not Owner then
    return false
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState:GetMechanismInteractiveInSpecialQuest(Owner) then
    return false
  end
  return self.DistanceCheck(Owner, PlayerActor, self.InteractiveDistance) and self.BFaceToACheck(Owner, PlayerActor, self.InteractiveFaceAngle) and self.BFaceToACheck(PlayerActor, Owner, self.InteractiveAngle) and Owner.CanOpen
end

function BP_DeliveryInteractiveComponent_C:TriggerEnter(PlayerActor)
  self.Overridden.TriggerEnter(self, PlayerActor)
  self.OnInteractiveTriggerEnter:Broadcast(PlayerActor)
end

function BP_DeliveryInteractiveComponent_C:TriggerTick(PlayerActor)
  self.Overridden.TriggerTick(self, PlayerActor)
  self.OnInteractiveTriggerTick:Broadcast(PlayerActor)
end

function BP_DeliveryInteractiveComponent_C:TriggerExit(PlayerActor)
  self.Overridden.TriggerExit(self, PlayerActor)
  self.OnInteractiveTriggerExit:Broadcast(PlayerActor)
end

function BP_DeliveryInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  BP_InteractiveBaseComponent_C.NotDisplayInteractiveBtn(self, PlayerActor)
  if PlayerActor and PlayerActor.MechanismEid == self:GetOwner().Eid and not self:IsCanInteractive(PlayerActor) then
    self:EndPressInteractive(PlayerActor, false)
  end
end

function BP_DeliveryInteractiveComponent_C:StartInteractive(PlayerActor)
  local DeliveryMechanism = self:GetOwner():Cast(UE4.ADeliveryMechanism)
  if not DeliveryMechanism then
    return
  end
  if self:IsCanInteractive(PlayerActor) then
    PlayerActor:InteractiveMechanism(DeliveryMechanism.Eid, PlayerActor.Eid, self.NextStateId, self.CommonUIConfirmID, true)
  end
end

function BP_DeliveryInteractiveComponent_C:BtnPressed(PlayerActor)
end

function BP_DeliveryInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  self:StartInteractive(PlayerActor)
end

function BP_DeliveryInteractiveComponent_C:IsForbidden()
  if self:GetOwner().id ~= TrainingDeliveryId then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  local bIsInTeam = Avatar:IsInTeam()
  if bIsInTeam then
    self:SetOverridenFailMsg("UI_TRAINING_FAIL_INTEAM")
  else
    self:SetOverridenFailMsg(nil)
  end
  return bIsInTeam
end

function BP_DeliveryInteractiveComponent_C:OnClicked_Forbidden()
  self:InteractiveFailed()
end

return BP_DeliveryInteractiveComponent_C
