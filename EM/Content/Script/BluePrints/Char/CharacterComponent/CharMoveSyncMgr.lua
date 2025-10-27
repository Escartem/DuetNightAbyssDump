local SkillUtils = require("Utils.SkillUtils")
local TimeUtils = require("Utils.TimeUtils")
local Component = {}

function Component:SyncLocation_Lua(ActorLoc, ActorRot, CurVel, Acceleration, MovementMode)
  local SyncInfo = {}
  SyncInfo.Type = "Move"
  SyncInfo.Location = {
    X = ActorLoc.X,
    Y = ActorLoc.Y,
    Z = ActorLoc.Z
  }
  SyncInfo.Rotation = {
    Pitch = ActorRot.Pitch,
    Yaw = ActorRot.Yaw,
    Roll = ActorRot.Roll
  }
  SyncInfo.Velocity = {
    X = CurVel.X,
    Y = CurVel.Y,
    Z = CurVel.Z
  }
  SyncInfo.Acceleration = {
    X = Acceleration.X,
    Y = Acceleration.Y,
    Z = Acceleration.Z
  }
  SyncInfo.MovementMode = MovementMode
  if CurVel:Size() > 0 or Acceleration:Size() > 0 then
    self.CurResourceId = 0
  end
  SyncInfo.CurResourceId = self.CurResourceId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  SyncInfo.TimeStamp = TimeUtils:NowTime()
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:SyncnUsingWeapon_Lua(UsingWeaponType)
  local SyncInfo = {}
  SyncInfo.Type = "SwitchShowWeapon"
  SyncInfo.ShowWeapon = UsingWeaponType
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  print(_G.LogTag, "SyncnUsingWeapon_Lua", UsingWeaponType)
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:PackSyncInfo(MoveInfo, MainPlayer)
  local ActorLoc = FVector(MoveInfo.Location.X, MoveInfo.Location.Y, MoveInfo.Location.Z)
  local ActorRot = FRotator(MoveInfo.Rotation.Pitch, MoveInfo.Rotation.Yaw, MoveInfo.Rotation.Roll)
  local CurVel = FVector(MoveInfo.Velocity.X, MoveInfo.Velocity.Y, MoveInfo.Velocity.Z)
  local Acceleration = FVector(MoveInfo.Acceleration.X, MoveInfo.Acceleration.Y, MoveInfo.Acceleration.Z)
  local MovementMode = MoveInfo.MovementMode
  local TimeStamp = MoveInfo.TimeStamp
  local ResourceId = MoveInfo.CurResourceId
  if CurVel:Size() > 0 or Acceleration:Size() > 0 then
    ResourceId = 0
  end
  if 0 ~= ResourceId then
    MoveInfo.ExpressionId = ResourceId
  end
  if MainPlayer then
    MainPlayer:CanPlayerBeInterCandidate(self.Eid, ActorLoc)
  end
  self:PackSyncInfo_Cpp(ActorLoc, ActorRot, CurVel, Acceleration, MovementMode, TimeStamp)
end

function Component:SendPrepareInfoNew_Lua(FeatureObj)
  local SyncInfo = {}
  SyncInfo.Type = "Action"
  SyncInfo.ClassName = FeatureObj:StaticClass():GetName()
  local Table = FeatureObj:GetActionInfo()
  for k, v in pairs(Table) do
    SyncInfo[k] = v
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  SyncInfo.TimeStamp = TimeUtils:NowTime()
  SyncInfo.UsingActionNew = 1
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:SendPrepareInfo_Lua(ClassName, IntMap, FloatMap, VectorMap, RotatorMap, EnumMap)
  local SyncInfo = {}
  SyncInfo.Type = "Action"
  SyncInfo.ClassName = ClassName
  SyncInfo.IntMap = IntMap:ToTable()
  SyncInfo.FloatMap = FloatMap:ToTable()
  local VectorMap = VectorMap:ToTable()
  local RotatorMap = RotatorMap:ToTable()
  SyncInfo.EnumMap = EnumMap:ToTable()
  PrintTable({
    ZJYRegionReceivesyncInfo = SyncInfo.EnumMap
  }, 4)
  SyncInfo.VectorMap = {}
  for k, v in pairs(VectorMap) do
    SyncInfo.VectorMap[k] = {
      X = v.X,
      Y = v.Y,
      Z = v.Z
    }
  end
  SyncInfo.RotatorMap = {}
  for k, v in pairs(RotatorMap) do
    SyncInfo.RotatorMap[k] = {
      Pitch = v.Pitch,
      Yaw = v.Yaw,
      Roll = v.Roll
    }
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  SyncInfo.TimeStamp = TimeUtils:NowTime()
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:SendVisibleMessage(ShouldHide)
  local SyncInfo = {}
  SyncInfo.Type = "Hide"
  SyncInfo.ActorVisible = ShouldHide
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:ReceiveHideInfo_Lua(MoveInfo)
  local ActorVisible = MoveInfo.ActorVisible
  self:ReceiveVisibleMessage(ActorVisible)
end

