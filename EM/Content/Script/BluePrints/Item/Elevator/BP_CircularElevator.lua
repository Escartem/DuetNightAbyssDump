require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_CircularElevator = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_CircularElevator:CreateRegionData()
  self.RegionData = {
    OpenState = self.OpenState
  }
end

function BP_CircularElevator:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self:AddTimer(1, self.Init)
  self.ElevatorQueue:Add(self.DiantiA)
  self.ElevatorQueue:Add(self.DiantiB)
  self.ElevatorQueue:Add(self.DiantiC)
  self.BenchMark = self:K2_GetActorLocation()
  self.SingleHeight = 1476
  self.EndUp = FVector(self.BenchMark.X, self.BenchMark.Y, self.BenchMark.Z - self.SingleHeight)
  self.TopUp = FVector(self.BenchMark.X, self.BenchMark.Y, self.BenchMark.Z + self.SingleHeight * 2)
  self.OnDoorOpen = false
  self.OnElevatorMove = false
  self.OnDoorClose = false
  self.CurrentSpeed = 0
  self.CurrentDis = 0
  self.Accelerate = 2 * self.SingleHeight / self.AcceleratedTime / self.AcceleratedTime
  self.DistanceAll = (self.NormalNum + 1) * self.SingleHeight + self.UnderFloor
  self.OnSpeedDownTime = (self.DistanceAll - 2 * self.SingleHeight) / self.Accelerate / self.AcceleratedTime
  self.NowOpenDoorNum = 0
  self.NowMoveElevatorNum = 0
  self.stage1 = false
  self.stage2 = false
  self.OpenState = false
  self.DoorRotChangeNum = 0
  self.Time = 0
  self.PlayerIn = {}
  self.RecoverCollisionFrameNum = -1
end

function BP_CircularElevator:Init()
  if self.BpBorn and IsAuthority(self) then
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = self.UnitId
    Context.UnitType = self.UnitType
    self:InitActorInfo_New(Context)
  end
  if MiscUtils.IsLowerAuthority(self) and self.InitSuccess then
    self:InitActorInfo_New()
  end
  if IsAuthority(self) then
    self.Diban = self:GetWorld():SpawnActor(LoadClass("/Game/AssetDesign/Item/Elevator/ElevatorComponent/BP_ElevatorMechanismBody_In.BP_ElevatorMechanismBody_In"))
    self.Diban:K2_AttachToActor(self)
    self.Diban:K2_SetActorLocation(self.DiantiA:K2_GetComponentLocation() + FVector(0, 0, 20), false, nil, false)
    self.Diban.Eid = self.Eid
    self.Diban.ElevatorInteractiveComponent.CanInteractive = true
    self.Diban.ElevatorInteractiveComponent:SetInteractiveName(DataMgr.Mechanism[self.UnitId].InteractiveName)
  end
end

function BP_CircularElevator:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.RecoverCollisionFrameNum >= 0 and self.RecoverCollisionFrameNum < 1 then
    self.RecoverCollisionFrameNum = self.RecoverCollisionFrameNum + 1
    return
  end
  if 1 == self.RecoverCollisionFrameNum then
    local AttachedActors = self:GetAttachedActors()
    for i = 1, AttachedActors:Length() do
      if AttachedActors[i].Box then
        AttachedActors[i].Box:SetCollisionEnabled(3)
      end
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      Player.PlayerAnimInstance.ForceIdle = false
    end
    self.RecoverCollisionFrameNum = -1
  end
  if self.OnElevatorMove and not self.OnDoorOpen and not self.OnDoorClose and -1 == self.RecoverCollisionFrameNum then
    self.Time = self.Time + DeltaSeconds
    self:RealMoveElevator(DeltaSeconds, self.Direction)
  end
end

function BP_CircularElevator:RealMoveLua(ElevatorId)
  if IsAuthority(self) then
    self.Diban.ElevatorInteractiveComponent:InteractiveSuccess()
  else
    self:PlayMiddle()
  end
end

