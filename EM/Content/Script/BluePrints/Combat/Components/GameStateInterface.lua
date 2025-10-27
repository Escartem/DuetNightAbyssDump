local TimeUtils = require("Utils.TimeUtils")
local MiscUtils = require("Utils.MiscUtils")
local Component = Class({
  "BluePrints.Common.TimerMgr"
})

function Component:InitGameStateInterface()
  if not IsAuthority(self) then
    return
  end
  self:RegisterGameModeEvent("OnEnter", self, self.OnEnter)
  self:RegisterGameModeEvent("OnCustomEvent", self, self.OnCustomEvent)
  self:RegisterGameModeEvent("OnPause", self, self.OnPause)
  self:RegisterGameModeEvent("OnBattle", self, self.OnBattle)
  self:RegisterGameModeEvent("OnExit", self, self.OnExit)
  self:RegisterGameModeEvent("OnDisconnect", self, self.OnDisconnect)
end

function Component:GameModeEvent_Lua(Func, ...)
  local FuncName = Func .. "_Lua"
  if nil ~= self[FuncName] then
    DebugPrint("GameStateInterface \230\148\182\229\136\176Custom\228\186\139\228\187\182\229\185\191\230\146\173\232\191\155\232\161\140\232\189\172\229\143\145\239\188\154", Func)
    self[FuncName](self, ...)
  end
end

function Component:InitTimeCheckMgr()
  if IsStandAlone(self) or IsClient(self) then
    self:AddTimer(60, function()
      TimeUtils.RequestSetNowTime()
    end, true, 30, "ClientTimeReset", true)
  end
end

function Component:OnEnter(Eid)
  self:MulticastOnEnter(Eid)
end

function Component:OnExit(EidArr)
  self:MulticastOnExit(EidArr)
end

function Component:OnDisconnect(AvatarEidStr)
  self:MulticastOnDisconnect(AvatarEidStr)
end

function Component:OnCustomEvent(EventName, Channel)
  if Channel == Const.GameModeEventServerClient then
    self:MulticastOnCustomeEvent(EventName)
  end
end

function Component:OnInit()
  self:MulticastGameModeEvent("OnInit")
end

function Component:OnEnd(Result)
  self:MulticastOnEnd(Result)
end

function Component:OnBattle()
  self:MulticastGameModeEvent("OnBattle")
end

function Component:OnPause()
  self:MulticastGameModeEvent("OnPause")
end

function Component:OnAlert()
  self:MulticastGameModeEvent("OnAlert")
end

function Component:OnEnterCommonAlert()
  self:MulticastGameModeEvent("OnEnterCommonAlert")
end

function Component:OnExitCommonAlert()
  self:MulticastGameModeEvent("OnExitCommonAlert")
end

function Component:OnRep_DungeonEvent_Lua()
  if not self.IsCanFreshDungeonEvent then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua IsCanFreshDungeonEvent==false")
    return
  end
  if GWorld.GameInstance.IsInSettlementScene == true then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \229\155\160\228\184\186\229\156\168\231\187\147\231\174\151\231\149\140\233\157\162\232\128\140\233\152\187\230\150\173")
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua Player==nil")
    return
  end
  if not self.LastDungeonEvent then
    self.LastDungeonEvent = {}
  end
  local DungeonEventNum = self.DungeonEvent:Num()
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\148\182\229\136\176\228\186\139\228\187\182\229\185\191\230\146\173, \228\184\138\228\184\128\230\172\161\228\186\139\228\187\182\230\149\176\233\135\143\239\188\154" .. #self.LastDungeonEvent .. "    \229\189\147\229\137\141\228\186\139\228\187\182\230\149\176\233\135\143\239\188\154" .. DungeonEventNum)
  self:PrintAllDungeonEvents()
  self:TriggerUpdateDungeonEvent()
  self.LastDungeonEvent = {}
  for i = 1, self.DungeonEvent:Num() do
    local Event = self.DungeonEvent:GetValueByIdx(i - 1)
    if "" ~= Event then
      self.LastDungeonEvent[i] = self.DungeonEvent:GetValueByIdx(i - 1)
    else
      break
    end
  end
end

function Component:PrintAllDungeonEvents()
  local EventString = ""
  for _, Event in pairs(self.LastDungeonEvent or {}) do
    EventString = EventString .. Event .. ", "
  end
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\137\147\229\141\176\228\184\138\228\184\128\230\172\161\228\186\139\228\187\182\229\134\133\229\174\185   " .. EventString)
  EventString = ""
  for i = 1, self.DungeonEvent:Num() do
    local Event = self.DungeonEvent:GetValueByIdx(i - 1)
    EventString = EventString .. Event .. ", "
  end
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\137\147\229\141\176\229\189\147\229\137\141DungeonEvent\229\134\133\229\174\185   " .. EventString)
end

function Component:TriggerUpdateDungeonEvent()
  local DungeonEventNum = self.DungeonEvent:Num()
  local IgnoreIdx = 0
  local IgnoreIdxCanChange = true
  local RemoveEvents = {}
  local AddEvents = {}
  DebugPrint("GameStateInterface @@@@@@  \230\173\164\230\172\161OnRep\230\148\182\229\136\176TriggerUpdateDungeonEvent", IgnoreIdx, self.DungeonEvent:Num())
  if #self.LastDungeonEvent == DungeonEventNum and 0 ~= #self.LastDungeonEvent then
    local HasNewEvent = false
    for i = 1, self.DungeonEvent:Num() do
      local Event = self.DungeonEvent:GetValueByIdx(i - 1)
      if "" ~= Event and not CommonUtils.HasValue(self.LastDungeonEvent, Event) then
        HasNewEvent = true
        break
      end
    end
    if not HasNewEvent then
      local LastEvent = self.DungeonEvent:GetValueByIdx(DungeonEventNum - 1)
      self:TriggerAddDungeonEvent(LastEvent)
      return
    end
  end
  for i, Event in pairs(self.LastDungeonEvent or {}) do
    if DungeonEventNum >= i and self.DungeonEvent:GetValueByIdx(i - 1) == Event and IgnoreIdxCanChange then
      IgnoreIdx = i
    else
      IgnoreIdxCanChange = false
      table.insert(RemoveEvents, Event)
    end
  end
  for i = 1, self.DungeonEvent:Num() do
    local Event = self.DungeonEvent:GetValueByIdx(i - 1)
    if "" ~= Event and i > IgnoreIdx then
      table.insert(AddEvents, Event)
    end
  end
  for i, RemoveEvent in pairs(RemoveEvents) do
    if not CommonUtils.HasValue(AddEvents, RemoveEvent) then
      self:TriggerRemoveDungeonEvent(RemoveEvent)
    else
      CommonUtils.RemoveValue(AddEvents, RemoveEvent)
    end
  end
  for i, AddEvent in pairs(AddEvents) do
    self:TriggerAddDungeonEvent(AddEvent)
  end
end

function Component:TriggerAddDungeonEvent(Event)
  if "" == Event then
    DebugPrint("GameStateInterface  TriggerAddDungeonEvent \229\135\186\231\142\176\231\169\186\228\186\139\228\187\182")
    return
  end
  local FuncName = Event .. "_Lua"
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\148\182\229\136\176\229\162\158\233\135\143\228\186\139\228\187\182\239\188\154", Event)
  if nil ~= self[FuncName] then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\137\167\232\161\140\229\162\158\233\135\143\228\186\139\228\187\182\239\188\154", FuncName)
    try({
      exec = function()
        self[FuncName](self)
      end,
      catch = function(err)
        DebugPrint(ErrorTag, "AddDungeonEvent Error! EventName: " .. Event .. " traceback: ")
        Traceback(ErrorTag, err, false)
      end
    })
  else
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\228\186\139\228\187\182\239\188\154", FuncName)
  end
end

