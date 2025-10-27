local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Vector3 = Class("Vector3", CustomTypes.CustomAttr)
Vector3.__Props__ = {
  X = prop.prop("Float", "", 0),
  Y = prop.prop("Float", "", 0),
  Z = prop.prop("Float", "", 0)
}
FormatProperties(Vector3)
local Rotation = Class("Rotation", CustomTypes.CustomAttr)
Rotation.__Props__ = {
  Pitch = prop.prop("Float", "", 0),
  Yaw = prop.prop("Float", "", 0),
  Roll = prop.prop("Float", "", 0)
}
FormatProperties(Rotation)
local Transform = Class("Transform", CustomTypes.CustomAttr)
Transform.__Props__ = {
  Location = prop.prop("Vector3", ""),
  Rotation = prop.prop("Rotation", "")
}
FormatProperties(Transform)
local Str2Vector3Dict = Class("Str2Vector3Dict", CustomTypes.CustomDict)
Str2Vector3Dict.KeyType = BaseTypes.Str
Str2Vector3Dict.ValueType = Vector3
local Str2RotationDict = Class("Str2RotationDict", CustomTypes.CustomDict)
Str2RotationDict.KeyType = BaseTypes.Str
Str2RotationDict.ValueType = Rotation
local MoveMessage = Class("MoveMessage", CustomTypes.CustomAttr)
MoveMessage.__Props__ = {
  Type = prop.prop("Str", ""),
  Rotation = prop.prop("Rotation", ""),
  Acceleration = prop.prop("Vector3", ""),
  Location = prop.prop("Vector3", ""),
  Velocity = prop.prop("Vector3", ""),
  MovementMode = prop.prop("Int", ""),
  TimeStamp = prop.prop("Int", ""),
  CurResourceId = prop.prop("Int", "")
}
FormatProperties(MoveMessage)
local ActionMessage = Class("ActionMessage", CustomTypes.CustomAttr)
ActionMessage.__Props__ = {
  Type = prop.prop("Str", ""),
  TimeStamp = prop.prop("Int", ""),
  ClassName = prop.prop("Str", ""),
  ResetJumpCount = prop.prop("Int", ""),
  CrouchByStuck = prop.prop("Int", ""),
  KeepKeyDown = prop.prop("Int", ""),
  JumpState = prop.prop("Int", ""),
  Turned = prop.prop("Int", ""),
  ChargeFirstTime = prop.prop("Int", ""),
  CanOverrideXYSpeed = prop.prop("Int", ""),
  BulletJumpDash = prop.prop("Int", ""),
  ExecuteTimes = prop.prop("Int", ""),
  WallJumpDirInd = prop.prop("Int", ""),
  TargetDirection = prop.prop("Vector3", ""),
  MoveInputCache = prop.prop("Vector3", ""),
  BulletForward = prop.prop("Vector3", ""),
  MaxClimbHeightCanReach = prop.prop("Vector3", ""),
  DownwardLocation = prop.prop("Vector3", ""),
  ClimbTowards = prop.prop("Vector3", ""),
  DeltaTrans = prop.prop("Vector3", ""),
  TargetLocation = prop.prop("Vector3", ""),
  HorizontalImapct = prop.prop("Vector3", ""),
  JumpVelocity = prop.prop("Vector3", ""),
  BulletJumpRotation = prop.prop("Rotation", ""),
  BulletJumpForward = prop.prop("Vector3", ""),
  CtrlForward = prop.prop("Vector3", ""),
  CtrlRight = prop.prop("Vector3", ""),
  WallJumpDirection = prop.prop("Vector3", ""),
  UsingActionNew = prop.prop("Int", "")
}
FormatProperties(ActionMessage)
local StopActionMessage = Class("StopActionMessage", CustomTypes.CustomAttr)
StopActionMessage.__Props__ = {
  Type = prop.prop("Str", ""),
  TimeStamp = prop.prop("Int", ""),
  ClassName = prop.prop("Str", "")
}
FormatProperties(StopActionMessage)
local HideActionMessage = Class("HideActionMessage", CustomTypes.CustomAttr)
HideActionMessage.__Props__ = {
  Type = prop.prop("Str", ""),
  ActorVisible = prop.prop("Bool", "")
}
FormatProperties(HideActionMessage)
local SwitchShowWeapon = Class("SwitchShowWeapon", CustomTypes.CustomAttr)
SwitchShowWeapon.__Props__ = {
  Type = prop.prop("Str", ""),
  ShowWeapon = prop.prop("Str", "")
}
FormatProperties(SwitchShowWeapon)
local OnlineClientMessage = Class("OnlineClientMessage", CustomTypes.CustomAttr)
OnlineClientMessage.__Props__ = {
  Sender = prop.prop("ObjId", ""),
  Type = prop.prop("Str", ""),
  Move = prop.prop("MoveMessage", ""),
  Action = prop.prop("ActionMessage", ""),
  StopAction = prop.prop("StopActionMessage", ""),
  Hide = prop.prop("HideActionMessage", ""),
  SwitchShowWeapon = prop.prop("SwitchShowWeapon", "")
}
FormatProperties(OnlineClientMessage)
local OnlineClientMessageList = Class("OnlineClientMessageList", CustomTypes.CustomList)
OnlineClientMessageList.ValueType = OnlineClientMessage
return {
  Vector3 = Vector3,
  Rotation = Rotation,
  Transform = Transform,
  Str2Vector3Dict = Str2Vector3Dict,
  Str2RotationDict = Str2RotationDict,
  MoveMessage = MoveMessage,
  ActionMessage = ActionMessage,
  StopActionMessage = StopActionMessage,
  HideActionMessage = HideActionMessage,
  OnlineClientMessage = OnlineClientMessage,
  SwitchShowWeapon = SwitchShowWeapon,
  OnlineClientMessageList = OnlineClientMessageList
}
