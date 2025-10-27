require("UnLua")
local BP_Trolly_C = Class({
  "BluePrints/Item/DefenceCore/BP_DefenceBase_C",
  "BluePrints.Common.TimerMgr"
})
local ToastTimerCD = DataMgr.GlobalConstant.HijackToastTime.ConstantValue

function BP_Trolly_C:AuthorityInitInfo(Info)
  BP_Trolly_C.Super.AuthorityInitInfo(self, Info)
  self.ESAbsorbRatio = self.UnitParams.ESAbsorbRatio or 0.1
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:IsInDungeon() then
    self.ESAbsorbValue = DataMgr.Hijack[GWorld.GameInstance:GetCurrentDungeonId()].ESAbsorbValue or 5
  else
    self.ESAbsorbValue = 5
  end
  self.AbsorbRange = self.UnitParams.AbsorbRange or 400
  self.SkillEffect = self.UnitParams.SkillEffect or 0
  self.Speed = self.MinSpeed
  self.NowPathId = 1
  self.NextPathId = 1
  self.Distance = 0
  self.CurrentAccelerationValue = 0
  self.bFirstActive = false
  self:CreateSpline()
  self.bMove = false
  self.ForceStop = false
  if GameMode:GetDungeonComponent() then
  else
    GameMode.Trolly = self
  end
  self:SetCollisionType("BodyCollision", "Item", ECollisionResponse.ECR_OverLap, false)
end

function BP_Trolly_C:CommonInitInfo(Info)
  BP_Trolly_C.Super.CommonInitInfo(self, Info)
  self:AddTimer(0.5, self.AbsorbES, true)
  self:AddTimer(0.5, self.UpdateAnim, true)
  self.MinSpeed = self.UnitParams.MinSpeed or 0
  self.MaxSpeed = self.UnitParams.MaxSpeed or 0
  self.RunStateId = self.UnitParams.RunStateId or 0
  self.Distance = 0
end

function BP_Trolly_C:ClientInitInfo(Info)
  BP_Trolly_C.Super.ClientInitInfo(self, Info)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    UIManager:LoadUINew("DungeonHijackFloat")
    self.UIPanel = UIManager:GetUIObj("DungeonHijackFloat")
    if self.UIPanel then
      self.UIPanel:OnDungeonUIStateUpdated()
      self:UpdateSpeed()
      self:AddTimer(0.1, self.RefreshHp, true, 0, "RefreshTrollyTimer")
    end
  end
  self:CreateUISpline()
  self.ToastTimerCD = DataMgr.GlobalConstant.HijackToastTime.ConstantValue
end

