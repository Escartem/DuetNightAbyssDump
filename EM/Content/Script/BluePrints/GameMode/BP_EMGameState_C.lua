require("UnLua")
local Const = require("Const")
local msgpack = require("msgpack_core")
local BP_EMGameState_C = Class()
local NpcLoadedCallbackFuncName = "NpcLoaded"
BP_EMGameState_C._components = {
  "BluePrints.Combat.Components.GameStateInterface",
  "BluePrints.Combat.Components.GameModeInterface",
  "BluePrints.Combat.BattleLogic.MonsterFirstSeenComp",
  "BluePrints.Combat.BattleLogic.MechanismFirstSeenComp",
  "BluePrints.Combat.BattleLogic.NavLinkGroupMgr",
  "BluePrints.GameMode.Components.ConditionTriggerComponent",
  "BluePrints.UI.WBP.Chat.EMGameStateChatComp"
}

function BP_EMGameState_C:Initialize()
  self.LastDungeonEvent = {}
end

function BP_EMGameState_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.DebugMonster = nil
  self.EndLoadingSuccess = false
  self.bCustomNpcCanCache = Const.CustomNpcCanCache
  EventManager:AddEvent(EventID.OnExploreGroupDeactive, self, self.OnExploreGroupDeactive)
  EventManager:AddEvent(EventID.OnExploreGroupActive, self, self.OnExploreGroupActive)
  EventManager:AddEvent(EventID.OnExploreGroupSpecialActive, self, self.OnExploreGroupSpecialActive)
  EventManager:AddEvent(EventID.OnExploreGroupLimitComplete, self, self.OnExploreGroupLimitComplete)
  EventManager:AddEvent(EventID.OnExploreGroupComplete, self, self.OnExploreGroupComplete)
  EventManager:AddEvent(EventID.OnExploreGroupReset, self, self.OnExploreGroupReset)
  EventManager:AddEvent(EventID.OnMainCharacterInitReady, self, self.OnLoadingPanelClosed)
  self.OnDelPlayerState:Add(self, function(self, Eid)
    EventManager:FireEvent(EventID.OnDelPlayerState, Eid)
  end)
  self.OnDelPhantomState:Add(self, function(self, Eid)
    EventManager:FireEvent(EventID.OnDelPhantomState, Eid)
  end)
  self.GameStateIndex = GWorld:AddGameState(self)
  self:InitTimeCheckMgr()
  self:AddSceneMgrEvent()
  self:InitPickupNiagaraPath()
  self.AudioCompCacheNum = 0
end

function BP_EMGameState_C:OnLoadingPanelClosed()
  self.LoadingClosed = true
end

function BP_EMGameState_C:InitGameStateInfo()
  self.HardBossInfo = {}
  self:InitGameStateInterface()
  self:InitDungeonUIInfo()
end

function BP_EMGameState_C:InitDungeonUIInfo()
  if IsDedicatedServer(self) then
    return
  end
  self:OnRep_DungeonUIInfo()
end

function BP_EMGameState_C:OnGameModeReady_Lua()
  if not IsAuthority(self) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:InitMonsterSpawnDivisions(self.MonsterSpawnPointParams)
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:HookGameModeReady(GameMode)
  end
end

function BP_EMGameState_C:SetEndPointActor(Actor)
  if not IsValid(Actor) then
    return
  end
  self.EndPointActor = Actor
end

function BP_EMGameState_C:AddCoverInfo(CoverInfo)
  if not IsValid(CoverInfo) then
    return
  end
  self.CoverMap:Add(CoverInfo.Eid, CoverInfo)
end

function BP_EMGameState_C:AddDefBaseInfo(DefBase)
  if nil == DefBase then
    return
  end
  local Length = self.DefBaseMap:Keys():Length()
  self.DefBaseMap:Add(DefBase.Eid, DefBase)
  self.HatredCombatProp:Add(DefBase.Eid, DefBase)
  if Length <= 0 then
  end
end

function BP_EMGameState_C:AddHijackPointInfo(HijackPointInfo)
  if not IsValid(HijackPointInfo) then
    return
  end
  if not self.HijackPathInfo then
    self.HijackPathInfo = {}
  end
  if HijackPointInfo.DisplayName == "" or 0 == HijackPointInfo.PathId or 0 == HijackPointInfo.PathPointIndex then
    GWorld.logger.error("HijackPathInfo\230\149\176\230\141\174\233\148\153\232\175\175, \232\175\183\230\163\128\230\159\165\227\128\130DisplayName: " .. HijackPointInfo.DisplayName .. "   PathId: " .. HijackPointInfo.PathId .. " PathPointIndex: " .. HijackPointInfo.PathPointIndex)
    return
  end
  if self.HijackPathInfo[HijackPointInfo.PathId] then
    self.HijackPathInfo[HijackPointInfo.PathId][HijackPointInfo.PathPointIndex] = HijackPointInfo
  else
    self.HijackPathInfo[HijackPointInfo.PathId] = {}
    self.HijackPathInfo[HijackPointInfo.PathId][HijackPointInfo.PathPointIndex] = HijackPointInfo
  end
end

function BP_EMGameState_C:AddTargetPointInfo(TargetPointInfo)
  if not IsValid(TargetPointInfo) then
    return
  end
  if TargetPointInfo.DisplayName == "" then
    return
  end
  self.TargetPointMap:Add(TargetPointInfo.DisplayName, TargetPointInfo)
  if TargetPointInfo.DisplayName == Const.GuidePointName then
    self:SpawnGuidePlayerAtLoc(TargetPointInfo:K2_GetActorLocation())
  end
  if TargetPointInfo.DisplayName == Const.FallAttackPointName and TargetPointInfo.IsActive then
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local FallAttackObject = PlayerCharacter:GetOrAddFallAttackObject()
    FallAttackObject.bFallAttackPoint = true
    FallAttackObject.FallAttackPoint = TargetPointInfo:K2_GetActorLocation()
  end
