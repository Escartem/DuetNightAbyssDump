local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function M:Init()
  self.StaticCreatorId = 0
  self.ObservationPointName = ""
  self.GuideType = "Observation"
  self.ListenIntervalSeconds = 0.5
  self.ListenTimer = nil
  self.ObservationPoint = nil
end

function M:Execute(Callback)
  if self.ObservationPointName ~= "" then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
  self.ListenTimer = GWorld.GameInstance:AddTimer(self.ListenIntervalSeconds, function()
    if not IsValid(self.ObservationPoint) then
      self.ObservationPoint = self:GetObservationPoint()
      if not IsValid(self.ObservationPoint) then
        return
      end
      self.ObservationPoint.GuideIconComponent:SetAccessibility(false)
    end
    if self.ObservationPoint.GuideIconComponent:IsAccessed() then
      Callback()
    end
  end, true)
end

function M:Clear()
  if self.ObservationPointName ~= "" then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  GWorld.GameInstance:RemoveTimer(self.ListenTimer)
  self.ListenTimer = nil
  self.ObservationPoint = nil
end

function M:GetObservationPoint()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local CreatorInfo = GameState:GetStaticCreatorInfo(self.StaticCreatorId)
  local Actors = UE4.URuntimeCommonFunctionLibrary.GetStaticCreatorChildActors(GWorld.GameInstance, CreatorInfo)
  for _, Actor in pairs(Actors) do
    if IsValid(Actor) and Actor:IsA(ATalkInteractiveItem) then
      return Actor
    end
  end
  return TalkSubsystem():GetTalkInteractiveItem(self.ObservationPointName)
end

return M
