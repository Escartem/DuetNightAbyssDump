require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn.OnClicked:Add(self, self.OnLabelClicked)
  self.Btn.OnHovered:Add(self, self.OnButtonHovered)
  self.Btn.OnUnhovered:Add(self, self.OnButtonUnhovered)
  self.Btn.OnPressed:Add(self, self.OnButtonPressed)
  self.Btn.OnReleased:Add(self, self.OnButtonReleased)
end

function M:OnListItemObjectSet(InObject)
  if not InObject then
    return
  end
  self.Index = InObject.Index - 1
  self.TargetData = InObject.TargetData
  self.Owner = InObject.Owner
  self.Text_label:SetText(GText(self.TargetData.EntryTitle))
end

function M:OnLabelClicked()
  if self.Click then
    self:PlayAnimation(self.Click)
  end
  if self.Owner then
    self.Owner:OnAssociatedEntryClicked(self.TargetData)
  end
end

function M:OnButtonHovered()
  if self.Hover then
    self:PlayAnimation(self.Hover)
  end
end

function M:OnButtonUnhovered()
  if self.UnHover then
    self:PlayAnimation(self.UnHover)
  end
end

function M:OnButtonPressed()
  if self.Press then
    self:PlayAnimation(self.Press)
  end
end

function M:OnButtonReleased()
  if self.Normal then
    self:PlayAnimation(self.Normal)
  end
end

function M:Destruct()
  self.Btn.OnClicked:Remove(self, self.OnLabelClicked)
  self.Btn.OnHovered:Remove(self, self.OnButtonHovered)
  self.Btn.OnUnhovered:Remove(self, self.OnButtonUnhovered)
  self.Btn.OnPressed:Remove(self, self.OnButtonPressed)
  self.Btn.OnReleased:Remove(self, self.OnButtonReleased)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self:InitNavigationRules()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:InitNavigationRules()
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.SetLeftTarget
  })
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.SetRightTarget
  })
end

function M:SetLeftTarget()
  if self.Index <= 0 then
    return self.Owner.CurrentSelectedCell
  else
    local ListItemWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_Label, self.Index - 1)
    if ListItemWidget then
      return ListItemWidget
    end
  end
end

function M:SetRightTarget()
  local ListItemWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_Label, self.Index + 1)
  if ListItemWidget then
    return ListItemWidget
  end
  return nil
end

return M