end

function BP_EMGameState_C:AddQuestArea(TargetArea)
  if not IsValid(TargetArea) then
    return
  end
  if TargetArea.DisplayName == "" then
    return
  end
  if not self.QuestArea then
    self.QuestArea = {}
  end
  self.QuestArea[TargetArea.DisplayName] = TargetArea
end

function BP_EMGameState_C:AddMonsterSpawnPointInfo(MonsterSpawnPoint)
  if not IsValid(MonsterSpawnPoint) then
    return
  end
  self.MonsterSpawnPointArray:AddUnique(MonsterSpawnPoint)
end

function BP_EMGameState_C:AddFallTriggerInfo(FallTrigger)
  if not IsValid(FallTrigger) then
    DebugPrint("FallTrigger \228\184\141\229\173\152\229\156\168")
    return
  end
  self.FallTriggersArray:Add(FallTrigger)
end

function BP_EMGameState_C:RemoveFallTriggerInfo(FallTrigger)
  if not IsValid(FallTrigger) then
    DebugPrint("FallTrigger \228\184\141\229\173\152\229\156\168")
    return
  end
  self.FallTriggersArray:RemoveItem(FallTrigger)
end

function BP_EMGameState_C:CheckActorNeedCache()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance.IsTakeRecorderCapturing then
    return false
  end
  return true
end

function BP_EMGameState_C:CheckMonsterNeedCache(MonsterId)
  return self:CheckActorNeedCache()
end

function BP_EMGameState_C:CheckBodyAccessotyNeedCache(AccessoryId)
  return self:CheckActorNeedCache()
end

function BP_EMGameState_C:GetTargetPoint(DisplayName)
  if "" == DisplayName or nil == DisplayName then
    return
  end
  return self.TargetPointMap:FindRef(DisplayName)
end

function BP_EMGameState_C:GetTargetPointLoc(DisplayName)
  if "" == DisplayName or nil == DisplayName then
    return
  end
  if self.TargetPointMap:FindRef(DisplayName) then
    return self.TargetPointMap:FindRef(DisplayName):K2_GetActorLocation()
  end
end

function BP_EMGameState_C:OnNpcLoaded_Lua(NpcId, NpcCharacter)
  local T = self:GetNpcInfoAsyncCallbackTable(NpcId)
  for _, cb in pairs(T) do
    if cb then
      cb(NpcCharacter)
    end
  end
  self:EmptyNpcInfoAsyncCallbackTable(NpcId)
end

function BP_EMGameState_C:AddNpcInfo_Lua(NpcCharacter)
  local NpcData = DataMgr.Npc[NpcCharacter.UnitId]
  DebugPrint("AddNpcInfo_Lua:", NpcCharacter.UnitId)
  if NpcData and 1 == NpcData.IsSit then
    NpcCharacter:SetSitPoseInteractive()
  elseif NpcData and 2 == NpcData.IsSit then
    NpcCharacter:SetSitPoseWithoutInteractive()
  elseif NpcData and 3 == NpcData.IsSit then
    NpcCharacter:SetSitPoseWithInteractiveAndNoDown()
  end
end

function BP_EMGameState_C:RemoveGetNpcInfoAsyncDelegate(InNpcId, CallBack)
  if CallBack then
    local T = self:GetNpcInfoAsyncCallbackTable(InNpcId)
    DebugPrint("RemoveGetNpcInfoAsyncDelegate", InNpcId, CallBack, T[CallBack])
    T[CallBack] = nil
  end
end

function BP_EMGameState_C:GetNpcInfoAsyncCallbackTable(InNpcId)
  local FuncName = NpcLoadedCallbackFuncName .. InNpcId
  self[FuncName] = self[FuncName] or {}
  return self[FuncName]
end

function BP_EMGameState_C:EmptyNpcInfoAsyncCallbackTable(InNpcId)
  local FuncName = NpcLoadedCallbackFuncName .. InNpcId
  self[FuncName] = {}
end

function BP_EMGameState_C:ChangeNpcInfoByGender(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  if NpcData.SwitchPlayer == "Player" then
    if NpcData.Gender == Avatar.Sex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  elseif NpcData.SwitchPlayer == "EXPlayer" then
    if NpcData.Gender == Avatar.WeitaSex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  else
    return NpcId
  end
end

function BP_EMGameState_C:GetNpcInfoAsync(InNpcId, CallBack)
  local NewInNpcId = self:ChangeNpcInfoByGender(InNpcId) or InNpcId
  if NewInNpcId ~= InNpcId then
    DebugPrint("ChangeNpcId", NewInNpcId, " : ", InNpcId)
    InNpcId = NewInNpcId
  end
  local Npc = self:GetNpcInfo(InNpcId)
  if nil ~= Npc then
    DebugPrint("NpcId:", InNpcId, "Npc Is Loaded ========================")
    CallBack(Npc)
  elseif self:IsNpcInAsyncProcess(InNpcId) then
    DebugPrint("NpcId:", InNpcId, "Npc Is Loading ========================")
    local T = self:GetNpcInfoAsyncCallbackTable(InNpcId)
    if CallBack then
      T[CallBack] = CallBack
    end
  else
    CallBack(nil)
  end
end

function BP_EMGameState_C:CanUnloadNavMeshLevel()
  return Const.CanUnloadNavMeshLevel
end

function BP_EMGameState_C:OnRep_GameModeState_Lua()
end

function BP_EMGameState_C:OnRep_GuideEids()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) then
    SceneMgrComponent:UpdateAllCommonGuideIcon()
  end
  if self.OnRepEidsDelegate:IsBound() then
    print(_G.LogTag, "OnRepEidsDelegateBro")
    self.OnRepEidsDelegate:Broadcast(self)
  end
