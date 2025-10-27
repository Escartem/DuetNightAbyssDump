local pb = require("pb")
local LevelBaseDataAttrDict = require("BluePrints.Client.CustomTypes.Region").LevelBaseDataAttrDict
local Component = {}

function Component:ReceiveSynchronizedDataFromServer(RegionDatas)
  local RegionId = self:GetSubRegionId2RegionId()
  local RegionInfo = DataMgr.Region[RegionId]
  if not RegionInfo then
    self.logger.error("ZJT_ ReceiveSynchronizedDataFromServer \230\149\176\230\141\174\233\148\153\232\175\175 ", RegionId, self:GetCurrentRegionId())
    PrintTable({RegionDatas = RegionDatas}, 10)
    return
  end
  for RegionDataType, RegionDataTypeName in pairs(CommonConst.RegionDataType) do
    local RegionTypeData = RegionDatas[RegionDataType]
    if RegionTypeData then
      for _, SubRegionId in ipairs(RegionInfo.IsRandom) do
        local EncodeStr = RegionTypeData[tostring(SubRegionId)]
        if EncodeStr then
          local DecodeStr = pb.decode(".LevelBaseDataAttrDict", EncodeStr)
          if DecodeStr then
            local DecodeProtoAttr = LevelBaseDataAttrDict:proto_load(DecodeStr)
            RegionTypeData[tostring(SubRegionId)] = DecodeProtoAttr:save_dump(DecodeProtoAttr)
          end
        end
      end
    end
  end
  PrintTable({DecodeRegionDatas = RegionDatas}, 10)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  SubSystem:SyncPartRegionDataFromServer(RegionDatas)
end

function Component:ReceiveSyncAllRegionDataFromServer(AllRegionBaseDataCache)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  SubSystem:SyncFullRegionStoreDataFromServer(AllRegionBaseDataCache)
end

function Component:GMReceiveSynchronizedDataFromServer(RequestType, RegionDatas)
  print(_G.LogTag, "GMReceiveSynchronizedDataFromServer")
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if RequestType == CommonConst.GMRegionTargetType.AllData then
    SubSystem:GMTest_PrintServerRegionData(RegionDatas)
  elseif RequestType == CommonConst.GMRegionTargetType.AllQuestData then
    SubSystem:GMTest_PrintServerQuestChainData(RegionDatas)
  end
end

function Component:GMC2S_RequestSynchronizedDataFromServer(RequestType, RequestParamTable)
  RequestParamTable = RequestParamTable or {}
  print(_G.LogTag, "GMC2S_RequestSynchronizedDataFromServer")
  self:CallServerMethod("GMHandleQuestDatasEnterRegion", RequestType, RequestParamTable)
end

function Component:GMHandleSyncAllRegionDataToClient(Callback)
  self:CallServer("GMHandleSyncAllRegionDataToClient", Callback)
end

function Component:EnterRegion(TargetRegionId, StartIndex, EnterRegionType, ForLogin, bIsInvitation)
  local CheckRes, BlackScreenHandle = self:PreHandleEnterRegion(TargetRegionId, StartIndex, EnterRegionType, bIsInvitation)
  if not CheckRes then
    return
  end
  ForLogin = ForLogin or false
  
  local function callback(Ret, _RegionId)
    if not ErrorCode:Check(Ret) then
      return
    end
    self:RealHandleEnterRegion(TargetRegionId, bIsInvitation, BlackScreenHandle)
  end
  
  self:CallServer("EnterRegion", callback, TargetRegionId, StartIndex, EnterRegionType, ForLogin)
end

function Component:RealHandleEnterRegion(TargetRegionId, bIsInvitation, BlackScreenHandle)
  if bIsInvitation then
    UIManager(self):HideCommonBlackScreen(BlackScreenHandle)
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    PlayerCharacter:RemoveDisableInputTag("CameraLookToTarget")
    local SojournsGameInstanceSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, USojournsGameInstanceSubsystem)
    if SojournsGameInstanceSubsystem then
      SojournsGameInstanceSubsystem:SetInvitationRegionId(TargetRegionId)
    end
  end
end

function Component:SetDisableInputTag(bIsInvitation, PlayerCharacter, BlackScreenHandle)
  if bIsInvitation then
    UIManager(self):ShowCommonBlackScreen(BlackScreenHandle)
    PlayerCharacter:AddDisableInputTag("CameraLookToTarget")
  end
