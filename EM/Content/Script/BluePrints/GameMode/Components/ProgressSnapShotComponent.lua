require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local SerializeUtils = require("Utils.SerializeUtils")
local ProgressSnapShotComponent = {}

function ProgressSnapShotComponent:TryResetBattleEid()
  if GWorld:GetAvatar() and GWorld:GetAvatar():IsInBigWorld() then
    return
  end
  if not self:GetProgressData() then
    return
  end
  if not self:NeedProgressRecover() then
    return
  end
  local LastEid = self:GetProgressData().Eid
  if not LastEid or 0 == LastEid then
    return
  end
  self:SetBattleEid(LastEid)
end

function ProgressSnapShotComponent:NeedProgressRecover()
  local ProgressData = self:GetProgressData()
  if not ProgressData then
    return false
  end
  local DungeonId = self.DungeonId or UE4.UGameplayStatics.GetGameInstance(self):GetCurrentDungeonId()
  if DungeonId ~= ProgressData.DungeonId then
    return false
  end
  return true
end

function ProgressSnapShotComponent:GetProgressData()
  if self.ProgressData == nil then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    self.ProgressData = GameInstance:GetProgressData()
  end
  return self.ProgressData
end

function ProgressSnapShotComponent:GetPlayerSliceData()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  return GameInstance:GetPlayerSliceData()
end

function ProgressSnapShotComponent:GetProgressDataJsonName()
  local ProgressData = self:GetProgressData()
  if ProgressData then
    return ProgressData.JsonName
  end
  return nil
end

function ProgressSnapShotComponent:GetProgressDataDungeonId()
  local ProgressData = self:GetProgressData()
  if ProgressData then
    return ProgressData.DungeonId
  end
  return nil
end

function ProgressSnapShotComponent:GetProgressDataPlayerTransform()
  local ProgressData = self:GetProgressData()
  if ProgressData then
    return CommonUtils:UnSerializeFTransform(ProgressData.PlayerTransform)
  end
  return nil
end

function ProgressSnapShotComponent:TriggerProgressRecover()
  local ProgressData = self:GetProgressData()
  if ProgressData then
    if ProgressData.IsRougeLike then
      self:RougeRecoverProgressData()
    elseif ProgressData.IsAbyss then
      self:AbyssRecoverProgressData()
    else
      self:RecoverProgressData()
    end
    self:OnProgressRecoverSucceed()
  end
end

