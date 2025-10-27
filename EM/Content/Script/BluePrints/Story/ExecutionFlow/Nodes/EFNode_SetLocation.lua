local ETalkVisibility = {Show = "Show", Hide = "Hide"}
local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local ActorId = Params.ActorId
  local TargetPointName = Params.TargetPoint
  local Visibility = Params.Visibility or ETalkVisibility.Show
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("SetLocation create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActorData = TalkContext:GetTalkActorData(TalkTask, ActorId)
  if not TalkActorData then
    local Message = string.format("SetLocation create failed: TalkActorData not found, DialogueId: %d, ActorId: %d", Flow.DialogueId, ActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActor = TalkActorData.TalkActor
  if not IsValid(TalkActor) then
    local Message = string.format("SetLocation create failed: TalkActor not found, DialogueId: %d, ActorId: %d", Flow.DialogueId, ActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local GameState = UGameplayStatics.GetGameState(Flow)
  if not IsValid(GameState) then
    local Message = string.format("SetLocation create failed: GameState not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TargetPoint = GameState:GetTargetPoint(TargetPointName)
  if not IsValid(TargetPoint) then
    local Message = string.format("SetLocation create failed: TargetPoint not found, DialogueId: %d, PointName: %s", Flow.DialogueId, TargetPointName)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SetLocationNode = Flow:CreateNode(UEFNode_Delegate)
  SetLocationNode.DebugLog = string.format("SetLocation ActorId: %s, TargetPointName: %s, Visibility: %s", ActorId, TargetPointName, Visibility)
  SetLocationNode.OnStart:Add(SetLocationNode, function(Node)
    if Visibility == ETalkVisibility.Show then
      TalkContext:ShowActor(TalkActorData, true, true)
    else
      TalkContext:HideActor(TalkActorData, true, true)
    end
    local ResLoc = TargetPoint:K2_GetActorLocation()
    local TargetPointLoc = TargetPoint:K2_GetActorLocation() + FVector(0, 0, 10)
    local HalfHeight = TalkActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    local EndLoc = TargetPointLoc - FVector(0, 0, 1000)
    local HitResult = FHitResult()
    local bHit = UE4.UKismetSystemLibrary.LineTraceSingle(GWorld.GameInstance, TargetPointLoc, EndLoc, ETraceTypeQuery.TraceScene, false, nil, 0, HitResult, true)
    if bHit then
      ResLoc = FVector(TargetPointLoc.X, TargetPointLoc.Y, HitResult.ImpactPoint.Z + HalfHeight)
    end
    TalkActor:K2_SetActorLocation(ResLoc, false, nil, false)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetLocationNode
end

return M
