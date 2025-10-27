require("UnLua")
local M = Class()

function M:Init(level_loader)
  local json_short_name = level_loader.shortname
  self:Init_CPP(json_short_name, level_loader)
end

function M:GetSpawnPoints(info)
  local preset_targets, mode, unit_spawn_radius_min, unit_spawn_radius_max, b_enable_random, cull_unreachable = info.PresetTargets, info.Mode, info.UnitSpawnRadiusMin, info.UnitSpawnRadiusMax, info.RandomSpawn, info.FilterReachable
  local PresetTargets = TMap(AActor, 0)
  for preset_target, num in pairs(preset_targets) do
    PresetTargets:Add(preset_target, num)
  end
  local TempTacmapParam = FTacMapGetSpawnPointsParam()
  TempTacmapParam.PresetTargets = preset_targets
  TempTacmapParam.SpawnMode = ETacmapSpawnMode[mode]
  TempTacmapParam.UnitSpawnRadiusMin = unit_spawn_radius_min or -1
  TempTacmapParam.UnitSpawnRadiusMax = unit_spawn_radius_max or -1
  TempTacmapParam.bEnableRandom = b_enable_random
  TempTacmapParam.CullUnreachable = cull_unreachable
  local ret = self:GetSpawnPoints_CPP(TempTacmapParam)
  local spawn_points = {}
  for preset_target, num in pairs(preset_targets) do
    local spawn_point_data = ret:Find(preset_target)
    if spawn_point_data then
      local spawn_point = {}
      for i = 1, spawn_point_data.SpawnPoints:Length() do
        local spawn_point_vec = spawn_point_data.SpawnPoints:GetRef(i)
        table.insert(spawn_point, UE4.FVector(spawn_point_vec.X, spawn_point_vec.Y, spawn_point_vec.Z))
      end
      spawn_points[preset_target] = spawn_point
    end
  end
  return spawn_points
end

function M:GenerateCapturePath(distance)
  DebugPrint("GenerateCapturePath Request:", distance)
  local monster_loc, capture_level_id = self:GenerateCapturePath_CPP(distance or -1)
  DebugPrint("GenerateCapturePathResult:", monster_loc, capture_level_id)
  return UE4.FVector(monster_loc.X, monster_loc.Y, monster_loc.Z), capture_level_id
end

function M:GenerateSabotagePoints()
  DebugPrint("GenerateSabotagePoints Request:")
  local sabotage_datas = self:GenerateSabotagePoints_CPP()
  local sabotage_points = {}
  for i = 1, sabotage_datas:Length() do
    local sabotage_data = sabotage_datas:Get(i)
    local loc = sabotage_data.Loc
    table.insert(sabotage_points, {
      Loc = UE4.FVector(loc.X, loc.Y, loc.Z),
      Id = sabotage_data.Id
    })
  end
  DebugPrint("GenerateSabotagePoints Result:", sabotage_points)
  DebugPrintTable(sabotage_points, 3)
  return sabotage_points
end

function M:RegisterPlayer(player, idx)
end

return M
