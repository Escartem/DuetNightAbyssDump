require("UnLua")
local M = Class({
  "Blueprints.UI.BP_UIState_C"
})

function M:Init(Params)
  self:SetText(GText(Params.Name))
  self:BindEventOnClicked(self, Params.OpenDialog)
  self.KeyImg_EX:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:Construct()
  self.Button_EX.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_EX.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_EX.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_EX.OnReleased:Add(self, self.OnBtnReleased)
  self.Button_EX.OnClicked:Add(self, self.OnBtnClicked)
end

function M:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Destruct()
  self:RemoveInputMethodChangedListen()
  self.Super.Destruct(self)
end

function M:SetText(Text)
  self.Text_Tips_EX:SetText(Text)
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:OnBtnHovered()
  self.IsHovering = true
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Normal)
  else
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
  end
end

function M:OnBtnClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    if self.Params then
      self.Func(self.Obj, table.unpack(self.Params))
    else
      self.Func(self.Obj)
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self:InitGamepadView()
  end
  self.CurInputDeviceType = CurInputDevice
end

function M:InitKeyBoardView()
  self.KeyImg_EX:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitGamepadView()
end

function M:HandleKeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    IsEventHandled = true
    self:OnBtnClicked()
  end
  return IsEventHandled
end

return M
