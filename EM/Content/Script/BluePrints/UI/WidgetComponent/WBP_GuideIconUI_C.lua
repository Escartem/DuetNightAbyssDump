local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitConfig(OwnerType, ImgPath, RenderSize)
  RenderSize = RenderSize or UE4.FVector2D(1, 1)
  self.OwnerType = OwnerType
  self.ImgPath = ImgPath
  local ImageResource = LoadObject(ImgPath)
  self.Image_Bg:SetBrushResourceObject(ImageResource)
end

function M:SetAccessibility(bNewAccessed)
  self:StopAllAnimations()
  if bNewAccessed then
    self:PlayAnimation(self.After_Reading)
  else
    self:PlayAnimation(self.Halo_in)
    self:PlayAnimation(self.Halo_loop, 0, 0)
  end
end

return M
