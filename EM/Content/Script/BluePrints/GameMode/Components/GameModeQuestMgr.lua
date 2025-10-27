require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local GameModeQuestMgr = Class()

function GameModeQuestMgr:InitRegionSuit(Avatar, RegionId)
  local SuitTypeFuncTable = {}
  SuitTypeFuncTable[CommonConst.SuitType.GameModeSuit] = self.GameModeSuitRecover
  SuitTypeFuncTable[CommonConst.SuitType.PlayerCharacterSuit] = self.PlayerCharacterSuitRecover
  for _, SuitType in pairs(CommonConst.SuitType) do
    local SuitTypeData = Avatar.Suits:GetSuitBase(SuitType)
    if SuitTypeFuncTable[SuitType] then
      SuitTypeFuncTable[SuitType](self, SuitType, SuitTypeData)
    end
  end
end

function GameModeQuestMgr:GameModeSuitRecover(SuitType, GameModeSuit)
  if not GameModeSuit then
    return
  end
  local GameModeSuitTypeFuncTable = {}
  GameModeSuitTypeFuncTable[CommonConst.GameModeSuit.DropRule] = self.DropRuleSuitRecover
  for _, SuitSubType in pairs(CommonConst.GameModeSuit) do
    local SuitSubBase = GameModeSuit:GetSubSuitBase(SuitSubType)
    if GameModeSuitTypeFuncTable[SuitSubType] then
      GameModeSuitTypeFuncTable[SuitSubType](self, SuitSubType, SuitSubBase)
    end
  end
end

function GameModeQuestMgr:PlayerCharacterSuitRecover(SuitType, PlayerCharacterSuit)
  if not PlayerCharacterSuit then
    return
  end
  local PlayerSuitTypeFuncTable = {}
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.DisableSkill] = self.DisableSkillSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.SwitchStoryMode] = self.SwitchStoryModeSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.HideUIInScreen] = self.HideUIInScreenSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.MonsterFirstSeenGuide] = self.MonsterFirstSeenGuideSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.BGM] = self.BGMSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.ContinuedGuide] = self.ContinuedGuideSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.NpcHideShowTag] = self.NpcHideShowTagSuitRecover
  PlayerSuitTypeFuncTable[CommonConst.PlayerCharacterSuit.BGMParams] = self.BGMParamsSuitRecover
  for _, SuitSubType in pairs(CommonConst.PlayerCharacterSuit) do
    local SuitSubBase = PlayerCharacterSuit:GetSubSuitBase(SuitSubType)
    if PlayerSuitTypeFuncTable[SuitSubType] then
      PlayerSuitTypeFuncTable[SuitSubType](self, SuitSubType, SuitSubBase)
    end
  end
end

function GameModeQuestMgr:BGMParamsSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for _, SuitValue in pairs(SuitSubBase) do
    AudioManager(Player):SetCondition(SuitValue, true)
  end
end

function GameModeQuestMgr:NpcHideShowTagSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    GameMode.GameState:HideCustomNpcsByAtmosphereTag(SuitValue, SuitKey)
  end
end

function GameModeQuestMgr:DropRuleSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    self.LevelGameMode.DropRule[tonumber(SuitKey)] = SuitValue
  end
end

function GameModeQuestMgr:ContinuedGuideSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    self:SetContinuedPCGuideVisibility(SuitKey, SuitValue)
  end
end

function GameModeQuestMgr:DisableSkillSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  local InActiveSkills = TArray(0)
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    if SuitValue then
      local SkillId = UE4.ESkillName[SuitKey]
      InActiveSkills:Add(SkillId)
    end
  end
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local PlayerController = Controller:Cast(UE4.ASinglePlayerController)
  PlayerController:InActiveSkills(InActiveSkills, "Lock")
end

function GameModeQuestMgr:DisableWeaponSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    local WeaponTags = {SuitKey}
    local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
    Controller:SetAndForbidWeaponByWeaponTag(WeaponTags, SuitValue.bForbid, SuitValue.ForbidTag, SuitValue.bHideWhenForbid)
  end
