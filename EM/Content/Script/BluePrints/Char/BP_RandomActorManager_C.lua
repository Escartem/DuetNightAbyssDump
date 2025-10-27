require("UnLua")
local BP_RandomActorManager_C = Class("BluePrints.Common.TimerMgr")

function BP_RandomActorManager_C:GetRandomCount(RandomId)
  if not DataMgr.RandomCreator[RandomId] then
    GWorld.logger.error("\229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170\233\154\143\230\156\186\229\136\183\230\150\176\232\167\132\229\136\153" .. RandomId .. "\230\137\190\228\184\141\229\136\176\229\174\131\228\186\178\231\136\177\231\154\132\233\133\141\232\161\168\230\149\176\230\141\174\239\188\140\228\186\178\231\136\177\231\154\132\231\173\150\229\136\146\232\131\189\230\148\185\228\184\128\228\184\139GameMode\233\133\141\231\189\174\229\144\151")
    return 0
  end
  local Count = DataMgr.RandomCreator[RandomId].Count
  return Count
end

function BP_RandomActorManager_C:DrawDebug()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for i, v in pairs(GameState.CoverPointInfos) do
    if 0 ~= v.UsingEid then
      local Monster = Battle(self):GetEntity(v.UsingEid)
      local Red = UE4.UKismetMathLibrary.LinearColor_Red()
      UE4.UKismetSystemLibrary.DrawDebugSphere(self, v:GetCoverPointLoc(self), 20, 12, Red, 0.1)
      UE4.UKismetSystemLibrary.DrawDebugLine(self, v:GetCoverPointLoc(self), Monster:K2_GetActorLocation(), Red, 0.1)
    end
  end
end

function BP_RandomActorManager_C:CreateDataParamIndex(RuleId, LevelName, IdxInRule, DataParamIndex)
  if self.DataParamTable == nil then
    self.DataParamTable = {}
  end
  if self.DataParamTable[RuleId] == nil then
    self.DataParamTable[RuleId] = {}
  end
  if self.DataParamTable[RuleId][LevelName] == nil then
    self.DataParamTable[RuleId][LevelName] = {}
  end
  self.DataParamTable[RuleId][LevelName][IdxInRule] = DataParamIndex
end

function BP_RandomActorManager_C:IndexDataByLevelNameAndIdxInRule(RuleId, LevelName, IdxInRule)
  if not self.DataParamTable[RuleId][LevelName] then
    DebugPrint("RandomCreator\228\184\173\228\184\141\229\173\152\229\156\168\229\166\130\228\184\139\230\149\176\230\141\174\239\188\154 RuleId = ", RuleId, " LevelName = ", LevelName)
    return {}
  end
  return self.DataParamTable[RuleId][LevelName][IdxInRule]
end

function BP_RandomActorManager_C:ProgressDataRecoverRandomActor(RuleId, LevelName, IdxInRule, TableIdx, ItemData)
  local UnitLevel = DataMgr.RandomCreator[RuleId].RandomInfos[TableIdx].UnitLevel or 0
  local RandomCreatorId = self:GetParamActorId(RuleId, LevelName, IdxInRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  UnitLevel = UnitLevel + GameMode:GetFixedGamemodeLevel()
  local ParamRot = self:GetCreatorRegionDataRot(RuleId, RandomCreatorId)
  local ManagerRot = GameState.RandomCreatorDataMap:Find(LevelName):K2_GetActorRotation()
  local Rot = FRotator(ParamRot.Pitch + ManagerRot.Pitch, ParamRot.Yaw + ManagerRot.Yaw, ParamRot.Roll + ManagerRot.Roll)
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = DataMgr.RandomCreator[RuleId].UnitType
  Context.UnitId = DataMgr.RandomCreator[RuleId].RandomInfos[TableIdx].UnitId
  Context.Loc = self:GetCreatorRegionDataLoc(RuleId, RandomCreatorId)
  Context.Rotation = Rot
  Context.Creator = self:GetCreator(RuleId, LevelName, IdxInRule)
  Context.IntParams:Add("Level", UnitLevel)
  Context.IntParams:Add("RandomCreatorId", RandomCreatorId)
  Context.IntParams:Add("RandomRuleId", RuleId)
  Context.IntParams:Add("RandomTableId", TableIdx)
  Context:AddLuaTable("DungeonState", ItemData)
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

return BP_RandomActorManager_C
