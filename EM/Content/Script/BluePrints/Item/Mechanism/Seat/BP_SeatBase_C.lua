require("UnLua")
local BP_SeatBase_C = Class("BluePrints.Item.Chest.BP_MechanismBase_C")
local UseNewNpcMoveComp = true

function BP_SeatBase_C:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.PointArray = self:K2_GetComponentsByClass(LoadClass("/Game/BluePrints/Item/Mechanism/Seat/BP_SeatPointComponent.BP_SeatPointComponent_C"):StaticClass())
  self.PlayerAndSeat = {}
  self.DefaultInteractiveComponent.MergeName = "Seat"
  if self.DefaultInteractiveComponent then
    self.DefaultInteractiveComponent.bCanUsed = false
    self.DefaultInteractiveComponent.IsDefault = true
    self.InteractiveComponents:Clear()
    self.InteractiveComponents:Add(self.DefaultInteractiveComponent)
    self.ChestInteractiveComponent = self.DefaultInteractiveComponent
  end
end

function BP_SeatBase_C:InitActorInfo(Info)
  if self.InitSuccess then
    return
  end
  BP_SeatBase_C.Super.InitActorInfo(self, Info)
end

function BP_SeatBase_C:AuthorityInitInfo(Info)
  BP_SeatBase_C.Super.AuthorityInitInfo(self, Info)
end

function BP_SeatBase_C:CommonInitInfo(Info)
  BP_SeatBase_C.Super.CommonInitInfo(self, Info)
  self.ChestInteractiveComponent.DisPlayInteractiveName = GText(self.ChestInteractiveComponent.InteractiveName)
end

function BP_SeatBase_C:ClientInitInfo(Info)
  BP_SeatBase_C.Super.ClientInitInfo(self, Info)
end

function BP_SeatBase_C:OnActorReady(Info)
  BP_SeatBase_C.Super.OnActorReady(self, Info)
  if self.CacheOpenMechanismWithoutInteractive then
    local CharacterEid = self.CacheOpenMechanismWithoutInteractive.CharacterEid
    local Character = Battle(self):GetEntity(CharacterEid)
    local CallBackFunc = self.CacheOpenMechanismWithoutInteractive.CallBackFunc
    local SourceFunc = self.CacheOpenMechanismWithoutInteractive.SourceFunc
    SourceFunc(self, Character, CallBackFunc, false)
  end
end

function BP_SeatBase_C:OpenMechanism(PlayerActorEid)
  local Player = Battle(self):GetEntity(PlayerActorEid)
  Player:AddForbidTag("Battle")
  local Point = self:FindPoint(PlayerActorEid)
  local EnterPoint = Point:FindEnterPoint(PlayerActorEid)
  local RealZ = EnterPoint:K2_GetComponentLocation().Z + Player.CapsuleComponent.CapsuleHalfHeight + Player:GetFloorInfo().FloorDist
  local Loc = FVector(EnterPoint:K2_GetComponentLocation().X, EnterPoint:K2_GetComponentLocation().Y, RealZ)
  local Rot = EnterPoint:K2_GetComponentRotation()
  Point.IsUsed = true
  Point.EnterType = EnterPoint.Type
  self.PlayerAndSeat[PlayerActorEid] = Point
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  Player:DisableInput(Controller)
  local handle = UE4.ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, value)
      Player.MoveInput = FVector(0, 0, 0)
      Player.MoveInputCache = FVector(0, 0, 0)
      Player:K2_SetActorLocationAndRotation(value, Rot, false, nil, false)
    end
  }, Player:K2_GetActorLocation(), Loc, 0.1, 0)
  handle:OnComplete({
    self,
    function()
      Player:K2_SetActorLocationAndRotation(Loc, Rot, false, nil, false)
      Player.OnInteractiveDelegate:Add(self.ChestInteractiveComponent, self.ChestInteractiveComponent.EndInteractive)
      Player:GetMovementComponent():SetMovementMode(1)
      Player.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_OverLap)
      Player.CharSpringArmComponent.bArmCollision = false
      Player.CharSpringArmComponent.CameraProbeSize = 2
      self:SetSittingParam(Player, Point, EnterPoint)
      self:ClientPlayAnim(Player.Eid, 0, self.Eid)
      Player:EnableInput(Controller)
    end
  })
end

