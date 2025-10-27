local BaseClientEvent = Class("StoryCreator.StoryLogic.StorylineNodes.NodeObject")

function BaseClientEvent:Init(...)
  self.State = "Inactive"
  self.Type = nil
  self:InitEvent(...)
end

function BaseClientEvent:StartEvent(...)
  self:OnStartEvent()
end

function BaseClientEvent:OnStartEvent(...)
end

function BaseClientEvent:TryActivateEvent(...)
end

function BaseClientEvent:OnActivateEvent(...)
end

function BaseClientEvent:TryFinishEvent(Result, Info)
end

function BaseClientEvent:OnFinishEvent(Result, Info)
  self:Destroy()
end

function BaseClientEvent:Destroy(Result, Info)
end

return BaseClientEvent
