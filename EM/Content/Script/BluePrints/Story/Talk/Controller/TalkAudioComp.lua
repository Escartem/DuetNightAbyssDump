local FSoundOralComponent = require("BluePrints.Story.Talk.Component.SoundOralComponent").FSoundOralComponent
local TalkAudioComp_C = {}

function TalkAudioComp_C.New()
  local Obj = setmetatable({}, {__index = TalkAudioComp_C})
  Obj.SoundOralComponent = FSoundOralComponent.New()
  Obj.RecordPlayedAudio = nil
  return Obj
end

local function SoundCannotInterrput(TalkBasicType)
  if "Guide" == TalkBasicType or "Black" == TalkBasicType then
    return true
  end
  return false
end

function TalkAudioComp_C:PlayDialogue(DialogueData, TalkTaskData, TalkTask, Callback, bForceWait, OverrideAttachActor, bIsAttachActor, bPauseResume)
  local TalkContext = TalkTaskData.TalkContext
  local AudioManager = AudioManager(TalkContext)
  self.Callback = Callback
  if bPauseResume and not AudioManager:IsSoundStoped_CPP(self.sound_event_instance) then
    return
  end
  if not DialogueData.VoiceName then
    self:StopVOSound(TalkContext)
    if Callback then
      Callback.Func(Callback.Obj)
    end
    return
  end
  local NativeDialogueData = DataMgr.Dialogue[DialogueData.DialogueId]
  self.CurrentDialogueData = NativeDialogueData
  self.PauseEventVolume = nil
  local AssetPaths = self.SoundOralComponent:GetAssetPaths(AudioManager, DialogueData.VoiceName, NativeDialogueData.ExStoryInfo)
  if not AssetPaths or 0 == #AssetPaths then
    self:StopVOSound(TalkContext)
    DebugPrint(string.format("Error:DialogueData.DialogueId: %d \231\154\132\233\159\179\233\162\145\232\181\132\230\186\144\228\184\141\229\173\152\229\156\168", DialogueData.DialogueId))
    if Callback then
      Callback.Func(Callback.Obj)
    end
    self.CurrentDialogueData = nil
    return
  end
  self:ClearPlayAudioProxy()
  local PlayAudioProxy = {bIsValid = true}
  self.PlayAudioProxy = PlayAudioProxy
  local LoadedCount = 0
  local TotalToLoad = #AssetPaths
  for _, Path in pairs(AssetPaths) do
    UResourceLibrary.LoadObjectAsync(TalkContext, Path, {
      TalkContext,
      function(_, Asset)
        LoadedCount = LoadedCount + 1
        if LoadedCount < TotalToLoad then
          return
        end
        if PlayAudioProxy.bIsValid == false then
          if Callback then
            Callback.Func(Callback.Obj, true)
          end
          return
        end
        TalkContext.TalkTimerManager:DestroyTimer(TalkTask, self.TalkTimer)
        self:StopVOSound(TalkContext)
        self.bStopSoundWhenClear = true
        local AttachActor = OverrideAttachActor
        if nil == AttachActor then
          AttachActor = self:GetOralNPC(DialogueData)
        end
        self.RecordPlayedAudio = DialogueData.VoiceName
        local SoundEventInstance = self.SoundOralComponent:PlaySoundWithOral(AudioManager, DialogueData.VoiceName, AttachActor, bIsAttachActor, NativeDialogueData.ExStoryInfo, self:GetEventKey(TalkTaskData))
        self.sound_event_instance = SoundEventInstance
        if bForceWait or SoundCannotInterrput(TalkTaskData.BasicTalkType) then
          self:StartTalkTimer(TalkTask)
        end
      end
    })
  end
  if bForceWait or SoundCannotInterrput(TalkTaskData.BasicTalkType) then
  elseif Callback then
    Callback.Func(Callback.Obj)
  end
end

