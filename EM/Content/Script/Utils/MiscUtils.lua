local CommonUtils = require("Utils.CommonUtils")
local Utils = {}
local GetDisplayName = UE4.UKismetSystemLibrary.GetDisplayName
local IsObjId = CommonUtils.IsObjId
local ObjId2Str = CommonUtils.ObjId2Str
local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
local IsValid = UE4.UObject.IsValid

function Utils.IsValid(Object)
  if nil == Object then
    return false
  end
  if not Object.IsValid then
    Traceback(WarningTag, "Utils.IsValid\230\156\172\230\132\143\230\152\175\231\187\153UObject\229\136\164\230\150\173\230\156\137\230\149\136\230\128\167\231\154\132\239\188\140\228\184\141\229\187\186\232\174\174\228\188\160luaTable\232\191\155\230\157\165")
    return true
  end
  return IsValid(Object)
end

Utils.PrintArray = not (not bDistribution or bEnableShippingLog) and Utils.EmptyFunction or function(Targets, Log)
  if Targets.ToArray then
    Targets = Targets:ToArray()
  end
  local s = "PrintArray:[" .. tostring(Log) .. "]" .. tostring(Targets) .. "\n"
  if Targets then
    for i, Target in pairs(Targets) do
      s = s .. "\t" .. tostring(i) .. ":" .. tostring(Target) .. ":" .. tostring(UE4.UKismetSystemLibrary.GetDisplayName(Target)) .. "\n"
    end
  end
  print(LogTag, s)
end

function Utils.DumpMap(map)
  local ret = {}
  local keys = map:Keys()
  for i = 1, keys:Length() do
    local key = keys:Get(i)
    local value = map:Find(key)
    table.insert(ret, key .. ":" .. tostring(value))
  end
  return "{" .. table.concat(ret, ",") .. "}"
end

function Utils.DumpArray(array)
  local ret = {}
  for i = 1, array:Length() do
    table.insert(ret, array:Get(i))
  end
  return "[" .. table.concat(ret, ",") .. "]"
end

function Utils.DumpSet(set)
  local array = set:ToArray()
  local ret = {}
  for i = 1, array:Length() do
    table.insert(ret, array:Get(i))
  end
  return "(" .. table.concat(ret, ",") .. ")"
end

Utils.PrintMap = not (not bDistribution or bEnableShippingLog) and Utils.EmptyFunction or function(Map)
  PrintTable(Map:ToTable())
end
Utils.Error = not (not bDistribution or bEnableShippingLog) and Utils.EmptyFunction or function(log)
  local s = "Error.." .. tostring(log)
  print(LogTag, s)
end

function Utils.Trim(str)
  return (string.gsub(str, "^[%s\n\r\t]*(.-)[%s\n\r\t]*$", "%1"))
end

function Utils.TrimAll(str)
  return (str:gsub("%s+", ""))
end

function Utils.Keys(Table)
  local Keys = {}
  for k, v in pairs(Table) do
    table.insert(Keys, k)
  end
  return Keys
end

function Utils.Values(Table)
  local Values = {}
  for k, v in pairs(Table) do
    table.insert(Values, v)
  end
  return Values
end

function Utils.IKeys(Table)
  local Keys = {}
  for k, v in ipairs(Table) do
    table.insert(Keys, k)
  end
  return Keys
end

function Utils.IValues(Table)
  local Values = {}
  for k, v in ipairs(Table) do
    table.insert(Values, v)
  end
  return Values
end

