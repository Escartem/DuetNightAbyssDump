require("UnLua")
local M = Class()

function M:CreateFlow(FlowName)
  local FlowData = DataMgr.GameFlow[FlowName]
  assert(FlowData, "FlowData not found for FlowName: " .. tostring(FlowName))
  local ResponsesData = DataMgr.GameFlowChannelResponses[FlowData.Channel]
  assert(ResponsesData, "ResponsesData not found for Channel: " .. tostring(FlowData.Channel))
  local Flow = NewObject(UGameFlow, self)
  assert(IsValid(Flow), "Failed to create UGameFlow instance for FlowName: " .. tostring(FlowName))
  Flow:SetChannel(FlowData.Channel)
  Flow:SetPriority(FlowData.Priority)
  for Key, Value in pairs(ResponsesData) do
    if "Channel" ~= Key then
      if "Ignore" == Value then
        Flow:AddResponse(Key, EGameFlowResponse.Ignore)
      elseif "Overlap" == Value then
        Flow:AddResponse(Key, EGameFlowResponse.Overlap)
      elseif "Block" == Value then
        Flow:AddResponse(Key, EGameFlowResponse.Block)
      end
    end
  end
  return Flow
end

return M
