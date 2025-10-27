local QuestNode = Class("StoryCreator.StoryLogic.StorylineNodes.Node")

function QuestNode:BuildNode(NodeId, Data, ExtraInfo)
  QuestNode.Super.BuildNode(self, NodeId, Data, ExtraInfo)
  self.QuestData = ExtraInfo
end

function QuestNode:Execute(...)
end

function QuestNode:ToString()
  local NameStr = self.Name or "invalid_name"
  local TypeStr = self.Type or "invalid_type"
  local QuestChainIdStr = self.Context and self.Context.QuestChainId or "invalid_questchainid"
  local QuestIdStr = self.QuestId or "invalid_questid"
  local KeyStr = self.Key or "invalid_key"
  return NameStr .. "  " .. TypeStr .. "  " .. QuestChainIdStr .. "  " .. QuestIdStr .. "  " .. KeyStr
end

function QuestNode:OnQuestlineFinish()
end

function QuestNode:OnQuestlineSuccess()
end

function QuestNode:OnQuestlineFail()
end

function QuestNode:ClearWhenQuestSuccess()
  self:OnQuestlineFinish()
  self:OnQuestlineSuccess()
end

function QuestNode:ClearWhenQuestFail()
  self:OnQuestlineFinish()
  self:OnQuestlineFail()
end

function QuestNode:GetPayload(...)
  if self.Context and self.Context.Storyline then
    return self.Context.Storyline:GetPayload(...)
  else
    return nil
  end
end

return QuestNode
