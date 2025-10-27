require("UnLua")
local WBP_GM_Item_Tab_C = Class("BluePrints.UI.GMInterface.WBP_GM_Item_Base_C")

function WBP_GM_Item_Tab_C:SetItem()
  self.Super.SetItem(self)
  self:SetStyle(self.Command.IsEnable)
end

function WBP_GM_Item_Tab_C:Exec()
  self.Super.Exec(self)
end

function WBP_GM_Item_Tab_C:OnMouseButtonDown(MyGeometry, InKeyEvent)
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.LeftMouseButton) or UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.RightMouseButton) then
    UIUtils.PlayCommonBtnSe(self)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

return WBP_GM_Item_Tab_C
