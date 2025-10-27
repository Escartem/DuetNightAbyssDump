local FFreezeWorldCompositionComponent = {}

function FFreezeWorldCompositionComponent:New()
  local FreezeWorldCompositionComponent = setmetatable({}, {__index = FFreezeWorldCompositionComponent})
  return FreezeWorldCompositionComponent
end

function FFreezeWorldCompositionComponent:Execute()
  DebugPrint("TalkComp_FreezeWorldComposition_C \229\134\187\231\187\147WC")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    DebugPrint("\230\151\160GameMode \230\151\160\230\179\149\229\134\187\231\187\147WC")
    return
  end
  local WorldCompositionSubsystem = GameMode:GetWCSubSystem()
  if WorldCompositionSubsystem then
    WorldCompositionSubsystem:FreezeWorldComposition()
  end
end

function FFreezeWorldCompositionComponent:Resume()
  DebugPrint("TalkComp_FreezeWorldComposition_C \232\167\163\229\134\187WC")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    DebugPrint("\230\151\160GameMode \230\151\160\230\179\149\232\167\163\229\134\187WC")
    return
  end
  local WorldCompositionSubsystem = GameMode:GetWCSubSystem()
  if WorldCompositionSubsystem then
    WorldCompositionSubsystem:UnFreezeWorldComposition()
  end
end

return FFreezeWorldCompositionComponent
