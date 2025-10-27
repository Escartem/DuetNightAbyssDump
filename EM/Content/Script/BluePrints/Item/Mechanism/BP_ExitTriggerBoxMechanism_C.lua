require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local BP_ExitTriggerBoxMechanism_C = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")
local OverlapActor = {}
local PlayerState = {
  Play = 1,
  Dead = 2,
  WaitExit = 3,
  Leave = 4
}

function BP_ExitTriggerBoxMechanism_C:Initialize(Initializer)
  BP_ExitTriggerBoxMechanism_C.Super.Initialize(BP_ExitTriggerBoxMechanism_C, Initializer)
  self.bShowingCountdownToast = false
  self.PrepareExitPlayers = {}
end

function BP_ExitTriggerBoxMechanism_C:ReceiveBeginPlay()
  print(_G.LogTag, "ReceiveBeginPlay", self:GetName(), self.BpBorn)
  self.Overridden.ReceiveBeginPlay(self)
  self:ActiveGuide("Add")
  self.GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsDedicatedServer(self) then
    return
  end
  self.GameMode.EMGameState:RegisterGameModeEvent("OnExit", self, self.OnAvatarExit)
  self.GameMode.EMGameState:RegisterGameModeEvent("OnEnter", self, self.OnAvatarEnter)
  EventManager:AddEvent(EventID.CharDie, self, self.OnCharDie)
end

function BP_ExitTriggerBoxMechanism_C:AuthorityInitInfo(Info)
  BP_ExitTriggerBoxMechanism_C.Super.AuthorityInitInfo(self, Info)
  if not IsDedicatedServer(self) then
    return
  end
  if GWorld.bDebugServer then
    return
  end
  local Avatars = self.GameMode.AvatarInfos or {}
  local DSEntity = GWorld:GetDSEntity()
  for HasLeaveAvatar, _ in pairs(DSEntity.HasLeaveAvatars) do
    Avatars[HasLeaveAvatar] = nil
  end
  for Avatar, _ in pairs(Avatars) do
    self.PrepareExitPlayers[Avatar] = PlayerState.Play
  end
end

function BP_ExitTriggerBoxMechanism_C:OnAvatarExit(AvatarArr)
  print(_G.LogTag, "OnAvatarExit")
  local bCheck = false
  for i = 1, AvatarArr:Length() do
    local AvatarEidStr = AvatarArr:GetRef(i)
    if not rawget(self.PrepareExitPlayers, AvatarEidStr) then
      error("Unauthorized Avatar")
    end
    if self.PrepareExitPlayers[AvatarEidStr] ~= PlayerState.Leave then
      self.PrepareExitPlayers[AvatarEidStr] = PlayerState.Leave
      bCheck = true
    end
  end
  if bCheck then
    self:CheckTimerAndExit()
  end
end

function BP_ExitTriggerBoxMechanism_C:OnAvatarEnter(PlayerEid)
  print(_G.LogTag, "OnAvatarEnter")
  local PlayerCharacter = Battle(self):GetEntity(PlayerEid)
  if not PlayerCharacter then
    error("Character is not exist.", PlayerEid)
    return
  end
  local AvatarEid = PlayerCharacter:GetOwner().AvatarEidStr
  if not rawget(self.PrepareExitPlayers, AvatarEid) then
    error("Unauthorized Avatar")
    return
  end
  self.PrepareExitPlayers[AvatarEid] = PlayerState.Play
end

function BP_ExitTriggerBoxMechanism_C:OnCharDie(CharacterEid)
  print(_G.LogTag, "OnCharDie")
  local Character = Battle(self):GetEntity(CharacterEid)
  if not Character then
    error("Character is not exist.")
  end
  if Character:CheckCanRecovery() then
    return
  end
  local AvatarEid = Character:GetOwner().AvatarEidStr
  if not rawget(self.PrepareExitPlayers, AvatarEid) then
    error("Unauthorized Avatar")
  end
  if self.PrepareExitPlayers[AvatarEid] == PlayerState.Play then
    self.PrepareExitPlayers[AvatarEid] = PlayerState.Dead
  end
  self:CheckTimerAndExit()
end

function BP_ExitTriggerBoxMechanism_C:ExitInGameWin()
  print(_G.LogTag, "ExitInGameWin")
  if self:IsExistTimer("ExitTimeDownTick") then
    self:RemoveExitTimer()
  end
  local FunName = "Trigger" .. self.GameMode.EMGameState.GameModeType .. "Win"
  self.GameMode:TriggerDungeonComponentFun(FunName)
  if self.GameMode.EMGameState.GameModeType ~= "Party" then
    self.GameMode:TriggerDungeonWin()
  end