end

function Component:SetTryActiveDefaultDeliver(EnterRegionType)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    return
  end
  if EnterRegionType == CommonConst.EnterRegionType.FirstRegion then
    return
  end
  if EnterRegionType == CommonConst.EnterRegionType.Recover then
    return
  end
  GameMode:GetRegionDataMgrSubSystem().bTryActiveDefaultDeliver = true
end

function Component:CheckRepeatEnterRegion(TargetRegionId)
  if self:GetSubRegionId2RegionId(TargetRegionId) == self:GetSubRegionId2RegionId() and self:IsInBigWorld() then
    self.logger.error("ZJT_ \229\144\140\229\140\186\229\159\159\228\188\160\233\128\129\232\175\183\232\181\176\229\133\179\229\141\161\229\138\160\229\141\184\232\189\189 ", TargetRegionId, self:GetCurrentRegionId())
    return false
  end
  return true
end

function Component:PreHandleEnterRegion(TargetRegionId, StartIndex, EnterRegionType, bIsInvitation)
  local BlackScreenHandle
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local IsRepeatEnterRegion = self:CheckRepeatEnterRegion(TargetRegionId)
  if not IsRepeatEnterRegion then
    return false, BlackScreenHandle
  end
  BlackScreenHandle = {
    BlackScreenHandle = "Invitation",
    InAnimationObj = self,
    OutAnimationObj = self
  }
  self:SetDisableInputTag(bIsInvitation, PlayerCharacter, BlackScreenHandle)
  if not self:CheckRegionId(TargetRegionId) then
    return false, BlackScreenHandle
  end
  GWorld:OpenWorldRegionState()
  self:SetTryActiveDefaultDeliver(EnterRegionType)
  self.StartIndex = tonumber(StartIndex) or 1
  return true, BlackScreenHandle
end

function Component:RecoverRegion_ExitDungeon()
  local CheckRes, BlackScreenHandle = self:PreHandleEnterRegion(self:GetCurrentRegionId(), self.StartIndex, CommonConst.EnterRegionType.Recover)
  if not CheckRes then
    return
  end
  
  local function Callback(Ret, TargetRegionId)
    if not ErrorCode:Check(Ret) then
      return
    end
    EventManager:FireEvent(EventID.OnExitDungeon)
    self:RealHandleEnterRegion(TargetRegionId, nil, BlackScreenHandle)
  end
  
  self:CallServer("RecoverRegion_ExitDungeon", Callback)
end

function Component:SkipRegion(TargetRegionId)
  local PreRegionId = self.CurrentRegionId
  
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      if not self:CheckRegionErrorCode(Ret, ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT) and not self:CheckRegionErrorCode(Ret, ErrorCode.RET_CURRENT_TARGET_REGIOINID_EQUAL) then
        GWorld.logger.debug("SkipRegion  " .. "ErrorCode:" .. Ret .. "  TargetRegionId:" .. TargetRegionId .. " CurrentRegionId:" .. self.CurrentRegionId .. ", \232\175\166\231\187\134\230\149\176\230\141\174\232\167\129Log")
      end
      return
    end
    self:RealHandleSkipRegion(PreRegionId, self:GetCurrentRegionId())
  end
  
  self:GetCurrentSafeAndSaveLocation()
  self:CallServer("SkipRegion", Callback, TargetRegionId, self.LastRegionData.RegionId, self.LastRegionData:GetLocation(), self.LastRegionData:GetRotation())
end

function Component:RealHandleSkipRegion(PreRegionId)
  self:ExeRegionSkipCallbck(PreRegionId)
  self:ExeRegionSkipCallbck(self:GetCurrentRegionId())
  EventManager:FireEvent(EventID.OnSkipRegion, self:GetCurrentRegionId())
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if PlayerCharacter then
    PlayerCharacter:OnEnteredNewSubRegion()
  end
  local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
  TaskUtils:UpdatePlayerSubRegionIdInfo(self.CurrentRegionId)
end

