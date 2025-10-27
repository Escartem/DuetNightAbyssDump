local EDialogueNodeType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueNodeType
local M = {}
local DialogueNodeChain = {}

function M:OnNodeRecord(Node, ...)
  DialogueNodeChain = DialogueNodeChain or {}
  if Node.NodeType == EDialogueNodeType.Start then
    local DialogueId = Node.NextDialogueId
    if DataMgr.DialogueCurrentNode2PreNode[DialogueId] then
      DialogueNodeChain = {}
      table.insert(DialogueNodeChain, DialogueId)
    end
  elseif Node.NodeType == EDialogueNodeType.Option and Node.IsImpression then
    local OptionId = (...)
    table.insert(DialogueNodeChain, OptionId)
  end
  self.DialogueNodeChain = DialogueNodeChain or {}
end

return M
