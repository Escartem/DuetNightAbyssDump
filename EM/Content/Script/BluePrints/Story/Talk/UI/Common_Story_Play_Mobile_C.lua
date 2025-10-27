require("UnLua")
local M = Class()

function M.New(ParentWidget)
  M.ParentWidget = ParentWidget
  M.WidgetSwitcher = ParentWidget.WidgetSwitcher
  M.Button_Auto = ParentWidget.Button_Auto
  M.Button_Skip = ParentWidget.Button_Skip
  M.bAutoPlay = false
  M.Button_Auto:SetCurrentTextBlock("UI_TALK_AUTO_1")
  M.Button_Skip:SetCurrentTextBlock("UI_TALK_SKIP_MOIILE")
  M.Button_Auto.VX_Loop:SetRenderOpacity(0)
  M.Button_Skip.VX_Loop:SetRenderOpacity(0)
  return M
end

function M:SetAutoPlay(bAutoPlay)
  self.bAutoPlay = bAutoPlay
  if bAutoPlay then
    self.WidgetSwitcher:SetActiveWidgetIndex(1)
    self.Button_Auto:PlayAnimation(self.Button_Auto.Btn_Loop)
  else
    self.WidgetSwitcher:SetActiveWidgetIndex(0)
    self.Button_Auto:PlayAnimationReverse(self.Button_Auto.Btn_Loop)
  end
end

function M:OnAutoPlayClicked()
  if self.AutoPlayCallback then
    self.AutoPlayCallback.Func(self.AutoPlayCallback.Obj, not self.bAutoPlay)
  end
  self:SetAutoPlay(not self.bAutoPlay)
end

function M:OnSkipClicked(This)
  if self.SkipCallback then
    self.SkipCallback.Func(self.SkipCallback.Obj)
  end
end

function M:EnableAutoPlay()
  self.bCanAutoPlay = true
  self.Button_Auto:ForbidBtn(false)
end

function M:DisableAutoPlay()
  self.bCanAutoPlay = false
  self.Button_Auto:ForbidBtn(true)
end

function M:EnableSkip()
  self.bCanSkip = true
  self.Button_Skip:ForbidBtn(false)
end

function M:DisableSkip()
  self.bCanSkip = false
  self.Button_Skip:ForbidBtn(true)
end

function M:BindAutoPlay(InObj, InFunc)
  self.AutoPlayCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindAutoPlay(InObj, InFunc)
  self.AutoPlayCallback = nil
end

function M:BindSkip(InObj, InFunc)
  self.SkipCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindSkip()
  self.SkipInfo = nil
end

function M:SetAutoPlayButtonHidden(bHidden)
  if bHidden then
    self.Button_Auto:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Button_Auto:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:SetSkipButtonHidden(bHidden)
  if bHidden then
    self.Button_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Button_Skip:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:GetAutoPlayButtonHidden()
  return self.Button_Auto:GetVisibility() == ESlateVisibility.Collapsed
end

function M:GetSkipButtonHidden()
  return self.Button_Skip:GetVisibility() == ESlateVisibility.Collapsed
end

function M:SetVisibility(EVisibility)
  self.ParentWidget.Function:SetVisibility(EVisibility)
end

function M:OnActive()
  self:SetVisibility(ESlateVisibility.Visible)
end

function M:OnDeactive()
  self:SetVisibility(ESlateVisibility.Collapsed)
end

return M