function ProgressSnapShotComponent:RecordProgressData()
  if not IsStandAlone(self) then
    return
  end
  if not Const.ProgressRecoverDungeonType[self.EMGameState.GameModeType] then
    return
  end
  DebugPrint("ProgressSnapShotComponent: RecordProgressData")
  local StaticCreatorData = {}
  local RandomCreatorData = {}
  local PlayerData = {}
  local DungeonData = self:TriggerDungeonComponentFun("RecordDungeonRoundData")
  for _, Monster in pairs(self.EMGameState.MonsterMap) do
    if IsValid(Monster) and not Monster:IsDead() and Monster.CreatorType == "StaticCreator" then
      if 0 ~= Monster.RandomCreatorId then
        local TmpData = {
          RandomRuleId = Monster.RandomRuleId,
          RandomTableId = Monster.RandomTableId,
          RandomLevelName = self.RandomActorManager:GetCreatorRegionDataLevelName(Monster.RandomRuleId, Monster.RandomCreatorId),
          RandomIdxInRule = self.RandomActorManager:GetCreatorRegionDataIdxInRule(Monster.RandomRuleId, Monster.RandomCreatorId)
        }
        table.insert(RandomCreatorData, TmpData)
      elseif 0 ~= Monster.CreatorId then
        local TmpData = {
          StaticCreatorId = Monster.CreatorId,
          PrivateEnable = Monster.PrivateEnable,
          LevelName = self:GetActorLevelName(Monster)
        }
        table.insert(StaticCreatorData, TmpData)
      end
    end
  end
  for _, Monster in pairs(self.EMGameState.NpcMap) do
    if IsValid(Monster) and not Monster:IsDead() and Monster.CreatorType == "StaticCreator" then
      if 0 ~= Monster.RandomCreatorId then
        local TmpData = {
          RandomRuleId = Monster.RandomRuleId,
          RandomTableId = Monster.RandomTableId,
          RandomLevelName = self.RandomActorManager:GetCreatorRegionDataLevelName(Monster.RandomRuleId, Monster.RandomCreatorId),
          RandomIdxInRule = self.RandomActorManager:GetCreatorRegionDataIdxInRule(Monster.RandomRuleId, Monster.RandomCreatorId)
        }
        table.insert(RandomCreatorData, TmpData)
      elseif 0 ~= Monster.CreatorId and not Monster:IsPetNpc() then
        local TmpData = {
          StaticCreatorId = Monster.CreatorId,
          PrivateEnable = Monster.PrivateEnable,
          LevelName = self:GetActorLevelName(Monster)
        }
        table.insert(StaticCreatorData, TmpData)
      end
    end
  end
  for _, CombatItem in pairs(self.EMGameState.CombatItemMap) do
    if IsValid(CombatItem) then
      if CombatItem.CanDungeonSave and not CombatItem:CanDungeonSave() then
        DebugPrint("ProgressSnapShotComponent: CombatItem \229\141\179\229\176\134\233\148\128\230\175\129, \228\184\141\229\173\152\229\130\168", CombatItem:GetName(), CombatItem.Eid, CombatItem.CreatorId, CombatItem.UnitType)
      elseif 0 ~= CombatItem.RandomCreatorId then
        local TmpData = {
          RandomRuleId = CombatItem.RandomRuleId,
          RandomTableId = CombatItem.RandomTableId,
          RandomLevelName = self.RandomActorManager:GetCreatorRegionDataLevelName(CombatItem.RandomRuleId, CombatItem.RandomCreatorId),
          RandomIdxInRule = self.RandomActorManager:GetCreatorRegionDataIdxInRule(CombatItem.RandomRuleId, CombatItem.RandomCreatorId),
          ItemData = CombatItem:GetDungeonSaveData() or {}
        }
        table.insert(RandomCreatorData, TmpData)
      elseif 0 ~= CombatItem.CreatorId and not CombatItem.IsPetDefenceMechanism then
        local TmpData = {
          StaticCreatorId = CombatItem.CreatorId,
          ItemData = CombatItem:GetDungeonSaveData() or {},
          PrivateEnable = CombatItem.PrivateEnable,
          LevelName = self:GetActorLevelName(CombatItem)
        }
        table.insert(StaticCreatorData, TmpData)
      end
    end
  end
  local TmpDungeonSnapShotData = TArray(FSnapShotInfo())
  self:GetDungeonSnapShotData(TmpDungeonSnapShotData)
  local DungeonSnapShotData = {}
  for i, j in pairs(TmpDungeonSnapShotData) do
    table.insert(DungeonSnapShotData, j)
  end
  local DungeonId = self.DungeonId
  local JsonName = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self)
  local Eid = self:GetBattleEid()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerTransform = CommonUtils:SerializeFTransform(Player:GetTransform())
  PlayerData = {
    HpPercent = Player:GetAttr("HpPercent"),
    CurrentLevelId = {}
  }
  for _, LevelId in pairs(Player.CurrentLevelId) do
    table.insert(PlayerData.CurrentLevelId, LevelId)
  end
  local BattleAchievementData = {}
  if Player.BattleAchievement then
    local DelayedTargetValues = {}
    for k, v in pairs(Player.BattleAchievement.DelayedTargetValues) do
      DelayedTargetValues[k] = v
    end
    BattleAchievementData.DelayedTargetValues = DelayedTargetValues
    local TopProcessedValue = {}
    for k, v in pairs(Player.BattleAchievement.TopProcessedValue) do
      TopProcessedValue[k] = v
    end
    BattleAchievementData.TopProcessedValue = TopProcessedValue
  end
  local SubGameModeData = {}
  for LevelName, SubGameMode in pairs(self.LevelGameMode.SubGameModeInfo) do
    SubGameModeData[LevelName] = SubGameMode.GameModeFirstActiveEnable
  end
  local DungeonUIInfoData = {
    TexturePath = self.EMGameState.DungeonUIInfo.TexturePath,
    TextTitle = self.EMGameState.DungeonUIInfo.TextTitle,
    TextMap = self.EMGameState.DungeonUIInfo.TextMap
  }
  local DungeonEventData = {}
  for i = 1, self.EMGameState.DungeonEvent:Num() do
    local Event = self.EMGameState.DungeonEvent:GetValueByIdx(i - 1)
    if "ShowPetDefenseDynamicEvent" ~= Event and "ShowPetDefenseProgress" ~= Event then
      DungeonEventData[i] = Event
    end
  end
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local PlayerState = PlayerController.PlayerState
  local RecoveryCountInfo = {}
  RecoveryCountInfo.RecoveryCount = PlayerState.RecoveryCount
  RecoveryCountInfo.RecoveryMaxCount = PlayerState.RecoveryMaxCount
  if Player and Player:IsDead() and RecoveryCountInfo.RecoveryCount then
    RecoveryCountInfo.RecoveryCount = RecoveryCountInfo.RecoveryCount + 1
  end
  local ResData = {
    Eid = Eid,
    DungeonId = DungeonId,
    JsonName = JsonName,
    PlayerData = PlayerData,
    PlayerTransform = PlayerTransform,
    DungeonSnapShotData = DungeonSnapShotData,
    DungeonData = DungeonData,
    StaticCreatorData = StaticCreatorData,
    RandomCreatorData = RandomCreatorData,
    SubGameModeData = SubGameModeData,
    BattleAchievementData = BattleAchievementData,
    DungeonUIInfoData = DungeonUIInfoData,
    DungeonEventData = DungeonEventData,
    RecoveryCountInfo = RecoveryCountInfo
  }
  PrintTable(ResData, 6)
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  GWorld:GetAvatar():SaveProgressData(ResData)
end

