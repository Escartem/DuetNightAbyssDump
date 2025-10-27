local M = Class("BluePrints.Common.MVC.Controller")
local SignBoardBubbleTalkModel = require("BluePrints.UI.WBP.SignBoardBubble.SignBoardBubbleTalkModel")

function M:Init()
  M.Super.Init(self)
  EventManager:AddEvent(EventID.UpdateSignBoardNpc, self, self.OnUpdateSignBoardNpc)
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnCloseLoading)
end

function M:Destory()
  M.Super.Destory(self)
  EventManager:RemoveEvent(EventID.UpdateSignBoardNpc, self)
  local BoardSystem = UBoardBubbleSubsystem.GetSubsystem(GWorld.GameInstance)
  if not BoardSystem then
    return
  end
  BoardSystem:RemoveTimer(self.Timer)
  self.Timer = nil
end

function M:OnCloseLoading()
  local Avatar = self:GetAvatar()
  if Avatar and Avatar:CheckSubRegionType(Avatar:GetCurrentRegionId(), CommonConst.SubRegionType.Home) then
    self:StaryHomeBase()
  end
end

function M:StopTalkTrigger(RunningTriggerId)
  if RunningTriggerId ~= SignBoardBubbleTalkModel:GetRunningTalkTrigger() then
    return
  end
  local InvitateBubbleTalkKey = SignBoardBubbleTalkModel:GetRunningTalkTriggerBubbleKey()
  self.InvitateBubbleTalkKey = nil
  local TS = TalkSubsystem()
  SignBoardBubbleTalkModel:SetRunningTalkTrigger(nil, nil)
  if InvitateBubbleTalkKey then
    TS:ForceInterruptTalkTaskData(function(TalkTaskData)
      return TalkTaskData.FilePath == InvitateBubbleTalkKey
    end)
    SignBoardBubbleTalkModel:ResetTalkWaitTime(RunningTriggerId)
  end
end

function M:RecordBubbleDialogue(DialogueId)
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData then
    return
  end
  if Avatar:CheckSignBoardNpcTalkIsRecord(DialogueData.SpeakNpcId, DialogueId) then
    return
  end
  if not Avatar:CheckSignBoardNpcTalkValid(DialogueData.SpeakNpcId, DialogueId) then
    return
  end
  Avatar:TriggerRecordSignBoardNpcTalk(DialogueData.SpeakNpcId, DialogueId)
end

function M:StartTalkTrigger(GossipTriggerId)
  local TalkTriggerId = SignBoardBubbleTalkModel:GetTalkTriggerId(GossipTriggerId)
  local Avatar = self:GetAvatar()
  if not TalkTriggerId then
    return
  end
  if not Avatar then
    return
  end
  SignBoardBubbleTalkModel:SetRunningTalkTrigger(GossipTriggerId)
  
  local function OnTriggerFailedOrEnd()
    self:StopTalkTrigger(GossipTriggerId)
  end
  
  local function OnTriggerSucces()
    local GameInstance = GWorld.GameInstance
    local TalkContext = GameInstance:GetTalkContext()
    local InvitateBubbleTalkKey = TalkContext:StartTalk(TalkTriggerId, nil, nil, nil, nil, {Func = OnTriggerFailedOrEnd, Obj = self}, {
      Obj = self,
      Func = self.RecordBubbleDialogue
    }, SignBoardBubbleTalkModel:GetNpcCombination(GossipTriggerId))
    if GossipTriggerId == SignBoardBubbleTalkModel:GetRunningTalkTrigger() then
      SignBoardBubbleTalkModel:SetRunningTalkTrigger(GossipTriggerId, InvitateBubbleTalkKey)
    end
  end
  
  local NpcId = SignBoardBubbleTalkModel:GetServerCanTriggerNpc(GossipTriggerId)
  Avatar:TriggerAddSignBoardNpcDailyTalk(NpcId, function(bSuccess)
    if bSuccess and GossipTriggerId == SignBoardBubbleTalkModel:GetRunningTalkTrigger() then
      OnTriggerSucces()
    else
      OnTriggerFailedOrEnd()
    end
  end)
end

function M:TickCheck()
  local Avatar = self:GetAvatar()
  if not Avatar then
    local BoardSystem = UBoardBubbleSubsystem.GetSubsystem(GWorld.GameInstance)
    if not BoardSystem then
      return
    end
    BoardSystem:RemoveTimer(self.Timer)
    self.Timer = nil
    return
  end
  local SignBoardNpc = Avatar.SignBoardNpc
  if not SignBoardNpc then
    return
  end
  for i = 1, SignBoardNpc:Length() do
    local NpcId = SignBoardNpc[i]
    local TriggerIds = SignBoardBubbleTalkModel:GetNpcCanTrigger(NpcId)
    if TriggerIds then
      for _, TriggerId in pairs(TriggerIds) do
        if not SignBoardBubbleTalkModel:GetWaitTriggerQueue()[TriggerId] and SignBoardBubbleTalkModel:CheckCanTrigger(TriggerId) then
          SignBoardBubbleTalkModel:AddStartWaitTrigger(TriggerId)
        end
      end
    end
  end
  local TriggerQueue = SignBoardBubbleTalkModel:GetWaitTriggerQueue()
  local ToRemove
  for WaitTriggerId, _ in pairs(TriggerQueue) do
    if not SignBoardBubbleTalkModel:CheckTriggerDistance(WaitTriggerId) or not SignBoardBubbleTalkModel:CheckCanTrigger(WaitTriggerId) then
      ToRemove = ToRemove or {}
      table.insert(ToRemove, WaitTriggerId)
    end
  end
  if ToRemove then
    for index, TriggerId in ipairs(ToRemove) do
      SignBoardBubbleTalkModel:RemoveWaitTrigger(TriggerId)
    end
  end
  local RunningTriggerId = SignBoardBubbleTalkModel:GetRunningTalkTrigger()
  if not SignBoardBubbleTalkModel:CheckTriggerDistance(RunningTriggerId) then
    self:StopTalkTrigger(RunningTriggerId)
  end
  local NewTriggerId = SignBoardBubbleTalkModel:CheckWaitTriggerQueue()
  if NewTriggerId then
    self:StartTalkTrigger(NewTriggerId)
  end
end

function M:StaryHomeBase()
  local BoardSystem = UBoardBubbleSubsystem.GetSubsystem(GWorld.GameInstance)
  if not BoardSystem then
    return
  end
  BoardSystem:RemoveTimer(self.Timer)
  self.Timer = nil
  self.Timer = BoardSystem:AddTimer(0.2, function()
    self:TickCheck()
  end, true, 0, nil, false, UE4.ETickingGroup.TG_EndPhysics)
end

function M:OnUpdateSignBoardNpc()
  self:StopTalkTrigger(SignBoardBubbleTalkModel:GetRunningTalkTrigger())
  SignBoardBubbleTalkModel:ResetTalkData()
  local Avatar = self:GetAvatar()
  if Avatar and Avatar:CheckSubRegionType(Avatar:GetCurrentRegionId(), CommonConst.SubRegionType.Home) then
    self:StaryHomeBase()
  end
end

function M:GetModel()
  return SignBoardBubbleTalkModel
end

function M:GetEventName()
  return "SignBoardBubbleTalkModel"
end

return M
