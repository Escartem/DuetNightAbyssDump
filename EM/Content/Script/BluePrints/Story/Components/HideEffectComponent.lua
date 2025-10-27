local FHideEffectComponent = {}

function FHideEffectComponent:New()
  local HideEffectComponent = setmetatable({}, {__index = FHideEffectComponent})
  return HideEffectComponent
end

function FHideEffectComponent:HideEffect(bHide)
  local TS = TalkSubsystem()
  if TS then
    TS:TalkHideEffects(bHide, Const.TalkHideTag)
  end
end

return FHideEffectComponent
