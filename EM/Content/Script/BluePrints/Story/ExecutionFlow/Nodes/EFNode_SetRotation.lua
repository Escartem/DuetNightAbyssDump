local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local RotationDescription = Params.SetRotationDescription
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("SetLocation create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SetRotationNode = Flow:CreateNode(UEFNode_Delegate)
  SetRotationNode.DebugLog = string.format("SetRotation RotationDescription: %s", RotationDescription)
  SetRotationNode.OnStart:Add(SetRotationNode, function(Node)
    TalkContext.TalkActionManager:SyncSetActorRotation(TalkTask, TalkContext, RotationDescription, function()
    end)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetRotationNode
end

return M