function BP_SeatBase_C:CloseMechanism(PlayerActorEid, IsSuccess)
  local Player = Battle(self):GetEntity(PlayerActorEid)
  if IsValid(Player) then
    Player.OnInteractiveDelegate:Remove(self.ChestInteractiveComponent, self.ChestInteractiveComponent.EndInteractive)
    Player:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
    Player.CharSpringArmComponent.bArmCollision = true
    Player.CharSpringArmComponent.CameraProbeSize = 12
    local EnterPoint = self:GetLeavingPoint(Player)
    self.PlayerAndSeat[Player.Eid].EnterType = EnterPoint.Type
    self:SetLeavingParam(Player, self.PlayerAndSeat[PlayerActorEid], EnterPoint)
    self:ClientPlayAnim(PlayerActorEid, 2, self.Eid)
  end
  self.PlayerAndSeat[PlayerActorEid].IsUsed = false
  self.PlayerAndSeat[PlayerActorEid] = nil
end

function BP_SeatBase_C:ForceCloseMechanism(PlayerActorEid, IsSuccess)
  local Player = Battle(self):GetEntity(PlayerActorEid)
  Player.OnInteractiveDelegate:Remove(self.ChestInteractiveComponent, self.ChestInteractiveComponent.EndInteractive)
  Player.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
  Player:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  Player:GetMovementComponent():SetMovementMode(1)
  self.PlayerAndSeat[PlayerActorEid].IsUsed = false
  self.PlayerAndSeat[PlayerActorEid] = nil
end

function BP_SeatBase_C:PlayAnim(PlayerId, InteractiveState, MechanismEid)
  local Player = Battle(self):GetEntity(PlayerId)
  if 0 == InteractiveState then
    local MontageName = self.ChestInteractiveComponent.MontageName .. "_" .. self.PlayerAndSeat[Player.Eid].EnterType .. "_Montage"
    self.ChestInteractiveComponent:OnStartInteractive(Battle(self):GetEntity(PlayerId), MontageName, MechanismEid)
  end
  if 1 == InteractiveState then
  end
  if 2 == InteractiveState then
    self.ChestInteractiveComponent:OnEndInteractive(Battle(self):GetEntity(PlayerId), self.ChestInteractiveComponent.MontageName, MechanismEid)
    Player.Mesh:GetAnimInstance():Montage_JumpToSection("SitEnd" .. self.PlayerAndSeat[Player.Eid].EnterType)
  end
end

function BP_SeatBase_C:GetCanOpen(PlayerEid)
  local tmp = true
  for i = 1, self.PointArray:Length() do
    tmp = tmp and self.PointArray[i].IsUsed
  end
  self.CanOpen = not tmp
  local Player = Battle(self):GetEntity(PlayerEid)
  local CharacterInfo = DataMgr.PlayerStateMachine[Player.AutoSyncProp.CharacterTag]
  self.CanOpen = self.CanOpen and not CharacterInfo.Seating
end

function BP_SeatBase_C:FindPoint(PlayerEid)
  local Result
  local ResDis = 99999
  for i = 1, self.PointArray:Length() do
    if not self.PointArray[i].IsUsed then
      local Dis = self:SeatGetPlayerPointDis(Battle(self):GetEntity(PlayerEid), self.PointArray[i])
      if nil == Result or ResDis > Dis or Dis == ResDis and math.random() >= 0.5 then
        Result = self.PointArray[i]
        ResDis = Dis
      end
    end
  end
  if not Result then
    print(_G.LogTag, "LXZ FindPoint Failed", self:GetName(), PlayerEid, self.PointArray:Length())
  end
  return Result
end

function BP_SeatBase_C:SetSittingParam(Player, Point, EnterPoint)
  Player:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_OverLap, false)
  Player:SetCollisionType("CapsuleComponent", "Pawn", ECollisionResponse.ECR_OverLap, false)
  local UpDiff = self:SeatGetUpDiff(Player.Mesh, Point, 50, true)
  local RootMotionDis = 30
  local BattleCharTag = ""
  if Player:IsNPC() == false then
    BattleCharTag = DataMgr.BattleChar[Player.CurrentRoleId].BattleCharTag[1]
  end
  if "Girl" == BattleCharTag then
    RootMotionDis = 30
  elseif "Man" == BattleCharTag then
    RootMotionDis = 20
  elseif "Woman" == BattleCharTag then
    RootMotionDis = 30
  else
    RootMotionDis = 20
  end
  if Player:GetMovementComponent() then
    Player:GetMovementComponent().RootMotionZScale = UpDiff / RootMotionDis
  end