function TalkAudioComp_C:GetEventKey(TalkTaskData)
  if not TalkTaskData then
    return self.AudioEventKey
  end
  if TalkTaskData.TalkType then
    self.AudioEventKey = "TalkAudio_" .. TalkTaskData.TalkType
    return self.AudioEventKey
  else
    local Message = "TalkType\228\184\141\229\173\152\229\156\168\nTalkNodeId: " .. (TalkTaskData.TalkNodeId or "") .. [[

FirstDialogueId: ]] .. (TalkTaskData.FirstDialogueId or "")
    local Title = "\229\175\185\232\175\157\232\175\173\233\159\179\233\148\153\232\175\175"
    UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    return
  end
end

function TalkAudioComp_C:GetOralNPC(DialogueData)
  local TalkActorData = DialogueData.TalkActorData
  if not TalkActorData then
    return
  end
  local TalkActor = TalkActorData.TalkActor
  if not TalkActor then
    return
  end
  local DisableMouth = DialogueData.DisableMouth
  if DisableMouth then
    return
  end
  return TalkActor
end

function TalkAudioComp_C:CheckSoundIsStopped(TalkContext, TalkTask, Callback)
  if not self.sound_event_instance or AudioManager(TalkContext):IsSoundStoped_CPP(self.sound_event_instance) then
    TalkContext.TalkTimerManager:DestroyTimer(TalkTask, self.TalkTimer)
    if Callback then
      Callback.Func(Callback.Obj)
    end
  end
end

function TalkAudioComp_C:StopVOSound(TalkContext, AttachActor)
  AttachActor = AttachActor or UE4.UGameplayStatics.GetPlayerController(TalkContext, 0)
  AudioManager(TalkContext):StopSound(AttachActor, self:GetEventKey())
  self.AudioEventKey = nil
end

function TalkAudioComp_C:GetRecordPlayedAudio()
  return self.RecordPlayedAudio
end

function TalkAudioComp_C:Clear(TalkTask, AttachActor)
  if self.bStopSoundWhenClear then
    self:StopVOSound(GWorld.GameInstance, AttachActor)
  end
  self:ClearTimer(TalkTask)
  self:ClearPlayAudioProxy()
end

function TalkAudioComp_C:StartTalkTimer(TalkTask)
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local Callback = self.Callback
  self.TalkTimer = TalkContext.TalkTimerManager:AddTimer(TalkTask, 0.1, true, 0.1, self, self.CheckSoundIsStopped, TalkContext, TalkTask, {
    Func = function()
      if Callback then
        Callback.Func(Callback.Obj)
      end
    end
  })
end

function TalkAudioComp_C:ClearTimer(TalkTask)
  DebugPrint("TalkAudioComp_C:ClearTimer")
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if TalkContext then
    TalkContext.TalkTimerManager:DestroyTimer(TalkTask, self.TalkTimer)
  end
end

function TalkAudioComp_C:ClearPlayAudioProxy()
  if self.PlayAudioProxy then
    self.PlayAudioProxy.bIsValid = false
  end
end

function TalkAudioComp_C:OnPaused(TalkTask, AttachActor)
  DebugPrint("TalkAudioComp_C:OnPaused")
  local AudioManager = AudioManager(GWorld.GameInstance)
  AttachActor = AttachActor or UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local EventKey = self:GetEventKey()
  self.PauseEventVolume = self.PauseEventVolume or AudioManager:GetEventVolume(AttachActor, EventKey)
  AudioManager:PauseEvent(AttachActor, EventKey, true)
  AudioManager:SetEventVolume(AttachActor, EventKey, 0)
  AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {voice_effect_type = 0})
  self:ClearTimer(TalkTask)
  self:ClearPlayAudioProxy()
end

function TalkAudioComp_C:OnPauseResumed(TalkTask, AttachActor)
  DebugPrint("TalkAudioComp_C:OnPauseResumed")
  local AudioManager = AudioManager(GWorld.GameInstance)
  AttachActor = AttachActor or UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local EventKey = self:GetEventKey()
  AudioManager:PauseEvent(AttachActor, EventKey, false)
  AudioManager:RecoverEventInstanceVolume(AttachActor, EventKey, self.PauseEventVolume or 1)
  if self.CurrentDialogueData and self.CurrentDialogueData.SnapShot then
    AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {
      voice_effect_type = Const.DialogueSnapShot[self.CurrentDialogueData.SnapShot]
    })
  end
  self:StartTalkTimer(TalkTask)
end

return TalkAudioComp_C
