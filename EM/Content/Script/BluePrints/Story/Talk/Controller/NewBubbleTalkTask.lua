local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local Timeutils = require("Utils.TimeUtils")
local EBubblePlayType = {
  Once = "Once",
  StayOnLast = "StayOnLast",
  DelayLoop = "DelayLoop"
}
local WaitItemUniqueTag = TalkUtils:GetPlayDialogueWaitItemTags()
local M = Class("BluePrints.Story.Talk.Controller.LightTalkTask")

function M:InitUI()
end

function M:Start(TalkTaskData, NodeFinished_Callback)
  if TalkTaskData.CreateTalkActors then
    TalkTaskData.TalkContext:CreateTalkActors(self, TalkTaskData.CreateTalkActors)
  end
  M.Super.Start(self, TalkTaskData, NodeFinished_Callback)
end

function M:Clear(bIsPaused)
  if self.TalkTaskData.RemoveTalkActors then
    self.TalkContext:DestoryTalkActors(self, self.TalkTaskData.RemoveTalkActors)
  end
  M.Super.Clear(self, bIsPaused)
end

function M:CheckBubbleInCd()
  local TalkTaskData = self.TalkTaskData
  if not TalkTaskData.bBubblePlayCDEnable then
    return false
  end
  local LastPlayTime = self.TalkContext:GetBubbleLastPlayTime(TalkTaskData)
  local BubblePlayCD = TalkTaskData.BubblePlayCD
  local NowTime = Timeutils.NowTime()
  if BubblePlayCD <= NowTime - LastPlayTime then
    return false
  end
  return true, BubblePlayCD - (NowTime - LastPlayTime)
end

function M:StartPlayDialogue()
  local bBubbleInCd, CdLastTime = self:CheckBubbleInCd()
  if bBubbleInCd then
    self.TalkTimerManager:AddTimer(self, CdLastTime, false, nil, self, self.StartPlayDialogue)
    return
  end
  self.DialogueIterationComponent:Start()
  self.TalkContext:RecordBubbleStart(self.TalkTaskData)
end

function M:PlayDialogue(bPauseResume)
  local NodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if NodeType == EDialogueNodeType.Dialogue then
    local Dialogue = self.DialogueIterationComponent:GetDialogue()
    if not Dialogue then
      DebugPrint("lhr@Dialogue Iteration Error: Dialogue\228\184\186\231\169\186")
      return
    end
    DebugPrint("M:PlayDialogue:", self.TalkTaskData.TalkNodeId, Dialogue.DialogueId)
    self:DisableBubbleUI()
    local DialogueData = self:GetDialogueDataWithCheck(Dialogue)
    if not self:CheckDialogueData(DialogueData, Dialogue.DialogueId) then
      self:OnTaskPlayDialogueFinished()
      return
    end
    self:OnPlayingDialogue(Dialogue)
    self:ConstructWaitTag(DialogueData, self, self.OnTaskPlayDialogueFinished)
    self:ProcessWaitTag_PlayScript(DialogueData, self.WaitQueue)
    self:ProcessWaitTag_UIPlayDialogue(DialogueData, self.WaitQueue)
    self:ProcessWaitTag_PlayAudio(DialogueData, bPauseResume, true, true, self.WaitQueue)
  else
    DebugPrint("lhr@Dialogue Iteration Error: NodeType", NodeType, "\228\184\141\229\144\136\230\179\149")
    return
  end
end

function M:EndDialogue()
  DebugPrint("lhr@BubbleTalk end")
  if self.TalkTaskData.BubblePlayType == EBubblePlayType.Once then
    self:Finish(ETalkNodeFinishType.Out)
  elseif self.TalkTaskData.BubblePlayType == EBubblePlayType.StayOnLast then
  elseif self.TalkTaskData.BubblePlayType == EBubblePlayType.DelayLoop then
    self:DisableBubbleUI()
    self.DialogueIterationComponent:Initialize(DataMgr.Dialogue, self.TalkTaskData.FirstDialogueId)
    self.TalkTimerManager:AddTimer(self, self.TalkTaskData.BubbleDelayLoopSeconds, false, nil, self, function()
      self.DialogueIterationComponent:Start()
    end)
  end
end

