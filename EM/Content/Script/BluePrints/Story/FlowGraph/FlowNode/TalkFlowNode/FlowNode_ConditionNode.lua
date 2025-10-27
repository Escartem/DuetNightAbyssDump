local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")

function M:Start()
  if 0 == self.ConditionList:Num() then
    self:FinishToDefault()
    return
  end
  local bHandled = false
  for Index = 1, self.ConditionList:Num() do
    if FTalkTriggerComponent:CheckFlowCondition(self.NodeGuid, Index) then
      self:SelectCondition(Index)
      bHandled = true
      break
    end
  end
  if not bHandled then
    self:FinishToDefault()
  end
end

function M:Skip()
end

function M:CanSkip()
  return true
end

function M:K2_Cleanup()
end

function M:SelectCondition(Index)
  self:FinishCondition(Index)
end

return M
