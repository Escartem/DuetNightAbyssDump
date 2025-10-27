local M = Class("BluePrints.Common.MVC.Model")
local SignBoardBubbleTalkCommon = require("BluePrints.UI.WBP.SignBoardBubble.SignBoardBubbleTalkCommon")
local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local TimeUtils = require("Utils.TimeUtils")

function M:Init()
  M.Super.Init(self)
  self:ResetTalkData()
end

function M:Destory()
  M.Super.Destory(self)
  self.WaitTriggerQueue = nil
end

function M:GetWaitTriggerQueue()
  return self.WaitTriggerQueue
end

function M:GetRunningTalkTrigger()
  return self.RunningTalkTrigger
end

function M:GetRunningTalkTriggerBubbleKey()
  return self.RunningTalkTriggerBubbleKey
end

function M:SetRunningTalkTrigger(TriggerId, RunningTalkTriggerBubbleKey)
  self.RunningTalkTrigger = TriggerId
  self.RunningTalkTriggerBubbleKey = RunningTalkTriggerBubbleKey
end

function M:AddStartWaitTrigger(TriggerId)
  if not self.WaitTriggerQueue then
    return
  end
  if self.WaitTriggerQueue[TriggerId] then
    return
  end
  self.WaitTriggerQueue[TriggerId] = TimeUtils.NowTime()
end

function M:RemoveWaitTrigger(TriggerId)
  if not self.WaitTriggerQueue then
    return
  end
  self.WaitTriggerQueue[TriggerId] = nil
  self.FinishTrigger[TriggerId] = nil
end

function M:GetTalkTriggerId(TriggerId)
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local TriggerInfo = NpcGossipTrigger[TriggerId]
  if not TriggerInfo then
    return
  end
  return TriggerInfo.RelatedTalks
end

function M:GetNpcCombination(TriggerId)
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local TriggerInfo = NpcGossipTrigger[TriggerId]
  if not TriggerInfo then
    return
  end
  return TriggerInfo.NpcCombination
end

function M:GetServerCanTriggerNpc(TriggerId)
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  local NpcIds = self:GetNpcCombination(TriggerId)
  if not NpcIds then
    return
  end
  for _, NpcId in ipairs(NpcIds) do
    if Avatar:CheckSignBoardNpcDailyTalkIsLimit(NpcId) then
      return NpcId
    end
  end
end

function M:CheckWaitTriggerQueue()
  if not self.WaitTriggerQueue then
    return
  end
  if self:GetRunningTalkTrigger() then
    return
  end
  local InvitateBubbleTime = DataMgr.GlobalConstant.InvitateBubbleWaitTime.ConstantValue
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local NowTime = TimeUtils.NowTime()
  local TriggerIds = {}
  for TriggerId, Time in pairs(self.WaitTriggerQueue) do
    local WaitTime = NowTime - Time
    if not self.FinishTrigger[TriggerId] and FTalkTriggerComponent:CheckCondition(NpcGossipTrigger[TriggerId].RelatedTalks) and WaitTime > (NpcGossipTrigger[TriggerId].BubbleWaitTime or InvitateBubbleTime) then
      table.insert(TriggerIds, TriggerId)
    end
  end
  if #TriggerIds <= 0 then
    return
  end
  local Index = math.random(1, #TriggerIds)
  return TriggerIds[Index]
end

function M:CheckTriggerDistance(TriggerId)
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local TriggerInfo = NpcGossipTrigger[TriggerId]
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not TriggerInfo then
    return
  end
  if not IsValid(Player) then
    return
  end
  if not Player:CheckCanInteractiveTrigger() then
    return
  end
  if not IsValid(Player.InteractiveTriggerComponent) then
    return
  end
  local Distance = TriggerInfo.TriggerArea or Player.InteractiveTriggerComponent:GetInteractiveTriggerDistance()
  local NpcCombination = TriggerInfo.NpcCombination
  for _, NpcId in pairs(NpcCombination) do
    local Npc = UE4.ANpcCharacter.GetNpc(GWorld.GameInstance, NpcId)
    if Npc and Npc.NpcTalkInteractiveComponent.DistanceCheck(Npc, Player, Distance) then
      return true
    end
  end
  return false
end

function M:GetNpcCanTrigger(NpcId)
  local NpcTriggerConvert = DataMgr.NpcGossipTriggerConvert
  local NpcTrigger = NpcTriggerConvert.NpcTrigger or {}
  local TriggerIds = NpcTrigger[NpcId]
  if not TriggerIds then
    return
  end
  return TriggerIds
end

function M:CheckCanTrigger(TriggerId)
  if not self:GetServerCanTriggerNpc(TriggerId) then
    return
  end
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local NpcTriggerConvert = DataMgr.NpcGossipTriggerConvert
  local TriggerNpcMap = NpcTriggerConvert.TriggerNpcMap or {}
  local TriggerNpc = TriggerNpcMap[TriggerId]
  local TriggerInfo = NpcGossipTrigger[TriggerId]
  if not TriggerInfo then
    return false
  end
  local GossipPoint = TriggerInfo.GossipPoint
  local NpcCombination = TriggerInfo.NpcCombination
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  local Count = 0
  for _, Point in pairs(GossipPoint) do
    local Pos = SignBoardBubbleTalkCommon.NpcPointReMap[Point]
    local NpcId = Avatar.SignBoardNpc[Pos]
    if TriggerNpc[NpcId] then
      Count = Count + 1
    end
  end
  if Count >= #NpcCombination then
    return true
  end
end

function M:ResetTalkData()
  self.WaitTriggerQueue = {}
  self.FinishTrigger = {}
  self.RunningTalkTrigger = nil
  self.RunningTalkTriggerBubbleKey = nil
end

function M:ResetTalkWaitTime(RunningTriggerId)
  local NpcGossipTrigger = DataMgr.NpcGossipTrigger
  local InvitateBubbleTime = DataMgr.GlobalConstant.InvitateBubbleWaitTime.ConstantValue
  local NowTime = TimeUtils.NowTime()
  self.FinishTrigger[RunningTriggerId] = true
  for TriggerId, Time in pairs(self.WaitTriggerQueue) do
    self.WaitTriggerQueue[TriggerId] = NowTime
  end
end

return M
