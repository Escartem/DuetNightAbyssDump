local SetSceneSoundPauseNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SetSceneSoundPauseNode:Init()
  self.PauseType = 0
  self.bPause = false
end

function SetSceneSoundPauseNode:Start(Context)
  DebugPrint("-----------------------------------SetSceneSoundPauseNode-----------------------------------")
  DebugPrint(self.PauseType, self.bPause)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):StoreTempBusState(self.PauseType)
  AudioManager(GameInstance):SetSoundPauseByBus(self.PauseType, self.bPause)
  self:FinishAction()
end

function SetSceneSoundPauseNode:FinishAction()
  self:Finish()
end

function SetSceneSoundPauseNode:OnQuestlineFail()
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):RecoverTempBusState()
end

function SetSceneSoundPauseNode:OnQuestlineSuccess()
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):ClearTempBusState()
end

return SetSceneSoundPauseNode
