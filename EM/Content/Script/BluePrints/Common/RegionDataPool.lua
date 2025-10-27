local M = Class()

function M:Initialize(RegionDataMgr)
  self.QuestChainId2Data = {}
  self.DynamicQuestId2Data = {}
  self.SpecialQuestId2Data = {}
  self.RegionData = {}
  self.RegionDataMgr = RegionDataMgr
  for i = 1, 1024 do
    table.insert(self.RegionData, {})
  end
  self.RandomCreatorDatas = {}
  self.LuaIndex2Type:Clear()
end

function M:CheckUnitDataNeedStorage(RegionDataType)
  if RegionDataType and RegionDataType > 0 and RegionDataType ~= ERegionDataType.RDT_HardBossData and RegionDataType ~= ERegionDataType.RDT_QuestData then
    return true
  end
  return false
end

function M:InitRegionDataTable(LuaTableIndex, WorldRegionEid)
  local DataTable = self.RegionData[LuaTableIndex]
  if not DataTable then
    self.RegionData[LuaTableIndex] = {}
    DataTable = self.RegionData[LuaTableIndex]
  end
  DataTable.WorldRegionEid = WorldRegionEid
end

function M:GetRegionEntityData(Index)
  local Info = self.RegionData[Index]
  local DeepCopiedInfo = CommonUtils.DeepCopy(Info)
  if DeepCopiedInfo.Completed then
    return DeepCopiedInfo
  end
  if DeepCopiedInfo.RandomRuleId and DeepCopiedInfo.RandomRuleId > 0 then
    self:CompleteRandomCreatorData(DeepCopiedInfo)
  elseif Info.CreatorId and Info.CreatorId > 0 then
    self:CompleteStaticCreatorData(DeepCopiedInfo)
  end
  if 3 == DeepCopiedInfo.Type then
    if not Info.BornLocation then
      return DeepCopiedInfo
    end
    self:CompleteRawData(DeepCopiedInfo)
  end
  return DeepCopiedInfo
end

function M:GetRegionEntityDataNoCopy(Index)
  local Info = self.RegionData[Index]
  if Info.Completed then
    return Info
  end
  if Info.RandomRuleId and Info.RandomRuleId > 0 then
    self:CompleteRandomCreatorData(Info)
  elseif Info.CreatorId and Info.CreatorId > 0 then
    self:CompleteStaticCreatorData(Info)
  end
  if 3 == Info.Type then
    if not Info.BornLocation then
      return Info
    end
    self:CompleteRawData(Info)
  end
  return Info
end

function M:FillRegionData(Index, Info, RegionDataMgrSubsystem)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode:GetWCSubSystem() then
    return
  end
  local DataTable = self.RegionData[Index]
  if DataTable.Type then
    return
  end
  local Creator = Info.Creator
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not Creator then
    Info.Creator = GameState.StaticCreatorMap:FindRef(Info.CreatorId)
  end
  if Info.RandomRuleId and Info.RandomRuleId > 0 then
    self:FillRandomCreatorData(DataTable, Info)
  elseif Info.Creator then
    self:FillStaticCreatorData(DataTable, Info)
  else
    self:FillCommonData(DataTable, Info)
  end
  if DataTable.QuestChainId and DataTable.QuestChainId > 0 then
    self:AddQuestChainData(DataTable)
  end
  self.RegionDataMgr:OnRegionDataFill_Log(DataTable.WorldRegionEid, DataTable.Eid, DataTable.LevelName)
  DataTable.Creator = nil
  if self:CheckUnitDataNeedStorage(DataTable.RegionDataType) then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local bIsFromServer = RegionDataMgrSubsystem and RegionDataMgrSubsystem:CheckIsDataInitFromServer(DataTable.WorldRegionEid)
    self.RegionDataMgr:AddCretorActiveCache(DataTable)
    if not self.RegionDataMgr:ClientCacheExist(DataTable.WorldRegionEid) then
      self.RegionDataMgr.DataLibrary:AddUnitRegionCacheData(DataTable)
    end
    self.RegionDataMgr:RegisterRegionDeliverMechanism(DataTable.WorldRegionEid, DataTable.CreatorId)
    if Info.Type then
      return
    end
    if 2 ~= DataTable.Type then
      if not bIsFromServer then
        DataTable.UnitType = not DataTable.UnitType and Info.Creator and Info.Creator.UnitType
        DataTable.UnitId = not DataTable.UnitId and Info.Creator and Info.Creator.UnitId
        Avatar:AvatarC2SAddRegionActorData(DataTable)
      end
    else
      if not self.RandomCreatorDatas[DataTable.RandomRuleId] then
        self.RandomCreatorDatas[DataTable.RandomRuleId] = {}
        self.RandomCreatorDatas[DataTable.RandomRuleId].RandomRuleId = DataTable.RandomRuleId
        self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDataType = DataTable.RegionDataType
        self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDatas = {}
      end
      table.insert(self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDatas, DataTable)
    end
  end
