require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
end

function M:Init(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnBtnClicked = Content.OnClicked
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  Content.UI = self
  self:SetIcon(Content.Icon)
  self:SetIsSelected(Content.IsSelected)
end

function M:SetIcon(Icon)
  local IconDynaMaterial = self.Img_TabIcon:GetDynamicMaterial()
  if IconDynaMaterial then
    if type(Icon) == "string" then
      IconDynaMaterial:SetTextureParameterValue("Mask", LoadObject(Icon))
    else
      IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
    end
  end
end

function M:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  if self._OnBtnClicked then
    self._OnBtnClicked(self.Owner, self.Content)
  end
end

function M:SetIsSelected(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnPressed()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Touch then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self.IsSelected then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Touch then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnBtnHovered()
  if self.IsSelected then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Touch then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsSelected then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Touch then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn)
end

return M
