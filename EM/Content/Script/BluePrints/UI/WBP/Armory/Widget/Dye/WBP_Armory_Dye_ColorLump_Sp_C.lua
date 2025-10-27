require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.Widget.Dye.WBP_Armory_Dye_ColorLump_C"
})

function M:SetColor(Content)
  local Data = DataMgr.SpecialSwatch[Content.ColorId]
  if Data then
    self.Color_Lump_Sp:SetBrushResourceObject(LoadObject(Data.MaterialPath))
  else
    self.Color_Lump_Sp:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/Btn_Mosaic.Btn_Mosaic"))
  end
end

return M