end

function BP_SeatBase_C:SetLeavingParam(Player, Point, EnterPoint)
  Player:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_Block, false)
  Player:SetCollisionType("CapsuleComponent", "Pawn", ECollisionResponse.ECR_Block, false)
  local UpDiff = self:SeatGetUpDiff(Player.Mesh, EnterPoint, Player.OriginHalfHeight, false)
  local RootMotionDis = 30
  local BattleCharTag = ""
  if Player:IsNPC() == false then
    BattleCharTag = DataMgr.BattleChar[Player.CurrentRoleId].BattleCharTag[1]
  end
  if "Girl" == BattleCharTag then
    RootMotionDis = 30
  elseif "Man" == BattleCharTag then
    RootMotionDis = 20
  elseif "Woman" == BattleCharTag then
    RootMotionDis = 30
  else
    RootMotionDis = 20
  end
  Player:GetMovementComponent().RootMotionZScale = UpDiff / RootMotionDis
end

function BP_SeatBase_C:GetLeavingType(Player)
  local TypeList = {
    "F",
    "R",
    "F",
    "L",
    "F",
    "R",
    "F"
  }
  local x = Player.MoveInputCache.X
  local y = Player.MoveInputCache.Y
  local PlayerForward = UE4.UKismetMathLibrary.GetForwardVector(Player:K2_GetActorRotation())
  local CameraForward = Player.CharCameraComponent:GetForwardVector()
  local PlayerForward2D = UE4.UKismetMathLibrary.Normal2D(FVector2D(PlayerForward.X, PlayerForward.Y))
  local CameraForward2D = UE4.UKismetMathLibrary.Normal2D(FVector2D(CameraForward.X, CameraForward.Y))
  local Direct = PlayerForward2D.Y * CameraForward2D.X - PlayerForward2D.X * CameraForward2D.Y
  local Angle = UE4.UKismetMathLibrary.DegAcos(PlayerForward2D.X * CameraForward2D.X + PlayerForward2D.Y * CameraForward2D.Y)
  if Direct > 0 then
    Angle = 360 - Angle
  end
  if Angle > 315 then
    Angle = Angle - 315
  end
  local Index = 1
  local Offset = (Angle + 45) // 90
  if math.abs(x) >= math.abs(y) then
    if x > 0 then
      Index = 1
    else
      Index = 3
    end
  elseif y > 0 then
    Index = 2
  else
    Index = 4
  end
  return TypeList[Index + Offset]
end

function BP_SeatBase_C:GetLeavingPoint(Player)
  return self.PlayerAndSeat[Player.Eid]:FindLeavingPoint(self:GetLeavingType(Player))
end

function BP_SeatBase_C:NpcGetLeavingPoint(Npc)
  if not self.PlayerAndSeat[Npc.Eid] then
    return nil
  end
  return self.PlayerAndSeat[Npc.Eid]:NpcFindLeavingPoint(Npc)
end

function BP_SeatBase_C:OnEMActorDestroy(...)
  BP_SeatBase_C.Super.OnEMActorDestroy(self, ...)
  for PlayerEid, Point in pairs(self.PlayerAndSeat) do
    self.ChestInteractiveComponent:EndInteractive(self.Eid, PlayerEid)
  end
end