end

function BP_ExitTriggerBoxMechanism_C:OnBeginOverlapLua(TargetActor)
  if IsAuthority(self) then
    local PlayerCharacter = TargetActor:Cast(UE4.APlayerCharacter)
    if not PlayerCharacter then
      return
    end
    local FunName = "Trigger" .. self.GameMode.EMGameState.GameModeType .. "ExitMechanismOverlap"
    self.GameMode:TriggerDungeonComponentFun(FunName, TargetActor)
    self:AddPlayer(PlayerCharacter)
    AudioManager(self):PauseDungeonBGM()
  elseif IsClient(self) then
    OverlapActor[TargetActor] = true
  end
end

function BP_ExitTriggerBoxMechanism_C:AddPlayer(PlayerCharacter)
  if IsStandAlone(self) then
    self:ExitInGameWin()
    return
  end
  local AvatarEid = PlayerCharacter:GetOwner().AvatarEidStr
  if not rawget(self.PrepareExitPlayers, AvatarEid) then
    error("Unauthorized Avatar")
  end
  DebugPrint("AddPlayer")
  self.PrepareExitPlayers[AvatarEid] = PlayerState.WaitExit
  self:CheckTimerAndExit()
  self:RefreshPlayerNumInfo()
end

function BP_ExitTriggerBoxMechanism_C:CheckTimerAndExit()
  if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
    return
  end
  local EndNow = true
  local bStart = false
  for _, State in pairs(self.PrepareExitPlayers) do
    if State == PlayerState.Play then
      EndNow = false
    elseif State == PlayerState.WaitExit then
      bStart = true
    end
  end
  if EndNow then
    self:ExitInGameWin()
    return
  end
  if bStart then
    if not self:IsExistTimer("ExitTimeDownTick") then
      self:ResetExitTimer()
      if not self.bShowingCountdownToast and CommonUtils.TableLength(self.PrepareExitPlayers) > 1 then
        self:ShowOrHideCountdownToast(true)
      end
    end
  else
    self:RemoveExitTimer()
  end
end

function BP_ExitTriggerBoxMechanism_C:OnEndOverlapLua(TargetActor)
  if IsClient(self) then
    OverlapActor[TargetActor] = nil
  end
  if not IsDedicatedServer(self) then
    return
  end
  local PlayerCharacter = TargetActor:Cast(UE4.APlayerCharacter)
  if not PlayerCharacter or not PlayerCharacter:GetOwner() then
    return
  end
  local AvatarEid = PlayerCharacter:GetOwner().AvatarEidStr
  if not rawget(self.PrepareExitPlayers, AvatarEid) then
    error("Unauthorized Avatar")
  end
  if PlayerCharacter:IsRealDead() then
    self.PrepareExitPlayers[AvatarEid] = PlayerState.Dead
    self:CheckTimerAndExit()
  else
    self.PrepareExitPlayers[AvatarEid] = PlayerState.Play
  end
  self:RefreshPlayerNumInfo()
  for _, State in pairs(self.PrepareExitPlayers) do
    if State == PlayerState.WaitExit then
      return
    end
  end
  if self.GameMode.EMGameState.GameModeType == "Party" then
    return
  end
  self:RemoveExitTimer()
end

function BP_ExitTriggerBoxMechanism_C:RemoveExitTimer()
  DebugPrint("BP_ExitTriggerBoxMechanism_C:RemoveExitTimer")
  self:RemoveTimer("ExitTimeDownTick")
  self.ExitCountDown = -1
  if self.bShowingCountdownToast then
    self:ShowOrHideCountdownToast(false)
  end
end

function BP_ExitTriggerBoxMechanism_C:ResetExitTimer()
  self:RemoveExitTimer()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.ExitCountDown = GameState.ExitCountDown
  self:AddTimer(1.0, self.UpdatePage, true, 0, "ExitTimeDownTick")
end

function BP_ExitTriggerBoxMechanism_C:UpdatePage()
  DebugPrint("BP_ExitTriggerBoxMechanism_C:UpdatePage")
  if self.ExitCountDown - 1 < 0 then
    if 0 ~= self.ExitCountDown then
      self.ExitCountDown = 0
    end
  else
    self.ExitCountDown = self.ExitCountDown - 1
  end
  DebugPrint("BP_ExitTriggerBoxMechanism_C:UpdatePage", self.bShowingCountdownToast, self.ExitCountDown)
  if self.bShowingCountdownToast and (0 == self.ExitCountDown or not self:IsSomeoneWaiting()) and self.GameMode.EMGameState.GameModeType ~= "Party" then
    self:ShowOrHideCountdownToast(false)
  end
  if 0 == self.ExitCountDown then
    self:ExitInGameWin()
  end
