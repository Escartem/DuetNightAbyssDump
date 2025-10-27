require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  local DamageTayeData = {}
  for k, v in pairs(DataMgr.Attribute) do
    if v.DisplayPriority then
      table.insert(DamageTayeData, k)
    end
  end
  table.sort(DamageTayeData, function(A, B)
    local PriorityA = DataMgr.Attribute[A].DisplayPriority
    local PriorityB = DataMgr.Attribute[B].DisplayPriority
    return PriorityA < PriorityB
  end)
  for index, value in ipairs(DamageTayeData) do
    local Item = self["WBP_Armory_AttrRestraintItem" .. "_" .. index]
    if Item then
      Item.Icon_Attr:SetBrushResourceObject(LoadObject(DataMgr.Attribute[value].Icon))
      Item.Text_AttrDesc:SetText(GText("UI_ElementDes_" .. value))
    end
  end
  self.Text_Explain:SetText(GText("UI_ElementDes_General"))
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.ScrollBox_Attribute:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.ScrollBox_Attribute:GetScrollOffsetOfEnd())
    self.ScrollBox_Attribute:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return M