function BP_SeatBase_C:OpenMechanismWithoutInteractive(Character, CallBackFunc, IsImmediately)
  if not self.InitSuccess then
    self.CacheOpenMechanismWithoutInteractive = {
      CharacterEid = Character.Eid,
      CallBackFunc = CallBackFunc,
      SourceFunc = self.OpenMechanismWithoutInteractive
    }
    return
  end
  if not IsValid(Character) then
    return
  end
  local Point = self:FindPoint(Character.Eid)
  if not Point then
    print(_G.LogTag, "LXZ OpenMechanismWithoutInteractive", Character:GetName(), self:GetName())
    return
  end
  local EnterPoint = Point:NpcFindEnterPoint(Character)
  local RealZ = Character:K2_GetActorLocation().Z
  local Loc = FVector(EnterPoint:K2_GetComponentLocation().X, EnterPoint:K2_GetComponentLocation().Y, RealZ)
  local Rot = EnterPoint:K2_GetComponentRotation()
  Point.IsUsed = true
  Point.EnterType = EnterPoint.Type
  self.PlayerAndSeat[Character.Eid] = Point
  local handle = UE4.ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, value)
      Character.MoveInput = FVector(0, 0, 0)
      Character.MoveInputCache = FVector(0, 0, 0)
      Character:K2_SetActorLocationAndRotation(value, Rot, false, nil, false)
    end
  }, Character:K2_GetActorLocation(), Loc, 0.1, 0)
  handle:OnComplete({
    self,
    function()
      if not IsValid(Character) then
        return
      end
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      Character:SetCharacterTag(self.ChestInteractiveComponent.InteractiveTag)
      self:SetSittingParam(Character, Point, EnterPoint)
      Character.CapsuleComponent:IgnoreActorWhenMoving(self, true)
      Character.CapsuleComponent:IgnoreActorWhenMoving(Player, true)
      local Result = TArray(AActor)
      local MeshClass = UE4.AStaticMeshActor
      UE4.UKismetSystemLibrary.BoxOverlapActors(self, EnterPoint:K2_GetComponentLocation() + FVector(0, 0, Character.CapsuleComponent.CapsuleHalfHeight + 2), FVector(80, 80, 30), nil, MeshClass, nil, Result)
      for _, Actor in pairs(Result) do
        if Actor then
          Character.CapsuleComponent:IgnoreActorWhenMoving(Actor, true)
        end
      end
      if Character:GetMovementComponent() then
        local GravityScale = Character:GetMovementComponent().GravityScale
        Character.SitGravityScale = GravityScale
        Character:GetMovementComponent().GravityScale = 0
        if not Character:GetMovementComponent():IsComponentTickEnabled() then
          if Character.SetNpcMovementTickEnable then
            Character:SetNpcMovementTickEnable(true)
          else
            Character:GetMovementComponent():SetComponentTickEnabled(true)
          end
        end
      end
      Character:NpcSitSeat_Transform(Point, EnterPoint, Character.CapsuleComponent.CapsuleHalfHeight)
      if Character.NpcAnimInstance then
        Character.NpcAnimInstance.EnableDataFootIK = false
      end
      
      local function Completed()
      end
      
      local function NotifyBegin()
        if CallBackFunc then
          CallBackFunc()
        end
        EventManager:FireEvent(EventID.OnNpcPoseChange)
        Character:SetNpcMovementTickEnable(false)
      end
      
      local AllCallback = {OnCompleted = Completed, OnNotifyBegin = NotifyBegin}
      if self.PlayerAndSeat[Character.Eid] and self.PlayerAndSeat[Character.Eid].EnterType then
        local MontageName = self.ChestInteractiveComponent.MontageName .. "_" .. self.PlayerAndSeat[Character.Eid].EnterType .. "_Montage"
        if Character.NpcId and DataMgr.Npc[Character.NpcId] and DataMgr.Npc[Character.NpcId].SpecialSit then
          MontageName = DataMgr.Npc[Character.NpcId].SpecialSit
        end
        if nil == IsImmediately or false == IsImmediately then
          Character:PlayActionMontage("Interactive/MechInteractive", MontageName, AllCallback, false, true, false)
        else
          local MontPath = Character:GetMontagePath("Interactive/MechInteractive", MontageName)
          Character:K2_SetActorLocationAndRotation(Point:K2_GetComponentLocation(), Rot, false, nil, false)
          UResourceLibrary.LoadObjectAsync(self, MontPath, {
            self,
            function(_, Montage)
              UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(Character.Mesh, Montage, 1, 0, "SitLoop")
              EventManager:FireEvent(EventID.OnNpcPoseChange)
              if CallBackFunc then
                CallBackFunc()
              end
            end
          })
          return
        end
      end
      Character:AddTimer(0.1, function()
        local Section = Character.Mesh:GetAnimInstance():Montage_GetCurrentSection()
        if "SitLoop" == Section then
          Character:RemoveTimer("SitToLoop")
          EventManager:FireEvent(EventID.OnNpcPoseChange)
        end
      end, true, 0, "SitToLoop")
    end
  })
  Character:AddTimer(3, function()
    local HasSection = Character.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("SitLoop")
    if HasSection then
      Character:SetNpcMovementTickEnable(false)
      Character:RemoveTimer("DelayCloseNpcMovementTickBySit")
    end
  end, true, 0, "DelayCloseNpcMovementTickBySit")