function BP_CircularElevator:RealOpenDoorLua(ElevatorId)
  self.OnDoorOpen = true
  self.OnDoorClose = false
  self.HasDoorOpen = true
  self.Overridden.RealOpenDoorLua(self, ElevatorId)
  AudioManager(self):PlayFMODSound(self.Diban, nil, "event:/sfx/common/scene/lift_fast_door_open", "Elevator")
end

function BP_CircularElevator:RealCloseDoorLua(ElevatorId)
  self.OnDoorOpen = false
  self.OnDoorClose = true
  self.HasDoorOpen = false
  self.Overridden.RealCloseDoorLua(self, ElevatorId)
  AudioManager(self):PlayFMODSound(self.Diban, nil, "event:/sfx/common/scene/lift_fast_door_close", "Elevator")
end

function BP_CircularElevator:InitBeforeRun()
  self:UpdateRegionData("OpenState", true)
  self.Time = 0
  self.stage1 = false
  self.stage2 = false
  self.CurrentDis = 0
  self.ElevatorQueue:Clear()
  self.ElevatorQueue:Add(self.DiantiA)
  if self.DiantiB:K2_GetComponentLocation().Z > self.DiantiA:K2_GetComponentLocation().Z then
    self.ElevatorQueue:Add(self.DiantiB)
  else
    self.ElevatorQueue:Insert(self.DiantiB, 1)
  end
  if self.DiantiC:K2_GetComponentLocation().Z > self.ElevatorQueue[2]:K2_GetComponentLocation().Z then
    self.ElevatorQueue:Add(self.DiantiC)
  elseif self.DiantiC:K2_GetComponentLocation().Z < self.ElevatorQueue[1]:K2_GetComponentLocation().Z then
    self.ElevatorQueue:Insert(self.DiantiC, 1)
  else
    self.ElevatorQueue:Insert(self.DiantiC, 2)
  end
  if self.MoveTransform.Translation.Z >= 0 then
    self.Direction = 1
    self.OtherElevator.Direction = 1
  else
    self.Direction = 0
    self.OtherElevator.Direction = 0
  end
end

function BP_CircularElevator:PlayMiddle()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  AudioManager(self):PlayFMODSound(self.Diban, nil, "event:/sfx/common/scene/lift_slow_door_running", "Elevator_Running1", nil, nil, false, false, nil, true)
  AudioManager(self):PlayFMODSound(self.OtherElevator.Diban, nil, "event:/sfx/common/scene/lift_slow_door_running", "Elevator_Running2", nil, nil, false, false, nil, true)
  self.MovePlayer = true
  self.OtherElevator.MovePlayer = false
  self.OnElevatorMove = true
  self.OtherElevator.OnElevatorMove = true
  self:InitBeforeRun()
  self.OtherElevator:InitBeforeRun()
  self:RealCloseDoorLua()
  self.OtherElevator:RealCloseDoorLua()
end

function BP_CircularElevator:OnDoorMove(XValue)
end

function BP_CircularElevator:ClientCloseDoor(Door, Direction, DeltaSeconds)
  if self.OnDoorClose == false then
    return
  end
  self.OnDoorClose = false
  if self.OnElevatorMove == true then
    if not IsAuthority(self) or IsStandAlone(self) then
      self:OnStartMove()
    end
    if 1 == self.Direction then
      self:OnElevatorStartDown()
    else
      self:OnElevatorStartUp()
    end
    self.Diban.IsRun = true
    self.Diban.Box:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    if IsAuthority(self) then
      UE4.UGameplayStatics.GetGameMode(self):PostCustomEvent("ElevatorStartMove")
    end
  end
end

