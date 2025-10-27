require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnButtonClicked)
end

function M:SetDefaultGamePadImg(ImgShortPath)
end

function M:SetText(Text)
  self.Text_BuyLv:SetText(Text)
end

function M:ForbidBtn(IsForbid)
  if IsForbid == self.IsForbidden then
    return
  end
  self:UnbindAllFromAnimationFinished(self.UnHover)
  if self.IsForbidden == false and true == IsForbid then
    self.IsForbidden = true
    self:PlayButtonForbidAnim()
  elseif self.IsForbidden == true and false == IsForbid then
    self.IsForbidden = false
    self:PlayButtonUnForbidAnim()
  end
end

function M:PlayButtonForbidAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Forbidden)
end

function M:PlayButtonUnForbidAnim()
  if self.IsHovering then
    self:PlayButtonHoverAnim()
  else
    self:SwitchNormalAnimation()
  end
end

function M:PlayButtonHoverAnim()
  self:PlayAnimation(self.Hover)
end

function M:SwitchNormalAnimation()
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Normal)
end

function M:UnBindEventOnClicked()
  self.Obj = nil
  self.Func = nil
  self.Params = nil
end

function M:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function M:OnButtonClicked()
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
end

return M
