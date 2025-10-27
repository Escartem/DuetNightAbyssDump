local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")

function M:OnTriggerFinish(PinName)
  DebugPrint("FlowNode:OnTriggerFinish")
  local TalkTask = self:TryGetTalkTask()
  if "In" ~= PinName then
    TalkTask:SetOutport(PinName)
  end
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  DialogueFlowGraphComponent:TryEndTalk(function()
    DebugPrint("FlowNode:OnTalkTaskRealFinish")
    self:Finish()
  end)
end

return M