function BP_CircularElevator:ChangeElevatorLoc(MovePlayer)
  local MoveVector = self.MoveTransform.Translation
  local Player = UE.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.RecoverCollisionFrameNum = 0
  if MovePlayer then
    local ObjectTypes = TArray(EObjectTypeQuery)
    ObjectTypes:Add(EObjectTypeQuery.Pawn)
    local HitRes = FHitResult()
    local Transform = self:GetTransform()
    Transform.Translation.Z = Transform.Translation.Z + self.BoxIn:GetScaledBoxExtent().Z
    local Extent = self.BoxIn:GetScaledBoxExtent()
    HitRes = UKismetSystemLibrary.BoxTraceSingleForObjects(self, Transform.Translation, Transform.Translation, Extent, Transform.Rotation:ToRotator(), ObjectTypes)
    if not HitRes.Actor then
      return
    end
    
    local function RealMovePlayer()
      local PreviousDesiredLoc = Player.CharSpringArmComponent:GetPreviousDesiredLoc()
      local DiffLoc = PreviousDesiredLoc - Player:K2_GetActorLocation()
      local PlayerLoc = Player:K2_GetActorLocation()
      PlayerLoc = PlayerLoc + MoveVector
      Player:K2_SetActorLocation(PlayerLoc, false, nil, false)
      Player.CharSpringArmComponent:SetPreviousDesiredLoc(DiffLoc + PlayerLoc)
      Player.PlayerAnimInstance.ForceIdle = true
    end
    
    local GameMode = UGameplayStatics.GetGameMode()
    if GameMode and GameMode:GetWCSubSystem() then
      GameMode:GetWCSubSystem():PauseAndAsyncDestroyRegionData({self, RealMovePlayer})
    else
      RealMovePlayer()
    end
  end
end

function BP_CircularElevator:WaitToStopElevator()
  self.SpeedDown = true
end

function BP_CircularElevator:RealMoveElevator(DeltaSeconds, Direction)
  if 0 == Direction then
    self:MoveElevatorUp(self.ElevatorQueue[1], DeltaSeconds, self.MovePlayer)
  else
    self:MoveElevatorDown(self.ElevatorQueue[self.ElevatorQueue:Length()], DeltaSeconds, self.MovePlayer)
  end
end

function BP_CircularElevator:MoveElevatorUp(Elevator, DeltaSeconds, MovePlayer)
  local Current = Elevator:K2_GetComponentLocation()
  if Current.Z <= self.BenchMark.Z - self.SingleHeight + 1 then
    if Elevator == self.DiantiA then
      self.stage1 = true
      Elevator:K2_SetWorldLocation(self.TopUp, false, nil, false)
      self.ElevatorQueue:Remove(1)
      self:ChangeElevatorLoc(MovePlayer)
      self:OnSpeedUniform()
      if IsAuthority(self) and MovePlayer then
        UE4.UGameplayStatics.GetGameMode(self):PostCustomEvent("ElevatorUniform")
      end
    else
      local Tmp = FVector(self.TopUp.X, self.TopUp.Y, self.TopUp.Z - self.SingleHeight)
      Elevator:K2_SetWorldLocation(Tmp, false, nil, false)
      self.ElevatorQueue:Remove(1)
      self.ElevatorQueue:Add(Elevator)
    end
    return
  end
  if self.stage1 == false then
    self.CurrentSpeed = self.CurrentSpeed + self.Accelerate * DeltaSeconds
    local Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.EndUp, DeltaSeconds, self.CurrentSpeed)
    local Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
    local Target3 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight * 2)
    self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
    Elevator:K2_SetWorldLocation(Target, false, nil, false)
    self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
    self.ElevatorQueue[3]:K2_SetWorldLocation(Target3, false, nil, false)
  elseif self.stage1 == true and false == self.stage2 then
    local Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.EndUp, DeltaSeconds, self.CurrentSpeed)
    local Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
    self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
    Elevator:K2_SetWorldLocation(Target, false, nil, false)
    self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
    if self.DistanceAll - self.CurrentDis <= self.SingleHeight * 2 then
      if not IsAuthority(self) or IsStandAlone(self) then
        self:OnSpeedDown()
      end
      if IsAuthority(self) and MovePlayer then
        UE4.UGameplayStatics.GetGameMode(self):PostCustomEvent("ElevatorSpeedDown")
      end
      self.stage2 = true
      self.Time = 0
      self.ElevatorQueue:Add(self.DiantiA)
    end
  elseif true == self.stage2 then
    local Tmp = self.DiantiA:K2_GetComponentLocation()
    local Target, Target2, Target3
    if Elevator == self.DiantiA then
      self.CurrentSpeed = 0
      self.FixFinish = true
      Target = FVector(Tmp.X, Tmp.Y, self.BenchMark.Z - self.UnderFloor)
      Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[3]:K2_SetWorldLocation(Target3, false, nil, false)
    end
    if Tmp.Z <= self.BenchMark.Z + self.SingleHeight - self.UnderFloor then
      self.CurrentSpeed = self.CurrentSpeed - self.Accelerate * DeltaSeconds
    end
    if self.CurrentSpeed > 0 then
      Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.EndUp, DeltaSeconds, self.CurrentSpeed)
      Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight * 2)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[3]:K2_SetWorldLocation(Target3, false, nil, false)
    elseif Tmp.Z >= self.BenchMark.Z - self.UnderFloor + 1 or Tmp.Z <= self.BenchMark.Z - self.UnderFloor - 1 and not self.FixFinish then
      if Tmp.Z <= self.BenchMark.Z - self.UnderFloor - 1 then
        if 0 == self.FixDirection then
          self.FixDirection = 1
        end
        if 2 == self.FixDirection then
          self.FixFinish = true
          Target = FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor)
        else
          Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor), 1, 200)
        end
      else
        if 0 == self.FixDirection then
          self.FixDirection = 2
        end
        if 1 == self.FixDirection then
          self.FixFinish = true
          Target = FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor)
        else
          Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor), DeltaSeconds, 200)
        end
      end
      Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight * 2)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[3]:K2_SetWorldLocation(Target3, false, nil, false)
    else
      self:OpenDoorOnEndMove(MovePlayer)
    end
  end