function Component:TriggerRemoveDungeonEvent(Event)
  if "" == Event then
    DebugPrint("GameStateInterface  TriggerRemoveDungeonEvent \229\135\186\231\142\176\231\169\186\228\186\139\228\187\182")
    return
  end
  local FuncName = "Remove" .. Event .. "_Lua"
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\148\182\229\136\176Remove\228\186\139\228\187\182\239\188\154", Event)
  if nil ~= self[FuncName] then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\137\167\232\161\140Remove\228\186\139\228\187\182\239\188\154", FuncName)
    try({
      exec = function()
        self[FuncName](self)
      end,
      catch = function(err)
        DebugPrint(ErrorTag, "RemoveDungeonEvent Error! EventName: " .. Event .. " traceback: ")
        Traceback(ErrorTag, err, false)
      end
    })
  else
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua \230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\228\186\139\228\187\182\239\188\154", FuncName)
  end
end

function Component:OnRep_GameModeReady()
  DebugPrint("GameStateInterface  Client \230\148\182\229\136\176OnRep_GameModeReady")
  if self.bGameModeReady then
    self:TryEndLoading("GameModeReady")
  end
end

function Component:OnInit_Lua()
  DebugPrint("GameStateInterface  Client \230\148\182\229\136\176\228\186\139\228\187\182OnInit_Lua")
  self:LoadDungeonUI()
  self:InitFbdRule()
  self:UpdatePhonePostProcessMaterial()
end

function Component:RemoveOnInit_Lua()
  DebugPrint("GameStateInterface  Client \230\148\182\229\136\176\228\186\139\228\187\182RemoveOnInit_Lua")
  self:ResetFbdRule()
end

function Component:OnBattle_Lua()
end

function Component:OnExit_Lua(Avatars)
end

function Component:OnDisconnect_Lua(AvatarEidStr)
end

function Component:OnCustomeEvent_Lua(EventName)
  local FunName = "On" .. EventName .. "_Lua"
  DebugPrint("GameStateInterface \230\148\182\229\136\176\228\186\139\228\187\182OnCustomeEvent_Lua\239\188\154", EventName)
  if nil ~= self[FunName] then
    self[FunName](self)
  end
end

function Component:OnDungeonVoteBegin_Lua()
  EventManager:FireEvent(EventID.OnDungeonVoteBegin, self.VoteValues)
  UIManager(self):LoadUINew("Vote")
end

function Component:OnDungeonOneEnter_Lua(Eid)
  DebugPrint("gmy@Component:OnDungeonOneEnter_Lua", Eid)
  local PlayerArray = self.PlayerArray
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  for _, PlayerState in pairs(PlayerArray) do
    if PlayerState.Eid == Eid then
      local MainPlayer = GWorld:GetMainPlayer()
      if MainPlayer and MainPlayer.Eid ~= Eid then
        self:DungeonOtherPlayerChange(PlayerState, true)
        return
      end
    end
  end
end

function Component:IsTeammate(PlayerState)
  return TeamController:GetModel():IsTeammateByAvatarEid(PlayerState.AvatarEidStr)
end

function Component:DungeonOtherPlayerChange(PlayerState, bIsIn)
  if IsClient(self) and not self:IsTeammate(PlayerState) then
    local UIObj = UIManager(self):GetUIObj("TeamToast")
    if UIObj then
      UIManager(self):UnLoadUINew("TeamToast")
    end
    UIManager(self):LoadUINew("TeamToast", PlayerState, bIsIn)
  end
end

function Component:RemoveOnDungeonVoteBegin_Lua(Time, NowTimestamp)
end

function Component:RescueCountDownUI_Lua()
  DebugPrint("RescueUI: ShowCountDown")
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil ~= UIManager then
    local CaptureFloat = UIManager:GetUIObj("DungeonCaptureFloat")
    if nil == CaptureFloat then
      CaptureFloat = UIManager:LoadUINew("DungeonCaptureFloat", self.RescueCountDownTime, DataMgr.GlobalConstant.RescueCountdownPoint.ConstantValue)
    end
    CaptureFloat:InitCaptureTimeUIOnShowDownTime()
  end
end

function Component:RemoveRescueCountDownUI_Lua()
  DebugPrint("RescueUI: CloseCountDown")
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil ~= UIManager then
    local CaptureFloat = UIManager:GetUIObj("DungeonCaptureFloat")
    if CaptureFloat then
      CaptureFloat:Close()
    end
  end
end

function Component:OnRep_RescueCountDownTime()
  DebugPrint("RescueUI: OnRep_RescueCountDownTime CurTime:", self.RescueCountDownTime)
  EventManager:FireEvent(EventID.OnRepRescueCountDownTime)
  if self.RescueCountDownTime <= 15 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local Names = UIManager:GetAllUINameByBPClass(UE4.UClass.Load(UIConst.DUNGEONINDICATOR.GuidePointMechLevel2))
    for _, v in pairs(Names) do
      local HostageDoorGuide = UIManager:GetUIObj(v)
      if HostageDoorGuide and not HostageDoorGuide:IsAnimationPlaying(HostageDoorGuide.Loop) then
        HostageDoorGuide:PlayAnimation(HostageDoorGuide.Loop, 0, 0)
      end
      return
    end
  end
end

function Component:OnRep_bHostageInvincible()
  DebugPrint("OnRep_bHostageInvincible", self.bHostageInvincible)
  EventManager:FireEvent(EventID.NotifyClientChangeHostageInvincible, self.bHostageInvincible)
end

function Component:HostageDyingCountDown_Lua()
  DebugPrint("RescueUI: HostageDyingCountDown")
  EventManager:FireEvent(EventID.TriggerHostageGuideLoop, true)
  local RescueTimeFloat = UIManager(self):GetUIObj("DungeonRescueTimeFloat")
  if nil == RescueTimeFloat then
    RescueTimeFloat = UIManager(self):LoadUINew("DungeonRescueTimeFloat")
  end
  RescueTimeFloat:InitRescueTimeFloatOnHostageDead()
  local CaptureFloat = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if nil == CaptureFloat then
    CaptureFloat = UIManager(self):LoadUINew("DungeonCaptureFloat", 15, 15)
  end
  CaptureFloat:InitCaptureTimeUIOnHostageDead(self:GetHostagePhantomState())
end

function Component:GetHostagePhantomState()
  for _, PhantomState in pairs(self.PhantomArray) do
    if IsValid(PhantomState) and PhantomState.bIsHostage then
      return PhantomState
    end
  end
end

function Component:RemoveHostageDyingCountDown_Lua()
  DebugPrint("RescueUI: RemoveHostageDyingCountDown")
  EventManager:FireEvent(EventID.TriggerHostageGuideLoop, false)
  local RescueTimeFloat = UIManager(self):GetUIObj("DungeonRescueTimeFloat")
  if nil ~= RescueTimeFloat then
    RescueTimeFloat:Close()
  end
  local CaptureFloat = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if nil ~= CaptureFloat then
    CaptureFloat:Close()
  end
end

function Component:OnRepDungeonExitInfo(Info, bIsWaiting)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local CountDownUI = UIManager:GetUIObj("DungeonCaptureFloat")
  local Text
  if bIsWaiting then
    Text = GText("UI_Evacuated") .. tostring(Info.WaitingPlayerNum) .. "/" .. tostring(Info.TotalPlayerNum)
  else
    Text = string.format(GText("UI_Evacuating"), Info.WaitingPlayerNum)
  end
  if Info.bShowExitCountdownToast then
    local RemaingTime = self.ExitCountDown - math.max(math.floor(self.ReplicatedTimeSeconds - Info.StartExitCountdownTime), 0)
    DebugPrint("Show Exit Countdown Toast RemaingTime = " .. RemaingTime, self.ReplicatedTimeSeconds, Info.StartExitCountdownTime)
    if RemaingTime <= 0 then
      return
    end
    if CountDownUI then
      CountDownUI:Reset(RemaingTime, -1, self.ReplicatedTimeSeconds)
      CountDownUI:UIStateChange_OnTarget()
    else
      CountDownUI = UIManager:LoadUINew("DungeonCaptureFloat", RemaingTime, -1)
      CountDownUI:UIStateChange_OnTarget()
    end
    if CountDownUI then
      CountDownUI:SetTitle(Text)
    end
  elseif CountDownUI then
    CountDownUI:UIStateChange_AfterTarget()
  end
end

