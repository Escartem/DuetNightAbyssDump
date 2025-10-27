local CameraControlClearNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function CameraControlClearNode:Init()
  self.Duration = 0
end

function CameraControlClearNode:Execute()
  local STLCameraControlInfo = _G.STLCameraControlInfo or {}
  _G.STLCameraControlInfo = nil
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if Player and Player.CameraControlComponent then
    local Controller = Player:GetController()
    if Controller and Controller.RemoveDisableRotationInputTag then
      Controller:RemoveDisableRotationInputTag("CameraControlNode")
    end
    if STLCameraControlInfo.CameraName then
      Player.CameraControlComponent:FixedCameraStateTransitionTimeOnce(self.Duration)
      Player.CameraControlComponent:PopCameraState(STLCameraControlInfo.CameraName)
    end
    if STLCameraControlInfo.FOV then
      Player.CameraControlComponent:PopFOVState()
    end
    local CameraComponent = Player.CharCameraComponent
    if CameraComponent then
      local PPSetting = CameraComponent.PostProcessSettings
      local OldPPInfo = STLCameraControlInfo.OldFocalDistanceInfo
      if OldPPInfo then
        PPSetting.bOverride_DepthOfFieldFocalDistance = OldPPInfo.bOverride_DepthOfFieldFocalDistance
        PPSetting.DepthOfFieldFocalDistance = OldPPInfo.DepthOfFieldFocalDistance
      end
      if PPSetting and STLCameraControlInfo.DynamicInstanceRef then
        STLCameraControlInfo.DynamicInstanceRef = nil
        CameraComponent:RemoveBlendable(STLCameraControlInfo.DynamicInstance)
      end
    end
  end
end

return CameraControlClearNode