function ProgressSnapShotComponent:RecoverProgressData()
  local ProgressData = self:GetProgressData()
  if not ProgressData then
    DebugPrint("ProgressSnapShotComponent       error  no data")
    return
  end
  DebugPrint("ProgressSnapShotComponent: RecoverProgressData")
  PrintTable(ProgressData, 6)
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  local PlayerHpPercent = ProgressData.PlayerData.HpPercent or 1.0
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetAttr("Hp", Player:GetAttr("MaxHp") * PlayerHpPercent)
  local PlayerCurrentLevelId = ProgressData.PlayerData.CurrentLevelId
  local LevelIdArray = TArray(FString)
  for _, LevelId in pairs(PlayerCurrentLevelId) do
    LevelIdArray:Add(LevelId)
  end
  Player:SetCurrentLevelId(LevelIdArray)
  if ProgressData.BattleAchievementData and Player.BattleAchievement then
    for k, v in pairs(ProgressData.BattleAchievementData.DelayedTargetValues) do
      Player.BattleAchievement.DelayedTargetValues:Add(k, v)
    end
    for k, v in pairs(ProgressData.BattleAchievementData.TopProcessedValue) do
      Player.BattleAchievement.TopProcessedValue:Add(k, v)
    end
  end
  for _, Data in pairs(ProgressData.StaticCreatorData) do
    local Creator = self.EMGameState:GetStaticCreatorInfo(Data.StaticCreatorId, Data.PrivateEnable, Data.LevelName)
    if Creator then
      if Data.ItemData then
        Creator:RealActiveStaticCreator({
          DungeonState = Data.ItemData
        })
      else
        Creator:RealActiveStaticCreator()
      end
    else
      DebugPrint("ProgressSnapShotComponent: \230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185,, StaticCreatorId", Data.StaticCreatorId, "PrivateEnable", Data.PrivateEnable, "LevelName", Data.LevelName)
    end
  end
  for i, RandomData in pairs(ProgressData.RandomCreatorData) do
    self.RandomActorManager:ProgressDataRecoverRandomActor(RandomData.RandomRuleId, RandomData.RandomLevelName, RandomData.RandomIdxInRule, RandomData.RandomTableId, RandomData.ItemData)
  end
  self:TriggerDungeonComponentFun("RecoverDungeonRoundData", ProgressData.DungeonData)
  self:SetDungeonSnapShotData(ProgressData.DungeonSnapShotData)
  for LevelName, FirstActiveEnable in pairs(ProgressData.SubGameModeData) do
    local SubGameMode = self.LevelGameMode.SubGameModeInfo:FindRef(LevelName)
    if SubGameMode then
      SubGameMode.GameModeFirstActiveEnable = FirstActiveEnable
    else
      DebugPrint("ProgressSnapShot \229\173\144GameMode\228\184\141\229\173\152\229\156\168\239\188\140LevelName\239\188\154", LevelName)
    end
  end
  self.EMGameState.DungeonUIInfo.TexturePath = ProgressData.DungeonUIInfoData.TexturePath
  self.EMGameState.DungeonUIInfo.TextTitle = ProgressData.DungeonUIInfoData.TextTitle
  self.EMGameState.DungeonUIInfo.TextMap = ProgressData.DungeonUIInfoData.TextMap
  self.EMGameState:MarkDungeonUIInfoAsDirtyData()
  for _, Event in pairs(ProgressData.DungeonEventData) do
    self:AddDungeonEvent(Event)
  end
  Player:SetRecoveryCount(ProgressData.RecoveryCountInfo.RecoveryCount)
  Player:SetRecoveryMaxCount(ProgressData.RecoveryCountInfo.RecoveryMaxCount)
