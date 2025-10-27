local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local QuestNodeUtils = require("StoryCreator.StoryLogic.QuestNodeUtils")
local ChangeStaticCreatorNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function ChangeStaticCreatorNode:Init()
  self.ActiveEnable = false
  self.EnableBlackScreenSync = false
  self.EnableFadeIn = false
  self.EnableFadeOut = false
  self.StaticCreatorIdList = {}
  self.NewTargetPointName = ""
  self.AssureTimerHandle = ""
  self.TempPrintInfo = {}
end

function ChangeStaticCreatorNode:Start(Context)
  self.Context = Context
  if not self:IsAllStaticCreatorValid() then
    self:PrintErrorlog("\229\161\171\229\133\165\233\157\153\230\128\129\231\130\185Id\228\184\141\229\173\152\229\156\168\239\188\140\232\138\130\231\130\185\228\184\173\230\150\173\239\188\129")
    return
  end
  if not self.EnableBlackScreenSync then
    self:ChangeStaticCreatorState()
    return
  end
  if self.EnableFadeIn then
    DebugPrint("ChangeStaticCreatorNode: \233\187\145\229\177\143\229\188\128\229\144\175")
    self:PlayBlackUIIn()
  else
    if self.EnableFadeOut then
      self:DirectShowBlackUI()
    end
    self:ChangeStaticCreatorState()
  end
end

function ChangeStaticCreatorNode:ChangeStaticCreatorState()
  DebugPrint("------------ ChangeStaticCreatorNode ------------------")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(IsValid(GameMode), "GameMode is not valid!")
  if not IsValid(GameMode) then
    return
  end
  if self.EnableBlackScreenSync then
    self:AddAssureTimer()
  end
  self.ActivedMonsterCount = 0
  
  local function LoadFinishCallback(SelfNode, Info)
    self.ActivedMonsterCount = self.ActivedMonsterCount + 1
    if Info.Actor then
      DebugPrint("ChangeStaticCreatorNode \230\142\165\230\148\182\229\136\176\229\155\158\232\176\131. \231\155\174\229\137\141\230\148\182\229\136\176\231\154\132\229\155\158\232\176\131\230\128\187\230\149\176:", self.ActivedMonsterCount, " CreatorId", Info.Actor.CreatorId, "Eid", Info.Actor.Eid, "UnitId", Info.Actor.UnitId, "Name", Info.Actor:GetName())
    else
      DebugPrint("ChangeStaticCreatorNode \230\142\165\230\148\182\229\136\176\229\155\158\232\176\131. \231\155\174\229\137\141\230\148\182\229\136\176\231\154\132\229\155\158\232\176\131\230\128\187\230\149\176:", self.ActivedMonsterCount)
    end
    if self.ActivedMonsterCount == #self.StaticCreatorIdList then
      GWorld.GameInstance:RemoveTimer(self.AssureTimerHandle)
      self:FinishAction()
    end
  end
  
  if self.ActiveEnable then
    if self.EnableBlackScreenSync then
      local function BindEventAndTrigger()
        DebugPrint("ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \231\187\145\229\174\154\228\186\139\228\187\182\229\185\182\230\191\128\230\180\187\233\157\153\230\128\129\231\130\185")
        
        local IsAllLevelLoaded = self:IsAllLevelLoaded()
        if IsAllLevelLoaded then
          for index, StaticCreatorId in pairs(self.StaticCreatorIdList) do
            GWorld.StoryMgr:BindStaticCreatorActorEvent(StaticCreatorId, EActorEventType.OnCreated, self, LoadFinishCallback)
          end
        end
        QuestNodeUtils.STLTriggerActiveStaticCreator(self, self.StaticCreatorIdList)
        if not IsAllLevelLoaded then
          self:PrintErrorlog("\233\157\153\230\128\129\231\130\185\230\191\128\230\180\187\229\137\141\230\163\128\230\181\139\229\136\176\229\133\179\229\141\161\230\156\170\229\138\160\232\189\189\239\188\140\233\187\145\229\177\143\231\155\180\230\142\165\229\133\179\233\151\173\239\188\140\232\138\130\231\130\185\229\174\140\230\136\144\239\188\129")
          self:DirectCloseBlackUI()
          self:Finish()
        end
      end
      
      local NewTargetPoint = GameMode.EMGameState:GetTargetPoint(self.NewTargetPointName)
      if self.NewTargetPointName == nil or self.NewTargetPointName == "" or not IsValid(NewTargetPoint) then
        BindEventAndTrigger()
      else
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
        if GameMode:GetWCSubSystem() then
          DebugPrint("ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\188\128\229\167\139\228\188\160\233\128\129\232\135\179\231\155\174\230\160\135\231\130\185", self.NewTargetPointName)
          GameMode:GetWCSubSystem():RequestAsyncTravel(Player, NewTargetPoint:GetTransform(), {
            GWorld.GameInstance,
            BindEventAndTrigger
          }, true)
        else
          DebugPrint("Warning ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \230\173\164\229\140\186\229\159\159\230\178\161\230\156\137WC")
          GameMode:EMSetActorLocationAndRotation(0, self.NewTargetPointName, true)
          BindEventAndTrigger()
        end
      end
    else
      QuestNodeUtils.STLTriggerActiveStaticCreator(self, self.StaticCreatorIdList)
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

function ChangeStaticCreatorNode:FinishAction()
  if not self.EnableBlackScreenSync then
    self:Finish()
    return
  end
  if self.EnableFadeOut then
    DebugPrint("ChangeStaticCreatorNode: \233\187\145\229\177\143\231\187\147\230\157\159")
    self:PlayBlackUIOut()
  else
    if self.EnableFadeIn then
      self:DirectCloseBlackUI()
    end
    self:Finish()
  end
end

