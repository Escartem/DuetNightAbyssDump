local WaitQuestFinishedNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitQuestFinishedNode:Init()
  self.ListenCount = 1
  self.NeedFinishCount = 1
  self.FinishedInPortNames = {}
  self.FinishedInPortNameCount = 0
end

function WaitQuestFinishedNode:Execute(Callback)
  if self.FinishedInPortNames[self.InPortName] then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "STL\233\148\153\232\175\175", string.format("\232\138\130\231\130\185 %s Inport %s \233\135\141\229\164\141\232\191\155\229\133\165", self.Key, self.InPortName))
    return
  end
  self.FinishedInPortNames[self.InPortName] = true
  self.FinishedInPortNameCount = self.FinishedInPortNameCount + 1
  if self.FinishedInPortNameCount >= self.NeedFinishCount then
    Callback()
  else
    self.HasStarted = false
  end
end

function WaitQuestFinishedNode:Clear()
  self.FinishedInPortNames = {}
  self.FinishedInPortNameCount = 0
end

return WaitQuestFinishedNode