function Component:OnRep_ExitInfo()
  local ExitMechanismArray = self.MechanismMap:FindRef("ExitTrigger")
  local ExitMechanism
  if ExitMechanismArray then
    ExitMechanism = ExitMechanismArray.Array:ToTable()[1]
  end
  local bIsWaiting = ExitMechanism and ExitMechanism:IsPlayerWaiting(UE4.UGameplayStatics.GetPlayerController(self, 0).Character)
  DebugPrint("GameState:OnRep_ExitInfo", ExitMechanism, bIsWaiting)
  PrintTable(self.ExitInfo)
  if self.GameModeType == "Party" then
    EventManager:FireEvent(EventID.OnPlayerEnterToExit, self.ExitInfo, bIsWaiting)
  else
    self:OnRepDungeonExitInfo(self.ExitInfo, bIsWaiting)
  end
end

function Component:SurvivalValueFinished_Lua()
  DebugPrint("SurvivalUI: SurvivalValueFinished")
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local DungenonSurviveFloat = UIManager:GetUIObj("DungenonSurviveFloat")
  if nil ~= DungenonSurviveFloat then
    DungenonSurviveFloat:OnEnd()
  end
end

function Component:CaptureMonsterRecovery_Lua()
  DebugPrint("CaptureComponent: ShowCaptureMonsterRecovery_Lua")
  EventManager:FireEvent(EventID.ShowDungeonUI)
end

function Component:RemoveCaptureMonsterRecovery_Lua()
  DebugPrint("CaptureComponent: CloseCaptureMonsterRecovery_Lua")
  EventManager:FireEvent(EventID.CloseDungeonUI)
  local SceneMgrComponent = GWorld.GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) and not IsDedicatedServer(self) then
    local CaptureMonsterEid = SceneMgrComponent.CaptureMonsterEid
    local CaptureMonster = Battle(self):GetEntity(CaptureMonsterEid)
    if IsValid(CaptureMonster) then
      CaptureMonster:SetMonWaitForCaught(false)
      CaptureMonster:SetCharacterTag("Idle")
    end
    SceneMgrComponent:RecoverGuideIcon()
  end
end

function Component:Chapter01_Trafficway_Hunt3_Lua()
  local Info = self.ClientTimerStruct:GetTimerInfo("Chapter01_Trafficway_Hunt3")
  DebugPrint("RegionDefenceUI: Chapter01_Trafficway_Hunt3", Info.Time, Info.TimeSeconds, GWorld:IsStandAlone())
  EventManager:FireEvent(EventID.DefenseTimerAdded, Info.Key, Info.Time, Info.TimeSeconds)
  EventManager:FireEvent(EventID.ShowDungeonUI)
end

function Component:RemoveChapter01_Trafficway_Hunt3_Lua()
  local Info = self.ClientTimerStruct:GetTimerInfo("Chapter01_Trafficway_Hunt3")
  DebugPrint("RemoveRegionDefenceUI: Chapter01_Trafficway_Hunt3", Info.Time, Info.TimeSeconds, GWorld:IsStandAlone())
  EventManager:FireEvent(EventID.CloseDungeonUI)
end

function Component:DefenceCountDown_Lua()
  local Info = self.ClientTimerStruct:GetTimerInfo("DefenceCountDown")
  DebugPrint("GameStateInterface \230\148\182\229\136\176 DefenceCountDown_Lua", self:GetLocalRole())
  EventManager:FireEvent(EventID.DefenseTimerAdded, Info.Key, Info.Time, Info.TimeSeconds)
  EventManager:FireEvent(EventID.ShowDungeonUI)
end

function Component:RemoveDefenceCountDown_Lua()
  DebugPrint("GameStateInterface \230\148\182\229\136\176 RemoveDefenceCountDown_Lua", self:GetLocalRole())
end

function Component:OnWaveStart_Lua()
  EventManager:FireEvent(EventID.OnWaveStart)
end

function Component:OnWaveEnd_Lua()
  EventManager:FireEvent(EventID.OnWaveEnd)
end

function Component:OnSurvivalProFinishTutorial_Lua()
  EventManager:FireEvent(EventID.SurvivalProFinishTutorial)
end

function Component:OnSurvivalProSurpossedLeave_Lua()
  EventManager:FireEvent(EventID.SurvivalProSurpossedLeave)
end

function Component:OnSurvivalProBeginTutorial_Lua()
  EventManager:FireEvent(EventID.SurvivalProBeginTutorial)
end

function Component:OnSabotageOptionalMissionSucceed_Lua()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
end

function Component:InitFbdRule()
  DebugPrint("InitFbdRule", self.DungeonId)
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  if not DungeonData then
    return
  end
  local FbdRule = DungeonData.FbdRule
  if not FbdRule then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if FbdRule.NoBattleWheel and 0 ~= FbdRule.NoBattleWheel and Player then
    Player:DisableBattleWheel()
  end
  if Player then
    if FbdRule.NoSkill and 0 ~= FbdRule.NoSkill then
      Player:ForbidAllSkills(true)
    end
    if FbdRule.NoMelee and 0 ~= FbdRule.NoMelee then
      Player:ForbidMeleeSkills(true)
    end
    if FbdRule.NoRanged and 0 ~= FbdRule.NoRanged then
      Player:ForbidRangedSkills(true)
    end
  end
end

function Component:ResetFbdRule()
  DebugPrint("ResetFbdRule", self.DungeonId)
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  if not DungeonData then
    return
  end
  local FbdRule = DungeonData.FbdRule
  if not FbdRule then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if FbdRule.NoBattleWheel and 0 ~= FbdRule.NoBattleWheel and Player then
    Player:EnableBattleWheel()
  end
  if Player then
    if FbdRule.NoSkill and 0 ~= FbdRule.NoSkill then
      Player:ForbidAllSkills(false)
    end
    if FbdRule.NoMelee and 0 ~= FbdRule.NoMelee then
      Player:ForbidMeleeSkills(false)
    end
    if FbdRule.NoRanged and 0 ~= FbdRule.NoRanged then
      Player:ForbidRangedSkills(false)
    end
  end
end

