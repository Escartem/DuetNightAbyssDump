require("UnLua")
local BP_FallTrigger_Client_C = Class("BluePrints.Common.TimerMgr")

function BP_FallTrigger_Client_C:ReceiveBeginPlay()
  if IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:AddFallTriggerInfo(self)
  end
end

function BP_FallTrigger_Client_C:ReceiveEndPlay()
  if IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:RemoveFallTriggerInfo(self)
  end
end

function BP_FallTrigger_Client_C:OnOverlapActor(OtherActor, OtherComponent)
  if not self.Active or UE4.UKismetMathLibrary.ClassIsChildOf(OtherComponent:GetClass(), UInteractiveBaseComponent:StaticClass()) then
    return
  end
  if not OtherActor.IsCharacter then
    print(_G.LogTag, "Error: FallTrigger \232\167\166\229\143\145\229\136\176\228\186\134\230\178\161\230\156\137IsCharacter()\231\154\132\228\184\156\232\165\191, \230\173\164\231\137\169\228\184\141\229\156\168ActorType\232\140\131\231\149\180\229\134\133", OtherActor:GetName())
  end
  if OtherActor.IsCharacter and not OtherActor:IsCharacter() and not OtherActor:Cast(UE4.APickupBase) then
    return
  end
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    if not IsClient(self) and not IsStandAlone(self) then
      return
    end
    local Transform = self:GetTransformParam(OtherActor)
    OtherActor.RPCComponent:TriggerGameModeFalling(OtherActor, Transform, self.MaxDis, self.DefaultEnable, self)
  elseif IsAuthority(self) then
    local Transform = self:GetTransformParam(OtherActor)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if not GameMode then
      return
    end
    GameMode:TriggerFallingCallable(OtherActor, Transform, self.MaxDis, self.DefaultEnable, self)
  end
end

function BP_FallTrigger_Client_C:GetTransformParam(OtherActor)
  local Transform
  if self.Reborn:Length() > 0 then
    Transform = self:GetNearestTransformByReborn(OtherActor:K2_GetActorLocation())
  else
    local ResComponent = self:GetNearestComponentTransform(OtherActor:K2_GetActorLocation())
    Transform = ResComponent:K2_GetComponentToWorld()
  end
  return Transform
end

function BP_FallTrigger_Client_C:OverlapChangeNotify(bIsOverlapNow)
  EventManager:FireEvent(EventID.EdgeFalltrigerChangeOverlapState, bIsOverlapNow)
end

return BP_FallTrigger_Client_C
