local DynamicQuestEvent = Class({
  "BluePrints.Common.ClientEvent.BaseClientEvent",
  "BluePrints.Common.TimerMgr"
})
local TimeUtils = require("Utils.TimeUtils")

function DynamicQuestEvent:InitEvent(DynamicQuestId, Callback)
  self.Type = "DynamicQuest"
  self.DynamicQuestId = DynamicQuestId
  self.SpecialQuestFinishCallback = Callback
end

function DynamicQuestEvent:OnStartEvent(...)
  self.DynamicQuestConfig = DataMgr.DynQuest[self.DynamicQuestId]
  assert(self.DynamicQuestConfig, "\230\137\190\228\184\141\229\136\176\229\138\168\230\128\129\228\187\187\229\138\161\231\188\150\229\143\183:\227\128\144" .. tostring(self.DynamicQuestConfig) .. "\227\128\145")
  self.TriggerBoxStaticCreatorId = self.DynamicQuestConfig.TriggerBoxID
  self.FailTriggerBoxID = self.DynamicQuestConfig.FailTriggerBoxID
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.DynQuest = Avatar.DynamicQuests[self.DynamicQuestId]
  end
  EventManager:AddEvent(EventID.OnEnterTriggerBox, self, self.OnEnterTriggerBox)
  EventManager:AddEvent(EventID.OnLeaveTriggerBox, self, self.OnLeaveTriggerBox)
  self:ActivateTrigger()
end

function DynamicQuestEvent:ActivateTrigger()
  DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]Trigger\230\191\128\230\180\187 \229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. " " .. TimeUtils.TimeToHMSStr())
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.TriggerActiveStaticCreator_DynQuestId then
    GameMode:TriggerActiveStaticCreator_DynQuestId({
      self.TriggerBoxStaticCreatorId
    }, self.DynamicQuestId)
    if self.FailTriggerBoxID ~= self.TriggerBoxStaticCreatorId then
      GameMode:TriggerActiveStaticCreator_DynQuestId({
        self.FailTriggerBoxID
      }, self.DynamicQuestId)
    end
  else
    DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]Trigger\230\191\128\230\180\187 \229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. " " .. TimeUtils.TimeToHMSStr() .. "\229\164\177\232\180\165\239\188\140GameMode\230\136\150TriggerActiveStaticCreator_DynQuestId\228\184\186\231\169\186")
  end
end

function DynamicQuestEvent:TryActivateEvent(...)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local CanTrigger = Avatar:CheckDynamicQuestIsInCantTriggerState(self.DynamicQuestId)
    if CanTrigger then
      DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\229\176\157\232\175\149\232\167\166\229\143\145\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. " " .. TimeUtils.TimeToHMSStr())
      Avatar:TriggerDynamicQuestBegin(self.DynamicQuestId, function(Ret)
        if Ret == ErrorCode.RET_SUCCESS then
          DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\232\167\166\229\143\145\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. "\230\136\144\229\138\159 " .. TimeUtils.TimeToHMSStr())
          self:OnActivateEvent()
        else
          DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\232\167\166\229\143\145\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. "\229\164\177\232\180\165 " .. TimeUtils.TimeToHMSStr())
        end
      end)
    end
  end
end

function DynamicQuestEvent:OnActivateEvent(...)
  PrintTable({
    OnActivateEvent = self.DynamicQuestId
  })
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:CheckAllDynamicQuestAlreadyTrigger() then
    EventManager:FireEvent(EventID.FirstDynQuest)
  end
  ClientEventUtils:ShowDynEventUI(self)
  EventManager:FireEvent(EventID.OnActiveDynamicQuest, self.DynamicQuestId)
  local TaskBar = self:GetMainTaskBar()
  local TrackingQuestChain = Avatar.TrackingQuestChainId
  if TaskBar then
    TaskBar:PlayAnimation(TaskBar.DynamicEvent_In)
    if 0 ~= TrackingQuestChain then
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        TaskBar:PlayAnimation(TaskBar.Tooltip_Out)
        TaskBar.Title:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        TaskBar.Tips:SetVisibility(ESlateVisibility.Collapsed)
      end
      if TaskBar.VBox_SubTasks:GetChildrenCount() > 0 then
        TaskBar.VBox_SubTasks:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
  ClientEventUtils:SetCurrentDoingDynamicEvent(self)
  local StoryPath = self.DynamicQuestConfig.StoryPath
  self.DynamicQuestStory = GWorld.StoryMgr:RunStory(StoryPath, nil, nil, nil, nil, {
    DynQuestId = self.DynamicQuestId
  })
end

function DynamicQuestEvent:TryFinishEvent(Result, Callback, NodeId, DialogueId, ForbidAnim)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if Result then
      local function _Callback(Ret)
        self:OnFinishEvent(true, Callback, DialogueId, ForbidAnim)
      end
      
      Avatar:TriggerDynamicQuestEnd(self.DynamicQuestId, "Success", _Callback, DialogueId)
    else
      local function _Callback(Ret)
        self:OnFinishEvent(false, Callback, nil, ForbidAnim)
      end
      
      Avatar:TriggerDynamicQuestEnd(self.DynamicQuestId, "Fail", _Callback, DialogueId)
    end
  end
end

function DynamicQuestEvent:GetMainTaskBar()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local TaskUIObj
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if nil ~= BattleMainUI and BattleMainUI.Pos_TaskBar:GetChildAt(0) then
    TaskUIObj = BattleMainUI.Pos_TaskBar:GetChildAt(0)
  end
  if nil ~= TaskUIObj then
    return TaskUIObj
  end
  return nil
