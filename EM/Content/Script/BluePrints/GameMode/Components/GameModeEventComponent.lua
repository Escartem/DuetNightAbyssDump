require("UnLua")
local EStorylineActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local GameModeEventComponent = {}

function GameModeEventComponent:yxd()
end

function GameModeEventComponent:GetDungeonAchieveComponent()
  if self.DungeonAchieveComponent ~= nil then
    return self.DungeonAchieveComponent
  end
  if not self:IsInDungeon() then
    return nil
  end
  local GameState = self.EMGameState or UE4.UGameplayStatics.GetGameState(self)
  self.DungeonAchieveComponent = self["BP_" .. GameState.GameModeType .. "AchieveComponent"]
  if not self.DungeonAchieveComponent then
    self.DungeonAchieveComponent = self.BP_DungeonAchieveComponent
  end
  return self.DungeonAchieveComponent
end

function GameModeEventComponent:GetSubDungeonComponent()
  local GameState = self.EMGameState or UE4.UGameplayStatics.GetGameState(self)
  local GameModeComponentName = "BP_" .. GameState.GameModeType .. "Component"
  for LevelName, SubGameMode in pairs(self.SubGameModeInfo) do
    local SubDungeonComponent = SubGameMode[GameModeComponentName]
    if nil == SubDungeonComponent then
      DebugPrint("GameModeEventComponent Error! \231\165\158\229\186\153/\230\180\190\229\175\185\231\142\169\230\179\149\229\173\144\229\133\179\229\141\161\231\188\186\229\176\145\231\165\158\229\186\153/\230\180\190\229\175\185\231\187\132\228\187\182\239\188\140\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\231\155\184\229\133\179\233\133\141\231\189\174")
    end
    return SubDungeonComponent
  end
end

function GameModeEventComponent:GetGameModeEventComponent()
  if self.GameModeEventComponent ~= nil then
    return self.GameModeEventComponent
  end
  if self:IsInDungeon() then
    self.GameModeEventComponent = self.GameModeEvent
  elseif self:IsInRegion() and self.LevelGameMode.RegionId then
    local RegionComponentName = "GameModeEvent_" .. self.LevelGameMode.RegionId
    self.GameModeEventComponent = self[RegionComponentName]
  end
  return self.GameModeEventComponent
end

function GameModeEventComponent:TriggerUploadDungeonAchievement(PlayerEids)
  if self:GetDungeonAchieveComponent() then
    local ResPlayerEids = PlayerEids or {}
    if nil == PlayerEids then
      for _, PlayerCharacter in pairs(self:GetAllPlayer()) do
        table.insert(ResPlayerEids, PlayerCharacter.Eid)
      end
    end
    self:GetDungeonAchieveComponent():UploadDungeonAchievement(ResPlayerEids)
  end
end

function GameModeEventComponent:TriggerGameModeEvent(EventName, ...)
  if not self:GetDungeonComponent() then
    return
  end
  if self:GetDungeonComponent()[EventName] and self:GetDungeonComponent()[EventName]:IsBound() then
    self:GetDungeonComponent()[EventName]:Broadcast(...)
  end
end

function GameModeEventComponent:TriggerDungeonComponentFun(FunName, ...)
  if self:GetDungeonComponent() and self:GetDungeonComponent()[FunName] then
    return self:GetDungeonComponent()[FunName](self:GetDungeonComponent(), ...)
  end
  return nil
end

function GameModeEventComponent:TriggerBPGameModeEvent(Name, ...)
  if not self:GetGameModeEventComponent() then
    return
  end
  local FunName = "TriggerBPGameModeEvent_" .. Name
  if self[FunName] then
    self[FunName](self, ...)
  end
end

function GameModeEventComponent:TriggerSTLEvent(Name, ...)
  if self:IsInDungeon() then
    return
  end
  if not GWorld.StoryMgr then
    return
  end
  local FunName = "TriggerSTLEvent_" .. Name
  if self[FunName] then
    self[FunName](self, ...)
  end
end

function GameModeEventComponent:TriggerDungeonAchieve(EventName, PlayerEid, ...)
  DebugPrint("GameModeAchieve: EventName:", EventName)
  if not self:GetDungeonAchieveComponent() then
    return
  end
  if not self:GetDungeonAchieveComponent()[EventName] then
    return
  end
  self:GetDungeonAchieveComponent()[EventName](self:GetDungeonAchieveComponent(), PlayerEid, ...)
end

function GameModeEventComponent:TriggerDungeonAchieve_Bp(EventName, PlayerEid)
  self:TriggerDungeonAchieve(EventName, PlayerEid)
end

function GameModeEventComponent:TriggerBPGameModeEvent_OnCustomEvent(ParaName)
  local EventName = "OnCustomEvent_" .. ParaName
  if self:GetGameModeEventComponent()[EventName] and self:GetGameModeEventComponent()[EventName]:IsBound() then
    self:GetGameModeEventComponent()[EventName]:Broadcast()
  end
end

function GameModeEventComponent:TriggerBPGameModeEvent_OnTriggerAOIBase(...)
  local TriggerEventId, TriggerBase, ActorEid, TriggerType = ...
  local EventName = "OnTriggerAOIBase_" .. TriggerEventId
  if self:GetGameModeEventComponent()[EventName] and self:GetGameModeEventComponent()[EventName]:IsBound() then
    self:GetGameModeEventComponent()[EventName]:Broadcast(TriggerBase)
  end
end

function GameModeEventComponent:TriggerBPGameModeEvent_BpOnTimerEnd(ParaName)
  local EventName = "BpOnTimerEnd_" .. ParaName
  if self:GetGameModeEventComponent()[EventName] and self:GetGameModeEventComponent()[EventName]:IsBound() then
    self:GetGameModeEventComponent()[EventName]:Broadcast()
  end
end

function GameModeEventComponent:TriggerBPGameModeEvent_OnBossDead(ParaName)
  local EventName = "OnBossDead_" .. ParaName.UnitId
  if self:GetGameModeEventComponent()[EventName] and self:GetGameModeEventComponent()[EventName]:IsBound() then
    self:GetGameModeEventComponent()[EventName]:Broadcast()
  end
end

function GameModeEventComponent:TriggerSTLEvent_OnTriggerAOIBase(...)
  local TriggerEventId, TriggerBase, ActorEid, TriggerType = ...
  GWorld.StoryMgr:TryExecStorylineActorEvent(TriggerEventId, EStorylineActorEventType.OnTriggerAOIBase, {
    TriggerBase = TriggerBase,
    ActorEid = ActorEid,
    TriggerType = TriggerType
  })
end

function GameModeEventComponent:TriggerSTLEvent_STLPostStaticCreatorEvent(...)
  local Actor = (...)
  DebugPrint("STL Node TriggerSTLEvent_STLPostStaticCreatorEvent CreatorId:", Actor.CreatorId)
  GWorld.StoryMgr:TryExecStorylineActorEvent(Actor.CreatorId, EStorylineActorEventType.OnCreated, {Actor = Actor})
end

function GameModeEventComponent:TriggerSTLEvent_OnSTLActorDestroyed(...)
  local Actor, DestroyReason = ...
  GWorld.StoryMgr:TryExecStorylineActorEvent(Actor.CreatorId, EStorylineActorEventType.OnActorDestroyed, {Actor = Actor, DestroyReason = DestroyReason})
end

return GameModeEventComponent
