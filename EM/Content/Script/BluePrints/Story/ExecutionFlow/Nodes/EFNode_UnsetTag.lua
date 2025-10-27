local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local Tag = Params.Tag
  local UnSetTagNode = Flow:CreateNode(UEFNode_Delegate)
  UnSetTagNode.DebugLog = string.format("UnsetTag Tag: %s", Tag)
  UnSetTagNode.OnStart:Add(UnSetTagNode, function(Node)
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    Avatar:UnSetTalkTag(Tag)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return UnSetTagNode
end

return M
