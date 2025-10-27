local M = {}

function M:IsStorylineComplete(TalkTriggerId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar:IsStorylineComplete(TalkTriggerId)
  end
  return false
end

function M:IsStorylineUnComplete(TalkTriggerId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar:IsStorylineUnComplete(TalkTriggerId)
  end
  return false
end

function M:IsImpressionCheckSuccess(DialogueId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar:IsImpressionCheckSuccess(DialogueId)
  end
  return false
end

function M:IsImpressionCheckFailure(DialogueId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar:IsImpressionCheckFailure(DialogueId)
  end
  return false
end

return M
