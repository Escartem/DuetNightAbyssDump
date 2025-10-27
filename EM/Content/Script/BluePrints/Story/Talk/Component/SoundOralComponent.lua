local FSoundOralComponent = {}

function FSoundOralComponent.New()
  local NewItem = setmetatable({}, {__index = FSoundOralComponent})
  return NewItem
end

function FSoundOralComponent:GetAssetPaths(AudioManager, VoiceName, ExStoryInfo)
  assert(AudioManager, string.format("AudioManager \230\152\175\231\169\186\239\188\140\232\142\183\229\143\150\229\143\176\230\156\172\233\159\179\233\162\145\231\155\184\229\133\179\232\181\132\230\186\144\232\183\175\229\190\132\229\164\177\232\180\165\227\128\130VoiceName: %s", VoiceName))
  assert(VoiceName, string.format("VoiceName \230\152\175\231\169\186\239\188\140\232\142\183\229\143\150\229\143\176\230\156\172\233\159\179\233\162\145\231\155\184\229\133\179\232\181\132\230\186\144\232\183\175\229\190\132\229\164\177\232\180\165\227\128\130\230\152\175\231\169\186\239\188\140\232\142\183\229\143\150\229\143\176\230\156\172\233\159\179\233\162\145\231\155\184\229\133\179\232\181\132\230\186\144\232\183\175\229\190\132\229\164\177\232\180\165\227\128\130VoiceName: %s", VoiceName))
  if not AudioManager:GetGender() then
    return
  end
  local EventPath = VoiceName
  if "EXPlayer" == ExStoryInfo then
    EventPath = VoiceName .. AudioManager:GetGender(true)
  else
    EventPath = VoiceName .. AudioManager:GetGender()
  end
  local RealEventPath, SelectKey, EventExist, OralPath
  RealEventPath, SelectKey, OralPath, EventExist = AudioManager:DoesVoiceSoundPathExist(EventPath)
  if not EventExist then
    RealEventPath, SelectKey, OralPath, EventExist = AudioManager:DoesVoiceSoundPathExist(VoiceName)
  end
  local EventAssetPath = AudioManager:GetEventAssetPath(RealEventPath)
  local AssetPaths = {}
  if "" ~= EventAssetPath then
    table.insert(AssetPaths, EventAssetPath)
  end
  if string.sub(OralPath, 1, 6) ~= "event:" and UResourceLibrary.CheckResourceExistOnDisk(OralPath) then
    table.insert(AssetPaths, OralPath)
  end
  DebugPrint("TTT:SoundOralComponent GetAssetPaths", RealEventPath, SelectKey, EventAssetPath, OralPath)
  return AssetPaths
end

function FSoundOralComponent:PlaySoundWithOral(AudioManager, VoiceName, VoiceActor, bIsAttached, ExStoryInfo, EventKey)
  local AttachedActor = VoiceActor
  local bIsPlay2D = not bIsAttached
  if bIsPlay2D then
    AttachedActor = UE4.UGameplayStatics.GetPlayerController(AudioManager, 0)
  end
  local RealEventPath, SelectKey, OralPath, EventExist = AudioManager:GetEventData(VoiceName, ExStoryInfo)
  local PlayStruct = FPlayFMODSoundStruct()
  DebugPrint("TTT:PlaySoundWithOral", RealEventPath, SelectKey, bIsPlay2D, AttachedActor:GetName())
  PlayStruct.FMODEvent = AudioManager:GetFMODEventByPath_Sync(RealEventPath)
  PlayStruct.EventKey = EventKey or Const.TalkSoundKey
  PlayStruct.bStopWhenAttachedToDestoryed = true
  PlayStruct.bPlayAs2D = bIsPlay2D
  PlayStruct.SelectKey = SelectKey
  PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, AttachedActor)
  if VoiceActor and VoiceActor.StopOral then
    PlayStruct.DynamicSoundStop = {
      VoiceActor,
      function()
        VoiceActor:StopOral(VoiceName)
      end
    }
  end
  DebugPrint(string.format("TTT:PlaySoundWithOral: %s, %s, %s, %s", VoiceName, RealEventPath, SelectKey, OralPath))
  local SoundEventInstance = AudioManager:PlayFMODSound_Sync(PlayStruct)
  if IsValid(VoiceActor) and VoiceActor.StartOral then
    local OralBaked = self:GetOralBaked(OralPath)
    VoiceActor:StartOral(VoiceName, OralBaked)
  end
  return SoundEventInstance
end

function FSoundOralComponent:PlaySoundWithTalk(AudioManager, VoiceName, ExStoryInfo, SnapShot)
  local AttachedActor = UE4.UGameplayStatics.GetPlayerController(AudioManager, 0)
  local RealEventPath, SelectKey = AudioManager:GetEventData(VoiceName, ExStoryInfo)
  local PlayStruct = FPlayFMODSoundStruct()
  PlayStruct.FMODEvent = AudioManager:GetFMODEventByPath_Sync(RealEventPath)
  PlayStruct.EventKey = Const.ReviewSoundKey
  PlayStruct.bStopWhenAttachedToDestoryed = true
  PlayStruct.bPlayAs2D = true
  PlayStruct.SelectKey = SelectKey
  PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, AttachedActor)
  local SoundEventInstance = AudioManager:PlayFMODSound_Sync(PlayStruct)
  if SnapShot then
    AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {
      voice_effect_type = Const.DialogueSnapShot[SnapShot]
    })
  else
    AudioManager:SetEventSoundParam(nil, Const.DialogueEffectSoundKey, {voice_effect_type = 0})
  end
  return SoundEventInstance
end

function FSoundOralComponent:GetOralBaked(OralBakedPath)
  local OralBaked = UE4.LoadObject(OralBakedPath)
  DebugPrint("TTT:GetOralBaked", OralBakedPath, OralBaked)
  return OralBaked
end

return {FSoundOralComponent = FSoundOralComponent}
