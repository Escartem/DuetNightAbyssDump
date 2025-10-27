require("UnLua")
local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.NowPathId = 1
  self.NextPathId = 1
  self.Distance = 0
  self.Speed = self.UnitParams.Speed or 100
  self.Range = self.UnitParams.Range or 100
  self.bFirstActive = false
  self:CreateSpline()
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:GetDungeonComponent() then
    GameMode:GetDungeonComponent().FeinaBird = self
  end
end

function M:CreateSpline()
  local SplinePath = UE4.UClass.Load("/Game/BluePrints/Item/DefenceCore/BP_TrollySpline.BP_TrollySpline")
  local Transform = FTransform()
  Transform.Translation = self:GetTransform().Translation
  self.Spline = self:GetWorld():SpawnActor(SplinePath, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  self.Spline.Spline:ClearSplinePoints(false)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.NowPathId = self.NowPathId
  GameState.NextPathId = self.NextPathId
end

function M:AddNewPath()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode:GetDungeonComponent() then
    return
  end
  local PointList = GameMode:TriggerDungeonComponentFun("GetNextPathInfos", self.NowPathId)
  print(_G.LogTag, "LXZ AddNewPath", PointList, self.NowPathId)
  if not PointList then
    GWorld.logger.error("\232\143\178\229\168\156\230\180\187\229\138\168\229\164\156\232\142\186 \228\184\141\229\173\152\229\156\168\228\184\139\228\184\128\230\174\181\232\183\175\229\190\132\239\188\140\229\189\147\229\137\141\232\183\175\229\190\132id\239\188\154" .. self.NowPathId)
    return
  end
  table.sort(PointList, function(a, b)
    return a.PathPointIndex < b.PathPointIndex
  end)
  for i, v in pairs(PointList) do
    self.Spline:AddPoint(v:K2_GetActorLocation(), i - 1, v)
  end
  self.NowPathId = self.NextPathId
  self.NextPathId = PointList[#PointList].NextPathId
  self.PathDistance:Add(self.NowPathId, self.SplineLength)
  self.SplineLength = self.Spline.Spline:GetSplineLength()
  self.Percent = self.Distance / self.SplineLength
end

function M:OnPathEnd(PathId)
  print(_G.LogTag, "LXZ OnPathEnd", PathId)
  self.Overridden.OnPathEnd(self, PathId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerGameModeEvent("OnPathEnd", self.CreatorId, PathId)
  end
end

function M:OnPathStart(PathId)
  self.Overridden.OnPathStart(self, PathId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerGameModeEvent("OnPathStart", self.CreatorId, PathId)
  end
end

return M
