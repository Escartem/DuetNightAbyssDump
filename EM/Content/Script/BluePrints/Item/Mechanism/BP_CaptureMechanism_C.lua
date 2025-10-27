require("UnLua")
local BP_CaptureMechanism_C = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function BP_CaptureMechanism_C:MonsterCapture(actor)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:BattleFinish(false)
  end
end

function BP_CaptureMechanism_C:ReceiveBeginPlay()
  self:SetCollisionType("CollisionComponent", "MonsterPawn", ECollisionResponse.ECR_OverLap, true)
  self.Overridden.ReceiveBeginPlay(self)
end

function BP_CaptureMechanism_C:ReceiveActorBeginOverlap(OtherActor)
  if not IsAuthority(self) then
    return
  end
  if OtherActor:HasAnyTags_Table(OtherActor, {
    "Mon.Capture"
  }, false) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:TriggerGameModeEvent("OnCaptureTargetEscaped", OtherActor)
  end
end

return BP_CaptureMechanism_C