function Component:LoadDungeonUI(DungeonType)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameModeType = self.GameModeType
  if DungeonType then
    GameModeType = string.sub(DungeonType, 7)
  else
    if "Region" == GameModeType then
      return
    end
    if self.DungeonId and Avatar:CheckIsFirstEnterDungeonType(self.DungeonId) and not self.bShown then
      self.bShown = true
      self:TryShowDungeonFirstGuide(self.GameModeType)
    end
  end
  local DungeonUIName = CommonConst.DungeonUINameMap[GameModeType]
  if "Disable" == DungeonUIName then
    return
  end
  local ParamUINameTable = self:GetToLoadDungeonUINames()
  if ("Defence" == GameModeType or "DefencePro" == GameModeType or "Training" == GameModeType) and not UIManager(self):GetUIObj("DungeonToastFloat") then
    UIManager(self):LoadUI(UIConst.DUNGEONTOASTFLOAT, "DungeonToastFloat", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  end
  if ParamUINameTable then
    for _, UIName in pairs(ParamUINameTable) do
      self:RealLoadDungeonUI(UIName)
    end
  elseif DungeonUIName then
    self:RealLoadDungeonUI(DungeonUIName)
  else
    ScreenPrint("LoadDungeonUI\229\138\160\232\189\189\229\175\185\229\186\148\229\137\175\230\156\172UI\229\164\177\232\180\165\239\188\140\230\178\161\230\156\137\229\161\171\229\134\153\233\187\152\232\174\164\229\128\188\239\188\129GameModeType " .. GameModeType)
  end
end

function Component:RealLoadDungeonUI(DungeonUIName)
  if "DungeonHijackFloat" == DungeonUIName then
    return
  end
  if "DungeonCaptureFloat" == DungeonUIName then
    if not UIManager(self):GetUIObj("DungeonCaptureFloat") then
      UIManager(self):LoadUINew("DungeonCaptureFloat", 30, DataMgr.GlobalConstant.CaptureCountdownPoint.ConstantValue, true)
    end
    return
  end
  if not UIManager(self):GetUIObj(DungeonUIName) then
    UIManager(self):LoadUINew(DungeonUIName)
  end
end

function Component:UnloadDungeonUI(DungeonType)
  local GameModeType = self.GameModeType
  if DungeonType then
    GameModeType = string.sub(DungeonType, 7)
  elseif "Region" == GameModeType then
    return
  end
  local DungeonUIName = CommonConst.DungeonUINameMap[GameModeType]
  local ParamUINameTable = self:GetToLoadDungeonUINames()
  if ParamUINameTable then
    for _, UIName in pairs(ParamUINameTable) do
      self:RealCloseDungeonUI(UIName)
    end
  elseif DungeonUIName then
    self:RealCloseDungeonUI(DungeonUIName)
  else
    ScreenPrint("CloseDungeonUI\229\141\184\232\189\189\229\175\185\229\186\148\229\137\175\230\156\172UI\229\164\177\232\180\165\239\188\129GameModeType " .. GameModeType)
  end
end

function Component:RealCloseDungeonUI(DungeonUIName)
  local DungeonUI = UIManager(self):GetUIObj(DungeonUIName)
  if DungeonUI and DungeonUI.CloseDungeonUI then
    DungeonUI:CloseDungeonUI()
  end
end

function Component:GetToLoadDungeonUINames()
  if not self:IsInRegion() then
    return
  end
  local UIParamID = self.CurDungeonUIParamID
  if not UIParamID then
    return
  end
  local UIParamData = DataMgr.DungeonUIParams[UIParamID]
  if not UIParamData then
    return
  end
  return UIParamData.UIName
end

function Component:OnRep_DungeonUIInfo()
  DebugPrint("GameState:OnRep_DungeonUIInfo \229\174\162\230\136\183\231\171\175\230\148\182\229\136\176DungeonUIInfo\230\149\176\230\141\174", self.DungeonUIInfo.TexturePath, self.DungeonUIInfo.TextTitle, self.DungeonUIInfo.TextMap)
  self.HasDungeonUIInfoData = true
  self:RealShowDungeonTask()
end

function Component:ShowDungeonTask_Lua()
  DebugPrint("GameState:ShowDungeonTask_Lua \229\174\162\230\136\183\231\171\175\230\148\182\229\136\176DungeonUIInfo\228\186\139\228\187\182 \228\185\139\229\137\141\231\154\132self.HasDungeonUIInfoEvent", self.HasDungeonUIInfoEvent)
  if self.HasDungeonUIInfoEvent then
    return
  end
  self.HasDungeonUIInfoEvent = true
  self:RealShowDungeonTask()
end

function Component:RealShowDungeonTask()
  DebugPrint("GameState:RealShowDungeonTask \229\174\162\230\136\183\231\171\175\230\152\175\229\144\166\230\148\182\229\136\176\230\149\176\230\141\174", self.HasDungeonUIInfoData, "\229\174\162\230\136\183\231\171\175\230\152\175\229\144\166\230\148\182\229\136\176\228\186\139\228\187\182", self.HasDungeonUIInfoEvent)
  if not self.HasDungeonUIInfoData or not self.HasDungeonUIInfoEvent then
    return
  end
  self.HasDungeonUIInfoData = false
  DebugPrint("GameState:RealShowDungeonTask \229\174\162\230\136\183\231\171\175\230\155\180\230\150\176\228\187\187\229\138\161\230\160\143")
  
  local function WrapFuncEventFire()
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    if not UIManager then
      return
    end
    local BattleMainUI = UIManager:GetUIObj("BattleMain")
    if not BattleMainUI then
      return
    end
    local RealTexturePath = UIConst.DungeonTaskPath[self.DungeonUIInfo.TexturePath] or ""
    BattleMainUI.Pos_TaskBar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    BattleMainUI.Pos_TaskBar:GetChildAt(0):SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    BattleMainUI.Pos_TaskBar:GetChildAt(0):SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    BattleMainUI.Pos_TaskBar:GetChildAt(0):OnLoaded()
    EventManager:FireEvent(EventID.OnReceiveTask, RealTexturePath, self.DungeonUIInfo.TextTitle, self.DungeonUIInfo.TextMap)
  end
  
  WrapFuncEventFire()
end

function Component:ShowRescuePanel_Lua()
  if self.GameModeType == "Rescue" then
    self:TryToShowRescuePanel()
  end
end

function Component:UpdateSurvivalProBuffInfo_Lua()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local SurvivalProUI = UIManager:GetUIObj("DungenonSurviveFloat")
  if SurvivalProUI then
    SurvivalProUI:ShowBuffInfo(self.SurvivalProBuffInfo.PathIconList, self.SurvivalProBuffInfo.TextMapList, self.SurvivalProBuffInfo.Duration)
  end
end

function Component:TryToShowRescuePanel()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local RescuePanel = UIManager:GetUIObj("DungeonRescueFloat")
  if RescuePanel then
    RescuePanel:UIStateChange_OnTarget()
  else
    UIManager:LoadUI(UIConst.DUNGEONDEFENCEFLOAT, "DungeonRescueFloat", UIConst.ZORDER_FOR_DESKTOP_TEMP, true)
  end
end

function Component:TryShowDungeonFirstGuide(GameModeType)
  if not GWorld:IsStandAlone() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if not GameMode:GetLevelLoader() then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  if DataMgr.DungeonTypeToId[GameModeType] then
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local Flow = FlowManager:CreateFlow("GuideMain")
    Flow.OnBegin:Add(Flow, function()
      local UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideUI(self, DataMgr.DungeonTypeToId[GameModeType].GuideId)
      UIStateAsyncActionBase.OnGuideEnd:Add(self, function()
        FlowManager:RemoveFlow(Flow)
      end)
    end)
    FlowManager:AddFlow(Flow)
  end
end

function Component:ShowDungeonToast_Lua(TextMapIndex, Duration, ToastType, ToastColor)
  DebugPrint("ShowDungeonToast_Lua TextMapIndex", TextMapIndex, "Duration", Duration, "ToastType", ToastType)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  if ToastType == EToastType.Common then
    if ToastColor and 0 ~= ToastColor then
      local ExtraColor = {Color = ToastColor}
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(TextMapIndex), Duration, nil, ExtraColor)
    else
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(TextMapIndex), Duration)
    end
  end
  if ToastType == EToastType.Warning then
    UIManager:ShowUITip(UIConst.Tip_CommonWarning, GText(TextMapIndex), Duration, nil, TextMapIndex)
  end
  if ToastType == EToastType.SpecialQuestStart then
    UIManager:LoadUINew("ExploreToastTips", TextMapIndex)
  end
  if ToastType == EToastType.Success then
    UIManager:LoadUINew("ExploreToastSuccess", TextMapIndex)
  end
  if ToastType == EToastType.Failed then
    UIManager:LoadUINew("ExploreToastFail", TextMapIndex)
  end
  if ToastType == EToastType.Treasure then
    if UIManager:GetUIObj("TreasureToast") then
      UIManager:UnLoadUINew("TreasureToast")
    end
    UIManager:LoadUINew("TreasureToast", GText(TextMapIndex), Duration)
  end
  if ToastType == EToastType.SabotageAlarm then
    local ToastUI = UIManager:LoadUINew("DestoryAlarm")
    if ToastUI then
      ToastUI:InitializeData(Duration, true)
    end
  end
end

function Component:UnShowDungeonToast_Lua(Key, ToastType)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  if ToastType == EToastType.Warning then
    UIManager:HideWarningUITip(Key)
  end
end

function Component:ShowCountDownUI_Lua(TextMap, CountDownTime, EnterWarningTime)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local CountDownUI = UIManager:LoadUINew("DungeonCaptureFloat", CountDownTime, EnterWarningTime)
  if CountDownUI then
    CountDownUI:SetTextFromGameMode(TextMap)
    CountDownUI:UIStateChange_OnTarget()
  end
end

function Component:HideCountDownUI_Lua(TextMap)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local CountDownUI = UIManager:GetUIObj("DungeonCaptureFloat")
  if CountDownUI and CountDownUI.KeyToHideSelf == TextMap then
    UIManager:UnLoadUINew("DungeonCaptureFloat")
  end
end

function Component:ShowBuffInfo_Lua(PathIconList, TextMapList, Duration)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local TaskPanel = UIManager:GetUIObj("DungenonSurviveFloat")
  if not TaskPanel then
    return
  end
  TaskPanel:ShowBuffInfo(PathIconList, TextMapList, Duration)
end

