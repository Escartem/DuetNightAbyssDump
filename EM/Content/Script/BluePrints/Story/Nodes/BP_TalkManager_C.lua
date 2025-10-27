require("UnLua")
local BP_TalkManager_C = Class()

function BP_TalkManager_C:Initialize(Initializer)
  self.bInTalk = false
  self.bDisableInput = false
  self.bHideGameUI = false
  self.SequenceTalkContext = nil
end

function BP_TalkManager_C:CreateTalkContext(TalkId)
  local TalkInfo = DataMgr.Talk[TalkId]
  local TalkContext = self.Overridden.CreateTalkContext(self, TalkId)
  if TalkInfo.TalkType == "Show" then
    self.SequenceTalkContext = TalkContext
  end
  return TalkContext
end

function BP_TalkManager_C:DestroyTalkContext(TalkId)
  local TalkInfo = DataMgr.Talk[TalkId]
  if TalkInfo.TalkType == "Show" then
    self.SequenceTalkContext = nil
  end
  self.Overridden.DestroyTalkContext(self, TalkId)
end

function BP_TalkManager_C:CheckInterruptOtherTalkContext(CheckTalkId)
  local CheckTalkInfo = DataMgr.Talk[CheckTalkId]
  local InterruptTalkIds = {}
  local TalkIds = self.TalkContexts:Keys()
  for i = 1, TalkIds:Length() do
    local TalkId = TalkIds:Get(i)
    local TalkContext = self.TalkContexts:Find(TalkId)
    if IsValid(TalkContext) and TalkId ~= CheckTalkId then
      local TalkInfo = DataMgr.Talk[TalkId]
      local TalkInterruptInfo = DataMgr.TalkInterrupt[CheckTalkInfo.TalkType]
      if TalkInterruptInfo then
        if TalkInterruptInfo[TalkInfo.TalkType] == nil then
          return false
        elseif TalkInterruptInfo[TalkInfo.TalkType] == "Interrupt" then
          table.insert(InterruptTalkIds, TalkId)
        end
      end
    end
  end
  for _, TalkId in pairs(InterruptTalkIds) do
    self:InterruptTalkContext(TalkId)
  end
  return true
end

function BP_TalkManager_C:IsInTalk()
  return self.bInTalk
end

function BP_TalkManager_C:HasHiddenGameUI()
  return self.bHideGameUI
end

function BP_TalkManager_C:HasDisableInput()
  return self.bHideGameUI
end

function BP_TalkManager_C:EnterTalk(bHideGameUI)
  self.bInTalk = true
  self.bHideGameUI = bHideGameUI
  self.bDisableInput = bHideGameUI
end

function BP_TalkManager_C:ExitTalk()
  self.bInTalk = false
  self.bHideGameUI = false
  self.bDisableInput = false
end

function BP_TalkManager_C:SequenceSetActorHidden(Actor, bHidden)
  if IsValid(self.SequenceTalkContext) then
    self.SequenceTalkContext:SetActorHiddenInContext(Actor, bHidden)
  end
end

return BP_TalkManager_C
