local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local Tag = Params.Tag
  local Value = Params.Value
  local SetTagNode = Flow:CreateNode(UEFNode_Delegate)
  SetTagNode.DebugLog = string.format("SetTag Tag: %s, Value: %s", Tag, Value)
  SetTagNode.OnStart:Add(SetTagNode, function(Node)
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    Avatar:SetTalkTag(Tag, Value)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetTagNode
end

return M
