local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local M = Class({
  "BluePrints.Common.TimerMgr"
})
local TimeUtil = require("Utils.TimeUtils")
local FSoundOralComponent = require("BluePrints.Story.Talk.Component.SoundOralComponent").FSoundOralComponent
local LightBubbleTalkAudioComp = {}

function LightBubbleTalkAudioComp.New(Context)
  local Obj = setmetatable({}, {__index = LightBubbleTalkAudioComp})
  Obj.SoundOralComponent = FSoundOralComponent.New()
  Obj.RecordPlayedAudio = nil
  Obj.Context = Context
  return Obj
end

function LightBubbleTalkAudioComp:GetEventKey()
  return "TalkAudio_LightBubble"
end

function LightBubbleTalkAudioComp:StopVOSound(Actor)
  AudioManager(self.Context):StopSound(Actor, self:GetEventKey())
end

function LightBubbleTalkAudioComp:ClearPlayAudioProxy()
  if self.PlayAudioProxy then
    self.PlayAudioProxy.bIsValid = false
  end
end

function LightBubbleTalkAudioComp:StartTalkTimer(Callback)
  self:ClearTimer()
  local TalkTimer = self.Context:AddTimer(0.1, function()
    if self:CheckSoundIsStopped(Callback) then
      self.Context:RemoveTimer(TalkTimer)
    end
  end, true, 0.1)
  self.TalkTimer = TalkTimer
end

function LightBubbleTalkAudioComp:ClearTimer()
  self.Context:RemoveTimer(self.TalkTimer)
  self.TalkTimer = nil
end

function LightBubbleTalkAudioComp:CheckSoundIsStopped(Callback)
  if not self.sound_event_instance or AudioManager(self.Context):IsSoundStoped_CPP(self.sound_event_instance) then
    if Callback then
      Callback()
    end
    return true
  end
end

function LightBubbleTalkAudioComp:PlayDialogue(DialogueId, LightTalkTask, Callback, Actor)
  local AudioManager = AudioManager(self.Context)
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData.VoiceName then
    self:StopVOSound(Actor)
    if Callback then
      Callback()
    end
    return
  end
  if DialogueData and DialogueData.SnapShot then
    AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {
      voice_effect_type = Const.DialogueSnapShot[DialogueData.SnapShot]
    })
  else
    AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {voice_effect_type = 0})
  end
  local AssetPaths = self.SoundOralComponent:GetAssetPaths(AudioManager, DialogueData.VoiceName, DialogueData.ExStoryInfo)
  if not AssetPaths or 0 == #AssetPaths then
    self:StopVOSound(Actor)
    DebugPrint(string.format("Error:DialogueData.DialogueId: %d \231\154\132\233\159\179\233\162\145\232\181\132\230\186\144\228\184\141\229\173\152\229\156\168", DialogueId))
    if Callback then
      Callback()
    end
    return
  end
  self:ClearPlayAudioProxy()
  local PlayAudioProxy = {bIsValid = true}
  self.PlayAudioProxy = PlayAudioProxy
  local LoadedCount = 0
  local TotalToLoad = #AssetPaths
  for _, Path in pairs(AssetPaths) do
    UResourceLibrary.LoadObjectAsync(self.Context, Path, {
      self.Context,
      function(_, Asset)
        LoadedCount = LoadedCount + 1
        if LoadedCount < TotalToLoad then
          return
        end
        if PlayAudioProxy.bIsValid == false then
          if Callback then
            Callback()
          end
          return
        end
        self:StopVOSound(self.AttachActor)
        self.AttachActor = Actor
        local AttachActor = Actor
        self.RecordPlayedAudio = DialogueData.VoiceName
        local SoundEventInstance = self.SoundOralComponent:PlaySoundWithOral(AudioManager, DialogueData.VoiceName, AttachActor, true, DialogueData.ExStoryInfo, self:GetEventKey())
        self.sound_event_instance = SoundEventInstance
        self:StartTalkTimer(Callback)
      end
    })
  end
end

function LightBubbleTalkAudioComp:StopAndClear()
  self:StopVOSound(self.AttachActor)
  self:ClearTimer()
  self:ClearPlayAudioProxy()
  self.AttachActor = nil
end

local LightBubbleTalkTask = {}

function LightBubbleTalkTask.New(Character, TalkSetting, FinishCallback, Context)
  local NewTable = setmetatable({}, {__index = LightBubbleTalkTask})
  NewTable.TalkActor = Character
  NewTable.NowDialogueId = TalkSetting.BubbleDialogueId
  NewTable.BubbleType = TalkSetting.BubbleType
  NewTable.BubbleDialogueId = TalkSetting.BubbleDialogueId
  NewTable.DelayTime = TalkSetting.DelayTime
  NewTable.BubbleStartDelay = TalkSetting.BubbleStartDelay
  NewTable.FinishCallback = FinishCallback
  NewTable.Context = Context
  NewTable.TalkAudioComp = LightBubbleTalkAudioComp.New(Context)
  return NewTable
end

function LightBubbleTalkTask:StartTalk()
  if self.BubbleStartDelay and self.BubbleStartDelay > 0 then
    self.StartTimer = self.Context:AddTimer(self.BubbleStartDelay, function()
      self:PlayDialogue()
    end)
  else
    self:PlayDialogue()
  end
