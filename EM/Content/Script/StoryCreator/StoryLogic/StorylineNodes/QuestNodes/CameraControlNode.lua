local CameraControlNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function CameraControlNode:Init()
  self.Duration = 0
  self.CameraName = ""
  self.LockRotate = false
  self.FocalLength = 0
  self.LensAperture = 0
  self.FOV = 0
  self.PPMaterialPath = ""
end

function CameraControlNode:Execute(Callback)
  DebugPrint("------------ CameraControlNode ------------------")
  local STLCameraControlInfo = {}
  _G.STLCameraControlInfo = STLCameraControlInfo
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if Player and Player.CameraControlComponent then
    Player.CameraControlComponent:PushCameraStateFromPreset(self.CameraName, self.Duration, 9999999)
    if self.FOV > 0 then
      Player.CameraControlComponent:InterpFOVByTime(self.FOV, self.Duration)
      STLCameraControlInfo.FOV = self.FOV
    end
    STLCameraControlInfo.CameraName = self.CameraName
    if self.LockRotate then
      local Controller = Player:GetController()
      if Controller and Controller.AddDisableRotationInputTag then
        Controller:AddDisableRotationInputTag("CameraControlNode")
      end
    end
    self.TimerHandle = GWorld.GameInstance:AddTimer(self.Duration, function()
      Callback()
    end)
    self:SetPPMaterial(Player.CharCameraComponent, self.PPMaterialPath, STLCameraControlInfo)
  else
    DebugPrint("Error:: CameraControlComponent Not Found")
    Callback()
  end
end

function CameraControlNode:SetPPMaterial(CameraComponent, PPMaterialPath, InOutInfo)
  if not IsValid(CameraComponent) then
    return
  end
  if not CameraComponent then
    DebugPrint("Error::CameraControlNode: CameraComponent is nil or not PlayerCamera")
    return
  end
  if self.FocalLength > 0 then
    InOutInfo.OldFocalDistanceInfo = {
      bOverride_DepthOfFieldFocalDistance = CameraComponent.PostProcessSettings.bOverride_DepthOfFieldFocalDistance,
      DepthOfFieldFocalDistance = CameraComponent.PostProcessSettings.DepthOfFieldFocalDistance
    }
    CameraComponent.PostProcessSettings.bOverride_DepthOfFieldFocalDistance = true
    CameraComponent.PostProcessSettings.DepthOfFieldFocalDistance = self.FocalLength
  end
  local Material
  if PPMaterialPath and "" ~= PPMaterialPath then
    Material = LoadObject(PPMaterialPath)
    if not Material then
      local Message = "\229\144\142\229\164\132\231\144\134\230\157\144\232\180\168\228\184\141\229\173\152\229\156\168\239\188\140\232\183\175\229\190\132\239\188\154" .. PPMaterialPath
      local Title = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185Error\239\188\154\229\144\142\229\164\132\231\144\134\230\157\144\232\180\168\228\184\141\229\173\152\229\156\168"
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, Title, Message)
      return
    end
  end
  local DynamicInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, Material)
  if not DynamicInstance then
    return
  end
  InOutInfo.DynamicInstanceRef = Ref(DynamicInstance)
  InOutInfo.DynamicInstance = DynamicInstance
  CameraComponent:AddOrUpdateBlendable(DynamicInstance, 1)
end

function CameraControlNode:Clear()
  if self.TimerHandle then
    GWorld.GameInstance:RemoveTimer(self.TimerHandle)
  end
  self.TimerHandle = nil
end

return CameraControlNode