end

function BP_CircularElevator:MoveElevatorDown(Elevator, DeltaSeconds, MovePlayer)
  local Current = Elevator:K2_GetComponentLocation()
  if Current.Z >= self.BenchMark.Z + self.SingleHeight then
    if Elevator == self.DiantiA then
      self.stage1 = true
      Elevator:K2_SetWorldLocation(self.EndUp - self.SingleHeight * 2, false, nil, false)
      self.ElevatorQueue:Remove(self.ElevatorQueue:Length())
      self:ChangeElevatorLoc(MovePlayer)
      self:OnSpeedUniform()
    else
      Elevator:K2_SetWorldLocation(self.EndUp, false, nil, false)
      self.ElevatorQueue:Remove(self.ElevatorQueue:Length())
      self.ElevatorQueue:Insert(Elevator, 1)
    end
    return
  end
  if self.stage1 == false then
    self.CurrentSpeed = self.CurrentSpeed + self.Accelerate * DeltaSeconds
    local Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.TopUp, DeltaSeconds, self.CurrentSpeed)
    local Target2 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
    local Target3 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight * 2)
    self.CurrentDis = self.CurrentDis - Current.Z + Target.Z
    Elevator:K2_SetWorldLocation(Target, false, nil, false)
    self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
    self.ElevatorQueue[1]:K2_SetWorldLocation(Target3, false, nil, false)
  elseif self.stage1 == true and false == self.stage2 then
    local Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.TopUp, DeltaSeconds, self.CurrentSpeed)
    local Target2 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
    self.CurrentDis = self.CurrentDis - Current.Z + Target.Z
    Elevator:K2_SetWorldLocation(Target, false, nil, false)
    self.ElevatorQueue[1]:K2_SetWorldLocation(Target2, false, nil, false)
    if self.DistanceAll - self.CurrentDis <= self.SingleHeight * 2 then
      self.stage2 = true
      self.ElevatorQueue:Insert(self.DiantiA, 1)
      if not IsAuthority(self) or IsStandAlone(self) then
        self:OnSpeedDown()
      end
    end
  elseif true == self.stage2 then
    local Tmp = self.DiantiA:K2_GetComponentLocation()
    local Target, Target2, Target3
    if Elevator == self.DiantiA then
      self.CurrentSpeed = 0
      self.FixFinish = true
      Target = FVector(Tmp.X, Tmp.Y, self.BenchMark.Z - self.UnderFloor)
      Target2 = FVector(Target.X, Target.Y, Target.Z + self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[1]:K2_SetWorldLocation(Target3, false, nil, false)
    end
    if Tmp.Z >= self.BenchMark.Z - self.SingleHeight - self.UnderFloor then
      self.CurrentSpeed = self.CurrentSpeed - self.Accelerate * DeltaSeconds
    end
    if self.CurrentSpeed > 0 then
      Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, self.TopUp, DeltaSeconds, self.CurrentSpeed)
      Target2 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight * 2)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[1]:K2_SetWorldLocation(Target3, false, nil, false)
    elseif Tmp.Z >= self.BenchMark.Z - self.UnderFloor + 1 or Tmp.Z <= self.BenchMark.Z - self.UnderFloor - 1 and not self.FixFinish then
      if Tmp.Z <= self.BenchMark.Z - self.UnderFloor - 1 then
        if 0 == self.FixDirection then
          self.FixDirection = 1
        end
        if 2 == self.FixDirection then
          self.FixFinish = true
          Target = FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor)
        else
          Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor), 1, 200)
        end
      else
        if 0 == self.FixDirection then
          self.FixDirection = 2
        end
        if 1 == self.FixDirection then
          self.FixFinish = true
          Target = FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor)
        else
          Target = UE4.UKismetMathLibrary.VInterpTo_Constant(Current, FVector(Tmp.X, Tmp.Y, self.EndUp.Z - self.UnderFloor), DeltaSeconds, 200)
        end
      end
      Target2 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight)
      Target3 = FVector(Target.X, Target.Y, Target.Z - self.SingleHeight * 2)
      self.CurrentDis = self.CurrentDis + Current.Z - Target.Z
      Elevator:K2_SetWorldLocation(Target, false, nil, false)
      self.ElevatorQueue[2]:K2_SetWorldLocation(Target2, false, nil, false)
      self.ElevatorQueue[1]:K2_SetWorldLocation(Target3, false, nil, false)
    else
      self:OpenDoorOnEndMove(MovePlayer)
    end
  end