function Component:ReceivePrepareInfo_Lua(MoveInfo)
  print(_G.LogTag, "ReceivePrepareInfo_Lua", MoveInfo.UsingActionNew)
  if MoveInfo.UsingActionNew and MoveInfo.UsingActionNew > 0 then
    local ClassName = MoveInfo.ClassName
    local FeatureClass
    if UE4["U" .. ClassName] then
      FeatureClass = UE4["U" .. ClassName]:StaticClass()
    end
    self:ReceivePrepareInfoNew(FeatureClass, MoveInfo)
    return
  end
  local ClassName = MoveInfo.ClassName
  local IntMap = TMap("", 0)
  local FloatMap = TMap("", 0.0)
  local VectorMap = TMap("", FVector())
  local RotatorMap = TMap("", FRotator())
  local EnumMap = TMap("", 0)
  if MoveInfo.CanOverrideXYSpeed then
    IntMap:Add("CanOverrideXYSpeed", MoveInfo.CanOverrideXYSpeed)
  end
  if MoveInfo.JumpState then
    EnumMap:Add("JumpState", MoveInfo.JumpState)
  end
  if MoveInfo.WallJumpDirInd then
    EnumMap:Add("WallJumpDirInd", MoveInfo.WallJumpDirInd)
  end
  if MoveInfo.TargetDirection then
    VectorMap:Add("TargetDirection", FVector(MoveInfo.TargetDirection.X, MoveInfo.TargetDirection.Y, MoveInfo.TargetDirection.Z))
  end
  if MoveInfo.MoveInputCache then
    VectorMap:Add("MoveInputCache", FVector(MoveInfo.MoveInputCache.X, MoveInfo.MoveInputCache.Y, MoveInfo.MoveInputCache.Z))
  end
  if MoveInfo.BulletForward then
    VectorMap:Add("BulletForward", FVector(MoveInfo.BulletForward.X, MoveInfo.BulletForward.Y, MoveInfo.BulletForward.Z))
  end
  if MoveInfo.MaxClimbHeightCanReach then
    VectorMap:Add("MaxClimbHeightCanReach", FVector(MoveInfo.MaxClimbHeightCanReach.X, MoveInfo.MaxClimbHeightCanReach.Y, MoveInfo.MaxClimbHeightCanReach.Z))
  end
  if MoveInfo.DownwardLocation then
    VectorMap:Add("DownwardLocation", FVector(MoveInfo.DownwardLocation.X, MoveInfo.DownwardLocation.Y, MoveInfo.DownwardLocation.Z))
  end
  if MoveInfo.ClimbTowards then
    VectorMap:Add("ClimbTowards", FVector(MoveInfo.ClimbTowards.X, MoveInfo.ClimbTowards.Y, MoveInfo.ClimbTowards.Z))
  end
  if MoveInfo.DeltaTrans then
    VectorMap:Add("DeltaTrans", FVector(MoveInfo.DeltaTrans.Location.X, MoveInfo.DeltaTrans.Location.Y, MoveInfo.DeltaTrans.Location.Z))
  end
  if MoveInfo.TargetLocation then
    VectorMap:Add("TargetLocation", FVector(MoveInfo.TargetLocation.X, MoveInfo.TargetLocation.Y, MoveInfo.TargetLocation.Z))
  end
  if MoveInfo.HorizontalImapct then
    VectorMap:Add("HorizontalImapct", FVector(MoveInfo.HorizontalImapct.X, MoveInfo.HorizontalImapct.Y, MoveInfo.HorizontalImapct.Z))
  end
  if MoveInfo.JumpVelocity then
    VectorMap:Add("JumpVelocity", FVector(MoveInfo.JumpVelocity.X, MoveInfo.JumpVelocity.Y, MoveInfo.JumpVelocity.Z))
  end
  if MoveInfo.BulletJumpRotation then
    RotatorMap:Add("BulletJumpRotation", FRotator(MoveInfo.BulletJumpRotation.Pitch, MoveInfo.BulletJumpRotation.Yaw, MoveInfo.BulletJumpRotation.Roll))
  end
  if MoveInfo.BulletJumpForward then
    VectorMap:Add("BulletJumpForward", FVector(MoveInfo.BulletJumpForward.X, MoveInfo.BulletJumpForward.Y, MoveInfo.BulletJumpForward.Z))
  end
  if MoveInfo.WallJumpDirection then
    VectorMap:Add("WallJumpDirection", FVector(MoveInfo.WallJumpDirection.X, MoveInfo.WallJumpDirection.Y, MoveInfo.WallJumpDirection.Z))
  end
  local FeatureClass
  if UE4["U" .. ClassName] then
    FeatureClass = UE4["U" .. ClassName]:StaticClass()
  end
  self:ReceivePrepareInfo(FeatureClass, IntMap, FloatMap, VectorMap, RotatorMap, EnumMap)
end

function Component:SendStopActionInfo(ClassName)
  local SyncInfo = {}
  SyncInfo.Type = "StopAction"
  SyncInfo.ClassName = ClassName
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.CurrentOnlineType then
    return
  end
  if Avatar.CurrentOnlineType < 0 then
    return
  end
  SyncInfo.TimeStamp = TimeUtils:NowTime()
  Avatar:SendSyncInfo(SyncInfo)
end

function Component:ReceiveStopActionInfo_Lua(MoveInfo)
  local ClassName = MoveInfo.ClassName
  local FeatureClass
  if UE4["U" .. ClassName] then
    FeatureClass = UE4["U" .. ClassName]:StaticClass()
  end
  self:ReceiveStopActionInfo(FeatureClass)
end

return Component