function Component:FireEventBuffChange_Lua(BuffId, bAdd, Eid)
  if not GWorld.GameInstance or not GWorld.Battle then
    return
  end
  local Entity = Battle(GWorld.GameInstance):GetEntity(Eid)
  if Entity and rawget(Entity, "TeammateUI") then
    local TeammateUI = rawget(Entity, "TeammateUI")
    TeammateUI:ShowShortageUI(BuffId, bAdd)
  end
end

function Component:OnActiveSurvivalTime_Lua()
  if IsAuthority(self) then
    self:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
  end
end

function Component:OnDefenceWaveStart_Lua()
  EventManager:FireEvent(EventID.OnDefenseWaveStart)
  for Eid, DefenceCore in pairs(self.DefBaseMap) do
    if IsValid(DefenceCore) then
      DefenceCore:OnDefenceWaveStart()
    end
  end
end

function Component:OnDefenceWaveEnd_Lua()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/battle_stage_success", nil, nil)
  EventManager:FireEvent(EventID.OnDefenceWaveEnd)
  for Eid, DefenceCore in pairs(self.DefBaseMap) do
    if IsValid(DefenceCore) then
      DefenceCore:OnDefenceWaveEnd()
    end
  end
end

function Component:UpdateDungeonVote_Lua(VoteValues)
  local MainPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  EventManager:RemoveEvent(EventID.OnDungeonVoteBegin, self)
  if not self.IsCanFreshDungeonEvent then
    EventManager:AddEvent(EventID.OnDungeonVoteBegin, self, self.UpdateDungeonVote_Lua)
    return
  end
  if 0 == VoteValues:Length() and UIManager(self):GetUIObj("Vote") then
    if MainPlayer then
      print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Clear VoteValues")
      MainPlayer:TriggerFreezeMove(false)
    end
    EventManager:FireEvent(EventID.OnRepDungeonVoteInterval)
    return
  end
  print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua", VoteValues)
  if VoteValues:FindRef(MainPlayer.Eid) == EVoteState.Forbid then
    return
  end
  print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Load Vote bushiren")
  if not UIManager(self):GetUIObj("Vote") then
    for Eid, Value in pairs(VoteValues) do
      if Value ~= EVoteState.Wait then
        return
      end
    end
    if MainPlayer then
      print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Load Vote")
      MainPlayer:TriggerFreezeMove(true)
    end
    UIManager(self):LoadUINew("Vote")
  elseif UIManager(self):GetUIObj("Vote") then
    EventManager:FireEvent(EventID.UpdateDungeonValues, VoteValues)
    if not IsDedicatedServer(self) and IsAuthority(self) then
      EventManager:FireEvent(EventID.OnRepDungeonVoteInterval)
      self:DealDungeonVoteResult()
    end
  end
end

function Component:UpdateDungeonLoadingProgress()
  self.LoadingProgressInfo = 0
  if self.LevelLoaderReady then
    self.LoadingProgressInfo = self.LoadingProgressInfo + 50
  end
  self.LoadingProgressInfo = self.LoadingProgressInfo + 40 * self:GetPreloadProgress()
  if self.bGameModeReady then
    self.LoadingProgressInfo = self.LoadingProgressInfo + 1
  end
  if self.PlayerReady then
    self.LoadingProgressInfo = self.LoadingProgressInfo + 2
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UI = GameInstance:GetLoadingUI()
  if UI then
    UI:AddQuene(self.LoadingProgressInfo)
  end
end

function Component:TryEndLoading(Reason)
  if not self.LevelLoaderReady then
    if self:GetCurrentLevelLoader() then
      self.LevelLoaderReady = false
    else
      self.LevelLoaderReady = true
    end
  else
    self:UpdateDungeonLoadingProgress()
  end
  print(_G.LogTag, "TryEndLoading", self.PlayerReady, self.bGameModeReady, self.LevelLoaderReady, self:IsPreloadGameAssetsReady(), Reason, self.DungeonId)
  if self.PlayerReady and self.LevelLoaderReady and self:NeedPreloadGameAssets() then
    self:PreloadGameAssets()
  end
  if self.bGameModeReady and self.LevelLoaderReady and self:IsPreloadGameAssetsReady() and self:IsPreloadGameAssetsReady() then
    self:PreCreateUnit()
  end
  if IsDedicatedServer(self) then
    local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.URolePreloadGameInstanceSubsystem)
    if PreloadSystem then
      PreloadSystem:DSLoadBT()
    end
  end
  if self.bGameModeReady and self.LevelLoaderReady and self:IsPreloadGameAssetsReady() and self.bRegionPreCreateUnitReady then
    if (self.PlayerReady or MiscUtils.IsListenServer(self)) and not self.EndLoadingSuccess then
      self.EndLoadingSuccess = true
      local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
      PlayerController:NotifyServerClientReady()
      local WorldCompositionSubSystem = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(self, UE4.UWorldCompositionSubSystem)
      if WorldCompositionSubSystem then
        local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
        if SubSystem then
          SubSystem:SetRegionInitState(ERegionInitState.RegionEntityCreating)
        end
        WorldCompositionSubSystem:TickAsyncQueueReady()
      else
        local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
        if SubSystem then
          SubSystem:SetRegionInitState(ERegionInitState.AllReady)
        end
      end
      print(_G.LogTag, "SetSyncLoaderOptimization True")
      GWorld.GameInstance:SetSyncLoaderOptimization(true)
    else
      self.EndLoadingSuccess = false
    end
  end
end

function Component:PreCreateUnit()
  if not self:RegionNeedPreCreateUnit() then
    self.bRegionPreCreateUnitReady = true
    return
  end
  local WorldCompositionSubSystem = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(self, UE4.UWorldCompositionSubSystem)
  if not WorldCompositionSubSystem then
    self.bRegionPreCreateUnitReady = true
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    self.bRegionPreCreateUnitReady = true
    return
  end
  GameMode:GetRegionDataMgrSubSystem():OnInitRecoverRegionData(false)
  WorldCompositionSubSystem:PreCreateUnit()
end

function Component:IsPreloadGameAssetsReady()
  local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.URolePreloadGameInstanceSubsystem)
  if not PreloadSystem or not PreloadSystem:EnableOptimization() then
    return true
  end
  return self.bPreloadAssetsReady
end

function Component:GetPreloadProgress()
  local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.URolePreloadGameInstanceSubsystem)
  if not (PreloadSystem and PreloadSystem:EnableOptimization()) or self.bPreloadAssetsReady then
    return 1.0
  end
  return PreloadSystem:GetAsyncLoadingProgress()
end

function Component:NeedPreloadGameAssets()
  return not self:IsPreloadGameAssetsReady() and not self.bAssetsPreloading
end

function Component:PreloadGameAssets()
  local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.URolePreloadGameInstanceSubsystem)
  if not PreloadSystem then
    self.bPreloadAssetsReady = true
    self.bAssetsPreloading = false
    return
  end
  local UnitBudgetSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.UUnitBudgetAllocatorSubsystem)
  if UnitBudgetSystem then
    local bSkip = false
    if IsClient(self) then
      bSkip = true
    else
      local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      if MainPlayer then
        for _, ConfigId in ipairs(Const.SkipShadowBudgetConfig) do
          if MainPlayer.CurrentRoleId == tonumber(ConfigId) then
            bSkip = true
            break
          end
        end
      end
      if false == bSkip and MainPlayer and MainPlayer.GetPhantomTeammates then
        for i, Phantom in pairs(MainPlayer:GetPhantomTeammates()) do
          if Phantom then
            for _, ConfigId in ipairs(Const.SkipShadowBudgetConfig) do
              if Phantom.CurrentRoleId == tonumber(ConfigId) then
                bSkip = true
                break
              end
            end
          end
          if bSkip then
            break
          end
        end
      end
    end
    if self:IsInDungeon() and false == bSkip then
      UnitBudgetSystem:UpdateDynamicShadowBudget(false)
    else
      UnitBudgetSystem:UpdateDynamicShadowBudget(true)
    end
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PhantomTable = Player and Player:GetPhantomTeammates(false, false):ToTable() or {}
  PreloadSystem:ReleaseAllCacheBeforeChangeScene({
    Player and Player.CurrentRoleId or 0
  })
  PreloadSystem:ReleaseAllCacheObj(false)
  PreloadSystem:PreloadScatteredAsset_All()
  if Player and true == Player.DelayCacheLoadPlayerAssets then
    if not PreloadSystem:IsRoleAssetCached(Player.CurrentRoleId) then
      Player:GetCharPreloadComp():CacheLoadAssets()
    end
    for _, Phantom in pairs(PhantomTable) do
      Phantom:GetCharPreloadComp():PreloadAssets({})
    end
  end
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  if self:IsInDungeon() then
    PreloadSystem:PreloadScatteredAsset_Dungeon(DungeonId or 0)
  elseif self:IsInRegion() then
    PreloadSystem:PreloadScatteredAsset_Region()
  end
  if nil == DungeonId then
    self.bPreloadAssetsReady = true
    self.bAssetsPreloading = false
    return
  end
  print(_G.LogTag, "wzj- \229\137\175\230\156\172\232\181\132\230\186\144\233\162\132\229\138\160\232\189\189 Start", UE4.UGameplayStatics.GetTimeSeconds(self), DungeonId)
  self.bPreloadAssetsReady = false
  self.bAssetsPreloading = true
  local Res = PreloadSystem:CacheDungeonGameAssetsOuter({
    self,
    self.PreloadGameAssetsCallback
  })
  if not Res then
    self:PreloadGameAssetsCallback()
  end
