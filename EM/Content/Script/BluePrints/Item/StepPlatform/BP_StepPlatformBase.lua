require("UnLua")
local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  if 0 ~= self.GroupId then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:GetDungeonComponent():AddStepPlatForm(self.GroupId, self.Eid)
  end
end

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.CanMove = 0 ~= self.Speed
  self.CanHide = 0 ~= self.ShowTime
  self.CanChangeColor = 0 ~= self.GroupId
  self.bShow = true
  self.bMoving = false
  self.NextMoveEndIdx = 1
  self.PositiveMove = 1
  self.NextMoveEnd = self:K2_GetActorLocation()
  self.LastStartLoc = FVector(0, 0, 0)
  self.InitLoc = self:K2_GetActorLocation()
  self.RemainHideTime = 0
  self.RemainShowTime = 0
  self.RemainColorBackTime = 0
  self.bHasMoveActive = false
  self.OriginalColorType = self.NowColorType
  self.OriginalPatternType = self.NowPatternType
  if self.bAutoActive then
    self:ActiveCombat(false)
  end
  self:SetColor(false, true)
  self:SetPattern(false, true)
end

function M:ResetInfo()
  self.Overridden.ResetInfo(self)
  self.CanMove = 0 ~= self.Speed
  self.CanHide = 0 ~= self.ShowTime
  self.CanChangeColor = 0 ~= self.GroupId
  self.bShow = true
  self.bMoving = false
  self.NextMoveEndIdx = 1
  self.PositiveMove = 1
  self.NextMoveEnd = self.InitLoc
  self.LastStartLoc = FVector(0, 0, 0)
  self.RemainHideTime = 0
  self.RemainShowTime = 0
  self.RemainColorBackTime = 0
  self.bHasMoveActive = false
  self.IsActive = false
  if self.CanMove then
    self:K2_SetActorLocation(self.InitLoc, false, nil, false)
  end
  if self.CanHide then
    self:RemoveTimer("ExecuteShow")
    self:RemoveTimer("ExecuteHide")
    self:ReShow()
  end
  if self.CanChangeColor then
    self:RemoveTimer("ColorBackHandle")
  end
  if self.bAutoActive then
    self:ActiveCombat(false)
  end
  self.NowColorType = self.OriginalColorType
  self:SetColor(true)
  self.NowPatternType = self.OriginalPatternType
  self:SetPattern(true)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():SetIsStepPlatformMoveEnd(self.ManualItemId, false)
  self:BluePrintReset()
end

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  if self.bShowPath then
    self.Center = self.LineCenter:K2_GetComponentLocation()
    local DrawLineStart = self.Center
    local Points = {}
    table.insert(Points, DrawLineStart)
    for i = 1, self.TargetLocArray:Length() do
      local DrawLineEnd = DrawLineStart + self.TargetLocArray[i]
      URuntimeCommonFunctionLibrary.DrawPathLine(self, true, DrawLineStart, DrawLineEnd, self.LineColor, self.Thickness / 2)
      table.insert(Points, DrawLineEnd)
      DrawLineStart = DrawLineEnd
    end
    if 1 == self.MoveType then
      URuntimeCommonFunctionLibrary.DrawPathLine(self, true, DrawLineStart, self.Center, self.LineColor, self.Thickness / 2)
    end
    if self.PointSizeRatio > 0 then
      local HalfLength = self.Thickness * self.PointSizeRatio / 2
      for _, Pos in pairs(Points) do
        URuntimeCommonFunctionLibrary.DrawPathBox(self, Pos, self.LineColor, self.Thickness, HalfLength)
      end
    end
  end
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.bMoving then
    self:MoveLocation(DeltaSeconds)
    self:CheckCurrentMoveEnd()
  end
end

function M:CalMoveParam(BackToInit, bPausedRecover)
  if bPausedRecover then
    return
  end
  self.LastStartLoc = self.NextMoveEnd
  if BackToInit then
    self.NextMoveEnd = self.InitLoc
    self.NextMoveEndIdx = 0
  else
    if 0 == self.MoveType and self.NextMoveEndIdx > self.TargetLocArray:Length() then
      return
    end
    self.NextMoveEnd = self:K2_GetActorLocation() + self.TargetLocArray[self.NextMoveEndIdx] * self.PositiveMove
  end
  local Direction = self.NextMoveEnd - self:K2_GetActorLocation()
  Direction:Normalize()
  local NextSpeed = Direction * self.Speed
  self:SetMovementParam(NextSpeed, FVector(0, 0, 0))
