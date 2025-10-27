local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local BattleUtils = require("Utils.BattleUtils")
local CreatePhantomNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function CreatePhantomNode:Init()
  self.IsCreate = true
  self.IsClearOtherPhantom = false
  self.StaticCreatorIdList = {}
  self.IsSync = false
end

function CreatePhantomNode:Start(Context)
  self.Context = Context
  self.TotalCeatorNumCounter = 0
  if self.IsCreate then
    self:STLClearOtherPhantom()
    self:STLCreatePhantom()
  else
    self:STLDestroyPhantom()
  end
end

function CreatePhantomNode:STLCreatePhantom()
  if self.IsSync then
    for _, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      self.TotalCeatorNumCounter = self.TotalCeatorNumCounter + 1
      GWorld.StoryMgr:BindStaticCreatorActorEvent(StaticCreatorId, EActorEventType.OnCreated, self, self.LoadFinishCallback)
    end
    DebugPrint("CreatePhantomNode: \231\187\145\229\174\154\229\155\158\232\176\131\239\188\140\233\156\128\231\173\137\229\190\133\229\155\158\232\176\131\230\128\187\230\149\176: ", self.TotalCeatorNumCounter)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    self:ActivePhantomStaticCreator(GameMode, Player, CreatorId)
  end
  if not self.IsSync then
    self:FinishAction()
  end
end

function CreatePhantomNode:LoadFinishCallback(InfoTable)
  if not self.IsSync then
    ScreenPrint("CreatePhantomNode: \228\187\133\229\156\168\229\188\128\229\144\175\229\144\140\230\173\165\230\151\182\230\137\141\233\156\128\232\166\129\232\167\166\229\143\145\229\155\158\232\176\131\239\188\129\232\175\183\232\129\148\231\179\187ljl\230\163\128\230\159\165\239\188\129")
    return
  end
  self.TotalCeatorNumCounter = self.TotalCeatorNumCounter - 1
  DebugPrint("CreatePhantomNode LoadFinishCallback CreatorId:", InfoTable.Actor.CreatorId, " WaitingCallbackNum: ", self.TotalCeatorNumCounter)
  if 0 == self.TotalCeatorNumCounter then
    self:FinishAction()
  end
end

function CreatePhantomNode:ActivePhantomStaticCreator(GameMode, Player, CreatorId)
  local Creator = GameMode.EMGameState:GetStaticCreatorInfo(CreatorId)
  if self:IsPhantomExist(Creator) then
    DebugPrint("CreatePhantomNode: \229\176\157\232\175\149\231\148\159\230\136\144\231\154\132\233\173\133\229\189\177\229\183\178\229\173\152\229\156\168\239\188\140\233\157\153\230\128\129\231\130\185Id:", CreatorId)
    return
  end
  if not IsValid(Creator) then
    ScreenPrint("CreatePhantomNode: \233\157\153\230\128\129\231\130\185\228\184\141\229\144\136\230\179\149, \230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185\239\188\129\233\157\153\230\128\129\231\130\185Id:" .. CreatorId)
    return
  end
  if not GameMode:CheckLevelLoadedByActor(Creator) then
    ScreenPrint("CreatePhantomNode: \233\157\153\230\128\129\231\130\185\228\184\141\229\144\136\230\179\149, \233\157\153\230\128\129\231\130\185\230\137\128\229\156\168\229\133\179\229\141\161\230\156\170\229\138\160\232\189\189\239\188\129\233\157\153\230\128\129\231\130\185Id:" .. CreatorId)
    return
  end
  local SpecialQuestId
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    SpecialQuestId = Avatar.SpecialQuestId
  end
  GameMode:STLSetPhantomCreatorRegionInfo(Creator, self.QuestChainId, SpecialQuestId)
  Creator:RealActiveStaticCreator()
  DebugPrint("CreatePhantomNode: \231\148\159\230\136\144\233\173\133\229\189\177\239\188\140\233\157\153\230\128\129\231\130\185Id:", Creator.StaticCreatorId)
end

function CreatePhantomNode:IsPhantomExist(Creator)
  if not IsValid(Creator) then
    return false
  end
  local Eids = Creator.ChildEids:ToTable()
  for _, Eid in pairs(Eids) do
    local PhantomChar = Battle(GWorld.GameInstance):GetEntity(Eid)
    if IsValid(PhantomChar) then
      return true
    end
  end
  return false
end

function CreatePhantomNode:STLClearOtherPhantom()
  if self.IsClearOtherPhantom then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    UE4.UPhantomFunctionLibrary.CancelAllPhantomFromOwner(Player, EDestroyReason.StoryLine)
  end
end

function CreatePhantomNode:STLDestroyPhantom()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local StaticCreatorArray = TArray(0)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    StaticCreatorArray:Add(CreatorId)
    DebugPrint("CreatePhantomNode: \233\148\128\230\175\129\233\173\133\229\189\177\239\188\140\233\157\153\230\128\129\231\130\185Id:", CreatorId)
  end
  GameMode:TriggerInactiveStaticCreator(StaticCreatorArray, false, EDestroyReason.StoryLine)
  self:FinishAction()
end

function CreatePhantomNode:FinishAction()
  self:Finish()
end

function CreatePhantomNode:Clear()
  if self.IsSync then
    for _, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      GWorld.StoryMgr:UnbindStaticCreatorActorEventByType(StaticCreatorId, EActorEventType.OnCreated)
    end
    self.TotalCeatorNumCounter = 0
  end
end

return CreatePhantomNode
