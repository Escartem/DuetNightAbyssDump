local CommonUtils = require("Utils.CommonUtils")
local MiscUtils = require("Utils.MiscUtils")
local GameModeLogin = {}

function GameModeLogin:InitNewPlayerLua(PlayerController, UniqueId, Options, Portal)
  if not self.AvatarInfos then
    self.AvatarInfos = {}
  end
  local AvatarEid, AvatarBattleInfo, PlayerInfo
  if IsStandAlone(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local PhantomInfo = {}
      if Avatar.AvatarBattleInfo then
        local AvatarInitData = Avatar:ConsumeAvatarInitData()
        AvatarBattleInfo = AvatarUtils:UpdateBattleInfo(Avatar.AvatarBattleInfo.CharacterInfo, AvatarInitData)
        if AvatarInitData then
          PhantomInfo[#PhantomInfo + 1] = AvatarUtils:UpdateBattleInfo(Avatar.AvatarBattleInfo.PhantomInfo1, AvatarInitData.PhantomInfo1)
          PhantomInfo[#PhantomInfo + 1] = AvatarUtils:UpdateBattleInfo(Avatar.AvatarBattleInfo.PhantomInfo2, AvatarInitData.PhantomInfo2)
        else
          PhantomInfo[#PhantomInfo + 1] = Avatar.AvatarBattleInfo.PhantomInfo1
          PhantomInfo[#PhantomInfo + 1] = Avatar.AvatarBattleInfo.PhantomInfo2
        end
      else
        AvatarBattleInfo = AvatarUtils:GetDefaultBattleInfo(Avatar)
      end
      PlayerInfo = Avatar:GetCrossAttrs()
      AvatarEid = CommonUtils.ObjId2Str(Avatar.Eid)
      self.AvatarInfos[AvatarEid] = {}
      self.AvatarInfos[AvatarEid].BattleInfo = AvatarBattleInfo
      self.AvatarInfos[AvatarEid].PlayerInfo = PlayerInfo
      self.AvatarInfos[AvatarEid].PhantomInfo = PhantomInfo
      if Avatar.IsAutoBattle then
        local function start()
          self:StartAutoBattleTest(true)
        end
        
        self:AddTimer(2, start)
        return ""
      end
    else
      ServerPrint("GameModeLogin Avatar is nil")
    end
  elseif IsDedicatedServer(self) then
    DebugPrint("Options is ", Options)
    local bIsInactive = PlayerController.PlayerState.bIsEMInactive
    ServerPrint("Reconnect", bIsInactive)
    AvatarEid = UE.UGameplayStatics.ParseOption(Options, "AvatarEid")
    if bIsInactive then
      self.ClientReadyMap:Add(AvatarEid, false)
      return ""
    end
    local DSEntity = GWorld:GetDSEntity()
    local Info
    if DSEntity then
      Info = DSEntity:GetAvatarInfo(self, AvatarEid)
    else
      Info = self.AvatarInfos[AvatarEid]
    end
    if Info then
      AvatarBattleInfo = Info.BattleInfo
      PlayerInfo = Info.PlayerInfo
      local PlayerState = PlayerController.PlayerState:Cast(UE4.AEMPlayerState)
      PlayerState:SetPlayerId(Info.ExtraInfo.PlayerId)
      if self.AlreadyInit then
        PlayerController:SetBornTrans()
      end
    elseif not GWorld.bDebugServer then
      return "Avatar is not registered."
    end
  elseif MiscUtils.IsListenServer(self) then
    local PlayerControllerIndex = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(self, PlayerController)
    if 0 == PlayerControllerIndex then
      print(_G.LogTag, "ListenServer Master Login")
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        if Avatar:IsInDungeon() then
          AvatarBattleInfo = Avatar.AvatarBattleInfo or AvatarUtils:GetDefaultBattleInfo(Avatar)
        else
          AvatarBattleInfo = AvatarUtils:GetDefaultBattleInfo(Avatar)
        end
        AvatarEid = Avatar.Eid
        self.AvatarInfos[AvatarEid] = AvatarBattleInfo
      end
    else
      print(_G.LogTag, "ListenServer Visitor Login", PlayerControllerIndex)
      local AvatarEidStr = UE.UGameplayStatics.ParseOption(Options, "AvatarEid")
      AvatarEid = AvatarEidStr
      if AvatarEid then
        AvatarBattleInfo = self.AvatarInfos[AvatarEid]
      end
    end
  end
  self:PreInitPlayer(PlayerController, {
    AvatarEid = AvatarEid,
    AvatarBattleInfo = AvatarBattleInfo,
    PlayerInfo = PlayerInfo
  })
  self.ClientReadyMap:Add(AvatarEid, false)
  return ""
end

function GameModeLogin:GetDefaultPawnClassForController(PlayerController)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.IsAutoBattle then
    return ""
  end
  local RoleId = PlayerController:GetRoleId()
  local PawnClassPath = DataMgr.BattleChar[RoleId].UnitBPPath
  if not PawnClassPath then
    return self.Overridden.GetDefaultPawnClassForController(self)
  end
  return UE4.LoadClass(PawnClassPath)
end

function GameModeLogin:K2_PostLogin(PlayerController)
  if GWorld.bDebugServer then
    return
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:ConnectDSServerSuccess(PlayerController.AvatarEidStr, PlayerController.PlayerState.bIsEMInactive)
  end
end

function GameModeLogin:K2_OnRestartPlayer(PlayerController)
  if PlayerController.PlayerState.bIsEMInactive then
    ServerPrint("Reconnect Player")
    return
  end
  local Character = PlayerController.Character
  if GWorld.GameInstance:IsUseFixedStartPoint() then
    Character:K2_SetActorLocation(GWorld.GameInstance.StartLocation, false, nil, true)
    Character:K2_SetActorRotation(GWorld.GameInstance.StartRotation, false)
    PlayerController:SetControlRotation(GWorld.GameInstance.StartControllerRotation)
    GWorld.GameInstance:ResetFixedStartPoint()
  end
  GWorld.GameInstance:ConsumePlayerCharacterInfo(Character)
  local AvatarInfo = PlayerController:GetAvatarInfo()
  local InfoForInit = {Camp = "Player", AvatarInfo = AvatarInfo}
  Character:RegisterInfo(InfoForInit)
end

function GameModeLogin:K2_OnLogout(ExitingController)
  local AvatarEidStr = ExitingController.AvatarEidStr
  ServerPrint("K2_OnLogout", AvatarEidStr)
  self.LevelGameMode.PlayerNumber = self.LevelGameMode.PlayerNumber - 1
  self:OnAvatarLogout(AvatarEidStr)
end

function GameModeLogin:OnAvatarLogout(AvatarEidStr)
  ServerPrint("OnAvatarLogout", AvatarEidStr)
  if AvatarEidStr then
    self.AvatarInfos[AvatarEidStr] = nil
    self.BattleAvatars[AvatarEidStr] = nil
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity.AvatarInfos[AvatarEidStr] = nil
    end
  end
  if GWorld.bDebugServer then
    return
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity then
    DSEntity:DisconnectDSServerSuccess(AvatarEidStr)
  end
end

function GameModeLogin:OnCharacterReady(AvatarEid, Character)
  self.LevelGameMode.PlayerNumber = self.LevelGameMode.PlayerNumber + 1
  if self.BattleAvatars[AvatarEid] or not AvatarEid then
    return
  end
  DebugPrint("GameModeLogin OnCharacterReady", AvatarEid)
  self.BattleAvatars[AvatarEid] = Character
end

function GameModeLogin:PreInitPlayer(PlayerController, CustomInfo)
  local AvatarBattleInfo = CustomInfo.AvatarBattleInfo or AvatarUtils:GetDefaultBattleInfo(CustomInfo.Avatar)
  local PlayerInfo = CustomInfo.PlayerInfo
  if not PlayerInfo and CustomInfo.Avatar then
    PlayerInfo = CustomInfo.Avatar:GetCrossAttrs()
  end
  local AvatarEid = CustomInfo.AvatarEid
  if not AvatarEid and CustomInfo.Avatar then
    AvatarEid = CommonUtils.ObjId2Str(CustomInfo.Avatar.Eid)
  end
  if AvatarBattleInfo and PlayerInfo then
    PlayerController.PlayerState:RegisterOldBattleInfo(AvatarBattleInfo, PlayerInfo)
    print(_G.LogTag, "PreInitPlayer", PlayerInfo.HeadIconId)
    PlayerController.PlayerState:SetPlayerInfo(AvatarEid, PlayerInfo.Nickname, PlayerInfo.Level, PlayerInfo.HeadIconId, PlayerInfo.Uid)
  else
    AvatarBattleInfo = AvatarUtils:GetDefaultAvatarInfo()
  end
  PlayerController:SetAvatarInfo(AvatarEid, AvatarBattleInfo)
end

function GameModeLogin:StartAutoBattleTest(bClientMode)
  print(_G.LogTag, "InitAutoTestCount")
  Battle(GWorld.GameInstance):InitBattleEventWithPath("AutoTestCount")
  local RoleId = Const.DefaultRoleId
  local AvatarInfo
  for AvatarEid, Info in pairs(self.AvatarInfos) do
    RoleId = bClientMode and Info.BattleInfo.RoleInfo.RoleId
    AvatarInfo = Info.BattleInfo
    break
  end
  local Location = FVector()
  if self.LevelLoader then
    local StartPoint = self.LevelLoader:GetRandStartPoint()
    Location = StartPoint:K2_GetActorLocation()
  else
    self:SetLocationFromPlayerStart(Location, true)
  end
  print(_G.LogTag, "StartPoint Location", Location)
  
  local function LoadFinishCallback(Phantom)
    if not Phantom then
      print(_G.LogTag, "PlaherCharacter AI load fail")
    else
      print(_G.LogTag, "PlaherCharacter AI load finish,Role ID:" .. Phantom.CurrentRoleId)
    end
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity:OnStartAutoBattleTest(false)
      DSEntity.Player = Phantom
      return
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar.Player = Phantom
      local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
      USequenceFunctionLibrary.SetViewTarget(Controller, Phantom)
      Avatar:OnStartAutoBattleTest(true)
    end
    local Controller = UE4.UGameplayStatics.GetPlayerController(Phantom, 0)
    Controller:SetLastPawn(Phantom)
  end
  
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitId = 1
  Context.IntParams:Add("RoleId", RoleId)
  Context.UnitType = "Phantom"
  Context.Loc = Location
  Context.NameParams:Add("Camp", "Player")
  Context.BoolParams:Add("FixLocation", true)
  Context:AddLuaTable("AvatarInfo", AvatarInfo)
  Context.OnUnitInitCreateReadyDynamic:Add(self, LoadFinishCallback)
  self.EMGameState.EventMgr:CreateUnitNew(Context, false)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    GameMode.IsInAutoTestCombat = true
    GameMode.AutoTestStartTime = GWorld:GetCurrentTime()
  end
end

function GameModeLogin:RealStartAutoBattleTest()
  local function RealStart()
    print(_G.LogTag, "RealStartAutoBattleTest")
    
    self:SetGameModeState(Const.StateRunning)
    self:OnInit()
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity:RealOnStartAutoBattleTest()
      return
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:RealOnStartAutoBattleTest(true)
      return
    end
  end
  
  self:AddTimer(5, RealStart)
end

return GameModeLogin
