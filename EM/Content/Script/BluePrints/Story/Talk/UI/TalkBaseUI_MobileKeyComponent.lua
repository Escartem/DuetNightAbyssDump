local Component = {}

function Component:InitMobileButtons()
  if IsValid(self.Story_PlayBtn) then
    self.Story_PlayBtn:InitButtons()
  end
end

function Component:UnInitMobileButtons()
  if IsValid(self.Story_PlayBtn) then
    self.Story_PlayBtn:UnInitButtons()
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
  self.SkipCallback.Func(self.SkipCallback.Obj)
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

return Component
