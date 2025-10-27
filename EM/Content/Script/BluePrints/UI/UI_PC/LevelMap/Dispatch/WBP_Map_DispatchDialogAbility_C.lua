require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
local AbilityTable = {
  "Battle",
  "Collect",
  "Mine",
  "Fish",
  "Pet",
  "Benefit",
  "Morality",
  "Wisdom",
  "Empathy",
  "Chaos",
  "Workaholic",
  "Rigorous",
  "Skilled",
  "Lucky"
}

function M:Construct()
  M.Super.Construct(self)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.List_Ability:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
    self.List_Ability:SetControlScrollbarInside(true)
  end
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local DispatchInfo = DataMgr.CharDispatchTag
  for _, Type in pairs(AbilityTable) do
    local Info = DataMgr.CharDispatchTag[Type]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Info = Info
    self.List_Ability:AddItem(Content)
  end
  self.List_Ability:SetFocus()
  self:ShowGamepadScrollBtn(true)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.MaxListScrollOffset then
    self.MaxListScrollOffset = UIUtils.GetMaxScrollOffsetOfListView(self.List_Ability)
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.5
  if math.abs(AddOffset) < 0.01 then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.List_Ability:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.MaxListScrollOffset)
    self.List_Ability:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:InitGamepadView()
  self:SetFocus()
end

return M
