local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local MiniGameOpenGateNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function MiniGameOpenGateNode:Init()
  self.bGuideUIEnable = true
  self.GuideType = nil
  self.GuidePointName = ""
  self.GuideStaticCreatorId = 0
  self.StaticCreatorId = -1
  self.bFinish = false
end

function MiniGameOpenGateNode:Execute(Callback)
  self:MiniGame(Callback)
end

function MiniGameOpenGateNode:MiniGame(Callback)
  DebugPrint("------------ MiniGameOpenGateNode ------------------", self.StaticCreatorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  
  function MiniGameOpenGateNodeCallback()
    GameMode:RemoveMiniGameSuccessCallback(self.StaticCreatorId)
    self:FinishAction(Callback)
  end
  
  local MiniGame
  if -1 ~= self.StaticCreatorId then
    local StaticCreator = GameMode.EMGameState:GetStaticCreatorInfo(self.StaticCreatorId, false, GameMode.LevelName)
    for i = 1, StaticCreator.ChildEids:Length() do
      MiniGame = Battle(GameMode):GetEntity(StaticCreator.ChildEids:GetRef(i))
    end
  end
  if not IsValid(MiniGame) then
    DebugPrint("------------ MiniGameOpenGateNode ------------------\232\138\130\231\130\185\229\188\128\229\167\139\230\151\182\229\176\143\230\184\184\230\136\143\230\156\186\229\133\179\228\184\141\229\173\152\229\156\168")
    EventManager:RemoveEvent(EventID.OnMechanismEnterState, self)
    MiniGameOpenGateNodeCallback()
    return
  end
  if self.bGuideUIEnable then
    if 0 == MiniGame.PlayerEid then
      MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
    else
      EventManager:AddEvent(EventID.OnMechanismEnterState, self, self.ShowMissionIndicator)
    end
  end
  if MiniGame:IsCombatItemBase("MiniGame") then
    assert(MiniGame.FiniStateId, "LXZ STL\233\135\140\231\148\168\229\136\176\231\154\132\229\176\143\230\184\184\230\136\143\230\178\161\230\156\137\229\174\154\228\185\137FiniStateId\229\143\130\230\149\176(\229\176\143\230\184\184\230\136\143\230\156\186\229\133\179\231\187\147\230\157\159\231\138\182\230\128\129\231\154\132id)")
    if MiniGame.StateId == MiniGame.FiniStateId then
      MiniGameOpenGateNodeCallback()
      return
    end
  end
  print(_G.LogTag, "LXZ MiniGameOpenGateNode", self.StaticCreatorId)
  GameMode:AddMiniGameSuccessCallback(self.StaticCreatorId, MiniGameOpenGateNodeCallback)
end

function MiniGameOpenGateNode:ShowMissionIndicator(CreatorId, StateId)
  if CreatorId ~= self.StaticCreatorId then
    return
  end
  local MiniGame
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if -1 ~= self.StaticCreatorId then
    local StaticCreator = GameMode.EMGameState:GetStaticCreatorInfo(self.StaticCreatorId, false, GameMode.LevelName)
    for i = 1, StaticCreator.ChildEids:Length() do
      MiniGame = Battle(GameMode):GetEntity(StaticCreator.ChildEids:GetRef(i))
    end
  end
  if IsValid(MiniGame) and not self.bFinish then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
    EventManager:RemoveEvent(EventID.OnMechanismEnterState, self)
  end
end

function MiniGameOpenGateNode:FinishAction(Callback)
  self.bFinish = true
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  Callback()
end

function MiniGameOpenGateNode:Clear()
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode:RemoveMiniGameSuccessCallback(self.StaticCreatorId)
end

return MiniGameOpenGateNode
