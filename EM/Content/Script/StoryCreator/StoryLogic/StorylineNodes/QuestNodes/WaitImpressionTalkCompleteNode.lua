local WaitImpressionTalkCompleteNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitImpressionTalkCompleteNode:Init()
  self.ImpressionTalkTriggerId = nil
  self.bShowGuide = nil
  self.NPCStaticCreaterName = nil
  self.GuideType = ""
  self.GuideStaticCreatorId = 0
  self.QuestHintId = 0
  self.QuestType = "NpcNode"
  self.ListenInterval = 0.5
end

function WaitImpressionTalkCompleteNode:Execute(Callback)
  self.NpcId = self.GuideStaticCreatorId
  if self.bShowGuide then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
  GWorld.StoryMgr:RegisterWaitTalkCompleted(self.ImpressionTalkTriggerId, self.Context.QuestChainId, self:GetPayload("SpecialQuestId"), self:GetPayload("DynQuestId"), self.bShowGuide)
  self.ListenTimer = GWorld.GameInstance:AddTimer(self.ListenInterval, function()
    local Avatar = GWorld:GetAvatar()
    if nil == Avatar then
      return
    end
    if Avatar:IsStorylineComplete(self.ImpressionTalkTriggerId) then
      Callback()
    end
  end, true)
end

function WaitImpressionTalkCompleteNode:Clear()
  if self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
  if self.bShowGuide then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  GWorld.StoryMgr:UnRegisterWaitTalkCompleted(self.ImpressionTalkTriggerId)
end

return WaitImpressionTalkCompleteNode