function Component:TrySpawnSpecialMonster(RuleId, Cb)
  local Cb = Cb or function(ErrCode)
    DebugPrint("TrySpawnSpecialMonster ", ErrorCode:Name(ErrCode))
  end
  local Rule = DataMgr.SpecialMonsterSpawn[RuleId]
  if not Rule then
    Cb(ErrorCode.RET_REGION_SPECIAL_MONSTER_RULE_NOT_EXIST)
    return
  end
  local SpawnCount = self.RegionSpecialMonsterCounter[RuleId] or 0
  if SpawnCount >= Rule.WeeklyLimit then
    Cb(ErrorCode.RET_REGION_SPECIAL_MONSTER_MAX_COUNT)
    return
  end
  if Rule.SpawnRegion and self.CurrentRegionId ~= Rule.SpawnRegion then
    DebugPrint("[TrySpawnSpecialMonster] RET_REGION_SPECIAL_MONSTER_NOT_IN_REGION ", self.CurrentRegionId, Rule.SpawnRegion)
    Cb(ErrorCode.RET_REGION_SPECIAL_MONSTER_NOT_IN_REGION)
    return
  end
  self:CallServer("TrySpawnSpecialMonster", Cb or function(ErrCode)
    DebugPrint("TrySpawnSpecialMonster ", ErrorCode:Name(ErrCode))
  end, RuleId)
end

function Component:RegionActorUpdate(TargetActor, NewSubRegionId, NewLevelName, StateTable)
  local NoStorageRegionDataType = {
    ERegionDataType.RDT_QuestData,
    ERegionDataType.RDT_None,
    ERegionDataType.RDT_HardBossData,
    ERegionDataType.RDT_QuestCommonData
  }
  if CommonUtils.HasValue(NoStorageRegionDataType, TargetActor.RegionDataType) then
    DebugPrint("RegionLog:  Actor\230\155\180\230\150\176\229\177\158\230\128\167,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  \228\184\141\229\129\154\228\187\187\228\189\149\229\164\132\231\144\134, WorldRegionEid:" .. tostring(TargetActor.WorldRegionEid))
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Ret, UnitRegionData = self:AvatarUpdateUnitRegionData(TargetActor, NewSubRegionId, NewLevelName)
  if not self:CheckRegionErrorCode(Ret) then
    DebugPrint("RegionLog:  Actor\230\155\180\230\150\176\229\177\158\230\128\167,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  WorldRegionEid:" .. tostring(TargetActor.WorldRegionEid) .. "    \230\155\180\230\150\176\230\149\176\230\141\174\229\164\177\232\180\165\239\188\140Ret\239\188\154" .. Ret)
    return
  end
  
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("UpdateRegionActorData " .. "ErrorCode:" .. Ret .. " WorldRegionEid:" .. TargetActor.WorldRegionEid .. " NewSubRegionId:" .. NewSubRegionId .. " RegionDataType:" .. TargetActor.RegionDataType .. " NewLevelName:" .. NewLevelName)
      PrintTable(StateTable)
    end
  end
  
  if self.CombineAdd and self:TryUpdateCombineRegionData(TargetActor, StateTable) then
    return
  end
  self:CallServer("UpdateRegionActorData", callback, TargetActor.WorldRegionEid, NewSubRegionId, TargetActor.RegionDataType, StateTable, NewLevelName)
end

function Component:CheckRegionErrorCode(SourceErrorCode, TargetErrorCode)
  TargetErrorCode = TargetErrorCode or ErrorCode.RET_SUCCESS
  return SourceErrorCode == TargetErrorCode
end

function Component:C2SReigonActorDead(TargetActor, NewSubRegionId, NewLevelName)
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("DeadRegionActorData" .. " ErrorCode" .. Ret .. " WorldRegionEid:" .. TargetActor.WorldRegionEid .. " NewSubRegionId:" .. NewSubRegionId .. " RegionDataType:" .. TargetActor.RegionDataType .. " NewLevelName:" .. NewLevelName)
    end
  end
  
  self:CallServer("DeadRegionActorData", callback, TargetActor.WorldRegionEid, NewSubRegionId, TargetActor.RegionDataType, NewLevelName)
end

