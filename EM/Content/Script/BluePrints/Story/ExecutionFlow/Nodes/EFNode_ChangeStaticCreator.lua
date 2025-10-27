local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local QuestNodeUtils = require("StoryCreator.StoryLogic.QuestNodeUtils")
local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  self.DialogueId = Flow.DialogueId
  local TalkTaskData = TalkTask.TalkTaskData
  local StoryLine = GWorld.StoryMgr:GetStory(TalkTaskData.FilePath)
  for _, StoryNode in pairs(StoryLine.RunningNodeList) do
    local Questline = StoryNode.Questline
    if Questline and Questline:GetNode(TalkTaskData.TalkNodeId) then
      self.TalkNode = Questline:GetNode(TalkTaskData.TalkNodeId)
      break
    end
  end
  if not self.TalkNode then
    self:PrintError("Error! EFNode_ChangeStaticCreator \230\156\170\230\137\190\229\136\176TalkNode")
    return
  end
  self.ActiveEnable = Params.IsActive
  self.EnableBlackScreenSync = Params.EnableBlackScreen
  self.EnableFadeIn = Params.EnableFadeIn
  self.EnableFadeOut = Params.EnableFadeOut
  local StaticCreatorIdList = Params.StaticCreatorIdList or {}
  self.StaticCreatorIdList = TArray(0)
  for index, StaticCreatorId in pairs(StaticCreatorIdList) do
    self.StaticCreatorIdList:Add(StaticCreatorId)
  end
  self.NewTargetPointName = Params.NewTargetPointName
  local EFNode_ChangeStaticCreator = Flow:CreateNode(UEFNode_Delegate)
  local IsActive = self.ActiveEnable and 1 or 0
  EFNode_ChangeStaticCreator.DebugLog = string.format("ChangeStaticCreator ActiveEnable: %d", IsActive)
  EFNode_ChangeStaticCreator.OnStart:Add(EFNode_ChangeStaticCreator, function(Node)
    self.FlowNode = Node
    self:Start()
  end)
  return EFNode_ChangeStaticCreator
end

function M:Start()
  if not self:IsAllStaticCreatorValid() then
    self:PrintError("Error! EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\161\171\229\133\165\233\157\153\230\128\129\231\130\185Id\228\184\141\229\173\152\229\156\168\239\188\140\232\138\130\231\130\185\228\184\173\230\150\173\239\188\129")
    return
  end
  if not self.EnableBlackScreenSync then
    self:ChangeStaticCreatorState()
    return
  end
  if self.EnableFadeIn then
    DebugPrint("EFNode_ChangeStaticCreator: \233\187\145\229\177\143\229\188\128\229\144\175")
    self:PlayBlackUIIn()
  else
    if self.EnableFadeOut then
      self:DirectShowBlackUI()
    end
    self:ChangeStaticCreatorState()
  end
end

function M:Finish()
  local Node = self.FlowNode
  if Node then
    Node:Finish({
      Node.FinishPin
    })
  else
    self:PrintError("Error! EFNode_ChangeStaticCreator Node\228\184\141\229\173\152\229\156\168")
  end
end

function M:PrintError(Message)
  local Message = Message and Message .. ", DialogueId: " .. self.DialogueId
  GWorld.logger.error(Message)
end