end

function Component:PreloadGameAssetsCallback()
  print(_G.LogTag, "wzj- \229\137\175\230\156\172\232\181\132\230\186\144\233\162\132\229\138\160\232\189\189 End", UE4.UGameplayStatics.GetTimeSeconds(self), GWorld.GameInstance:GetCurrentDungeonId())
  self.bPreloadAssetsReady = true
  self.bAssetsPreloading = false
  self:TryEndLoading("AssetsPreload")
end

function Component:ShowPetDefenseDynamicEvent_Lua()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    DynamicEventUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    DynamicEventUI:PetPlayInAnim()
    DynamicEventUI:SetEventInfo(GText(self.PetEventName), GText(self.PetEventDescribe))
    DynamicEventUI:HidePetProgressRoot()
  end
end

function Component:ShowPetDefenseProgress_Lua()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    DynamicEventUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    DynamicEventUI:PlayAnimation(DynamicEventUI.Get_In)
    DynamicEventUI:SetEventInfo(GText(self.PetEventName), GText(self.PetEventDescribe))
    DynamicEventUI:ShowPetProgress()
    self:PetCaputreDefenceWidgetShow()
  end
end

function Component:RemoveShowPetDefenseProgress_Lua()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    DynamicEventUI:HidePetProgress(self.PetEventSuccess, self.PetEventFail, self.PetSuccess)
    self:PetCaputreDefenceWidgetHide()
  end
end

function Component:PetPlayFailureMontage_Lua()
  local DefencePet = self:GetNpcInfo(self.PetId)
  if IsValid(DefencePet) then
    DefencePet:PlayFailureMontageThenDestroy()
  end
end

function Component:PetAddGuideAllPlayer()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for i, Player in pairs(GameMode:GetAllPlayer()) do
    DebugPrint("=======================PetAddGuideAllPlayer=========IsInHidePetPlayers====Player.Eid:", self:IsInHidePetPlayers(Player.Eid), Player.Eid)
    if self:IsInHidePetPlayers(Player.Eid) == false then
      self:PetAddGuide(Player.Eid)
    end
  end
end

function Component:PetAddGuide(PlayerEid)
  local Pet = self:GetNpcInfo(self.PetId)
  DebugPrint("================================PetAddGuide======Pet.Eid, Player.Eid:", Pet.Eid, PlayerEid)
  self:AddGuideEid(Pet.Eid, PlayerEid)
end

function Component:PetRemoveGuide(PetEid)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  DebugPrint("=======================================PetRemoveGuide===PetEid,Player.Eid=", PetEid, Player.Eid)
  self:RemoveGuideEid(PetEid, Player.Eid)
end

function Component:UpdatePetDefenseProgress()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    DynamicEventUI:UpdatePetProgress()
    self:PetCaputreDefenceWidgetUpdate()
  end
end

function Component:PetDefenceCoreDestory()
  local DefenceCore = self:GetDefenceCore(self.PetDefenceCoreId)
  if DefenceCore then
    DefenceCore:K2_DestroyActor()
  end
end

function Component:PetCaputreDefenceWidgetShow()
  local DefenceCore = self:GetDefenceCore(self.PetDefenceCoreId)
  if IsValid(DefenceCore) and DefenceCore.PetCaptureDefense then
    self:PetCaputreDefenceWidgetUpdateByDefenceCore(DefenceCore)
    DefenceCore.PetCaptureDefense:SetHiddenInGame(false)
    DefenceCore.PetCaptureDefense.PetRoot = DefenceCore.PetRoot
  end
end

function Component:PetCaputreDefenceWidgetHide()
  local DefenceCore = self:GetDefenceCore(self.PetDefenceCoreId)
  if IsValid(DefenceCore) and DefenceCore.PetCaptureDefense then
    local Widget = DefenceCore.PetCaptureDefense:GetWidget()
    Widget:PlayAnimation(Widget.Out)
    DefenceCore.PetCaptureDefense.PetRoot = nil
  end
end

function Component:PetCaputreDefenceWidgetUpdate()
  local DefenceCore = self:GetDefenceCore(self.PetDefenceCoreId)
  self:PetCaputreDefenceWidgetUpdateByDefenceCore(DefenceCore)
end

function Component:PetCaputreDefenceWidgetUpdateByDefenceCore(DefenceCore)
  if IsValid(DefenceCore) and DefenceCore.PetCaptureDefense then
    local Widget = DefenceCore.PetCaptureDefense:GetWidget()
    local TotalVal = DataMgr.GlobalConstant.PetDefenceMonsterNum.ConstantValue
    local Rate = self.PetDefenceKilledNum / TotalVal
    Rate = math.min(Rate, 1)
    DefenceCore:UpdatePetFXProgress(Rate)
    Widget.Text_Process:SetText(math.floor(Rate * 100))
  end
end

function Component:GetDefenceCore(UnitId)
  local Mechanisms = self.MechanismMap:FindRef("DefenceCore")
  if nil ~= Mechanisms then
    Mechanisms = Mechanisms.Array
    for _, Mechanism in pairs(Mechanisms:ToTable()) do
      if Mechanism.UnitId == UnitId then
        return Mechanism
      end
    end
  end
  return nil
end

function Component:OnRep_PetDefenceKilled()
  self:UpdatePetDefenseProgress()
  UE4.UGameplayStatics.GetGameState(self):MarkPetDefenceKilledNumAsDirtyData()
end

function Component:SelectTicket_Lua()
  print(_G.LogTag, "LXZ SelectTicket")
  if IsStandAlone(self) then
    local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
    
    local function OnRightConfirm(_, PackageData)
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      Avatar:SelectTicket(nil, DungeonId, PackageData.Content_1.TicketId)
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      GameMode:ExecuteNextStepOfTicket()
    end
    
    if self:CheckAvatarHasTicket() then
      local CommonDialog = UIManager(self):ShowCommonPopupUI(100252, {
        DungeonId = DungeonId,
        RightCallbackObj = self,
        RightCallbackFunction = OnRightConfirm,
        ForbiddenRightCallbackObj = self,
        AutoFocus = true,
        DisableEscClose = true
      }, self)
      EventManager:AddEvent(EventID.OnSelectTicketTimeout, self, self.OnSelectTicketTimeout)
    else
      OnRightConfirm(_, {
        Content_1 = {TicketId = 0}
      })
    end
  end
end

