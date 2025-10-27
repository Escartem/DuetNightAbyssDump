require("UnLua")
local M = Class()

function M:Initialize(Initializer)
  self.ViewCamera = false
  local CameraData = DataMgr.BattleCamera
  self.CameraPitchLimitMin = tonumber(CameraData.CameraPitchLimitMin.ParamentValue[1])
  self.CameraPitchLimitMax = tonumber(CameraData.CameraPitchLimitMax.ParamentValue[1])
end

function M:ReceiveBeginPlay()
  self.OwnerPlayer = self:GetOwner()
  local Controller = self.OwnerPlayer:GetController()
  if Controller then
    self.CameraManager = Controller.PlayerCameraManager
  end
  self:ModifyViewPitch(self.CameraPitchLimitMin, self.CameraPitchLimitMax)
  self.Overridden.ReceiveBeginPlay(self)
  self:OnCharacterTagChanged("", self.OwnerPlayer and self.OwnerPlayer:GetCharacterTag())
end

function M:CanBeControlledByTick()
  return not self:HasRunningCameraState() and not self.OwnerPlayer.IsSpawnedByMovieCaptureSequence
end

function M:ModifyViewPitch(MinViewPitch, MaxViewPitch)
  if not self.CameraManager then
    return
  end
  self.CameraManager.ViewPitchMin = math.max(MinViewPitch, self.CameraPitchLimitMin)
  self.CameraManager.ViewPitchMax = math.min(MaxViewPitch, self.CameraPitchLimitMax)
end

return M
