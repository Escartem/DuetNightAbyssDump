require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Btn_Switch.OnClicked:Remove(self, self.OnBtnClicked)
  self.Btn_Switch.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn_Switch.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Btn_Switch.OnPressed:Remove(self, self.OnBtnPressed)
  self.Btn_Switch.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Switch.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Switch.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Switch.OnPressed:Add(self, self.OnBtnPressed)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddInputMethodChangedListen()
  self:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType())
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  self:UpdateGamePadKey()
end

function M:ForceHideGamePadKey(bHide)
  self.bForceHideGamePadKey = bHide
end

function M:UpdateGamePadKey()
  if self.IsGamepadInput then
    if self.bForceHideGamePadKey then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.TabIdx = Params.TabIdx
  self._OnClicked = Params.OnClicked
  self.bIsForbidden = Params.bIsForbidden
  if self.bIsForbidden then
    self:PlayAnimationForward(self.Forbidden_R)
  elseif 1 == self.TabIdx then
    self:PlayAnimationForward(self.Switchover)
    self:PlayAnimationReverse(self.Switchover)
  else
    self:PlayAnimationForward(self.Switchover)
  end
end

function M:SetReddotRight(bShowReddot)
  if bShowReddot then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetReddotLeft(bShowReddot)
  if bShowReddot then
    self.New_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Forbid(IsForbidden)
  if IsForbidden then
    if not self.bIsForbidden then
      self:PlayAnimationForward(self.Forbidden_R)
    end
  elseif self.bIsForbidden then
    self:PlayAnimationForward(self.Normal)
  end
  self.bIsForbidden = IsForbidden
end

function M:OnBtnClicked()
  if self.bIsForbidden then
    UIManager(self):ShowUITip("CommonToastMain", GText("Pet_ResourcePet_LockToast"))
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_crystal_btn_tab", nil, nil)
  self.TabIdx = 1 == self.TabIdx and 2 or 1
  if 1 == self.TabIdx then
    self:PlayAnimationReverse(self.Switchover)
  else
    self:PlayAnimationForward(self.Switchover)
  end
  self:PlayAnimationReverse(self.Click)
  if self._OnClicked then
    self._OnClicked(self.Parent, self.TabIdx)
  end
end

function M:OnBtnHovered()
  if self.bIsForbidden then
    return
  end
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.UnHover)
  self:PlayAnimationForward(self.Hover)
end

function M:OnBtnUnhovered()
  if self.bIsForbidden then
    return
  end
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
  self:PlayAnimationForward(self.UnHover)
end

function M:OnBtnPressed()
  if self.bIsForbidden then
    return
  end
  self:StopAnimation(self.Normal)
  self:PlayAnimationForward(self.Press)
end

AssembleComponents(M)
return M
