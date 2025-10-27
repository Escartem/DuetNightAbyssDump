local FHideAllMonstersComponent = {}

function FHideAllMonstersComponent:New()
  local HideAllMonstersComponent = setmetatable({}, {__index = FHideAllMonstersComponent})
  return HideAllMonstersComponent
end

function FHideAllMonstersComponent:DoHide()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if IsValid(GameState) then
    if type(GameState.HideAllRealMonsters) == "function" then
      GameState:HideAllRealMonsters(true, Const.TalkHideTag)
    end
    if "function" == type(GameState.HideAllPhantom) then
      GameState:HideAllPhantom(true, Const.TalkHideTag)
    end
  end
  DebugPrint("gmy@HideAllMonstersComponent FHideAllMonstersComponent:DoHide", 111)
  local Battle = Battle(self)
  if IsValid(Battle) then
    Battle:HideAllDanmaku(true)
  end
end

function FHideAllMonstersComponent:ResumeHide()
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if IsValid(GameState) then
    if type(GameState.HideAllRealMonsters) == "function" then
      GameState:HideAllRealMonsters(false, Const.TalkHideTag)
    end
    if "function" == type(GameState.HideAllPhantom) then
      GameState:HideAllPhantom(false, Const.TalkHideTag)
    end
  end
  local Battle = Battle(self)
  if IsValid(Battle) then
    Battle:HideAllDanmaku(false)
  end
end

return FHideAllMonstersComponent
