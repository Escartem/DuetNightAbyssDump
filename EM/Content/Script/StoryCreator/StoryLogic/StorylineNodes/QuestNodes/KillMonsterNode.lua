local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local KillMonsterNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")

function KillMonsterNode:Init()
  self.KillMonsterType = "Nums"
  self.KillMonsterCnt = 0
  self.MonsterNeedNums = 0
  self.IsShowMonsterGuide = true
  self.StaticCreatorIdList = {}
  self.MonsterCreatorIdList = {}
end

function KillMonsterNode:Execute(Callback)
  self.Callback = Callback
  self.AddGuideTimer_Handle = "KillMonsterAddGuideTimer" .. self.Key
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  self.KillMonsterCnt = 0
  if self.KillMonsterType == "Nums" then
    GameMode:STLRegisterKillMonsterNode(self)
  else
    self.MonsterCreatorIdList = {}
    for _, Id in pairs(self.StaticCreatorIdList) do
      self.MonsterCreatorIdList[Id] = false
    end
    self:ShowMonterGuide(GameMode)
    GameMode:STLRegisterKillMonsterNode_Creator(self)
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
      self.CurQuestChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    else
      self.CurQuestChainId = self.Context.QuestChainId
    end
    if Avatar.QuestChains[self.CurQuestChainId] then
      self.CurDoingQuestId = Avatar.QuestChains[self.CurQuestChainId].DoingQuestId
    else
      self.CurDoingQuestId = self.QuestId
    end
    Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
      self.KillMonsterCnt,
      self.MonsterNeedNums,
      self.CurQuestChainId,
      self.CurDoingQuestId,
      self
    })
  end
  if self.IsShow then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function KillMonsterNode:ShowMonterGuide(GameMode)
  if not self.IsShowMonsterGuide then
    return
  end
  local GameState = GameMode.EMGameState
  local CheckCounter = 0
  
  local function IsAllActivated()
    for _, IsActivated in pairs(self.MonsterCreatorIdList) do
      if not IsActivated then
        return false
      end
    end
    return true
  end
  
  local function CheckAllMonsterToAddGuide()
    CheckCounter = CheckCounter + 1
    for _, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      if self.MonsterCreatorIdList[StaticCreatorId] == false then
        local Creator = GameState.StaticCreatorMap:FindRef(StaticCreatorId)
        if IsValid(Creator) and Creator.ChildEids:Length() > 0 then
          for i = 1, Creator.ChildEids:Length() do
            local Monster = Battle(GWorld.GameInstance):GetEntity(Creator.ChildEids:GetRef(i))
            if IsValid(Monster) then
              self.MonsterCreatorIdList[StaticCreatorId] = true
              GameState:AddGuideEid(Monster.Eid)
              Monster:ActiveGuide("Add")
              DebugPrint("KillMonsterNode: \230\183\187\229\138\160\230\140\135\229\188\149", Monster.Eid)
            end
          end
        end
      end
    end
    local IsThisTimeAllActivated = IsAllActivated()
    DebugPrint("KillMonsterNode: \233\129\141\229\142\134\230\172\161\230\149\176\239\188\154", CheckCounter, "\239\188\140\230\152\175\229\144\166\229\133\168\233\131\168\230\183\187\229\138\160\230\140\135\229\188\149\239\188\154", IsThisTimeAllActivated)
    if IsThisTimeAllActivated or CheckCounter > 10 then
      DebugPrint("KillMonsterNode: \231\167\187\233\153\164\230\183\187\229\138\160\230\140\135\229\188\149timer Handle Name: ", self.AddGuideTimer_Handle)
      GWorld.GameInstance:RemoveTimer(self.AddGuideTimer_Handle)
    end
  end
  
  CheckAllMonsterToAddGuide()
  DebugPrint("KillMonsterNode: \230\183\187\229\138\160\230\140\135\229\188\149timer Handle Name: ", self.AddGuideTimer_Handle)
  GWorld.GameInstance:AddTimer(1, CheckAllMonsterToAddGuide, true, 0, self.AddGuideTimer_Handle)
end

