require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn.OnClicked:Add(self, self.OnBtnClicked)
  self.IsFobidden = false
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

function M:BindForbidStateExecuteEvent(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.ForbidObj = Obj
  self.ForbidFunc = Func
  self.ForbidParams = {
    ...
  }
end

function M:OnBtnHovered()
  if self.IsForbidden then
    return
  end
  self.IsHovering = true
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsForbidden then
    return
  end
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  if self.IsForbidden then
    return
  end
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self.IsForbidden then
    return
  end
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
  if self.IsForbidden then
    self:StopAllAnimations()
    if self.ForbidObj and self.ForbidFunc then
      self.ForbidFunc(self.ForbidObj, table.unpack(self.ForbidParams))
    end
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
end

function M:ForbidBtn(IsForbid)
  if IsForbid and self.IsForbidden ~= true then
    self.IsForbidden = true
    self:StopAllAnimations()
    DebugPrint("zwk123456 IsForbid", IsForbid)
    self:PlayAnimation(self.Forbidden)
  elseif not IsForbid and self.IsForbidden then
    self.IsForbidden = false
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

return M
