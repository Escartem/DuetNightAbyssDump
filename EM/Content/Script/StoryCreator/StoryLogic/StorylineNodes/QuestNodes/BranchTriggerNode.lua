local BranchTriggerNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function BranchTriggerNode:Init()
  self.Branches = nil
end

function BranchTriggerNode:OnDataUpdated()
  local OutputPort = {}
  for k, v in pairs(self.Branches) do
    table.insert(OutputPort, TriggerOutPort(string.format("Branch_%d", k)))
  end
end

function BranchTriggerNode:Start(Context)
  DebugPrint("------------ BranchTriggerNode Start------------------")
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  self.TalkContext = GameInstance:GetTalkContext()
  local BranchTriggerId = self.TalkContext:GetBranchTriggerId()
  local Index
  for i, v in ipairs(self.Branches) do
    if v == BranchTriggerId then
      Index = i
      break
    end
  end
  self:Finish(Index)
end

function BranchTriggerNode:Finish(OutPortIndex)
  DebugPrint("BranchTriggerNode finished", "Branch_", self, OutPortIndex)
  if OutPortIndex then
    BranchTriggerNode.Super.Finish(self, "Branch_" .. OutPortIndex)
  else
    BranchTriggerNode.Super.Finish(self)
  end
end

return BranchTriggerNode
