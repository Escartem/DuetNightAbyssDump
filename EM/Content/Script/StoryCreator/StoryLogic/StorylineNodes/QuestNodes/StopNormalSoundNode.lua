local StopNormalSoundNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function StopNormalSoundNode:Init()
  self.TargetPointName = ""
  self.EventKey = ""
end

function StopNormalSoundNode:Start(Context)
  DebugPrint("===============================StopNormalSoundNode================================")
  DebugPrint("TargetPointName", self.TargetPointName, "EventKey", self.EventKey)
  local GameInstance = GWorld.GameInstance
  local TargetPoint
  if self.TargetPointName ~= "" then
    local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
    TargetPoint = GameState:GetTargetPoint(self.TargetPointName)
  end
  AudioManager(GameInstance):StopSound(TargetPoint, self.EventKey)
  self:Finish()
end

return StopNormalSoundNode
