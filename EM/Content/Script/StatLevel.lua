local M = {}
local TmpPlayer
local AllStat = {}
local HitPosTable = {}
local StatNum = 5
local StrOutput = ""
local StrLine = "\n"
local StrSpace = ","
local GridFrameClass = LoadClass("/Game/BluePrints/Scene/BP_GridFrame.BP_GridFrame")
local CurrentNiagaraPath
M.BeginStat = false

function M:Stat(GM)
  self.BeginStat = not self.BeginStat
  if self.BeginStat then
    self:StatStart(GM)
  else
    self:StatEnd(GM)
  end
end

function ToString(tab, cnt)
  cnt = cnt or 1
  local tp = type(tab)
  if "table" ~= tp then
    return tostring(tab)
  end
  if cnt >= 10 then
    return tostring(tab)
  end
  
  local function getSpace(count)
    local temp = {}
    for i = 1, count * 4 do
      table.insert(temp, " ")
    end
    return table.concat(temp)
  end
  
  local tabStr = {}
  table.insert(tabStr, "{\n")
  local spaceStr = getSpace(cnt)
  for k, v in pairs(tab) do
    table.insert(tabStr, spaceStr)
    local IsNumber = type(k) == "number"
    if IsNumber then
      table.insert(tabStr, "[")
    end
    table.insert(tabStr, ToString(k, cnt + 1))
    if IsNumber then
      table.insert(tabStr, "]")
    end
    table.insert(tabStr, " = ")
    table.insert(tabStr, ToString(v, cnt + 1))
    table.insert(tabStr, "\n")
  end
  table.insert(tabStr, getSpace(cnt - 1))
  table.insert(tabStr, "}")
  return table.concat(tabStr)
end

function M:StatStart(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  self.Player = GM.Player
  self.GM = GM
  self:GetPositionMap()
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self.Player, "stat unit", self.Player:GetController())
  self.PointCount = 0
  self.TravelNext(self)
end

function M:TraceNext(ActorSize, ActorLocation, XBias)
  local YBias = 1
  local StartPoint = ActorLocation - ActorSize + FVector(0, 0, 1) * ActorSize.Z * 2 + FVector(1, 0, 0) * 1000 * XBias + FVector(0, 1, 0) * 1000 * YBias
  if not UE4.UKismetMathLibrary.IsPointInBox(StartPoint, ActorLocation, ActorSize) then
    return
  end
  while UE4.UKismetMathLibrary.IsPointInBox(StartPoint, ActorLocation, ActorSize) do
    local EndPoint = StartPoint - FVector(0, 0, 1) * ActorSize.Z * 2
    local ActorToIgnore = TArray(AActor)
    local OutHits = TArray(FHitResult)
    UE4.UKismetSystemLibrary.LineTraceMulti(self.Player, StartPoint, EndPoint, UE4.ETraceTypeQuery.TraceOverlap, false, ActorToIgnore, 1, OutHits, true)
    local LastImpactPointZ
    local firstmatch = false
    for k, v in pairs(OutHits) do
      local IsStatciMeshActor = UE4.UKismetMathLibrary.EqualEqual_ClassClass(v.Actor:GetClass(), AStaticMeshActor:StaticClass())
      local IsLandScapeActor = UE4.UKismetMathLibrary.EqualEqual_ClassClass(v.Actor:GetClass(), ALandscape:StaticClass())
      if 1 == v.ImpactNormal.Z and (IsStatciMeshActor or IsLandScapeActor) then
        LastImpactPointZ = LastImpactPointZ or v.ImpactPoint.Z - (self.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 2 + 4)
        local HightDiff = v.ImpactPoint.Z - LastImpactPointZ
        local DiffHigthEnough = math.abs(HightDiff) > self.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 2
        LastImpactPointZ = v.ImpactPoint.Z
        local FindFloorResult = FFindFloorResult()
        local CheckFloorLocation = FVector(v.ImpactPoint.X, v.ImpactPoint.Y, v.ImpactPoint.Z) + FVector(0, 0, 1) * (self.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() - 2)
        self.Player:GetMovementComponent():K2_FindFloor(CheckFloorLocation, FindFloorResult)
        if DiffHigthEnough and FindFloorResult.bWalkableFloor then
          if firstmatch then
            print(_G.LogTag, "77777", k, v.ImpactPoint, UE4.UKismetSystemLibrary.GetDisplayName(v.Actor), FindFloorResult.bWalkableFloor, FindFloorResult.bBlockingHit)
            local InsertResult = FVector(v.ImpactPoint.X, v.ImpactPoint.Y, v.ImpactPoint.Z)
            table.insert(HitPosTable, InsertResult)
          end
          firstmatch = firstmatch or true
        end
      end
    end
    YBias = YBias + 1
    StartPoint = ActorLocation - ActorSize + FVector(0, 0, 1) * ActorSize.Z * 2 + FVector(1, 0, 0) * 1000 * XBias + FVector(0, 1, 0) * 1000 * YBias
  end
  self:TraceNext(ActorSize, ActorLocation, XBias + 1)
end