end

function GameModeQuestMgr:SwitchStoryModeSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    PlayerController:SetStoryModeState(SuitValue)
  end
end

function GameModeQuestMgr:HideUIInScreenSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase) do
    self:HideUIInScreen(SuitKey, SuitValue)
  end
end

function GameModeQuestMgr:BGMSuitRecover(SuitType, SuitSubBase)
  if not SuitSubBase or SuitSubBase:IsEmpty() then
    return
  end
  for SuitKey, SuitValue in pairs(SuitSubBase:all_dump(SuitSubBase)) do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local Event = AudioManager(Player):GetFMODEventByPath_Sync(SuitValue.BgmPath)
    DebugPrint("BGMSuitRecover", SuitKey, SuitValue.BgmPath, SuitValue.BgmSubRegionId)
    PrintTable(SuitValue.BgmSubRegionId, 3)
    AudioManager(Player):PlayLevelSound(tonumber(SuitKey), Event, SuitValue.BgmSubRegionId, {}, SuitValue.BgmParam, SuitValue.BgmParamValue, false, true)
  end
end

function GameModeQuestMgr:MonsterFirstSeenGuideSuitRecover(SuitType, Enable)
  if not Enable or Enable:IsEmpty() then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    for SuitKey, SuitValue in pairs(Enable) do
      GameState.MonsterFirstSeenEnabled = SuitValue
    end
  end
end