end

function BP_SeatBase_C:CloseMechanismWithoutInteractive(Character, Callback)
  Character:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  Character:SetNpcMovementTickEnable(true)
  local EnterPoint = self:NpcGetLeavingPoint(Character)
  self.PlayerAndSeat[Character.Eid].EnterType = EnterPoint.Type
  self:SetLeavingParam(Character, self.PlayerAndSeat[Character.Eid], EnterPoint)
  local MontageName = "SitEnd" .. self.PlayerAndSeat[Character.Eid].EnterType
  if Character.NpcId and DataMgr.Npc[Character.NpcId] and DataMgr.Npc[Character.NpcId].SpecialSit then
    MontageName = "SitEnd"
  end
  Character.Mesh:GetAnimInstance():Montage_JumpToSection(MontageName)
  if Character.Mesh:GetAnimInstance() and Character.Mesh:GetAnimInstance().GetMontageSectionTime then
    local EndSectionTime = Character.Mesh:GetAnimInstance():GetMontageSectionTime(MontageName)
    Character:AddTimer(EndSectionTime, function()
      if Callback then
        Callback()
      end
      self.PlayerAndSeat[Character.Eid].IsUsed = false
      self.PlayerAndSeat[Character.Eid] = nil
      EventManager:FireEvent(EventID.OnNpcPoseChange)
      Character:AddTimer(3, function()
        Character:SetNpcMovementTickEnable(false)
        Character:RemoveTimer("DelayCloseNpcMovementTickByStand")
      end, true, 0, "DelayCloseNpcMovementTickByStand")
      Character:SetCharacterTag("Idle")
      Character:RemoveTimer("StandCallBackTimer")
    end, false, 0, "StandCallBackTimer")
  end
end

function BP_SeatBase_C:CloseMechanismWithoutMontage(Character)
  Character:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  local EnterPoint = self:NpcGetLeavingPoint(Character)
  if EnterPoint then
    self.PlayerAndSeat[Character.Eid].EnterType = EnterPoint.Type
    self:SetLeavingParam(Character, self.PlayerAndSeat[Character.Eid], EnterPoint)
    local LeaveLoc = EnterPoint:K2_GetComponentLocation()
    LeaveLoc.Z = LeaveLoc.Z + Character.CapsuleComponent.CapsuleHalfHeight + 2
    Character:K2_SetActorLocation(LeaveLoc, false, nil, false)
  else
    local LeaveLoc = Character.RootComponent:K2_GetComponentLocation()
    local ForWardUpVector = Character:GetActorForWardVector() * 50
    LeaveLoc = LeaveLoc + ForWardUpVector
    Character:K2_SetActorLocation(LeaveLoc, false, nil, false)
  end
  local CurrentMontage = Character.Mesh:GetAnimInstance():GetCurrentActiveMontage()
  if CurrentMontage then
    Character.Mesh:GetAnimInstance():Montage_Stop(0, CurrentMontage)
  end
  if IsValid(self.PlayerAndSeat[Character.Eid]) then
    self.PlayerAndSeat[Character.Eid].IsUsed = false
  end
  self.PlayerAndSeat[Character.Eid] = nil
  Character:SetCharacterTag("Idle")
  if Character.SetNpcMovementTickEnable then
    Character:SetNpcMovementTickEnable(false)
  end
end

function BP_SeatBase_C:OpenMechanismNpcSpecial(Character, CallBackFunc)
  if not Character then
    return
  end
  if not self.InitSuccess then
    self.CacheOpenMechanismWithoutInteractive = {
      CharacterEid = Character.Eid,
      CallBackFunc = CallBackFunc,
      SourceFunc = self.OpenMechanismNpcSpecial
    }
    return
  end
  local Point = self:FindPoint(Character.Eid)
  if Point then
    Point.IsUsed = true
    Point.EnterType = "F"
    self.PlayerAndSeat[Character.Eid] = Point
  end
  return Point
end

function BP_SeatBase_C:CloseMechanismNpcSpecial(Character, CallBackFunc)
  if IsValid(self.PlayerAndSeat[Character.Eid]) then
    self.PlayerAndSeat[Character.Eid].IsUsed = false
  end
  self.PlayerAndSeat[Character.Eid] = nil
end

return BP_SeatBase_C
