local PlayNormalSoundNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function PlayNormalSoundNode:Init()
  self.EventPath = ""
  self.TargetPointName = ""
  self.EventKey = ""
  self.PlayAs2D = false
end

function PlayNormalSoundNode:Start(Context)
  DebugPrint("===============================PlayNormalSoundNode================================")
  DebugPrint("EventPath", self.EventPath, "TargetPointName", self.TargetPointName, "EventKey", self.EventKey, "PlayAs2D", self.PlayAs2D)
  local GameInstance = GWorld.GameInstance
  local TargetPoint
  if self.TargetPointName ~= "" then
    local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
    TargetPoint = GameState:GetTargetPoint(self.TargetPointName)
  end
  AudioManager(GameInstance):PlayNormalSound(TargetPoint, nil, self.EventPath, self.EventKey, self.PlayAs2D)
  self:Finish()
end

return PlayNormalSoundNode
