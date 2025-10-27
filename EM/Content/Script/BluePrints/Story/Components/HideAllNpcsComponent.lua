local FHideAllNpcsComponent = {}

function FHideAllNpcsComponent:New()
  local HideAllNpcsComponent = setmetatable({}, {__index = FHideAllNpcsComponent})
  return HideAllNpcsComponent
end

function FHideAllNpcsComponent:DoHide()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if IsValid(GameState) and GameState.HideAllNpcs then
    GameState:HideAllNpcs(true, Const.TalkHideTag)
  end
end

function FHideAllNpcsComponent:ResumeHide()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if IsValid(GameState) and GameState.HideAllNpcs then
    GameState:HideAllNpcs(false, Const.TalkHideTag)
  end
end

return FHideAllNpcsComponent
