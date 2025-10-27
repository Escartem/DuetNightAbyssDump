require("UnLua")
local WBP_Dungeon_DestroyTarget_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Dungeon_DestroyTarget_C:OnLoaded()
end

function WBP_Dungeon_DestroyTarget_C:SetImageAndText(ImageType, Text)
  if "A" == ImageType then
    self.Img_Letter:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_A.T_Gp_DestroyTarget_A"))
  elseif "B" == ImageType then
    self.Img_Letter:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_B.T_Gp_DestroyTarget_B"))
  elseif "C" == ImageType then
    self.Img_Letter:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_C.T_Gp_DestroyTarget_C"))
  end
  self.Text_Describe:SetText(GText(Text))
end

return WBP_Dungeon_DestroyTarget_C