function M:ConstructWaitTag(DialogueData, Obj, Func)
  self.WaitQueue = self.TalkContext.WaitQueueManager:CreateWaitQueue(self, {
    {
      Tag = WaitItemUniqueTag.UIPlayDialogue
    },
    {
      Tag = WaitItemUniqueTag.PlayAudio
    },
    {
      Tag = WaitItemUniqueTag.PlayScript,
      Condition = function()
        return DialogueData.Scripts
      end
    }
  }, Obj, Func)
end

function M:ProcessWaitTag_UIPlayDialogue(DialogueData, WaitQueuePointer)
  DebugPrint("NewBubbleTalkTask ProcessWaitTag_UIPlayDialogue", DialogueData)
  self:RecordDialogueData(DialogueData)
  self:EnableBubbleUI(DialogueData)
  self.TalkTimerManager:AddTimer(self, DialogueData.Duration, false, nil, nil, function()
    WaitQueuePointer:CompleteWaitItem(WaitItemUniqueTag.UIPlayDialogue)
  end)
end

function M:EnableBubbleUI(DialogueData)
  local TalkActor = DialogueData.TalkActorData.TalkActor
  if IsValid(TalkActor) then
    local Content = DialogueData.Content
    local Style
    if DialogueData.DialoguePanelType then
      local DialoguePanelType = string.lower(DialogueData.DialoguePanelType)
      Style = TalkUtils:FindTargetString(DialoguePanelType, "style")
    end
    TalkActor:EnableBubbleWidget(true, Content, Style)
    self.TalkActor = TalkActor
  end
end

function M:DisableBubbleUI()
  if self.WorkingDialogueData then
    local TalkActor = self.WorkingDialogueData.TalkActorData.TalkActor
    if IsValid(TalkActor) then
      TalkActor:EnableBubbleWidget(false)
    end
    self.TalkActor = nil
  end
end

function M:RecordDialogueData(DialogueData)
  self.LastDialogueData = self.WorkingDialogueData
  self.WorkingDialogueData = DialogueData
end

function M:ClearUI()
  if IsValid(self.TalkActor) then
    self.TalkActor:EnableBubbleWidget(false)
  end
end

function M:ClearAudio()
  if self.TalkAudioComp then
    self.TalkAudioComp:Clear(self, self.TalkActor)
  end
end

function M:OnPaused()
  M.Super.OnPaused(self)
  self:DisableBubbleUI()
end

function M:PauseAudio()
  self:PauseSnapShot()
  if self.TalkAudioComp then
    self.TalkAudioComp:OnPaused(self, self.TalkActor)
  end
end

function M:ResumePauseAudio()
  if self.TalkAudioComp then
    self.TalkAudioComp:OnPauseResumed(self, self.TalkActor)
  end
end

function M:CheckDialogueData(DialogueData, DialogueId)
  local ErrorMessge = [[

DialogueId:]] .. tostring(DialogueId) .. [[

TalkNodeName: ]] .. tostring(self.TalkTaskData.TalkNodeName)
  if not DialogueData then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\134\146\230\179\161\229\175\185\232\175\157\230\149\176\230\141\174\233\148\153\232\175\175", "\229\143\176\230\156\172\229\134\133\229\174\185\228\184\186\231\169\186" .. ErrorMessge)
    return false
  elseif not DialogueData.TalkActorData then
    local Dialogue = DataMgr.Dialogue[DialogueId]
    local SpeakNpcId = Dialogue and Dialogue.SpeakNpcId or 0
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\134\146\230\179\161\229\175\185\232\175\157\230\149\176\230\141\174\233\148\153\232\175\175", "\229\143\176\230\156\172SpeakNpcId\229\173\151\230\174\181\228\184\186\231\169\186\n \230\136\150\232\128\133TalkNode\230\178\161\230\156\137\233\133\141\231\189\174\229\189\147\229\137\141\229\143\176\230\156\172SpeakNpcId\231\154\132\230\188\148\229\145\152 SpeakNpcId: " .. tostring(SpeakNpcId) .. ErrorMessge)
    return false
  elseif not DialogueData.TalkActorData.TalkActor then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\134\146\230\179\161\229\175\185\232\175\157\230\149\176\230\141\174\233\148\153\232\175\175", "Npc\228\184\141\229\173\152\229\156\168\nNpcId:" .. tostring(DialogueData.TalkActorData.TalkActorId) .. ErrorMessge)
    return false
  end
  return true
end

return M
