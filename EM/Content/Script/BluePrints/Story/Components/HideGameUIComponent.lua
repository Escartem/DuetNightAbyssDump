local FHideGameUIComponent = {}

function FHideGameUIComponent:New()
  local Obj = setmetatable({}, {__index = FHideGameUIComponent})
  return Obj
end

function FHideGameUIComponent:Execute()
  self:SetGameUIHiddenExceptStory(true)
end

function FHideGameUIComponent:Resume()
  self:SetGameUIHiddenExceptStory(false)
end

function FHideGameUIComponent:SetGameUIHiddenExceptStory(bHidden)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:InterruptBlackCurtainEnd()
  end
  if bHidden then
    UIManager(GWorld.GameInstance):AddUIManagerCurrentModeTag(Const.TalkHideTag)
  else
    UIManager(GWorld.GameInstance):RemoveUIManagerCurrentModeTag(Const.TalkHideTag)
  end
end

return FHideGameUIComponent