end

function M:TriggerSelfLogic(IsOverLap)
  if IsOverLap then
    self:TriggerEnterLogic()
  else
    self:TriggerLeaveLogic()
  end
end

function M:TriggerEnterLogic()
  self:ActiveCombat(false)
end

function M:TriggerLeaveLogic()
end

function M:OnPlayerOverLap()
  if self.bPlayerActive and not self.IsActive then
    self:ActiveCombat(false)
  elseif self.IsActive and self.CanChangeColor then
    self:StartChangeColor()
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetDungeonComponent():OnPlayerOverlap(self.ManualItemId)
  end
end

function M:OnPlayerEndOverLap()
  self:TriggerSelfLogic(false)
end

function M:ActiveCombat(bFromGameMode)
  self.IsActive = true
  if self.CanMove and not self.bMoving and self.bAutoMove then
    self:StartMove()
    self.bHasMoveActive = true
  end
  if self.CanHide then
    self:StartHidePlatForm()
  end
  if self.CanChangeColor and not bFromGameMode then
    self:StartChangeColor()
  end
end

function M:InactiveCombat(bFromGameMode)
  self.IsActive = false
  self.bMoving = false
  self:RemoveTimer("ExecuteHide")
  self:RemoveTimer("ExecuteShow")
  self:RemoveTimer("ColorBackHandle")
end

function M:StartMove()
  if self.bMoving then
    return
  end
  self.bMoving = true
  if not self.bAutoMove then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:GetDungeonComponent():SetIsStepPlatformMoveEnd(self.ManualItemId, false)
  end
  if 1 == self.MoveType and (self.NextMoveEndIdx > self.TargetLocArray:Length() or self.NextMoveEndIdx < 1) then
    self:CalMoveParam(true, self.bHasMoveActive)
  else
    self:CalMoveParam(false, self.bHasMoveActive)
  end
end

function M:EndMove()
  self.bMoving = false
end

function M:CheckCurrentMoveEnd()
  local CurrentLoc = self:K2_GetActorLocation()
  if (CurrentLoc - self.LastStartLoc):Size() >= (self.NextMoveEnd - self.LastStartLoc):Size() and self.NextMoveEnd then
    local bShouldEnd = true
    self:K2_SetActorLocation(self.NextMoveEnd, false, nil, false)
    if not self.bAutoMove then
      self.bMoving = false
    end
    self.NextMoveEndIdx = self.NextMoveEndIdx + 1 * self.PositiveMove
    if self.NextMoveEndIdx > self.TargetLocArray:Length() or self.NextMoveEndIdx < 1 then
      if 0 == self.MoveType then
        self.bMoving = false
      elseif 1 == self.MoveType then
        if self.bAutoMove then
          self:CalMoveParam(true)
        end
      elseif 2 == self.MoveType then
        self.NextMoveEndIdx = self.NextMoveEndIdx - 1 * self.PositiveMove
        self.PositiveMove = -1 * self.PositiveMove
        if self.bAutoMove then
          self:CalMoveParam(false)
        end
      else
        bShouldEnd = false
        self:OnType3End()
      end
    elseif self.bAutoMove then
      self:CalMoveParam(false)
    end
    if not self.bAutoMove and bShouldEnd then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      GameMode:GetDungeonComponent():SetIsStepPlatformMoveEnd(self.ManualItemId, true)
      GameMode:GetDungeonComponent():StepPlatformMoveEndEvent(self.ManualItemId)
    end
  end
end

function M:OnType3End()
  self:SetActorHiddenInGame(true)
  self:SetActorEnableCollision(false)
  self.bMoving = false
  self:AddTimer(0.05, self.SetPlatformVisible, false, 0)
end

