require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:SetIsChecked(IsChecked)
  self.bChecked = IsChecked
  if IsChecked then
    self.Image_Own:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Own:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Event then
    self.Event(self.Obj, self.bChecked)
  end
end

function M:Construct()
  self.Button_None.OnClicked:Clear()
  self.Button_None.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_None.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_None.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_None.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self:UnbindFromAnimationFinished(self.Click, {
    self,
    self.OnClickAnimEnd
  })
  self:BindToAnimationFinished(self.Click, {
    self,
    self.OnClickAnimEnd
  })
  self.Obj = nil
  self.Event = nil
  self:FlushAnimations()
  self:PlayAnimation(self.Normal)
end

function M:IsChecked()
  return self.bChecked
end

function M:OnBtnClicked()
  self:SetIsChecked(not self.bChecked)
  self:FlushAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnClickAnimEnd()
  if self:IsHovered() then
    self:OnBtnHovered()
  end
end

function M:OnBtnPressed()
  self:FlushAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnHovered()
  self:FlushAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self:FlushAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:SetText(Text)
  self.Text_None:SetText(Text)
end

function M:BindEventOnCheckStateChanged(Obj, Event)
  self.Obj = Obj
  self.Event = Event
end

return M
