require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.WBP_Armory_PetEntry_Base_C"
})

function M:Construct()
  self.bIsFocusable = true
  M.Super.Construct(self)
  self.Btn_Index:SetDefaultGamePadImg("RS")
  self.Btn_Intensify:SetDefaultGamePadImg("X")
  self.Btn_Mix:SetDefaultGamePadImg("Y")
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:Init(Params)
  M.Super.Init(self, Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self:InitNavigationRules()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  if self.bInFocusPath and not self.IsEntryWidgetInFocusPath then
    self.DisplayEntryItemWidgets[1]:SetFocus()
  end
  self:OnFocusChanged()
end

function M:OnFocusChanged()
  self:UpdateGamepadKeyStyle()
end

function M:UpdateGamepadKeyStyle()
  if self.IsGamepadInput then
    if self.bInFocusPath then
      self.Btn_Index:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_Index:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurFocusEntryWidget or self.DisplayEntryItemWidgets[1])
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  local IsRepeat = UKismetInputLibrary.InputEvent_IsRepeat(InputEvent)
  if IsRepeat then
    return
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightThumb and not self.bInFocusPath then
    self:OnIndexBtnClicked()
    return UIUtils.Handled, true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.Btn_Intensify:IsVisible() then
      if self.Btn_Intensify.IsForbidden then
        self:OnForbiddenBtnEntryBreakClicked()
      else
        self:OnBtnEntryBreakClicked(true)
      end
    end
    return UIUtils.Handled, true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.Btn_Mix:IsVisible() then
      if self.Btn_Mix.IsForbidden then
        self:OnForbiddenBtnFuseClicked()
      else
        self:OnFuseBtnClicked()
      end
    end
    return UIUtils.Handled, true
  end
end

function M:OnAddedToFocusPath()
  self.bInFocusPath = true
  self:UpdateGamepadKeyStyle()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent)
  end
end

function M:OnRemovedFromFocusPath()
  self.bInFocusPath = false
  self:UpdateGamepadKeyStyle()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent)
  end
end

return M
