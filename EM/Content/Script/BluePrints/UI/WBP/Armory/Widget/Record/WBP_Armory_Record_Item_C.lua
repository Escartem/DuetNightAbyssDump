require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Common_List_Subcell_PC:BindEventOnClicked(self, self.OnCellClicked)
  self.Common_List_Subcell_PC:SetCanCancelSelection(true)
  self.Button_Play.OnClicked:Add(self, self.OnBtnClicked)
end

function M:OnListItemObjectSet(Content)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Content = Content
  Content.UI = self
  if Content.IsLocked then
    self:PlayAnimation(self.Forbidden)
    self.Switcher:SetActiveWidgetIndex(1)
  else
    self.Switcher:SetActiveWidgetIndex(0)
  end
  self:SetReddot(Content.IsNew)
  self.Text_Title:SetText(Content.Title)
  self.Text_Details:SetText(Content.Details)
  if Content.IsShowBtnPlay then
    self.Switch:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:SetIsPlaying(Content.IsPlaying)
    self.Button_Play:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Button_Play:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Details:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if Content.IsEmptyItem then
    self.Common_List_Subcell_PC:SetRenderOpacity(0.4)
    self.Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Dummy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Common_List_Subcell_PC:SetRenderOpacity(1)
    self.Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Dummy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if Content.IsEmptyItem or Content.IsLocked then
    self.Button_Play:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Common_List_Subcell_PC:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Button_Play:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Common_List_Subcell_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if Content.IsSelected then
    self:SetIsSelected(Content.IsSelected, 1000)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
  self.Common_List_Subcell_PC:OnCellUnSelect()
end

function M:SetIsPlaying(IsPlaying)
  if self.Content then
    self.Content.IsPlaying = IsPlaying
  end
  if IsPlaying then
    self.Switch:SetActiveWidgetIndex(1)
    self:PlayAnimation(self.Play_Loop, 0, 0)
  else
    self.Switch:SetActiveWidgetIndex(0)
    self:StopAnimation(self.Play_Loop)
  end
end

function M:OnCellClicked()
  if self.Content.OnClicked then
    self.Content.OnClicked(self.Content.Parent, self.Content)
  end
  self.Text_Details:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Content.IsSelected = not self.Content.IsSelected
  self:SetIsSelected(self.Content.IsSelected)
  if self.Content.IsSelected then
    local ListVie = UE4.UUserListEntryLibrary.GetOwningListView(self)
    if ListVie then
      ListVie:BP_ScrollItemIntoView(self.Content)
    end
  end
end

function M:SetIsSelected(IsSelected, AnimSpeed)
  self.Content.IsSelected = IsSelected
  if IsSelected then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Click, 0, 1, EUMGSequencePlayMode.Forward, 1)
    self:StopAnimation(self.Text_Out)
    self:PlayAnimation(self.Text_In, 0, 1, EUMGSequencePlayMode.Forward, AnimSpeed or 1)
    self.Common_List_Subcell_PC:SelectCell()
  else
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal, 0, 1, EUMGSequencePlayMode.Forward, AnimSpeed or 1)
    self:StopAnimation(self.Text_In)
    self:PlayAnimation(self.Text_Out, 0, 1, EUMGSequencePlayMode.Forward, AnimSpeed or 1)
    self.Common_List_Subcell_PC:OnCellUnSelect()
  end
end

function M:SetReddot(IsNew)
  self.Content.IsNew = IsNew
  if not self.Content.IsLocked and IsNew then
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnBtnClicked()
  if self.Content and self.Content.OnBtnClicked then
    self.Content.OnBtnClicked(self.Content.Parent, self.Content)
  end
end

function M:GetSize()
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Common_List_Subcell_PC)
  return Slot:GetSize()
end

return M