function Component:RegionActorDead(TargetActor, DestoryReason, NewSubRegionId, NewLevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local NoStorageRegionDataType = {
    ERegionDataType.RDT_QuestData,
    ERegionDataType.RDT_None,
    ERegionDataType.RDT_HardBossData,
    ERegionDataType.RDT_QuestCommonData
  }
  if DestoryReason == EDestroyReason.LevelUnloadedSaveGame or DestoryReason == EDestroyReason.LevelNotExsit then
    DebugPrint("RegionLog:  WC\229\175\188\232\135\180Actor\233\148\128\230\175\129,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  WorldRegionEid:" .. TargetActor.WorldRegionEid)
    GameMode:GetRegionDataMgrSubSystem():AddSSData(TargetActor.WorldRegionEid)
    return
  end
  if DestoryReason == EDestroyReason.HardBossClear and TargetActor.RegionDataType ~= ERegionDataType.RDT_HardBossData then
    DebugPrint("RegionLog:  HardBossClear\229\175\188\232\135\180Actor\233\148\128\230\175\129,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  WorldRegionEid:" .. TargetActor.WorldRegionEid)
    if TargetActor.CheckHardBossNeedSnapShot and TargetActor:CheckHardBossNeedSnapShot() then
      GameMode:GetRegionDataMgrSubSystem():AddSSData(TargetActor.WorldRegionEid, true)
    end
    return
  end
  if DestoryReason == EDestroyReason.SepcialQuestStart then
    DebugPrint("RegionLog:  SepcialQuestStart\229\175\188\232\135\180Actor\233\148\128\230\175\129,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  WorldRegionEid:" .. TargetActor.WorldRegionEid)
    GameMode:GetRegionDataMgrSubSystem():AddSSData(TargetActor.WorldRegionEid, true)
    return
  end
  GameMode:GetRegionDataMgrSubSystem():OnActorDead(TargetActor)
  if CommonUtils.HasValue(NoStorageRegionDataType, TargetActor.RegionDataType) then
    DebugPrint("RegionLog:  Actor\233\148\128\230\175\129,\229\189\147\229\137\141\231\177\187\229\158\139\228\184\186\239\188\154" .. TargetActor.RegionDataType .. "  \228\184\141\229\129\154\228\187\187\228\189\149\229\164\132\231\144\134, WorldRegionEid:" .. tostring(TargetActor.WorldRegionEid))
    return
  end
  if DestoryReason == EDestroyReason.RegionExploreGroup then
    return
  end
  if GameMode:GetRegionDataMgrSubSystem().DataLibrary:SetUnitIsDeadByWorldRegionEid(TargetActor.WorldRegionEid) then
    self:C2SReigonActorDead(TargetActor, NewSubRegionId, NewLevelName)
    if TargetActor.CreatorId > 0 then
      GameMode:TriggerOnRegionUnitDead(TargetActor.CreatorId)
    end
  end
end

function Component:AvatarUpdateUnitRegionData(TargetActor)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local UnitRegionData = GameMode:GetRegionDataMgrSubSystem():UpdateUnitRegionCacheDataByActor(TargetActor)
  if not UnitRegionData then
    return ErrorCode.RET_REGION_NOT_EXIST_CACHE_REGIONBASEDATA, nil
  end
  return ErrorCode.RET_SUCCESS, UnitRegionData
end

function Component:AvatarC2SAddRegionActorData(UnitRegionData)
  if UnitRegionData.RegionDataType == ERegionDataType.RDT_QuestCommonData then
    DebugPrint("AddRegionActorData Fail, RegionDataType:RDT_QuestCommonData, WorldRegionEid:", UnitRegionData.WorldRegionEid)
    return
  end
  if self.CombineAdd then
    table.insert(self.CombineAddDatas, UnitRegionData)
    return
  end
  DebugPrint("ZJT_  RegionDataMgr: Client  RegionAddDataByUnit", UnitRegionData.ManualItemId, UnitRegionData.WorldRegionEid)
  
  local function Callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("AddRegionActorData " .. "ErrorCode:" .. Ret .. " RegionDataType:" .. UnitRegionData.RegionDataType .. " WorldRegionEid:" .. UnitRegionData.WorldRegionEid .. " ManualItemId:" .. tostring(UnitRegionData.ManualItemId or -1))
      PrintTable(UnitRegionData)
    end
    DebugPrint("zjt_ RegionDataMgr: CallServer  RegionAddDataByUnit", Ret, UnitRegionData.ManualItemId, UnitRegionData.WorldRegionEid)
  end
  
  self:CallServer("AddRegionActorData", Callback, UnitRegionData.RegionDataType, UnitRegionData)
end

function Component:AddAutoRegionActorDatas(TargetRegionBaseDatas)
  if next(TargetRegionBaseDatas) == nil then
    return
  end
  
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self.logger.error("ZJT_ AddAutoRegionActorDatas ServerCallClient Failed ", Ret)
    else
      self.logger.debug("ZJT_ AddAutoRegionActorDatas ServerCallClient Success ", Ret)
    end
  end
  
  self:CallServer("AddAutoRegionActorDatas", Callback, TargetRegionBaseDatas)
end

function Component:ResetRarelyStaticCreator(StaticCreatorId, CB, PrivateEnable, EventName)
  local function Callback(Ret)
    if self:CheckRegionErrorCode(Ret) then
      CB(StaticCreatorId, PrivateEnable, EventName)
    else
    end
  end
  
  self:CallServer("ResetRarelyStaticCreator", Callback, StaticCreatorId)
end

function Component:AvatarC2SAddRandomRegionActorData(RandomCreatorDatas)
  if not RandomCreatorDatas or type(RandomCreatorDatas) ~= "table" then
    return
  end
  
  local function Callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("AddRandomCreatorRegionDatas " .. "ErrorCode:" .. Ret)
      PrintTable(RandomCreatorDatas)
    end
  end
  
  self:CallServer("AddRandomCreatorRegionDatas", Callback, RandomCreatorDatas)
end

function Component:UpdateRegionDataStateByCreatorId(CreatorId, StateData)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode.GetRegionDataMgrSubSystem then
    return
  end
  local RegionDatas = GameMode:GetRegionDataMgrSubSystem():UpdateRegionDataStateCacheByCreatorId(CreatorId, StateData)
  if not RegionDatas or 0 == #RegionDatas then
    return
  end
  
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("UpdateRegionActorData" .. " ErrorCode:" .. Ret)
      for _, RegionData in pairs(RegionDatas) do
        GWorld.logger.error(" WorldRegionEid:" .. RegionData.WorldRegionEid .. " SubRegionId:" .. RegionData.SubRegionId .. " RegionDataType:" .. RegionData.RegionDataType .. " LevelName" .. RegionData.LevelName)
      end
      PrintTable(StateData)
    end
  end
  
  for _, RegionData in pairs(RegionDatas) do
    self:CallServer("UpdateRegionActorData", callback, RegionData.WorldRegionEid, RegionData.SubRegionId, RegionData.RegionDataType, StateData, RegionData.LevelName)
  end
end

function Component:UpdatePhantomRegionActorData(RegionData, StateData)
  local function Callback(Ret)
    self.logger.debug("ZJT_ UpdatePhantomRegionActorData ", Ret)
  end
  
  self:CallServer("UpdatePhantomRegionActorData", Callback, RegionData.WorldRegionEid, RegionData.SubRegionId, RegionData.RegionDataType, RegionData.LevelName, StateData)
end

function Component:RegionActorDataDeadByCreatorId(CreatorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RegionDatas = GameMode:GetRegionDataMgrSubSystem():RegionActorCacheDataDeadByCreatorId(CreatorId)
  if not RegionDatas or 0 == #RegionDatas then
    return
  end
  
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("DeadRegionActorData" .. " ErrorCode:" .. Ret)
      for _, RegionData in pairs(RegionDatas) do
        GWorld.logger.error(" WorldRegionEid:" .. RegionData.WorldRegionEid .. " SubRegionId" .. RegionData.SubRegionId .. " RegionDataType:" .. RegionData.RegionDataType .. " LevelName:" .. RegionData.LevelName)
      end
    end
  end
  
  for _, RegionData in pairs(RegionDatas) do
    self:CallServer("DeadRegionActorData", callback, RegionData.WorldRegionEid, RegionData.SubRegionId, RegionData.RegionDataType, RegionData.LevelName)
  end
end

function Component:RegionDataDead(RegionData)
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("DeadRegionActorData" .. " ErrorCode" .. Ret .. " WorldRegionEid:" .. RegionData.WorldRegionEid .. " SubRegionId:" .. RegionData.SubRegionId .. " RegionDataType:" .. RegionData.RegionDataType .. " LevelName:" .. RegionData.LevelName)
    end
  end
  
  self:CallServer("DeadRegionActorData", callback, RegionData.WorldRegionEid, RegionData.SubRegionId, RegionData.RegionDataType, RegionData.LevelName)
end

function Component:RegionActorDataDeadByUnitLabel(UnitId, UnitType)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RegionDatas = GameMode:GetRegionDataMgrSubSystem():RegionActorCacheDataDeadByUnitLabel(UnitId, UnitType)
  if not RegionDatas or 0 == #RegionDatas then
    return
  end
  
  local function callback(Ret)
    if Ret ~= ErrorCode.RET_SUCCESS and Ret ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
      GWorld.logger.error("DeadRegionActorData" .. " ErrorCode:" .. Ret)
      for _, RegionData in pairs(RegionDatas) do
        GWorld.logger.error(" WorldRegionEid:" .. RegionData.WorldRegionEid .. " SubRegionId:" .. RegionData.SubRegionId .. " RegionDataType:" .. RegionData.RegionDataType .. " LevelName:" .. RegionData.LevelName)
      end
    end
  end
  
  for _, RegionData in pairs(RegionDatas) do
    self:CallServer("DeadRegionActorData", callback, RegionData.WorldRegionEid, RegionData.SubRegionId, RegionData.RegionDataType, RegionData.LevelName)
  end
end

function Component:S2CSwitchInRegionStateFailer()
  self.logger.debug("ZJT_ S2CSwitchInRegionStateFailer ")
end

function Component:AddRandomCreatorRegionDatas(RandomCreatorDatas)
  if not RandomCreatorDatas or type(RandomCreatorDatas) ~= "table" then
    return
  end
  
  local function Callback(Ret)
    DebugPrint("ZJT_ AddRandomCreatorRegionDatas ", Ret, RandomCreatorDatas)
  end
  
  self:CallServer("AddRandomCreatorRegionDatas", Callback, RandomCreatorDatas)
end

function Component:ActiveRandomCreator(RadnomRuleId, ParamsNum, cb)
  ParamsNum = ParamsNum or 0
  if not RadnomRuleId then
    return
  end
  
  local function Callback(Ret, ClientRes)
    DebugPrint("ZJT_ ActiveRandomCreator ", Ret, RadnomRuleId, ParamsNum)
    PrintTable({ClientRes = ClientRes}, 10)
    cb(Ret, ClientRes)
  end
  
  self:CallServer("ActiveRandomCreator", Callback, RadnomRuleId, ParamsNum)
end

function Component:ActiveRandomCreators(RandomRuleInfos)
  if not RandomRuleInfos or type(RandomRuleInfos) ~= "table" then
    return
  end
  
  local function Callback(Ret, ClientRes)
    DebugPrint("ZJT_ ActiveRandomCreators ", Ret)
    PrintTable({ClientRes = ClientRes, RandomRuleInfos = RandomRuleInfos}, 10)
  end
  
  self:CallServer("ActiveRandomCreators", Callback, RandomRuleInfos)
end

function Component:TryCapturePetRegion(ResourceId, xValue, PetId, RegionDataType, WorldRegionEid, CaptureCallBack)
  local function Callback(Ret, UniqueId)
    DebugPrint("zjt_ TryCapturePetRegion Ret = ", Ret, WorldRegionEid, RegionDataType, PetId, ResourceId, xValue)
    
    if CaptureCallBack then
      CaptureCallBack(Ret, UniqueId)
    end
  end
  
  self:CallServer("TryCapturePetRegion", Callback, ResourceId, xValue, PetId, RegionDataType, WorldRegionEid)
end

function Component:CombineAddRegionData(IsCombineAdd)
  self.CombineAdd = IsCombineAdd
  if self.CombineAdd then
    self.CombineAddDatas = {}
  else
    DebugPrint("CombineAddRegionData:", #self.CombineAddDatas)
    self:AddAutoRegionActorDatas(self.CombineAddDatas)
    self.CombineAddDatas = {}
  end
end

function Component:TryUpdateCombineRegionData(TargetActor, StateTable)
  local TargetWorldRegionEid = TargetActor.WorldRegionEid
  for _, CombineData in pairs(self.CombineAddDatas) do
    if CombineData.WorldRegionEid == TargetWorldRegionEid then
      return true
    end
  end
  return false
end

return Component
