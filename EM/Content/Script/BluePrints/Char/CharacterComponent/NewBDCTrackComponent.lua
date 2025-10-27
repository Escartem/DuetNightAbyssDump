local CommonUtils = require("Utils.CommonUtils")
local TimeUtils = require("Utils.TimeUtils")
local Component = {}

function Component:BuildCommonTrackInfo(PlayerAvatar)
  local TrackInfo = {}
  TrackInfo.bones_id = self.InfoForInit.RoleId
  TrackInfo.map_id = WorldTravelSubsystem():GetCurrentSceneId()
  TrackInfo.Position = tostring(self:K2_GetActorLocation())
  return TrackInfo
end

function Component:TickBigWorldPathInfo()
  if not self.bIsInBigWorld then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if not self.UploadBDCTrackInfo.BigWorldPathInfo then
      self.UploadBDCTrackInfo.BigWorldPathInfo = {}
    end
    table.insert(self.UploadBDCTrackInfo.BigWorldPathInfo, {
      map_id = Avatar.CurrentRegionId,
      position = tostring(self:K2_GetActorLocation()),
      trigger_time = TimeUtils.NowTime()
    })
  end
end

function Component:TrackJumpCountInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  if not self.UploadBDCTrackInfo.JumpCount then
    self.UploadBDCTrackInfo.JumpCount = 0
  end
  self.UploadBDCTrackInfo.JumpCount = self.UploadBDCTrackInfo.JumpCount + 1
end

function Component:TrackJumpSecondCountInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  if not self.UploadBDCTrackInfo.JumpSecondCount then
    self.UploadBDCTrackInfo.JumpSecondCount = 0
  end
  self.UploadBDCTrackInfo.JumpSecondCount = self.UploadBDCTrackInfo.JumpSecondCount + 1
end

function Component:TrackJumpWallCountInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  if not self.UploadBDCTrackInfo.JumpWallCount then
    self.UploadBDCTrackInfo.JumpWallCount = 0
  end
  self.UploadBDCTrackInfo.JumpWallCount = self.UploadBDCTrackInfo.JumpWallCount + 1
end

function Component:TrackDefeatedCountInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  if not self.UploadBDCTrackInfo.DefeatedCountInfo then
    self.UploadBDCTrackInfo.DefeatedCountInfo = self:BuildCommonTrackInfo(PlayerAvatar)
    self.UploadBDCTrackInfo.DefeatedCountInfo.defeated_count = 0
  end
  self.UploadBDCTrackInfo.DefeatedCountInfo.defeated_count = self.UploadBDCTrackInfo.DefeatedCountInfo.defeated_count + 1
end

function Component:TrackDeadInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  if not self.UploadBDCTrackInfo.DeadCount then
    self.UploadBDCTrackInfo.DeadCount = 0
  end
  self.UploadBDCTrackInfo.DeadCount = self.UploadBDCTrackInfo.DeadCount + 1
end

function Component:TrackRecoverInfo()
  if not self.UploadBDCTrackInfo then
    return
  end
  if not self:IsMainPlayer() then
    return
  end
  if not self.UploadBDCTrackInfo.RecoveryCount then
    self.UploadBDCTrackInfo.RecoveryCount = 0
  end
  self.UploadBDCTrackInfo.RecoveryCount = self.UploadBDCTrackInfo.RecoveryCount + 1
end

function Component:TrackSkipTalkInfo(TalkTaskData)
  if not self.UploadBDCTrackInfo then
    return
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local NewTrack = self:BuildCommonTrackInfo(PlayerAvatar)
  NewTrack.role_Level = PlayerAvatar.Level
  NewTrack.char_id = PlayerAvatar:GetCurrentCharConfigID()
  NewTrack.talk_path = TalkTaskData.FilePath
  NewTrack.talk_name = TalkTaskData.TalkName
  NewTrack.talk_type = TalkTaskData.TalkType
  NewTrack.talk_id = TalkTaskData.Key
  NewTrack.dialogue_id = TalkTaskData.FirstDialogueId
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("skip_talk", NewTrack)
end

function Component:TraceBDCUploadInfo(EventName, Properties)
  if not self.NewUploadBDCTrackInfo then
    self.NewUploadBDCTrackInfo = {}
  end
  if not self.NewUploadBDCTrackInfo[EventName] then
    self.NewUploadBDCTrackInfo[EventName] = {}
  end
  table.insert(self.NewUploadBDCTrackInfo[EventName], Properties)
end

return Component
