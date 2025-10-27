require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Params)
  self.Owner = Params.Owner
  self.OnCloseCallback = Params.OnClosed
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self.bNoCloseAnim = Params.bNoCloseAnim
  self:SetFocus()
  self.Text_Title:SetText(Params.Title)
  self.Text_Desc:SetText(Params.Desc)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self:PlayInAnim()
end

function M:OnFocusLost()
  if not self.bNoCloseAnim then
    self:PlayOutAnim()
  end
  if self.OnCloseCallback then
    self.OnCloseCallback(self.Owner)
  end
end

function M:PlayInAnim()
  self:UnbindAllFromAnimationFinished(self.Out)
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:StopAllAnimations()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
  self:PlayAnimation(self.Out)
end

function M:OnOutAnimationFinished()
  self:RemoveFromParent()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Owner)
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner)
  end
end

return M