function Component:OnRep_NextTicketPlayer()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Eid = Player.Eid
  local ClientRes = self.NextTicketPlayer:Find(Eid)
  if false ~= ClientRes or UIManager(self):GetUIObj("CommonDialog") then
    for i, v in pairs(self.NextTicketPlayer) do
      if not v then
        return
      end
    end
    EventManager:FireEvent(EventID.DungeonSelectTicketEnd)
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  
  local function OnRightConfirm(_, PackageData)
    Avatar:SelectTicket(nil, DungeonId, PackageData.Content_1.TicketId)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    PlayerCharacter.RPCComponent:SendDungeonTicket(Eid, true)
  end
  
  if self:CheckAvatarHasTicket() then
    local ResourceServerData = Avatar.Resources[TicketId]
    local CommonDialog = UIManager(self):ShowCommonPopupUI(100252, {
      DungeonId = DungeonId,
      RightCallbackObj = self,
      RightCallbackFunction = OnRightConfirm,
      ForbiddenRightCallbackObj = self,
      DontCloseWhenRightBtnClicked = true,
      DisableEscClose = true
    }, self)
    EventManager:AddEvent(EventID.OnSelectTicketTimeout, self, self.OnSelectTicketTimeout)
  else
    OnRightConfirm(_, {
      Content_1 = {TicketId = 0}
    })
  end
end

function Component:CheckAvatarHasTicket()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not DungeonInfo or not DungeonInfo.TicketId then
    return false
  end
  if DungeonInfo and DungeonInfo.NoTicketEnter then
    return true
  end
  for i, v in pairs(DungeonInfo.TicketId) do
    local ResourceServerData = Avatar.Resources[v]
    if ResourceServerData and ResourceServerData.Count and ResourceServerData.Count > 0 then
      return true
    end
  end
  return false
end

function Component:OnSelectTicketTimeout(TicketId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  if IsStandAlone(self) then
    Avatar:SelectTicket(nil, DungeonId, TicketId)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:ExecuteNextStepOfTicket()
  else
    Avatar:SelectTicket(nil, DungeonId, TicketId)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    PlayerCharacter.RPCComponent:SendDungeonTicket(PlayerCharacter.Eid, true)
  end
end

function Component:UpdateDungeonTicket_Lua(NextTicketPlayer)
  if not IsAuthority(self) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    if not NextTicketPlayer:Find(Player.Eid) then
      return
    end
  end
  GameMode:BpDelTimer("SelectTicket", false, Const.GameModeEventServerClient)
  GameMode:RemoveDungeonEvent("SelectTicket")
  GameMode:ExecuteNextStepOfTicket()
end

function Component:ShowWalnutReward_Lua()
  DebugPrint("WalnutReward ShowWalnutReward_Lua")
  if not UIManager(self):GetUIObj("WalnutReward") then
    UIManager(self):LoadUINew("WalnutReward")
  end
end

function Component:RemoveShowWalnutReward_Lua()
  DebugPrint("WalnutReward RemoveShowWalnutReward_Lua")
  local WalnutRewardUI = UIManager(self):GetUIObj("WalnutReward")
  if WalnutRewardUI then
    WalnutRewardUI:Close()
  end
end

function Component:OnRep_WalnutRewardPlayer()
  DebugPrint("WalnutReward OnRep_WalnutRewardPlayer")
  local WalnutRewardUI = UIManager(self):GetUIObj("WalnutReward")
  if WalnutRewardUI then
    WalnutRewardUI:ReceiveWalnutRewardChoose()
  end
end

function Component:NextWalnut_Lua()
  DebugPrint("DungeonWalnutChoice NextWalnut_Lua")
  if not UIManager(self):GetUIObj("WalnutChoice") then
    UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Dungeon)
  end
end

function Component:RemoveNextWalnut_Lua()
  DebugPrint("DungeonWalnutChoice RemoveNextWalnut_Lua")
  local WalnutChoiceUI = UIManager(self):GetUIObj("WalnutChoice")
  if WalnutChoiceUI then
    if IsStandAlone(self) then
      WalnutChoiceUI:Close()
    else
      WalnutChoiceUI:PlayWalnutReady()
    end
  end
end

function Component:WalnutReady_Lua()
  DebugPrint("WalnutReady_Lua")
end

function Component:RemoveWalnutReady_Lua()
  DebugPrint("DungeonWalnutChoice RemoveWalnutReady_Lua")
  local WalnutChoiceUI = UIManager(self):GetUIObj("WalnutChoice")
  if WalnutChoiceUI then
    WalnutChoiceUI:Close()
  end
end

function Component:OnRep_NextWalnutPlayer()
  DebugPrint("DungeonWalnutChoice OnRep_NextWalnutPlayer")
  local NextWalnutPlayer = self.NextWalnutPlayer:ToTable()
  PrintTable(NextWalnutPlayer)
  local WalnutChoiceUI = UIManager(self):GetUIObj("WalnutChoice")
  if WalnutChoiceUI then
    WalnutChoiceUI:ReceiveTeammateChoose(NextWalnutPlayer)
  end
end

function Component:AbyssBattleNew_Lua()
  DebugPrint("AbyssBattleNew_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown_Progress")
  AbyssCountDownUI = AbyssCountDownUI or UIManager(self):LoadUINew("Abyss_CountDown_Progress")
  AbyssCountDownUI:ShowAbyssCountDown("AbyssBattleNew")
end

function Component:RemoveAbyssBattleNew_Lua()
  DebugPrint("RemoveAbyssBattleNew_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown_Progress")
  if not AbyssCountDownUI then
    return
  end
  AbyssCountDownUI:HideAbyssCountDown("AbyssBattleNew")
end

function Component:AbyssBattle_Lua()
  DebugPrint("AbyssBattle_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown")
  AbyssCountDownUI = AbyssCountDownUI or UIManager(self):LoadUINew("Abyss_CountDown")
  AbyssCountDownUI:ShowAbyssCountDown("AbyssBattle")
end

function Component:RemoveAbyssBattle_Lua()
  DebugPrint("RemoveAbyssBattle_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown")
  if not AbyssCountDownUI then
    return
  end
  AbyssCountDownUI:HideAbyssCountDown("AbyssBattle")
end

function Component:AbyssNextRoom_Lua()
  DebugPrint("AbyssNextRoom_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown")
  AbyssCountDownUI = AbyssCountDownUI or UIManager(self):LoadUINew("Abyss_CountDown")
  AbyssCountDownUI:ShowAbyssCountDown("AbyssNextRoom")
end

function Component:RemoveAbyssNextRoom_Lua()
  DebugPrint("RemoveAbyssNextRoom_Lua")
  local AbyssCountDownUI = UIManager(self):GetUIObj("Abyss_CountDown")
  if not AbyssCountDownUI then
    return
  end
  AbyssCountDownUI:HideAbyssCountDown("AbyssNextRoom")
end

function Component:PartyWaitPlayerEnter_Lua()
  local PartyWaitUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  PartyWaitUI = PartyWaitUI or UIManager(self):LoadUINew("DungeonCaptureFloat", 60)
  PartyWaitUI:InitPartyWaitUI()
end

function Component:RemovePartyWaitPlayerEnter_Lua()
  local PartyWaitUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if not PartyWaitUI then
    return
  end
  PartyWaitUI:ClosePartyWaitUI()
end

function Component:OnRep_PartyTime()
  local Eid = UGameplayStatics.GetPlayerCharacter(self, 0).Eid
  local CompletionRate = 0
  local NumOfPlayers = 1
  if 0 ~= self.PartyPlayerDisPercent.Items:Num() then
    CompletionRate = self.PartyPlayerDisPercent.Items[Eid].Value
    NumOfPlayers = self.PartyPlayerDisPercent.Items:Num()
  end
  local PlayerRank = 1
  for Id, Rate in pairs(self.PartyPlayerDisPercent.Items) do
    if Id ~= Eid and CompletionRate < Rate.Value then
      PlayerRank = PlayerRank + 1
    end
  end
  EventManager:FireEvent(EventID.OnUpdatePartyLeftUI, self.PartyTime)
  EventManager:FireEvent(EventID.OnUpdatePartyRightUI, CompletionRate, PlayerRank, NumOfPlayers)
end

function Component:OnPartyPlayerGetBuff(Eid, BuffId, IsPositive, Time)
  EventManager:FireEvent(EventID.OnPartyPlayerGetBuff, Eid, BuffId, IsPositive, Time)
end

function Component:OnPartyPlayerTriggerFallTrigger(Eid)
  EventManager:FireEvent(EventID.OnPartyPlayerTriggerFallTrigger, Eid)
end

function Component:OnPartyPlayerFirstComplete(Eid)
  EventManager:FireEvent(EventID.OnOnePlayerEnd, Eid)
end

