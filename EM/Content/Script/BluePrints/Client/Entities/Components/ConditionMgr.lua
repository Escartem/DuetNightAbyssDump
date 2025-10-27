local ConditionMgr = {}

function ConditionMgr:EnterWorld()
  self.ConditionCheckId = 0
  self.PendingCheckConditionTable = {}
  self.PendingCheckConditionInfo = {}
end

function ConditionMgr:CheckCondition(ConditionId)
  return ConditionUtils.CheckCondition(self, ConditionId)
end

function ConditionMgr:GenerateConditionCheckId()
  self.ConditionCheckId = self.ConditionCheckId + 1
  return self.ConditionCheckId
end

local ConditionState = {
  Unknown = -1,
  False = 0,
  True = 1
}

function ConditionMgr:ServerCheckCondition(ConditionId, Callback, bShowFailed)
  bShowFailed = bShowFailed or false
  print(_G.LogTag, "ServerCheckCondition", ConditionId, bShowFailed)
  local ConditionInfo = DataMgr.Condition[ConditionId]
  if not ConditionInfo then
    ConditionUtils:CheckShowFailed(ConditionId, false, bShowFailed)
    Callback(false)
    return
  end
  local Logic = string.lower(ConditionInfo.ConditionLogic)
  local CheckConditionId = self:GenerateConditionCheckId()
  self.PendingCheckConditionTable[CheckConditionId] = {
    LogicServerResult = ConditionState.Unknown
  }
  self.PendingCheckConditionInfo[CheckConditionId] = {
    ConditionId = ConditionId,
    Logic = Logic,
    bShowFailed = bShowFailed,
    Callback = Callback
  }
  
  local function cb(ret)
    if not self.PendingCheckConditionTable[CheckConditionId] then
      return
    end
    if true == ret then
      self.PendingCheckConditionTable[CheckConditionId].LogicServerResult = ConditionState.True
    else
      self.PendingCheckConditionTable[CheckConditionId].LogicServerResult = ConditionState.False
    end
    self:ReceiveCheckConditionResult(CheckConditionId)
  end
  
  self:CallServer("ServerCheckCondition", cb, ConditionId, CheckConditionId)
end

function ConditionMgr:CheckDedicatedServerCondition(ConditionCheckId, ConditionString)
  assert(not self.PendingCheckConditionTable[ConditionCheckId][ConditionString], "\230\157\161\228\187\182\229\183\178\229\173\152\229\156\168")
  print(_G.LogTag, "CheckDedicatedServerCondition", ConditionCheckId, ConditionString)
  self.PendingCheckConditionTable[ConditionCheckId][ConditionString] = ConditionState.Unknown
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  assert(PlayerController, "Controller is InValid.")
  if IsStandAlone(GWorld.GameInstance) then
    PlayerController:CheckDedicatedServerCondition_Lua(ConditionCheckId, ConditionString)
  else
    PlayerController:CheckDedicatedServerCondition(ConditionCheckId, ConditionString)
  end
end

function ConditionMgr:OnCheckDedicatedServerCondition(ConditionCheckId, ConditionString, ConditionValue)
  print(_G.LogTag, "OnCheckDedicatedServerCondition", ConditionString, ConditionValue)
  local ConditionTable = self.PendingCheckConditionTable[ConditionCheckId]
  if not ConditionTable then
    return
  end
  ConditionTable[ConditionString] = ConditionValue
  self:ReceiveCheckConditionResult(ConditionCheckId)
end

function ConditionMgr:CheckClientCondition(ConditionCheckId, ConditionString)
  assert(not self.PendingCheckConditionTable[ConditionCheckId][ConditionString], "\230\157\161\228\187\182\229\183\178\229\173\152\229\156\168")
  print(_G.LogTag, "CheckClientCondition", ConditionCheckId, ConditionString)
  local ConditionValue = 0
  local ConditionName, Params = ConditionUtils:UnpackParams(ConditionString)
  if ConditionUtils["Judge" .. ConditionName](self, Params) then
    ConditionValue = 1
  end
  self.PendingCheckConditionTable[ConditionCheckId][ConditionString] = ConditionValue
  self:ReceiveCheckConditionResult(ConditionCheckId)
end

function ConditionMgr:ReceiveCheckConditionResult(ConditionCheckId)
  print(_G.LogTag, "ReceiveCheckConditionResult", ConditionCheckId)
  local Delay = false
  local Info = self.PendingCheckConditionInfo[ConditionCheckId]
  local Logic = Info.Logic
  if "and" == Logic then
    for _, v in pairs(self.PendingCheckConditionTable[ConditionCheckId]) do
      if v == ConditionState.False then
        self:DealServerConditionResult(Info, false)
        self:ClearCheckCondition(ConditionCheckId)
        return
      elseif v == ConditionState.Unknown and not Delay then
        Delay = true
      end
    end
    if not Delay then
      self:DealServerConditionResult(Info, true)
      self:ClearCheckCondition(ConditionCheckId)
    end
  elseif "or" == Logic then
    for _, v in pairs(self.PendingCheckConditionTable[ConditionCheckId]) do
      if v == ConditionState.True then
        self:DealServerConditionResult(Info, true)
        self:ClearCheckCondition(ConditionCheckId)
        return
      elseif v == ConditionState.Unknown and not Delay then
        Delay = true
      end
    end
    if not Delay then
      self:DealServerConditionResult(Info, false)
      self:ClearCheckCondition(ConditionCheckId)
    end
  else
    error("UnExpected ConditionLogic: " .. Logic)
  end
end

function ConditionMgr:DealServerConditionResult(PendingCheckConditionInfo, Result)
  ConditionUtils:CheckShowFailed(PendingCheckConditionInfo.ConditionId, Result, PendingCheckConditionInfo.bShowFailed)
  PendingCheckConditionInfo.Callback(Result)
end

function ConditionMgr:ClearCheckCondition(ConditionCheckId)
  self.PendingCheckConditionTable[ConditionCheckId] = nil
  self.PendingCheckConditionInfo[ConditionCheckId] = nil
end

function ConditionMgr:ClientTriggerCheckCondition(ConditionId)
  print(_G.LogTag, "ClientTriggerCheckCondition", ConditionId)
  self:CallServerMethod("ClientTriggerCheckCondition", ConditionId)
end

return ConditionMgr
