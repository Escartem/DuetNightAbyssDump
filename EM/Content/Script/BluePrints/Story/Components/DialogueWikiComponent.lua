local WaitTags = {UnlockOrRefresh = 1, PlayDialogue = 2}
local FDialogueWikiComponent = {}

function FDialogueWikiComponent:New(TalkTask)
  local DialogueWikiComponent = setmetatable({}, {__index = FDialogueWikiComponent})
  DialogueWikiComponent:Initialize(TalkTask)
  return DialogueWikiComponent
end

function FDialogueWikiComponent:Initialize(TalkTask)
  self.TalkTask = TalkTask
  self.Dialogue = DataMgr.Dialogue
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    DebugPrint("FDialogueWikiComponent:Initialize@TalkContext is InValid")
    return
  end
  self.WaitQueueManager = TalkContext.WaitQueueManager
  self.ListenedWikiList = self.ListenedWikiList or {}
end

function FDialogueWikiComponent:AddListenWikiId(WikiIds)
  if not WikiIds then
    return
  end
  self.ListenedWikiList = self.ListenedWikiList or {}
  for _, WikiId in pairs(WikiIds) do
    self.ListenedWikiList[WikiId] = self.WaitQueueManager:CreateWaitQueue(WikiId, {
      {
        Tag = WaitTags.UnlockOrRefresh
      },
      {
        Tag = WaitTags.PlayDialogue
      }
    }, self, function()
      self:OnWikiAllConditionsMet(WikiId)
    end)
  end
end

function FDialogueWikiComponent:Execute()
  self:Register()
end

function FDialogueWikiComponent:Resume()
  self:UnRegister()
end

function FDialogueWikiComponent:CompletePlayDialogue(RelatedWikiId)
  if not RelatedWikiId then
    return
  end
  for _, WikiId in pairs(RelatedWikiId) do
    if self.ListenedWikiList[WikiId] then
      local WaitQueue = self.ListenedWikiList[WikiId]
      WaitQueue:CompleteWaitItem(WaitTags.PlayDialogue)
    end
  end
end

function FDialogueWikiComponent:CompleteEntryUnlockOrRefresh(WikiId)
  DebugPrint("FDialogueWikiComponent:CompleteEntryUnlockOrRefresh", WikiId)
  if not self.ListenedWikiList[WikiId] then
    return
  end
  local WaitQueue = self.ListenedWikiList[WikiId]
  WaitQueue:CompleteWaitItem(WaitTags.UnlockOrRefresh)
end

function FDialogueWikiComponent:Register()
  EventManager:AddEvent(EventID.OnEntryTextUnlocked, self, self.CompleteEntryUnlockOrRefresh)
end

function FDialogueWikiComponent:OnWikiAllConditionsMet(WikiId)
  if not WikiId then
    DebugPrint("FDialogueWikiComponent@OnWikiAllConditionsMet, WikiId is InValid", WikiId)
    return
  end
  if self.TalkTask and self.TalkTask.UI then
    self.TalkTask.UI:TryShowWikiButton(self.TalkTask)
    self.TalkTask.UI:PlayWikiRemindAnim()
  end
  self.WaitQueueManager:ClearGroup(WikiId)
  self.ListenedWikiList[WikiId] = nil
  if nil == next(self.ListenedWikiList) then
    self:UnRegister()
  end
end

function FDialogueWikiComponent:UnRegister()
  for WikiId, WaitQueue in pairs(self.ListenedWikiList) do
    if WaitQueue then
      WaitQueue:CloseWaitQueue()
      self.WaitQueueManager:ClearGroup(WikiId)
    end
  end
  self.ListenedWikiList = {}
  EventManager:RemoveEvent(EventID.OnEntryTextUnlocked, self)
end

return FDialogueWikiComponent