end

function LightBubbleTalkTask:PlayDialogue()
  local DialogueData = DataMgr.Dialogue[self.NowDialogueId]
  if not DialogueData then
    self:OnDialogueFinish()
    return
  end
  local Content = TalkUtils:DialogueIdToContent(self.NowDialogueId)
  if not IsValid(self.TalkActor) then
    self:ClearTalkTask()
    return
  end
  self.TalkActor:EnableBubbleWidget(true, Content)
  local bTimerFinish = false
  local bAudioFInish = false
  self.Timer = self.Context:AddTimer(DialogueData.Duration or 1, function()
    bTimerFinish = true
    if bTimerFinish and bAudioFInish then
      self:OnDialogueEnd()
    end
  end)
  self.TalkAudioComp:PlayDialogue(self.NowDialogueId, self, function()
    bAudioFInish = true
    if bTimerFinish and bAudioFInish then
      self:OnDialogueEnd()
    end
  end, self.TalkActor)
end

function LightBubbleTalkTask:OnDialogueEnd()
  local DialogueData = DataMgr.Dialogue[self.NowDialogueId]
  self.TalkAudioComp:StopAndClear()
  if not DialogueData or not DialogueData.NextDialogue then
    if self.BubbleType == UE4.ELightBubbleType.StayOnLast then
      return
    end
    if IsValid(self.TalkActor) then
      self.TalkActor:EnableBubbleWidget(false)
    end
    self:OnDialogueFinish()
    return
  end
  if IsValid(self.TalkActor) then
    self.TalkActor:EnableBubbleWidget(false)
  end
  self.NowDialogueId = DialogueData.NextDialogue
  self:PlayDialogue()
end

function LightBubbleTalkTask:OnDialogueFinish()
  if self.BubbleType == UE4.ELightBubbleType.DelayLoop then
    self.DelayTimer = self.Context:AddTimer(self.DelayTime, function()
      self.DelayTimer = nil
      self.NowDialogueId = self.BubbleDialogueId
      self:PlayDialogue()
    end)
    return
  end
  self:ClearTalkTask()
  if self.FinishCallback then
    local FinishCallback = self.FinishCallback
    self.FinishCallback = nil
    FinishCallback()
  end
end

function LightBubbleTalkTask:ClearTalkTask()
  if IsValid(self.TalkActor) then
    self.TalkActor:EnableBubbleWidget(false)
  end
  if self.Timer then
    self.Context:RemoveTimer(self.Timer)
    self.Timer = nil
  end
  if self.DelayTimer then
    self.Context:RemoveTimer(self.DelayTimer)
    self.DelayTimer = nil
  end
  if self.StartTimer then
    self.Context:RemoveTimer(self.StartTimer)
    self.StartTimer = nil
  end
  self.TalkAudioComp:StopAndClear()
end

function M:InitTalkMgr()
  self.RunningTalkTask = {}
  self.TriggerTime = {}
  self.HideTag = {}
  self.bHide = false
  EventManager:AddEvent(EventID.OnHideAllComponentUI, self, self.OnHideAllComponentUI)
end

function M:OnHideAllComponentUI(bIsHide, Tag)
  Tag = Tag or "DefaultTag"
  if bIsHide then
    self.HideTag[Tag] = true
  else
    self.HideTag[Tag] = nil
  end
  local NewHide = nil ~= next(self.HideTag)
  if NewHide ~= self.bHide then
    self:RealHide(NewHide)
  end
end

function M:RealHide(bHide)
  self.bHide = bHide
  if bHide then
    local ToStop = {}
    for Char, Task in pairs(self.RunningTalkTask) do
      ToStop[Char] = true
    end
    for Char, _ in pairs(ToStop) do
      self:StopTalkTask(Char)
    end
  end
end

function M:DeInitTalkMgr()
  self.RunningTalkTask = nil
  self.TriggerTime = nil
  EventManager:RemoveEvent(EventID.OnHideAllComponentUI, self)
end

function M:CheckBubbleCD(Character, TalkSetting)
  local NowTime = TimeUtils.NowTime()
  if self.TriggerTime[Character] then
    if NowTime - self.TriggerTime[Character] >= TalkSetting.BubbleCD then
      return true
    end
  else
    return true
  end
  return false
end

function M:StartTalkTask(Character, TalkSetting)
  DebugPrint("TalkSetting", TalkSetting.BubbleDialogueId, TalkSetting.DelayTime)
  local TalkTask = LightBubbleTalkTask.New(Character, TalkSetting, function()
    self:StopTalkTask(Character)
  end, self)
  TalkTask:StartTalk()
  self.RunningTalkTask[Character] = TalkTask
  self.TriggerTime[Character] = TimeUtils.NowTime()
  self:OnTalkTaskStart(Character)
end

function M:StopTalkTask(Character)
  local TalkTask = self.RunningTalkTask[Character]
  if not TalkTask then
    return
  end
  TalkTask:ClearTalkTask()
  self.RunningTalkTask[Character] = nil
  self.TriggerTime[Character] = TimeUtils.NowTime()
  self:OnTalkTaskEnd(Character)
end

return M