end

function BP_EMGameState_C:OnRep_DungeonUIState()
  EventManager:FireEvent(EventID.OnDungeonUIStateUpdated)
end

function BP_EMGameState_C:RealShowLargeCountDownUI(Count, bShowZeroText)
  EventManager:FireEvent(EventID.OnNotifyShowLargeCountDown, Count, bShowZeroText)
end

function BP_EMGameState_C:GetSurvivalValue()
  if self.GameModeType == "SurvivalMini" or self.GameModeType == "SurvivalMiniPro" then
    return self.SurvivalMiniValue
  end
  return self.SurvivalValue
end

function BP_EMGameState_C:AddEnergySupplyCount(ChangeValue)
  self:SetEnergySupplyCount(self.EnergySupplyCount + ChangeValue)
  if GWorld:IsStandAlone() then
    self:OnRep_EnergySupplyCount()
  end
end

function BP_EMGameState_C:MulticastAddSurvivalValue_Lua(ChangeValue)
end

function BP_EMGameState_C:ShowInteractedToast_Lua(PlayerEid)
  if not IsClient(self) then
    return
  end
  local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(MainPlayer) or MainPlayer.Eid == PlayerEid then
    return
  end
  local PlayerState = self:GetPlayerState(PlayerEid)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager and PlayerState then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, string.format(GText("DUNGEON_SURVIVALPRO_126"), PlayerState.PlayerName))
  end
end

function BP_EMGameState_C:GetSurvialTime()
  return self.CumulativeSurvivalTime
end

function BP_EMGameState_C:OnRep_CumulativeSurvivalTime()
  EventManager:FireEvent(EventID.OnRepSurvivalTime, self.CumulativeSurvivalTime)
end

function BP_EMGameState_C:OnRep_SabotageCountDownTime()
  EventManager:FireEvent(EventID.OnRepSabotageCountDownTime)
end

function BP_EMGameState_C:OnRep_EnergySupplyCount()
  EventManager:FireEvent(EventID.OnRepEnergySupplyCount)
end

function BP_EMGameState_C:OnRep_SurvivalMiniValue()
  EventManager:FireEvent(EventID.OnRepSurvivalMiniValue, self.SurvivalMiniValue)
end

function BP_EMGameState_C:OnRep_ExterminateKilledNum()
  DebugPrint("BP_EMGameState_C:OnRep_ExterminateKilledNum", self.ExterminateKilledNum)
  EventManager:FireEvent(EventID.OnRepExterminateKilledNum)
end

function BP_EMGameState_C:OnRep_TrialKilledNum()
  DebugPrint("BP_EMGameState_C:OnRep_TrialKilledNum", self.TrialKilledNum)
  EventManager:FireEvent(EventID.OnRepTrialKilledNum)
end

function BP_EMGameState_C:OnRep_CaptureRecoveryTime()
  EventManager:FireEvent(EventID.OnRepCaptureRecoveryTime)
end

function BP_EMGameState_C:AddRougeBattleCount(Value)
  if not self.RougeBattleCount then
    self.RougeBattleCount = 0
  end
  self.RougeBattleCount = self.RougeBattleCount + Value
  EventManager:FireEvent(EventID.OnRepRougeBattleCount)
end

function BP_EMGameState_C:SetRougeBattleNums(Count, MaxNum)
  self.RougeBattleCount = Count or 0
  self.RougeBattleMaxNum = MaxNum or self.RougeBattleMaxNum
  EventManager:FireEvent(EventID.OnRepRougeBattleCount)
end

function BP_EMGameState_C:SetRougeBattleMaxNum(Value, DisplayText)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:RefreshRougeBattleUI(true, false)
  self.RougeBattleMaxNum = Value
  local RougeBattleUI = UIManager(self):GetUIObj("Rouge_BattleProgress")
  if RougeBattleUI then
    RougeBattleUI:InitRougeBattleDisplayText(DisplayText)
    RougeBattleUI:OnRepRougeBattleCount()
  else
    ScreenPrint("BP_EMGameState_C:SetRougeBattleMaxNum \230\137\190\228\184\141\229\136\176\232\130\137\233\184\189ui")
  end
end

function BP_EMGameState_C:TryGetNpc(NpcId, Callback)
  local NPC = self:GetNpcInfo()
  if NPC then
    return NPC, true
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return nil, false
  end
  local RegionDataMgr = GameMode:GetRegionDataMgrSubSystem()
  if not RegionDataMgr then
    return nil, false
  end
  local bHasCreatingNpc = RegionDataMgr:GetNpcData(NpcId)
  if bHasCreatingNpc then
    self.NpcCallBackMap = self.NpcCallBackMap or {}
    self.NpcCallBackMap[NpcId] = Callback
  end
  return nil, bHasCreatingNpc
end

function BP_EMGameState_C:RegisterMechanism(Mechanism, UnitRealType)
  if nil == Mechanism then
    return
  end
  if nil == UnitRealType then
    UnitRealType = "CombatItemBase"
  end
  local MechanismArrayStruct = self.MechanismMap:FindRef(UnitRealType)
  if nil == MechanismArrayStruct then
    local _MechanismArrayStruct = FArray()
    _MechanismArrayStruct:AddItem(Mechanism)
    self.MechanismMap:Add(UnitRealType, _MechanismArrayStruct)
  else
    MechanismArrayStruct:AddItem(Mechanism)
  end
  if Mechanism.ManualItemId and Mechanism.ManualItemId > 0 then
    self.ManualActiveCombat:Add(Mechanism.ManualItemId, Mechanism)
  end