function Utils.PairsByKeys(Table)
  local KeyTable = {}
  for n in pairs(Table) do
    KeyTable[#KeyTable + 1] = n
  end
  table.sort(KeyTable)
  local i = 0
  return function()
    i = i + 1
    return KeyTable[i], Table[KeyTable[i]]
  end
end

function Utils.Swap(x, y)
  local Temp = x
  x = y
  y = Temp
  return x, y
end

function Utils.IsListenServer(Actor)
  return UNeModeFunctionLibrary.IsListenServer(Actor)
end

function Utils.IsSimulatedProxy(actor)
  return 1 == actor:GetLocalRole()
end

function Utils.IsAutonomousProxy(actor)
  return 2 == actor:GetLocalRole()
end

local IsActorValidInGame = UE4.AActor.IsActorValidInGame

function Utils.IsActorValid(Actor)
  if nil == Actor then
    return false
  end
  if not IsActorValidInGame then
    Utils.Traceback(ErrorTag, "Utils.IsActorValid\230\156\172\230\132\143\230\152\175\231\187\153Actor\229\136\164\230\150\173\230\156\137\230\149\136\230\128\167\231\154\132\239\188\140\228\184\141\229\187\186\232\174\174\228\188\160\229\133\182\228\187\150\231\177\187\229\158\139\229\175\185\232\177\161\232\191\155\230\157\165")
    return true
  end
  return IsActorValidInGame(Actor)
end

function Utils.IsWithoutAvatar(InWorldContext)
  local IsPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(InWorldContext)
  local Avatar = GWorld:GetAvatar()
  return true == IsPIE and nil == Avatar
end

function Utils.IsTakeRecorderCapturing(WorldContext)
  if Utils.IsWithoutAvatar(WorldContext) then
    local GameInstance = UGameplayStatics.GetGameInstance(WorldContext)
    if GameInstance.IsTakeRecorderCapturing then
      return true
    end
  end
  return false
end

function Utils.GetObjectRight(ObjectInst)
  local ObjectRight = FVector()
  if ObjectInst.GetActorRightVector then
    ObjectRight = ObjectInst:GetActorRightVector()
  elseif ObjectInst.GetRightVector then
    ObjectRight = ObjectInst:GetRightVector()
  end
  return ObjectRight
end

function Utils.GetObjectFoward(ObjectInst)
  local ObjectForward = FVector()
  if ObjectInst.GetActorForwardVector then
    ObjectForward = ObjectInst:GetActorForwardVector()
  elseif ObjectInst.GetForwardVector then
    ObjectForward = ObjectInst:GetForwardVector()
  end
  return ObjectForward
end

function Utils.GetObjectLocation(ObjectInst)
  local ObjectLoc = FVector()
  if ObjectInst.K2_GetActorLocation then
    ObjectLoc = ObjectInst:K2_GetActorLocation()
  elseif ObjectInst.K2_GetComponentLocation then
    ObjectLoc = ObjectInst:K2_GetComponentLocation()
  end
  return ObjectLoc
end

function Utils.GetHitActor(HitResult)
  return GlobalFunctionLibrary:get().GetHitActor(HitResult)
end

function Utils.ToFVector(t)
  if t.X then
    return FVector(t.X, t.Y, t.Z)
  else
    return FVector(t[1], t[2], t[3])
  end
end

function Utils.TransEPhysicalSurface(EPhysicalSurface)
  return GlobalFunctionLibrary:get().TransEPhysicalSurface(EPhysicalSurface)
end

function Utils.GameMode(context)
  context = context or GWorld.GameInstance
  return UE4.UGameplayStatics.GetGameMode(context)
end

function Utils.LazyLoadClass(str, persistent)
  local object = {}
  object.path = str
  
  function object:get()
    if IsValid(self.object) then
      return self.object
    end
    self.object = LoadClass(self.path)
    if persistent then
      AddToRoot(self.object)
    end
    return self.object
  end
  
  return object
end

function Utils.LazyLoadObject(str)
  local object = {}
  object.path = str
  
  function object:get()
    if self.object and Utils.IsValid(self.object) then
      return self.object
    elseif self.path ~= "" or self.path ~= nil then
      return LoadObject(self.path)
    end
    self.object = LoadObject(self.path)
    return self.object
  end
  
  return object
end

local GlobalDamageStruct = Utils.LazyLoadClass("/Game/BluePrints/Combat/BP_DamageStruct.BP_DamageStruct", true)
local PetClass = Utils.LazyLoadClass("/Game/BluePrints/Char/BP_PetNpc/BP_PetNPC.BP_PetNPC_C", true)

function Utils.DamageEventClass()
  return GlobalDamageStruct:get()
end

function Utils.PreloadPetClass()
  DebugPrint("BP_PetNpc Class", PetClass:get())
end

function Utils.Round(FloatValue)
  if 0 == FloatValue then
    return 0
  end
  if FloatValue > 0 then
    return math.floor(FloatValue + 0.5)
  else
    return -Utils.Round(-FloatValue)
  end
end

function Utils.IsNilOrEmpty(InStr)
  return nil == InStr or "" == InStr
end

function Utils.InArray(Array, Value)
  if not Array or 0 == Array:Length() then
    return false
  end
  for i = 1, Array:Length() do
    if Value == Array:GetRef(i) then
      return true
    end
  end
  return false
end

function Utils.Int(FloatValue)
  if 0 == FloatValue then
    return 0
  end
  if FloatValue > 0 then
    return math.floor(FloatValue + 1.0E-4)
  else
    return -Utils.Int(-FloatValue)
  end
end

function Utils.NumberToBool(Number)
  if nil == Number then
    return false
  end
  if type(Number) == "boolean" then
    return Number
  end
  if 0 == Number then
    return false
  end
  if 1 == Number then
    return true
  end
  return Number
end

function Utils.IsLowerAuthority(actor)
  return actor:GetLocalRole() < 3
end

function Utils.GetCacheClass(ActorPath)
  if Const.CacheClassMap then
    return Const.CacheClassMap[ActorPath]
  end
  return nil
end

function Utils.IsInRange(Source, Target, MinDis, MaxDis)
  local Dis = (Target - Source):Size()
  return MaxDis >= Dis and MinDis <= Dis
end

function Utils.IsInCircle(Source, Target, Radius)
  return Radius >= (Target - Source):Size()
end

function Utils.CircleCrossSegment(Point1, Point2, CircleCenter, CircleRadius)
  local Flag1 = (Point1.X - CircleCenter.X) * (Point1.X - CircleCenter.X) + (Point1.Y - CircleCenter.Y) * (Point1.Y - CircleCenter.Y) <= CircleRadius * CircleRadius
  local Flag2 = (Point2.X - CircleCenter.X) * (Point2.X - CircleCenter.X) + (Point2.Y - CircleCenter.Y) * (Point2.Y - CircleCenter.Y) <= CircleRadius * CircleRadius
  if Flag1 and Flag2 then
    return false
  elseif Flag1 or Flag2 then
    return true
  else
    local A = Point1.Y - Point2.Y
    local B = Point2.X - Point1.X
    local C = Point1:Cross(Point2)
    local Dist1 = A * CircleCenter.X + B * CircleCenter.Y + C
    Dist1 = Dist1 * Dist1
    local Dist2 = (A * A + B * B) * CircleRadius * CircleRadius
    if Dist1 > Dist2 then
      return false
    end
    local Angle1 = (CircleCenter - Point1):Dot(Point2 - Point1)
    local Angle2 = (CircleCenter - Point2):Dot(Point1 - Point2)
    if Angle1 > 0 and Angle2 > 0 then
      return true
    end
    return false
  end
end

function Utils.IsInsideSector(Source, SourceForward, Target, TargetRadius, Radius, Angle)
  if (Target - Source):Size() > TargetRadius + Radius then
    return false
  end
  if Angle >= 360 then
    return true
  end
  SourceForward:Normalize()
  local TargetToSource = Target - Source
  local HalfAngle = Angle / 2.0
  local CosHalfAngle = UE4.UKismetMathLibrary.DegCos(HalfAngle)
  local SinHalfAngle = UE4.UKismetMathLibrary.DegSin(HalfAngle)
  TargetToSource:Normalize()
  local TargetTheta = SourceForward:Dot(TargetToSource)
  local LeftEdge2D = FVector2D(SourceForward.X * CosHalfAngle - SourceForward.Y * SinHalfAngle, SourceForward.Y * CosHalfAngle + SourceForward.X * SinHalfAngle)
  LeftEdge2D:Normalize()
  local RightEdge2D = FVector2D(SourceForward.X * CosHalfAngle + SourceForward.Y * SinHalfAngle, SourceForward.Y * CosHalfAngle - SourceForward.X * SinHalfAngle)
  RightEdge2D:Normalize()
  local EdgeTheta = SourceForward:Dot(LeftEdge2D)
  if TargetTheta >= EdgeTheta then
    return true
  end
  local LeftEdgePoint = Source + LeftEdge2D * Radius
  local RightEdgePoint = Source + RightEdge2D * Radius
  if Utils.IsInCircle(Source, Target, TargetRadius) or Utils.IsInCircle(LeftEdgePoint, Target, TargetRadius) or Utils.IsInCircle(RightEdgePoint, Target, TargetRadius) then
    return true
  end
  if Utils.CircleCrossSegment(LeftEdgePoint, Source, Target, TargetRadius) or Utils.CircleCrossSegment(RightEdgePoint, Source, Target, TargetRadius) then
    return true
  end
  return false
end

function Utils.IsRingCrossSector(CenterPos2D, Forward2D, TargetLoc2D, OutterRadius, Radius, Angle, InnerRadius)
  if not Utils.IsInsideSector(CenterPos2D, Forward2D, TargetLoc2D, OutterRadius, Radius, Angle) then
    return false
  end
  if InnerRadius > (CenterPos2D - TargetLoc2D):Size() then
    return Utils.SectorCrossInnerCircle(CenterPos2D, Forward2D, TargetLoc2D, OutterRadius, Radius, Angle, InnerRadius)
  end
  return true
end

function Utils.SectorCrossInnerCircle(CenterPos2D, Forward2D, TargetLoc2D, OutterRadius, Radius, Angle, InnerRadius)
  Forward2D:Normalize()
  local HalfAngle = Angle / 2.0
  local CosHalfAngle = UE4.UKismetMathLibrary.DegCos(HalfAngle)
  local SinHalfAngle = UE4.UKismetMathLibrary.DegSin(HalfAngle)
  local LeftEdge2D = FVector2D(Forward2D.X * CosHalfAngle - Forward2D.Y * SinHalfAngle, Forward2D.Y * CosHalfAngle + Forward2D.X * SinHalfAngle)
  LeftEdge2D:Normalize()
  local RightEdge2D = FVector2D(Forward2D.X * CosHalfAngle + Forward2D.Y * SinHalfAngle, Forward2D.Y * CosHalfAngle - Forward2D.X * SinHalfAngle)
  RightEdge2D:Normalize()
  local LeftEdgePoint = CenterPos2D + LeftEdge2D * Radius
  local RightEdgePoint = CenterPos2D + RightEdge2D * Radius
  if not Utils.IsInCircle(LeftEdgePoint, TargetLoc2D, InnerRadius) or not Utils.IsInCircle(RightEdgePoint, TargetLoc2D, InnerRadius) then
    return true
  end
  if InnerRadius > (TargetLoc2D - CenterPos2D):Size() + Radius then
    return false
  end
  if 0 == (TargetLoc2D - CenterPos2D):Size() and InnerRadius <= Radius then
    return true
  end
  local EdgeTheta = Forward2D:Dot(LeftEdge2D)
  local TargetToSource = CenterPos2D - TargetLoc2D
  TargetToSource:Normalize()
  local TargetTheta = Forward2D:Dot(TargetToSource)
  if EdgeTheta > TargetTheta then
    return false
  end
  local MaxCrossPoint = CenterPos2D + TargetToSource * Radius
  return InnerRadius <= (MaxCrossPoint - TargetLoc2D):Size()
end

function Utils.PointInRect(TargetDotEdge, TargetToSourcePow2, TargetDotEdgePow2, RadiusPow2)
  return TargetDotEdge >= 0 and RadiusPow2 >= TargetToSourcePow2 - TargetDotEdgePow2
end

function Utils.CalculateQuadrant(CurrentDir, Angle)
  local Forward = 0
  local Backward = 1
  local Right = 6
  local Left = 7
  local Buffer = Const.Buffer
  if Utils.AngleInRange(Angle, Const.FLThreshold, Const.FRThreshold, Buffer, CurrentDir ~= Forward or CurrentDir ~= Backward) then
    return Forward
  end
  if Utils.AngleInRange(Angle, Const.FRThreshold, Const.BRThreshold, Buffer, CurrentDir ~= Right or CurrentDir ~= Left) then
    return Right
  end
  if Utils.AngleInRange(Angle, Const.BLThreshold, Const.FLThreshold, Buffer, CurrentDir ~= Right or CurrentDir ~= Left) then
    return Left
  end
  return Backward
end

function Utils.AngleInRange(Angle, MinAngle, MaxAngle, Buffer, IncreaseBuffer)
  if IncreaseBuffer then
    return Angle >= MinAngle - Buffer and Angle <= MaxAngle + Buffer
  end
  return Angle >= MinAngle + Buffer and Angle <= MaxAngle - Buffer
end

function Utils.BetweenTwoVec(Left, Mid, Right)
  local Left2D = UE4.UKismetMathLibrary.Conv_VectorToVector2D(Left)
  local Mid2D = UE4.UKismetMathLibrary.Conv_VectorToVector2D(Mid)
  local Right2D = UE4.UKismetMathLibrary.Conv_VectorToVector2D(Right)
  return Left2D:Cross(Mid2D) * Right2D:Cross(Mid2D) <= 0
end

function Utils.FourDirToEightDir(LocRelativeVelocityDir)
  local TargetVelocityBlend = FVelocityBlend()
  local Aix, LeanAix = table.unpack(Utils.AixsCheck(Utils.WithTolerance(LocRelativeVelocityDir.X), Utils.WithTolerance(LocRelativeVelocityDir.Y)))
  local Value = math.abs(LocRelativeVelocityDir.X)
  local ValueNormal = math.abs(LocRelativeVelocityDir.Y)
  if Value < ValueNormal then
    Value, ValueNormal = Utils.Swap(Value, ValueNormal)
  end
  LeanAixVal = UE4.UKismetMathLibrary.Sqrt(2) * ValueNormal
  AixVal = Value - ValueNormal
  AixVal, LeanAixVal = Utils.Average(AixVal, LeanAixVal)
  TargetVelocityBlend[Aix] = UE4.UKismetMathLibrary.FClamp(AixVal, 0.1, 1)
  TargetVelocityBlend[LeanAix] = UE4.UKismetMathLibrary.FClamp(LeanAixVal, 0.1, 1)
  return TargetVelocityBlend
end

function Utils.FourDirVelocityBlend(LocRelativeVelocityDir)
  local TargetVelocityBlend = FVelocityBlend()
  local Value = math.abs(LocRelativeVelocityDir.X)
  local ValueNormal = math.abs(LocRelativeVelocityDir.Y)
  local Sum = Value + ValueNormal + math.abs(LocRelativeVelocityDir.Z)
  if 0 == Sum then
    TargetVelocityBlend.F = 0.1
    return TargetVelocityBlend
  end
  local RelativeDir = LocRelativeVelocityDir / Sum
  TargetVelocityBlend.F = UE4.UKismetMathLibrary.FClamp(RelativeDir.X, 0.1, 1)
  TargetVelocityBlend.B = math.abs(UE4.UKismetMathLibrary.FClamp(RelativeDir.X, -1, 0))
  TargetVelocityBlend.L = math.abs(UE4.UKismetMathLibrary.FClamp(RelativeDir.Y, -1, 0))
  TargetVelocityBlend.R = UE4.UKismetMathLibrary.FClamp(RelativeDir.Y, 0, 1)
  return TargetVelocityBlend
end

function Utils.AixsCheck(x, y)
  local QuadrantTable = {
    {1, 2},
    {3, 4},
    {5, 6},
    {7, 8}
  }
  local AixsTable = {}
  AixsTable[1] = {"F", "FR"}
  AixsTable[2] = {"R", "FR"}
  AixsTable[3] = {"F", "FL"}
  AixsTable[4] = {"L", "FL"}
  AixsTable[5] = {"B", "LB"}
  AixsTable[6] = {"L", "LB"}
  AixsTable[7] = {"B", "RB"}
  AixsTable[8] = {"R", "RB"}
  local QuadrantIndex = 1
  if x >= 0 and y >= 0 then
    QuadrantIndex = 1
  elseif x >= 0 and y <= 0 then
    QuadrantIndex = 2
  elseif x <= 0 and y <= 0 then
    QuadrantIndex = 3
  else
    QuadrantIndex = 4
  end
  local AixIndex = 1
  if math.abs(x) < math.abs(y) then
    AixIndex = 2
  end
  return AixsTable[QuadrantTable[QuadrantIndex][AixIndex]]
end

function Utils.Sign(Value, Tolerance)
  local T = Tolerance
  if not Tolerance then
    T = 0.01
  end
  if T > UE4.UKismetMathLibrary.Abs(Value) then
    return 0
  end
  return 1
end

function Utils.Average(x, y)
  return x / (math.abs(x) + math.abs(y)), y / (math.abs(x) + math.abs(y))
end

function Utils.WithTolerance(Value, Tolerance)
  local T = Tolerance
  if not Tolerance then
    T = 0.01
  end
  if T > UE4.UKismetMathLibrary.Abs(1 - Value) then
    return 1
  elseif T > UE4.UKismetMathLibrary.Abs(Value) then
    return 0
  end
  return Value
end

function Utils.FormatNumberWithCommas(Number)
  if type(Number) == "number" then
    if Number < 100000 then
      return tostring(math.floor(Number))
    else
      return tostring(math.floor(Number)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    end
  elseif type(Number) == "string" then
    if Number:len() < 6 then
      return Number
    else
      return Number:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    end
  end
end

Utils.GetStrTable = not (not bDistribution or bEnableShippingLog) and Utils.EmptyFunction or function(ct, t, step, deep, PrettyFormat)
  if type(t) ~= "table" then
    ct[#ct + 1] = tostring(t)
    return
  end
  
  local function func(k, v)
    for i = 1, step do
      ct[#ct + 1] = "\t"
    end
    local type_k = type(k)
    local type_v = type(v)
    local str_k, str_v
    if "table" == type_v and v.IsValid and Utils.IsValid(v) then
      type_v = tostring(GetDisplayName(v))
    end
    if "string" == type_k and IsObjId(k) then
      str_k = ObjId2Str(k)
    else
      str_k = tostring(k)
    end
    if "string" == type_v and IsObjId(v) then
      str_v = ObjId2Str(v)
    elseif "table" == type_v and PrettyFormat then
      str_v = ""
    else
      str_v = tostring(v)
    end
    ct[#ct + 1] = str_k
    if not PrettyFormat then
      ct[#ct + 1] = " ("
      ct[#ct + 1] = type_k
      ct[#ct + 1] = "): "
    else
      ct[#ct + 1] = ": "
    end
    ct[#ct + 1] = str_v
    if not PrettyFormat then
      ct[#ct + 1] = " ("
      ct[#ct + 1] = type_v
      ct[#ct + 1] = ")\n"
    else
      ct[#ct + 1] = "\n"
    end
    if type(v) == "table" and step < deep then
      Utils.GetStrTable(ct, v, step + 1, deep, PrettyFormat)
    end
  end
  
  if PrettyFormat then
    local keys = {}
    for k, v in pairs(t) do
      keys[#keys + 1] = k
    end
    table.sort(keys)
    for _, k in ipairs(keys) do
      func(k, t[k])
    end
  else
    for k, v in pairs(t) do
      func(k, v)
    end
  end
end

function Utils.CorrectUrl(Url)
  Url = string.gsub(Url, "([%%+#&= ])", function(c)
    return string.format("%%%02X", string.byte(c))
  end)
  return Url
end

function Utils.IsSingleByteWord(Word)
  for i = 1, #Word do
    local curByte = string.byte(Word, i)
    if curByte < 0 or curByte > 127 then
      return false
    end
  end
  return true
end

function Utils.GetAudioManager_Lua(context)
  if IsDedicatedServer(context) then
    Utils.AudioManager_Var = CommonUtils.EmptyProxy
  else
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(context)
    if GameInstance and GameInstance.GetAudioManager then
      Utils.AudioManager_Var = GameInstance:GetAudioManager()
    end
  end
  return Utils.AudioManager_Var
end

function Utils.GetGameCofingSettings(VarName)
  return UE4.UGameConfigSetttings.Get()[VarName]
end

function Utils.InitializeSettings()
  local WorldContext = GWorld.GameInstance
  local IsPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(WorldContext)
  if IsPIE then
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "Editor.OverrideDPIBasedEditorViewportScaling 1", nil)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "r.ReflectionCaptureGPUArrayCopy 0", nil)
  end
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "Slate.EnableRetainedRenderingWithLocalTransform 0", nil)
  Utils.PreloadPetClass()
end

function Utils.AddTickLodActor(InTag, InActor, TickLodFlag)
  URuntimeCommonFunctionLibrary.AddTickLodObject(InTag, InActor, TickLodFlag)
end

function Utils.RemoveTickLodActor(InTag, InActor, TickLodFlag)
  URuntimeCommonFunctionLibrary.RemoveTickLodObject(InTag, InActor, TickLodFlag)
end

function Utils.BlockTickLod(InTag, bBlock, InActor, BlockTag, TickLodFlag)
  if InActor.BlockTickLod then
    InActor:BlockTickLod(bBlock, InTag, TickLodFlag)
    return
  end
  local SignificanceMgrSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(InActor, UEMSignificanceMgrSubsystem)
  if not SignificanceMgrSubsystem then
    return
  end
  SignificanceMgrSubsystem:BlockTickLod(InTag, bBlock, InActor, BlockTag, TickLodFlag)
end

function Utils.PlayMontageBySkeletaMesh(Owner, MeshComp, MontageAsset, PlayParam)
  if not MontageAsset then
    local Result = PlayParam.OnCompleted and PlayParam.OnCompleted(Owner, true)
    return
  end
  local _PlayRate = 1.0
  if PlayParam.PlayRate then
    _PlayRate = PlayParam.PlayRate
  end
  local _StartPos = 0.0
  if PlayParam.StartPos then
    _StartPos = PlayParam.StartPos
  end
  local _StartSec
  if PlayParam.StartSec then
    _StartSec = PlayParam.StartSec
  end
  local MontCallbackProxy = UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(MeshComp, MontageAsset, _PlayRate, _StartPos, _StartSec)
  if not Utils.IsValid(MontCallbackProxy) then
    return
  end
  
  local function StopMontageFuncComplete()
    if Owner and Owner.RemoveMontPorxy then
      Owner:RemoveMontPorxy(MontCallbackProxy)
    end
  end
  
  local function StopMontageFunc()
    if Owner and Owner.RemoveMontPorxy and MontCallbackProxy.OnCompleted:IsBound() == false then
      Owner:RemoveMontPorxy(MontCallbackProxy)
    end
  end
  
  local OnCompleted = PlayParam.OnCompleted
  local Temp = PlayParam.OnCompleted and MontCallbackProxy.OnCompleted:Add(Owner, PlayParam.OnCompleted)
  if OnCompleted then
    MontCallbackProxy.OnCompleted:Add(Owner, StopMontageFuncComplete)
  end
  if PlayParam.ExcuteFnishOnlyWhenCompelete then
    OnCompleted = nil
  end
  local BlendOutFunc = PlayParam.OnBlendOut
  if not PlayParam.OnBlendOut then
    BlendOutFunc = OnCompleted
  end
  local Temp = BlendOutFunc and MontCallbackProxy.OnBlendOut:Add(Owner, BlendOutFunc)
  if BlendOutFunc then
    MontCallbackProxy.OnBlendOut:Add(Owner, StopMontageFunc)
  end
  local InterruptedFunc = PlayParam.OnInterrupted
  if not PlayParam.OnInterrupted then
    InterruptedFunc = OnCompleted
  end
  local Temp = InterruptedFunc and MontCallbackProxy.OnInterrupted:Add(Owner, InterruptedFunc)
  if InterruptedFunc then
    MontCallbackProxy.OnInterrupted:Add(Owner, StopMontageFunc)
  end
  if PlayParam.OnNotifyBegin then
    MontCallbackProxy.OnNotifyBegin:Add(Owner, PlayParam.OnNotifyBegin)
  end
  local EndFunc = PlayParam.OnNotifyEnd
  if not PlayParam.OnNotifyEnd then
    EndFunc = OnCompleted
  end
  local Temp = EndFunc and MontCallbackProxy.OnNotifyEnd:Add(Owner, EndFunc)
  if Owner.CacheMontPorxy then
    Owner:CacheMontPorxy(MontCallbackProxy)
  end
end

function Utils.EnableFriendFXBias(enable)
  if Const.EnableFriendFXQualityBias ~= enable then
    Const.EnableFriendFXQualityBias = enable
    Const.ScalabilityUpdateTime = Const.ScalabilityUpdateTime + 1
  end
end

function Utils.SetFriendFXQuality(quality)
  if Const.FriendFXQuality ~= quality then
    Const.FriendFXQuality = quality
    Const.ScalabilityUpdateTime = Const.ScalabilityUpdateTime + 1
  end
end

function Utils.EmptyFunction(...)
end

function Utils.SaveCacheClass(ActorPath, UnitBlueprint)
  if not Const.CacheClassMap then
    Const.CacheClassMap = {}
  end
  if Const.CacheClassMap[ActorPath] == nil then
    Const.CacheClassMap[ActorPath] = UnitBlueprint
    AddToRoot(UnitBlueprint)
  end
end

function Utils.GetNPCCreateSubSystem_Lua(context)
  if IsDedicatedServer(context) then
    Utils.NPCCreateSubSystem_Var = CommonUtils.EmptyProxy
  else
    Utils.NPCCreateSubSystem_Var = UNPCCreateSubSystem.GetSubsystem(context)
  end
  return Utils.NPCCreateSubSystem_Var
end

function Utils.StringToByteTable(Data)
  Len = string.len(Data)
  local ByteTable = {}
  for i = 1, Len do
    ByteTable[i] = string.byte(Data, i)
  end
  return ByteTable
end

function Utils.ByteArrayToString(ByteArray)
  local Chars = {}
  local Len = ByteArray:Num()
  for i = 1, Len do
    Chars[i] = string.char(ByteArray:Get(i))
  end
  return table.concat(Chars)
end

return Utils