function M:SetPlatformVisible()
  self:K2_SetActorLocation(self.InitLoc, false, nil, false)
  self:SetActorHiddenInGame(false)
  self:SetActorEnableCollision(true)
  self.NextMoveEnd = self.InitLoc
  self.NextMoveEndIdx = 1
  if self.bAutoMove then
    self.bMoving = true
    self:CalMoveParam(false)
  end
  if not self.bAutoMove then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:GetDungeonComponent():SetIsStepPlatformMoveEnd(self.ManualItemId, true)
    GameMode:GetDungeonComponent():StepPlatformMoveEndEvent(self.ManualItemId)
  end
end

function M:StartHidePlatForm()
  if 0 == self.ShowTime then
    return
  end
  if self.RemainShowTime <= 0 and self.RemainHideTime <= 0 or self.RemainShowTime > 0 then
    if self.RemainShowTime <= 0 then
      self.RemainShowTime = self.ShowTime
    end
    self:AddTimer(0.8, self.ExecuteHide, true, 0, "ExecuteHide")
  elseif self.RemainHideTime > 0 then
    self:AddTimer(0.8, self.ExecuteShow, true, 0, "ExecuteShow")
  end
end

function M:ExecuteHide()
  self.RemainShowTime = self.RemainShowTime - 0.8
  if self.RemainShowTime > 0 then
    self:WaitToHide(self.RemainShowTime, self.ShowTime)
    return
  end
  self:RemoveTimer("ExecuteHide")
  self.bShow = false
  self:OnHide()
  if 0 == self.HideTime then
    return
  end
  if self.RemainShowTime <= 0 then
    self.RemainHideTime = self.HideTime
  end
  self:AddTimer(0.8, self.ExecuteShow, true, 0, "ExecuteShow")
end

function M:ExecuteShow()
  self.RemainHideTime = self.RemainHideTime - 0.8
  if self.RemainHideTime > 0 then
    self:WaitToShow(self.RemainHideTime, self.HideTime)
    return
  end
  self:RemoveTimer("ExecuteShow")
  self.bShow = true
  self:OnShow()
  if self.RemainHideTime <= 0 then
    self.RemainShowTime = self.ShowTime
  end
  self:AddTimer(0.8, self.ExecuteHide, true, 0, "ExecuteHide")
end

function M:StartChangeColor()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:GetDungeonComponent().CurrentStepPlayformEid == self.Eid then
    return
  end
  if 0 == self.GroupId or 0 == self.NowColorType then
    return
  end
  if self.RemainColorBackTime <= 0 then
    if 0 ~= self.ColorBackTime then
      self.RemainColorBackTime = self.ColorBackTime
      self:RemoveTimer("ColorBackHandle")
      self:AddTimer(0.5, self.ColorBack, true, 0, "ColorBackHandle")
    end
    GameMode:GetDungeonComponent():ActiveStepPlatform(self.Eid)
    self.NowColorType = self.NowColorType % 3 + 1
    self:SetColor(false)
    GameMode:GetDungeonComponent():OnPlatformChangedColor(self.GroupId, self.ManualItemId, self.NowColorType)
  elseif not self:IsExistTimer("ColorBackHandle") then
    self:AddTimer(0.5, self.ColorBack, true, 0, "ColorBackHandle")
  end
end

function M:SetColor(IsFromReset, NotTriggerEvent)
  self:ChangeColor(self.NowColorType, IsFromReset)
  if NotTriggerEvent then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if 3 == self.NowColorType then
    GameMode:GetDungeonComponent():OnStepPlatformChangeGreen(self.GroupId, self.Eid)
  else
    GameMode:GetDungeonComponent():OnStepPlatformLeaveGreen(self.GroupId, self.Eid)
  end
end

function M:ColorBack()
  self.RemainColorBackTime = self.RemainColorBackTime - 0.5
  if self.RemainColorBackTime >= 0 then
    return
  end
  self:RemoveTimer("ColorBackHandle")
  self.NowColorType = math.max(self.NowColorType - 1, 1)
  self:ChangeColor(self.NowColorType)
end

function M:SetPattern(IsFromReset)
  self:OnPatternChanged(self.NowPatternType, IsFromReset)
end

return M