end

function BP_EMGameState_C:DealDungeonVoteResult()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:RemoveDungeonEvent("OnDungeonVoteBegin")
  DebugPrint("Vote::: Dungeon Begin Deal Vote Result")
  local BattleNum = 0
  local AvatarEids = {}
  local PlayerEids = {}
  for eid, VoteBattle in pairs(self.VoteValues) do
    if VoteBattle == EVoteState.Continue then
      BattleNum = BattleNum + 1
    else
      local PlayerCharacter = Battle(self):GetCharacter(eid)
      if PlayerCharacter then
        local AvatarEid = PlayerCharacter:GetOwner().AvatarEidStr
        table.insert(AvatarEids, AvatarEid)
        table.insert(PlayerEids, eid)
      end
    end
  end
  DebugPrint("Vote::: BattleNum :" .. BattleNum .. "  ExitNum:" .. #AvatarEids)
  self.VoteValues:Clear()
  UMapSyncHelper.SyncMap(self, "VoteValues")
  if 0 ~= #AvatarEids then
    GameMode:TriggerPlayerWin(AvatarEids, PlayerEids)
  end
  if 0 == BattleNum then
    DebugPrint("Vote::: BattleNum = 0 ,\232\167\166\229\143\145\229\137\175\230\156\172\231\187\147\231\174\151")
    GameMode:TriggerDungeonOnEnd(true)
  else
    GameMode:ExecuteNextStepOfDungeonVote()
  end
end

function BP_EMGameState_C:DealDungeonTicketResult()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:RemoveDungeonEvent("SelectTicket")
  GameMode:ExecuteNextStepOfTicket()
end

function BP_EMGameState_C:RealShowContinuedPCGuide(IsHide)
  local Visibility = UE4.ESlateVisibility.Visible
  if IsHide then
    Visibility = UE4.ESlateVisibility.Hidden
  end
  local GuideInfoPanel = UIManager(self):GetUIObj("BattleMain").Guide_KeyTip
  if GuideInfoPanel then
    GuideInfoPanel:SetVisibility(Visibility)
  end
end

function BP_EMGameState_C:RealSetContinuedPCGuideVisibility(ActionName, IsHide)
  local GuideInfoPanel = UIManager(self):GetUIObj("BattleMain").Guide_KeyTip
  local Visibility = UE4.ESlateVisibility.Visible
  if IsHide then
    Visibility = UE4.ESlateVisibility.Collapsed
  end
  if GuideInfoPanel then
    if "Attack" == ActionName then
      GuideInfoPanel.Hint01:SetVisibility(Visibility)
    elseif "Fire" == ActionName then
      GuideInfoPanel.Hint02:SetVisibility(Visibility)
    elseif "ESC" == ActionName then
      GuideInfoPanel.Hint03:SetVisibility(Visibility)
    elseif "Alt" == ActionName then
      GuideInfoPanel.Hint04:SetVisibility(Visibility)
    end
  end
  if "SpiralLeap" == ActionName or "Dodge" == ActionName or "Skill1" == ActionName or "Skill2" == ActionName or "Skill2Attack" == ActionName then
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    BattleMain:ShowInstructionInfo(ActionName, IsHide)
  end
end

function BP_EMGameState_C:RealHideGuideMessage(MessageId, IsExecuteFinish)
  if not MessageId then
    return
  end
  if not UIManager(self) then
    return
  end
  local GuideTextPanel = UIManager(self):GetUIObj("GuideTextFloat" .. MessageId)
  if GuideTextPanel then
    GuideTextPanel:DeleteGuideMessage(IsExecuteFinish)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local Guide_Touch = UIManager(self):GetUIObj(UIManager().CurGuideTouchName)
    if not Guide_Touch then
      return
    end
    Guide_Touch:Close()
  end
end

function BP_EMGameState_C:RealHideHighlightButton()
  if not UIManager(self) then
    return
  end
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  BattleMain.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
  if Instruction and Instruction.Key then
    Instruction.Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function BP_EMGameState_C:RealShowHighlightButton(SkillType)
  if not UIManager(self) then
    return
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    BattleMain.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
    if nil == Instruction then
      Instruction = BattleMain:GetOrAddWidget("InstructionPC", BattleMain.Pos_Instruction)
      if Instruction then
        Instruction:Init(SkillType)
      end
    else
      Instruction:Init(SkillType)
    end
  end
end

function BP_EMGameState_C:RealPlayGuideTextFloatAnimation(MessageId)
  if not UIManager(self) then
    return
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local GuideUI = UIManager(self):GetUIObj("GuideTextFloat" .. MessageId)
    if GuideUI then
      GuideUI:DeleteGuideMessage(true)
    end
  end
end

function BP_EMGameState_C:HideUIInScreen(UIPath, IsHide, ShowOrHideNode)
  if IsDedicatedServer(self) and IsAuthority(self) then
    print(_G.LogTag, "WARNING: \230\152\175\230\156\141\229\138\161\229\153\168,\228\184\141\230\137\167\232\161\140 HideUIInScreen \229\135\189\230\149\176")
    return
  end
  if not UIPath then
    print(_G.LogTag, "ERROR: \232\190\147\229\133\165\231\154\132UI\232\183\175\229\190\132\233\148\153\232\175\175", UIPath)
    return
  end
  local Visible = UE4.ESlateVisibility.SelfHitTestInvisible
  local Visible1 = UE4.ESlateVisibility.Visible
  if IsHide then
    Visible = UE4.ESlateVisibility.Collapsed
    Visible1 = UE4.ESlateVisibility.Hidden
  end
  if "EnergySkill" == UIPath and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    UIPath = "SkillPhone"
  end
  if "Esc" == UIPath then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if Player then
      Player:SetESCMenuForbiddenState(IsHide)
    end
  end
  UIPath = UIConst[UIPath .. "Path"]
  if "TaskBar" == UIPath and UIManager(self) then
    local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
    local TaskPanel
    if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_TaskBar and 1 == BattleMainUI.Pos_TaskBar:GetChildrenCount() then
      TaskPanel = BattleMainUI.Pos_TaskBar:GetChildAt(0)
      if TaskPanel then
        TaskPanel.IsHideByNode = false
        DebugPrint("ShowOrHideUINode: GetVisibility", TaskPanel:GetName(), TaskPanel:GetVisibility())
        if TaskPanel:GetVisibility() ~= Visible and TaskPanel:GetVisibility() ~= Visible1 then
          TaskPanel:SetVisibility(Visible)
          DebugPrint("ShowOrHideUINode: SetVisibility", TaskPanel:GetName(), Visible)
          if ShowOrHideNode then
            if IsHide then
              TaskPanel.IsHideByNode = true
            end
            ShowOrHideNode.RealSetVisibility = true
            DebugPrint("ShowOrHideUINode: HideUIInScreen", ShowOrHideNode.Function, ShowOrHideNode.UIParam, ShowOrHideNode.ActionParam, ShowOrHideNode.ShowOrHide)
          end
        end
        return
      end
    end
  end
  if UIManager(self) then
    local UIPathes = UIManager(self):GetUIPathFromString(UIPath)
    if UIPathes then
      local root_ui = UIManager(self):GetUIObj(UIPathes[1])
      if not root_ui then
        print(_G.LogTag, "ERROR: \232\190\147\229\133\165\231\154\132UI\232\183\175\229\190\132\233\148\153\232\175\175,\230\178\161\230\156\137\230\137\190\229\136\176\232\175\165UI", UIPath)
        return
      end
      local len = #UIPathes
      for i = 2, len do
        root_ui = root_ui[UIPathes[i]]
      end
      if not root_ui then
        print(_G.LogTag, "ERROR: \232\190\147\229\133\165\231\154\132UI\232\183\175\229\190\132\233\148\153\232\175\175,\230\178\161\230\156\137\230\137\190\229\136\176\232\175\165UI", UIPath)
        return
      end
      DebugPrint("ShowOrHideUINode: GetVisibility", root_ui:GetName(), root_ui:GetVisibility())
      if root_ui:GetVisibility() ~= Visible and root_ui:GetVisibility() ~= Visible1 then
        if UIPath == UIConst.BloodBarPath then
          local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
          if BattleMainUI then
            BattleMainUI:ShowOrHideMainPlayerBloodUI(false == IsHide, "HideUIInScreen")
          end
        else
          root_ui:SetVisibility(Visible)
        end
        if ShowOrHideNode then
          ShowOrHideNode.RealSetVisibility = true
          DebugPrint("ShowOrHideUINode: HideUIInScreen", ShowOrHideNode.Function, ShowOrHideNode.UIParam, ShowOrHideNode.ActionParam, ShowOrHideNode.ShowOrHide)
        end
      end
    end
  end
end

function BP_EMGameState_C:ShowUIAndCloseItAfterCertainTime(UIPath, UIName, Duration, ZOrder)
  if IsDedicatedServer(self) and IsAuthority(self) then
    print(_G.LogTag, "WARNING: \230\152\175\230\156\141\229\138\161\229\153\168,\228\184\141\230\137\167\232\161\140 ShowUIAndCloseItAfterCertainTime \229\135\189\230\149\176")
    return nil
  end
  if Duration <= 0 then
    print(_G.LogTag, "WARNING: Duration \228\184\141\232\131\189\229\176\143\228\186\142\231\173\137\228\186\1420")
    return nil
  end
  local UI = UIManager(self):LoadUI(UIPath, UIName, ZOrder)
  self:AddTimer(Duration, function()
    UIManager(self):UnLoadUI(UIName)
  end)
  return UI
end

function BP_EMGameState_C:ReceiveEndPlay(Resaon)
  GWorld.Battle = nil
  GWorld:RemoveGameState(self.GameStateIndex)
  EventManager:RemoveEvent(EventID.OnExploreGroupDeactive, self)
  EventManager:RemoveEvent(EventID.OnExploreGroupActive, self)
  EventManager:RemoveEvent(EventID.OnExploreGroupSpecialActive, self)
  EventManager:RemoveEvent(EventID.OnExploreGroupLimitComplete, self)
  EventManager:RemoveEvent(EventID.OnExploreGroupComplete, self)
  EventManager:RemoveEvent(EventID.OnExploreGroupReset, self)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, self)
  self:RemoveSceneMgrEvent()
  self.OnDelPlayerState:Clear()
  self.OnDelPhantomState:Clear()
  self.Overridden.ReceiveEndPlay(self, Resaon)
