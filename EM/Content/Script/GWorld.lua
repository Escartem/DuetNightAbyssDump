local IdManager = require("NetworkEngine.Common.IdManager")
local LogManager = require("NetworkEngine.Common.LogManager")
local StoryManager = require("BluePrints.Story.StoryMgr")
local MiscUtils = require("Utils.MiscUtils")
local GWorld = {}
GWorld.logger = LogManager:GenClientLogger()
GWorld.GameInstance = nil
GWorld.NetworkMgr = nil
GWorld.EntityManager = nil
GWorld.EntityFactory = nil
GWorld.IdManager = IdManager
GWorld.ServerListMgr = nil
GWorld.CachedUI = {}
GWorld.BP_Avatar = nil
GWorld.LimitCallMethods = {}
GWorld.GlobalCallbackId = 0
GWorld.StoryMgr = StoryManager()
GWorld.bDebugServer = false
GWorld.IsForbidEntityMessage = false
GWorld.DefaultDevice = nil
GWorld.IsDev = true
GWorld.EnterMode = ""
GWorld.EnterPlatform = ""
GWorld.ChooseServerArea = "China"
GWorld.ServerAreaToGroupId = {
  Asian = 1001,
  HMT = 1002,
  Europe = 1003,
  America = 1004,
  China = 1005
}
GWorld.DevServerAreaToGroupId = {
  America = 501,
  Asian = 502,
  Europe = 503,
  HMT = 504,
  China = 101
}
GWorld.GetAvatarInfos = nil
GWorld.IsOpenWroldRegion = false
GWorld.HotfixDataIndex = DataMgr.HotfixData.index

function GWorld:IsGlobalServer()
  return AHotUpdateGameMode.IsGlobalPak()
end

function GWorld:IsChinaServer()
  return AHotUpdateGameMode.IsGlobalPak() == false
end

function GWorld:OpenWorldRegionState()
  GWorld.IsOpenWroldRegion = true
end

function GWorld:CloseWorldRegionState()
  GWorld.IsOpenWroldRegion = false
end

function GWorld:GetWorldRegionState()
  return GWorld.IsOpenWroldRegion
end

function GWorld:GenCallbackId()
  self.GlobalCallbackId = self.GlobalCallbackId + 1
  return self.GlobalCallbackId
end

function GWorld:GetBPAvatar()
  if self.GameInstance then
    return self.GameInstance:GetAvatar()
  end
  return nil
end

function GWorld:GetAvatar()
  if self.BP_Avatar then
    return self.BP_Avatar:GetClientAvatar()
  end
  return nil
end

function GWorld:GetDSEntity()
  if self.BP_Avatar then
    return self.BP_Avatar:GetDSEntity()
  end
  return nil
end

function GWorld:GetServerEntity()
  if not self.BP_Avatar then
    return nil
  end
  local Entity = self.BP_Avatar:GetClientAvatar()
  if Entity then
    return Entity
  end
  Entity = self.BP_Avatar:GetDSEntity()
  if Entity then
    return Entity
  end
  return nil
end

function GWorld:DSBLog(...)
  local DSEntity = self:GetDSEntity()
  if not DSEntity then
    return
  end
  DSEntity:BLog(...)
end

function GWorld:GetCurrentTime()
  return UE4.UGameplayStatics.GetTimeSeconds(self.GameInstance)
end

function GWorld:IsSkynetServer()
  return false
end

function GWorld:GetMainPlayer()
  if self.GameInstance then
    local PC = UE4.UGameplayStatics.GetPlayerController(self.GameInstance, 0)
    if IsValid(PC) and PC.GetMyPawn then
      return PC:GetMyPawn()
    end
  end
  return nil
end

function GWorld:ForbidEntityMessage(flag)
  GWorld.IsForbidEntityMessage = 1 == tonumber(flag) and true or false
end

function GWorld:IsStandAlone()
  return IsStandAlone(self.GameInstance)
end

function GWorld:IsDedicatedServer()
  return IsDedicatedServer(self.GameInstance)
end

function GWorld:IsListenServer()
  return MiscUtils.IsListenServer(self.GameInstance)
end

function GWorld:IsClient()
  return IsClient(self.GameInstance)
end

GWorld.GameModeIndex = 0
GWorld.GameModes = {}
GWorld._CurrentGameMode = nil
GWorld.GameModeNumber = 0
local OldGetGameMode = UE4.UGameplayStatics.GetGameMode

function UE4.UGameplayStatics.GetGameMode(...)
  if GWorld._CurrentGameMode then
    return GWorld._CurrentGameMode
  end
  return OldGetGameMode(...)
end

function GWorld:AddGameMode(GameMode)
  self.GameModeIndex = self.GameModeIndex + 1
  self.GameModes[self.GameModeIndex] = GameMode
  self.GameModeNumber = self.GameModeNumber + 1
  self._CurrentGameMode = GameMode
  if self.GameModeNumber > 1 then
    self._CurrentGameMode = nil
  end
  return self.GameModeIndex
end

function GWorld:RemoveGameMode(GameModeIndex)
  GWorld.GameModeNumber = GWorld.GameModeNumber - 1
  self.GameModes[self.GameModeIndex] = nil
  self._CurrentGameMode = nil
end

GWorld.GameStateIndex = 0
GWorld.GameStates = {}
GWorld._CurrentGameState = nil
GWorld.GameStateNumber = 0
local OldGetGameState = UE4.UGameplayStatics.GetGameState

function UE4.UGameplayStatics.GetGameState(...)
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(...) then
    return OldGetGameState(...)
  end
  if GWorld._CurrentGameState then
    return GWorld._CurrentGameState
  end
  return OldGetGameState(...)
end

function GWorld:AddGameState(GameState)
  self.GameStateIndex = self.GameStateIndex + 1
  self.GameStates[self.GameStateIndex] = GameState
  self.GameStateNumber = self.GameStateNumber + 1
  self._CurrentGameState = GameState
  if self.GameStateNumber > 1 then
    self._CurrentGameState = nil
  end
  return self.GameStateIndex
end

function GWorld:RemoveGameState(GameStateIndex)
  GWorld.GameStateNumber = GWorld.GameStateNumber - 1
  self.GameStates[self.GameStateIndex] = nil
  self._CurrentGameState = nil
end

return GWorld
