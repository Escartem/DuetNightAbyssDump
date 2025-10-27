local FExpressionData = require("BluePrints.Story.Talk.Model.ExpressionData").ExpressionData_C
local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local ActorId = tonumber(Params.ActorId)
  local FacialId = tostring(Params.FacialId)
  local Duration = tonumber(Params.Duration or 0)
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("PlayFacial create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActorData = TalkContext:GetTalkActorData(TalkTask, ActorId)
  if not TalkActorData then
    local Message = string.format("PlayFacial create failed: TalkActorData not found, ActorId: %d, DialogueId: %d", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActor = TalkActorData.TalkActor
  if not IsValid(TalkActor) then
    local Message = string.format("PlayFacial create failed: TalkActor not found, ActorId: %d, DialogueId: %d", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local FacialData = DataMgr.Facial[FacialId]
  if not FacialData then
    local Message = string.format("PlayFacial create failed: FacialData not found, ActorId: %d, FacialId: %s, DialogueId: %d", ActorId, FacialId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local ExpressionData = FExpressionData.New(FacialId)
  if not ExpressionData then
    local Message = string.format("PlayFacial create failed: ExpressionData not created, ActorId: %d, FacialId: %s, DialogueId: %d", ActorId, FacialId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local DurationHandle
  local PlayFacialNode = Flow:CreateNode(UEFNode_Delegate)
  PlayFacialNode.DebugLog = string.format("PlayFacial ActorId: %s, FacialId: %s", ActorId, FacialId)
  PlayFacialNode.OnStart:Add(PlayFacialNode, function(Node)
    TalkTask.ExpressionComp:PlayFacialAnimation(TalkActor, ExpressionData, TalkContext, TalkTask)
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
  PlayFacialNode.OnFinish:Add(PlayFacialNode, function(Node)
    if DurationHandle then
      UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(Node, DurationHandle)
      DurationHandle = nil
    end
  end)
  PlayFacialNode.OnSkip:Add(PlayFacialNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return PlayFacialNode
end

return M
