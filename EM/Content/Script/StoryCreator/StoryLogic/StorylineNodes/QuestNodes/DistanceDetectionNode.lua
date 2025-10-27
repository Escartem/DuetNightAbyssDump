local DistanceDetectionNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function DistanceDetectionNode:Init()
  self.PointType1 = "StaticCreator"
  self.PointId1 = 0
  self.PointType2 = "StaticCreator"
  self.PointId2 = 0
  self.Target1 = nil
  self.Target2 = nil
end

function DistanceDetectionNode:Start(QuestLine, InportName)
  if "Stop" == InportName then
    self:FinishAction()
  else
    self:Execute()
  end
end

function DistanceDetectionNode:Execute()
  self.Widget = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if not self.Widget then
    self.Widget = UIManager(self):LoadUINew("DungeonCaptureFloat")
    if not self.Widget then
      error("\232\183\157\231\166\187UI\229\136\155\229\187\186\229\164\177\232\180\165")
    end
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    return
  end
  if self.PointType1 == "StaticCreator" then
    self.Target1 = GameMode.EMGameState.StaticCreatorMap:Find(self.PointId1)
  elseif self.PointType1 == "ManualItem" then
    self.Target1 = GameMode.EMGameState.ManualActiveCombat:Find(self.PointId1)
  elseif self.PointType1 == "Player" then
    self.Target1 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  end
  if "StaticCreator" == self.PointType2 then
    self.Target2 = GameMode.EMGameState.StaticCreatorMap:Find(self.PointId2)
  elseif "ManualItem" == self.PointType2 then
    self.Target2 = GameMode.EMGameState.ManualActiveCombat:Find(self.PointId2)
  elseif "Player" == self.PointType2 then
    self.Target2 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  end
  if not self.Target1 then
    error("\230\156\170\232\131\189\230\137\190\229\136\176\230\163\128\230\181\139\231\130\1851\229\174\158\228\189\147")
  end
  if not self.Target2 then
    error("\230\156\170\232\131\189\230\137\190\229\136\176\230\163\128\230\181\139\231\130\1852\229\174\158\228\189\147")
  end
  self.Widget:RemainingDistance(self.Target1, self.Target2)
end

function DistanceDetectionNode:RemoveWidget()
  if self.Widget then
    self.Widget:EndRemainingDistance()
    self.Widget = nil
  end
end

function DistanceDetectionNode:OnQuestlineFail()
  self:RemoveWidget()
end

function DistanceDetectionNode:OnQuestlineSuccess()
  self:RemoveWidget()
end

function DistanceDetectionNode:FinishAction()
  self:Finish()
end

function DistanceDetectionNode:Clear()
  self:RemoveWidget()
end

return DistanceDetectionNode
