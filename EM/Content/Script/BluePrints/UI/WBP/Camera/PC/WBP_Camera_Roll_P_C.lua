require("UnLua")
local M = Class("BluePrints.UI.WBP.Camera.WBP_Camera_JoyStick_Base_C")

function M:Construct()
  self.PressAnims = {
    Left = {
      Anim = self.A_Press
    },
    Right = {
      Anim = self.D_Press
    },
    Up = {
      Anim = self.W_Press
    },
    Down = {
      Anim = self.S_Press
    }
  }
end

function M:InitKeyInfo(LeftKey, RightKey, UpKey, DownKey)
  self.A:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = LeftKey}
    }
  })
  self.D:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = RightKey}
    }
  })
  self.W:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = UpKey}
    }
  })
  self.S:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = DownKey}
    }
  })
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "L"}
    }
  })
end

function M:SetPressed(DirectionStr, bPressed)
  if not self.PressAnims[DirectionStr] then
    return
  end
  if self.PressAnims[DirectionStr].IsPressed == bPressed then
    return
  end
  self.PressAnims[DirectionStr].IsPressed = bPressed
  if bPressed then
    self:PlayAnimation(self.PressAnims[DirectionStr].Anim)
  elseif self:IsAnimationPlaying(self.PressAnims[DirectionStr].Anim) then
    self:ReverseAnimation(self.PressAnims[DirectionStr].Anim)
  else
    self:PlayAnimation(self.PressAnims[DirectionStr].Anim, 0, 1, EUMGSequencePlayMode.Reverse)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self.Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if 1 ~= self.WS_Type:GetActiveWidgetIndex() then
      self:PlayAnimation(self.Roll_Normal)
    end
  elseif CurInputType == ECommonInputType.MouseAndKeyboard then
    self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

return M
