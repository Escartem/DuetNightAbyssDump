local ShowGuideTextNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
ShowGuideTextNode._components = {
  "StoryCreator.StoryLogic.StorylineNodes.QuestNodes.GuideNodeComp"
}

function ShowGuideTextNode:Init()
  self.MessageId = 0
  self.IsTimePause = true
  self.GuideManPosEnum = nil
  self.GuidemanHead = ""
  self.IsResetPlayer = false
  self.IsForbidInAnim = false
  self.IsForbidOutAnim = false
end

function ShowGuideTextNode:Start(Context)
  if self.Context.IsFail and UE4.UKismetSystemLibrary.GetFrameCount() == self.Context.FrameCount then
    self:FinishAction()
    return
  end
  self.Context = Context
  self:ShowMessage(self.Context)
end

function ShowGuideTextNode:ShowMessage(Context)
  DebugPrint("------------ ShowGuideTextNode ------------------")
  local GameInstance = GWorld.GameInstance
  self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideTextBox(GameInstance, self.MessageId, self.IsTimePause, self.GuidemanHead, self.GuideManPosEnum, self.IsResetPlayer, self.IsForbidInAnim, self.IsForbidOutAnim)
  self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
    self:FinishAction()
  end)
end

function ShowGuideTextNode:FinishAction()
  self:Finish()
end

function ShowGuideTextNode:Clear()
  if self.UIStateAsyncActionBase and self.UIStateAsyncActionBase.OnGuideEnd:IsBound() then
    self.UIStateAsyncActionBase.OnGuideEnd:Clear()
  end
end

AssembleComponents(ShowGuideTextNode)
return ShowGuideTextNode