function M:ChangeStaticCreatorState()
  DebugPrint("------------ EFNode_ChangeStaticCreator ------------------")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(IsValid(GameMode), "GameMode is not valid!")
  if not IsValid(GameMode) then
    return
  end
  self.ActivedMonsterCount = 0
  
  local function LoadFinishCallback(Unit)
    self.ActivedMonsterCount = self.ActivedMonsterCount + 1
    DebugPrint("EFNode_ChangeStaticCreator LoadFinishCallback self.ActivedMonsterCount Unit.CreatorId", self.ActivedMonsterCount, Unit.CreatorId)
    if self.ActivedMonsterCount == self.StaticCreatorIdList:Length() then
      self:FinishAction()
    end
  end
  
  if self.ActiveEnable then
    if self.EnableBlackScreenSync then
      local function BindEventAndTrigger()
        DebugPrint("EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \231\187\145\229\174\154\228\186\139\228\187\182\229\185\182\230\191\128\230\180\187\233\157\153\230\128\129\231\130\185")
        
        if not self:IsAllLevelLoaded() then
          self:DirectCloseBlackUI()
          self:PrintError("Error! EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \228\188\160\233\128\129\229\144\142\233\157\153\230\128\129\231\130\185\229\164\170\232\191\156\232\162\171\229\186\143\229\136\151\229\140\150\239\188\140\232\138\130\231\130\185\228\184\173\230\150\173\239\188\129")
          return
        end
        for index, StaticCreatorId in pairs(self.StaticCreatorIdList) do
          GWorld.StoryMgr:BindStaticCreatorActorEvent(StaticCreatorId, EActorEventType.OnCreated, self, LoadFinishCallback)
        end
        QuestNodeUtils.STLTriggerActiveStaticCreator(self.TalkNode, self.StaticCreatorIdList)
      end
      
      local NewTargetPoint = GameMode.EMGameState:GetTargetPoint(self.NewTargetPointName)
      if self.NewTargetPointName == nil or self.NewTargetPointName == "" or not IsValid(NewTargetPoint) then
        if not self:IsAllLevelLoaded() then
          self:DirectCloseBlackUI()
          self:PrintError("Error! EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \230\178\161\230\156\137\229\161\171\229\134\153TargetPoint\228\184\148\233\157\153\230\128\129\231\130\185\229\164\170\232\191\156\232\162\171\229\186\143\229\136\151\229\140\150\239\188\140\232\138\130\231\130\185\228\184\173\230\150\173\239\188\129")
          return
        end
        BindEventAndTrigger()
      else
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
        if GameMode:GetWCSubSystem() then
          DebugPrint("EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\188\128\229\167\139\228\188\160\233\128\129\232\135\179\231\155\174\230\160\135\231\130\185", self.NewTargetPointName)
          GameMode:GetWCSubSystem():RequestAsyncTravel(Player, NewTargetPoint:GetTransform(), {
            GWorld.GameInstance,
            BindEventAndTrigger
          }, true)
        else
          DebugPrint("Warning EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \230\173\164\229\140\186\229\159\159\230\178\161\230\156\137WC")
          GameMode:EMSetActorLocationAndRotation(0, self.NewTargetPointName, true)
          BindEventAndTrigger()
        end
      end
    else
      QuestNodeUtils.STLTriggerActiveStaticCreator(self.TalkNode, self.StaticCreatorIdList)
      self:FinishAction()
    end
  else
    local StaticCreatorArray = TArray(0)
    for index, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      StaticCreatorArray:Add(StaticCreatorId)
    end
    GameMode:TriggerInactiveStaticCreator(StaticCreatorArray, false, EDestroyReason.StoryLine)
    self:FinishAction()
  end
end

function M:FinishAction()
  if not self.EnableBlackScreenSync then
    self:Finish()
    return
  end
  if self.EnableFadeOut then
    DebugPrint("EFNode_ChangeStaticCreator: \233\187\145\229\177\143\231\187\147\230\157\159")
    self:PlayBlackUIOut()
  else
    if self.EnableFadeIn then
      self:DirectCloseBlackUI()
    end
    self:Finish()
  end
end

function M:Clear()
  DebugPrint("EFNode_ChangeStaticCreator: Clear")
  self:DirectCloseBlackUI()
  if self.EnableBlackScreenSync then
    for index, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      GWorld.StoryMgr:UnbindStaticCreatorActorEventByType(StaticCreatorId, EActorEventType.OnCreated)
    end
  end
end

function M:IsAllStaticCreatorValid()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    local Creator = GameMode.EMGameState:GetStaticCreatorInfo(CreatorId)
    if not IsValid(Creator) then
      self:PrintError("Error! EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\161\171\229\133\165\231\154\132\233\157\153\230\128\129\231\130\185Id\227\128\144" .. tostring(CreatorId) .. "\227\128\145\230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185\239\188\140\232\175\183\230\163\128\230\159\165\239\188\129")
      return false
    end
  end
  return true
end

function M:IsAllLevelLoaded()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    local Creator = GameMode.EMGameState:GetStaticCreatorInfo(CreatorId)
    if not GameMode:CheckLevelLoadedByActor(Creator) then
      self:PrintError("Error! EFNode_ChangeStaticCreator \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\161\171\229\133\165\231\154\132\233\157\153\230\128\129\231\130\185Id\227\128\144" .. tostring(CreatorId) .. "\227\128\145\230\137\128\229\156\168\229\133\179\229\141\161\230\178\161\230\156\137\232\162\171\229\138\160\232\189\189\239\188\140\232\175\183\230\163\128\230\159\165\239\188\129")
      return false
    end
  end
  return true
end

function M:PlayBlackUIIn()
  local Params = {}
  Params.BlackScreenHandle = "EFNode_ChangeStaticCreator" .. self.DialogueId
  Params.InAnimationObj = self
  Params.InAnimationCallback = self.ChangeStaticCreatorState
  Params.InAnimationPlayTime = 1
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = self.Finish
  Params.OutAnimationPlayTime = 1
  UIManager(GWorld.GameInstance):ShowCommonBlackScreen(Params)
end

function M:PlayBlackUIOut()
  UIManager(GWorld.GameInstance):HideCommonBlackScreen("EFNode_ChangeStaticCreator" .. self.DialogueId)
end

function M:DirectShowBlackUI()
  local Params = {}
  Params.BlackScreenHandle = "EFNode_ChangeStaticCreator" .. self.DialogueId
  Params.InAnimationPlayTime = 0
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = self.Finish
  Params.OutAnimationPlayTime = 1
  UIManager(GWorld.GameInstance):ShowCommonBlackScreen(Params)
end

function M:DirectCloseBlackUI()
  UIManager(GWorld.GameInstance):CloseCommonBlackScreenWithoutCB("EFNode_ChangeStaticCreator" .. self.DialogueId)
end

return M