end

function BP_CircularElevator:OpenDoorOnEndMove(MovePlayer)
  if self.HasDoorOpen then
    return
  end
  if MovePlayer then
    DebugPrint(_G.LogTag, "LXZ OpenDoorOnEndMove", self.HasDoorOpen)
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    AudioManager(self):StopSound(self.Diban, "Elevator_Running1")
    AudioManager(self):StopSound(self.OtherElevator.Diban, "Elevator_Running2")
  end
  if not IsAuthority(self) or IsStandAlone(self) then
    self.OnElevatorMove = false
    self:OnEndMove()
    self:PlayStopEffects()
    if 0 == self.Direction then
      self:OnElevatorStopUp()
    else
      self:OnElevatorStopDown()
    end
  end
  if IsAuthority(self) and MovePlayer then
    UE4.UGameplayStatics.GetGameMode(self):PostCustomEvent("ElevatorEndMove")
  end
  self.Smoke:Activate()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:OpenDoor(Player.Eid, self.Eid)
  self:UpdateRegionData("OpenState", false)
end

function BP_CircularElevator:BoxOverLap(Player)
  if 0 == self.NowOpenDoorNum and (not self.OnElevatorMove or self.OnDoorOpen or not not self.OnDoorClose) then
    if not self.HasDoorOpen then
      self:OpenDoor(Player.Eid, self.Eid)
    end
    if self.PlayerIn[Player.Eid] == true then
      self.OnElevatorMove = false
      self.OtherElevator.OnElevatorMove = false
      self:RemoveTimer(self.StopHandle)
    end
  end
  self.NowOpenDoorNum = self.NowOpenDoorNum + 1
end

function BP_CircularElevator:BoxEndOverLap(Player)
  self.NowOpenDoorNum = math.max(self.NowOpenDoorNum - 1, 0)
  if 0 == self.NowOpenDoorNum and 0 == self.NowMoveElevatorNum then
    self:CloseDoor(Player.Eid, self.Eid)
  end
end