end

function BP_EMGameState_C:AddSceneMgrEvent()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  SceneMgrComponent:AddRegionEvent(self:IsInRegion())
end

function BP_EMGameState_C:RemoveSceneMgrEvent()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  SceneMgrComponent:RemoveRegionEvent()
end

function BP_EMGameState_C:MulticastRealUnknownPickup_Lua(UnknownRewardCount)
end

function BP_EMGameState_C:OnExploreGroupActive(ExploreId)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Active)
end

function BP_EMGameState_C:OnExploreGroupSpecialActive(ExploreId)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_SpecialActive)
end

function BP_EMGameState_C:OnExploreGroupDeactive(ExploreId)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Deactive)
end

function BP_EMGameState_C:OnExploreGroupLimitComplete(ExploreId)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_LimitComplete)
end

function BP_EMGameState_C:OnExploreGroupComplete(ExploreId, TotalReward)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Complete)
  ExploreGroup:ShowRewardUI(TotalReward)
end

function BP_EMGameState_C:OnExploreGroupReset(ExploreId)
  local ExploreGroup = self.ExploreGroupMap:FindRef(ExploreId)
  if not ExploreGroup then
    return
  end
  ExploreGroup:ReceiveOnExploreGroupReset()
end

function BP_EMGameState_C:GetMaxArchiveID()
  local MaxArchiveID = -1
  for k, v in pairs(self.ManualActiveCombat) do
    if v.IsArchivePointActive == true and MaxArchiveID < v.ArchiveID then
      MaxArchiveID = v.ArchiveID
    end
  end
  return MaxArchiveID
