require("UnLua")
local CommonConst = require("CommonConst")
local ItemUtils = require("Utils.ItemUtils")
local CommonUtils = require("Utils.CommonUtils")
local msgpack = require("msgpack_core")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local MiscUtils = require("Utils.MiscUtils")
local BP_EMGameMode_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.Components.AIBattleMgr",
  "BluePrints.GameMode.Components.HardBossComponent",
  "BluePrints.GameMode.Components.AbyssComponent",
  "BluePrints.GameMode.Components.ProgressSnapShotComponent",
  "BluePrints.GameMode.Components.GameModeLogin",
  "BluePrints.GameMode.Components.RewardComponent",
  "BluePrints.GameMode.Components.GameModeEventComponent",
  "BluePrints.GameMode.Components.RougeLikeComponent",
  "BluePrints.GameMode.Components.GameModeRegionMgr",
  "BluePrints.GameMode.Components.GameModeQuestMgr",
  "BluePrints.GameMode.Components.WalnutComponent",
  "BluePrints.GameMode.Components.TicketComponent",
  "BluePrints.GameMode.Components.RewardGenComponent"
})
BP_EMGameMode_C._components = {}

function BP_EMGameMode_C:InitGameModeInfo(DungeonId)
  self.PreInitInfo = GWorld.GameInstance:ConsumeGameModePreInitInfo()
  self:SetGameModeBaseInfo(DungeonId)
  self.EMGameState:InitGameStateInfo()
  self.MonsterCacheNum = 10
  self.CacheAvatarToItems = {}
  self.GMMonsterBuff = {}
  self.MiniGameFailedTime = {}
  self.DropRule = {}
  self:InitFixedCreator()
  self:InitAIBattleMgr()
  self:InitRewardParams()
  self.bEnableMonsterCollisionPush = true
  self.NeedToWaitForOthers = false
  self.bBlock = false
  self.BattleAvatars = {}
end

function BP_EMGameMode_C:SetGameModeBaseInfo(DungeonId)
  local Avatar = GWorld:GetAvatar()
  if Avatar and self:IsInRegion() then
    print(_G.LogTag, "Init Region")
    self.DungeonId = -1
    self.RegionId = Avatar:GetSubRegionId2RegionId(Avatar.CurrentRegionId)
    self:UpdateRegionGameModeLevel()
    self.EMGameState:SetGameModeType("Region")
    self:UpdateQuestArtLevel()
    self.EMGameState.CurDungeonUIParamID = 0
    self:SetGameStatePetRandomDailyCount()
  elseif self:IsInDungeon() then
    print(_G.LogTag, "Init Dungeon")
    local DungeonInfo = DataMgr.Dungeon[DungeonId]
    if not DungeonInfo then
      return
    end
    self.DungeonId = DungeonId
    local Level = DungeonInfo.DungeonLevel or 1
    self.BattleProgressLevel = DungeonInfo.DungeonFixLevel or 0
    self:SetGameModeLevel(Level)
    self.CommonAlertDisable = DungeonInfo.AlertDisable or self.CommonAlertDisable
    self.EMGameState:SetGameModeType("Blank")
    if DungeonInfo.DungeonType and DungeonInfo.DungeonType ~= "" then
      self.EMGameState:SetGameModeType(DungeonInfo.DungeonType)
    end
    self:InitDungeonComponent()
    if DungeonInfo.EnableTacmap then
      self:InitTacMapManager()
    end
    self:InitGameModeTypeInfo()
    self:InitEmergencyMonster()
    if not IsDedicatedServer(self) then
      self:InitDungeonRandomEvent()
    end
  else
    DebugPrint("BP_EMGameMode_C: Warning!!! DungeonId \228\184\186", DungeonId)
  end
end

function BP_EMGameMode_C:InitGameModeTypeInfo()
  if not self:CheckGameModeEnable() then
    return
  end
  if self.EMGameState.GameModeType == "Blank" then
    return
  end
  if not self:GetDungeonComponent() then
    return
  end
  local FunName = "Init" .. self.EMGameState.GameModeType .. "Component"
  if self:GetDungeonComponent() ~= nil and self:GetDungeonComponent()[FunName] ~= nil then
    self:GetDungeonComponent()[FunName](self:GetDungeonComponent())
  end
end

function BP_EMGameMode_C:InitTacMapManager()
  self.TacMapManager = nil
  if not self:GetLevelLoader() then
    return
  end
  local TacMapManagerClass = LoadClass("/Game/BluePrints/Common/Level/BP_TacmapManagerNew.BP_TacmapManagerNew_C")
  self.TacMapManager = NewObject(TacMapManagerClass, self)
  self.TacMapManager:Init(self.levelLoader)
end

function BP_EMGameMode_C:TryRegisterPlayerToTacmap()
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not (DungeonInfo and DungeonInfo.EnableTacmap) or not self.TacMapManager then
    return
  end
  for i = 0, self:GetPlayerNum() - 1 do
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    self.TacMapManager:RegisterPlayer(PlayerCharacter, i + 1)
  end
end

function BP_EMGameMode_C:GMInitGameModeInfo(Id)
  self:InitGameModeInfo(Id)
end

function BP_EMGameMode_C:ResetRemainTriggerAlertCD()
  self.RemainTriggerAlertCD = DataMgr.GlobalConstant.GameModeAlertCD.ConstantValue or 30
end

function BP_EMGameMode_C:ReceiveBeginPlay()
  self.LevelGameMode = UE4.UGameplayStatics.GetGameMode(self)
  if self:IsSubGameMode() then
    return
  end
  self:SetActorTickInterval(1.0)
  self:AIBattleMgrReceiveBeginPlay()
  self:BindTalkSubsystem()
  self.GameModeIndex = GWorld:AddGameMode(self)
end

function BP_EMGameMode_C:ReceiveEndPlay(EndPlayReason)
  if self:IsSubGameMode() then
    return
  end
  self.Overridden.ReceiveEndPlay(self, EndPlayReason)
  self.OnDestroyDelegates:Broadcast()
  self:UnbindTalkSubsystem()
  GWorld:RemoveGameMode(self.GameModeIndex)
end

function BP_EMGameMode_C:BindTalkSubsystem()
  local TS = TalkSubsystem()
  if TS then
    TS:OnEMGameModeBeginPlay()
  end
end

function BP_EMGameMode_C:UnbindTalkSubsystem()
  local TS = TalkSubsystem()
  if TS then
    TS:OnEMGameModeEndPlay()
  end
end

function BP_EMGameMode_C:GetPlayerLevel()
  return GWorld:GetAvatar() and GWorld:GetAvatar().Level or 0
end

function BP_EMGameMode_C:GetTargetPlayerNum()
  return CommonUtils.Size(self.AvatarInfos)
end

function BP_EMGameMode_C:IsNeedToWaitForOthers()
  return self.NeedToWaitForOthers
end

function BP_EMGameMode_C:ReceiveTick(DeltaSeconds)
  self:TickAIBattleMgr(DeltaSeconds)
  self:TickGenReward(DeltaSeconds)
end

function BP_EMGameMode_C:GetAlreadyInit()
  return self.AlreadyInit
end

function BP_EMGameMode_C:SetRegionSpecialQuest(Value, UIParamID)
  assert(self:IsInRegion(), "SetRegionSpecialQuest \229\143\170\232\131\189\229\156\168\229\140\186\229\159\159\229\134\133\232\176\131\231\148\168")
  self.EMGameState.CurDungeonUIParamID = UIParamID
  local TypeName = ERegionSpecialQuestType:GetNameByValue(Value)
  self:InitRegionDungeonComponent(TypeName)
  self.LevelGameMode:InitRegionSpecialQuestGameModeComponent()
  self.EMGameState:SetDungeonUIState(Const.EDungeonUIState.None)
  self.EMGameState:LoadDungeonUI(TypeName)
  DebugPrint("SetRegionSpecialQuest \231\137\185\230\174\138\228\187\187\229\138\161GameModeComponent\229\136\157\229\167\139\229\140\150 \231\137\185\230\174\138\228\187\187\229\138\161:", TypeName)
end

function BP_EMGameMode_C:ResetRegionSpecialQuest()
  DebugPrint("ResetRegionSpecialQuest \231\137\185\230\174\138\228\187\187\229\138\161GameModeComponent\233\135\141\231\189\174 \231\137\185\230\174\138\228\187\187\229\138\161:", self.LevelGameMode.RegionSpecialQuest)
  self.EMGameState:UnloadDungeonUI(self.LevelGameMode.RegionSpecialQuest)
  self.LevelGameMode:ClearRegionSpecialQuestGameModeComponent()
  self:ClearRegionDungeonComponent()
  self.EMGameState.CurDungeonUIParamID = 0
end

function BP_EMGameMode_C:InitRegionSpecialQuestGameModeComponent()
  if self.RegionSpecialQuest == nil then
    return
  end
  local FunName = "Init" .. self.RegionSpecialQuest .. "Component"
  self:TriggerDungeonComponentFun(FunName)
end

function BP_EMGameMode_C:ClearRegionSpecialQuestGameModeComponent()
  if self.RegionSpecialQuest == nil then
    return
  end
  local FunName = "Clear" .. self.RegionSpecialQuest .. "Component"
  self:TriggerDungeonComponentFun(FunName)
end

function BP_EMGameMode_C:ShowTrialTask(TaskIndex)
  self:TriggerDungeonComponentFun("ShowTrialTask", TaskIndex)
end

function BP_EMGameMode_C:OnInit()
  if not self:CheckGameModeEnable() then
    return
  end
  if self:IsSubGameMode() then
    return
  end
  self:RegionOnInit()
  DebugPrint("GameMode\232\191\155\232\161\140\230\191\128\230\180\187 OnInit")
  GWorld:DSBLog("Info", "GameMode:OnInit", "GameMode")
  self:AddDungeonEvent("OnInit")
  self.AlreadyInit = true
  if IsDedicatedServer(self) then
    GWorld.GameInstance:SetFixedFrameRate(20)
  end
  self:TryRegisterPlayerToTacmap()
  self.CharExpGetInBattle = 0
  if self:IsInDungeon() and self:NeedProgressRecover() then
    self:InitBPBornActor()
    self:TriggerProgressRecover()
  else
    self:InitDungeonBaseInfo()
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
      TaskUtils:UpdatePlayerSubRegionIdInfo(Avatar.CurrentRegionId)
      Avatar:CombineAddRegionData(true)
      self:AddTimer(0.1, function()
        local Avatar1 = GWorld:GetAvatar()
        if Avatar1 and Avatar1.CombineAdd then
          Avatar1:CombineAddRegionData(false)
        end
      end)
    end
    self:InitBPBornActor()
    self:InitCustomActor()
    self:InitAutoActiveStaticCreator()
    if Avatar then
      Avatar:CombineAddRegionData(false)
    end
    self.Overridden.OnInit(self)
  end
  if self:IsInDungeon() and self.DungeonId and self.DungeonId > 0 then
    self:SetDungeonBGMState(0)
  end
  self.OnInitDelegates:Broadcast()
  ClientEventUtils:ClearCurrentDoingDynamicEvent(true, true)
end

function BP_EMGameMode_C:InitDungeonBaseInfo()
  if self:IsSubGameMode() or self:IsInRegion() then
    return
  end
  if self.EMGameState.GameModeType == "Blank" then
    return
  end
  if not self:GetDungeonComponent() then
    return
  end
  local FunName = "Init" .. self.EMGameState.GameModeType .. "BaseInfo"
  if self:GetDungeonComponent() ~= nil and self:GetDungeonComponent()[FunName] ~= nil then
    self:GetDungeonComponent()[FunName](self:GetDungeonComponent())
  end
end

function BP_EMGameMode_C:RegionOnInit()
  if self:IsInRegion() then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:HandleTryInitRegionInfo()
    end
    if not self.EMGameState:RegionNeedPreCreateUnit() then
      self:GetRegionDataMgrSubSystem():OnInitRecoverRegionData(false)
    end
  end
end

function BP_EMGameMode_C:OnQuestComplete(QuestChainId, QuestId)
  self.Overridden.OnQuestComplete(self, QuestChainId, QuestId)
  local Components = self:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass())
  for _, Component in pairs(Components:ToTable()) do
    if Component.QuestId == QuestId then
      Component.AfterQuestFinish:Broadcast()
    end
  end
end

function BP_EMGameMode_C:TriggerOnQuestCompleteComponent()
  local Components = self:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass())
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Component in pairs(Components:ToTable()) do
    if Avatar:IsQuestFinished(Component.QuestId) then
      Component.AfterQuestFinish:Broadcast()
    end
  end
end

function BP_EMGameMode_C:OnBigWorldActive()
  self.Overridden.OnBigWorldActive(self)
  self:TriggerOnQuestCompleteComponent()
end

function BP_EMGameMode_C:MainGameModeOnBigWorldActive()
  if self:IsSubGameMode() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local ActiveExploreInfo = {}
  for _, ExploreGroup in pairs(self.EMGameState.ExploreGroupMap:ToTable()) do
    if ExploreGroup.AutoActive then
      local SubRegionId = self:GetRegionIdByLocation(ExploreGroup:K2_GetActorLocation())
      local ExploreId = ExploreGroup:GetExploreGroupId()
      if not DataMgr.SubRegion[SubRegionId] then
        GWorld.logger.error("ZJT_ \229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170\230\142\162\231\180\162\231\187\132" .. ExploreId .. "\232\162\171\228\184\162\229\188\131\229\156\168\229\140\186\229\159\159\229\164\150" .. SubRegionId .. "\230\137\190\228\184\141\229\136\176\229\174\131\230\137\128\229\156\168\231\154\132\229\140\186\229\159\159")
      elseif ActiveExploreInfo[ExploreGroup:GetExploreGroupId()] then
        GWorld.logger.error("ZJT_ \229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170\230\142\162\231\180\162\231\187\132\229\177\133\231\132\182\233\135\141\229\164\141\230\142\137\228\186\134" .. ExploreId .. ":SubRegionId:" .. SubRegionId .. "\230\137\128\229\156\168\231\154\132\229\140\186\229\159\159")
      else
        local Explore = Avatar.Explores[ExploreId]
        if Explore then
          if Explore:IsDoing() then
            if Explore.RegionId ~= SubRegionId then
              GWorld.logger.error("ZJT_ \229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170\230\142\162\231\180\162\231\187\132\229\177\133\231\132\182\233\135\141\229\164\141\230\142\137\228\186\134 \228\184\141\229\144\140\229\140\186\229\159\159: " .. ExploreId .. ": \230\156\172\230\172\161\230\191\128\230\180\187 SubRegionId:" .. SubRegionId .. "\230\137\128\229\156\168\231\154\132\229\140\186\229\159\159" .. "\228\184\138\230\172\161\230\191\128\230\180\187\239\188\154" .. Explore.RegionId .. " \230\137\128\229\156\168\229\140\186\229\159\159\239\188\129")
            end
          elseif Explore:IsInActive() then
            ActiveExploreInfo[ExploreId] = SubRegionId
          end
        else
          ActiveExploreInfo[ExploreId] = SubRegionId
        end
        ExploreGroup:InitSetExploreGroupStatus_Active()
      end
    end
  end
  if Avatar then
    Avatar:ExploreIdsActive(ActiveExploreInfo)
  end
  self:TriggerOnQuestCompleteComponent()