function KillMonsterNode:HideMonsterGuide(GameMode)
  if not self.IsShowMonsterGuide then
    return
  end
  local GameState = GameMode.EMGameState
  local SceneMgrComponent = GWorld.GameInstance:GetSceneManager()
  GWorld.GameInstance:RemoveTimer(self.AddGuideTimer_Handle)
  for StaticCreatorId, _ in pairs(self.MonsterCreatorIdList) do
    local Creator = GameState.StaticCreatorMap:FindRef(StaticCreatorId)
    if IsValid(Creator) and Creator.ChildEids:Length() > 0 then
      for i = 1, Creator.ChildEids:Length() do
        local Eid = Creator.ChildEids:GetRef(i)
        local Data = DataMgr.Monster[Creator.UnitId]
        if IsValid(SceneMgrComponent) and Data and Data.GuideIconAni then
          self.MonsterCreatorIdList[StaticCreatorId] = false
          GameState:RemoveGuideEid(Eid)
          SceneMgrComponent:UpdateSceneGuideIcon(Eid, nil, nil, "Delete", true, Data)
          DebugPrint("KillMonsterNode: \230\184\133\233\153\164\230\140\135\229\188\149 \233\157\153\230\128\129\231\130\185Id", StaticCreatorId, " \230\128\170\231\137\169Eid", Eid)
        end
      end
    end
  end
end

function KillMonsterNode:OnMonsterKilledByNums(Monster)
  if Monster and Monster:IsRealMonster() then
    self.KillMonsterCnt = self.KillMonsterCnt + 1
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
        self.KillMonsterCnt,
        self.MonsterNeedNums,
        self.CurQuestChainId,
        self.CurDoingQuestId,
        self
      })
    end
    DebugPrint("KillMonsterNode: \230\149\176\231\155\174\229\135\187\230\157\128\232\174\161\230\149\176 ", self.KillMonsterCnt, "STL Key", self.Key)
    if self.KillMonsterCnt >= self.MonsterNeedNums then
      self.Callback()
    end
  end
end

function KillMonsterNode:OnCancelTrack()
  DebugPrint("KillMonsterNode: OnCancelTrack", self.KillMonsterType)
  if self.KillMonsterType ~= "Nums" then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    self:HideMonsterGuide(GameMode)
  end
end

function KillMonsterNode:OnChooseTrack()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
      self.KillMonsterCnt,
      self.MonsterNeedNums,
      self.CurQuestChainId,
      self.CurDoingQuestId,
      self
    })
  end
  DebugPrint("KillMonsterNode: OnChooseTrack", self.KillMonsterType)
  if self.KillMonsterType ~= "Nums" then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    self:ShowMonterGuide(GameMode)
  end
end

function KillMonsterNode:OnMonsterKilledByCreatorId(Monster)
  if Monster then
    if self.MonsterCreatorIdList[Monster.CreatorId] ~= nil then
      self.KillMonsterCnt = self.KillMonsterCnt + 1
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
          self.KillMonsterCnt,
          self.MonsterNeedNums,
          self.CurQuestChainId,
          self.CurDoingQuestId,
          self
        })
      end
      DebugPrint("KillMonsterNode: \233\157\153\230\128\129\231\130\185\229\135\187\230\157\128\232\174\161\230\149\176 ", self.KillMonsterCnt, "\232\162\171\229\135\187\230\157\128\230\128\170\231\137\169\233\157\153\230\128\129\231\130\185Id ", Monster.CreatorId, "STL Key", self.Key)
    end
    Monster:DeactiveGuide()
    local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    GameState:RemoveGuideEid(Monster.Eid)
    if self.KillMonsterCnt >= self.MonsterNeedNums then
      self.Callback()
    end
  end
end

function KillMonsterNode:Clear()
  DebugPrint("KillMonsterNode: Clear\239\188\140\232\191\155\232\161\140\230\184\133\231\144\134")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if self.KillMonsterType == "Nums" then
    GameMode:STLUnRegisterKillMonsterNode(self.Key)
  else
    DebugPrint("KillMonsterNode: \231\167\187\233\153\164\230\183\187\229\138\160\230\140\135\229\188\149timer Handle Name: ", self.AddGuideTimer_Handle)
    GWorld.GameInstance:RemoveTimer(self.AddGuideTimer_Handle)
    self:HideMonsterGuide(GameMode)
    self.MonsterCreatorIdList = {}
    GameMode:STLUnRegisterKillMonsterNode_Creator(self.Key)
  end
  if self.IsShow then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if TaskUIObj then
    TaskUIObj:ClearCurTaskBarExtraInfo()
  end
  GameMode.KillMonsterNode = nil
  self.Callback = nil
end

function KillMonsterNode:OnQuestlineFail()
  DebugPrint("KillMonsterNode: \228\187\187\229\138\161\229\164\177\232\180\165\239\188\140\230\184\133\231\144\134\232\174\161\230\149\176", self.KillMonsterCnt)
  self.KillMonsterCnt = 0
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
      self.KillMonsterCnt,
      self.MonsterNeedNums,
      self.CurQuestChainId,
      self.CurDoingQuestId,
      self
    })
  end
  if self.IsShow then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

return KillMonsterNode
