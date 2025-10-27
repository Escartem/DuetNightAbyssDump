local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local ActorId = Params.ActorId
  local AnimationId = Params.AnimationId
  local Duration = Params.Duration or 0
  local bSync = Params.Sync or false
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("PlayAnim create failed: TalkContext not found, DialogueId: %s", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActorData = TalkContext:GetTalkActorData(TalkTask, ActorId)
  if not TalkActorData then
    local Message = string.format("PlayAnim create failed: TalkActorData not found, ActorId: %s, DialogueId: %s", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActor = TalkActorData.TalkActor
  if not IsValid(TalkActor) then
    local Message = string.format("PlayAnim create failed: TalkActor \230\151\160\230\149\136\239\188\140\233\156\128\232\166\129\231\168\139\229\186\143\230\142\146\230\159\165\229\164\177\230\149\136\229\142\159\229\155\160, ActorId: %s, DialogueId: %s", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActionData = TalkContext:GetTalkActionData(ActorId, AnimationId)
  if not TalkActionData then
    local Message = string.format("PlayAnim create failed: TalkActionData not found, ActorId: %s, AnimationId: %s, DialogueId: %s", ActorId, AnimationId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local DurationHandle
  local PlayAnimationNode = Flow:CreateNode(UEFNode_Delegate)
  PlayAnimationNode.DebugLog = string.format("PlayAnim ActorId: %s, AnimationId: %s, Duration: %s", ActorId, AnimationId, Duration)
  PlayAnimationNode.OnStart:Add(PlayAnimationNode, function(Node)
    TalkContext.TalkActionManager:RecordNpcPlayAction(TalkTask, TalkActor)
    TalkContext.TalkActionManager:PlayTalkAction(TalkActor, ActorId, TalkActionData, TalkContext, TalkTask, nil, bSync, TalkTask.IgnoreActionMontageBlendInTime)
    if Duration <= 0 then
      Node:Finish({
        Node.FinishPin
      })
    else
      DurationHandle = UKismetSystemLibrary.K2_SetTimerDelegate({
        Node,
        function()
          Node:Finish({
            Node.FinishPin
          })
        end
      }, Duration, false)
    end
  end)
  PlayAnimationNode.OnFinish:Add(PlayAnimationNode, function(Node)
    if DurationHandle then
      UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(Node, DurationHandle)
      DurationHandle = nil
    end
  end)
  PlayAnimationNode.OnSkip:Add(PlayAnimationNode, function(Node)
    if TalkActionData.IsOnceAction then
      TalkActor:StopTalkAction(TalkActionData.TalkActionId)
    end
    Node:Finish({
      Node.FinishPin
    })
  end)
  return PlayAnimationNode
end

return M
