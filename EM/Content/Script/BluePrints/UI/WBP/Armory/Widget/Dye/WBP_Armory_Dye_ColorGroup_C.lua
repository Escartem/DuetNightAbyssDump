require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  rawset(self, "ColorLumps", {
    self.ColorLump_1,
    self.ColorLump_2,
    self.ColorLump_3
  })
  self.Icon_Dye.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  EventManager:AddEvent(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
end

function M:OnResourcesChanged(ResourceId)
  if self.ResourceId == ResourceId then
    local Avatar = GWorld:GetAvatar()
    local Resource = Avatar.Resources[ResourceId]
    if Resource then
      self.Num_Hold:SetText(Resource.Count)
    else
      self.Num_Hold:SetText(0)
    end
  end
end

function M:OnMenuOpenChanged(IsOpen)
  if self._OnMenuOpenChanged then
    self._OnMenuOpenChanged(self.Owner, IsOpen, self.Content)
  end
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnResourcesChanged, self)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.Widget = self
  self.Owner = Content.Owner
  self._OnResourceAddedToFocusPath = Content.OnResourceAddedToFocusPath
  self._OnResourceRemovedFromFocusPath = Content.OnResourceRemovedFromFocusPath
  self._OnMenuOpenChanged = Content.OnMenuOpenChanged
  local ColorContents = Content.OnlyShowColor or Content.ColorContents or {}
  if not ColorContents[1] then
    return
  end
  for i, Widget in ipairs(self.ColorLumps) do
    if ColorContents[i] then
      Widget:OnListItemObjectSet(ColorContents[i])
      Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      Widget:SetVisibility(UIConst.VisibilityOp.Hidden)
    end
  end
  local Data = DataMgr.Swatch[ColorContents[1].ColorId]
  local ResourceData = Data and DataMgr.Resource[Data.ResourceID]
  self.ResourceId = Data and Data.ResourceID
  self.Icon_Dye:Init({
    ParentWidget = self,
    ItemType = CommonConst.ItemType.Resource,
    Id = self.ResourceId,
    Icon = ResourceData and ResourceData.Icon,
    IsShowDetails = true,
    HandleMouseDown = true,
    OnAddedToFocusPathEvent = self.OnResourceAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnResourceRemovedFromFocusPath
  })
  local Avatar = GWorld:GetAvatar()
  local Resource = Avatar.Resources[Data.ResourceID]
  if Resource then
    self.Num_Hold:SetText(Resource.Count)
  else
    self.Num_Hold:SetText(0)
  end
  if self.Content.bPreviewMode then
    self.Panel_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitNavigationRules()
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:InitNavigationRules()
  for index, value in ipairs(self.ColorLumps) do
    value:SetNavigationRuleCustom(EUINavigation.Up, self.Content.ColorContents[index].OnNavigateUp)
    value:SetNavigationRuleCustom(EUINavigation.Down, self.Content.ColorContents[index].OnNavigateDown)
    local NextWidget = self.ColorLumps[index + 1]
    if NextWidget and NextWidget:IsVisible() then
      value:SetNavigationRuleExplicit(EUINavigation.Right, NextWidget)
    else
      value:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Escape)
    end
  end
  self.Icon_Dye:SetNavigationRuleCustom(EUINavigation.Up, self.Content.OnResourceNavigateUp)
  self.Icon_Dye:SetNavigationRuleCustom(EUINavigation.Down, self.Content.OnResourceNavigateDown)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:GetDesiredFocusTarget())
end

function M:GetDesiredFocusTarget()
  if not self.Content or not self.Content.CurrentFocusWidgetIdx then
    return self.ColorLumps[1]
  end
  local Widget = self.ColorLumps[self.Content.CurrentFocusWidgetIdx]
  if Widget and Widget:IsVisible() then
    return Widget
  end
  return self.Icon_Dye
end

function M:OnResourceAddedToFocusPath()
  self.Content.CurrentFocusWidgetIdx = 0
  if self._OnResourceAddedToFocusPath then
    self._OnResourceAddedToFocusPath(self.Owner, self.Icon_Dye)
  end
end

function M:OnResourceRemovedFromFocusPath()
  if self._OnResourceRemovedFromFocusPath then
    self._OnResourceRemovedFromFocusPath(self.Owner, self.Icon_Dye)
  end
end

return M