end

function BP_EMGameMode_C:OnBattle()
  if not self:IsSubGameMode() then
    self.OnBattleDelegates:Broadcast()
    self:TriggerDungeonComponentFun("OnBattle")
  end
  self.Overridden.OnBattle(self)
end

function BP_EMGameMode_C:OnPlayerEnter(Eid)
  if not self:IsSubGameMode() and Eid > 0 then
    self:TriggerDungeonComponentFun("OnPlayerEnter", Eid)
  end
end

function BP_EMGameMode_C:OnPause()
  if not self:IsSubGameMode() then
    self.OnPauseDelegates:Broadcast()
  end
  self.Overridden.OnPause(self)
end

function BP_EMGameMode_C:OnAlert()
  if not self:IsSubGameMode() then
    self.OnAlertDelegates:Broadcast()
  end
  self.Overridden.OnAlert(self)
end

function BP_EMGameMode_C:OnEnterCommonAlert()
  if not self:IsSubGameMode() then
    self.OnEnterCommonAlertDelegates:Broadcast()
  end
  self.Overridden.OnEnterCommonAlert(self)
end

function BP_EMGameMode_C:OnExitCommonAlert()
  if not self:IsSubGameMode() then
    self.OnExitCommonAlertDelegates:Broadcast()
  end
  self.Overridden.OnExitCommonAlert(self)
end

function BP_EMGameMode_C:OnResumeBattleEntities()
  if not self:IsSubGameMode() then
    self.OnResumeBattleEntitiesDelegates:Broadcast()
  end
  self.Overridden.OnResumeBattleEntities(self)
end

function BP_EMGameMode_C:OnPauseBattleEntities(Reason)
  if not self:IsSubGameMode() then
    self.OnPauseBattleEntitiesDelegates:Broadcast()
  end
  self.Overridden.OnPauseBattleEntities(self, Reason)
end

function BP_EMGameMode_C:OnBossDead(Monster)
  self.Overridden.OnBossDead(self, Monster)
  self:TriggerBPGameModeEvent("OnBossDead", Monster)
end

function BP_EMGameMode_C:OnEnd(Result)
  if not self:IsSubGameMode() then
    self.OnEndDelegates:Broadcast(Result)
    self.EMGameState:ClearGuideEid()
    local FunName = "Trigger" .. self.EMGameState.GameModeType .. "OnEnd"
    self:TriggerDungeonComponentFun(FunName)
    self:RemoveDungeonEvent("OnInit")
    self.CharExpGetInBattle = 0
    for _, PlayerCharacter in pairs(self:GetAllPlayer()) do
      local NextRecoveryState = PlayerCharacter:IsDead() and UE4.ETeamRecoveryState.RealDead or UE4.ETeamRecoveryState.Alive
      PlayerCharacter:HandleRemoveModPassives()
      PlayerCharacter:TryLeaveDying(NextRecoveryState)
    end
  end
  self.Overridden.OnEnd(self, Result)
end

function BP_EMGameMode_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  if not self:IsSubGameMode() then
    self:TriggerDungeonComponentFun("OnStaticCreatorEvent", EventName, Eid, UnitId, UnitType)
  end
  self.Overridden.OnStaticCreatorEvent(self, EventName, Eid, UnitId, UnitType)
end

function BP_EMGameMode_C:OnUnitDeadEvent(MonsterC)
  if not self:IsSubGameMode() then
    self:TriggerDungeonComponentFun("OnUnitDeadEvent", MonsterC)
    self:TriggerDungeonAchieve("OnMonsterDeadAchieve", MonsterC, -1)
  end
end

function BP_EMGameMode_C:OnUnitDestoryEvent(MonsterC, CombatItemBase, DestroyReason)
  if not self:IsSubGameMode() then
    self:TriggerDungeonComponentFun("OnUnitDestoryEvent", MonsterC, CombatItemBase)
  end
  if MonsterC then
    self:TriggerSTLEvent("OnSTLActorDestroyed", MonsterC, DestroyReason)
  elseif CombatItemBase then
    self:TriggerSTLEvent("OnSTLActorDestroyed", CombatItemBase, DestroyReason)
  else
    DebugPrint("BP_EMGameMode_C:OnUnitDestoryEvent \228\188\160\229\133\165\231\154\132Monster\229\146\140CombatItemBase\229\157\135\228\184\186\231\169\186\239\188\129")
  end
end

function BP_EMGameMode_C:OnCombatPropDeadEvent(CombatProp)
  if not self:IsSubGameMode() then
    self:TriggerDungeonComponentFun("OnCombatPropDeadEvent", CombatProp)
  end
end

function BP_EMGameMode_C:STLPostStaticCreatorEvent(Actor, Info)
  if self:IsInDungeon() then
    return
  end
  if Info.Creator and 0 == Actor.RandomCreatorId and 0 ~= Actor.CreatorId then
    self:TriggerSTLEvent("STLPostStaticCreatorEvent", Actor)
  end
end

function BP_EMGameMode_C:ClearDelayMonster()
  if self:IsInRegion() then
    return
  end
  local EventMgr = self.EMGameState.EventMgr
  EventMgr.FramingCreateUintQueue.Monster = {}
  EventMgr.LoadingClassMonsterQueue = {}
end