function GameModeQuestMgr:RecoverDataByQuestChainId(QuestChainId, QuestId)
  if not QuestChainId then
    return
  end
  local RegionDataMgr = self:GetRegionDataMgrSubSystem()
  if not RegionDataMgr then
    return
  end
  DebugPrint("RecoverDataByQuestChainId: \228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\229\164\177\232\180\165\239\188\140\229\188\128\229\167\139\229\155\158\233\128\128 ")
  local DelCount = 0
  local DelDataCount = 0
  local DelWorldRegionEid = {}
  for _, Obj in pairs(self.EMGameState.MonsterMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId == QuestChainId then
      DelCount = DelCount + 1
      table.insert(DelWorldRegionEid, Obj.WorldRegionEid)
      if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
        Obj:EMActorDestroy(EDestroyReason.LevelUnloadedSaveGame)
      else
        Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
      end
    end
  end
  for _, Obj in pairs(self.EMGameState.NpcMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId == QuestChainId then
      DelCount = DelCount + 1
      table.insert(DelWorldRegionEid, Obj.WorldRegionEid)
      if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
        Obj:EMActorDestroy(EDestroyReason.LevelUnloadedSaveGame)
      else
        Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
      end
    end
  end
  for _, Obj in pairs(self.EMGameState.CombatItemMap) do
    if IsValid(Obj) and (Obj.QuestChainId == QuestChainId or QuestId and Obj.QuestId == QuestId) then
      DelCount = DelCount + 1
      table.insert(DelWorldRegionEid, Obj.WorldRegionEid)
      if not Obj.BpBorn then
        if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
          RegionDataMgr:RecoverRegionActorDataStateValue(Obj.WorldRegionEid)
          Obj:EMActorDestroy(EDestroyReason.LevelUnloadedSaveGame)
        else
          Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
        end
      else
        RegionDataMgr:RecoverRegionActorDataStateValue(Obj.WorldRegionEid)
        Obj:RecoverBpBornData()
      end
    end
  end
  RegionDataMgr:DeleteQuestChainDataNotInClientCache(QuestChainId)
  local TotalCount = DelDataCount + DelCount
  self:TriggerLoadedEvent(true)
end

function GameModeQuestMgr:RecoverDataAndStopBySpecialQuest(QuestChainId, SpecialQuestId)
  if not QuestChainId then
    return
  end
  local RegionDataMgr = self:GetRegionDataMgrSubSystem()
  if not RegionDataMgr then
    return
  end
  DebugPrint("RecoverDataAndStopBySpecialQuest: \228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\231\137\185\230\174\138\228\187\187\229\138\161:\227\128\144" .. tostring(SpecialQuestId) .. "\227\128\145\228\184\173\230\150\173\229\133\182\228\187\150\228\187\187\229\138\161\230\184\133\231\144\134\230\149\176\230\141\174 ")
  for _, Obj in pairs(self.EMGameState.MonsterMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId > 0 and Obj.QuestChainId ~= QuestChainId then
      if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
        Obj:EMActorDestroy(EDestroyReason.SepcialQuestStart)
      else
        Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
      end
    end
  end
  for _, Obj in pairs(self.EMGameState.NpcMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId > 0 and Obj.QuestChainId ~= QuestChainId then
      if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
        Obj:EMActorDestroy(EDestroyReason.SepcialQuestStart)
      else
        Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
      end
    end
  end
  for _, Obj in pairs(self.EMGameState.CombatItemMap) do
    if IsValid(Obj) and Obj.QuestChainId > 0 and Obj.QuestChainId ~= QuestChainId then
      if not Obj.BpBorn then
        if RegionDataMgr:ClientCacheExist(Obj.WorldRegionEid) then
          RegionDataMgr:RecoverRegionActorDataStateValue(Obj.WorldRegionEid)
          Obj:EMActorDestroy(EDestroyReason.SepcialQuestStart)
        else
          Obj:EMActorDestroy(EDestroyReason.QuestChainClear)
        end
      else
        RegionDataMgr:RecoverRegionActorDataStateValue(Obj.WorldRegionEid)
        Obj:RecoverBpBornData()
      end
    end
  end
  RegionDataMgr:DeleteExceptQuestChainDataNotInClientCache(QuestChainId)
end

function GameModeQuestMgr:UpdateQuestRegionDatas(QuestChainId, RegionUpdataData)
  DebugPrint("\228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\155\180\230\150\176\230\149\176\230\141\174\233\135\143:" .. tostring(#RegionUpdataData))
  local QuestRegionDatas = self:GetRegionDataMgrSubSystem().DataLibrary:GetRegionCacheDatasByIdType(ERegionDataType.RDT_QuestData)
  for _, RegionData in pairs(QuestRegionDatas) do
    for _, LevelData in pairs(RegionData) do
      for _, WorldRegionEid in pairs(CommonUtils.Keys(LevelData)) do
        local UnitRegionData = LevelData[WorldRegionEid]
        if UnitRegionData.QuestChainId == QuestChainId then
          self:GetRegionDataMgrSubSystem().DataLibrary:RemoveUnitRegionCacheData(WorldRegionEid)
          DebugPrint("\228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\229\136\160\233\153\164\228\186\134:" .. tostring(UnitRegionData.WorldRegionEid))
        end
      end
    end
  end
  for _, UnitRegionData in ipairs(RegionUpdataData) do
    self:GetRegionDataMgrSubSystem().DataLibrary:AddUnitRegionCacheData(UnitRegionData)
    DebugPrint("\228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\183\187\229\138\160\228\186\134:" .. tostring(UnitRegionData.WorldRegionEid))
  end
end

function GameModeQuestMgr:GetRegionQuestChainUpdateData(QuestChainId)
  if URuntimeCommonFunctionLibrary.UseCppRegionData(GWorld.GameInstance) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    return GameMode:GetRegionDataMgrSubSystem():GetQuestChainData(QuestChainId)
  end
  if not QuestChainId then
    return {}
  end
  local RegionUpdataData = {}
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  for _, Obj in pairs(GameState.MonsterMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId == QuestChainId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  for _, Obj in pairs(GameState.NpcMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestChainId == QuestChainId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  for _, Obj in pairs(GameState.CombatItemMap) do
    if IsValid(Obj) and Obj.QuestChainId == QuestChainId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  local RegionSSDatas = self:GetRegionDataMgrSubSystem().DataLibrary:GetRegionSSDatas()
  if nil ~= RegionSSDatas then
    for _, LevelData in pairs(RegionSSDatas) do
      for _, UnitRegionData in pairs(LevelData) do
        if UnitRegionData.QuestChainId == QuestChainId then
          if UnitRegionData.RegionDataType ~= ERegionDataType.RDT_QuestData then
            ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:WorldRegionEid:\227\128\144" .. tostring(UnitRegionData.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(UnitRegionData.RegionDataType) .. "\227\128\145")
          end
          table.insert(RegionUpdataData, CommonUtils.DeepCopy(UnitRegionData))
        end
      end
    end
  end
  return RegionUpdataData
end

function GameModeQuestMgr:GetRegionQuestCommonUpdateData(QuestId)
  if not QuestId then
    return {}
  end
  local RegionUpdataData = {}
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  for _, Obj in pairs(GameState.MonsterMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestId == QuestId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestCommonData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\227\128\144" .. tostring(QuestId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  for _, Obj in pairs(GameState.NpcMap) do
    if IsValid(Obj) and not Obj:IsDead() and Obj.QuestId == QuestId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestCommonData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\227\128\144" .. tostring(QuestId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  for _, Obj in pairs(GameState.CombatItemMap) do
    if IsValid(Obj) and Obj.QuestId == QuestId then
      if Obj.RegionDataType ~= ERegionDataType.RDT_QuestCommonData then
        ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\227\128\144" .. tostring(QuestId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:Name\239\188\154" .. Obj:GetName() .. "\239\188\140WorldRegionEid:\227\128\144" .. tostring(Obj.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(Obj.RegionDataType) .. "\227\128\145")
      end
      table.insert(RegionUpdataData, self:GetRegionDataMgrSubSystem().DataLibrary:ConstructUnitRegionDataByUnit(Obj))
    end
  end
  local RegionSSDatas = self:GetRegionDataMgrSubSystem().DataLibrary:GetRegionSSDatas()
  if nil ~= RegionSSDatas then
    for _, LevelData in pairs(RegionSSDatas) do
      for _, UnitRegionData in pairs(LevelData) do
        if UnitRegionData.QuestId == QuestId then
          if UnitRegionData.RegionDataType ~= ERegionDataType.RDT_QuestCommonData then
            ScreenPrint("\228\187\187\229\138\161\230\136\144\229\138\159\239\188\154\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestId) .. "\227\128\145\230\149\176\230\141\174\233\135\140\229\140\133\229\144\171\233\157\158\228\187\187\229\138\161\230\149\176\230\141\174:WorldRegionEid:\227\128\144" .. tostring(UnitRegionData.WorldRegionEid) .. "\227\128\145,RegionDataType:\227\128\144" .. tostring(UnitRegionData.RegionDataType) .. "\227\128\145")
          end
          table.insert(RegionUpdataData, CommonUtils.DeepCopy(UnitRegionData))
        end
      end
    end
  end
  return RegionUpdataData
end

function GameModeQuestMgr:HandleQuestChainFinish(QuestChainId)
  if not QuestChainId then
    return
  end
  self:ClearRegionActorData("QuestChainId", QuestChainId, EDestroyReason.QuestChainClear, function(Target, Key, Value)
    return Target.QuestChainId == Value
  end)
  self:UpdateQuestRegionDatas(QuestChainId, {})
  local QuestRegionDatas = self:GetRegionDataMgrSubSystem().DataLibrary:GetRegionCacheDatasByIdType(ERegionDataType.RDT_QuestData)
  for _, RegionData in pairs(QuestRegionDatas) do
    for _, LevelData in pairs(RegionData) do
      for _, WorldRegionEid in pairs(CommonUtils.Keys(LevelData)) do
        local UnitRegionData = LevelData[WorldRegionEid]
        if UnitRegionData.QuestChainId == QuestChainId then
          GWorld.logger.error("@wangpengshu \228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\229\174\140\230\136\144\228\186\134\239\188\140\228\189\134\230\152\175\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\228\184\173\228\187\141\230\156\137\232\175\165\228\187\187\229\138\161\233\147\190\231\154\132\230\149\176\230\141\174\230\174\139\231\149\153:" .. tostring(UnitRegionData.WorldRegionEid))
        end
      end
    end
  end
  local RegionUpdateDatas = self:GetRegionQuestChainUpdateData(QuestChainId)
  if RegionUpdateDatas then
    for _, UnitRegionData in ipairs(RegionUpdateDatas) do
      GWorld.logger.error("@wangpengshu \228\187\187\229\138\161\233\147\190:\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\229\174\140\230\136\144\228\186\134\239\188\140\228\189\134\230\152\175\229\156\186\230\153\175\228\184\173\228\187\141\230\156\137\232\175\165\228\187\187\229\138\161\233\147\190\231\154\132\230\149\176\230\141\174\230\174\139\231\149\153:" .. tostring(UnitRegionData.WorldRegionEid))
    end
  end
end

function GameModeQuestMgr:ClearRegionActorData(Key, Value, DestroyReason, FilterFunction)
  GWorld.logger.info("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145,DestoryReanon = " .. tostring(DestroyReason))
  if not (Key and Value) or not DestroyReason then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    GWorld.logger.error("ClearRegionActorData Avatar Is nil !!!!!!!!!!!")
    return
  end
  self:ClearRegionData_DestroyActor(Key, Value, DestroyReason, FilterFunction)
  local RegionDataMgr = self:GetRegionDataMgrSubSystem()
  local RegionSSDatas = RegionDataMgr.DataLibrary:GetRegionSSDatas()
  for LevelName, LevelData in pairs(RegionSSDatas or {}) do
    for WorldRegionEid, UnitRegionData in pairs(LevelData) do
      if FilterFunction(UnitRegionData, Key, Value) then
        GWorld.logger.debug("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145\233\148\128\230\175\129 SSData WorldRegionEid = " .. tostring(WorldRegionEid))
        RegionDataMgr.DataLibrary:RemoveRegionSSDatas(LevelName, WorldRegionEid)
      end
    end
  end
  if "DynamicQuestId" == Key then
    RegionDataMgr:RemoveDynamicQuestData(Value, DestroyReason)
  elseif "SpecialQuestId" == Key then
    RegionDataMgr:RemoveSpecialQuestData(Value, DestroyReason)
  else
    RegionDataMgr:RemoveQuestChainData(Value, DestroyReason)
  end
  GWorld.logger.info("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145\229\174\140\230\136\144\228\186\134ClearRegionActorData\230\136\144\229\138\159")
end

function GameModeQuestMgr:ClearRegionData_DestroyActor(Key, Value, DestroyReason, FilterFunction)
  if not (Key and Value) or not DestroyReason then
    return
  end
  for _, Monster in pairs(self.GameState.MonsterMap) do
    if IsValid(Monster) and (not Monster:IsDead() or Monster:IsMonWaitForCaught()) and FilterFunction(Monster, Key, Value) then
      GWorld.logger.debug("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145\233\148\128\230\175\129 Monster Eid = " .. tostring(Monster.Eid))
      Monster:EMActorDestroy(DestroyReason)
    end
  end
  for _, Monster in pairs(self.GameState.NpcMap) do
    if IsValid(Monster) and not Monster:IsDead() and FilterFunction(Monster, Key, Value) then
      GWorld.logger.debug("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145\233\148\128\230\175\129 Npc Eid = " .. tostring(Monster.Eid))
      Monster:EMActorDestroy(DestroyReason)
    end
  end
  for _, CombatItem in pairs(self.GameState.CombatItemMap) do
    if IsValid(CombatItem) and FilterFunction(CombatItem, Key, Value) then
      GWorld.logger.debug("ClearRegionActorData:\227\128\144" .. tostring(Key) .. "\227\128\145:\227\128\144" .. tostring(Value) .. "\227\128\145\233\148\128\230\175\129 CombatItem Eid = " .. tostring(CombatItem.Eid))
      CombatItem:EMActorDestroy(DestroyReason)
    end
  end
end

function GameModeQuestMgr:TriggerQuestArtLevelChange(Params)
  if nil == Params or nil == next(Params) then
    return
  end
  if self:IsInDungeon() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local SubRegionId = Avatar:GetCurrentRegionId()
  local SubRegionData = DataMgr.SubRegion[SubRegionId]
  if not SubRegionData then
    return
  end
  local RegionId = SubRegionData.RegionId
  for VarName, Param in pairs(Params) do
    if nil == Param or nil == next(Param) then
      local ct = {
        "\230\138\165\233\148\153\230\150\135\230\156\172:\n\t",
        "VarName:",
        VarName,
        "\n"
      }
      local FinalMsg = table.concat(ct)
      Avatar:SendToFeiShuForRegionMgr(FinalMsg, "\228\187\187\229\138\161\232\167\166\229\143\145Level\229\138\160\229\141\184\232\189\189 | \228\188\160\233\128\146\230\149\176\230\141\174Value\228\184\186\231\169\186")
      return
    end
    if Param.OldValue == Param.NewValue then
      local ct = {
        "\230\138\165\233\148\153\230\150\135\230\156\172:\n\t",
        "TriggerQuestArtLevelChange:\228\187\187\229\138\161\232\167\166\229\143\145VarName\230\148\185\229\143\152\229\128\188\231\155\184\229\144\140!  \232\175\183\230\163\128\230\159\165\233\133\141\231\189\174!   VarName::",
        VarName,
        "\n"
      }
      local FinalMsg = table.concat(ct)
      Avatar:SendToFeiShuForRegionMgr(FinalMsg, "\228\187\187\229\138\161\232\167\166\229\143\145Level\229\138\160\229\141\184\232\189\189 | \228\187\187\229\138\161\232\167\166\229\143\145VarName\230\148\185\229\143\152\229\128\188\231\155\184\229\144\140")
    end
    local BlackScreenEnable = 1 == Param.NewValue
    GWorld.logger.debug("TriggerQuestArtLevelChange: \228\187\187\229\138\161\232\167\166\229\143\145Art\229\138\160\229\141\184\232\189\189 RegionId: " .. RegionId .. " VarName: " .. VarName .. " Param.NewValue:" .. Param.NewValue)
    self:RealQuestArtLevelChange(RegionId, VarName, BlackScreenEnable, Param.NewValue)
  end
end

function GameModeQuestMgr:UpdateQuestArtLevel()
  self.QuestArtLevelChangeLevelName = ""
  local Avatar = GWorld:GetAvatar()
  local SubRegionId = Avatar:GetCurrentRegionId()
  local SubRegionData = DataMgr.SubRegion[SubRegionId]
  if not SubRegionData or not SubRegionData.RegionId then
    return
  end
  local RegionId = SubRegionData.RegionId
  local QuestVar = DataMgr.ArtLevelControl_RegionId2TaskVar[RegionId]
  if not QuestVar then
    return
  end
  for i, VarName in pairs(QuestVar) do
    local VarValue = Avatar.StoryVariable[VarName]
    if 1 == VarValue then
      GWorld.logger.debug("TriggerQuestArtLevelChange: \232\191\155\229\142\187\229\140\186\229\159\159\228\187\187\229\138\161\232\167\166\229\143\145Art\229\138\160\229\141\184\232\189\189 RegionId: " .. RegionId .. " VarName: " .. VarName .. "  BlackScreen: false   Param.NewValue:" .. VarValue)
      self:RealQuestArtLevelChange(RegionId, VarName, false, VarValue)
    end
  end
end

function GameModeQuestMgr:RealQuestArtLevelChange(RegionId, VarName, BlackScreenEnable, LoadEnable)
  if DataMgr.ArtLevelControl_TaskVar2Data[VarName] == nil then
    GWorld.logger.error("BP_EMGameMode_C:RealQuestArtLevelChange VarName Not In DataMgr. VarName:" .. VarName)
    return
  end
  local Info = DataMgr.ArtLevelControl_TaskVar2Data[VarName][RegionId]
  if not Info then
    GWorld.logger.error("BP_EMGameMode_C:RealQuestArtLevelChange Player \229\189\147\229\137\141\228\184\141\229\164\132\228\186\142\232\166\129\230\148\185\229\143\152\231\154\132\229\140\186\229\159\159\239\188\140RegionId: " .. RegionId)
    return
  end
  if nil == Info.LoadLevel then
    GWorld.logger.error("BP_EMGameMode_C:RealQuestArtLevelChange \229\175\188\232\161\168\230\149\176\230\141\174\230\156\137\233\151\174\233\162\152\239\188\140\230\137\190\228\184\141\229\136\176LoadLevel, VarName: " .. VarName .. "   RegionId:  " .. RegionId)
    return
  end
  local LoadArray = TArray(FString)
  local UnloadArray = TArray(FString)
  if 1 == LoadEnable then
    for i, Value in pairs(Info.LoadLevel) do
      LoadArray:Add(Value)
    end
    if nil ~= Info.UnLoadLevel then
      for i, Value in pairs(Info.UnLoadLevel) do
        UnloadArray:Add(Value)
      end
    end
  else
    for i, Value in pairs(Info.LoadLevel) do
      UnloadArray:Add(Value)
    end
    if nil ~= Info.UnLoadLevel then
      for i, Value in pairs(Info.UnLoadLevel) do
        LoadArray:Add(Value)
      end
    end
  end
  if BlackScreenEnable and Info.BlackScreen == true then
    if self.QuestArtLevelChangeLevelName ~= "" then
      GWorld.logger.error("BP_EMGameMode_C:RealQuestArtLevelChange \229\141\149\228\184\170\228\187\187\229\138\161\229\144\140\230\151\182\232\167\166\229\143\145\228\186\134\229\164\154\228\184\170Var\229\143\152\233\135\143\231\154\132Art\230\152\190\231\164\186: Name1-->" .. self.QuestArtLevelChangeLevelName .. "   Name2-->  " .. Info.LoadLevel[1])
    end
    self.QuestArtLevelChangeLevelName = Info.LoadLevel[1]
    self:AddTimer(6, self.QuestTimerEndCloseBlackScreen, false, 0, "QuestArtLevelChange", false)
    UIManager(self):ShowCommonBlackScreen({
      BlackScreenHandle = "QuestArtLevelChange",
      InAnimationPlayTime = Info.InTime,
      OutAnimationPlayTime = Info.OutTime
    })
  end
  self:ChangeLevelLoadingState(LoadArray, UnloadArray)
end

function GameModeQuestMgr:QuestArtLevelChangeCloseBlackScreen(LevelName)
  if UIManager(self) and string.match(self.QuestArtLevelChangeLevelName, LevelName) then
    UIManager(self):HideCommonBlackScreen("QuestArtLevelChange")
    self:RemoveTimer("QuestArtLevelChange")
    self.QuestArtLevelChangeLevelName = ""
  end
  self:AddTimer(1, function()
    UE4.UNavigationFunctionLibrary.RefreshItemsNavStateInBound(self)
  end, false, 0, "RefreshNavData")
end

function GameModeQuestMgr:QuestTimerEndCloseBlackScreen(LevelName)
  GWorld.logger.error("ERROR!!! QuestTimerEndCloseBlackScreen \228\187\187\229\138\161\230\148\185\229\143\152ART\229\133\179\229\141\161\232\167\166\229\143\145\228\186\134\229\174\154\230\151\182\229\153\168\228\191\157\229\186\149\233\187\145\229\177\143\239\188\140\232\175\183\232\129\148\231\179\187\231\168\139\229\186\143\230\163\128\230\159\165\239\188\129 LevelPath:::" .. self.QuestArtLevelChangeLevelName)
  if UIManager(self) then
    UIManager(self):HideCommonBlackScreen("QuestArtLevelChange")
    self.QuestArtLevelChangeLevelName = ""
  end
end

return GameModeQuestMgr