function ChangeStaticCreatorNode:Clear()
  DebugPrint("ChangeStaticCreatorNode: Clear")
  GWorld.GameInstance:RemoveTimer(self.AssureTimerHandle)
  self:DirectCloseBlackUI()
  if self.EnableBlackScreenSync then
    for index, StaticCreatorId in pairs(self.StaticCreatorIdList) do
      GWorld.StoryMgr:UnbindStaticCreatorActorEventByType(StaticCreatorId, EActorEventType.OnCreated)
    end
  end
end

function ChangeStaticCreatorNode:IsAllStaticCreatorValid()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    local Creator = GameMode.EMGameState:GetStaticCreatorInfo(CreatorId)
    if not IsValid(Creator) then
      ScreenPrint("Error! ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\161\171\229\133\165\231\154\132\233\157\153\230\128\129\231\130\185Id\227\128\144" .. tostring(CreatorId) .. "\227\128\145\230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185\239\188\140\232\175\183\230\163\128\230\159\165\239\188\129")
      table.insert(self.TempPrintInfo, CreatorId)
      return false
    end
  end
  return true
end

function ChangeStaticCreatorNode:IsAllLevelLoaded()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, CreatorId in pairs(self.StaticCreatorIdList) do
    local Creator = GameMode.EMGameState:GetStaticCreatorInfo(CreatorId)
    if not GameMode:CheckLevelLoadedByActor(Creator) then
      ScreenPrint("Error! ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: \229\161\171\229\133\165\231\154\132\233\157\153\230\128\129\231\130\185Id\227\128\144" .. tostring(CreatorId) .. "\227\128\145\230\137\128\229\156\168\229\133\179\229\141\161\230\178\161\230\156\137\232\162\171\229\138\160\232\189\189\239\188\140\232\175\183\230\163\128\230\159\165\239\188\129")
      table.insert(self.TempPrintInfo, CreatorId)
      return false
    end
  end
  return true
end

function ChangeStaticCreatorNode:PlayBlackUIIn()
  local Params = {}
  Params.BlackScreenHandle = "ChangeStaticCreatorNode" .. self.Key
  Params.InAnimationObj = self
  Params.InAnimationCallback = self.ChangeStaticCreatorState
  Params.InAnimationPlayTime = 1
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = self.Finish
  Params.OutAnimationPlayTime = 1
  UIManager(GWorld.GameInstance):ShowCommonBlackScreen(Params)
end

function ChangeStaticCreatorNode:PlayBlackUIOut()
  UIManager(GWorld.GameInstance):HideCommonBlackScreen("ChangeStaticCreatorNode" .. self.Key)
end

function ChangeStaticCreatorNode:DirectShowBlackUI()
  local Params = {}
  Params.BlackScreenHandle = "ChangeStaticCreatorNode" .. self.Key
  Params.InAnimationPlayTime = 0
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = self.Finish
  Params.OutAnimationPlayTime = 1
  UIManager(GWorld.GameInstance):ShowCommonBlackScreen(Params)
end

function ChangeStaticCreatorNode:DirectCloseBlackUI()
  UIManager(GWorld.GameInstance):CloseCommonBlackScreenWithoutCB("ChangeStaticCreatorNode" .. self.Key)
end

function ChangeStaticCreatorNode:AddAssureTimer()
  local function OnAssureTimerEnd()
    self:PrintErrorlog("\233\187\145\229\177\143\230\151\182\233\151\180\232\191\135\233\149\191\239\188\140\232\167\166\229\143\145\228\191\157\229\186\149\229\144\142\232\138\130\231\130\185\229\174\140\230\136\144\239\188\129")
    
    self:DirectCloseBlackUI()
    self:Finish()
  end
  
  self.AssureTimerHandle = "ChangeStaticCreatorNodeAssureTimer" .. self.Key
  GWorld.GameInstance:AddTimer(5, OnAssureTimerEnd, false, 0, self.AssureTimerHandle)
end

function ChangeStaticCreatorNode:PrintErrorlog(Msg)
  ScreenPrint("Error! ChangeStaticCreatorNode \231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185: ", Msg)
  local Message = "ChangeStaticCreatorNode " .. Msg .. "\t" .. table.concat(self.TempPrintInfo, ",") .. "\n====STL\228\191\161\230\129\175========" .. [[

FileName:	]] .. self.Context.FileName .. [[

QuestChainId:	]] .. self.Context.QuestChainId .. [[

QuestId:	]] .. self.Context.QuestId .. [[

StoryNodeKey:	]] .. self.Context.Data.key .. [[

Key:	]] .. self.Key .. "\n====\232\138\130\231\130\185\233\133\141\231\189\174\228\191\161\230\129\175========" .. "\n\231\148\159\230\136\144/\233\148\128\230\175\129:\t" .. tostring(self.ActiveEnable) .. "\n\229\144\175\231\148\168\233\187\145\229\177\143\229\144\140\230\173\165:\t" .. tostring(self.EnableBlackScreenSync) .. "\n\229\144\175\231\148\168\230\183\161\229\133\165\233\187\145\229\177\143:\t" .. tostring(self.EnableFadeIn) .. "\n\229\144\175\231\148\168\230\183\161\229\135\186\233\187\145\229\177\143:\t" .. tostring(self.EnableFadeOut) .. "\n\233\157\153\230\128\129\231\130\185Id\229\136\151\232\161\168:\t" .. table.concat(self.StaticCreatorIdList, ",") .. "\n\231\155\174\230\160\135\231\130\185\229\144\141\231\167\176:\t" .. tostring(self.NewTargetPointName)
  UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\231\148\159\230\136\144/\233\148\128\230\175\129\229\136\183\230\150\176\231\130\185", Message)
  self.TempPrintInfo = {}
end

return ChangeStaticCreatorNode
