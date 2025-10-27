require("UnLua")
local WBP_DropIconUI_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_DropIconUI_C:Initialize(Initializer)
  self.OwnerType = nil
  self.ImgPath = nil
end

function WBP_DropIconUI_C:InitConfig(OwnerType, ImgPath, RenderSize, IconColor)
  RenderSize = RenderSize or UE4.FVector2D(1, 1)
  self.OwnerType = OwnerType
  self.ImgPath = ImgPath
  local ImageResource = LoadObject(ImgPath)
  self.Image_Bg:SetBrushResourceObject(ImageResource)
  self.Image_Bg:SetColorAndOpacity(IconColor)
  self.Image_Bg:SetRenderScale(RenderSize)
end

return WBP_DropIconUI_C
