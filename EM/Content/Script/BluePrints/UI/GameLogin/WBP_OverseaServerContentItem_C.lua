require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  if not Content then
    DebugPrint("Content is nil, cannot set list item object.")
    return
  end
  if not Content.ServerInfo then
    DebugPrint("ServerInfo is nil, cannot set list item object.")
    return
  end
  self.Content.CurrentEntry = self
  self.Text_Sever:SetText(GText(Content.ServerInfo.area))
  if self.Content.bRecommand then
    self.Group_Recommend:SetVisibility(ESlateVisibility.Visible)
    self.Text_Recommend:SetText(GText("UI_Server_Recommend"))
  end
  if Content.Avatar then
    self.Group_Level:SetVisibility(ESlateVisibility.Visible)
    self.Text_Level:SetText(tostring(Content.Avatar.AvatarInfo.Level))
  end
  if not self.Btn_Click.OnCheckStateChanged:IsBound() then
    self.Btn_Click.OnCheckStateChanged:Add(self, self.OnSelected)
    self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  end
  if Content.bSelected then
    self.Btn_Click:SetChecked(true)
  end
end

function M:OnHovered()
  if UIUtils.UtilsGetCurrentInputType() ~= UE4.ECommonInputType.Gamepad then
    return
  end
  self:SetSelected(true)
end

function M:OnSelected(bIsChecked)
  if not self.Content then
    DebugPrint("Content is nil, cannot clear list item object.")
    return
  end
  self.Content.bSelected = bIsChecked
  if bIsChecked then
    self.Content.Parent:OnSelected(self.Content)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
  end
  self:SetVisibility(bIsChecked and ESlateVisibility.HitTestInvisible or ESlateVisibility.Visible)
  self:SetFocus(bIsChecked)
end

function M:SetSelected(bIsChecked)
  self.Btn_Click:SetChecked(bIsChecked)
end

return M
