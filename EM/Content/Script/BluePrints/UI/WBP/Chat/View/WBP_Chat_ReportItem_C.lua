require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.WBP_Com_CheckBox_RightText.Btn_Click.OnClicked:Add(self, self.OnItemSelectionChanged)
end

function M:Destruct()
  self.WBP_Com_CheckBox_RightText.Btn_Click.OnClicked:Remove(self, self.OnItemSelectionChanged)
end

function M:OnListItemObjectSet(InObject)
  self.Text_ReportReason:SetText(GText(InObject.value))
  self.Owner = InObject.Owner
  self.Id = InObject.Id
  self.WBP_Com_CheckBox_RightText.Group_BG:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WBP_Com_CheckBox_RightText:HideGamepadBackground(true)
  self.WBP_Com_CheckBox_RightText:SetKey("Img", "A", nil)
  self.WBP_Com_CheckBox_RightText.Com_KeyImg:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnItemSelectionChanged()
  local CheckState = self.WBP_Com_CheckBox_RightText:IsChecked()
  DebugPrint(CheckState)
  self.Owner:OnChatItemChange(CheckState, self)
  return CheckState
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Owner:UpdateUIStyleInPlatform()
  self.WBP_Com_CheckBox_RightText.Btn_Click:SetNavigateMovingDurationTime(0.5)
  self.WBP_Com_CheckBox_RightText.Btn_Click:SetFocus()
  self.WBP_Com_CheckBox_RightText:PlayAnimation(self.WBP_Com_CheckBox_RightText.Normal)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
