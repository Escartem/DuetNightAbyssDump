require("UnLua")
local BP_MonsterSpawn_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Combat.Components.MonsterSpawnComponent",
  "BluePrints.Common.DelayFrameComponent"
})

function BP_MonsterSpawn_C:RealCreateUnits(UnitId, UnitNum, PresetTarget, SourceType, Level)
  DebugPrint("RealCreateUnits CreateUnitNew UnitId:", UnitId, "UnitNum:", UnitNum)
  local FrameCount = UE4.UKismetSystemLibrary.GetFrameCount()
  if self.PreFreameCount ~= FrameCount then
    self.DelayFrameStartCount = 1
    self.PreFreameCount = FrameCount
  end
  for i = 1, UnitNum do
    self:AddDelayFrameFunc(function()
      if "Main" == SourceType and not self:DetectMonsterSpawnTotalNum() then
        DebugPrint("BP_MonsterSpawn_C \229\136\183\230\128\170\232\191\135\231\168\139\228\184\173\230\149\176\233\135\143\229\183\178\232\190\190\228\184\138\233\153\144, \231\155\180\230\142\165\232\191\148\229\155\158  MonsterSpawnId:", self.UnitSpawnId)
        return
      end
      local Location = self.Locations[self.LocationIndex % self.Locations:Num() + 1]
      self.LocationIndex = self.LocationIndex + 1
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitType = "Monster"
      Context.UnitId = UnitId
      Context.Loc = Location
      Context.MonsterSpawn = self
      Context.BoolParams:Add("RelationSpawn", "Relation" == SourceType)
      Context.IntParams:Add("Level", Level)
      Context:AddObjectParams("PresetTarget", PresetTarget)
      self:DebugPrintMonsterSpawn("RealCreateUnits CreateUnitNew UnitId: " .. UnitId .. " Level: " .. Level)
      self.GameState.EventMgr:CreateUnitNew(Context, false)
      if "Main" == SourceType then
        self:UpdateMonsterSpawnTotalNum(-1)
        self.UnitSpawningNum = self.UnitSpawningNum + 1
      else
        self.RelationSpawningNum = self.RelationSpawningNum + 1
      end
    end, self.DelayFrameStartCount)
    self.DelayFrameStartCount = self.DelayFrameStartCount + 1
  end
end

function BP_MonsterSpawn_C:CheckDungeonReachable(LevelLoader, PresetTarget, SpawnPointInfo)
  local LevelId = LevelLoader:GetLevelIdByLocation(PresetTarget:K2_GetActorLocation())
  local LevelReachable = false
  for DoorIndex, BPArrow in pairs(LevelLoader.LevelId2Doors[LevelId]) do
    local IsHasPath = UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(SpawnPointInfo.Loc, BPArrow:K2_GetActorLocation(), self.GameMode)
    if IsHasPath == UE4.EPathConnectType.HasPath then
      LevelReachable = true
      break
    end
  end
  return LevelReachable
end

function BP_MonsterSpawn_C:GetAroundDivisionInfos(Loc)
  return self.GameMode:GetAroundDivisionInfos(Loc)
end

function BP_MonsterSpawn_C:AddHostageInfo(Res)
  local HostageEid = self.GameMode:TriggerDungeonComponentFun("GetHostageEid")
  if nil == HostageEid then
    DebugPrint("BP_MonsterSpawn_C  \229\189\147\229\137\141\233\162\132\232\174\190\231\155\174\230\160\135\228\184\186\228\186\186\232\180\168\239\188\140\228\189\134\228\184\141\229\186\148\232\175\165\229\156\168\233\157\158\230\141\149\232\142\183\231\142\169\230\179\149\228\189\191\231\148\168  MonsterSpawnId:", self.UnitSpawnId)
    self:AddPlayerInfo(Res)
    return
  end
  local Hostage = Battle(self):Getentity(HostageEid)
  if not IsValid(Hostage) then
    DebugPrint("BP_MonsterSpawn_C  \229\189\147\229\137\141\233\162\132\232\174\190\231\155\174\230\160\135\228\184\186\228\186\186\232\180\168\239\188\140\228\186\186\232\180\168\228\184\141\229\173\152\229\156\168  MonsterSpawnId:", self.UnitSpawnId)
    self:AddPlayerInfo(Res)
    return
  end
  DebugPrint("BP_MonsterSpawn_C  \229\189\147\229\137\141\233\162\132\232\174\190\231\155\174\230\160\135\228\184\186\228\186\186\232\180\168  MonsterSpawnId:", self.UnitSpawnId, "\228\186\186\232\180\168Eid:", HostageEid)
  Res:Add(Hostage)
end

function BP_MonsterSpawn_C:DebugPrintMonsterSpawn(Info)
  if self.GameMode.DebugPrintMonsterSpawn then
    DebugPrint("WARNING:  " .. Info)
  end
end

return BP_MonsterSpawn_C
