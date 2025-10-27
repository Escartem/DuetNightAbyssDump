local QuestFailNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")
QuestFailNode.IsFailNode = true

function QuestFailNode:OnQuestlineFinish()
  DebugPrint("----------------------------------------------------------QuestFailNode:OnQuestlineFinish", self:ToString())
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if self.QuestChainId > 0 and self.QuestId > 0 and Avatar and GameMode then
    print(_G.LogTag, " ----- OnQuestlineFinish -----", self.QuestChainId, self.QuestId)
    local TaskInfo = {
      TaskChainId = self.QuestChainId,
      TaskId = self.QuestId,
      IsChainLastTask = self.bIsEndQuest,
      IsChapterEnd = self.bIsEndChapter
    }
    Avatar:DoRefreshTaskItemUIInfo("Add", TaskInfo)
    GameMode:RecoverDataByQuestChainId(self.QuestChainId, self.QuestId)
  end
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):RecoverLastSTLBGM()
  return
end

return QuestFailNode
