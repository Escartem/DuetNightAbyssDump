local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local MaterialInstance = Params.MaterailInstance
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("PostProcess create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local PostProcessNode = Flow:CreateNode(UEFNode_Delegate)
  PostProcessNode.DebugLog = string.format("PostProcess MaterialInstance: %s", MaterialInstance)
  PostProcessNode.OnStart:Add(PostProcessNode, function(Node)
    TalkContext.TalkCameraManager:SetPostProcess(MaterialInstance)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return PostProcessNode
end

return M
