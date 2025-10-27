require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Lv_Now:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.Text_Lv_Preview:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.HB_Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Init(Text, Lv)
  self.Text_Info:SetText(Text)
  self.Num_Level_Now:SetText(Lv)
  self:ShowPreview(false)
end

function M:ShowPreview(bShow, Lv)
  if bShow then
    self.HB_Preview:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Num_Level_Preview:SetText(Lv)
  else
    self.HB_Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