end

function ProgressSnapShotComponent:OnProgressRecoverSucceed()
  self.Overridden.OnProgressRecoverSucceed(self)
end

function ProgressSnapShotComponent:RougeRecordProgressData(PassRoomExtraInfo)
  if self:IsAllRoomPassed() then
    DebugPrint("ProgressSnapShotComponent: \230\137\128\230\156\137\230\136\191\233\151\180\229\183\178\233\128\154\229\133\179\229\144\142\228\184\141\229\133\129\232\174\184\229\173\152\229\130\168")
    return
  end
  if self:IsDungeonInSettlement() then
    DebugPrint("ProgressSnapShotComponent: \229\137\175\230\156\172\229\183\178\231\187\147\231\174\151\229\144\142\228\184\141\229\133\129\232\174\184\229\173\152\229\130\168")
    return
  end
  local IsCurRoomClear = GWorld.RougeLikeManager:IsCurRougeLikeRoomClear()
  local IsInEvent = GWorld.RougeLikeManager.IsListeningDealRewardEvent or false
  DebugPrint("ProgressSnapShotComponent: RougeRecordProgressData \229\189\147\229\137\141\230\136\191\233\151\180\230\152\175\229\144\166\233\128\154\229\133\179\239\188\154", IsCurRoomClear, "\230\152\175\229\144\166\230\173\163\229\164\132\228\186\142\228\186\139\228\187\182\229\133\179\231\154\132\228\186\139\228\187\182\228\184\173", IsInEvent)
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local PlayerState = PlayerController.PlayerState
  local RecoveryCountInfo = {}
  RecoveryCountInfo.RecoveryCount = PlayerState.RecoveryCount
  RecoveryCountInfo.RecoveryMaxCount = PlayerState.RecoveryMaxCount
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player and Player:IsDead() and RecoveryCountInfo.RecoveryCount then
    RecoveryCountInfo.RecoveryCount = RecoveryCountInfo.RecoveryCount + 1
  end
  DebugPrint("Tianyi@ \229\188\128\229\167\139\230\154\130\229\173\152\232\130\137\233\184\189Buff")
  local BuffsSnapshot = {}
  local BuffManager = Player.BuffManager
  if BuffManager then
    BuffsSnapshot = BuffManager:GetBuffsSnapshot()
    PrintTable(BuffsSnapshot, 6, "BuffsSnapshot", true)
  end
  local StaticCreatorData = {}
  for _, CombatItem in pairs(self.EMGameState.CombatItemMap) do
    if IsValid(CombatItem) and 0 ~= CombatItem.CreatorId and 112 ~= CombatItem.UnitId then
      local TmpData = {
        StaticCreatorId = CombatItem.CreatorId,
        ItemData = CombatItem:GetDungeonSaveData() or {},
        PrivateEnable = CombatItem.PrivateEnable,
        LevelName = self:GetActorLevelName(CombatItem)
      }
      table.insert(StaticCreatorData, TmpData)
    end
  end
  for _, NPC in pairs(self.EMGameState.NpcMap) do
    if IsValid(NPC) and NPC.CreatorId then
      local TmpData = {
        StaticCreatorId = NPC.CreatorId,
        PrivateEnable = NPC.PrivateEnable,
        LevelName = self:GetActorLevelName(NPC)
      }
      table.insert(StaticCreatorData, TmpData)
    end
  end
  local ShopInfo = GWorld.RougeLikeManager.StaticCreatorIdToShopId
  local BattleProgressNums = {}
  BattleProgressNums.Count = self.EMGameState.RougeBattleCount
  BattleProgressNums.MaxNum = self.EMGameState.RougeBattleMaxNum
  local DataSetObj = GWorld.RougeLikeManager:GetOrAddDataSetObject()
  local DataSetObjInfo = {}
  local ExtraInt = DataSetObj.ExtraInt:ToTable()
  DataSetObjInfo.SetInt = ExtraInt
  local ExtraBool = DataSetObj.ExtraBool:ToTable()
  DataSetObjInfo.SetBool = ExtraBool
  local ExtraFloat = DataSetObj.ExtraFloat:ToTable()
  DataSetObjInfo.SetFloat = ExtraFloat
  local ExtraVector = DataSetObj.ExtraVector:ToTable()
  DataSetObjInfo.SetVector = ExtraVector
  local SaveLocations = DataSetObj.SaveLocations:ToTable()
  DataSetObjInfo.SaveLoc = SaveLocations
  local ExtraString = DataSetObj.ExtraString:ToTable()
  DataSetObjInfo.SetString = ExtraString
  local TreasureMonInfo = {}
  TreasureMonInfo.TreasureMonProb = self.TreasureMonsterSpawnProbability
  TreasureMonInfo.TreasureMonCreatedNum = self.TreasureMonsterCreatedNum
  local DungeonUIInfoData = {}
  if self.EMGameState.DungeonUIInfo.TextMap ~= "" then
    DungeonUIInfoData = {
      TexturePath = self.EMGameState.DungeonUIInfo.TexturePath,
      TextTitle = self.EMGameState.DungeonUIInfo.TextTitle,
      TextMap = self.EMGameState.DungeonUIInfo.TextMap,
      RougeLikeSubTaskText = self.RougeLikeSubTaskText
    }
  end
  local IsSimpleDesc = GWorld.RougeLikeManager.IsSimpleDesc
  local IsListeningDealRewardEvent = GWorld.RougeLikeManager.IsListeningDealRewardEvent
  local ResData = {
    IsRougeLike = true,
    DungeonId = self.DungeonId,
    PassRoomExtraInfo = PassRoomExtraInfo,
    RecoveryCountInfo = RecoveryCountInfo,
    StaticCreatorData = StaticCreatorData,
    BattleProgressNums = BattleProgressNums,
    ShopInfo = ShopInfo,
    BuffsSnapshot = BuffsSnapshot,
    DataSetObjInfo = DataSetObjInfo,
    TreasureMonInfo = TreasureMonInfo,
    DungeonUIInfoData = DungeonUIInfoData,
    IsSimpleDesc = IsSimpleDesc,
    IsListeningDealRewardEvent = IsListeningDealRewardEvent
  }
  PrintTable(ResData, 6, "ResData")
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  GWorld:GetAvatar():SaveProgressData(ResData)
end

