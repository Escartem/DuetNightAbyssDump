local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local TargetPointName = Params.TargetPoint
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("SetPlayerLoc create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SetPlayerLocNode = Flow:CreateNode(UEFNode_Delegate)
  SetPlayerLocNode.DebugLog = string.format("SetPlayerLoc TargetPointName: %s", TargetPointName)
  SetPlayerLocNode.OnStart:Add(SetPlayerLocNode, function(Node)
    TalkContext:SetPlayerLocWithLoadLevel(TargetPointName, function()
      Node:Finish({
        Node.FinishPin
      })
    end)
  end)
  SetPlayerLocNode.OnFinish:Add(SetPlayerLocNode, function(Node)
  end)
  SetPlayerLocNode.OnSkip:Add(SetPlayerLocNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetPlayerLocNode
end

return M