function BP_CircularElevator:GoIn(Player)
  self.PlayerIn[Player.Eid] = true
  if (self.OnElevatorMove or self.OtherElevator.OnElevatorMove) and not self.OnDoorClose and not self.OnDoorOpen then
    return
  end
  self.NowMoveElevatorNum = self.NowMoveElevatorNum + 1
end

function BP_CircularElevator:GoOut(Player)
  if self.PlayerIn[Player.Eid] == false then
    return
  end
  if (self.OnElevatorMove or self.OtherElevator.OnElevatorMove) and not self.OnDoorClose and not self.OnDoorOpen then
    return
  end
  self.PlayerIn[Player.Eid] = false
  self.NowMoveElevatorNum = math.max(self.NowMoveElevatorNum - 1, 0)
  self.OnElevatorMove = false
  self.OtherElevator.OnElevatorMove = false
  self:RemoveTimer(self.StopHandle)
  self:UpdateRegionData("OpenState", false)
  self:PlayStopEffects()
  AudioManager(self):StopSound(self.Diban, "Elevator_Running1")
  AudioManager(self):StopSound(self.OtherElevator.Diban, "Elevator_Running2")
end

function BP_CircularElevator:OpenPlayerPosSync()
  print(_G.LogTag, "LXZ OpenPlayerPosSync", self.OnElevatorMove)
  local Avatar = GWorld:GetAvatar()
  if not Avatar or self.OnElevatorMove then
    return
  end
  Avatar:ClientNotifyServerOpenSync("InElevator")
end

function BP_CircularElevator:ClosePlayerPosSync()
  print(_G.LogTag, "LXZ ClosePlayerPosSync", self.OnElevatorMove)
  local Avatar = GWorld:GetAvatar()
  if not Avatar or self.OnElevatorMove then
    return
  end
  Avatar:ClientNotifyServerCloseSync("InElevator")
end

function BP_CircularElevator:TriggerStoryNodeCallback(StateName)
  if self.StoryNodeCallback and self.StoryNodeCallback[StateName] then
    self.StoryNodeCallback[StateName](self)
  end
end

function BP_CircularElevator:OnElevatorStartUp()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStartUp(self)
  self:TriggerStoryNodeCallback("StartUp")
end

function BP_CircularElevator:OnElevatorStopUp()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStopUp(self)
  self.OtherElevator:TriggerStoryNodeCallback("StopUp")
end

function BP_CircularElevator:OnElevatorStartDown()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStartDown(self)
  self:TriggerStoryNodeCallback("StartDown")
end

function BP_CircularElevator:OnElevatorStopDown()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStopDown(self)
  self.OtherElevator:TriggerStoryNodeCallback("StopDown")
end

function BP_CircularElevator:AddStoryNodeCallback(StateName, Callback)
  if not self.StoryNodeCallback then
    self.StoryNodeCallback = {}
  end
  self.StoryNodeCallback[StateName] = Callback
end

function BP_CircularElevator:RemoveStoryNodeCallback(StateName)
  self.StoryNodeCallback[StateName] = nil
end

function BP_CircularElevator:PlayInteractiveEffects()
  self.Diban.FXStartInteractive:Activate(true)
  self.Diban.FXLock:Deactivate()
  self.Diban.FXRunning:Activate(true)
  self.OtherElevator.Diban.FXStartInteractive:Activate(true)
  self.OtherElevator.Diban.FXLock:Deactivate()
  self.OtherElevator.Diban.FXRunning:Activate(true)
end

function BP_CircularElevator:PlayStopEffects()
  self.Diban.FXStartInteractive:Deactivate()
  self.Diban.FXLock:Activate(true)
  self.Diban.FXRunning:Deactivate()
  self.OtherElevator.Diban.FXStartInteractive:Deactivate()
  self.OtherElevator.Diban.FXLock:Activate(true)
  self.OtherElevator.Diban.FXRunning:Deactivate()
end

function BP_CircularElevator:RegisterComponent(CompArray)
  for i, v in pairs(CompArray) do
    self.ComponentLoc:Add(v, v.RelativeLocation)
  end
end

return BP_CircularElevator
