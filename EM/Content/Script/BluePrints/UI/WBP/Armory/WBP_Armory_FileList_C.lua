require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Params)
  self.Parent = Params.Parent
  self.Title = Params.Title
  self:InitUIInfo()
end

function M:InitUIInfo()
  self.Text_List:SetText(self.Title)
  self.VB_Content:ClearChildren()
end

function M:AddToContentList(ListItem)
  self.VB_Content:AddChild(ListItem)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self:InitNavigationRules()
  local ChildrenCount = self.VB_Content:GetChildrenCount()
  if ChildrenCount > 0 then
    local FirstItem = self.VB_Content:GetChildAt(0)
    if FirstItem then
      FirstItem:SetFocus()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:InitNavigationRules()
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
end

return M