function Component:OnNotifyPartyBuff_Lua(BuffId, LastTime, Eid)
  EventManager:FireEvent(EventID.OnPlayerGetDeBuff, BuffId, LastTime, Eid)
end

function Component:SabotageProLimitTimer_Lua()
  DebugPrint("SabotageProComponent:Client SabotageProLimitTimer_Lua", self.DungeonId)
  local CommonClientTimerUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  CommonClientTimerUI = CommonClientTimerUI or UIManager(self):LoadUINew("DungeonCaptureFloat")
  CommonClientTimerUI:InitClientTimerByHandleName("SabotageProLimitTimer", "UI_TEMPLE_LIMIT_TIME", 10)
end

function Component:RemoveSabotageProLimitTimer_Lua()
  DebugPrint("SabotageProComponent:Client RemoveSabotageProLimitTimer_Lua", self.DungeonId)
  local CommonClientTimerUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if not CommonClientTimerUI then
    return
  end
  CommonClientTimerUI:CloseClientTimerByHandleName()
end

function Component:SynthesisBuffList_Lua()
  self.SynthesisBuffList = UIManager(self):_CreateWidgetNew("SynthesisBuffList")
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  BattleMainUI.Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMainUI.Task:AddChildToOverlay(self.SynthesisBuffList)
  self.SynthesisBuffList:Init()
end

function Component:RemoveSynthesisBuffList_Lua()
  if self.SynthesisBuffList then
    self.SynthesisBuffList:RemoveFromParent()
  end
end

function Component:SynthesisDestruction_Lua()
  local SynthesisUI = UIManager(self):GetUIObj("DungeonSynthesisFloat")
  SynthesisUI = SynthesisUI or UIManager(self):LoadUINew("DungeonSynthesisFloat")
end

function Component:RemoveSynthesisDestruction_Lua()
  local SynthesisUI = UIManager(self):GetUIObj("DungeonSynthesisFloat")
  if SynthesisUI then
    SynthesisUI:Close()
  end
  self:ShowSynthesisSuccessEffect()
end

function Component:OnRep_RageValue()
  EventManager:FireEvent(EventID.OnRepSynthesisRageValue, self.RageValue)
  self:UpdateSynthesisDestructionTaskProgress()
end

function Component:OnRep_GuideSupervisorEids()
  EventManager:FireEvent(EventID.OnRepGuideSupervisorEids, self.GuideSupervisorEids, self.DeadSupervisorEids)
  self:UpdateSynthesisDestructionTaskProgress()
end

function Component:OnRep_DeadSupervisorEids()
  EventManager:FireEvent(EventID.OnRepDeadSupervisorEids, self.GuideSupervisorEids, self.DeadSupervisorEids)
end

function Component:UpdateSynthesisDestructionTaskProgress()
  local DungeonInfo = DataMgr.Synthesis[self.DungeonId]
  if not DungeonInfo then
    return
  end
  if not DungeonInfo.RageValueStages then
    return
  end
  local GuideSupervisorNum = self.GuideSupervisorEids:Num()
  if self.SynthesisGuideNumCache and self.SynthesisGuideNumCache == GuideSupervisorNum then
    return
  end
  self.SynthesisGuideNumCache = GuideSupervisorNum
  DebugPrint("Synthesis Destruction UpdateDungeonTaskProgress", GuideSupervisorNum, #DungeonInfo.RageValueStages)
  self:UpdateDungeonTaskProgress(GuideSupervisorNum, #DungeonInfo.RageValueStages)
end

function Component:ShowDiscoverSupervisorToast_Lua(Percent)
  local SynthesisUI = UIManager(self):GetUIObj("DungeonSynthesisFloat")
  if SynthesisUI then
    SynthesisUI:ShowDiscoverSupervisorToast(Percent)
  end
end

function Component:SynthesisOccupation_Lua()
  self:OnRep_OccupationFinishNum()
end

function Component:RemoveSynthesisOccupation_Lua()
  self:ShowSynthesisSuccessEffect()
end

function Component:OnRep_OccupationFinishNum()
  local DungeonInfo = DataMgr.Synthesis[self.DungeonId]
  if not DungeonInfo then
    return
  end
  if not DungeonInfo.OccupationTargetNum then
    return
  end
  DebugPrint("Synthesis Occupation UpdateDungeonTaskProgress", self.OccupationFinishNum, DungeonInfo.OccupationTargetNum)
  self:UpdateDungeonTaskProgress(self.OccupationFinishNum, DungeonInfo.OccupationTargetNum)
end

function Component:SynthesisCrack_Lua()
  UIManager(self):LoadUINew("DungeonSynthesisCrack")
end

function Component:RemoveSynthesisCrack_Lua()
  local SynthesisCrackUI = UIManager(self):GetUIObj("DungeonSynthesisCrack")
  if SynthesisCrackUI then
    SynthesisCrackUI:PlayOutAnimation()
  end
  EventManager:FireEvent(EventID.CloseDungeonUI)
  self:ShowSynthesisSuccessEffect(2)
end

function Component:OnRep_KeySubmitNum()
  EventManager:FireEvent(EventID.OnRepKeySubmitNum, self.KeySubmitNum)
end

function Component:OpenChestTime_Lua()
  local CommonClientTimerUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  CommonClientTimerUI = CommonClientTimerUI or UIManager(self):LoadUINew("DungeonCaptureFloat")
  CommonClientTimerUI:InitClientTimerByHandleName("OpenChestTime", "DUNGEON_SYNTHESIS_112", 0)
end

function Component:RemoveOpenChestTime_Lua()
  local CommonClientTimerUI = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if not CommonClientTimerUI then
    return
  end
  CommonClientTimerUI:CloseClientTimerByHandleName()
end

function Component:ShowSynthesisSuccessEffect(DelayTime)
  local function ShowSuccessEffect()
    local SuccessEffectUI = UIManager(self):LoadUINew("SynthesisSuccessEffect")
    
    if SuccessEffectUI then
      SuccessEffectUI:ShowEffect()
    end
  end
  
  if DelayTime and DelayTime > 0 then
    self:AddTimer(DelayTime, ShowSuccessEffect)
  else
    ShowSuccessEffect()
  end
end

function Component:UpdateDungeonTaskProgress(CurProgress, TotalProgress)
  self.CurProgressCache = CurProgress
  self.TotalProgressCache = TotalProgress
  EventManager:FireEvent(EventID.OnDungeonTaskProgress, CurProgress, TotalProgress)
end

function Component:OnRep_DungeonProgress()
  EventManager:FireEvent(EventID.OnRepDungeonProgress, self.DungeonProgress)
end

function Component:UpdatePhonePostProcessMaterial()
  if not self:IsMobile() then
    return
  end
  local Res = self:IsNeedPostProcessMaterial()
  self:SetPostProcessMaterial(Res)
  DebugPrint("BP_EMGameMode_C:UpdatePhonePostProcessMaterial", Res)
end

function Component:IsNeedPostProcessMaterial()
  if self:IsInDungeon() then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  local SubRegionId = Avatar.CurrentRegionId or 0
  local SubRegionInfo = DataMgr.SubRegion[SubRegionId]
  if not SubRegionInfo or SubRegionInfo.RegionId ~= Const.BigIceLakeRegionId then
    return true
  end
  if not GWorld.GameInstance then
    return true
  end
  local IsLowScalabilityLevel = GWorld.GameInstance:GetGameplayScalabilityLevel() <= 1
  local IsLowMemoryDevice = GWorld.GameInstance:IsLowMemoryDevice()
  if IsLowScalabilityLevel and IsLowMemoryDevice then
    return false
  else
    return true
  end
end

function Component:SetPostProcessMaterial(IsActive)
  if IsActive then
    UKismetSystemLibrary.ExecuteConsoleCommand(self, "r.Mobile.PostProcessMaterial 1")
  else
    UKismetSystemLibrary.ExecuteConsoleCommand(self, "r.Mobile.PostProcessMaterial 0")
  end
end

function Component:IsMobile()
  local IsUseMapPhone = GWorld.GameInstance and GWorld.GameInstance:GetUseMapPhoneInPC()
  local PlatformName = UGameplayStatics.GetPlatformName()
  return IsUseMapPhone or "IOS" == PlatformName or "Android" == PlatformName
end

return Component
