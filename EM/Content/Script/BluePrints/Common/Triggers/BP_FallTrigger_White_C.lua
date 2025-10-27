require("UnLua")
local BP_FallTrigger_White_C = Class("BluePrints.Common.Triggers.BP_FallTrigger_C")

function BP_FallTrigger_White_C:ReceiveBeginPlay()
  if IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:AddFallTriggerInfo(self)
  end
  self:InitTriggerFallingScreenColor()
end

function BP_FallTrigger_White_C:InitTriggerFallingScreenColor()
  if not self.TriggerFallingScreenColor then
    self.TriggerFallingScreenColor = {Black = "Black", White = "White"}
  end
end

function BP_FallTrigger_White_C:OnOverlapActor(OtherActor, OtherComponent)
  if not self.Active or UE4.UKismetMathLibrary.ClassIsChildOf(OtherComponent:GetClass(), UInteractiveBaseComponent:StaticClass()) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if OtherActor.IsCharacter and not OtherActor:IsCharacter() and not OtherActor:Cast(UE4.APlayerCharacter) then
    return
  end
  if self.Reborn:Length() > 0 then
    local Transform = self:GetNearestTransformByReborn(OtherActor:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(OtherActor, Transform, self.MaxDis, self.DefaultEnable, self, self.TriggerFallingScreenColor.White)
  else
    local ResComponent = self:GetNearestComponentTransform(OtherActor:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(OtherActor, ResComponent:K2_GetComponentToWorld(), self.MaxDis, self.DefaultEnable, self, self.TriggerFallingScreenColor.White)
  end
end

return BP_FallTrigger_White_C
