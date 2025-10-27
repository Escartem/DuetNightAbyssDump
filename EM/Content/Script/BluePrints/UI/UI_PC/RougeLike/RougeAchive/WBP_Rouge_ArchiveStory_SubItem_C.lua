require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.StoryId = Content.StoryId
  self.IsUnlocked = Content.IsUnlocked
  self.Index = Content.Index
  self.IsNew = Content.IsNew
  self.Name = Content.Name
  self.Data = Content.Data
  self.IsSelected = Content.IsSelected
  self.Parent = Content.Parent
  self.GreatParent = Content.GreatParent
  self:InitSubStoryItem()
end

function M:InitSubStoryItem()
  if self.IsNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.IsUnlocked then
    self.Text_Title:SetText(GText("RLArchive_UnlockEntry"))
    self:PlayAnimation(self.Forbidden)
    return
  end
  if self.IsSelected then
    self:PlayAnimation(self.Click)
    if self.IsUnlocked then
      self:PlayAnimation(self.Select)
    end
    self.Parent:ChooseItem(self.Index, self)
    self.GreatParent:ChooseItem(self)
  else
    self:PlayAnimation(self.Normal)
  end
  self.Text_Title:SetText(GText(self.Name))
end

function M:OnCellClicked()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.GreatParent.CurSelectSubItem == self and self.IsUnlocked then
      self.GreatParent:OpenItem()
      return
    end
    self.Btn_Click:SetFocus()
  end
  self.Parent:ChooseItem(self.Index, self)
  self.GreatParent:ChooseItem(self)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_crystal_btn_content", nil, nil)
  self:PlayAnimation(self.Click)
  if self.IsUnlocked then
    self:PlayAnimation(self.Select)
  end
  if not self.IsUnlocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("RLArchive_StoryUnlock"))
  end
  if self.IsNew then
    self.IsNew = false
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnCellHovered()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.IsNew then
      self.IsNew = false
      self.New:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Parent:ChooseItem(self.Index, self)
    self.GreatParent:ChooseItem(self)
    AudioManager(self):PlayUISound(self, "event:/ui/armory/click_crystal_btn_content", nil, nil)
    self:PlayAnimation(self.Click)
    if self.IsUnlocked then
      self:PlayAnimation(self.Select)
    end
    if not self.IsUnlocked then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("RLArchive_StoryUnlock"))
    end
    self.Btn_Click:SetFocus()
  end
  if not self.IsSelected then
    self:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if not self.IsSelected then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function M:BP_OnItemSelectionChanged(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
  else
    self:OnSubItemLoseSelection()
  end
end

function M:OnSubItemLoseSelection()
  self:StopAnimation(self.Click)
  if self.IsUnlocked then
    self:StopAnimation(self.Select)
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Forbidden)
  end
end

return M
