require("UnLua")
local WBP_Prologue_Retreat_Role_C = Class()

function WBP_Prologue_Retreat_Role_C:SetItem(Content)
  local CharData = DataMgr.Char[Content.CharId]
  if CharData and CharData.RegainCharItemId and DataMgr.Resource[CharData.RegainCharItemId] then
    local IconPath = DataMgr.Resource[CharData.RegainCharItemId].Icon
    if IconPath then
      local IconObj = LoadObject("/Game/" .. IconPath)
      self.Img_Player:SetBrushResourceObject(IconObj)
      return
    end
  end
  print(_G.LogTag, "ERROR: Icon not exit!")
end

return WBP_Prologue_Retreat_Role_C
