local FTalkTriggerComponent = {}

function FTalkTriggerComponent:New()
  local TalkTriggerComponent = setmetatable({}, {__index = FTalkTriggerComponent})
  return TalkTriggerComponent
end

function FTalkTriggerComponent:IsNormal(TalkTriggerData)
  return TalkTriggerData and TalkTriggerData.Type == nil
end

function FTalkTriggerComponent:IsSideQuest(TalkTriggerData)
  return TalkTriggerData and TalkTriggerData.Type == "SideQuest"
end

function FTalkTriggerComponent:IsImpression(TalkTriggerData)
  return TalkTriggerData and TalkTriggerData.Type == "Impression"
end

function FTalkTriggerComponent:CanTrigger(TalkTriggerData)
  if nil == TalkTriggerData then
    return false
  end
  local TalkTriggerId = TalkTriggerData.TalkTriggerId
  if self:IsImpression(TalkTriggerData) then
    local Avatar = GWorld:GetAvatar()
    if nil == Avatar or Avatar:IsStorylineComplete(TalkTriggerId) then
      return false
    end
  end
  return self:CheckCondition(TalkTriggerData.TalkTriggerId)
end

function FTalkTriggerComponent:CheckCondition(TalkTriggerId)
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  if not StorySubsystem then
    return false
  end
  return StorySubsystem:CheckTalkTriggerCondition(TalkTriggerId)
end

function FTalkTriggerComponent:CheckDialogueCondition(DialogueId)
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  if not StorySubsystem then
    return false
  end
  return StorySubsystem:CheckDialogueCondition(DialogueId)
end

function FTalkTriggerComponent:CheckFlowCondition(Guid, Index)
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  if not StorySubsystem then
    return false
  end
  return StorySubsystem:CheckFlowCondition(Guid, Index)
end

return FTalkTriggerComponent
