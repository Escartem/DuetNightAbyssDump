require("UnLua")
local BP_AudioManager_C = Class({
  "BluePrints.Common.TimerMgr"
})
BP_AudioManager_C._components = {
  "BluePrints.Managers.AudioManagerComponent.AnimationNotifyLogic",
  "BluePrints.Managers.AudioManagerComponent.BGMManagerComponent",
  "BluePrints.Managers.AudioManagerComponent.SoundBankManagerComponent",
  "BluePrints.Managers.AudioManagerComponent.ReverbLogic",
  "BluePrints.Managers.AudioManagerComponent.SaveAndRecoverDataComponent"
}

function BP_AudioManager_C:Initialize(Initializer)
  self.OpenAsync = Const.PlaySoundAsync
  self.TestAsyncObjectDestroy = false
  self.TestRegionId = -1
end

function BP_AudioManager_C:RecoverSavedData()
  if IsDedicatedServer(self) then
    return
  end
  self:RecoverVolumeData()
  self:ReadSeGlobalParameters()
  self.bOpenSoundIDOpt = true
  self.bOpenMonsterLimit = true
  self:BindEnterforegroundDelegate()
end

function BP_AudioManager_C:PlayFMODSoundByID(WorldContext, SoundID, LogicEventPlayer, FollowedSocketName, ExtraParams)
  local PlayExtraParams = FInPlayExtraParams()
  if ExtraParams then
    if ExtraParams.MeleeHitLevel then
      PlayExtraParams.MeleeHitLevel = ExtraParams.MeleeHitLevel
    end
    if ExtraParams.SaveLocation then
      PlayExtraParams.SaveLocation = CommonUtils.TableToVector(ExtraParams.SaveLocation)
    end
    if ExtraParams.KeyValueGroups then
      for i, v in pairs(ExtraParams.KeyValueGroups) do
        PlayExtraParams.KeyValueGroups:Add(i, v)
      end
    end
    if ExtraParams.IsCrit then
      PlayExtraParams.IsCrit = ExtraParams.IsCrit
    end
    if ExtraParams.IsDead then
      PlayExtraParams.IsDead = ExtraParams.IsDead
    end
    if ExtraParams.bFollowSocket then
      PlayExtraParams.bFollowSocket = ExtraParams.bFollowSocket
    end
    if ExtraParams.EventKey then
      PlayExtraParams.EventKey = ExtraParams.EventKey
    end
    if ExtraParams.bPlayAs2D then
      PlayExtraParams.bPlayAs2D = ExtraParams.bPlayAs2D
    end
  end
  self:PlayFMODSoundByID_CPP(WorldContext, SoundID, LogicEventPlayer, FollowedSocketName, PlayExtraParams)
end

function BP_AudioManager_C:PlaySeByIdGetExtraParams(LogicEventPlayer)
  local PlayExtraParams = FInPlayExtraParams()
  if LogicEventPlayer.HitedMaterial then
    PlayExtraParams.KeyValueGroups:Add("Material", LogicEventPlayer.HitedMaterial)
  end
  PlayExtraParams.SaveLocation = LogicEventPlayer.OverlapLocation or LogicEventPlayer:GetSaveLoc("")
end

function BP_AudioManager_C:Test()
end

function BP_AudioManager_C:Test2(Event)
  DebugPrint("Error: HYY AudioManager Test3 RealEvent Loaded, SelectKey is", self.SelectKey)
  local PlayStruct = FPlayFMODSoundStruct()
  PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, self.Player)
  PlayStruct.FMODEvent = Event
  PlayStruct.EventKey = Const.TalkSoundKey
  PlayStruct.bStopWhenAttachedToDestoryed = true
  PlayStruct.SelectKey = self.SelectKey
  self.TestEventInstance = self:PlayFMODSound_Sync(PlayStruct)
  self:AddTimer(0.01, function()
    local TimelinePos = self:GetEventInstanceTimelinePosition(self.TestEventInstance)
    DebugPrint("Error: HYY AudioManager Test2", TimelinePos, self:GetEventInstanceLength(self.TestEventInstance))
    if 0 == TimelinePos then
      self:RemoveTimer("HYYTest")
    end
  end, true, 0.1, "HYYTest")
end

function BP_AudioManager_C:HYYDrawDebug(PointLocation)
  UE4.UKismetSystemLibrary.DrawDebugPoint(self, PointLocation, 10, UE4.FLinearColor(0, 1, 0, 1), 5)