function BP_EMGameMode_C:STLRegisterKillMonsterNode(KillMonsterNode)
  if not self.KillMonsterNodeMap then
    self.KillMonsterNodeMap = {}
  end
  if _G.next(self.KillMonsterNodeMap) == nil then
    self.EMGameState:RegisterGameModeEvent("OnDead", self, self.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: \230\179\168\229\134\140OnDead\228\186\139\228\187\182")
  end
  self.KillMonsterNodeMap[KillMonsterNode.Key] = KillMonsterNode
  DebugPrint("KillMonsterNode: \230\179\168\229\134\140\229\136\176GameMode. Key", KillMonsterNode.Key)
end

function BP_EMGameMode_C:STLUnRegisterKillMonsterNode(KillMonsterNodeKey)
  if not self.KillMonsterNodeMap then
    return
  end
  self.KillMonsterNodeMap[KillMonsterNodeKey] = nil
  DebugPrint("KillMonsterNode: \228\187\142GameMode\231\167\187\233\153\164. Key", KillMonsterNodeKey)
  if nil == _G.next(self.KillMonsterNodeMap) then
    self.EMGameState:RemoveGameModeEvent("OnDead", self, self.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: \230\179\168\233\148\128OnDead\228\186\139\228\187\182")
  end
end

function BP_EMGameMode_C:STLOnMonsterKilled(Monster)
  if not self.KillMonsterNodeMap then
    return
  end
  local DeepCopy_KillMonsterNodeMap = self:STLTableDeepCopy(self.KillMonsterNodeMap)
  for Key, KillMonsterNode in pairs(DeepCopy_KillMonsterNodeMap) do
    DebugPrint("KillMonsterNode: \230\128\170\231\137\169\232\162\171\229\135\187\230\157\128\239\188\140Node Key", Key)
    KillMonsterNode:OnMonsterKilledByNums(Monster)
  end
end

function BP_EMGameMode_C:STLRegisterKillMonsterNode_Creator(KillMonsterNode)
  if not self.KillMonsterNodeMap_Creator then
    self.KillMonsterNodeMap_Creator = {}
  end
  if _G.next(self.KillMonsterNodeMap_Creator) == nil then
    self.EMGameState:RegisterGameModeEvent("OnDeadStaticUnit", self, self.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: \230\179\168\229\134\140OnDead\228\186\139\228\187\182")
  end
  self.KillMonsterNodeMap_Creator[KillMonsterNode.Key] = KillMonsterNode
  DebugPrint("KillMonsterNode_Creator: \230\179\168\229\134\140\229\136\176GameMode. Key", KillMonsterNode.Key)
end

function BP_EMGameMode_C:STLUnRegisterKillMonsterNode_Creator(KillMonsterNodeKey)
  if not self.KillMonsterNodeMap_Creator then
    return
  end
  self.KillMonsterNodeMap_Creator[KillMonsterNodeKey] = nil
  DebugPrint("KillMonsterNode_Creator: \228\187\142GameMode\231\167\187\233\153\164. Key", KillMonsterNodeKey)
  if nil == _G.next(self.KillMonsterNodeMap_Creator) then
    self.EMGameState:RemoveGameModeEvent("OnDeadStaticUnit", self, self.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: \230\179\168\233\148\128OnDead\228\186\139\228\187\182")
  end
end

function BP_EMGameMode_C:STLOnMonsterKilled_Creator(Monster)
  if not self.KillMonsterNodeMap_Creator then
    return
  end
  local DeepCopy_KillMonsterNodeMap_Creator = self:STLTableDeepCopy(self.KillMonsterNodeMap_Creator)
  for Key, KillMonsterNode in pairs(DeepCopy_KillMonsterNodeMap_Creator) do
    DebugPrint("KillMonsterNode_Creator: \230\128\170\231\137\169\232\162\171\229\135\187\230\157\128\239\188\140Node Key", Key)
    KillMonsterNode:OnMonsterKilledByCreatorId(Monster)
  end
end

function BP_EMGameMode_C:STLTableDeepCopy(table)
  local res = {}
  for k, v in pairs(table) do
    res[k] = v
  end
  return res
end

function BP_EMGameMode_C:OnCustomEvent(EventName, Channel)
  if not self:IsSubGameMode() then
    self.OnCustomEventDelegates:Broadcast(EventName, Channel)
  end
  self.Overridden.OnCustomEvent(self, EventName, Channel)
  self:TriggerBPGameModeEvent("OnCustomEvent", EventName)
end

function BP_EMGameMode_C:OnTriggerAOIBase(TriggerEventId, TriggerBase, EMActorEid, TriggerType)
  if not self:IsSubGameMode() then
    self:TriggerSTLEvent("OnTriggerAOIBase", TriggerEventId, TriggerBase, EMActorEid, TriggerType)
  end
  self.Overridden.OnTriggerAOIBase(self, TriggerEventId, TriggerBase, EMActorEid, TriggerType)
  self:TriggerBPGameModeEvent("OnTriggerAOIBase", TriggerEventId, TriggerBase, EMActorEid, TriggerType)
end

function BP_EMGameMode_C:ChangeAOITriggerCollision(CreatorIds, IsEnabled)
  for i, v in pairs(CreatorIds) do
    local Creator = self.EMGameState.StaticCreatorMap:Find(v)
    if Creator and Creator.ChildEids:Length() > 0 then
      local Mechanism = Battle(self):GetEntity(Creator.ChildEids[1])
      if Mechanism and Mechanism.CollisionComponent then
        local CollisionType = IsEnabled and ECollisionEnabled.QueryOnly or ECollisionEnabled.NoCollision
        Mechanism.CollisionComponent:SetCollisionEnabled(CollisionType)
      end
    end
  end
end

function BP_EMGameMode_C:BpAddTimer(TimerHandleName, Time, IsRealTime, Channel)
  DebugPrint("BpTimerDebug: BpAddTimer", TimerHandleName, Time, IsRealTime, Channel)
  self:AddTimer(Time, self.BpOnTimerEnd, false, 0, TimerHandleName, IsRealTime, TimerHandleName)
  self:AddClientTimerStruct(self, TimerHandleName, Time, IsRealTime)
  if Channel == Const.GameModeEventServerClient then
    self:AddDungeonEvent(TimerHandleName)
  end
end

function BP_EMGameMode_C:BpDelTimer(TimerHandleName, IsRealTime, Channel)
  DebugPrint("BpTimerDebug: BpDelTimer", TimerHandleName, IsRealTime, Channel)
  self:RemoveTimer(TimerHandleName, IsRealTime)
  local FuncName = "BpOnTimerDel_" .. TimerHandleName
  if self[FuncName] then
    self[FuncName](self)
  end
  self:RemoveClientTimerStruct(TimerHandleName)
  if Channel == Const.GameModeEventServerClient then
    self:RemoveDungeonEvent(TimerHandleName)
  end
end

function BP_EMGameMode_C:BpResetTimer(TimerHandleName, NewTime, IsRealTime, Channel)
  DebugPrint("BpTimerDebug: BpResetTimer", TimerHandleName, NewTime, IsRealTime, Channel)
  self:RemoveTimer(TimerHandleName, IsRealTime)
  self:AddTimer(NewTime, self.BpOnTimerEnd, false, 0, TimerHandleName, IsRealTime, TimerHandleName)
  self:RemoveClientTimerStruct(TimerHandleName)
  if Channel == Const.GameModeEventServerClient then
    self:AddClientTimerStruct(self, TimerHandleName, NewTime, IsRealTime)
  end
end

function BP_EMGameMode_C:BpOnTimerEnd(TimerHandleName)
  DebugPrint("BpTimerDebug: BpOnTimerEnd", TimerHandleName)
  self.Overridden.BpOnTimerEnd(self, TimerHandleName)
  self:TriggerBPGameModeEvent("BpOnTimerEnd", TimerHandleName)
  local FuncName = "BpOnTimerEnd_" .. TimerHandleName
  if self[FuncName] then
    self[FuncName](self)
  end
  self.LevelGameMode:TriggerDungeonComponentFun(FuncName)
  self:RemoveClientTimerStruct(TimerHandleName)
  self:RemoveDungeonEvent(TimerHandleName)
end

function BP_EMGameMode_C:BpGetRemainTime(TimerHandleName)
  local RawRemainTime = CommonUtils.GetClientTimerStructRemainTime(TimerHandleName)
  if not RawRemainTime then
    return 0
  end
  return RawRemainTime
end

function BP_EMGameMode_C:SetClientDungeonUIState(DungeonUIState)
  local OldState = self.EMGameState.DungeonUIState
  self.EMGameState.DungeonUIState = DungeonUIState
  self.EMGameState:MarkDungeonUIStateAsDirtyData()
  if IsStandAlone(self) and OldState ~= DungeonUIState then
    self.EMGameState:OnRep_DungeonUIState()
  end
end

function BP_EMGameMode_C:NotifyClientShowSurvivalProBuffInfo(PathIconList, TextMapList, Duration)
  self.EMGameState.SurvivalProBuffInfo.PathIconList = PathIconList
  self.EMGameState.SurvivalProBuffInfo.TextMapList = TextMapList
  self.EMGameState.SurvivalProBuffInfo.Duration = Duration
  self.EMGameState:MarkSurvivalProBuffInfoAsDirtyData()
  self:AddDungeonEvent("UpdateSurvivalProBuffInfo")
end

function BP_EMGameMode_C:NotifyClientShowDungeonToast(TextMapIndex, Duration, ToastType, ColorEnum)
  self.EMGameState:MulticastClientShowDungeonToast(TextMapIndex, Duration, ToastType, ColorEnum)
  return TextMapIndex
end

function BP_EMGameMode_C:InitBPBornActor()
  if 0 == self.BPBornActor:Num() then
    return
  end
  for i, v in pairs(self.BPBornActor:ToTable()) do
    if IsValid(v) then
      if UE4.UGameplayStatics.GetGameState(v) and not v.ServerInitSuccess then
        if not v.TryInitActorInfo then
          DebugPrint("yxd @@@@@@@@@@@@@@@@ ERROR ", v:GetName())
        else
          v:TryInitActorInfo("OnInit")
        end
      elseif not UE4.UGameplayStatics.GetGameState(v) then
        local Avatar = GWorld:GetAvatar()
        if Avatar then
          local ct = {
            "\230\138\165\233\148\153\230\150\135\230\156\172:\n\t",
            "\230\156\186\229\133\179\229\144\141\231\167\176\239\188\154",
            v:GetName(),
            "\n"
          }
          local FinalMsg = table.concat(ct)
          Avatar:SendToFeiShuForRegionMgr(FinalMsg, "BPBorn\229\136\157\229\167\139\229\140\150\230\138\165\233\148\153 | \230\156\170\232\142\183\229\143\150\229\136\176GameState")
        else
          DebugPrint("yxderror: InitBPBornActor, NoGameState From This :", v:GetName())
        end
      end
    end
  end
end

function BP_EMGameMode_C:InitCustomActor()
  for i, ClanManager in pairs(self.EMGameState.ClanManagerMap) do
    ClanManager:InitClan()
  end
end

function BP_EMGameMode_C:InitAutoActiveStaticCreator()
  self:TriggerActiveStaticCreator(self.EMGameState.AutoActiveStaticIds)
  self:TriggerActiveAutoPrivateStaticCreator()
  self:TriggerFlexibleActiveStaticCreator()
end

function BP_EMGameMode_C:IsCanTriggerStaticCreator(StaticCreatorId, QuestChainId)
  if not GWorld:GetWorldRegionState() then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  if QuestChainId and QuestChainId > 0 and Avatar:IsQuestChainFinished(QuestChainId) then
    DebugPrint("\229\136\183\230\150\176\231\130\185\227\128\144" .. tostring(StaticCreatorId) .. "\227\128\145\230\137\128\229\177\158\231\154\132\228\187\187\229\138\161\233\147\190\227\128\144" .. tostring(QuestChainId) .. "\227\128\145\229\183\178\231\187\143\229\174\140\230\136\144\228\186\134")
    return false
  end
  if IsStandAlone(self) then
    local RegionDataMgrSubSystem = self:GetRegionDataMgrSubSystem()
    if RegionDataMgrSubSystem and RegionDataMgrSubSystem:IsCretorIdControlByCacheNew(StaticCreatorId) then
      return false
    end
  end
  return true
end

function BP_EMGameMode_C:IsCanTriggerRandomStaticCreator(RuleId, Id)
  if not GWorld:GetWorldRegionState() then
    return true
  end
  if IsStandAlone(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar and self:GetRegionDataMgrSubSystem():IsRandomIdControlByCacheNew(RuleId, Id) then
      return false
    end
  end
  return true
end

function BP_EMGameMode_C:OnPlayersDungeonEnd(AvatarEids)
  local function func(AvatarEid)
    local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, AvatarEid)
    
    if PlayerController then
      local Player = PlayerController:GetMyPawn()
      if Player then
        DebugPrint("Tianyi@ On Player Leave Dungeon")
        Player:RawRemoveAllBuff()
        Player:HandleRemoveModPassives()
        Player:ClearSummons(false)
        if self:IsInDungeon() then
          UE4.UPhantomFunctionLibrary.CancelAllPhantomFromOwner(Player, EDestroyReason.PhantomExitDungeon)
        end
        local NextRecoveryState = Player:IsDead() and UE4.ETeamRecoveryState.RealDead or UE4.ETeamRecoveryState.Alive
        Player:TryLeaveDying(NextRecoveryState)
        if not Player:IsDead() then
          Player:ResetIdle()
        end
        local FunName = "Trigger" .. self.EMGameState.GameModeType .. "PlayerDungeonEnd"
        self:TriggerDungeonComponentFun(FunName, Player)
      end
    end
  end
  
  if AvatarEids and 0 ~= #AvatarEids then
    for _, AvatarEid in ipairs(AvatarEids) do
      func(AvatarEid)
    end
  else
    for AvatarEid, _ in pairs(self.LevelGameMode.AvatarInfos) do
      func(AvatarEid)
    end
  end
end

function BP_EMGameMode_C:TriggerFallingCallable(OtherActor, DefaultTransform, MaxDis, DefaultEnable, FallTrigger, TriggerFallingScreenColor)
  if not IsValid(OtherActor) then
    return
  end
  if OtherActor.TriggerFallingCallable then
    OtherActor:TriggerFallingCallable(self, DefaultTransform, MaxDis, DefaultEnable, FallTrigger, TriggerFallingScreenColor)
  else
    ScreenPrint(string.format("This OtherActor has not function called TriggerFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d", OtherActor:GetName() or "nil", OtherActor.UnitId or -1, OtherActor.Eid or -1, OtherActor.CreatorId or -1))
  end
end

function BP_EMGameMode_C:TriggerWaterFallingCallable(OtherActor, DefaultTransform, MaxDis, DefaultEnable)
  if not IsValid(OtherActor) then
    return
  end
  if OtherActor.TriggerWaterFallingCallable then
    OtherActor:TriggerWaterFallingCallable(self, DefaultTransform, MaxDis, DefaultEnable)
  else
    ScreenPrint(string.format("This OtherActor has not function called TriggerWaterFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d", OtherActor:GetName() or "nil", OtherActor.UnitId or -1, OtherActor.Eid or -1, OtherActor.CreatorId or -1))
  end
end

function BP_EMGameMode_C:SpawnDefaultPawnAtTransform(NewPlayer, SpawnTransform)
  DebugPrint("BP_EMGameMode_C:SpawnDefaultPawnAtTransform", SpawnTransform)
  local PawnClass = self:GetDefaultPawnClassForController(NewPlayer)
  local Instigator = self:GetInstigator()
  local DefaultPawn = UE4.URuntimeCommonFunctionLibrary.SpawnDefaultPawn(NewPlayer, PawnClass, SpawnTransform, Instigator)
  return DefaultPawn
end

function BP_EMGameMode_C:GetCurrentQuestId()
  local Avatar = GWorld:GetAvatar()
  local QuestIdArr = UE4.TArray(0)
  if not Avatar then
    return QuestIdArr
  end
  local Table = Avatar:GetQuestDoing()
  for _, value in pairs(Table) do
    QuestIdArr:Add(value)
  end
  return QuestIdArr
end

function BP_EMGameMode_C:SwitchToQuestRole(QuestRoleID, bPlayFX)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:RecoverBanSkills()
  local PlayerController = PlayerCharacter:GetController()
  
  local function PlayChangeRoleEffect()
    PlayerCharacter:ChangeRoleEffect()
    local BodyType = PlayerCharacter:GetBattleCharBodyType()
    PlayerCharacter.FXComponent:PlayEffectByIDParams(401, {
      NotAttached = true,
      scale = Const.BattleCharTagVXScaleTable[BodyType]
    })
  end
  
  if 0 == QuestRoleID then
    local CharacterUuid = Avatar.CurrentChar
    local CharacterID = Avatar.Chars[CharacterUuid].CharId
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(Avatar)
    PlayerCharacter:ChangeRole(CharacterID, AvatarInfo)
    if bPlayFX then
      PlayChangeRoleEffect()
    end
    if PlayerCharacter.RangedWeapon and 0 == PlayerCharacter.RangedWeapon:GetAttr("MagazineBulletNum") then
      PlayerCharacter.RangedWeapon:SetWeaponState("NoBullet", true)
    end
    EventManager:FireEvent(EventID.OnSwitchRole, CharacterUuid)
    return
  end
  local RoleInfo = DataMgr.QuestRoleInfo[QuestRoleID]
  if not RoleInfo then
    local Message = "QuestRoleId\228\184\141\229\173\152\229\156\168" .. "\n\t\229\156\168\232\176\131\231\148\168SwitchToQuestRole\231\154\132\230\151\182\229\128\153\239\188\140\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176QuestRoleId \227\128\144" .. tostring(QuestRoleID) .. "\227\128\145 \229\156\168QuestRoleInfo\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\159\165\233\152\133QuestRoleInfo\232\161\168\230\160\188"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "QuestRoleId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local AvatarInfo = AvatarUtils:GetBattleInfoByQuestRoleId(QuestRoleID, Avatar)
  if AvatarInfo.RoleInfo then
    AvatarInfo.RoleInfo.AvatarQuestRoleID = QuestRoleID
  end
  PlayerCharacter:ChangeRole(nil, AvatarInfo)
  if bPlayFX then
    PlayChangeRoleEffect()
  end
  if PlayerCharacter.RangedWeapon and 0 == PlayerCharacter.RangedWeapon:GetAttr("MagazineBulletNum") then
    PlayerCharacter.RangedWeapon:SetWeaponState("NoBullet", true)
  end
  EventManager:FireEvent(EventID.OnSwitchRole)
end

function BP_EMGameMode_C:SetNpcPatrol(NpcId, PatrolId)
  local NpcPlayerCharacter = self.EMGameState.NpcCharacterMap:Find(NpcId)
  if not IsValid(NpcPlayerCharacter) then
    print(_G.LogTag, "NpcMap no-exist this Npc", NpcId)
    return
  end
  NpcPlayerCharacter.PatrolId = PatrolId
end

function BP_EMGameMode_C:TriggerMechanism(StaticCreatorId, StateId, PrivateEnable, QuestId)
  if true == PrivateEnable and not self:IsSubGameMode() then
    print(_G.LogTag, "Error TriggerMechanism PrivateEnable is true but IsSubGameMode:", self:GetName())
    return
  end
  local StaticCreator = self.EMGameState:GetStaticCreatorInfo(StaticCreatorId, PrivateEnable, self.LevelName)
  if not IsValid(StaticCreator) then
    return
  end
  local NeedUpdateRegionData = true
  if StaticCreator.ChildEids:Length() >= 2 then
    DebugPrint("Warning: \232\191\153\228\184\170StaticCreator\229\136\183\230\150\176\228\186\134\229\164\154\228\184\170\230\156\186\229\133\179", StaticCreator.ChildEids:Length())
  end
  local bCanChange = false
  if StaticCreator.ChildEids:Length() > 0 then
    for i = 1, StaticCreator.ChildEids:Length() do
      local Info = Battle(self):GetEntity(StaticCreator.ChildEids:GetRef(i))
      if IsValid(Info) then
        print(_G.LogTag, "LXZ TriggerMechanism444", Info:GetName())
        if Info:IsCombatItemBase() then
          bCanChange = true
          Info:ChangeState("Manual", 0, StateId)
          if Info.RegionDataType == ERegionDataType.RDT_CommonQuestData then
            Info.QuestId = QuestId
          end
        end
      else
        local NowStateId = self.EMGameState.MechanismStateIdMap:Find(StaticCreatorId)
        local MechanismStateData = DataMgr.MechanismState[NowStateId]
        if MechanismStateData then
          for i, v in pairs(MechanismStateData.StateEvent) do
            if v.NextStateId == StateId and "Manual" == v.TypeNextState.Type then
              bCanChange = true
              break
            end
          end
        end
      end
    end
  elseif StaticCreator.CreatedWorldRegionEid ~= "" then
    local LuaTableIndex = self:GetRegionDataMgrSubSystem():GetLuaDataIndex(StaticCreator.CreatedWorldRegionEid)
    local NowStateId = self:GetRegionDataMgrSubSystem():GetStateIdByWorldRegionEid(LuaTableIndex)
    if -1 == NowStateId then
      NowStateId = DataMgr.Mechanism[StaticCreator.UnitId].FirstStateId
    end
    local MechanismStateData = DataMgr.MechanismState[NowStateId]
    if MechanismStateData then
      for i, v in pairs(MechanismStateData.StateEvent) do
        if v.NextStateId == StateId and "Manual" == v.TypeNextState.Type then
          bCanChange = true
        end
      end
    end
  end
  if StaticCreator.CreatedWorldRegionEid ~= "" and bCanChange then
    self:GetRegionDataMgrSubSystem():ChangeState(StaticCreator.CreatedWorldRegionEid, StateId)
  end
end

function BP_EMGameMode_C:TriggerMechanismArray(StaticCreatorIds, StateId, PrivateEnable, QuestId)
  for i, v in pairs(StaticCreatorIds) do
    self:TriggerMechanism(v, StateId, PrivateEnable, QuestId)
  end
end

function BP_EMGameMode_C:TriggerPetStateChange(StaticCreatorId, TargetState, PrivateEnable)
  if true == PrivateEnable and not self:IsSubGameMode() then
    print(_G.LogTag, "Error TriggerPetStateChange PrivateEnable is true but IsSubGameMode:", self:GetName())
    return
  end
  local StaticCreator = self.EMGameState:GetStaticCreatorInfo(StaticCreatorId, PrivateEnable, self.LevelName)
  if not IsValid(StaticCreator) then
    print(_G.LogTag, "Error TriggerPetStateChange Can Not Find StaticCreator:  " .. StaticCreatorId .. " PrivateEnable: " .. PrivateEnable, self:GetName())
    return
  end
  for i = 1, StaticCreator.ChildEids:Length() do
    local Info = Battle(self):GetEntity(StaticCreator.ChildEids:GetRef(i))
    if IsValid(Info) and Info:IsPetNpc() then
      Info:SetInteractiveState(TargetState)
    end
  end
end

function BP_EMGameMode_C:PetPlayFailureMontage(StaticCreatorId, PrivateEnable)
  self.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end

function BP_EMGameMode_C:TriggerPetMechanismState(StateId, PrivateEnable, QuestId)
  if self:IsSubGameMode() then
    print(_G.LogTag, "Error \229\156\168\229\173\144GameMode\228\189\191\231\148\168\228\186\134TriggerPetMechanismState:", self:GetName())
    return
  end
  if not IsValid(self.RandomPetCreator) then
    print(_G.LogTag, "Error TriggerPetMechanismState RandomPetCreator\230\151\160\230\149\136:", self:GetName())
  end
  self:TriggerMechanism(self.RandomPetCreator.StaticCreatorId, StateId, PrivateEnable, QuestId)
end

function BP_EMGameMode_C:TriggerPetStateChangeMain(TargetState, PrivateEnable)
  if self:IsSubGameMode() then
    print(_G.LogTag, "Error \229\156\168\229\173\144GameMode\228\189\191\231\148\168\228\186\134TriggerPetStateChangeMain:", self:GetName())
    return
  end
  if not IsValid(self.RandomPetCreator) then
    print(_G.LogTag, "Error TriggerPetStateChangeMain RandomPetCreator\230\151\160\230\149\136:", self:GetName())
  end
  for i = 1, self.RandomPetCreator.ChildEids:Length() do
    local Info = Battle(self):GetEntity(self.RandomPetCreator.ChildEids:GetRef(i))
    if IsValid(Info) and Info:IsPetNpc() then
      Info:SetInteractiveState(TargetState)
    end
  end
end

function BP_EMGameMode_C:PetPlayFailureMontageMain(PrivateEnable)
  self.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end

function BP_EMGameMode_C:OnTriggerMechanismManualItem(ManualCombatId, ComponentStateId, StateId, QuestId)
  if self:IsSubGameMode() and not self:IsInRegion() then
    print(_G.LogTag, "LXZ OnTriggerMechanismManualItem", ComponentStateId)
    return
  end
  for i = 1, ManualCombatId:Length() do
    local CombatItem = self.EMGameState.ManualActiveCombat:Find(ManualCombatId[i])
    if not IsValid(CombatItem) then
      GWorld.logger.error("\229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170ManualItemId" .. ManualCombatId[i] .. "\230\137\190\228\184\141\229\136\176\229\174\131\228\186\178\231\136\177\231\154\132\230\156\186\229\133\179\229\174\158\228\189\147\239\188\140\228\186\178\231\136\177\231\154\132\231\173\150\229\136\146\232\131\189\230\148\185\228\184\128\228\184\139gamemode\233\133\141\231\189\174\229\144\151")
    end
    if IsValid(CombatItem) then
      if CombatItem.ChangeToState then
        CombatItem:ChangeToState(StateId)
      end
      if 0 ~= ComponentStateId then
        CombatItem:ChangeState("Manual", 0, ComponentStateId)
      end
      if CombatItem.RegionDataType == ERegionDataType.RDT_QuestCommonData then
        CombatItem.QuestId = QuestId
      end
    end
  end
end

function BP_EMGameMode_C:OnTriggerMechanismMonsterNest(ManualId, MonsterNum, MonsterSpawnInterval, MonsterUnitIdArr, MonsterUnitType, MonsterPresetTarget, MonsterPresetTargetId)
  if self:IsSubGameMode() then
    return
  end
  for key, value in pairs(ManualId) do
    local CombatItem = self.EMGameState.ManualActiveCombat:Find(value)
    if not IsValid(CombatItem) then
      GWorld.logger.error("\229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170ManualItemId" .. ManualId .. "\230\137\190\228\184\141\229\136\176\229\174\131\228\186\178\231\136\177\231\154\132\230\156\186\229\133\179\229\174\158\228\189\147\239\188\140\228\186\178\231\136\177\231\154\132\231\173\150\229\136\146\232\131\189\230\148\185\228\184\128\228\184\139gamemode\233\133\141\231\189\174\229\144\151")
    end
    CombatItem.MonsterNum = MonsterNum
    CombatItem.MonsterSpawnInterval = MonsterSpawnInterval
    CombatItem.MonsterUnitId = MonsterUnitIdArr
    CombatItem.MonsterUnitType = MonsterUnitType
    CombatItem.MonsterPresetTarget = MonsterPresetTarget
    CombatItem.MonsterPresetTargetId = MonsterPresetTargetId
    DebugPrint("thy      OnTriggerMechanismMonsterNest")
  end
end

function BP_EMGameMode_C:GetHLODDistance(ScalabilityLevel)
  if not Const.bOverrideHLODDistance then
    return -1
  end
  local Distance = 5000
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName then
    Distance = Const.HLODDistanceAndroid[ScalabilityLevel] or Distance
  else
    Distance = Const.HLODDistanceDefault[ScalabilityLevel] or Distance
  end
  DebugPrint("BP_EMGameMode_C:GetHLODDistance PlatformName: ", PlatformName, "Distance: ", Distance)
  return Distance
end

function BP_EMGameMode_C:GetRealStreamingDistanceRatio(ScalabilityLevel, Platform)
  local Ratio = 1
  if "Android" == Platform then
    Ratio = Const.AndroidRealStreamingDistanceRatio[ScalabilityLevel] or Ratio
  elseif "IOS" == Platform then
    Ratio = Const.IOSRealStreamingDistanceRatio[ScalabilityLevel] or Ratio
  else
    Ratio = Const.PCRealStreamingDistanceRatio[ScalabilityLevel] or Ratio
  end
  return Ratio
end

function BP_EMGameMode_C:OnTriggerDestroyMonsterInMonsterNest(ManualCombatId)
  if self:IsSubGameMode() then
    return
  end
  for i = 1, ManualCombatId:Length() do
    local MonsterNest = self.EMGameState.ManualActiveCombat:Find(ManualCombatId[i])
    if not IsValid(MonsterNest) or not MonsterNest:IsCombatItemBase("MonsterNest") then
      GWorld.logger.error("\229\147\166\230\136\145\231\154\132\228\184\138\229\184\157\239\188\140\232\191\153\233\135\140\230\156\137\228\184\128\228\184\170ManualItemId" .. ManualCombatId[i] .. "\230\137\190\228\184\141\229\136\176\229\174\131\228\186\178\231\136\177\231\154\132MonsterNest\239\188\140\228\186\178\231\136\177\231\154\132\231\173\150\229\136\146\232\131\189\230\148\185\228\184\128\228\184\139gamemode\233\133\141\231\189\174\229\144\151")
    end
    if IsValid(MonsterNest) then
      MonsterNest:DestroyAllMonster()
    end
  end
end

function BP_EMGameMode_C:InitEmergencyMonster()
  self.NeedTreasureMonster = false
  self.TreasureMonsterCreated = false
  self.NeedButcherMonster = false
  self.ButcherMonsterCreated = false
  self.NeedPetMonster = false
  self.PetMonsterCreated = false
  self.TreasureMonsterSpawnInterval = 3
  self.ButcherMonsterSpawnInterval = 5
  self.EmergencyMonsterSpawnLoc = {
    RandomTime = 5,
    MaxDistance = 1000,
    MaxZDistance = 500
  }
end

function BP_EMGameMode_C:GetCreateEmergencyMonsterInterval(MonsterType)
  return self[MonsterType .. "MonsterSpawnInterval"]
end

function BP_EMGameMode_C:GetNeedCreateEmergencyMonster(MonsterType)
  return self["Need" .. MonsterType .. "Monster"] == true and self[MonsterType .. "MonsterCreated"] == false
end

function BP_EMGameMode_C:InitCreateEmergencyMonsterProb(MonsterType, Component, DungeonInfo)
  if nil == Component then
    DebugPrint("InitCreateEmergencyMonsterProb: GameMode Componet \228\184\141\229\173\152\229\156\168\239\188\129")
    return
  end
  if nil == DungeonInfo then
    DebugPrint("InitCreateEmergencyMonsterProb: DungeonInfo \228\184\141\229\173\152\229\156\168\239\188\129")
    return
  end
  local ProbabilityInfo = DungeonInfo[MonsterType .. "MonsterSpawnProbability"]
  if nil == ProbabilityInfo then
    DebugPrint("InitCreateEmergencyMonsterProb: " .. MonsterType .. "\230\128\170\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168\239\188\129")
    return
  end
  Component["Current" .. MonsterType .. "MonsterProb"] = ProbabilityInfo[1]
end

function BP_EMGameMode_C:CreateEmergencyMonsterEachWave(MonsterType, Component, DungeonInfo)
  if nil == Component then
    return
  end
  if nil == DungeonInfo then
    return
  end
  local ProbabilityInfo = DungeonInfo[MonsterType .. "MonsterSpawnProbability"]
  if nil == ProbabilityInfo then
    return
  end
  local MonsterSpawnMinWave = DungeonInfo[MonsterType .. "MonsterSpawnMinWave"]
  if nil == MonsterSpawnMinWave then
    return
  end
  if self:GetNeedCreateEmergencyMonster(MonsterType) == false then
    return
  end
  local WaveIndex = Component:GetWaveIndex()
  if WaveIndex and MonsterSpawnMinWave > WaveIndex then
    return
  end
  local ProbName = "Current" .. MonsterType .. "MonsterProb"
  if nil == Component[ProbName] then
    return
  end
  if math.random() > Component[ProbName] then
    Component[ProbName] = Component[ProbName] + ProbabilityInfo[2]
    return
  end
  self:TryCreateEmergencyMonster(MonsterType)
end

function BP_EMGameMode_C:TryCreateEmergencyMonster(MonsterType)
  local GameModeData = DataMgr[self.EMGameState.GameModeType]
  if nil == GameModeData then
    return
  end
  local DungeonData = GameModeData[self.DungeonId]
  if nil == DungeonData then
    return
  end
  local SpecialMonsterId = DungeonData[MonsterType .. "MonsterId"]
  if nil == SpecialMonsterId then
    return
  end
  local LevelLoader = self.LevelGameMode:GetLevelLoader()
  if nil == LevelLoader then
    return
  end
  local OneRandomPlayer = self:GetOneRandomPlayer()
  if not IsValid(OneRandomPlayer) then
    DebugPrint("TryCreateEmergencyMonster, \231\142\169\229\174\182\228\184\141\229\173\152\229\156\168, \230\156\172\230\172\161\228\184\141\229\136\155\229\187\186\239\188\129")
    return
  end
  local PlayerLocation = self:GetOneRandomPlayer().CurrentLocation
  local TargetLocation = UKismetMathLibrary.Vector_Zero()
  local LocationValid = false
  for i = 1, self.EmergencyMonsterSpawnLoc.RandomTime do
    if UNavigationSystemV1.K2_GetRandomLocationInNavigableRadius(self, PlayerLocation, TargetLocation, self.EmergencyMonsterSpawnLoc.MaxDistance) == true and math.abs(PlayerLocation.Z - TargetLocation.Z) <= self.EmergencyMonsterSpawnLoc.MaxZDistance and LevelLoader:GetLevelIdByLocation(PlayerLocation) == LevelLoader:GetLevelIdByLocation(TargetLocation) and UNavigationFunctionLibrary.CheckTwoPosHasPath(PlayerLocation, TargetLocation, self) == EPathConnectType.HasPath then
      LocationValid = true
      break
    end
  end
  if false == LocationValid then
    TargetLocation = self:GetMonsterCustomLoc(nil)
  end
  if false == UKismetMathLibrary.EqualEqual_VectorVector(TargetLocation, UKismetMathLibrary.Vector_Zero(), 0.001) then
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitType = "Monster"
    Context.UnitId = SpecialMonsterId
    Context.Loc = TargetLocation
    Context.IntParams:Add("Level", self:GetFixedGamemodeLevel())
    Context.MonsterSpawn = self.LevelGameMode.FixedMonsterSpawn
    self.EMGameState.EventMgr:CreateUnitNew(Context, false)
    self[MonsterType .. "MonsterCreated"] = true
  end
end

function BP_EMGameMode_C:OnRandomCreateSpawn(RandomCreateId, StateId)
end

function BP_EMGameMode_C:ShowMessage(MessageId, LastTime)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil == UIManger then
    return
  end
  if nil ~= MessageId and nil ~= LastTime then
    local GuideTextPanel = UIManger:GetUIObj("GuideTextFloat")
    if nil == GuideTextPanel then
      GuideTextPanel = UIManger:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_COMMON_TIP)
    end
    GuideTextPanel:AddGuideMessage(MessageId, LastTime)
  end
end

function BP_EMGameMode_C:HideMessage(MessageId)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local GuideTextPanel = UIManger:GetUIObj("GuideTextFloat")
  if nil == UIManger or nil == GuideTextPanel then
    return
  end
  GuideTextPanel:DeleteGuideMessage(MessageId)
end

function BP_EMGameMode_C:GetItemType(UnitId)
  if not DataMgr.Mechanism[UnitId] then
    return ""
  end
  local Type = DataMgr.Mechanism[UnitId].UnitRealType
  return Type
end

function BP_EMGameMode_C:UpdateDungeonProgress()
  self.EMGameState:SetDungeonProgress(self.EMGameState.DungeonProgress + 1)
  DebugPrint("DungeonProgress \229\137\175\230\156\172\232\189\174\230\172\161 +1\239\188\140\229\189\147\229\137\141\232\189\174\230\172\161:", self.EMGameState.DungeonProgress)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if PlayerCharacter and PlayerCharacter.BattleAchievement then
    PlayerCharacter.BattleAchievement:UpdateTopProcessedValue()
  end
  self:TriggerUploadDungeonAchievement()
  if IsDedicatedServer(self) then
    if GWorld.bDebugServer then
      return
    end
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity:UpdateDungeonProgress()
    end
  else
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:UpdateDungeonProgress()
    end
  end
end

function BP_EMGameMode_C:ExecuteLogicBetweenRounds()
  if self:IsWalnutDungeon() then
    self:TriggerShowWalnutReward()
  else
    self:ExecuteLogicStartDungeonVote()
  end
end

function BP_EMGameMode_C:ExecuteLogicStartDungeonVote()
  self:UpdateDungeonProgress()
  if self:CheckDungeonProgressIsMaxRound() then
    return
  end
  self:TriggerDungeonComponentFun("TriggerDungeonVoteBegin")
  self:SetGamePaused("GameModeState", true)
end

function BP_EMGameMode_C:ExecuteNextStepOfDungeonVote()
  if self:IsTicketDungeon() then
    self:TriggerShowTicket()
  else
    self:ExecuteNextStepOfTicket()
  end
end

function BP_EMGameMode_C:ExecuteNextStepOfTicket()
  if self:IsWalnutDungeon() then
    self:TriggerShowNextWalnut()
  else
    self:TriggerActiveGameModeState(Const.StateBattleProgress)
  end
end

function BP_EMGameMode_C:BpOnTimerEnd_OnDungeonVoteBegin()
  self.EMGameState:DealDungeonVoteResult()
end

function BP_EMGameMode_C:BpOnTimerEnd_SelectTicket()
  self.EMGameState:DealDungeonTicketResult()
end

function BP_EMGameMode_C:IsEndlessDungeon()
  if self.IsDungeonTypeEndless == nil then
    local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
    if DungeonInfo then
      self.IsDungeonTypeEndless = DungeonInfo.DungeonWinMode == CommonConst.DungeonWinMode.Endless
    end
  end
  return self.IsDungeonTypeEndless
end

function BP_EMGameMode_C:DungeonFinish_OnPlayerRealDead(AvatarEids)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInRougeLike() then
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead RougeLike")
    self:FinishRougeLike(false, AvatarEids)
  else
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead Default")
    self:TriggerPlayerFailed(AvatarEids)
  end
end

function BP_EMGameMode_C:IsDungeonInSettlement()
  if not self.EMGameState:CheckGameModeStateEnable() then
    DebugPrint("BP_EMGameMode_C:\229\137\175\230\156\172\231\138\182\230\128\129\228\184\141\230\173\163\231\161\174 \229\164\154\230\172\161\232\167\166\229\143\145\229\137\175\230\156\172\231\187\147\231\174\151")
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() and self.LevelGameMode.IsInHardBossSettlement then
    DebugPrint("BP_EMGameMode_C:\230\173\163\229\164\132\228\186\142mycs \229\164\154\230\172\161\232\167\166\229\143\145\229\137\175\230\156\172\231\187\147\231\174\151")
    return true
  end
  return false
end

function BP_EMGameMode_C:TriggerDungeonWin()
  DebugPrint("BP_EMGameMode_C:TriggerDungeonWin \229\137\175\230\156\172\232\131\156\229\136\169")
  if self:IsDungeonInSettlement() then
    return
  end
  self.LevelGameMode:TriggerDungeFinish(true)
end

function BP_EMGameMode_C:TriggerDungeonFailed()
  DebugPrint("BP_EMGameMode_C:TriggerDungeonFailed \229\137\175\230\156\172\229\164\177\232\180\165")
  if self:IsDungeonInSettlement() then
    return
  end
  self.LevelGameMode:TriggerDungeFinish(false)
end

function BP_EMGameMode_C:TriggerExitDungeon(IsWin)
  DebugPrint("BP_EMGameMode_C:TriggerExitDungeon: Exit Battle + HardBoss", IsWin)
  if self:IsDungeonInSettlement() then
    return
  end
  self.LevelGameMode:TriggerDungeFinish(IsWin)
end

function BP_EMGameMode_C:TriggerPlayerWin(AvatarEids, PlayerEids)
  DebugPrint("BP_EMGameMode_C:TriggerPlayerWin \231\142\169\229\174\182\230\136\144\229\138\159 \230\146\164\231\166\187")
  if self:IsDungeonInSettlement() then
    return
  end
  if IsStandAlone(self) then
    self:TriggerBattleAchievementUploadOnDungeonEnd(true)
    self:TriggerDungeonOnEnd(true)
  end
  self:TriggerUploadDungeonAchievement(PlayerEids)
  self.LevelGameMode:TriggerPlayerFinish(true, AvatarEids)
end

function BP_EMGameMode_C:TriggerPlayerFailed(AvatarEids)
  DebugPrint("BP_EMGameMode_C:TriggerPlayerFailed \231\142\169\229\174\182\229\164\177\232\180\165 \230\146\164\231\166\187")
  if self:IsDungeonInSettlement() then
    return
  end
  if IsStandAlone(self) then
    self:TriggerBattleAchievementUploadOnDungeonEnd(false)
    self:TriggerDungeonOnEnd(false)
  end
  self.LevelGameMode:TriggerPlayerFinish(false, AvatarEids)
end

function BP_EMGameMode_C:TriggerDungeFinish(IsWin)
  GWorld:DSBLog("Info", "TriggerDungeFinish IsWin:" .. tostring(IsWin), "GameMode")
  self:TriggerDungeonOnEnd(IsWin)
  if IsWin and self:IsWalnutDungeon() and not self:IsEndlessDungeon() then
    self:ExecuteWalutLogicOnEnd()
  else
    self:TriggerRealDungeFinish(IsWin)
  end
end

function BP_EMGameMode_C:TriggerRealDungeFinish(IsWin)
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if IsWin then
    if DungeonInfo and DungeonInfo.DungeonWinMode == CommonConst.DungeonWinMode.Single then
      self:UpdateDungeonProgress()
    end
    if DungeonInfo and DungeonInfo.DungeonWinMode == CommonConst.DungeonWinMode.Disable then
      local RewardLevel = self:GetDungeonComponent().RewardLevel
      if RewardLevel then
        for i = 1, RewardLevel do
          self:UpdateDungeonProgress()
        end
      end
    end
    self:TriggerUploadDungeonAchievement()
  end
  self:TriggerBattleAchievementUploadOnDungeonEnd(IsWin)
  self:TriggerPlayerFinish(IsWin)
end

function BP_EMGameMode_C:TriggerPlayerFinish(IsWin, AvatarEids)
  GWorld:DSBLog("Info", "TriggerPlayerFinish IsWin:" .. tostring(IsWin), "GameMode")
  DebugPrint("TriggerPlayerFinish \231\142\169\229\174\182\231\187\147\231\174\151\239\188\140\231\187\147\231\174\151\231\138\182\230\128\129\239\188\154", IsWin)
  if IsStandAlone(self) or MiscUtils.IsListenServer(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      print(_G.LogTag, "CollectAlertBaseInfo Server TriggerPlayerFinish", IsWin, self.DungeonId)
      self:TriggerPlayerFinishDungeon(IsWin)
      Avatar:BattleFinish(IsWin)
    end
    self:NotifyClientGameEnd(IsWin, AvatarEids)
    self:OnPlayersDungeonEnd(AvatarEids)
  elseif IsDedicatedServer(self) then
    print(_G.LogTag, "Server TriggerPlayerFinish", IsWin)
    if GWorld.bDebugServer then
      return
    end
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity:BattleFinish(IsWin, AvatarEids)
    end
  end
end

function BP_EMGameMode_C:SendTimeDistCheatalert(PlayerChar, DungeonSpendTime, DungeonMoveDistance, MonitorType, SubId, DisThresh, TimeThresh)
  local AlertString = "\230\163\128\230\181\139\229\136\176\233\157\158\230\179\149\228\191\161\230\129\175:  "
  local BaseAlertInfo = self:CollectAlertBaseInfo(PlayerChar)
  if BaseAlertInfo.DungeonId then
    AlertString = AlertString .. "\229\137\175\230\156\172ID: " .. BaseAlertInfo.DungeonId .. "  "
  end
  if BaseAlertInfo.DungeonLevel then
    AlertString = AlertString .. "\229\137\175\230\156\172\231\173\137\231\186\167: " .. BaseAlertInfo.DungeonLevel .. "  "
  end
  if BaseAlertInfo.CharLevel then
    AlertString = AlertString .. "\232\167\146\232\137\178\231\173\137\231\186\167: " .. BaseAlertInfo.CharLevel .. "  "
  end
  if MonitorType then
    AlertString = AlertString .. "MonitorType: " .. MonitorType .. "  "
  end
  if SubId then
    AlertString = AlertString .. "SubID: " .. SubId .. "  "
  end
  if DungeonSpendTime then
    AlertString = AlertString .. "\229\137\175\230\156\172\232\128\151\230\151\182: " .. DungeonSpendTime .. "  "
  end
  if TimeThresh then
    AlertString = AlertString .. "\230\151\182\233\151\180\233\152\136\229\128\188: " .. TimeThresh .. "  "
  end
  if DungeonMoveDistance then
    AlertString = AlertString .. "\228\184\187\230\142\167\232\167\146\232\137\178\231\167\187\229\138\168\232\183\157\231\166\187: " .. DungeonMoveDistance .. "  "
  end
  if DisThresh then
    AlertString = AlertString .. "\232\183\157\231\166\187\233\152\136\229\128\188: " .. DisThresh .. "  "
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  print(_G.LogTag, "SendTimeDistCheatalert", AlertString)
  Avatar:SendToFeishuForCombatMonitor(AlertString)
end

function BP_EMGameMode_C:CollectAlertBaseInfo(PlayerChar)
  local AlertInfo = {}
  if not self.LevelGameMode then
    print(_G.LogTag, "CollectAlertBaseInfo LevelGameMode is nil")
    return AlertInfo
  end
  AlertInfo.DungeonId = self.LevelGameMode.DungeonId
  local DungeonInfo = DataMgr.Dungeon[AlertInfo.DungeonId]
  if not DungeonInfo then
    print(_G.LogTag, "CollectAlertBaseInfo DungeonInfo is nil", AlertInfo.DungeonId, self.DungeonId)
    return AlertInfo
  end
  AlertInfo.DungeonLevel = DungeonInfo.DungeonLevel or 1
  AlertInfo.CharLevel = PlayerChar:GetAttr("Level") or 0
  print(_G.LogTag, "CollectAlertBaseInfo", AlertInfo.DungeonId, AlertInfo.DungeonLevel, AlertInfo.CharLevel, PlayerChar:GetAttr("Level"))
  return AlertInfo
end

function BP_EMGameMode_C:NotifyClientFightAttributeData(PlayerCharacter)
  if not IsDedicatedServer(self) then
    return
  end
  local FightAttributeSet = PlayerCharacter and PlayerCharacter:GetFightAttributeSet()
  if not FightAttributeSet then
    return
  end
  for i = 1, self:GetPlayerNum() do
    local ControllerIndex = i - 1
    local Controller = UE4.UGameplayStatics.GetPlayerController(self, ControllerIndex)
    local Teammate = Controller:GetMyPawn()
    local TeammateFightAttributeSet = Teammate:GetFightAttributeSet()
    if Teammate and TeammateFightAttributeSet and Teammate.Eid ~= PlayerCharacter.Eid then
      local TeammateInfo = FTeammateAttrInfo()
      TeammateInfo.TeammateEid = Teammate.Eid
      TeammateInfo.FinalDamage = TeammateFightAttributeSet.FightAttrInfo.FinalDamage
      TeammateInfo.TotalKillCount = TeammateFightAttributeSet.FightAttrInfo.TotalKillCount
      TeammateInfo.TakedDamage = TeammateFightAttributeSet.FightAttrInfo.TakedDamage
      TeammateInfo.GiveHealing = TeammateFightAttributeSet.FightAttrInfo.GiveHealing
      TeammateInfo.MaxDamage = TeammateFightAttributeSet.FightAttrInfo.MaxDamage
      TeammateInfo.BreakableItemCount = TeammateFightAttributeSet.FightAttrInfo.BreakableItemCount
      TeammateInfo.MaxComboCount = TeammateFightAttributeSet.FightAttrInfo.MaxComboCount
      if TeammateFightAttributeSet.FightAttrInfo.PhantomAttrInfos:Num() > 0 then
        TeammateInfo.PhantomAttrInfo = TeammateFightAttributeSet.FightAttrInfo.PhantomAttrInfos[1]
      end
      FightAttributeSet.FightAttrInfo.TeammateDamageInfos:Add(TeammateInfo)
    end
  end
  FightAttributeSet:RefreshFightAttributeData(FightAttributeSet.FightAttrInfo)
end

function BP_EMGameMode_C:NotifyClientGameEnd(IsWin, AvatarEids)
  if not AvatarEids or 0 == #AvatarEids then
    for i = 1, self:GetPlayerNum() do
      local ControllerIndex = i - 1
      local Controller = UE4.UGameplayStatics.GetPlayerController(self, ControllerIndex)
      if not Controller then
        error("Controller is Not Exist")
      end
      local Avatar = GWorld:GetAvatar()
      if IsWin and (not Avatar or not Avatar:IsInHardBoss()) then
        self:UpdatePlayerCharacterEndPointInfo(ControllerIndex, Controller)
        DebugPrint("StartAndEndPoint AllSuccess UpdatePlayerCharacterEndPointInfo")
      end
      local MyPawn = Controller:GetMyPawn()
      if IsStandAlone(self) then
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd_Lua")
        Controller:NotifyClientGameEnd_Lua(IsWin, self:GetScenePlayersInfo(MyPawn))
      else
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd")
        self:NotifyClientFightAttributeData(MyPawn)
        Controller:NotifyClientGameEnd(IsWin, self:GetScenePlayersInfo(MyPawn))
      end
    end
  else
    local function EndAvatar(AvatarEid)
      local Controller = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(self, AvatarEid)
      
      if not Controller then
        DebugPrint("Controller is Not Exist")
        return
      end
      if IsWin then
        local ControllerIndex = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(self, Controller)
        self:UpdatePlayerCharacterEndPointInfo(ControllerIndex, Controller)
        DebugPrint("StartAndEndPoint PartSuccess UpdatePlayerCharacterEndPointInfo")
      end
      DebugPrint("StartAndEndPoint PartSuccess NotifyClientGameEnd")
      local MyPawn = Controller:GetMyPawn()
      self:NotifyClientFightAttributeData(MyPawn)
      Controller:NotifyClientGameEnd(IsWin, self:GetScenePlayersInfo(MyPawn))
    end
    
    for _, AvatarEid in ipairs(AvatarEids) do
      EndAvatar(AvatarEid)
    end
  end
end

function BP_EMGameMode_C:SimplifyInfoForInit(InfoForInit)
  if nil == InfoForInit then
    DebugPrint("Error SimplifyInfoForInit InfoForInit is nil")
    return InfoForInit
  end
  InfoForInit.FromOtherWorld = true
  return InfoForInit
end

function BP_EMGameMode_C:GetScenePlayersInfo(MainPlayer)
  local PlayersInfo = {}
  if self.EMGameState.GameModeType == "Party" then
    local Ordinal = self.EMGameState.PartyPlayerOrdinal
    for i = 1, Ordinal:Length() do
      local TargetEid = Ordinal[i]
      local TargetCharacter = Battle(self):GetEntity(TargetEid)
      if TargetCharacter then
        local bIsPhantom = TargetCharacter:IsPhantom()
        PlayersInfo[#PlayersInfo + 1] = self:SimplifyInfoForInit(TargetCharacter.InfoForInit)
        PlayersInfo[#PlayersInfo].IsDungeonEnd = true
        PlayersInfo[#PlayersInfo].IsPhantom = bIsPhantom
        local PlayerWeapon = TargetCharacter:GetCurrentWeapon()
        if PlayerWeapon then
          PlayersInfo[#PlayersInfo].CurrentWeaponType = PlayerWeapon:GetWeaponType()
          PlayersInfo[#PlayersInfo].CurrentWeaponMeleeOrRanged = PlayerWeapon:GetWeaponMeleeOrRanged()
        end
        if MainPlayer.Eid == TargetEid then
          PlayersInfo[#PlayersInfo].IsMainPlayer = true
        else
          PlayersInfo[#PlayersInfo].IsMainPlayer = false
        end
      end
    end
  else
    PlayersInfo[1] = self:SimplifyInfoForInit(MainPlayer.InfoForInit)
    PlayersInfo[1].IsDungeonEnd = true
    PlayersInfo[1].IsMainPlayer = true
    PlayersInfo[1].IsDead = MainPlayer:IsDead()
    local MainPlayerWeapon = MainPlayer:GetCurrentWeapon()
    if MainPlayerWeapon then
      PlayersInfo[1].CurrentWeaponType = MainPlayerWeapon:GetWeaponType()
      PlayersInfo[1].CurrentWeaponMeleeOrRanged = MainPlayerWeapon:GetWeaponMeleeOrRanged()
    end
    print(_G.LogTag, "GetScenePlayersInfo", MainPlayer:GetAllTeammates():Length())
    for _, v in pairs(MainPlayer:GetAllTeammates()) do
      if v ~= MainPlayer then
        local InitInfo = v.InfoForInit
        if nil == InitInfo then
          local Context = v.CreateUnitContextCopy
          InitInfo = Context:GetLuaTable("AvatarInfo")
        end
        local bIsPhantom = v:IsPhantom()
        PlayersInfo[#PlayersInfo + 1] = self:SimplifyInfoForInit(InitInfo)
        PlayersInfo[#PlayersInfo].IsDungeonEnd = true
        PlayersInfo[#PlayersInfo].IsPhantom = bIsPhantom
        PlayersInfo[#PlayersInfo].IsMainPlayer = false
        PlayersInfo[#PlayersInfo].IsDead = v:IsDead()
        local CurrentPlayerWeapon = v:GetCurrentWeapon()
        if CurrentPlayerWeapon then
          PlayersInfo[#PlayersInfo].CurrentWeaponType = CurrentPlayerWeapon:GetWeaponType()
          PlayersInfo[#PlayersInfo].CurrentWeaponMeleeOrRanged = CurrentPlayerWeapon:GetWeaponMeleeOrRanged()
        end
      end
    end
  end
  local MsgStr = msgpack.pack(PlayersInfo)
  local RewardsMessage = FMessage()
  RewardsMessage:SetBytes(MsgStr, #MsgStr)
  return RewardsMessage
end

function BP_EMGameMode_C:TriggerEnterEndPlayer(AvatarEidStr)
  local DSEntity = GWorld:GetDSEntity()
  assert(DSEntity)
  local LeaveResult = rawget(DSEntity.HasLeaveAvatars, AvatarEidStr)
  assert(nil ~= LeaveResult)
  self:NotifyClientGameEnd(LeaveResult, {AvatarEidStr})
end

function BP_EMGameMode_C:OnMiniGameSuccess(MiniGameType, CreatorId)
  self.Overridden.OnMiniGameSuccess(self, MiniGameType, CreatorId)
  self:TriggerDungeonComponentFun("OnMiniGameSuccess", MiniGameType, CreatorId)
end

function BP_EMGameMode_C:OnDefenceCoreActive(DefenceCore)
  self.Overridden.OnDefenceCoreActive(self, DefenceCore)
  self:TriggerDungeonComponentFun("OnDefenceCoreActive", DefenceCore)
end

function BP_EMGameMode_C:OnMiniGameFail(MiniGameType, CreatorId)
  if not self:IsSubGameMode() then
    if not self.MiniGameFailedTime[MiniGameType] then
      self.MiniGameFailedTime[MiniGameType] = 0
    end
    self.MiniGameFailedTime[MiniGameType] = self.MiniGameFailedTime[MiniGameType] + 1
  end
  self.Overridden.OnMiniGameFail(self, MiniGameType, CreatorId)
end

function BP_EMGameMode_C:OnDefenceCoreDead(Eid)
  self.Overridden.OnDefenceCoreDead(self, Eid)
end

function BP_EMGameMode_C:ChangeFallTriggersActive(FallTriggerIds, Active)
  for i, FallTriggerId in pairs(FallTriggerIds) do
    for j, FallTrigger in pairs(self.EMGameState.FallTriggersArray) do
      if FallTrigger.FallTriggerId == FallTriggerId then
        FallTrigger.Active = Active
      end
    end
  end
end

function BP_EMGameMode_C:AsyncLoadTargetLevel(LoadLevel, NewTargetPointName)
  local function Callback()
    LoadLevel:AsyncPrintHello()
  end
  
  local NewTargetPoint = self.EMGameState:GetTargetPoint(NewTargetPointName)
  if not IsValid(NewTargetPoint) then
    self:AddTimer(0.1, Callback)
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not self:GetLevelLoader() then
    self:AddTimer(0.1, Callback)
    return
  end
  local TargetLevelId = self:GetLevelLoader():GetLevelIdByLocation(NewTargetPoint:K2_GetActorLocation())
  local CurrentLevelId = self:GetLevelLoader():GetLevelIdByLocation(PlayerCharacter:K2_GetActorLocation())
  if not (TargetLevelId and CurrentLevelId) or TargetLevelId == CurrentLevelId then
    self:AddTimer(0.1, Callback)
    return
  end
  local LevelLoader = self:GetLevelLoader()
  
  local function LoadLevelCallBack()
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    GameInstance:CloseLoadingUI()
    LoadLevel:AsyncPrintHello()
    if LevelLoader then
      LevelLoader:RemoveArtLevelLoadedCompleteCallback(TargetLevelId)
    end
  end
  
  LevelLoader:BindArtLevelLoadedCompleteCallback(TargetLevelId, LoadLevelCallBack)
  LevelLoader:LoadArtLevel(TargetLevelId)
end

function BP_EMGameMode_C:SetActorLocationAndRotationByTransform(UnitId, Transform, bIsForceIdle, bDoCorrect)
  bDoCorrect = bDoCorrect or false
  local PlayerCharacter, FinalLocation
  if 0 == UnitId then
    PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  else
    PlayerCharacter = self.EMGameState.NpcCharacterMap:FindRef(UnitId)
  end
  if not IsValid(PlayerCharacter) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local TargetPointLoc = Transform.Translation
  local TargetPointRot = Transform.Rotation:ToRotator()
  FinalLocation = TargetPointLoc
  if bDoCorrect then
    local CapsuleHalfHeight = PlayerCharacter.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local CapsuleRadius = PlayerCharacter.CapsuleComponent:GetScaledCapsuleRadius()
    local HitResult = FHitResult()
    local LineHitResult = FHitResult()
    local StartPos = TargetPointLoc + FVector(0, 0, CapsuleHalfHeight)
    local EndPos = TargetPointLoc + FVector(0, 0, -2 * CapsuleHalfHeight)
    local bHit = UE4.UKismetSystemLibrary.CapsuleTraceSingle(self, StartPos, EndPos, CapsuleRadius, CapsuleHalfHeight, ETraceTypeQuery.TraceScene, false, nil, 0, HitResult, true)
    if bHit then
      local tmp = FVector(HitResult.Location.X, HitResult.Location.Y, HitResult.ImpactPoint.Z + CapsuleHalfHeight + 2)
      FinalLocation = tmp
    end
  end
  if bIsForceIdle and not PlayerCharacter:IsDead() then
    self:SetPlayerCharacterForceIdle(PlayerCharacter)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:GetLevelLoader() then
    local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(TargetPointLoc)
    local CurrentLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(PlayerCharacter:K2_GetActorLocation())
    PlayerCharacter:K2_SetActorLocationAndRotation(FinalLocation, TargetPointRot, false, nil, false)
    if TargetLevelId and CurrentLevelId and CurrentLevelId ~= TargetLevelId then
      GameMode:GetLevelLoader():UnloadArtLevel(CurrentLevelId)
    end
  else
    PlayerCharacter:K2_SetActorLocationAndRotation(FinalLocation, TargetPointRot, false, nil, false)
  end
  return true
end

function BP_EMGameMode_C:EMSetActorLocationAndRotation(UnitId, NewTargetPointName, bIsForceIdle, bDoCorrect)
  bDoCorrect = bDoCorrect or false
  local PlayerCharacter, NewTargetPoint, FinalLocation
  print(_G.LogTag, " ZJT_ EMSetActorLocationAndRotation ", UnitId, NewTargetPointName, bIsForceIdle)
  if "" == NewTargetPointName then
    return false
  end
  NewTargetPoint = self.EMGameState:GetTargetPoint(NewTargetPointName)
  if not NewTargetPoint then
    return false
  end
  if 0 == UnitId then
    PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  else
    PlayerCharacter = self.EMGameState.NpcCharacterMap:FindRef(UnitId)
  end
  if not IsValid(PlayerCharacter) or not IsValid(NewTargetPoint) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local TargetPointLoc = NewTargetPoint:K2_GetActorLocation()
  FinalLocation = TargetPointLoc
  if bDoCorrect then
    local CapsuleHalfHeight = PlayerCharacter.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local CapsuleRadius = PlayerCharacter.CapsuleComponent:GetScaledCapsuleRadius()
    local HitResult = FHitResult()
    local LineHitResult = FHitResult()
    local StartPos = TargetPointLoc + FVector(0, 0, CapsuleHalfHeight)
    local EndPos = TargetPointLoc + FVector(0, 0, -2 * CapsuleHalfHeight)
    local bHit = UE4.UKismetSystemLibrary.CapsuleTraceSingle(self, StartPos, EndPos, CapsuleRadius, CapsuleHalfHeight, ETraceTypeQuery.TraceScene, false, nil, 0, HitResult, true)
    if bHit then
      local tmp = FVector(HitResult.Location.X, HitResult.Location.Y, HitResult.ImpactPoint.Z + CapsuleHalfHeight + 2)
      FinalLocation = tmp
    end
  end
  if bIsForceIdle and not PlayerCharacter:IsDead() then
    self:SetPlayerCharacterForceIdle(PlayerCharacter)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:GetLevelLoader() then
    local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(NewTargetPoint:K2_GetActorLocation())
    local CurrentLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(PlayerCharacter:K2_GetActorLocation())
    PlayerCharacter:K2_SetActorLocationAndRotation(FinalLocation, NewTargetPoint:K2_GetActorRotation(), false, nil, false)
    if TargetLevelId and CurrentLevelId and CurrentLevelId ~= TargetLevelId then
      GameMode:GetLevelLoader():UnloadArtLevel(CurrentLevelId)
    end
  else
    PlayerCharacter:K2_SetActorLocationAndRotation(FinalLocation, NewTargetPoint:K2_GetActorRotation(), false, nil, false)
  end
  return true
end

function BP_EMGameMode_C:SetPlayerCharacterForceIdle(PlayerCharacter)
  PlayerCharacter:ResetIdle()
  PlayerCharacter:DisableInput(UE4.UGameplayStatics.GetPlayerController(self, 0))
  
  local function EnablePlayerInput()
    PlayerCharacter:EnableInput(UE4.UGameplayStatics.GetPlayerController(self, 0))
  end
  
  self:AddTimer(0.2, EnablePlayerInput)
end

function BP_EMGameMode_C:GetRespawnRuleName(Target)
  DebugPrint("Tianyi@ GetRespawnRuleName begin")
  local RespawnRuleName = "Default"
  local CurrentDungeonId = self.DunegeonId
  if not CurrentDungeonId then
    DebugPrint("Tianyi@ GetRespawnRuleName: CurrentDungeonId is nil, Try to get it from gameinstance")
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    CurrentDungeonId = GameInstance:GetCurrentDungeonId()
  end
  if IsDedicatedServer(self) then
    local DungeonData = DataMgr.Dungeon[CurrentDungeonId]
    if DungeonData and DungeonData.RespawnRule then
      RespawnRuleName = DungeonData.RespawnRule
    end
    return RespawnRuleName
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Tianyi@ GetRespawnRuleName: Avatar is nil")
    return RespawnRuleName
  end
  if Target and Target.IsHostage then
    RespawnRuleName = "Hostage"
    return RespawnRuleName
  end
  if Avatar:IsInDungeon2() then
    if not CurrentDungeonId then
      DebugPrint("GetRespawnRuleName: Tianyi@ DungeonId is nil")
      return RespawnRuleName
    end
    local DungeonData = DataMgr.Dungeon[CurrentDungeonId]
    if DungeonData and DungeonData.RespawnRule then
      RespawnRuleName = DungeonData.RespawnRule
    end
  elseif Avatar:IsInBigWorld() then
    DebugPrint("Tianyi@ GetRespawnRuleName: Player in bigworld")
    if Avatar:IsInHardBoss() then
      RespawnRuleName = "HardBoss"
    else
      RespawnRuleName = "CommonRegion"
    end
  end
  DebugPrint("Tianyi@ GetRespawnRuleName: RespawnRuleName = " .. RespawnRuleName)
  return RespawnRuleName
end

function BP_EMGameMode_C:GetRespawnRule(Target, TargetRespawnRule)
  local RespawnRule
  if TargetRespawnRule then
    RespawnRule = DataMgr.RespawnRule[TargetRespawnRule]
    return RespawnRule or DataMgr.RespawnRule.CommonSolo
  end
  return DataMgr.RespawnRule[self:GetRespawnRuleName(Target)]
end

function BP_EMGameMode_C:InitEntityRecoveryData(Entity)
  Entity:ClearSkillRecoverTargets()
  Entity:SetAttr("AdditionalRecoverTime", 0)
  if Entity:IsPlayer() then
    self:InitPlayerReocveryData(Entity)
  elseif Entity:IsPhantom() then
    self:InitPhantomRecoveryData(Entity)
  end
end

function BP_EMGameMode_C:CheckEntityCanRecover(Entity)
  if Entity:IsPlayer() then
    return self:CheckPlayerCanRecover(Entity)
  elseif Entity:IsPhantom() then
    return self:CheckPhantomCanRecover(Entity)
  elseif Entity:IsMonster() then
    return self:CheckMonsterCanRecover(Entity)
  else
    return true
  end
end

function BP_EMGameMode_C:CheckPlayerCanRecover(Player)
  local RecoveryCount = Player:GetRecoveryCount()
  local RecoveryMaxCount = Player:GetRecoveryMaxCount()
  return RecoveryMaxCount < 0 or RecoveryCount < RecoveryMaxCount
end

function BP_EMGameMode_C:CheckPhantomCanRecover(Phantom)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsRealInBigWorld() and not Avatar:IsInHardBoss() then
    return false
  end
  local RecoveryCount = Phantom:GetRecoveryCount()
  local RecoveryMaxCount = Phantom:GetRecoveryMaxCount()
  return RecoveryMaxCount < 0 or RecoveryCount < RecoveryMaxCount
end

function BP_EMGameMode_C:CheckMonsterCanRecover(Monster)
  return true
end

function BP_EMGameMode_C:TriggerGenerateReward(RewardId, Reason, Transform, ExtraInfo)
  if RewardId.ToTable then
    RewardId = RewardId:ToTable()
  end
  self.EMGameState.EventMgr:TriggerGenerateReward(RewardId, Reason, Transform, ExtraInfo)
end

function BP_EMGameMode_C:ActiveMonsterBuff(BuffList, BuffNum)
  if not self.MonsterAddBuffRule then
    self.MonsterAddBuffRule = {}
  end
  table.insert(self.MonsterAddBuffRule, {BuffList = BuffList, BuffNum = BuffNum})
end

function BP_EMGameMode_C:DestroyMonsterBuff()
  self.MonsterAddBuffRule = nil
end

function BP_EMGameMode_C:TriggerMechanismFieldCreature(TrapArrayId, Grade, TrapState, TrapType, Scale)
  for i = 1, TrapArrayId:Length() do
    local ManualItemId = TrapArrayId:GetRef(i)
    local FieldCreatureMechan = self.EMGameState.FeildCreatureMap:FindRef(ManualItemId)
    if not FieldCreatureMechan then
      print(_G.LogTag, "ZJT_ TriggerMechanismFieldCreature ", ManualItemId, Grade, TrapState, TrapType, Scale)
    else
      FieldCreatureMechan:SetFieldCreateMechanismInfo(TrapState, TrapType, Scale, Grade)
    end
  end
end

function BP_EMGameMode_C:HideUIInScreen(UIPath, IsHide)
  if not self.EMGameState then
    return
  end
  self.EMGameState:HideUIInScreen(UIPath, IsHide)
end

function BP_EMGameMode_C:SetContinuedPCGuideVisibility(ActionName, IsHide)
  if not self.EMGameState then
    return
  end
  self.EMGameState:RealSetContinuedPCGuideVisibility(ActionName, IsHide)
end

function BP_EMGameMode_C:UpdatePlayerCharacterEndPointInfo(PlayerControllerIndex, PlayerController)
  PlayerController = PlayerController or UE4.UGameplayStatics.GetPlayerController(PlayerControllerIndex)
  local PlayerCharacter = PlayerController:GetMyPawn()
  local EndPointActor = self.EMGameState.EndPointActor
  if not IsValid(EndPointActor) then
    DebugPrint("StartAndEndPoint No End EndPoint")
    PlayerCharacter:SetEndPointInfo(true, nil, nil)
    return
  end
  local EndPointTransform = EndPointActor:GetTransform(PlayerControllerIndex)
  local EndPointLocation = EndPointTransform.Translation
  local EndPointRotation = FRotator(EndPointTransform.Rotation)
  local Dis = (PlayerCharacter:K2_GetActorLocation() - EndPointLocation):Size()
  if Dis <= 1000 then
    PlayerCharacter:SetEndPointInfo(true, EndPointLocation, EndPointRotation)
  else
    PlayerCharacter:SetEndPointInfo(false, EndPointLocation, EndPointRotation)
  end
end

function BP_EMGameMode_C:AddPickUpSuccessCallback(ItemId, CallbackKey, Callback)
  if not self.PickUpSuccessCallback then
    self.PickUpSuccessCallback = {}
  end
  if not self.PickUpSuccessCallback[ItemId] then
    self.PickUpSuccessCallback[ItemId] = {}
  end
  self.PickUpSuccessCallback[ItemId][CallbackKey] = Callback
end

function BP_EMGameMode_C:RemovePickUpSuccessCallback(ItemId, CallbackKey)
  if self.PickUpSuccessCallback and self.PickUpSuccessCallback[ItemId] then
    self.PickUpSuccessCallback[ItemId][CallbackKey] = nil
  end
end

function BP_EMGameMode_C:AddMiniGameSuccessCallback(DisplayName, Callback)
  if not self.MiniGameSuccessCallback then
    self.MiniGameSuccessCallback = {}
  end
  self.MiniGameSuccessCallback[DisplayName] = Callback
end

function BP_EMGameMode_C:RemoveMiniGameSuccessCallback(DisplayName, Callback)
  if self.MiniGameSuccessCallback then
    self.MiniGameSuccessCallback[DisplayName] = nil
  end
end

function BP_EMGameMode_C:RunStory(StoryPath, QuestId, EndCallback, StopCallback)
  DebugPrint("StoryPathStoryPathStoryPathStoryPath", StoryPath)
  GWorld.StoryMgr:RunStory(StoryPath, QuestId, nil, EndCallback, StopCallback)
end

function BP_EMGameMode_C:PickUpForAllPlayers(FunctionName, PickUpCount, UseParam, UnitId, Transform, AvatarEid, bExtra)
  for i = 0, self:GetPlayerNum() - 1 do
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, i)
    local PlayerCharacter = PlayerController:GetMyPawn()
    PlayerCharacter[FunctionName](PlayerCharacter, PickUpCount, UseParam, UnitId, Transform, AvatarEid, bExtra)
  end
end

function BP_EMGameMode_C:BlockEntrance()
  if not IsDedicatedServer(self) then
    return
  end
  self.bBlock = true
  if GWorld.bDebugServer then
    return
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:BlockEntrance()
  end
end

function BP_EMGameMode_C:CollectGameModeTimerHandle(Handle)
  if not self.GameModeTimerSet then
    self.GameModeTimerSet = UE4.TSet(UE4.FTimerHandle())
  end
  self.GameModeTimerSet:Add(Handle)
end

function BP_EMGameMode_C:PauseGameModeTimer()
  self.CurPauseGameModeTimerMap = {}
  if self.GameModeTimerSet and self.GameModeTimerSet:Num() > 0 then
    local DelArray = {}
    local TmpArray = self.GameModeTimerSet:ToArray()
    for i = 1, TmpArray:Num() do
      local Handle = TmpArray[i]
      if not UE4.UKismetSystemLibrary.K2_TimerExistsHandle(self, Handle) then
        table.insert(DelArray, Handle)
      else
        self.CurPauseGameModeTimerMap[Handle] = true
        UE4.UKismetSystemLibrary.K2_PauseTimerHandle(self, Handle)
        UE4.UKismetSystemLibrary.K2_TimerExistsHandle(self, Handle)
      end
    end
    for i = 1, #DelArray do
      self.GameModeTimerSet:Remove(DelArray[i])
    end
  end
end

function BP_EMGameMode_C:UnPauseGameModeTimer()
  if self.CurPauseGameModeTimerMap == nil or IsEmptyTable(self.CurPauseGameModeTimerMap) then
    return
  end
  for Handle, _ in pairs(self.CurPauseGameModeTimerMap) do
    if UE4.UKismetSystemLibrary.K2_TimerExistsHandle(self, Handle) then
      UE4.UKismetSystemLibrary.K2_UnPauseTimerHandle(self, Handle)
    end
  end
  self.CurPauseGameModeTimerMap = {}
end

function BP_EMGameMode_C:GetActor2ManualId(ManualItemId)
  local ManualItemActor = self.LevelGameMode.BPBornRegionActor:FindRef(ManualItemId)
  return ManualItemActor
end

function BP_EMGameMode_C:TriggerMechanismWindCreator(ManualArrayId, Grade, IsActive)
  for i = 1, ManualArrayId:Length() do
    local ManualItemId = ManualArrayId:GetRef(i)
    local WindCreatorMechanism = self.LevelGameMode.BPBornRegionActor:FindRef(ManualItemId)
    if WindCreatorMechanism then
      WindCreatorMechanism:SetWindCreator(Grade, IsActive)
    else
      print(_G.LogTag, "ZJT_ TriggerMechanismWindCreator ", Grade, IsActive)
    end
  end
end

function BP_EMGameMode_C:EMActorDestroy_Lua(Actor, DestroyReason)
  Actor:EMActorDestroy(DestroyReason)
end

function BP_EMGameMode_C:RegionTrytWCRegisterInfo(Info, RealActor)
  if self:IsInDungeon() then
    return
  end
  local WCSubSystem = self:GetWCSubSystem()
  if not IsValid(WCSubSystem) then
    return
  end
  WCSubSystem:RegisterEntryToWorldComposition(RealActor, Info.Creator)
end

function BP_EMGameMode_C:GetMonsterCustomLoc(Monster)
  if self:IsInRegion() then
    DebugPrint("Error!!! \229\140\186\229\159\159\229\135\186\231\142\176Boss\232\162\171\229\141\184\232\189\189\231\158\172\231\167\187\239\188\129\232\175\183\230\163\128\230\159\165\239\188\129 ViewLocation : ", URuntimeCommonFunctionLibrary.GetViewPortLocation(Monster))
    return FVector(0, 0, 0)
  end
  local PlayerTarget
  if IsValid(Monster) and IsValid(Monster.BBTarget) then
    PlayerTarget = Monster.BBTarget
  else
    PlayerTarget = self:GetOneRandomPlayer()
  end
  if self.TacMapManager then
    local PresetTargetsInfo = {}
    PresetTargetsInfo[PlayerTarget] = 1
    local ResLocs = self.TacMapManager:GetSpawnPoints({
      PresetTargets = PresetTargetsInfo,
      Mode = "Player",
      UnitSpawnRadiusMin = 1000,
      UnitSpawnRadiusMax = 5000,
      RandomSpawn = true,
      FilterReachable = true
    })
    return ResLocs[PlayerTarget][1]
  else
    local CheckInfo = FPointCheckInfo()
    CheckInfo:SetCheckInfo(1000, 5000, true, true, true)
    local ResLoc = self.FixedMonsterSpawn:GetSpawnPointLocations(PlayerTarget, CheckInfo)
    return ResLoc[1]
  end
end

function BP_EMGameMode_C:UploadTargetValues(TargetValues, AvatarEid)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:TriggerTarget(TargetValues)
    return
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:TriggerTarget(TargetValues, AvatarEid)
  end
end

function BP_EMGameMode_C:OnAvatarInfoInitDS()
  self:InitDungeonRandomEvent()
end

function BP_EMGameMode_C:GetAvatarInfo(Eid)
  if IsStandAlone(self) or MiscUtils.IsListenServer(self) then
    return GWorld:GetAvatar()
  elseif IsDedicatedServer(self) then
    if Eid then
      return self.AvatarInfos[Eid].PlayerInfo
    end
    for AvatarEid, AvatarBattleInfo in pairs(self.AvatarInfos) do
      if AvatarBattleInfo then
        return AvatarBattleInfo.PlayerInfo
      end
    end
  end
end

function BP_EMGameMode_C:TriggerSpawnPet()
  if self.EMGameState.PetDefenceFail == true then
    self.EMGameState:ShowDungeonError("TriggerSpawnPet \229\174\160\231\137\169\233\152\178\229\190\161\229\183\178\231\187\143\229\164\177\232\180\165\239\188\140\228\184\141\229\134\141\229\136\155\229\187\186")
    return
  end
  if not self.RandomPetCreator or not IsValid(self.RandomPetCreator) then
    local PetCreatorInfos = self:GetPetStaticCreatorInfo()
    if 0 == PetCreatorInfos:Num() then
      self.EMGameState:ShowDungeonError("TriggerSpawnPet \229\189\147\229\137\141\230\139\188\230\142\165\229\137\175\230\156\172\229\134\133\230\137\190\228\184\141\229\136\176\229\174\160\231\137\169\233\157\153\230\128\129\231\130\185\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174\239\188\129")
      return
    end
    self.RandomPetCreator = self:GetPetCreatorNearestToFirstPlayer(PetCreatorInfos)
    if not IsValid(self.RandomPetCreator) then
      self.EMGameState:ShowDungeonError("TriggerSpawnPet \233\128\137\230\139\169\229\174\160\231\137\169\233\157\153\230\128\129\231\130\185\229\164\177\232\180\165\239\188\129")
      return
    end
  end
  local SubLevelName = self:GetActorLevelName(self.RandomPetCreator)
  local SubGameMode = self.SubGameModeInfo:FindRef(SubLevelName)
  if not IsValid(SubGameMode) then
    self.EMGameState:ShowDungeonError("TriggerSpawnPet \229\136\155\229\187\186\229\174\160\231\137\169\233\157\153\230\128\129\231\130\185\230\137\190\228\184\141\229\136\176SubGameMode StaticCreatorId: " .. self.RandomPetCreator.StaticCreatorId .. "SubLevelName: " .. tostring(SubLevelName))
    return
  end
  SubGameMode.PetActiveLevel = true
  SubGameMode.RandomPetDefenceCoreId = self.DungeonRandomEventDefenceCoreId
  SubGameMode.RandomPetId = self.DungeonRandomEventPetId
  self.RandomPetCreator.UnitId = self.DungeonRandomEventPetId
  self.RandomPetCreator.UnitType = "Pet"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet \229\136\155\229\187\186\229\174\160\231\137\169 StaticCreatorId", self.RandomPetCreator.StaticCreatorId, "UnitId", self.RandomPetCreator.UnitId)
  self:TriggerActiveCustomStaticCreator(self.RandomPetCreator.StaticCreatorId, "DungeonPetSpawn", true, SubLevelName)
  self.RandomPetCreator.UnitId = self.DungeonRandomEventDefenceCoreId
  self.RandomPetCreator.UnitType = "Mechanism"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet \229\136\155\229\187\186\229\174\160\231\137\169\233\152\178\229\190\161\230\160\184\229\191\131 StaticCreatorId", self.RandomPetCreator.StaticCreatorId, "UnitId", self.RandomPetCreator.UnitId)
  self:TriggerActiveCustomStaticCreator(self.RandomPetCreator.StaticCreatorId, "DungeonPetDefSpawn", true, SubLevelName)
  self.PetMonsterCreated = true
end

function BP_EMGameMode_C:GetPetCreatorNearestToExit(PetCreatorInfos)
  local LevelLoader = self:GetLevelLoader()
  if not LevelLoader then
    self.EMGameState:ShowDungeonError("TriggerSpawnPet \230\139\191\228\184\141\229\136\176LevelLoader")
    return nil
  end
  local ExitLevelLoc = LevelLoader:GetExitLevelLocation()
  local MinSquaredDis = math.huge
  local NearestCreator
  for i = 1, PetCreatorInfos:Num() do
    local Creator = PetCreatorInfos[i]
    if Creator then
      local CreatorLoc = Creator:K2_GetActorLocation()
      local SquaredDis = UE4.UKismetMathLibrary.Vector_DistanceSquared(ExitLevelLoc, CreatorLoc)
      if MinSquaredDis > SquaredDis then
        MinSquaredDis = SquaredDis
        NearestCreator = Creator
      end
    end
  end
  return NearestCreator
end

function BP_EMGameMode_C:GetPetCreatorNearestToFirstPlayer(PetCreatorInfos)
  local LevelLoader = self:GetLevelLoader()
  if not LevelLoader then
    self.EMGameState:ShowDungeonError("TriggerSpawnPet \230\139\191\228\184\141\229\136\176LevelLoader")
    return nil
  end
  local Players = self:GetAllPlayer()
  if not Players or Players:Length() <= 0 then
    self.EMGameState:ShowDungeonError("TriggerSpawnPet \232\142\183\229\143\150\228\184\141\229\136\176Players")
    return nil
  end
  local Player = Players:GetRef(1)
  local PlayerLoc = Player:K2_GetActorLocation()
  local MinSquaredDis = math.huge
  local NearestCreator
  for i = 1, PetCreatorInfos:Num() do
    local Creator = PetCreatorInfos[i]
    if Creator then
      local CreatorLoc = Creator:K2_GetActorLocation()
      local SquaredDis = UE4.UKismetMathLibrary.Vector_DistanceSquared(PlayerLoc, CreatorLoc)
      if MinSquaredDis > SquaredDis then
        MinSquaredDis = SquaredDis
        NearestCreator = Creator
      end
    end
  end
  return NearestCreator
end

function BP_EMGameMode_C:ShowPetDefenseDynamicEvent(EventName, EventDescribe, EventSuccess, EventFail)
  self.EMGameState:SetPetEventName(EventName)
  self.EMGameState:SetPetEventDescribe(EventDescribe)
  self.EMGameState:SetPetEventSuccess(EventSuccess)
  self.EMGameState:SetPetEventFail(EventFail)
  self.LevelGameMode:AddDungeonEvent("ShowPetDefenseDynamicEvent")
end

function BP_EMGameMode_C:ShowPetDefenseProgress(EventName, EventDescribe, EventSuccess, EventFail)
  self.EMGameState:SetPetEventName(EventName)
  self.EMGameState:SetPetEventDescribe(EventDescribe)
  if self:IsSubGameMode() then
    self.EMGameState:SetPetDefenceCoreId(self.RandomPetDefenceCoreId)
    self.EMGameState:SetPetId(self.RandomPetId)
  else
    self.EMGameState:SetPetDefenceCoreId(self.DungeonRandomEventDefenceCoreId)
    self.EMGameState:SetPetId(self.DungeonRandomEventPetId)
  end
  self.EMGameState:SetPetEventSuccess(EventSuccess)
  self.EMGameState:SetPetEventFail(EventFail)
  self.LevelGameMode:AddDungeonEvent("ShowPetDefenseProgress")
end

function BP_EMGameMode_C:HidePetDefenseProgress(Success)
  self.EMGameState:SetPetSuccess(Success)
  self.EMGameState:SetPetDefenceFail(not Success)
  self.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseDynamicEvent")
  self.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseProgress")
  self.LevelGameMode:RemoveDungeonEvent("PetPlayFailureMontage")
  if Success then
    self.EMGameState:PetAddGuideAllPlayer()
  end
end

function BP_EMGameMode_C:UpdatePetDefenseProgress()
  if IsStandAlone(self) then
    self.EMGameState:OnRep_PetDefenceKilled()
  end
end

function BP_EMGameMode_C:InitDungeonRandomEvent()
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] Start")
  local Avatar = self:GetAvatarInfo()
  if not Avatar then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find avatar")
    return
  end
  local EventId = Avatar.DungeonRandomEvent.CurrentEventId
  local RandomEventExcel = DataMgr.DungeonRandomEvent[EventId]
  if not RandomEventExcel then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event excel <EventId>", EventId)
    return
  end
  local EventType = RandomEventExcel.EventType
  local EventDetail = Avatar.DungeonRandomEvent[EventType]
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] <EventId,EventType>", EventId, EventType)
  if 0 == EventId then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not happen event")
    return
  end
  if not EventDetail then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event detail <EventId,EventType>", EventId, EventType)
    return
  end
  if self["InitDungeonRandomEvent" .. EventType] then
    self["InitDungeonRandomEvent" .. EventType](self, EventDetail)
  else
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event type")
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:ServerMulticast("DungeonEventRealHappend", EventId, Avatar.Uid)
  else
    Avatar:CallServerMethod("DungeonEventRealHappend", EventId)
  end
end

function BP_EMGameMode_C:InitDungeonRandomEventPet(Detail)
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] Start <PetId>", Detail.PetId)
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:ServerMulticast("DungeonEventRealHappendPet", Detail.PetId)
  end
  if 0 == Detail.PetId then
    DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] PetId\228\184\1860")
    return
  end
  self.NeedPetMonster = true
  self.DungeonRandomEventPetId = Detail.PetId
  if not DataMgr.Pet[Detail.PetId] then
    ScreenPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] \228\188\160\229\133\165\231\154\132PetId\228\184\141\229\173\152\229\156\168\228\186\142Pet\232\161\168\228\184\173", Detail.PetId)
    return
  end
  self.DungeonRandomEventDefenceCoreId = DataMgr.Pet[Detail.PetId].DefenceCoreID
end

function BP_EMGameMode_C:InitDungeonRandomEventTreasure(Detail)
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventTreasure] Start")
  self.NeedTreasureMonster = true
end

function BP_EMGameMode_C:InitDungeonRandomEventButcher(Detail)
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventButcher] Start")
  self.NeedButcherMonster = true
end

function BP_EMGameMode_C:JudgeEscapeMechanismArray(mechanisms)
  if mechanisms:Num() <= 0 then
    DebugPrint("Error: \230\137\190\228\184\141\229\136\176\230\146\164\231\166\187\230\156\186\229\133\179\227\128\130")
  elseif mechanisms:Num() > 1 then
    DebugPrint("Warning: \230\137\190\229\136\176\228\186\134\229\164\154\228\186\142\228\184\128\228\184\170\230\146\164\231\166\187\230\156\186\229\133\179\227\128\130")
  end
end

function BP_EMGameMode_C:GetEscapeMechanismLocation()
  local Mechanisms = self.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if nil ~= Mechanisms then
    Mechanisms = Mechanisms.Array
    self:JudgeEscapeMechanismArray(Mechanisms)
    for _, Mechanism in pairs(Mechanisms:ToTable()) do
      return Mechanism:K2_GetActorLocation()
    end
  else
    Mechanisms = TArray(FSnapShotInfo())
    local levelLoader = self:GetLevelLoader()
    if nil ~= levelLoader then
      do
        local Results = TArray(FSnapShotInfo())
        self:GetCustomDungeonSnapShotData(Results, levelLoader.exitLevelID)
        for _, Result in pairs(Results) do
          if Result.UnitType == "Mechanism" and nil ~= DataMgr.Mechanism[Result.UnitId] and "ExitTrigger" == DataMgr.Mechanism[Result.UnitId].UnitRealType then
            Mechanisms:Add(Result)
          end
        end
      end
    end
    self:JudgeEscapeMechanismArray(Mechanisms)
    for _, Mechanism in pairs(Mechanisms:ToTable()) do
      return Mechanism.Loc
    end
  end
  return nil
end

function BP_EMGameMode_C:GetEscapeMechanismActor()
  local Mechanisms = self.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if nil == Mechanisms then
    DebugPrint("Error: \230\137\190\228\184\141\229\136\176\230\146\164\231\166\187\230\156\186\229\133\179\227\128\130")
    return nil
  end
  Mechanisms = Mechanisms.Array
  self:JudgeEscapeMechanismArray(Mechanisms)
  for _, Mechanism in pairs(Mechanisms:ToTable()) do
    return Mechanism
  end
  return nil
end

function BP_EMGameMode_C:GetPickupUnitPreloadTable()
  if self.EMGameState.GameModeType == "Blank" then
    return nil
  end
  local ComponentName = "BP_" .. self.EMGameState.GameModeType .. "Component"
  if self:GetDungeonComponent() ~= nil and nil ~= self:GetDungeonComponent().GetPickupUnitPreloadTable then
    return self:GetDungeonComponent():GetPickupUnitPreloadTable()
  end
  return nil
end

function BP_EMGameMode_C:GetAvatarBuffs(AvatarEid)
  for AvatarEid, AvatarInfo in pairs(self.AvatarInfos) do
    DebugPrint("Tianyi@ AvatarEid = " .. AvatarEid)
    local AvatarBuffs = AvatarInfo.Buffs
    for _, BuffInfo in pairs(AvatarBuffs) do
      DebugPrint("Tianyi@ BuffInfo: " .. BuffInfo.BuffId .. " StartTime: " .. BuffInfo.StartTime .. " Duration: " .. BuffInfo.Duration)
    end
  end
end

function BP_EMGameMode_C:TriggerBattleAchievementUploadOnDungeonEnd(IsWin)
  if IsStandAlone(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      local EndTag = "Dungeon"
      local EndId = self.LevelGameMode.DungeonId
      if Avatar:IsInHardBoss() then
        EndTag = "HardBoss"
        EndId = self.LevelGameMode.EMGameState.HardBossInfo.DifficultyId
      end
      PlayerCharacter.BattleAchievement:OnDungeonEnd(PlayerCharacter, EndTag, EndId, IsWin)
    end
  end
end

function BP_EMGameMode_C:NotifyGameModePlayerDead(Player)
  self:TriggerDungeonComponentFun("OnPlayerDead")
  self:PlayerOnDead(Player)
end

function BP_EMGameMode_C:DestroyActorsByUnitLabels_Lua(UnitLabels)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, UnitLabel in pairs(UnitLabels:ToTable()) do
      Avatar:RegionActorDataDeadByUnitLabel(UnitLabel.UnitId, UnitLabel.UnitType)
    end
  end
end

function BP_EMGameMode_C:GetRegionIdByLocation(...)
  local LevelLoader = self:GetLevelLoader()
  if not LevelLoader then
    return
  end
  return LevelLoader:GetRegionIdByLocation(...)
end

function BP_EMGameMode_C:ActivateDynamicQuestEvent()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.DynamicQuests and #Avatar.DynamicQuests then
    for _, DynamicQuest in pairs(Avatar.DynamicQuests) do
      if DynamicQuest:IsActive() then
        if not ClientEventUtils:CheckDynamicEventStarted(DynamicQuest.DynamicQuestId) then
          ClientEventUtils:StartDynamicEvent(DynamicQuest.DynamicQuestId)
        else
          local CurrentEvent = ClientEventUtils:GetCurrentActiveDynamicEvent(DynamicQuest.DynamicQuestId)
          if CurrentEvent then
            CurrentEvent:ActivateTrigger()
          end
        end
      end
    end
  end
end

function BP_EMGameMode_C:IsRegionAllReady()
  local RegionDataMgrSubSystem = self:GetRegionDataMgrSubSystem()
  if not RegionDataMgrSubSystem then
    return false
  end
  return RegionDataMgrSubSystem:IsRegionAllReady()
end

function BP_EMGameMode_C:TriggerTarget(TargetId, UniqueAttr, PlayerEid)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ServerTargetFinish(TargetId, UniqueAttr, 1)
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    if -1 == PlayerEid then
      DSEntity:ServerMulticast("ServerTargetFinish", TargetId, UniqueAttr, 1, {})
    else
      local AvatarEid = Battle(self):GetEntity(PlayerEid):GetOwner().AvatarId
      DSEntity:SendAvatar(AvatarEid, "ServerTargetFinish", TargetId, UniqueAttr, 1, {})
    end
  end
end

function BP_EMGameMode_C:ActiveNewTargetPointAOITrigger_Region(Type)
  if Type ~= Const.Hijack then
    GWorld.logger.error("ActiveNewTargetPointAOITrigger_Region \230\142\165\229\143\163\229\189\147\229\137\141\229\143\170\230\148\175\230\140\129 Hijack Type")
    return
  end
  if self.EMGameState == nil or nil == self.EMGameState.HijackPathInfo then
    return
  end
  if not self.NewTargetPointAOITriggerList then
    self.NewTargetPointAOITriggerList = {}
  end
  self.NewTargetPointAOITriggerList[Type] = {}
  for _, Path in pairs(self.EMGameState.HijackPathInfo) do
    for _, Point in pairs(Path) do
      if IsAuthority(self) and -1 ~= Point.SpawnTriggerBoxId and Point.SpawnBoxType == ENTPSpawnBoxType.GamemodeEvent then
        Point:SpawnTriggerBox()
        table.insert(self.NewTargetPointAOITriggerList[Type], Point)
      end
    end
  end
end

function BP_EMGameMode_C:DisactiveNewTargetPointAOITrigger_Region(Type)
  if not self.NewTargetPointAOITriggerList or not self.NewTargetPointAOITriggerList[Type] then
    return
  end
  for _, Point in pairs(self.NewTargetPointAOITriggerList[Type]) do
    Point:DestroyTriggerBox(EDestroyReason.SpecialQuestClear)
  end
end

function BP_EMGameMode_C:OnAllPlayersVoted()
  self:TriggerDungeonComponentFun("OnAllPlayersVoted")
end

function BP_EMGameMode_C:InitMonsterFramingNodeSetting(Setting)
  Setting.Type = EFramingType.ByReplicateNum
  Setting.DistanceToCull = 4500
  Setting.DistanceToCull_FastShare = 15000
  Setting.PreFrameReplicateNum = 30
  Setting.PreFrameReplicateMovementNum = 15
  Setting.SkipFullReplicationFactor = 0.5
  Setting.SkipMovementReplicationFactor = 1.0
end

function BP_EMGameMode_C:GetPlayerEidByAvatarEidStr(AvatarEidStr)
  local PlayerState = UE4.URuntimeCommonFunctionLibrary.GetPlayerStateByAvatarEid(GWorld.GameInstance, AvatarEidStr)
  if PlayerState then
    return PlayerState.Eid
  else
    DebugPrint("BP_EMGameMode_C: AvatarEidStr", AvatarEidStr, "\230\139\191\228\184\141\229\136\176\229\175\185\229\186\148\231\154\132PlayerState!")
  end
end

function BP_EMGameMode_C:SetGameStatePetRandomDailyCount()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurPetCount = 0
  local AvatarTryPetDict = Avatar.Region2TryPetCount
  for _, Count in pairs(AvatarTryPetDict) do
    CurPetCount = CurPetCount + Count
  end
  self.EMGameState.RegionRandomPetLimitedDailyCount = DataMgr.GlobalConstant.PetRareDailyLimit.ConstantValue - CurPetCount
end

function BP_EMGameMode_C:GetRegionCharAvgLevel()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 99
  end
  if not Avatar.Chars then
    return 99
  end
  local MyHeap = {}
  local HeapMaxSize = 3
  
  local function TryPushHeap(value)
    if #MyHeap < HeapMaxSize then
      table.insert(MyHeap, value)
    else
      local MinValue = math.min(table.unpack(MyHeap))
      if value > MinValue then
        for i, v in ipairs(MyHeap) do
          if v == MinValue then
            MyHeap[i] = value
            break
          end
        end
      end
    end
  end
  
  for _, Char in pairs(Avatar.Chars) do
    if Char and Char.Level then
      TryPushHeap(Char.Level)
    end
  end
  local Sum = 0
  for _, Level in pairs(MyHeap) do
    Sum = Sum + Level
  end
  local Res = math.floor(Sum / #MyHeap)
  DebugPrint("BP_EMGameMode_C:GetRegionCharAvgLevel", Res)
  return Res
end

AssembleComponents(BP_EMGameMode_C)
return BP_EMGameMode_C
