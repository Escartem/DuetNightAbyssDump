require("UnLua")
local M = {}

function M:GetInferredAnswersAndDependencies()
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  local inferredAnswers = {}
  
  local function findDependencies(answerId, visited)
    visited = visited or {}
    if visited[answerId] then
      return
    end
    visited[answerId] = true
    local answerData = DataMgr.DetectiveAnswer[answerId]
    if answerData and answerData.Detective then
      inferredAnswers[answerId] = true
      for _, dependencyId in pairs(answerData.Detective) do
        inferredAnswers[dependencyId] = true
        findDependencies(dependencyId, visited)
      end
    end
  end
  
  for answerId, _ in pairs(UnlockedAnswers) do
    findDependencies(answerId, {})
  end
  return inferredAnswers
end

function M:IsCanInferAnswer(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData or not QuestionData.ProbablyNeededAnswers then
    return false
  end
  local inferredAnswers = self:GetInferredAnswersAndDependencies()
  for _, answerId in pairs(QuestionData.ProbablyNeededAnswers) do
    if not UnlockedAnswers[answerId] then
      local answerData = DataMgr.DetectiveAnswer[answerId]
      if answerData and answerData.Detective and not inferredAnswers[answerId] then
        return true
      end
    end
  end
  return false
end

function M:IsMultiEndingQuestion(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData or not QuestionData.ProbablyNeededAnswers then
    return false
  end
  local resultCount = 0
  for resultId, resultData in pairs(DataMgr.DetectiveResult) do
    if resultData.QuestionID == QuestionId then
      resultCount = resultCount + 1
      if resultCount > 1 then
        return true
      end
    end
  end
  return false
end

function M:IsMultiSelectCommitQuestion(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData or not QuestionData.ProbablyNeededAnswers then
    return false
  end
  for resultId, resultData in pairs(DataMgr.DetectiveResult) do
    if resultData.QuestionID == QuestionId and #resultData.Answers > 1 then
      return true
    end
  end
  return false
end

function M:GetMissingInferAnswers(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData or not QuestionData.ProbablyNeededAnswers then
    return {}
  end
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  for _, answerId in pairs(QuestionData.ProbablyNeededAnswers) do
    if not UnlockedAnswers[answerId] then
      local answerData = DataMgr.DetectiveAnswer[answerId]
      if answerData and answerData.Detective then
        local canInfer = true
        for _, requiredAnswerId in pairs(answerData.Detective) do
          if not UnlockedAnswers[requiredAnswerId] then
            canInfer = false
            break
          end
        end
        if canInfer then
          return answerData.Detective
        end
      end
    end
  end
  return nil
end

function M:GetMissingInferAnswersNum(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData or not QuestionData.ProbablyNeededAnswers then
    return 0
  end
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  for _, answerId in pairs(QuestionData.ProbablyNeededAnswers) do
    if not UnlockedAnswers[answerId] then
      local answerData = DataMgr.DetectiveAnswer[answerId]
      if answerData and answerData.Detective then
        return #answerData.Detective
      end
    end
  end
  return 0
end

function M:GetCommitAnswers(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData then
    return {}
  end
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  local possibleResults = {}
  for resultId, resultData in pairs(DataMgr.DetectiveResult) do
    if resultData.QuestionID == QuestionId then
      local hasAllAnswers = true
      if resultData.Answers then
        for _, answerId in pairs(resultData.Answers) do
          if not UnlockedAnswers[answerId] then
            hasAllAnswers = false
            break
          end
        end
      end
      if hasAllAnswers then
        return resultData.Answers
      end
    end
  end
  return nil
end

function M:GetCommitFirstAnswers(QuestionId)
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData then
    return {}
  end
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  local possibleResults = {}
  for resultId, resultData in pairs(DataMgr.DetectiveResult) do
    if resultData.QuestionID == QuestionId then
      return resultData.Answers
    end
  end
  return nil
end

function M:IsQuestionSolved(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedResults = Avatar.DetectiveGameUnlockedResults
  if not UnlockedResults then
    return false
  end
  for Result, _ in pairs(UnlockedResults) do
    local DetectiveQuestionData = DataMgr.DetectiveResult[Result]
    if QuestionId == DetectiveQuestionData.QuestionID then
      return true
    end
  end
  return false
end

function M:IsQuestionUnlockNewClue(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedResults = Avatar.DetectiveGameUnlockedResults
  if not UnlockedResults then
    return false
  end
  for Result, _ in pairs(UnlockedResults) do
    local DetectiveQuestionData = DataMgr.DetectiveResult[Result]
    if QuestionId == DetectiveQuestionData.QuestionID and DetectiveQuestionData.MainClueUnlock then
      return DetectiveQuestionData.MainClueUnlock
    end
  end
  return false
end

function M:GetQuestionResultAnswers(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedResults = Avatar.DetectiveGameUnlockedResults
  if not UnlockedResults then
    return nil
  end
  for Result, _ in pairs(UnlockedResults) do
    local DetectiveQuestionData = DataMgr.DetectiveResult[Result]
    if QuestionId == DetectiveQuestionData.QuestionID then
      return DetectiveQuestionData.Answers
    end
  end
  return nil
end

function M:GetQuestionClueCount(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswersRecord
  if not UnlockedAnswers then
    return 0, 0
  end
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData then
    return 0, 0
  end
  local totalClueCount = #QuestionData.ProbablyNeededAnswers
  local currentClueCount = 0
  for AnswerId, _ in pairs(UnlockedAnswers) do
    if self:TableContains(QuestionData.ProbablyNeededAnswers, AnswerId) then
      currentClueCount = currentClueCount + 1
    end
  end
  return currentClueCount, totalClueCount
end

function M:IsQuestionHasNewClue(QuestionId)
  local Avatar = GWorld:GetAvatar()
  local UnlockedAnswers = Avatar.DetectiveGameUnlockedAnswers
  if not UnlockedAnswers then
    return false
  end
  local QuestionData = DataMgr.DetectiveQuestion[QuestionId]
  if not QuestionData then
    return false
  end
  if not ReddotManager.GetTreeNode("DetectiveAnswer") then
    ReddotManager.AddNode("DetectiveAnswer")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveAnswer")
  for _, AnswerId in pairs(QuestionData.ProbablyNeededAnswers) do
    if CacheDetail[AnswerId] then
      return true
    end
  end
  return false
end

function M:IsHasNewQuestionOrClue(QuestionId)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveAnswer")
  if CacheDetail then
    for AnswerId, Value in pairs(CacheDetail) do
      if nil ~= QuestionId then
        local answerData = DataMgr.DetectiveAnswer[AnswerId]
        if answerData and answerData.QuestionID ~= QuestionId and Value then
          return 2
        end
      elseif Value then
        return 2
      end
    end
  end
  CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveQuestion")
  if CacheDetail then
    for QuestionId, Value in pairs(CacheDetail) do
      if Value then
        return 1
      end
    end
  end
  return 0
end

function M:IsClueFromResult(AnswerId)
  for resultId, resultData in pairs(DataMgr.DetectiveResult) do
    if resultData.MainClueUnlock and self:TableContains(resultData.MainClueUnlock, AnswerId) then
      return resultData.QuestionID
    end
  end
  return nil
end

function M:ClearClueReddot(QuestionId)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveAnswer")
  for CacheDetailKey, _ in pairs(CacheDetail) do
    local answerData = DataMgr.DetectiveAnswer[CacheDetailKey]
    if answerData and answerData.QuestionID == QuestionId then
      CacheDetail[CacheDetailKey] = false
    end
  end
end

function M:TableContains(tbl, val)
  for _, v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end

return M
