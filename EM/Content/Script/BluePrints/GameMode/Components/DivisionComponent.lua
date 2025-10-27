require("UnLua")
local DivisionComponent = Class()

function DivisionComponent:ComponentReceiveBeginPlay()
  self.MonsterSpawnDivisions = {}
  self.MonsterSpawnDivSize = 10000
end

function DivisionComponent:InitMonsterSpawnDivisions(ContentInfos)
  for Index, Info in pairs(ContentInfos) do
    local Key = self:GetCurrentKey(self.MonsterSpawnDivSize, Info.Loc)
    if self.MonsterSpawnDivisions[Key] == nil then
      self.MonsterSpawnDivisions[Key] = {Info}
    else
      table.insert(self.MonsterSpawnDivisions[Key], Info)
    end
  end
  DebugPrint("InitMonsterSpawnDivisions, DungoenId = " .. tostring(self.DungeonId) .. ", DivSize = " .. tostring(self.MonsterSpawnDivSize) .. ", InfoLength = " .. tostring(ContentInfos:Num()))
end

function DivisionComponent:ClearMonsterSpawnDivisions()
  self.MonsterSpawnDivisions = {}
  DebugPrint("DivisionComponent: Clear!")
end

function DivisionComponent:GetCurrentKey(DivSize, Location)
  local IndX = math.floor(Location.X / DivSize)
  local IndY = math.floor(Location.Y / DivSize)
  return IndX .. ", " .. IndY
end

function DivisionComponent:GetAroundKeys(DivSize, Loc)
  local Res = {}
  local Off = {
    -1,
    0,
    1
  }
  local AreaX = math.floor(Loc.X / DivSize)
  local AreaY = math.floor(Loc.Y / DivSize)
  for i, j in pairs(Off) do
    local TmpX = AreaX + j
    for ii, k in pairs(Off) do
      local TmpY = AreaY + k
      table.insert(Res, TmpX .. ", " .. TmpY)
    end
  end
  return Res
end

function DivisionComponent:GetAroundDivisionInfos(Loc)
  local Res = TMap(0, FMonsterSpawnPointParam)
  local Index = 1
  local AroundKeys = self:GetAroundKeys(self.MonsterSpawnDivSize, Loc)
  for i, Key in pairs(AroundKeys) do
    local Points = self.MonsterSpawnDivisions[Key] or {}
    for ii, TmpMonsterSpawnPoint in pairs(Points) do
      Res:Add(Index, TmpMonsterSpawnPoint)
      Index = Index + 1
    end
  end
  return Res
end

return DivisionComponent
