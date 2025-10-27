require("UnLua")
local WBP_Rouge_SettleEvent_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_SettleEvent_C:InitInfo(EventItemData)
  local IconPath = EventItemData.SettlementEventMainIcon
  self:SetIcon(IconPath)
end

function WBP_Rouge_SettleEvent_C:SetIcon(IconPath)
  if not IconPath then
    return
  end
  local Material = self.Img_Icon:GetDynamicMaterial()
  Material:SetTextureParameterValue("IconMap", LoadObject(IconPath))
end

function WBP_Rouge_SettleEvent_C:OnAddedToFocusPath(InFocusEvent)
  EventManager:FireEvent(EventID.OnRougeSettlementBoxItemFocused, self, "Event")
end

return WBP_Rouge_SettleEvent_C
