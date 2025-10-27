local BP_AvatarFunctionLibrary_C = Class()
BP_AvatarFunctionLibrary_C._components = {
  "BluePrints.Client.AvatarFunctionLibrary.RougelikeAvatarFunction",
  "BluePrints.Client.AvatarFunctionLibrary.ImpressionAvatarFunction"
}

function BP_AvatarFunctionLibrary_C:GetAvatarName()
  DebugPrint("Tianyi@ BP_AvatarFunctionLibrary_C:Test")
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local AvatarName = Avatar.AccountId
    return AvatarName
  end
  return "None"
end

function BP_AvatarFunctionLibrary_C:GetExploreGroupStatus(ExploreGroupId)
  DebugPrint("Tianyi@ BP_AvatarFunctionLibrary_C:GetExploreGroupStatus")
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Explore = Avatar.Explores[ExploreGroupId]
    if not Explore then
      return EExploreGroupStatus.EGS_Deactive
    else
      return Explore.ExploreState
    end
  end
  return EExploreGroupStatus.EGS_Deactive
end

function BP_AvatarFunctionLibrary_C:IsQuestDoing(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestDoing(QuestId)
end

function BP_AvatarFunctionLibrary_C:IsQuestFinished(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestFinished(QuestId)
end

function BP_AvatarFunctionLibrary_C:IsQuestUnaccpted(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestDoing(QuestId) or Avatar:IsQuestFinished(QuestId)
end

function BP_AvatarFunctionLibrary_C:IsQuestChainDoing(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestChainDoing(QuestChainId)
end

function BP_AvatarFunctionLibrary_C:IsQuestChainFinished(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestChainFinished(QuestChainId)
end

function BP_AvatarFunctionLibrary_C:IsQuestChainLock(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestChainLock(QuestChainId)
end

function BP_AvatarFunctionLibrary_C:IsQuestChainUnlock(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsQuestChainUnlock(QuestChainId)
end

function BP_AvatarFunctionLibrary_C:CheckTimeAcceleration()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:CheckTimeAcceleration()
end

function BP_AvatarFunctionLibrary_C:GetAvatarUid()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return "0"
  end
  return tostring(Avatar.Uid)
end

AssembleComponents(BP_AvatarFunctionLibrary_C)
return BP_AvatarFunctionLibrary_C
