require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self:UnbindAllFromAnimationFinished(self.Change)
  self:BindToAnimationFinished(self.Change, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Change)
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  player:AddDisableInputTag("RougeTransition")
end

function M:OnLoaded(SceneCaptureComponent, RenderTexture, IsBossRoom)
  if IsBossRoom then
    local material = self.BG01:GetDynamicMaterial()
    material:SetTextureParameterValue("MainTex", RenderTexture)
    local material = self.Bg02_Add:GetDynamicMaterial()
    material:SetTextureParameterValue("MainTex", RenderTexture)
    local material = self.Bg03:GetDynamicMaterial()
    material:SetTextureParameterValue("MainTex", RenderTexture)
    local material = self.Bg04_Add:GetDynamicMaterial()
    material:SetTextureParameterValue("MainTex", RenderTexture)
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_trans_boss", nil, nil)
  else
    local material = self.Bg:GetDynamicMaterial()
    material:SetTextureParameterValue("Pic01", RenderTexture)
    material:SetTextureParameterValue("Pic02", RenderTexture)
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_trans_normal", nil, nil)
  end
  self.SceneCaptureComponent = SceneCaptureComponent
  self.SceneCaptureComponent.bCaptureEveryFrame = false
  self.SceneCaptureComponent:CaptureScene()
end

function M:OnChange()
  self.SceneCaptureComponent:SetComponentTickEnabled(true)
  self.SceneCaptureComponent.bCaptureEveryFrame = true
end

function M:Destruct()
  self.SceneCaptureComponent:SetComponentTickEnabled(false)
  self.SceneCaptureComponent.bCaptureEveryFrame = false
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  player:RemoveDisableInputTag("RougeTransition")
end

function M:Close()
  local RougeLikeManager = GWorld.RougeLikeManager
  if RougeLikeManager then
    RougeLikeManager:ShowEnterRoomToast()
  end
  M.Super.Close(self)
end

return M
