require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Plan.OnClicked:Add(self, self.OnExpandSwitcherList)
  self.Btn_Plan.OnPressed:Add(self, self.OnBtnPlanPressed)
  self.Btn_Plan.OnHovered:Add(self, self.OnBtnPlanHovered)
  self.Btn_Plan.OnUnhovered:Add(self, self.OnBtnPlanUnhovered)
  self.Panel_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Unfold.OnClicked:Add(self, self.OnUnfoldSwitcherList)
  self.Btn_Edit.OnClicked:Add(self, self.OnEditSuitNameClick)
  self:PlayAnimation(self.Btn_Normal)
  EventManager:AddEvent(EventID.OnWindowResized, self, self.OnUnfoldSwitcherList)
end

function M:ResetWidget()
  self:OnUnfoldSwitcherList()
  self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_Plan:ClearListItems()
  local CurrSuitIndex = ModModel:GetTarget().ModSuitIndex
  for Index, Suit in ipairs(ModModel:GetTarget().ModSuits) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Text = ModModel:GetSuitName(Index)
    Content.Owner = self
    Content.Index = Index
    if CurrSuitIndex == Index then
      self.CurrContent = Content
    end
    self.List_Plan:AddItem(Content)
  end
  self:OnModSuitChanged(CurrSuitIndex)
end

function M:OnListItemClicked(Content)
  self:OnUnfoldSwitcherList()
  self.Btn_Plan:SetFocus()
  ModController:SendChangeSuit(ModModel:GetTarget(), Content.Index)
end

function M:OnModSuitChanged(ModSuitIndex)
  local SuitName = ModModel:GetSuitName()
  self.Text_Plan:SetText(SuitName)
  local Content = self.List_Plan:GetItemAt(ModSuitIndex - 1)
  self.CurrContent.IsSelected = false
  if IsValid(self.CurrContent.Entry) then
    self.CurrContent.Entry:OnEntrySelectionChanged()
  end
  Content.IsSelected = true
  if IsValid(Content.Entry) then
    Content.Entry:OnEntrySelectionChanged()
  end
  self.CurrContent = Content
end

function M:OnExpandSwitcherList()
  if not self.bExpandList then
    self.Panel_List:SetVisibility(UIConst.VisibilityOp.Visible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.bExpandList = true
    self:StopAllAnimations()
    self:PlayAnimation(self.Expand)
  else
    self:OnUnfoldSwitcherList()
  end
  self:PlayAnimation(self.Btn_Click)
end

function M:OnUnfoldSwitcherList()
  self.Panel_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  if self.bExpandList then
    self:PlayAnimation(self.Fold)
  end
  self.bExpandList = false
end

function M:OnBtnPlanPressed()
  self:StopAnimation(self.Btn_UnHover)
  self:StopAnimation(self.Btn_Hover)
  self:PlayAnimation(self.Btn_Press)
end

function M:OnBtnPlanHovered()
  self:StopAnimation(self.Btn_UnHover)
  self:StopAnimation(self.Btn_Press)
  self:PlayAnimation(self.Btn_Hover)
end

function M:OnBtnPlanUnhovered()
  self:StopAnimation(self.Btn_Hover)
  self:StopAnimation(self.Btn_Press)
  self:PlayAnimation(self.Btn_UnHover)
end

function M:OnEditSuitNameClick()
  local Params = {
    UseGenaral = true,
    MultilineType = 1,
    TextLenMax = DataMgr.GlobalConstant.ModPlanNameMaxLen.ConstantValue,
    DefaultText = self.CurrContent.Text,
    HintText = GText("UI_Mod_SuitNameHint"),
    OnSDKChecked = function(bRes, InputWidget, NewName)
      if not bRes then
        return
      end
      ModController:SendEditSuitName(ModModel:GetTarget(), NewName)
    end
  }
  UIManager():ShowCommonPopupUI(ModCommon.EditSuitNameDialog, Params, ModController:GetView(self))
end

function M:OnEditSuitNameDone(ModSuitIndex, NewName)
  local Content = self.List_Plan:GetItemAt(ModSuitIndex - 1)
  Content.Text = NewName
  if IsValid(Content.Entry) then
    Content.Entry:SetText(NewName)
  end
  if Content == self.CurrContent then
    self.Text_Plan:SetText(NewName)
  end
  self.List_Plan:RequestRefresh()
end

function M:OnAddedToFocusPath(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self:OnUnfoldSwitcherList()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:Destruct()
  self.Btn_Plan.OnClicked:Remove(self, self.OnExpandSwitcherList)
  self.Btn_Plan.OnPressed:Remove(self, self.OnBtnPlanPressed)
  self.Btn_Plan.OnHovered:Remove(self, self.OnBtnPlanHovered)
  self.Btn_Plan.OnUnhovered:Remove(self, self.OnBtnPlanUnhovered)
  self.Btn_Unfold.OnClicked:Remove(self, self.OnUnfoldSwitcherList)
  self.Btn_Edit.OnClicked:Remove(self, self.OnEditSuitNameClick)
  EventManager:RemoveEvent(EventID.OnWindowResized, self)
end

return M