function BP_Trolly_C:ReceiveTick(DeltaSeconds)
  self:Move(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
end

function BP_Trolly_C:OpenMechanism(PlayerId)
  if self.CurrentWall then
    print(_G.LogTag, "Error: Attack Wall")
  elseif not self.ForceStop then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and not self.bFirstActive then
      GameMode:SetClientDungeonUIState(Const.EDungeonUIState.OnTarget)
      GameMode:TriggerGameModeEvent("OnTrollyFirstActive", self)
    end
    self.IsActive = true
    self.bMove = true
    self.bFirstActive = true
  end
end

function BP_Trolly_C:GetCanOpen(PlayerId)
  self.CanOpen = self.bMove == false or self.bMove ~= true or not not self.CurrentWall
end

function BP_Trolly_C:CreateSpline()
  local SplinePath = UE4.UClass.Load("/Game/BluePrints/Item/DefenceCore/BP_TrollySpline.BP_TrollySpline")
  local Transform = FTransform()
  Transform.Translation = self:GetTransform().Translation
  self.Spline = self:GetWorld():SpawnActor(SplinePath, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  self.Spline.Spline:ClearSplinePoints(false)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.NowPathId = self.NowPathId
  GameState.NextPathId = self.NextPathId
  self:AddNewPath()
end

function BP_Trolly_C:CreateUISpline()
  DebugPrint("1111111111111111111111 CreateUISpline")
  self.AlreadyCreateUISpline = true
  local SplinePath = UE4.UClass.Load("/Game/BluePrints/Item/DefenceCore/BP_TrollySpline.BP_TrollySpline")
  local Transform = FTransform()
  Transform.Translation = self:GetTransform().Translation
  if not IsAuthority(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.NowPathId = 1
    GameState.NextPathId = 1
  end
  self.UISpline = self:GetWorld():SpawnActor(SplinePath, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  DebugPrint("1111111111111111111111 CreateUISpline", self.UISpline)
  self:UpdatePath(self.UISpline)
end

function BP_Trolly_C:AddNewPath()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode:GetDungeonComponent() then
    return
  end
  local PointList = GameMode:TriggerDungeonComponentFun("GetNextPathInfos", self.NowPathId)
  if not PointList then
    return
  end
  table.sort(PointList, function(a, b)
    return a.PathPointIndex < b.PathPointIndex
  end)
  for i, v in pairs(PointList) do
    print(_G.LogTag, "LXZ AddNewPath", v:GetName(), v:K2_GetActorLocation())
    self.Spline:AddPoint(v:K2_GetActorLocation(), i - 1, v)
    self.PositionArray:Add(v:K2_GetActorLocation())
  end
  self.NowPathId = self.NextPathId
  self.NextPathId = PointList[#PointList].NextPathId
  self.SplineLength = self.Spline.Spline:GetSplineLength()
  self.Percent = self.Distance / self.SplineLength
  if 1 == self.NowPathId then
    local Transform = self.Spline:GetMoveTransform(self.Percent)
    Transform = FTransform(Transform.Rotation, Transform.Translation + FVector(0, 0, 154), self:GetActorScale3D())
    self:K2_SetActorTransform(Transform, false, nil, false)
  end
end

function BP_Trolly_C:Move(DeltaSeconds)
  if IsClient(self) and self.AlreadyCreateUISpline and (not self.UIPanel or not self.UIPanel.UISpline) then
    self.UIPanel = UIManager(self):GetUIObj("DungeonHijackFloat")
    if self.UIPanel then
      self:UpdatePath(self.UISpline)
    end
    if not self:IsExistTimer("RefreshTrollyTimer") then
      self:AddTimer(0.1, self.RefreshHp, true, 0, "RefreshTrollyTimer")
    end
  end
  if self:CheckAndHandleStop(DeltaSeconds) then
    return
  end
  self:Move_Main(DeltaSeconds)
  self:ClientMove(DeltaSeconds)
  self:Move_Sound(DeltaSeconds)
  self:UpdateUIStateAfterMove()
end

function BP_Trolly_C:Stop(Wall)
  self.bMove = false
  self.Speed = 0
  if Wall then
    self.CurrentWall = Wall
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerGameModeEvent("OnWallCrashed", self)
    end
  end
  self:UpdateSpeed()
end

function BP_Trolly_C:GetSplineMoveTransform(Wall)
  return self.Spline:GetMoveTransform(self.Percent)
end

function BP_Trolly_C:Crash(Wall)
  Wall:OnCrashed(self)
end

function BP_Trolly_C:RefreshHp()
  if not IsValid(self.UIPanel) then
    self.UIPanel = nil
  end
  if self.UIPanel then
    local NewHp = self:GetAttr("Hp")
    local MaxHp = self.MaxHp or self:GetAttr("MaxHp")
    self.UIPanel:OnCarDamage(NewHp, MaxHp)
  end
end

function BP_Trolly_C:UpdateSpeed()
  if not IsValid(self.UIPanel) then
    self.UIPanel = nil
  end
  if self.UIPanel then
    local CurrentSpeed = self.bMove and self.CurrentSpeed or 0
    self.UIPanel:UpdateSpeed(CurrentSpeed, self.CurrentAccelerationValue, self.MaxSpeed, self.MinSpeed, self.StateId, self)
  end
end

function BP_Trolly_C:UpdateUILength()
  if not IsValid(self.UIPanel) then
    self.UIPanel = nil
  end
  if self.UIPanel then
    self.UIPanel:UpdateUILength(self.Distance)
  end
end

function BP_Trolly_C:UpdatePath(SplineActor)
  if not IsValid(self.UIPanel) then
    self.UIPanel = nil
  end
  if self.UIPanel then
    self.UIPanel:UpdatePath(SplineActor)
  end
end

function BP_Trolly_C:TriggerBoxStop()
  if not IsValid(self.UIPanel) then
    self.UIPanel = nil
  end
  if self.UIPanel then
    self.UIPanel:TriggerBoxStop()
  end
end

function BP_Trolly_C:TryToShowToast()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Target = self.AbsorbTarget
  Target = Target or UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Text = (self:K2_GetActorLocation() - Target:K2_GetActorLocation()):Size() > DataMgr.TargetFilter.TrollyAbsorbES.LuaFilterParaments.Radius and "DUNGEON_HIJACK_116" or "DUNGEON_HIJACK_115"
  if UIManager then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(Text))
  end
end

function BP_Trolly_C:OnFirstActive()
end

function BP_Trolly_C:PlayMoveSound()
  AudioManager(self):PlayFMODSound(self, nil, self.MoveSoundPath, "TrollyMove", nil, nil, true, false, nil, true)
  self:AddTimer(0.5, self.SetMoveSoundParam, true, 0, "TrollyMoveSound")
end

function BP_Trolly_C:SetMoveSoundParam()
  AudioManager(self):SetEventSoundParam(self, "TrollyMove", {
    Speed = self.Speed / self.MaxSpeed
  })
end

function BP_Trolly_C:StopMoveSound()
  AudioManager(self):StopSound(self, "TrollyMove")
  self:RemoveTimer("TrollyMoveSound")
end

function BP_Trolly_C:PlayMaxSpeedSound()
  AudioManager(self):StopSound(self, "TrollyExitMaxSpeed")
  AudioManager(self):PlayFMODSound(self, nil, self.MaxSpeedSoundPath, "TrollyMaxSpeed", nil, nil, true, false, nil, true)
end

function BP_Trolly_C:PlayExitMaxSpeedSound()
  AudioManager(self):StopSound(self, "TrollyMaxSpeed")
  AudioManager(self):PlayFMODSound(self, nil, self.ExitMaxSpeedSoundPath, "TrollyExitMaxSpeed")
end

function BP_Trolly_C:OnRep_PositionArray()
  if not self.SplineClient then
    local SplinePath = UE4.UClass.Load("/Game/BluePrints/Item/DefenceCore/BP_TrollySpline.BP_TrollySpline")
    local Transform = FTransform()
    Transform.Translation = self:GetTransform().Translation
    self.SplineClient = self:GetWorld():SpawnActor(SplinePath, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    self.SplineClient.Spline:ClearSplinePoints(false)
  end
  if not self.ClientPointArrayIndex then
    self.ClientPointArrayIndex = 1
  end
  local Array = self.PositionArray:ToTable()
  DebugPrint("Client Test ClientAddSplinePoint  TryToAdd", self.ClientPointArrayIndex, #Array)
  local Num = 0
  for i = self.ClientPointArrayIndex, #Array do
    DebugPrint("Client Test ClientAddSplinePoint", Array[i], i, self.ClientPointArrayIndex)
    self.SplineClient:AddPoint(Array[i], i - 1, nil)
    Num = Num + 1
  end
  self.ClientPointArrayIndex = self.ClientPointArrayIndex + Num
  self.SplineLength = self.SplineClient.Spline:GetSplineLength()
  self.SplinePercent = (self.Distance or 0) / self.SplineLength
  DebugPrint("TrollyClientDebug OnRep_PositionArray", self.SplinePercent, self.Distance)
  self:OnRep_ServerPosInfo()
end

return BP_Trolly_C
