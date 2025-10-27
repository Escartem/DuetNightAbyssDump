require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.IsNew = Content.IsNew
  self.IsUnlocked = Content.IsUnlocked
  self.Index = Content.Index
  self.Data = Content.Data
  self.Parent = Content.Parent
  self.ItemId = Content.ItemId
  self.UnlockNum = Content.UnlockNum
  self.TotalNum = Content.TotalNum
  self.SubItems = Content.SubItems
  self.IsSelected = self.Parent.CurSelectIndex == self.Index
  self:InitStoryItem()
  self:InitSubItems()
end

function M:InitStoryItem()
  local SeriesName = self.Data.Data.SeriesName
  if self.IsUnlocked then
    self.WS_Select:SetActiveWidgetIndex(0)
    self.Text_Title:SetText(GText(SeriesName))
  else
    self.WS_Select:SetActiveWidgetIndex(1)
    self.Text_Title:SetText(GText("RLArchive_UnlockEntry"))
  end
  local FormattedNum = string.format("%03d", self.Index + 1)
  local IndexString = string.format(GText("RLArchive_ID"), FormattedNum)
  self.Text_TitleNum:SetText(IndexString)
  if self.UnlockNum == self.TotalNum then
    self.Text_TitleIndex:SetColorAndOpacity(self.Finish)
  end
  self.Text_TitleIndex:SetText("(" .. self.UnlockNum .. "/" .. self.TotalNum .. ")")
  if self.IsNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.IsUnlocked then
    if self.IsSelected then
      self.Parent:ChooseSeries(self.Index, self)
      self:PlayAnimation(self.Click)
      self:PlayAnimation(self.List_In)
      self.List_SubItem:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self:PlayAnimation(self.Normal)
      self:PlayAnimation(self.List_Out)
      self.List_SubItem:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_TitleIndex:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.Forbidden)
    self.Text_TitleIndex:SetVisibility(ESlateVisibility.Collapsed)
    self.List_SubItem:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitSubItems()
  self.List_SubItem:ClearListItems()
  self.LastChooseItem = nil
  if not self.SubItems then
    return
  end
  local FirstIndex
  for Index, Data in ipairs(self.SubItems) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.StoryId = Data.StoryId
    Obj.IsUnlocked = Data.IsUnlocked
    Obj.IsNew = Data.IsNew
    Obj.Name = Data.Name
    Obj.Data = Data.Data
    Obj.Index = Index - 1
    Obj.Parent = self
    Obj.GreatParent = self.Parent
    self.List_SubItem:AddItem(Obj)
    if not FirstIndex and Data.IsUnlocked and self.IsSelected then
      FirstIndex = Index
      Obj.IsSelected = true
    end
  end
end

function M:ChooseItem(Index, SubItem)
  if self.LastChooseItem then
    self.LastChooseItem:OnSubItemLoseSelection()
  end
  self.LastChooseItem = SubItem
  self.List_SubItem:SetSelectedIndex(Index)
end

function M:OnCellClicked()
  if self.Parent.CurSelectIndex ~= self.Index then
    local FirstIndex
    for _, Obj in pairs(self.List_SubItem:GetListItems()) do
      if not FirstIndex and Obj.IsUnlocked then
        FirstIndex = Obj.Index
      end
    end
    self.Parent:ChooseSeries(self.Index, self)
    if FirstIndex then
      local SubItem = self.List_SubItem:GetItemAt(FirstIndex)
      SubItem.IsSelected = true
      if SubItem.UI then
        SubItem.UI:PlayAnimation(SubItem.UI.Click)
        SubItem.UI:PlayAnimation(SubItem.UI.Select)
        self:ChooseItem(FirstIndex, SubItem.UI)
        self.Parent:ChooseItem(SubItem.UI)
      end
    elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self:AddDelayFrameFunc(function()
        self.Btn_Click:SetFocus()
      end, 4)
    end
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/spectrum_click", nil, nil)
  self:PlayAnimation(self.Click)
  if not self.IsUnlocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("RLArchive_StoryUnlock"))
    return
  end
  if self.IsNew then
    self.IsNew = false
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.IsSelected then
    self:StopAnimation(self.List_Out)
    self:PlayAnimation(self.List_In)
    self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Down, self.List_SubItem)
    self.List_SubItem:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.IsSelected = true
  else
    self:PlayAnimation(self.Normal)
    if self.Parent.List_Item:GetItemAt(self.Index + 1) then
      self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Down, self.Parent.List_Item:GetItemAt(self.Index + 1).UI.Btn_Click)
    end
    self:StopAnimation(self.List_In)
    self:PlayAnimation(self.List_Out)
    self.Parent:ChooseSeries(self.Index, self)
    self.Parent.CurSelectIndex = nil
    self.List_SubItem:BP_ClearSelection()
    self.List_SubItem:SetVisibility(ESlateVisibility.Collapsed)
    self.IsSelected = false
  end
  self.Btn_Click:SetFocus()
end

function M:OnCellHovered()
  if not self.IsSelected then
    self:PlayAnimation(self.Hover)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent:HoverSeries(self)
    self.Btn_Click:SetFocus()
    self.List_SubItem:BP_ClearSelection()
  end
  if self.IsSelected and self.IsUnlocked then
    self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Down, self.List_SubItem)
  elseif self.Parent.List_Item:GetItemAt(self.Index + 1) then
    self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Down, self.Parent.List_Item:GetItemAt(self.Index + 1).UI.Btn_Click)
  end
  if self.Parent.List_Item:GetItemAt(self.Index - 1) then
    local UpItem = self.Parent.List_Item:GetItemAt(self.Index - 1)
    local FocusItem
    if UpItem.UI.IsSelected and UpItem.UI.IsUnlocked then
      local Num = UpItem.UI.List_SubItem:GetNumItems()
      FocusItem = UpItem.UI.List_SubItem:GetItemAt(Num - 1).UI
      if FocusItem then
        self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Up, FocusItem)
      end
    else
      self.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Up, UpItem.UI.Btn_Click)
    end
  end
end

function M:OnCellUnhovered()
  if not self.IsSelected then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function M:BP_OnItemSelectionChanged(IsSelected)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self.IsSelected = IsSelected
  if IsSelected then
  else
    self:OnItemLoseSelection()
  end
end

function M:OnItemLoseSelection()
  self.IsSelected = false
  self:StopAnimation(self.Click)
  self:PlayAnimation(self.List_Out)
  self.List_SubItem:SetVisibility(ESlateVisibility.Collapsed)
  self.List_SubItem:BP_ClearSelection()
  if self.IsUnlocked then
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Forbidden)
  end
end

return M
