require("UnLua")
local WBP_Common_Dialog_Text03_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_Text03_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  if not Params then
    return
  end
  self.List:ClearListItems()
  for _, Item in ipairs(Params.Text03_ListView) do
    local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
    for key, value in pairs(Item) do
      ItemContent[key] = value
    end
    self.List:AddItem(ItemContent)
  end
  self.List:RequestRefresh()
  self.List.bIsFocusable = false
  self.bIsDealWithVirtualAccept = true
end

function WBP_Common_Dialog_Text03_PC_C:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    self.List:SetScrollOffset(self.List:GetScrollOffset() + DeltaOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return WBP_Common_Dialog_Text03_PC_C