end

function BP_ExitTriggerBoxMechanism_C:HandleExitCountDownValueChange()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local ExitTimeDownUI = UIManager:GetUIObj("ExitTimeDown")
  if self.ExitCountDown < 0 and ExitTimeDownUI then
    UIManager:UnLoadUI("ExitTimeDown")
    return
  end
  if not ExitTimeDownUI then
    local ScreenPos = FVector2D(0, 0)
    ExitTimeDownUI = UIManager:LoadUI(UIConst.ExitTimeDown, "ExitTimeDown", UIConst.ZORDER_ABOVE_ALL, 10, ScreenPos)
  end
  if ExitTimeDownUI then
    ExitTimeDownUI.TimeDown:SetText(self.ExitCountDown)
  end
end

function BP_ExitTriggerBoxMechanism_C:IsSomeoneWaiting()
  local Res = false
  local WaitingNum, TotalNum = self:GetPlayerNum()
  self.ExitInfo.WaitingPlayerNum = WaitingNum
  self.ExitInfo.TotalPlayerNum = TotalNum
  Res = WaitingNum > 0
  DebugPrint("IsSomeoneWaiting Res = " .. (true == Res and "true" or "false"), WaitingNum)
  return Res
end

function BP_ExitTriggerBoxMechanism_C:GetPlayerNum()
  local WaitingNum, TotalNum = 0, 0
  for AvatarEid, State in pairs(self.PrepareExitPlayers or {}) do
    if State == PlayerState.WaitExit then
      WaitingNum = WaitingNum + 1
    end
    TotalNum = TotalNum + 1
  end
  return WaitingNum, TotalNum
end

function BP_ExitTriggerBoxMechanism_C:OnRep_ExitInfo()
end

function BP_ExitTriggerBoxMechanism_C:ShowOrHideCountdownToast(bIsShow)
  if nil == bIsShow then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState.ExitInfo.bShowExitCountdownToast = bIsShow
    GameState.ExitInfo.StartExitCountdownTime = GameState.ReplicatedTimeSeconds
    self.bShowingCountdownToast = bIsShow
    if bIsShow then
      GameState.ExitInfo.WaitingPlayerNum, GameState.ExitInfo.TotalPlayerNum = self:GetPlayerNum()
    end
  end
end

function BP_ExitTriggerBoxMechanism_C:EMActorDestroy(DestroyReason)
  self:OnEMActorDestroy(DestroyReason)
end

function BP_ExitTriggerBoxMechanism_C:OnEMActorDestroy(DestroyReason)
  self:RemoveExitTimer()
  self:K2_DestroyActor()
  EventManager:RemoveEvent(EventID.CharDie)
end

function BP_ExitTriggerBoxMechanism_C:ReceiveActorBeginOverlap(OtherActor)
  self.Overridden.ReceiveActorBeginOverlap(self, OtherActor)
end

function BP_ExitTriggerBoxMechanism_C:ReceiveActorEndOverlap(OtherActor)
  self.Overridden.ReceiveActorEndOverlap(self, OtherActor)
end

function BP_ExitTriggerBoxMechanism_C:IsPlayerWaiting(PlayerCharacter)
  local bIsWaiting = false
  DebugPrint("BP_ExitTriggerBoxMechanism_C:IsPlayerWaiting ", PlayerCharacter)
  if PlayerCharacter then
    if UE4.UKismetMathLibrary.IsPointInBox(PlayerCharacter:K2_GetActorLocation(), self:K2_GetActorLocation(), self.CollisionComponent.BoxExtent * 2) then
      return true
    end
    for Actor, _ in pairs(OverlapActor or {}) do
      if PlayerCharacter == Actor:Cast(UE4.APlayerCharacter) then
        bIsWaiting = true
        break
      end
    end
  end
  return bIsWaiting
end

function BP_ExitTriggerBoxMechanism_C:GetUnitRealType()
  if self.UnitId and DataMgr.Mechanism[self.UnitId] then
    return DataMgr.Mechanism[self.UnitId].UnitRealType
  end
end

function BP_ExitTriggerBoxMechanism_C:RefreshPlayerNumInfo()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState and self.bShowingCountdownToast then
    GameState.ExitInfo.WaitingPlayerNum, GameState.ExitInfo.TotalPlayerNum = self:GetPlayerNum()
  end
end

return BP_ExitTriggerBoxMechanism_C
