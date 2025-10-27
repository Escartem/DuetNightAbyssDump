require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self:AddDispatcher(EventID.OnGetGuideBookReward, self, self.OnCellGetReward)
  self.Common_List_Subcell_PC:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  end)
end

function M:OnListItemObjectSet(Obj)
  self.IsEmpty = Obj.IsEmpty
  if self.IsEmpty then
    self.Group_Normal:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Common_List_Subcell_PC:OnCellUnSelect()
    self.Common_List_Subcell_PC.IsCantInteractable = true
    self.Common_List_Subcell_PC:SetRenderOpacity(0.5)
    return
  else
    self.Group_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
    self.Common_List_Subcell_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Common_List_Subcell_PC.IsCantInteractable = false
    self.Common_List_Subcell_PC:SetRenderOpacity(1.0)
  end
  if Obj.Title then
    self.Title = Obj.Title
  end
  if Obj.Parent then
    self.Parent = Obj.Parent
  end
  if Obj.GuideId then
    self.GuideId = Obj.GuideId
  end
  if Obj.Index then
    self.Index = Obj.Index
  end
  if Obj.GuideNoteId then
    self.GuideNoteId = Obj.GuideNoteId
  end
  self.Text_GuideName:SetText(self.Title)
  self.Common_Item_Subsize_New_PC:SetVisibility(ESlateVisibility.Collapsed)
  if 1 == self.Parent.UnlockedGuideNotes[self.GuideNoteId].Reward then
    self.Common_Item_Subsize_New_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.Common_List_Subcell_PC:BindEventOnClicked(self, self.OpenDetail)
  if self.Parent.InitGuideNoteId == self.GuideNoteId then
    self.Parent.SelectedItem = self
    self.Parent:OpenDetail(self.GuideId, self.Index)
    self.Parent.InitGuideNoteId = nil
  elseif self.Parent.CurrentListIndex ~= self.Index then
    self:_OnCellUnSelect()
  end
end

function M:OpenDetail()
  if self.IsEmpty then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    self.Parent:SetFocus()
  end
  self.Parent.SelectedItem = self
  self.Parent:OpenDetail(self.GuideId, self.Index)
end

function M:BP_OnItemSelectionChanged(IsSelected)
  if self.IsEmpty then
    return
  end
  if not IsSelected then
    self:_OnCellUnSelect()
  else
    self:_SelectCell()
  end
end

function M:OnCellGetReward(GuideNoteId)
  if self.GuideNoteId ~= GuideNoteId then
    return
  end
  self.Common_Item_Subsize_New_PC:SetVisibility(ESlateVisibility.Collapsed)
end

function M:_OnCellUnSelect()
  self.Text_GuideName:SetDefaultColorAndOpacity(self.Text_NormalColor)
  self.Common_List_Subcell_PC:OnCellUnSelect()
end

function M:_SelectCell()
  self.Text_GuideName:SetDefaultColorAndOpacity(self.Text_SelectColor)
  self.Common_List_Subcell_PC:SelectCell()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
    self:OpenDetail()
  end
end

return M