end

function DynamicQuestEvent:OnFinishEvent(Result, Callback, DialogueId, ForbidAnim)
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    if Result then
      GameMode:TriggerOnDynQuestSuccess(self.DynamicQuestId)
    else
      GameMode:TriggerOnDynQuestFail(self.DynamicQuestId)
    end
    GameMode:TriggerOnDynQuestEnd(self.DynamicQuestId)
  end
  local DynEventUI = ClientEventUtils:GetDynEventUI()
  
  local function PlayTaskBarAnim()
    local TaskBar = self:GetMainTaskBar()
    if TaskBar then
      TaskBar:PlayAnimation(TaskBar.DynamicEvent_In)
      TaskBar.Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        TaskBar:PlayAnimation(TaskBar.Tooltip_In)
      end
      if TaskBar.VBox_SubTasks:GetChildrenCount() > 0 then
        TaskBar.VBox_SubTasks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
  
  if false == Result then
    DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. "\228\186\139\228\187\182\229\164\177\232\180\165 " .. TimeUtils.TimeToHMSStr())
    if true ~= ForbidAnim then
      DynEventUI:PlayFailAnim(GText("UI_DYNQUEST_FAIL"), PlayTaskBarAnim)
    end
  else
    DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(self.DynamicQuestId) .. "\228\186\139\228\187\182\230\136\144\229\138\159 " .. TimeUtils.TimeToHMSStr())
    if true ~= ForbidAnim then
      DynEventUI:PlaySuccessAnim(GText("UI_DYNQUEST_SUCCESS"), PlayTaskBarAnim)
    end
    local Avatar = GWorld:GetAvatar()
    if self.DynamicQuestConfig.DynImpression then
      for Key, ImprPlusId in pairs(self.DynamicQuestConfig.DynImpression) do
        if Key == DialogueId then
          if Avatar and ImprPlusId > 0 then
            Avatar:ShowImpressionPlusUI(ImprPlusId, function()
              self:ShowReward()
            end)
          end
          goto lbl_94
        end
      end
    end
    self:ShowReward()
    ::lbl_94::
  end
  self:Destroy(Result)
  if Callback then
    Callback()
  end
  if self.DynamicQuestFinishCallback then
    self.DynamicQuestFinishCallback(Result)
  end
end

function DynamicQuestEvent:ShowReward()
  local RewardId = self.DynamicQuestConfig.Reward
  local RewardList = {}
  for _, Id in ipairs(RewardId) do
    local RewardInfo = DataMgr.Reward[Id]
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          ItemId = ItemId,
          ItemType = ItemType,
          Count = Count,
          Rarity = Rarity
        }
        table.insert(RewardList, RewardContent)
      end
    end
  end
  UIUtils.ShowHudReward("UI_DYNQUEST_REWARD", RewardList)
end

function DynamicQuestEvent:Destroy(Result, Info)
  EventManager:RemoveEvent(EventID.OnDynamicQuestFail, self)
  EventManager:RemoveEvent(EventID.OnEnterTriggerBox, self)
  EventManager:RemoveEvent(EventID.OnLeaveTriggerBox, self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if self.LeaveTriggerTimerKey and Player:IsExistTimer(self.LeaveTriggerTimerKey) then
    Player:RemoveTimer(self.LeaveTriggerTimerKey)
    self.LeaveTriggerTimerKey = nil
  end
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  ClientEventUtils:ClearCurrentActiveDynamicEvent(self.DynamicQuestId)
  ClientEventUtils:ClearCurrentDoingDynamicEvent(false)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ClearRegionActorData("DynamicQuestId", self.DynamicQuestId, EDestroyReason.QuestChainClear, function(Target, Key, Value)
    return Target.ExtraRegionInfo.DynQuestId == Value
  end)
  if self.DynamicQuestStory and false == Result then
    GWorld.StoryMgr:StopStoryline(self.DynamicQuestStory)
    self.DynamicQuestStory = nil
  end
end

function DynamicQuestEvent:OnEnterTriggerBox(TriggerEventId, TriggerBase, EMActorEid)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  PrintTable({OnEnterTriggerBox = 1})
  if not Player then
    return
  end
  if TriggerEventId == self.TriggerBoxStaticCreatorId and Player.Eid == EMActorEid then
    if self.LeaveTriggerTimerKey and Player:IsExistTimer(self.LeaveTriggerTimerKey) then
      Player:RemoveTimer(self.LeaveTriggerTimerKey)
      self.LeaveTriggerTimerKey = nil
    end
    self:TryActivateEvent()
  end
end

function DynamicQuestEvent:OnLeaveTriggerBox(TriggerEventId, TriggerBase, EMActorEid)
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  if ClientEventUtils:GetCurrentDoingDynamicEvent() ~= self then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    return
  end
  if TriggerEventId == self.FailTriggerBoxID and Player.Eid == EMActorEid then
    local _, LeaveTriggerTimerKey = Player:AddTimer(DataMgr.GlobalConstant.DynTriggerFailTime.ConstantValue, function()
      PrintTable({OnLeaveTriggerBox = 1})
      self:TryFinishEvent(false)
      self.LeaveTriggerTimerKey = nil
    end, false, 0, "CheckDynamicEventFail")
    self.LeaveTriggerTimerKey = LeaveTriggerTimerKey
  end
end

return DynamicQuestEvent
