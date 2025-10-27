local SetGlobalSoundParamNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SetGlobalSoundParamNode:Init()
  self.ParamName = ""
  self.ParamValue = 0.0
end

function SetGlobalSoundParamNode:Start(Context)
  DebugPrint("-----------------------------------SetGlobalSoundParamNode-----------------------------------")
  DebugPrint(self.ParamName, self.ParamValue)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):StoreGlobalParam(self.ParamName)
  AudioManager(GameInstance):SetGlobalSoundParam(self.ParamName, self.ParamValue)
  self:FinishAction()
end

function SetGlobalSoundParamNode:FinishAction()
  self:Finish()
end

function SetGlobalSoundParamNode:OnQuestlineFail()
  DebugPrint("SetGlobalSoundParamNode Fail")
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):RecoverGlobalParam()
end

function SetGlobalSoundParamNode:OnQuestlineSuccess()
  DebugPrint("SetGlobalSoundParamNode Success")
  local GameInstance = GWorld.GameInstance
  AudioManager(GameInstance):ClearGlobalParam()
end

return SetGlobalSoundParamNode
