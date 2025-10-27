require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Btn_Switch_L.OnClicked:Remove(self, self.OnLeftBtnClicked)
  self.Btn_Switch_R.OnClicked:Remove(self, self.OnRightBtnClicked)
  self.Btn_Switch_L.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn_Switch_R.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn_Switch_L.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Btn_Switch_R.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Btn_Switch_L.OnPressed:Remove(self, self.OnBtnPressed)
  self.Btn_Switch_R.OnPressed:Remove(self, self.OnBtnPressed)
  self.Btn_Switch_L.OnClicked:Add(self, self.OnLeftBtnClicked)
  self.Btn_Switch_R.OnClicked:Add(self, self.OnRightBtnClicked)
  self.Btn_Switch_L.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Switch_R.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Switch_L.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Switch_R.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Switch_L.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Switch_R.OnPressed:Add(self, self.OnBtnPressed)
  self.Key_GamePad_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_GamePad_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.New_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
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
      self.Key_GamePad_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Key_GamePad_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Key_GamePad_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Key_GamePad_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Key_GamePad_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.TabIdx = Params.TabIdx
  self.OnTabClicked = Params.OnTabClicked
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
  self.bIsForbidden = IsForbidden
  if self.bIsForbidden then
    self:PlayAnimationForward(self.Forbidden_R)
  else
    self:PlayAnimationForward(self.Normal)
  end
end

function M:TriggerSwitch(Direction)
  if "Left" == Direction then
    self:OnLeftBtnClicked()
  elseif "Right" == Direction then
    self:OnRightBtnClicked()
  end
end

function M:BtnSwitchToLeft()
  self.TabIdx = 1
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self:PlayAnimationReverse(self.Switchover)
end

function M:OnLeftBtnClicked()
  if 1 == self.TabIdx then
    return
  end
  self:BtnSwitchToLeft()
  if self.OnTabClicked then
    self.OnTabClicked(self.Parent, self.TabIdx)
  end
end

function M:BtnSwitchToRight()
  self.TabIdx = 2
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self:PlayAnimationForward(self.Switchover)
end

function M:OnRightBtnClicked()
  if 2 == self.TabIdx then
    return
  end
  self:BtnSwitchToRight()
  if self.OnTabClicked then
    self.OnTabClicked(self.Parent, self.TabIdx)
  end
end

function M:OnBtnClicked()
end

function M:OnBtnHovered()
  if self.bIsForbidden then
    return
  end
end

function M:OnBtnUnhovered()
  if self.bIsForbidden then
    return
  end
end

function M:OnBtnPressed()
  if self.bIsForbidden then
    return
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.UnHover then
  end
end

AssembleComponents(M)
return M
