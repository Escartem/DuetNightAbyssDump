require("UnLua")
local Component = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})

function Component:InitButtons()
  if self.Button_Auto then
    self.Button_Auto:BindEventOnClicked(self, self.OnAutoPlayClicked)
  end
  if self.Button_Skip then
    self.Button_Skip:BindEventOnClicked(self, self.OnSkipClicked)
  end
  if self.Button_Story_Review then
    self.Button_Story_Review:BindEventOnClicked(self, self.OnReviewClicked)
  end
  if self.Button_Encyclopedia then
    self.Button_Encyclopedia:BindEventOnClicked(self, self.OpenEncyclopedia)
  end
end

function Component:UnInitButtons()
  if self.Button_Auto then
    self.Button_Auto:UnBindEventOnClickedByObj(self)
  end
  if self.Button_Skip then
    self.Button_Skip:UnBindEventOnClickedByObj(self)
  end
  if self.Button_Story_Review then
    self.Button_Story_Review:UnBindEventOnClickedByObj(self)
  end
  if self.Button_Encyclopedia then
    self.Button_Encyclopedia:UnBindEventOnClickedByObj(self)
  end
end

function Component:SwitchBindMobileAutoPlay(bBind, InObj, InFunc)
  if bBind then
    self:BindAutoPlay_Internal(InObj, InFunc)
  else
    self:UnbindAutoPlay_Internal()
  end
end

function Component:SwitchBindMobileSkip(bBind, InObj, InFunc)
  if bBind then
    self:BindSkip_Internal(InObj, InFunc)
  else
    self:UnbindSkip_Internal()
  end
end

function Component:SwitchBindMobileReview(bBind, InObj, InFunc)
  if bBind then
    self:BindReview_Internal(InObj, InFunc)
  else
    self:UnbindReview_Internal()
  end
end

function Component:SwitchBindMobileWiki(bBind, InObj, InFunc)
  if bBind then
    self:BindWiki_Internal(InObj, InFunc)
  else
    self:UnbindWiki_Internal()
  end
end

function Component:BindAutoPlay_Internal(InObj, InFunc)
  self.AutoPlayCallback = {Func = InFunc, Obj = InObj}
end

function Component:UnbindAutoPlay_Internal()
  self.AutoPlayCallback = nil
end

function Component:BindSkip_Internal(InObj, InFunc)
  self.SkipCallback = {Func = InFunc, Obj = InObj}
end

function Component:UnbindSkip_Internal()
  self.SkipCallback = nil
end

function Component:BindReview_Internal(InObj, InFunc)
  self.ReviewCallback = {Func = InFunc, Obj = InObj}
end

function Component:UnbindReview_Internal()
  self.ReviewCallback = nil
end

function Component:BindWiki_Internal(InObj, InFunc)
  self.WikiCallback = {Func = InFunc, Obj = InObj}
end

function Component:UnbindWiki_Internal()
  self.WikiCallback = nil
end

function Component:OnAutoPlayClicked()
  if not self.AutoPlayCallback then
    return
  end
  self.AutoPlayCallback.Func(self.AutoPlayCallback.Obj, not self.bAutoPlay)
end

function Component:OnSkipClicked()
  if not self.SkipCallback then
    return
  end
  self:AddDelayFrameFunc(function()
    self.SkipCallback.Func(self.SkipCallback.Obj)
  end)
end

function Component:OnReviewClicked()
  if not self.ReviewCallback then
    return
  end
  self.ReviewCallback.Func(self.ReviewCallback.Obj)
end

function Component:OpenEncyclopedia()
  if not self.WikiCallback then
    return
  end
  self.WikiCallback.Func(self.WikiCallback.Obj)
end

function Component:ShowSkipButton(bShow)
  if bShow then
    self.Button_Skip:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Button_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Component:ShowAutoPlayButton(bShow)
  if bShow then
    self.Button_Auto:SetVisibility(ESlateVisibility.Visible)
  else
    self.Button_Auto:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:ShowReviewButton(bShow)
  if bShow then
    self.Button_Story_Review:SetVisibility(ESlateVisibility.Visible)
  else
    self.Button_Story_Review:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:ShowEncyclopedia()
  self.Button_Encyclopedia:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.Image_52 then
    self.Image_52:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function Component:HideEncyclopedia()
  self.Button_Encyclopedia:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function Component:InitPlayKey()
  self.bAutoPlay = GWorld.GameInstance.bGlobalAutoPlay
  self.Button_Auto:SetCurrentTextBlock("UI_TALK_AUTO_1")
  self.Button_Skip:SetCurrentTextBlock("UI_TALK_SKIP_MOIILE")
  self.Button_Story_Review:SetCurrentTextBlock("UI_TALK_Review")
  self.Button_Encyclopedia:SetCurrentTextBlock("UI_Wiki_WikiRefer")
end

function Component:ChangeAutoPlayUI()
  if self.bAutoPlay then
    self.WidgetSwitcher_1:SetActiveWidgetIndex(1)
    self.Button_Auto:SetCurrentTextBlock("UI_TALK_AUTO_2")
    if self.Button_Auto.VX_Loop then
      self.Button_Auto.VX_Loop:SetRenderOpacity(0.7)
    end
  else
    self.WidgetSwitcher_1:SetActiveWidgetIndex(0)
    self.Button_Auto:SetCurrentTextBlock("UI_TALK_AUTO_1")
    if self.Button_Auto.VX_Loop then
      self.Button_Auto.VX_Loop:SetRenderOpacity(0)
    end
  end
end

return Component