end

function BP_EMGameState_C:ArchiveShowFX()
  local MaxArchiveID = self:GetMaxArchiveID()
  for k, v in pairs(self.ManualActiveCombat) do
    if v.IsArchivePointActive == true then
      if MaxArchiveID == v.ArchiveID then
        v:OnMaxFX()
        DebugPrint("==============================================OnMaxFX=====MaxArchiveID,self.ArchiveID", MaxArchiveID, v.ArchiveID)
      else
        v:OnNormalFX()
        DebugPrint("==============================================OnNormalFX=====MaxArchiveID,self.ArchiveID", MaxArchiveID, v.ArchiveID)
      end
    end
  end
end

function BP_EMGameState_C:BackToTempleArchivePoint()
  local MaxActiveArchivePoint
  local MaxArchiveID = -1
  for k, v in pairs(self.ManualActiveCombat) do
    if v.IsArchivePointActive == true and MaxArchiveID < v.ArchiveID then
      MaxArchiveID = v.ArchiveID
      MaxActiveArchivePoint = v
    end
  end
  if nil ~= MaxActiveArchivePoint then
    for key, val in pairs(self.ManualActiveCombat) do
      if val.LinkArchiveID == MaxActiveArchivePoint.ArchiveID then
        val:ResetInfo()
      end
    end
    DebugPrint("==============TriggerGameModeEvent: OnStageStart====BackToTempleArchivePoint================")
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:GetDungeonComponent():OnPlayerLeaveColorRange()
    MaxActiveArchivePoint.UseTimes = MaxActiveArchivePoint.UseTimes + 1
    if GameMode:GetDungeonComponent().CleanMovePlatformDelegateByArchiveId then
      GameMode:GetDungeonComponent():CleanMovePlatformDelegateByArchiveId(MaxActiveArchivePoint.ArchiveID)
    end
    GameMode:TriggerGameModeEvent("OnStageStart", MaxArchiveID, MaxActiveArchivePoint.UseTimes)
    return MaxActiveArchivePoint.ResetPoint:K2_GetComponentLocation(), MaxActiveArchivePoint.ResetPoint:K2_GetComponentRotation()
  end
  return nil, nil
end

function BP_EMGameState_C:GetMutiMaxArchiveID(ArchivePointId, PlayerEid)
  local MaxArchiveID = ArchivePointId
  for k, v in pairs(self.ManualActiveCombat) do
    if v.EnterPlayerList and v:CheckIsActive(PlayerEid) and MaxArchiveID < v.ArchiveID then
      MaxArchiveID = v.ArchiveID
    end
  end
  return MaxArchiveID
end

function BP_EMGameState_C:ArchiveMutiShowFX(ArchivePoint, PlayerEid)
  local MaxArchiveID = self:GetMutiMaxArchiveID(ArchivePoint.ArchiveID, PlayerEid)
  DebugPrint("==============================================LXZ ArchiveMutiShowFX=====MaxArchiveID", MaxArchiveID)
  for k, v in pairs(self.ManualActiveCombat) do
    if v.EnterPlayerList and not v:CheckIsActive(PlayerEid) then
      if MaxArchiveID == v.ArchiveID and v.Eid == ArchivePoint.Eid then
        v:OnMaxFX()
        DebugPrint("==============================================LXZ OnMaxFX=====MaxArchiveID,self.ArchiveID", MaxArchiveID, v.ArchiveID)
      elseif MaxArchiveID >= v.ArchiveID then
        v:OnNormalFX()
        DebugPrint("==============================================lxz OnNormalFX=====MaxArchiveID,self.ArchiveID", MaxArchiveID, v.ArchiveID)
      end
    end
  end
end

function BP_EMGameState_C:BackToPartyArchivePoint(Player)
  local ActiveArchivePoint
  local IDType = DataMgr.Party[self.DungeonId].RespawnRule or 0
  if 0 == IDType then
    local MaxArchiveID = -1
    for k, v in pairs(self.ManualActiveCombat) do
      if v.EnterPlayerList and v:CheckIsActive(Player.Eid) and MaxArchiveID < v.ArchiveID then
        MaxArchiveID = v.ArchiveID
        ActiveArchivePoint = v
      end
    end
  elseif 1 == IDType then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and GameMode:GetDungeonComponent() then
      local Id = GameMode:GetDungeonComponent().PlayerToArchivePointMultiInfo[Player.Eid]
      for k, v in pairs(self.ManualActiveCombat) do
        if v.IsArchivePointActive == true and Id == v.ArchiveID then
          ActiveArchivePoint = v
        end
      end
    end
  elseif 2 == IDType then
    local MinDis = 99999
    for k, v in pairs(self.ManualActiveCombat) do
      if v.IsArchivePointActive == true then
        local Dis = v:GetActorDistance(v, Player)
        if MinDis > Dis then
          MinDis = Dis
          ActiveArchivePoint = v
        end
      end
    end
  end
  if nil ~= ActiveArchivePoint then
    DebugPrint("==============TriggerGameModeEvent: OnStageStart====BackToPartyArchivePoint================")
    return ActiveArchivePoint.ResetPoint:K2_GetComponentLocation(), ActiveArchivePoint.ResetPoint:K2_GetComponentRotation()
  end
  return nil, nil