end

function BP_AudioManager_C:SetEventSoundParam(Object, Key, KeyValueGroups)
  if not KeyValueGroups then
    return
  end
  local KeyValueGroupsMap = TMap("", 0.0)
  for key, value in pairs(KeyValueGroups) do
    KeyValueGroupsMap:Add(key, value)
  end
  self:SetEventSoundParam_CPP(Object, Key, KeyValueGroupsMap)
end

function BP_AudioManager_C:GetGender(IsEXGender)
  local Avatar = GWorld:GetAvatar()
  if true == IsEXGender then
    if not Avatar or 0 == Avatar.WeitaSex then
      return "_m"
    elseif 1 == Avatar.WeitaSex then
      return "_f"
    end
  elseif not Avatar or 1 == Avatar.Sex then
    return "_f"
  elseif 0 == Avatar.Sex then
    return "_m"
  end
end

function BP_AudioManager_C:SetEventInstanceParamWithId(EventInstance, SoundConditionId, Source, Target)
  local SoundCondition = DataMgr.SoundCondition[SoundConditionId]
  if SoundCondition.Params then
    for name, value in pairs(SoundCondition.Params) do
      if self[name] then
        self[name] = value
      end
    end
  end
  if SoundCondition.FuncName and self[SoundCondition.FuncName] then
    self[SoundCondition.FuncName](self, EventInstance, Source, Target)
  else
    print(_G.LogTag, "Warning: AudioManger not find Valid SoundCondition Function", SoundConditionId)
  end
end

local function GetMapLength(Map)
  local count = 0
  if not Map then
    return count
  end
  for i, v in pairs(Map) do
    count = count + 1
  end
  return count
end

function BP_AudioManager_C:PlayItemSound(Context, ItemId, Behavior, TableName)
  local Data = TableName and DataMgr[TableName]
  if Data and Data[ItemId] then
    local Sound = Data[ItemId].Sound
    local ItemSoundData = DataMgr.ItemSound[Sound]
    local SoundPath = ItemSoundData and ItemSoundData[(Behavior or "") .. "Sound"]
    if SoundPath then
      self:PlayUISound(Context, SoundPath, nil, nil)
    end
  end
end

function BP_AudioManager_C:ReadCommonConstDropSeConfig()
  for Index, SePath in pairs(CommonConst.DropProjectileSe) do
    self.DropProjectileSeMap:Add(Index, SePath)
  end
  for Index, SePath in pairs(CommonConst.DropIdleSe) do
    self.DropIdleSeMap:Add(Index, SePath)
  end
  for Index, SePath in pairs(CommonConst.DropFlyingSe) do
    self.DropFlyingSeMap:Add(Index, SePath)
  end
  for Index, SePath in pairs(CommonConst.DropPickupSe) do
    self.DropPickupSeMap:Add(Index, SePath)
  end
end

function BP_AudioManager_C:GetCannotAsyncEventPath()
  self.CannotAsyncLoadEventPaths = CommonConst.CannotAsyncEventPath
end

function BP_AudioManager_C:GetNoNeedCacheEventPath()
  self.NoNeedCacheEventPaths = CommonConst.NoNeedCacheEventPath
end

function BP_AudioManager_C:GetNeedStoreSTLBGM()
  return Const.NeedStoreSTLBGM
end

function BP_AudioManager_C:GetCurrentRegionId()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    DebugPrint("LogEMAudioManager Avatr CurrentRegionId is", Avatar.CurrentRegionId)
    return Avatar.CurrentRegionId
  end
  DebugPrint("LogEMAudioManager Test CurrentRegionId is", self.TestRegionId)
  return self.TestRegionId
end

function BP_AudioManager_C:OnPlayerSwitchScene()
  AudioManager(self):SetVoiceLanguage(CommonConst.SystemVoice)
  UFMODBlueprintStatics.LoadExtraBanks()
  self.Overridden.OnPlayerSwitchScene(self)
end

function BP_AudioManager_C:GetAvatarCustomBGMEventId()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  return Avatar.HomeBaseBGM
end

function BP_AudioManager_C:GetFootstepFXSlowSpeed_Lua()
  return Const.FootstepFXSlowSpeed
end

AssembleComponents(BP_AudioManager_C)
return BP_AudioManager_C
