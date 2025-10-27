local Questline = require("StoryCreator.StoryLogic.StorylineNodes.Questline.Questline")
local PreStoryNode = Class("StoryCreator.StoryLogic.StorylineNodes.Node")

function PreStoryNode:Start(Context, NodeId)
  self.Questline = Questline(self.Data, Context, self)
  self.Questline:StartQuest(NodeId)
end

function PreStoryNode:FinishQuest(OutPortName, bSucceeded)
  self.Questline = nil
  self:Finish(OutPortName, bSucceeded)
end

function PreStoryNode:StopQuest()
  self.Questline:StopQuest()
  self.Questline = nil
end

function PreStoryNode:SuccessQuest()
  self.Questline:SuccessQuest()
  self.Questline = nil
end

function PreStoryNode:PrintInfo()
  self.Questline:PrintInfo()
end

function PreStoryNode:ToString()
  local NameStr = self.Name or "invalid_name"
  local TypeStr = self.Type or "invalid_type"
  local QuestChainIdStr = self.Context and self.Context.QuestChainId or "invalid_questchainid"
  local QuestIdStr = self.QuestId or "invalid_questid"
  local QuestDesc = self.QuestDescription or "invalid_questdescription"
  local KeyStr = self.Key or "invalid_key"
  return NameStr .. "  " .. TypeStr .. "  " .. QuestChainIdStr .. "  " .. QuestIdStr .. "  " .. QuestDesc .. "  " .. KeyStr
end

function PreStoryNode:GetChildNodes()
  local Questline = self.Questline or Questline(self.Data, self.Context, self)
  return Questline:GetNodes()
end

function PreStoryNode:StopStory()
  self.Context:StopStory()
end

function PreStoryNode:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  if self.Type == NodeType then
    table.insert(OutRunningNodeTable, self)
  end
  if self.Questline then
    self.Questline:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  end
end

return PreStoryNode