end

function BP_EMGameState_C:ResetAllArchivePointAndManualActiveCombat()
  for key, val in pairs(self.ManualActiveCombat) do
    if val.LinkArchiveID ~= nil then
      val:ResetInfo()
    end
  end
  for key, val in pairs(self.ManualActiveCombat) do
    if val.IsArchivePointActive == true then
      val:ResetInfo()
    end
  end
  DebugPrint("==============Reset All ArchivePoint And ManualActiveCombat================")
end

function BP_EMGameState_C:ResetAllArchivePoint()
  for key, val in pairs(self.ManualActiveCombat) do
    if val.IsArchivePointActive == true then
      val:ResetInfo()
    end
  end
  DebugPrint("==============Reset All ArchivePoint================")
end

function BP_EMGameState_C:ResetAllManualActiveCombat()
  for key, val in pairs(self.ManualActiveCombat) do
    if val.LinkArchiveID ~= nil then
      val:ResetInfo()
    end
  end
  DebugPrint("==============Reset All ManualActiveCombat================")
end

function BP_EMGameState_C:AddDrone(GroupId, ManualItemId)
  if not self.DroneGroup then
    self.DroneGroup = {}
  end
  if not self.DroneGroup[GroupId] then
    self.DroneGroup[GroupId] = {}
  end
  table.insert(self.DroneGroup[GroupId], ManualItemId)
end

function BP_EMGameState_C:OnDroneFoundPlayer(GroupId, ManualItemId)
  if not self.DroneGroup or not self.DroneGroup[GroupId] then
    return
  end
  for i = 1, #self.DroneGroup[GroupId] do
    local ManualId = self.DroneGroup[GroupId][i]
    local Drone = self.ManualActiveCombat:Find(ManualId)
    if Drone and Drone.IsActive and Drone.ManualItemId ~= ManualItemId then
      Drone:OnOtherDroneFoundPlayer()
    end
  end
end

function BP_EMGameState_C:OnDroneChangeToInit(GroupId, ManualItemId)
  if not self.DroneGroup or not self.DroneGroup[GroupId] then
    return
  end
  local GroupDroneAllFinish = true
  for i = 1, #self.DroneGroup[GroupId] do
    local ManualId = self.DroneGroup[GroupId][i]
    local Drone = self.ManualActiveCombat:Find(ManualId)
    if ManualId ~= ManualItemId and Drone.IsActive and (not Drone.RotateFinish or Drone.AlertValue > 0) then
      GroupDroneAllFinish = false
    end
  end
  return GroupDroneAllFinish
end

function BP_EMGameState_C:OnDroneAlertValueReset(GroupId, ManualItemId)
  if not self.DroneGroup or not self.DroneGroup[GroupId] then
    return
  end
  local GroupDroneAlertValueAllReset = true
  for i = 1, #self.DroneGroup[GroupId] do
    local ManualId = self.DroneGroup[GroupId][i]
    local Drone = self.ManualActiveCombat:Find(ManualId)
    if Drone.AlertValue > 0 then
      GroupDroneAlertValueAllReset = false
      break
    end
  end
  if GroupDroneAlertValueAllReset then
    for i = 1, #self.DroneGroup[GroupId] do
      local ManualId = self.DroneGroup[GroupId][i]
      local Drone = self.ManualActiveCombat:Find(ManualId)
      if Drone and Drone.IsActive then
        Drone:OnAllGroupDroneAlertZero()
        Drone:OnDroneStateChange(0)
      end
    end
  end
end

function BP_EMGameState_C:ChangeMechanismInteractiveInSpecialQuest(bClose, Type, MechanismIds)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if "Part" == Type then
    for i, Mechanism in pairs(GameMode.BPBornRegionActor) do
      self:ChangeMechanismInteractive(Mechanism, bClose, false)
    end
    for i, v in pairs(MechanismIds) do
      local Mechanism = GameMode.BPBornRegionActor:Find(v)
      if not Mechanism then
        GWorld.logger.error("\231\137\185\230\174\138\228\187\187\229\138\161\233\128\154\231\148\168\233\133\141\231\189\174,\230\156\186\229\133\179ID" .. v .. "\233\148\153\232\175\175")
        return
      end
      self:ChangeMechanismInteractive(Mechanism, false, false)
    end
  elseif "Off" == Type then
    self:ChangeMechanismInteractive(nil, bClose, true)
  end
end

function BP_EMGameState_C:ChangeMechanismInteractive(Mechanism, bClose, bOff)
  if bOff then
    if self.MechanismInteractiveClose == nil then
      self.MechanismInteractiveClose = {}
    end
    self.MechanismInteractiveClose[0] = bClose
    return
  end
  if not IsValid(Mechanism) or not Mechanism.BpBorn then
    return
  end
  if false == bClose and nil ~= self.MechanismInteractiveClose[Mechanism.Eid] then
    self.MechanismInteractiveClose[Mechanism.Eid] = nil
    return
  end
  if self.MechanismInteractiveClose == nil then
    self.MechanismInteractiveClose = {}
  end
  self.MechanismInteractiveClose[Mechanism.Eid] = bClose
end

function BP_EMGameState_C:GetMechanismInteractiveInSpecialQuest(Mechanism)
  if Mechanism.BpBorn and self.MechanismInteractiveClose ~= nil and self.MechanismInteractiveClose[0] == true then
    return false
  end
  local Res = self.MechanismInteractiveClose == nil or not self.MechanismInteractiveClose[Mechanism.Eid]
  return Res
