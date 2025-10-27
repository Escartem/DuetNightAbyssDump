require("UnLua")
local BP_FallTrigger_C = Class("BluePrints.Common.TimerMgr")

function BP_FallTrigger_C:Initialize(Initializer)
  self.InRange = false
end

function BP_FallTrigger_C:ReceiveBeginPlay()
  if IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:AddFallTriggerInfo(self)
  end
end

function BP_FallTrigger_C:ReceiveEndPlay()
  if IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:RemoveFallTriggerInfo(self)
  end
end

function BP_FallTrigger_C:OnOverlapActor(OtherActor, OtherComponent)
  if not self.Active or UE4.UKismetMathLibrary.ClassIsChildOf(OtherComponent:GetClass(), UInteractiveBaseComponent:StaticClass()) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if not OtherActor.IsCharacter then
    print(_G.LogTag, "Error: FallTrigger \232\167\166\229\143\145\229\136\176\228\186\134\230\178\161\230\156\137IsCharacter()\231\154\132\228\184\156\232\165\191, \230\173\164\231\137\169\228\184\141\229\156\168ActorType\232\140\131\231\149\180\229\134\133", OtherActor:GetName())
  end
  if OtherActor.IsCharacter and not OtherActor:IsCharacter() and not OtherActor:Cast(UE4.APickupBase) then
    return
  end
  if self.Reborn:Length() > 0 then
    local Transform = self:GetNearestTransformByReborn(OtherActor:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(OtherActor, Transform, self.MaxDis, self.DefaultEnable, self)
  else
    local ResComponent = self:GetNearestComponentTransform(OtherActor:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(OtherActor, ResComponent:K2_GetComponentToWorld(), self.MaxDis, self.DefaultEnable, self)
  end
end

function BP_FallTrigger_C:OverlapChangeNotify(bIsOverlapNow)
  EventManager:FireEvent(EventID.EdgeFalltrigerChangeOverlapState, bIsOverlapNow)
end

function BP_FallTrigger_C:VignetteBegin(Player, Component)
  self.InRange = true
  if not Player.InEdgeTimer then
    Player.InEdgeTimer = true
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_LEAVE_EDGE"))
    self:AddTimer(2, self.MovePlayerEdge, true, 0, "MovePlayerEdge", nil, Player)
  end
end

function BP_FallTrigger_C:VignetteEnd(Player, Component)
  self.InRange = false
  Player.InEdgeTimer = false
  self:RemoveTimer("MovePlayerEdge")
end

function BP_FallTrigger_C:MovePlayerEdge(Player)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if not self.InRange then
    return
  end
  if self.Reborn:Length() > 0 then
    local Transform = self:GetNearestTransformByReborn(Player:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(Player, Transform, self.MaxDis, true, self)
  else
    local ResComponent = self:GetNearestComponentTransform(Player:K2_GetActorLocation())
    GameMode:TriggerFallingCallable(Player, ResComponent:K2_GetComponentToWorld(), self.MaxDis, true, self)
  end
  if self.InRange then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_LEAVE_EDGE"))
  end
end

return BP_FallTrigger_C
