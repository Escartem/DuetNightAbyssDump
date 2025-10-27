local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local ActorId = Params.ActorId
  local State = Params.State
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("SitOrStand create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActorData = TalkContext:GetTalkActorData(TalkTask, ActorId)
  if not TalkActorData then
    local Message = string.format("SitOrStand create failed: TalkActorData not found, ActorId: %d, DialogueId: %d", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkActor = TalkActorData.TalkActor
  if not IsValid(TalkActor) then
    local Message = string.format("SitOrStand create failed: TalkActor not found, ActorId: %d, DialogueId: %d", ActorId, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SitOrStandNode = Flow:CreateNode(UEFNode_Delegate)
  SitOrStandNode.DebugLog = string.format("SitOrStand ActorId: %s, State: %s", ActorId, State)
  SitOrStandNode.OnStart:Add(SitOrStandNode, function(Node)
    TalkContext.TalkActionManager:RecordNpcPlayAction(TalkTask, TalkActor)
    
    local function CallBackFunc()
      if IsValid(Node) and Node:GetCurrentState() == EExecutionFlowNodeState.Running then
        Node:Finish({
          Node.FinishPin
        })
      end
    end
    
    if "Sit" == State then
      TalkActor:SetSitPoseInteractive(CallBackFunc, false)
    elseif "Stand" == State then
      TalkActor:SetIdlePose(true, CallBackFunc)
    end
  end)
  SitOrStandNode.OnFinish:Add(SitOrStandNode, function(Node)
  end)
  SitOrStandNode.OnSkip:Add(SitOrStandNode, function(Node)
    if "Sit" == State then
      TalkActor:SetSitPoseInteractive(nil, true)
    elseif "Stand" == State then
      TalkActor:SetIdlePose(false, nil)
    end
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SitOrStandNode
end

return M
