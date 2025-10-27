require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self:InitItemContent()
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:InitItemContent()
  if self.Content.IsEmpty then
    self.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  local IconObj = LoadObject(string.format("Texture2D'%s'", self.Content.Icon))
  self.Img_Event:SetBrushFromTexture(IconObj)
  self.Text_Event:SetText(GText(self.Content.Des))
end

return M
