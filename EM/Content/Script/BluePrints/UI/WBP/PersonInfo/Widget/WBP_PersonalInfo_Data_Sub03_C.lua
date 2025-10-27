require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(ItemObject)
  if ItemObject.Des then
    self.Text_TitlePlayerData:SetText(GText(ItemObject.Des))
  end
  if ItemObject.Count then
    self.Text_PlayerDataNum:SetText(ItemObject.Count)
  end
  if 1 == ItemObject.Index then
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(2)
  elseif 0 == ItemObject.Index % 2 then
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(0)
  end
end

return M