end

function M:AvatarAddRegionActorData(Index, Info)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DataTable = self.RegionData[Index]
  DataTable.UnitType = not DataTable.UnitType and Info.Creator and Info.Creator.UnitType
  DataTable.UnitId = not DataTable.UnitId and Info.Creator and Info.Creator.UnitId
  Avatar:AvatarC2SAddRegionActorData(DataTable)
end

function M:AddRandomCreatorData(Index, Info)
  local DataTable = self.RegionData[Index]
  if not self.RandomCreatorDatas[DataTable.RandomRuleId] then
    self.RandomCreatorDatas[DataTable.RandomRuleId] = {}
    self.RandomCreatorDatas[DataTable.RandomRuleId].RandomRuleId = DataTable.RandomRuleId
    self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDataType = DataTable.RegionDataType
    self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDatas = {}
  end
  table.insert(self.RandomCreatorDatas[DataTable.RandomRuleId].RegionDatas, DataTable)
end

function M:UploadRandomCreatorData(RandomRuleId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CopyData = CommonUtils.DeepCopy(self.RandomCreatorDatas[RandomRuleId])
  if not CopyData or not CopyData.RegionDatas then
    return
  end
  for _, Data in pairs(CopyData.RegionDatas) do
    if Data.Rotation then
      DebugPrint("UploadRandomCreatorData ERROR", Data.WorldRegionEid)
    end
    Data.Rotation = nil
    Data.Creator = nil
    Data.UnitType = nil
    Data.Level = nil
    Data.Completed = nil
    Data.ExtraRegionInfo = nil
    Data.UnitId = nil
    Data.Loc = nil
  end
  Avatar:AvatarC2SAddRandomRegionActorData(CopyData)
  self.RandomCreatorDatas[RandomRuleId] = nil
end

function M:RemoveData(Index)
  local Info = self.RegionData[Index]
  local QuestChainId = Info.QuestChainId
  if QuestChainId and QuestChainId > 0 and Info.QuestChainIndex then
    DebugPrint("RegionDataPool RemoveData QuestChainId", QuestChainId, Info.WorldRegionEid, Info.CreatorId)
    local QuestChainData = self.QuestChainId2Data[QuestChainId]
    if QuestChainData and QuestChainData[Info.QuestChainIndex] then
      QuestChainData[Info.QuestChainIndex], QuestChainData[#QuestChainData] = QuestChainData[#QuestChainData], QuestChainData[Info.QuestChainIndex]
      QuestChainData[Info.QuestChainIndex].QuestChainIndex = Info.QuestChainIndex
      table.remove(QuestChainData)
    end
  end
  Info = {}
end

function M:RemoveQuestChainData(QuestChainId, DestroyReason)
  if not (QuestChainId and self.QuestChainId2Data[QuestChainId]) or not self.RegionDataMgr then
    return
  end
  local DataToRemove = {}
  for _, QuestChainData in pairs(self.QuestChainId2Data[QuestChainId]) do
    table.insert(DataToRemove, QuestChainData.WorldRegionEid)
  end
  for _, WorldRegionEid in pairs(DataToRemove) do
    DebugPrint("RemoveQuestChainData WorldRegionEid = ", WorldRegionEid, "  DestroyReason:", DestroyReason)
    self.RegionDataMgr:DestroyRegionEntity(WorldRegionEid, DestroyReason)
  end
  self.QuestChainId2Data[QuestChainId] = {}
end

function M:AddQuestChainData(DataTable)
  local QuestChainId = DataTable.QuestChainId
  if not self.QuestChainId2Data[QuestChainId] then
    self.QuestChainId2Data[QuestChainId] = {}
  end
  table.insert(self.QuestChainId2Data[QuestChainId], DataTable)
  DataTable.QuestChainIndex = #self.QuestChainId2Data[QuestChainId]
end

function M:AddDynamicQuestData(DataTable, DynamicQuestId)
  if not self.DynamicQuestId2Data[DynamicQuestId] then
    self.DynamicQuestId2Data[DynamicQuestId] = {}
  end
  table.insert(self.DynamicQuestId2Data[DynamicQuestId], DataTable)
end

function M:RemoveDynamicQuestData(DynamicQuestId, DestroyReason)
  if not (DynamicQuestId and self.DynamicQuestId2Data[DynamicQuestId]) or not self.RegionDataMgr then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  for _, DynamicQuestData in pairs(self.DynamicQuestId2Data[DynamicQuestId]) do
    local Creator = GameState.StaticCreatorMap:FindRef(DynamicQuestData.CreatorId)
    if Creator then
      for i = 1, Creator.ChildEids:Length() do
        local Eid = Creator.ChildEids:GetRef(i)
        GameState:RemoveGuideEid(Eid)
      end
    end
    self.RegionDataMgr:DestroyRegionEntity(DynamicQuestData.WorldRegionEid, DestroyReason)
    DynamicQuestData = {}
  end
  self.DynamicQuestId2Data[DynamicQuestId] = {}
end

function M:AddSpecialQuestData(DataTable, SpecialQuestId)
  if not self.SpecialQuestId2Data[SpecialQuestId] then
    self.SpecialQuestId2Data[SpecialQuestId] = {}
  end
  table.insert(self.SpecialQuestId2Data[SpecialQuestId], DataTable)
end

function M:RemoveSpecialQuestData(SpecialQuestId, DestroyReason)
  if not (SpecialQuestId and self.SpecialQuestId2Data[SpecialQuestId]) or not self.RegionDataMgr then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  for _, SpecialQuestData in pairs(self.SpecialQuestId2Data[SpecialQuestId]) do
    local Creator = GameState.StaticCreatorMap:FindRef(SpecialQuestData.CreatorId)
    if Creator then
      for i = 1, Creator.ChildEids:Length() do
        local Eid = Creator.ChildEids:GetRef(i)
        GameState:RemoveGuideEid(Eid)
      end
    end
    self.RegionDataMgr:DestroyRegionEntity(SpecialQuestData.WorldRegionEid, DestroyReason)
    SpecialQuestData = {}
  end
  self.SpecialQuestId2Data[SpecialQuestId] = {}
end

function M:CheckQuestDataExist(QuestChainId, NewData)
  if self.QuestChainId2Data[QuestChainId] then
    for _, Data in pairs(self.QuestChainId2Data[QuestChainId]) do
      if NewData.CreatorId ~= nil and NewData.CreatorId == Data.CreatorId and NewData.UnitId == Data.UnitId and NewData.UnitType == Data.UnitType and NewData.WorldRegionEid ~= Data.WorldRegionEid then
        return true
      end
    end
  end
  return false
end

function M:UpdateState(DataTableIndex, DataName, DataValue)
  local Info = self.RegionData[DataTableIndex]
  if Info then
    Info.State = Info.State or {}
    Info.State[DataName] = DataValue
  end
end

function M:UpdateStateByTable(DataTableIndex, NewState)
  local Info = self.RegionData[DataTableIndex]
  local SomethingDiff = false
  if Info then
    Info.State = Info.State or {}
    for Key, Value in pairs(NewState) do
      if Value ~= Info.State[Key] then
        SomethingDiff = true
      end
      Info.State[Key] = Value
    end
  else
    GWorld.logger.error("M:UpdateStateByTable SomethingDiff : Info Error " .. DataTableIndex)
  end
  return SomethingDiff
end

function M:UpdateLevelNameAndSubRegionId(DataTableIndex, Actor)
  local Data = self.RegionData[DataTableIndex]
  if Data then
    Data.LevelName = Actor.LevelName
    Data.SubRegionId = Actor.SubRegionId
  end
end

function M:ClearState(DataTableIndex)
  local Info = self.RegionData[DataTableIndex]
  if Info then
    Info.State = {}
  end
end

function M:GetStateIdByWorldRegionEid(LuaTableIndex)
  local Info = self.RegionData[LuaTableIndex]
  if not Info then
    return -1
  end
  if not Info.State then
    return -1
  end
  if not Info.State.StateId then
    return -1
  end
  return Info.State.StateId
end

function M:MarkRegionDataDead(LuaTableIndex)
  local Info = self.RegionData[LuaTableIndex]
  if not self:CheckUnitDataNeedStorage(Info.RegionDataType) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:RegionDataDead(Info)
  end
end

function M:FillStaticCreatorData(DataTable, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  DataTable.CreatorId = Info.Creator.StaticCreatorId
  DataTable.LevelName = Info.Creator.WorldCompositionLevelId
  DataTable.RegionDataType = Info.Creator.RegionDataType
  if WorldLoader then
    DataTable.SubRegionId = WorldLoader:GetRegionIdByLocation(Info.Creator:K2_GetActorLocation())
  end
  DataTable.IsUnlimited = Info.Creator.IsFullRegionStore
  DataTable.RarelyId = Info.Creator.RarelyId
  DataTable.QuestChainId = Info.Creator.QuestChainId
  DataTable.State = Info:GetLuaTable("State")
  DataTable.Level = Info.Creator:GetUnitLevel()
  DataTable.Type = 1
end

function M:FillStaticCreatorDataNew(Index, Info)
  local DataTable = self.RegionData[Index]
  self:FillStaticCreatorData(DataTable, Info)
  if DataTable.QuestChainId and DataTable.QuestChainId > 0 then
    self:AddQuestChainData(DataTable)
  elseif Info.Creator.ExtraRegionInfo.DynQuestId > 0 then
    self:AddDynamicQuestData(DataTable, Info.Creator.ExtraRegionInfo.DynQuestId)
  elseif Info.Creator.ExtraRegionInfo.SpecialQuestId > 0 then
    self:AddSpecialQuestData(DataTable, Info.Creator.ExtraRegionInfo.SpecialQuestId)
  end
  self.RegionDataMgr:OnRegionDataFill_Log(DataTable.WorldRegionEid, DataTable.Eid, DataTable.LevelName)
  return DataTable.SubRegionId, DataTable.WorldRegionEid
end

function M:FillRandomCreatorData(DataTable, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  DataTable.RandomCreatorId = Info.RandomCreatorId
  DataTable.RandomRuleId = Info.RandomRuleId
  DataTable.RandomTableId = Info.RandomTableId
  if not Info.RandomIdxInRule then
    DataTable.RandomIdxInRule = GameMode.RandomActorManager:GetCreatorRegionDataIdxInRule(Info.RandomRuleId, Info.RandomCreatorId)
    local Loc = GameMode.RandomActorManager:GetCreatorRegionDataLoc(DataTable.RandomRuleId, DataTable.RandomCreatorId)
    DataTable.BornLocation = {
      X = Loc.X,
      Y = Loc.Y,
      Z = Loc.Z
    }
  else
    DataTable.RandomIdxInRule = Info.RandomIdxInRule
    DataTable.BornLocation = Info.BornLocation
  end
  local Loc = FVector(DataTable.BornLocation.X, DataTable.BornLocation.Y, DataTable.BornLocation.Z)
  DataTable.LevelName = GameMode:GetWCSubSystem():GetLocationLevelName(Loc)
  DataTable.RegionDataType = GameMode.RandomActorManager:GetCreatorRegionDataType(Info.RandomRuleId, 0)
  if WorldLoader then
    DataTable.SubRegionId = WorldLoader:GetRegionIdByLocation(Loc)
  end
  DataTable.QuestChainId = -1
  DataTable.State = Info.State
  local RandomInfo = DataMgr.RandomCreator[DataTable.RandomRuleId].RandomInfos[DataTable.RandomTableId]
  DataTable.Type = 2
end

function M:FillRandomCreatorDataNew(Index, Info)
  local DataTable = self.RegionData[Index]
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  DataTable.RandomCreatorId = Info.IntParams:Find("RandomCreatorId")
  DataTable.RandomRuleId = Info.IntParams:Find("RandomRuleId")
  DataTable.RandomTableId = Info.IntParams:Find("RandomTableId")
  local RandomIdxInRule = Info.IntParams:Find("RandomIdxInRule")
  if RandomIdxInRule then
    DataTable.RandomIdxInRule = RandomIdxInRule
    DataTable.BornLocation = Info.VectorParams:Find("BornLocation")
  else
    DataTable.RandomIdxInRule = GameMode.RandomActorManager:GetCreatorRegionDataIdxInRule(DataTable.RandomRuleId, DataTable.RandomCreatorId)
    local Loc = GameMode.RandomActorManager:GetCreatorRegionDataLoc(DataTable.RandomRuleId, DataTable.RandomCreatorId)
    DataTable.BornLocation = {
      X = Loc.X,
      Y = Loc.Y,
      Z = Loc.Z
    }
  end
  local Loc = FVector(DataTable.BornLocation.X, DataTable.BornLocation.Y, DataTable.BornLocation.Z)
  DataTable.LevelName = GameMode:GetWCSubSystem():GetLocationLevelName(Loc)
  DataTable.RegionDataType = GameMode.RandomActorManager:GetCreatorRegionDataType(DataTable.RandomRuleId, 0)
  if WorldLoader then
    DataTable.SubRegionId = WorldLoader:GetRegionIdByLocation(Loc)
  end
  DataTable.QuestChainId = -1
  DataTable.State = Info:GetLuaTable("State")
  DataTable.Type = 2
  self.RegionDataMgr:OnRegionDataFill_Log(DataTable.WorldRegionEid, DataTable.Eid, DataTable.LevelName)
  return DataTable.SubRegionId, DataTable.WorldRegionEid
end

function M:FillCommonData(DataTable, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  DataTable.LevelName = Info.LevelName or GameMode:GetWCSubSystem():GetLocationLevelName(Info.Loc)
  DataTable.RegionDataType = Info.RegionDataType
  if WorldLoader then
    DataTable.SubRegionId = WorldLoader:GetRegionIdByLocation(Info.Loc)
  end
  DataTable.UnitType = Info.UnitType
  DataTable.UnitId = Info.UnitId
  DataTable.ManualItemId = Info.ManualItemId
  DataTable.State = Info.State
  DataTable.RarelyId = Info.RarelyId
  if Info.Loc then
    DataTable.BornLocation = {
      X = Info.Loc.X,
      Y = Info.Loc.Y,
      Z = Info.Loc.Z
    }
  else
  end
  DataTable.Loc = DataTable.BornLocation
  DataTable.Type = 3
  DataTable.QuestChainId = Info.QuestChainId
  DataTable.IsUnlimited = Info.IsFullRegionStore
end

function M:FillCommonDataNew(Index, Info)
  local DataTable = self.RegionData[Index]
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  local LevelName = Info.StrParams:Find("LevelName")
  DataTable.LevelName = LevelName or GameMode:GetWCSubSystem():GetLocationLevelName(Info.Loc)
  DataTable.RegionDataType = Info.IntParams:Find("RegionDataType")
  if WorldLoader then
    DataTable.SubRegionId = WorldLoader:GetRegionIdByLocation(Info.Loc)
  end
  DataTable.UnitType = Info.UnitType
  DataTable.UnitId = Info.UnitId
  DataTable.ManualItemId = Info.IntParams:Find("ManualItemId")
  DataTable.State = Info:GetLuaTable("State")
  DataTable.RarelyId = Info.IntParams:Find("RarelyId")
  if Info.Loc then
    DataTable.BornLocation = {
      X = Info.Loc.X,
      Y = Info.Loc.Y,
      Z = Info.Loc.Z
    }
  else
  end
  DataTable.Loc = DataTable.BornLocation
  DataTable.Type = 3
  DataTable.QuestChainId = Info.IntParams:Find("QuestChainId")
  DataTable.IsUnlimited = Info.BoolParams:Find("IsFullRegionStore")
  self.RegionDataMgr:OnRegionDataFill_Log(DataTable.WorldRegionEid, DataTable.Eid, DataTable.LevelName)
  return DataTable.SubRegionId, DataTable.WorldRegionEid
end

function M:CompleteStaticCreatorData(DataTable)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local Creator = GameState.StaticCreatorMap:FindRef(DataTable.CreatorId)
  DataTable.UnitType = Creator.UnitType
  DataTable.UnitId = Creator.UnitId
  DataTable.Creator = Creator
  DataTable.Loc = Creator:K2_GetActorLocation()
  DataTable.BornPos = DataTable.Loc
  DataTable.Rotation = Creator:K2_GetActorRotation()
  DataTable.QuestChainId = Creator:GetQuestChainId()
  DataTable.ExtraRegionInfo = {
    SpecialQuestId = Creator.ExtraRegionInfo.SpecialQuestId,
    DynQuestId = Creator.ExtraRegionInfo.DynQuestId
  }
  DataTable.Completed = true
end

function M:CompleteRandomCreatorData(DataTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RandomInfo = DataMgr.RandomCreator[DataTable.RandomRuleId].RandomInfos[DataTable.RandomTableId]
  if not RandomInfo then
    local DebugString = string.format("RandomCreator RecoverParamError : RandomRuleId = %d, RandomTableId = %d, RandomRuleId = %d", DataTable.RandomRuleId, DataTable.RandomTableId, DataTable.RandomRuleId)
    GWorld.logger.error(DebugString)
    return
  end
  DataTable.UnitType = DataMgr.RandomCreator[DataTable.RandomRuleId].UnitType
  DataTable.UnitId = RandomInfo.UnitId
  DataTable.Level = (RandomInfo.UnitLevel or 0) + GameMode:GetFixedGamemodeLevel()
  DataTable.Loc = FVector(DataTable.BornLocation.X, DataTable.BornLocation.Y, DataTable.BornLocation.Z)
  DataTable.Creator = GameMode.RandomActorManager:GetCreator(DataTable.RandomRuleId, "", DataTable.IdxInRule)
  if not DataTable.Creator or DataTable.Creator == {} then
    DebugPrint("RandomCreator\228\184\173\228\184\141\229\173\152\229\156\168\229\166\130\228\184\139\230\149\176\230\141\174\239\188\154 Location = ", DataTable.Loc)
  elseif DataTable.Creator.ExtraRegionInfo then
    DataTable.ExtraRegionInfo = {
      SpecialQuestId = DataTable.Creator.ExtraRegionInfo.SpecialQuestId,
      DynQuestId = DataTable.Creator.ExtraRegionInfo.DynQuestId
    }
  end
  DataTable.Rotation = GameMode.RandomActorManager:GetCreatorRegionDataRot(DataTable.RandomRuleId, DataTable.RandomCreatorId)
  DataTable.Completed = true
end

function M:CompleteRawData(Info)
  if not Info.BornLocation then
    return
  end
  Info.Loc = FVector(Info.BornLocation.X, Info.BornLocation.Y, Info.BornLocation.Z)
  Info.BornPos = Info.Loc
end

function M:AddUnitRegionCacheData(Index)
  self.RegionDataMgr.DataLibrary:AddUnitRegionCacheData(self.RegionData[Index])
end

return M
