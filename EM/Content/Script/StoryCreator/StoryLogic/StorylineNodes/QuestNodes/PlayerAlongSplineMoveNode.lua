local PlayerAlongSplineMoveNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function PlayerAlongSplineMoveNode:Init()
  self.SplineActorIndex = 0
  self.WalkType = 0
  self.MoveSpeedRate = 1.0
end

function PlayerAlongSplineMoveNode:Execute(Callback)
  self.Callback = CallBack
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  DebugPrint("PlayerAlongSplineMoveNode ", GWorld.GameInstance)
  if not self.Player then
    Callback()
    return
  end
  self.CinemaMoveSpline = URuntimeCommonFunctionLibrary.FindCinemaMoveSplineByIndex(self.SplineActorIndex, self.Player)
  if not self.CinemaMoveSpline then
    Callback()
    return
  end
  self.CinemaMoveSpline.EndPointOverlapBox.OnComponentBeginOverlap:Add(self.Player, function()
    Callback()
  end)
  if self.Player.PlayerAnimInstance then
    self.OriginalWalkType = self.Player.PlayerAnimInstance.WalkType
    self.OriginalWalkSpeedRate = self.Player.SpeedRate
    self.Player:SetWalkType(self.WalkType)
    self.Player:SetPlayerMaxMovingSpeed(self.MoveSpeedRate)
  end
  self.Player:StartMoveAlongSpline(self.CinemaMoveSpline.SplineComponent)
  self.Player:MoveAlongSplineBanSkills()
  self.Player:ForbidActionWhileMoveAlongSpline(true)
end

function PlayerAlongSplineMoveNode:Stop()
  self:Clear()
end

function PlayerAlongSplineMoveNode:Clear()
  self:ExecQuitLogic()
end

function PlayerAlongSplineMoveNode:ExecQuitLogic()
  if not self.Player then
    return
  end
  self.Player:EndMoveAlongSpline()
  self.Player:MoveAlongSplineUnBanSkills()
  self.Player:ForbidActionWhileMoveAlongSpline(false)
  if self.OriginalWalkType then
    self.Player:SetWalkType(self.OriginalWalkType)
    self.Player:SetPlayerMaxMovingSpeed(self.OriginalWalkSpeedRate)
  end
  if self.CinemaMoveSpline then
    self.CinemaMoveSpline.EndPointOverlapBox.OnComponentBeginOverlap:Clear()
  end
  self.Player = nil
end

return PlayerAlongSplineMoveNode