function ProgressSnapShotComponent:RougeRecoverProgressData()
  local ProgressData = self:GetProgressData()
  if not ProgressData then
    DebugPrint("ProgressSnapShotComponent       error  no data")
    return
  end
  local IsCurRoomClear = GWorld.RougeLikeManager:IsCurRougeLikeRoomClear()
  local IsInEvent = ProgressData.IsListeningDealRewardEvent or false
  DebugPrint("ProgressSnapShotComponent: RougeRecoverProgressData \229\189\147\229\137\141\230\136\191\233\151\180\230\152\175\229\144\166\233\128\154\229\133\179\239\188\154", IsCurRoomClear, "\230\152\175\229\144\166\230\173\163\229\164\132\228\186\142\228\186\139\228\187\182\229\133\179\231\154\132\228\186\139\228\187\182\228\184\173", IsInEvent)
  PrintTable(ProgressData, 6)
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerState = PlayerController.PlayerState
  PlayerState:SetRecoveryCount(ProgressData.RecoveryCountInfo.RecoveryCount)
  PlayerState:SetRecoveryMaxCount(ProgressData.RecoveryCountInfo.RecoveryMaxCount)
  local BuffsSnapshot = ProgressData.BuffsSnapshot
  local RecoveredBuffsNum = 0
  DebugPrint("Tianyi@ \229\188\128\229\167\139\230\129\162\229\164\141Buff")
  for _, BuffSnapshot in ipairs(BuffsSnapshot) do
    local BuffId = BuffSnapshot.BuffId
    local BuffConfig = DataMgr.Buff[BuffId]
    if not BuffConfig then
      DebugPrint("Tianyi@ Buff\230\129\162\229\164\141\229\164\177\232\180\165, \229\173\152\229\156\168\233\157\158\230\179\149BuffId: ", BuffId)
    else
      local MergeRule2 = BuffConfig.MergeRule2
      if "Merge" == MergeRule2 then
        local LastTime = BuffSnapshot.bForever and -1 or BuffSnapshot.LastTime
        local AddedBuffs = Battle(self):AddBuffToTarget(Player, Player, BuffId, LastTime, BuffSnapshot.Value, Player, BuffSnapshot.Layer)
        if AddedBuffs:Num() > 0 then
          RecoveredBuffsNum = RecoveredBuffsNum + 1
        end
      elseif "NewFree" == MergeRule2 then
        local AddedBuffs
        for i = 1, #BuffSnapshot.FreeLayerInfos do
          local FreeLayerInfo = BuffSnapshot.FreeLayerInfos[i]
          if 1 == i then
            local LastTime = FreeLayerInfo.bForever and -1 or FreeLayerInfo.LastTime
            AddedBuffs = Battle(self):AddBuffToTarget(Player, Player, BuffId, LastTime, FreeLayerInfo.Value, Player, 1)
            if AddedBuffs:Num() > 0 then
              RecoveredBuffsNum = RecoveredBuffsNum + 1
            end
          elseif AddedBuffs then
            local AddedBuff = AddedBuffs:GetRef(1)
            if AddedBuff then
              Battle(self):IncreaseBuffLayerFromTarget(AddedBuff, Player, FreeLayerInfo.LastTime, FreeLayerInfo.Value, Player:GetSkillLevelInfo(), 1, false)
            end
          else
            DebugPrint("Tianyi@ AddedBuffs is nil")
          end
        end
      end
    end
  end
  if #BuffsSnapshot > 0 then
    Player:RefreshBuff()
    if RecoveredBuffsNum == #BuffsSnapshot then
      DebugPrint("Tianyi@ Buff\230\129\162\229\164\141\230\136\144\229\138\159")
    else
      DebugPrint("Tianyi@ Buff\230\129\162\229\164\141\229\164\177\232\180\165, \230\129\162\229\164\141\228\186\134" .. tostring(RecoveredBuffsNum) .. "\228\184\170Buff, \228\189\134\230\128\187\229\133\177\230\156\137" .. tostring(#BuffsSnapshot) .. "\228\184\170Buff")
    end
  end
  local DataSetObjInfo = ProgressData.DataSetObjInfo
  local DataSetObj = GWorld.RougeLikeManager:GetOrAddDataSetObject()
  if ProgressData.TreasureMonInfo then
    self.TreasureMonsterCreatedNum = ProgressData.TreasureMonInfo.TreasureMonCreatedNum
    self.TreasureMonsterSpawnProbability = ProgressData.TreasureMonInfo.TreasureMonProb
  end
  local PlayerSliceData = self:GetPlayerSliceData()
  local Length = PlayerSliceData:Length()
  local TypeExist = {}
  local BlueprintValueKeyExist = {}
  for i = Length, 1, -1 do
    local SerializedPlayerSliceData = SerializeUtils:UnSerialize(PlayerSliceData[i])
    local Type = SerializedPlayerSliceData.Type
    local Value = SerializedPlayerSliceData.Value
    if TypeExist[Type] then
    else
      DebugPrint("Tianyi@ Reocver Player State, Type = " .. tostring(Type) .. " Value = ")
      PrintTable(Value, 10)
      if Type == Const.RougeSliceInfoType.RecoverCount then
        Player:SetRecoveryCount(Value.RecoveryCount)
        TypeExist[Type] = true
      elseif Type == Const.RougeSliceInfoType.TreasureMonCount then
        self.TreasureMonsterCreatedNum = Value.TreasureMonCount
        DebugPrint("RougeLike Recover, TreasureMonsterCreatedNum =", self.TreasureMonsterCreatedNum)
        TypeExist[Type] = true
      elseif Type == Const.RougeSliceInfoType.BlueprintValue and not BlueprintValueKeyExist[Value.Key] then
        local DataType = Value.DataType
        local DataValue = Value.DataValue
        DataSetObjInfo[DataType] = DataSetObjInfo[DataType] or {}
        DataSetObjInfo[DataType][Value.Key] = DataValue
        BlueprintValueKeyExist[Value.Key] = true
      end
    end
  end
  UE4.UGameplayStatics.GetGameInstance(self):ClearPlayerSliceData()
  for FuncName, MapName in pairs(DataSetObjInfo) do
    for key, value in pairs(MapName) do
      DataSetObj[FuncName](DataSetObj, key, value)
      DebugPrint("Tianyi@ \230\129\162\229\164\141\228\186\134\232\147\157\229\155\190\230\149\176\230\141\174: ", key, value)
    end
  end
  Battle(self):TriggerBattleEvent(BattleEventName.RougeParamRecover, Player, GWorld.RougeLikeManager)
  if IsInEvent or IsCurRoomClear then
    local StaticCreatorData = ProgressData.StaticCreatorData
    if StaticCreatorData then
      for _, Data in pairs(StaticCreatorData) do
        local Creator = self.EMGameState:GetStaticCreatorInfo(Data.StaticCreatorId, Data.PrivateEnable, Data.LevelName)
        if Creator then
          if Data.ItemData then
            Creator:RealActiveStaticCreator({
              DungeonState = Data.ItemData
            })
          else
            Creator:RealActiveStaticCreator()
          end
        else
          DebugPrint("\230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185,, StaticCreatorId", Data.StaticCreatorId, "PrivateEnable", Data.PrivateEnable, "LevelName", Data.LevelName)
        end
      end
    end
    local ShopInfo = ProgressData.ShopInfo
    if ShopInfo then
      GWorld.RougeLikeManager.StaticCreatorIdToShopId = ShopInfo
    end
  end
  if IsInEvent or IsCurRoomClear then
    for LevelName, SubGameMode in pairs(self.LevelGameMode.SubGameModeInfo) do
      SubGameMode.GameModeFirstActiveEnable = false
      DebugPrint("ProgressSnapShotComponent: SubGameMode", LevelName, SubGameMode:GetName(), "\229\133\179\233\151\173OnFirstActive")
    end
  end
  if (IsInEvent or IsCurRoomClear) and ProgressData.DungeonUIInfoData.TextMap and ProgressData.DungeonUIInfoData.TextMap ~= "" then
    local TexturePath = ProgressData.DungeonUIInfoData.TexturePath
    local TextTitle = ProgressData.DungeonUIInfoData.TextTitle
    local TextMap = ProgressData.DungeonUIInfoData.TextMap
    self:NotifyClientShowDungeonTask("", TexturePath, TextTitle, TextMap)
    local RougeLikeSubTaskText = ProgressData.DungeonUIInfoData.RougeLikeSubTaskText
    if RougeLikeSubTaskText then
      self:InitRougeLikeSubTask(RougeLikeSubTaskText)
    end
  end
  if IsCurRoomClear then
    local BattleProgressNums = ProgressData.BattleProgressNums
    if BattleProgressNums then
      self.EMGameState:SetRougeBattleNums(BattleProgressNums.Count, BattleProgressNums.MaxNum)
    end
  end
  GWorld.RougeLikeManager.IsSimpleDesc = ProgressData.IsSimpleDesc
  if ProgressData.IsListeningDealRewardEvent and not IsCurRoomClear then
    GWorld.RougeLikeManager:ListenDealRewardEvent()
    if GWorld.RougeLikeManager.EventId <= 0 and GWorld.RougeLikeManager.RandomBlessings:Num() <= 0 and GWorld.RougeLikeManager.RandomTreasures:Num() <= 0 then
      EventManager:FireEvent(EventID.OnRougeDealEventReward)
    end
  end
  if IsCurRoomClear then
    local RecoveryFlag = true
    GWorld.RougeLikeManager:OnPassRoom(RecoveryFlag)
  end
  local CurrentEventId = GWorld.RougeLikeManager.EventId
  DebugPrint("ProgressSnapShotComponent \229\189\147\229\137\141\228\186\139\228\187\182ID\228\184\186\239\188\154", CurrentEventId)
  if CurrentEventId > 0 then
    local GameModeEvent = DataMgr.RougeLikeEventSelect[CurrentEventId].GameModeEvent
    if GameModeEvent then
      DebugPrint("ProgressSnapShotComponent: \230\129\162\229\164\141\232\167\166\229\143\145\228\186\139\228\187\182\229\133\179\228\186\139\228\187\182", GameModeEvent)
      self:PostCustomEvent(GameModeEvent)
    end
  end
  if ProgressData.PassRoomExtraInfo.IsRougeFinished and 0 ~= GWorld.RougeLikeManager.StoryId then
    DebugPrint("ProgressSnapShotComponent: \230\129\162\229\164\141\232\167\166\229\143\145\233\128\154\229\133\179Story", GWorld.RougeLikeManager.StoryId, "\230\152\175\229\144\166\233\128\154\229\133\179:", ProgressData.PassRoomExtraInfo.IsWin)
    self:ShowFinishRougeStory(ProgressData.PassRoomExtraInfo.IsWin)
  end
end

function ProgressSnapShotComponent:AbyssRecordProgressData(AbyssInfo)
  DebugPrint("ProgressSnapShotComponent: AbyssRecordProgressData")
  local JsonName = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerTransform = CommonUtils:SerializeFTransform(Player:GetTransform())
  local ResData = {
    IsAbyss = true,
    DungeonId = self.DungeonId,
    AbyssLogicServerInfo = self:GetDungeonComponent().AbyssLogicServerInfo,
    JsonName = JsonName,
    PlayerTransform = PlayerTransform,
    LastLevelId = AbyssInfo.LastLevelId,
    NewLevelId = AbyssInfo.NewLevelId,
    AbyssRoomIndex = self:TriggerDungeonComponentFun("GetAbyssRoomIndex"),
    PreAbyssLevelProgress = GWorld.GameInstance.PreAbyssLevelProgress
  }
  PrintTable(ResData, 6)
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  GWorld:GetAvatar():SaveProgressData(ResData)
end

function ProgressSnapShotComponent:AbyssRecoverProgressData()
  local ProgressData = self:GetProgressData()
  if not ProgressData then
    DebugPrint("ProgressSnapShotComponent    Abyss   error  no data")
    return
  end
  DebugPrint("ProgressSnapShotComponent: AbyssRecoverProgressData")
  PrintTable(ProgressData, 6)
  UE4.UGameplayStatics.GetGameInstance(self):ClearProgressData()
  self:TriggerDungeonComponentFun("InitGlobalPassive")
  self:GetDungeonComponent().AbyssRoomIndex = ProgressData.AbyssRoomIndex
  self:TriggerDungeonComponentFun("TriggerStartNextRoom", ProgressData.LastLevelId, ProgressData.NewLevelId)
  GWorld.GameInstance.PreAbyssLevelProgress = ProgressData.PreAbyssLevelProgress
end

function ProgressSnapShotComponent:GetProgressDataAbyssLogicServerInfo()
  local ProgressData = self:GetProgressData()
  if ProgressData then
    return ProgressData.AbyssLogicServerInfo
  end
  return nil
end

return ProgressSnapShotComponent