function M:GetPositionMap()
  local GridFrame = UE4.UGameplayStatics.GetActorOfClass(self.Player, GridFrameClass)
  if not GridFrame then
    DebugPrint("\229\189\147\229\137\141\229\133\179\229\141\161\229\185\182\229\143\175\233\157\158\230\139\188\230\142\165\229\173\144\229\133\179\229\141\161   ", UE4.UGameplayStatics.GetCurrentLevelName(self.Player))
    return
  end
  local ActorSize = GridFrame:GetActorScale3D() * 100 / 2
  local ActorLocation = GridFrame:K2_GetActorLocation()
  self:TraceNext(ActorSize, ActorLocation, 1)
  print(_G.LogTag, "111111111111111111111111111111", #HitPosTable)
  print(_G.LogTag, "111111111", ToString(HitPosTable))
end

function M:TravelNext()
  self.PointCount = self.PointCount + 1
  if self.PointCount > #HitPosTable then
    print(_G.LogTag, "Point Scan Over")
    self:StatEnd(self.GM)
    return
  end
  self.Player:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  local ImpactLocation = HitPosTable[self.PointCount]
  print(_G.LogTag, "get one Point ", self.PointCount, HitPosTable[self.PointCount])
  local Location = FVector(ImpactLocation.X, ImpactLocation.Y, ImpactLocation.Z) + FVector(0, 0, 1) * (self.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() - 2)
  local FindFloorResult = FFindFloorResult()
  self.Player:GetMovementComponent():K2_FindFloor(Location, FindFloorResult)
  print(_G.LogTag, "Start New Poin", self.PointCount, Location, FindFloorResult.bBlockingHit, FindFloorResult.bWalkableFloor)
  self.Player:K2_SetActorLocation(Location, false, nil, false)
  self.RotCount = 0
  self.InitialForward = FVector(1, 0, 0)
  M.RotateCamera(nil, self)
end

function M.RotateCamera(Player, StatTable)
  local Controller = StatTable.Player:GetController()
  local RotAngle = FRotator(0, 90 * StatTable.RotCount, 0)
  local DesiredRot = UE4.UKismetMathLibrary.GreaterGreater_VectorRotator(StatTable.InitialForward, RotAngle):ToRotator()
  DesiredRot.Pitch = 15
  StatTable.RotCount = StatTable.RotCount + 1
  Controller:SetControlRotation(DesiredRot)
  if StatTable.RotCount > 4 then
    print("One Point Rot Done")
    StatTable:TravelNext()
    return
  end
  print(_G.LogTag, "Start New Rot", DesiredRot)
  StatTable.Player:AddTimer(1, M.RecordInfo, false, 0, "Test_StatLevelRecorder", false, StatTable)
  StatTable.Player:AddTimer(2, M.RotateCamera, false, 0, "Test_StatLevelTimer", false, StatTable)
end

function M.RecordInfo(Player, StatTable)
  local EMData = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(StatTable.Player)
  local ActorLocation = StatTable.Player:K2_GetActorLocation()
  local Controller = StatTable.Player:GetController()
  local Forward = Controller:GetControllerForwardOrRight(true)
  local NewRecord = {}
  NewRecord.Position = {}
  NewRecord.Position.X = ActorLocation.X
  NewRecord.Position.Y = ActorLocation.Y
  NewRecord.Position.Z = ActorLocation.Z
  NewRecord.Forward = {}
  NewRecord.Forward.X = Forward.X
  NewRecord.Forward.Y = Forward.Y
  NewRecord.Forward.Z = Forward.Z
  NewRecord.FrameTime = EMData.FrameTime
  NewRecord.GameThreadTime = EMData.GameThreadTime
  NewRecord.RenderThreadTime = EMData.RenderThreadTime
  NewRecord.GPUFrameTime = EMData.GPUFrameTime
  NewRecord.NumDrawCalls = EMData.NumDrawCalls
  NewRecord.NumPrimitives = EMData.NumPrimitives
  table.insert(AllStat, NewRecord)
  print(_G.LogTag, "hhhhhhhhhhhhhhhhhhhhhhhhhh one imformation recorded")
end

function M:StatEnd(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  print("Scan Done")
  GM.Player:RemoveTimer("Test_StatLevelTimer")
  GM.Player:RemoveTimer("Test_StatLevelRecorder")
  print(_G.LogTag, "11111111111111111111111", ToString(AllStat))
  local MaxFrameTime = 0
  local MaxFrameTimeRecord = {}
  local MaxDrawCalls = 0
  local MaxDrawCallsRecord = {}
  for idx, Record in pairs(AllStat) do
    if MaxFrameTime < Record.FrameTime then
      MaxFrameTime = Record.FrameTime
      MaxFrameTimeRecord = Record
    end
    if MaxDrawCalls < Record.NumDrawCalls then
      MaxDrawCalls = Record.NumDrawCalls
      MaxDrawCallsRecord = Record
    end
  end
  local Path = UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatLevel_" .. UE4.UGameplayStatics.GetCurrentLevelName(GM.Player) .. "_" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt"
  local File = io.open(Path, "w+")
  io.output(File)
  local FullString = "All Record Info = " .. ToString(AllStat) .. "," .. "\n" .. "MaxFrameTimeRecord = " .. ToString(MaxFrameTimeRecord) .. "," .. "\n" .. "MaxDrawCallsRecord = " .. ToString(MaxDrawCallsRecord)
  io.write(FullString)
  io.close(File)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self.Player, "stat unit", self.Player:GetController())
end

return M
