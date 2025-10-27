require("UnLua")
local WBP_ServerListItem_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_ServerListItem_C:SetItem(HostId, Area, Name, IP, Port)
  self.Text_ID:SetText(HostId)
  self.Text_Name:SetText(Name)
end

function WBP_ServerListItem_C:OnMouseButtonDown(MyGeometry, InKeyEvent)
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.LeftMouseButton) or UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.RightMouseButton) then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

return WBP_ServerListItem_C
