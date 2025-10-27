require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.WBP_Armory_PetAttr_Base_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.bIsFocusable = true
  self:SetIsShowNavigateGuide(false)
  self.Btn_Intensify:SetDefaultGamePadImg("X")
  self.Btn_Replace:SetDefaultGamePadImg("Y")
  self.PreviewTab:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
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
  self:UpdateGamepadKeyStyle()
end

function M:UpdateGamepadKeyStyle()
  if self.IsGamepadInput then
    if self.bInFocusPath then
      self.Btn_Intensify:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Replace:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_Intensify:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Btn_Replace:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurFocusEntryWidget or self.DisplayEntryItemWidgets[1])
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if not self.IsPreviewMode and self.Btn_Intensify:IsVisible() then
      if self.Btn_Intensify.IsForbidden then
        self:OnForbiddenIntensifyBtnClicked()
      else
        self:OnIntensifyBtnClicked()
      end
    end
    return UIUtils.Handled, true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.PreviewTab:IsVisible() then
      self.PreviewTab:SwitchTab()
    elseif self.Btn_Replace:IsVisible() then
      if self.Btn_Replace.IsForbidden then
        self:OnForbiddenReplaceBtnClicked()
      else
        self:OnReplaceBtnClicked()
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

function M:OnPlayPetFresnel()
  M.Super.OnPlayPetFresnel(self)
  if self.bInFocusPath then
    self.DisplayEntryItemWidgets[1]:SetFocus()
  end
end

return M
