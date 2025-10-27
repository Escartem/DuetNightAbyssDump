local InterruptTalkNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function InterruptTalkNode:Init()
  self.FirstDialogueId = 0
end

function InterruptTalkNode:Execute()
  DebugPrint("InterruptTalkNode:Execute", self.FirstDialogueId)
  local TS = TalkSubsystem()
  if not TS then
    DebugPrint("\232\142\183\229\143\150TalkSubsystem\229\164\177\232\180\165")
    return
  end
  TalkSubsystem():ForceInterruptTalkTaskData(function(TaskData)
    return TaskData.FirstDialogueId == self.FirstDialogueId
  end)
end

return InterruptTalkNode
