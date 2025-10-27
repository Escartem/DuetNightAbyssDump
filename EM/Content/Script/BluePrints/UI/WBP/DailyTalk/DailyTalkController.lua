local M = Class("BluePrints.Common.MVC.Controller")
local DailyTalkModel = require("BluePrints.UI.WBP.DailyTalk.DailyTalkModel")
local DailyTalkCommon = require("BluePrints.UI.WBP.DailyTalk.DailyTalkCommon")

function M:Init()
  M.Super.Init(self)
  EventManager:AddEvent(EventID.OnTalkTriggerComplete, self, self.OnTalkTriggerComplete)
  EventManager:AddEvent(EventID.EnterImmersiveTalk, self, self.OnEnterStory)
  self.ShowDailyRewardUI = {}
  self.EnterStory = false
end

function M:Destory()
  M.Super.Destory(self)
  EventManager:RemoveEvent(EventID.OnTalkTriggerComplete, self)
  EventManager:RemoveEvent(EventID.OnHudRewardClose, self)
  EventManager:RemoveEvent(EventID.EnterImmersiveTalk, self)
  self.ShowDailyRewardUI = nil
  self.EnterStory = false
end

function M:OnHudRewardClose(RewardUI)
  if not self.bInited then
    return
  end
  if RewardUI then
    self.ShowDailyRewardUI[RewardUI] = nil
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if table.isempty(self.ShowDailyRewardUI) and Player then
    Player:SetCanInteractiveTrigger(true, "ShowDailyRewards")
  end
end

function M:ShowDailyRewards(TalkTriggerId, RewardInfo)
  if not self.bInited then
    return
  end
  EventManager:AddEvent(EventID.OnHudRewardClose, self, self.OnHudRewardClose)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player then
    Player:SetCanInteractiveTrigger(false, "ShowDailyRewards")
  end
  local RewardUI = UIUtils.ShowHudRewardConvert(DailyTalkCommon.RewardTitle, RewardInfo)
  self.ShowDailyRewardUI[RewardUI] = true
  self:AddTimer(10, function()
    self:OnHudRewardClose(RewardUI)
  end)
end

function M:OnTalkTriggerComplete(TalkTriggerId)
  DebugPrint("OnTalkTriggerComplete", TalkTriggerId)
  if not self:GetModel():CheckDailyTalkUnFinish(TalkTriggerId) then
    return
  end
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:GetDailyTalkReward(TalkTriggerId)
end

function M:OnEnterStory(TalkTriggerId)
  local NpcMap = DailyTalkModel.DailyTalkNpc
  if self:GetModel():CheckDailyTalkUnFinish(TalkTriggerId) then
    self.EnterStory = true
  end
  if not NpcMap then
    return
  end
  for NpcId, NpcTalkInteractiveComponent in pairs(NpcMap) do
    if IsValid(NpcTalkInteractiveComponent) then
      local Npc = NpcTalkInteractiveComponent.Owner
      Npc:EnableBubbleRewardWidget(false)
    end
  end
end

function M:CheckNeedShowRewardBubble()
  if not self:GetAvatar() then
    self:StopTimer(self.TickTimer)
    self.TickTimer = nil
    return
  end
  local NpcMap = DailyTalkModel.DailyTalkNpc
  if not NpcMap then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    return
  end
  for NpcId, NpcTalkInteractiveComponent in pairs(NpcMap) do
    if IsValid(NpcTalkInteractiveComponent) then
      local Npc = NpcTalkInteractiveComponent.Owner
      if not self.EnterStory and NpcTalkInteractiveComponent.DistanceCheck(Npc, Player, DailyTalkCommon.CheckShowBubbleDistance) then
        Npc:EnableBubbleRewardWidget(DailyTalkModel:CheckCanDailyTalkReward(NpcId))
      else
        Npc:EnableBubbleRewardWidget(false)
      end
    end
  end
end

function M:RegisterDailyTalkNpc(NpcId, NpcTalkInteractiveComponent)
  DailyTalkModel:RegisterNpc(NpcId, NpcTalkInteractiveComponent)
  self:StopTimer(self.TickTimer)
  self.TickTimer = nil
  if DailyTalkModel:CheckNeedTick() then
    self.TickTimer = self:AddTimer(0.3, function()
      self:CheckNeedShowRewardBubble()
    end, true)
  end
end

function M:OnGetReward()
  self.EnterStory = false
  local NpcMap = DailyTalkModel.DailyTalkNpc
  if not NpcMap then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    return
  end
  for NpcId, NpcTalkInteractiveComponent in pairs(NpcMap) do
    if IsValid(NpcTalkInteractiveComponent) then
      local Npc = NpcTalkInteractiveComponent.Owner
      if NpcTalkInteractiveComponent.DistanceCheck(Npc, Player, DailyTalkCommon.CheckShowBubbleDistance) then
        Npc:EnableBubbleRewardWidget(DailyTalkModel:CheckCanDailyTalkReward(NpcId))
      else
        Npc:EnableBubbleRewardWidget(false)
      end
    end
  end
end

function M:GetModel()
  return DailyTalkModel
end

function M:GetEventName()
  return EventID.DailyTalkControllerEvent
end

return M
