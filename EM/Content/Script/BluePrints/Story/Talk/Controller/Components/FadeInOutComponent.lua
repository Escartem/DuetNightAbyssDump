local FFadeInOutComponent = Class()

function FFadeInOutComponent:New()
  local FadeInOutComponent = setmetatable({}, {__index = FFadeInOutComponent})
  return FadeInOutComponent
end

function FFadeInOutComponent:BindOnFadeInFinished()
end

function FFadeInOutComponent:BindOnFadeOutFinished()
end

return FFadeInOutComponent