end

function BP_EMGameState_C:OnRep_PartyPlayerDisPercentValues()
  self:UpdatePatryPlayerOrdinal()
  EventManager:FireEvent(EventID.OnPartyProgressUpdate)
end

function BP_EMGameState_C:ShowDungeonError(ErrorMsg)
  local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if bDistribution and not bEnableShippingLog then
    return
  end
  local NetMode = ""
  local Avatar
  if IsStandAlone(self) then
    NetMode = "StandAlone"
    Avatar = GWorld:GetAvatar()
  elseif IsDedicatedServer(self) then
    NetMode = "DedicatedServer"
    Avatar = GWorld:GetDSEntity()
  elseif IsClient(self) then
    NetMode = "Client"
    Avatar = GWorld:GetAvatar()
  end
  if not Avatar then
    return
  end
  local Space = "=========================================================\n"
  local ct = {
    Space,
    "\230\138\165\233\148\153\230\150\135\230\156\172:\n\t",
    tostring(ErrorMsg),
    "\n"
  }
  table.insert(ct, Space)
  self:FillNetMode(ct, NetMode)
  self:FillGameStateLog(ct)
  if "DedicatedServer" ~= NetMode then
    self:FillLevelLog(ct)
  end
  table.insert(ct, Space)
  self:FillTraceBack(ct)
  table.insert(ct, Space)
  local FinalMsg = table.concat(ct)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    ScreenPrint("\229\137\175\230\156\172\230\138\165\233\148\153:\n" .. FinalMsg)
  end
  Avatar:SendToFeiShuForRegionMgr(FinalMsg, "\229\137\175\230\156\172\230\138\165\233\148\153 | " .. NetMode)
end

function BP_EMGameState_C:FillNetMode(ct, NetMode)
  table.insert(ct, "\231\142\175\229\162\131: ")
  if "DedicatedServer" == NetMode then
    table.insert(ct, "\232\129\148\230\156\186DS")
  elseif "Client" == NetMode then
    table.insert(ct, "\232\129\148\230\156\186\229\174\162\230\136\183\231\171\175")
  elseif "StandAlone" == NetMode then
    table.insert(ct, "\229\141\149\230\156\186")
  else
    table.insert(ct, "\230\156\170\231\159\165")
  end
  table.insert(ct, "\n")
end

function BP_EMGameState_C:FillGameStateLog(ct)
  table.insert(ct, "\229\137\175\230\156\172Id: " .. self.DungeonId .. "\n")
  table.insert(ct, "\231\142\169\230\179\149\231\177\187\229\158\139: " .. self.GameModeType .. "\n")
  table.insert(ct, "\229\137\175\230\156\172\231\138\182\230\128\129: " .. EGameModeState:GetNameByValue(self.GameModeState) .. "\n")
  table.insert(ct, "\229\137\175\230\156\172\232\191\155\229\186\166: " .. self.DungeonProgress .. "\n")
  return
end

function BP_EMGameState_C:FillLevelLog(ct)
  pcall(function()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local Level_shortname = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(Player)
    table.insert(ct, string.format("\229\189\147\229\137\141\231\142\169\229\174\182\232\191\155\231\154\132\230\139\188\230\142\165\229\133\179\229\141\161: %s", Level_shortname) .. "\n")
    local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
    local path = pro_path .. "Script/Datas/Houdini_data/" .. Level_shortname .. ".json"
    local info = UE4.URuntimeCommonFunctionLibrary.LoadFile(path)
    local json = require("rapidjson")
    local LevelData = json.decode(info)
    local level_ids = Player.CurrentLevelId
    for _, point in pairs(LevelData.points) do
      for i = 1, level_ids:Length() do
        local cur_id = level_ids:Get(i)
        if tostring(point.id) == cur_id then
          local cur_artLevel = point.art_path
          if "" == cur_artLevel then
            cur_artLevel = string.gsub(point.struct, "Data_Design", "Data_Art", 1)
          end
          table.insert(ct, string.format("\230\137\128\229\156\168\231\190\142\230\156\175\229\133\179\229\141\161: %s, \229\133\179\229\141\161id: %s", cur_artLevel, cur_id) .. "\n")
        end
      end
    end
  end)
end

function BP_EMGameState_C:FillTraceBack(ct)
  table.insert(ct, [[
Traceback:
	]])
  table.insert(ct, debug.traceback())
  table.insert(ct, "\n")
end

function BP_EMGameState_C:InitPickupNiagaraPath()
  for _, Path in pairs(Const.PickupNiagaraPaths) do
    self.PickupNiagaraPaths:Add(Path)
  end
end

function BP_EMGameState_C:AddEvent_UpdateCNPCFlexible()
  EventManager:AddEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, self, self.UpdateCNPCFlexible)
end

function BP_EMGameState_C:RemoveEvent_UpdateCNPCFlexible()
  EventManager:RemoveEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, self)
end

function BP_EMGameState_C:DungeonSafePlayTalk_Lua(TalkId)
  local LoadingUI = GWorld.GameInstance:GetLoadingUI()
  if LoadingUI then
    EventManager:AddEvent(EventID.OnCloseLoadingEnableStory, self, function()
      EventManager:RemoveEvent(EventID.OnCloseLoadingEnableStory, self)
      UE4.UPlayTalkAsyncAction.PlayTalk(self, TalkId, nil)
    end)
  else
    UE4.UPlayTalkAsyncAction.PlayTalk(self, TalkId, nil)
  end
end

AssembleComponents(BP_EMGameState_C)
return BP_EMGameState_C
