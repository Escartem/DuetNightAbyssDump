local ShowOrHideTaskIndicatorNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function ShowOrHideTaskIndicatorNode:Init()
  self.IsShow = nil
  self.GuideType = nil
  self.GuideName = nil
  self.GuideRadius = nil
end

function ShowOrHideTaskIndicatorNode:Start(Context)
  self.Context = Context
  self:ShowOrHideIndicator()
end

function ShowOrHideTaskIndicatorNode:ShowOrHideIndicator()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local OwnerQuestId = self.QuestData.QuestId
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.InSpecialQuest and 0 == self.QuestData.QuestId then
    local CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
    if Avatar.QuestChains[CurTrackingQuestChaindId] and Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId then
      local DoingQuestId = Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId
      OwnerQuestId = DoingQuestId
    end
  end
  if self.IsShow then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  else
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  self:FinishAction()
end

function ShowOrHideTaskIndicatorNode:FinishAction()
  self:Finish()
end

function ShowOrHideTaskIndicatorNode:ClearWhenQuestSuccess()
  if self.IsShow then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

function ShowOrHideTaskIndicatorNode:ClearWhenQuestFail()
  if self.IsShow then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

return ShowOrHideTaskIndicatorNode
