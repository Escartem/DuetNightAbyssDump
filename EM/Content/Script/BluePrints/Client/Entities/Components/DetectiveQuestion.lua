local Component = {}

function Component:DetectiveQuestionCommit(QuestionId, Answers, Callback)
  DebugPrint("DetectiveQuestionCommit", QuestionId, Answers)
  
  local function Cb(ErrCode, Result)
    DebugPrint("DetectiveQuestionCommit Cb", ErrorCode:Name(ErrCode), Result)
    if Callback then
      Callback(ErrCode, Result)
    end
    if 0 == ErrCode then
      self:DoResultTaskNodeCallback(Result)
    end
  end
  
  self:CallServer("RpcDetectiveQuestionCommit", Cb, QuestionId, Answers)
end

function Component:DetectiveQuestionInfer(Answers, Callback)
  DebugPrint("DetectiveQuestionInfer", Answers)
  
  local function Cb(ErrCode, NewAnswer)
    DebugPrint("DetectiveQuestionInfer Cb", ErrorCode:Name(ErrCode), NewAnswer)
    if Callback then
      Callback(ErrCode, NewAnswer)
    end
    if 0 == ErrCode then
      self:DoAnswerTaskNodeCallback(NewAnswer)
    end
  end
  
  self:CallServer("RpcDetectiveQuestionInfer", Cb, Answers)
end

function Component:NotifyDetectiveAnswerUnlock(AnswerId)
  DebugPrint("NotifyDetectiveAnswerUnlock", AnswerId)
  local DetectiveMinigameUI = UIManager(self):GetUIObj("DetectiveMinigame")
  local ReasoningItemInformationUI = UIManager(self):GetUIObj("ReasoningItemInformation")
  if not DetectiveMinigameUI and not ReasoningItemInformationUI then
    UIManager(self):LoadUINew("DetectiveMinigameTips", AnswerId)
  end
  self:DoAnswerTaskNodeCallback(AnswerId)
end

function Component:NotifyDetectiveGameUnlockedNewQuestion(DetectiveQuestionId)
  DebugPrint("NotifyDetectiveGameUnlockedNewQuestion", DetectiveQuestionId)
end

function Component:DetectiveQuestionUnlockAnswer(Answer)
  DebugPrint("DetectiveQuestionUnlockAnswer", Answer)
  
  local function Cb(ErrCode)
    DebugPrint("DetectiveQuestionUnlockAnswer Cb", ErrorCode:Name(ErrCode))
    if 0 == ErrCode then
      local DetectiveMinigameUI = UIManager(self):GetUIObj("DetectiveMinigame")
      local ItemInformationUI = UIManager(self):GetUIObj("ItemInformation")
      if not DetectiveMinigameUI and not ItemInformationUI then
        UIManager(self):LoadUINew("DetectiveMinigameTips", Answer)
      end
      self:DoAnswerTaskNodeCallback(Answer)
      if not ReddotManager.GetTreeNode("DetectiveAnswer") then
        ReddotManager.AddNode("DetectiveAnswer")
      end
      local CacheKey = Answer
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveAnswer")
      if CacheDetail and nil == CacheDetail[CacheKey] then
        CacheDetail[CacheKey] = true
        ReddotManager.IncreaseLeafNodeCount("DetectiveAnswer")
      end
    end
  end
  
  local record = self.DetectiveGameUnlockedAnswersRecord
  if record[Answer] then
    return
  end
  self:CallServer("RpcDetectiveQuestionUnlockAnswer", Cb, Answer)
  EventManager:FireEvent(EventID.OnHomeBaseeBtnShowNewClue, "TaskPanel")
end

function Component:DetectiveQuestionUnlockQuestion(Question, DonotShowToast)
  DebugPrint("DetectiveQuestionUnlockQuestion", Question)
  
  local function Cb(ErrCode)
    DebugPrint("DetectiveQuestionUnlockQuestion Cb", ErrorCode:Name(ErrCode))
    if not ReddotManager.GetTreeNode("DetectiveQuestion") then
      ReddotManager.AddNode("DetectiveQuestion")
    end
    local CacheKey = Question
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveQuestion")
    if CacheDetail and nil == CacheDetail[CacheKey] then
      CacheDetail[CacheKey] = true
      ReddotManager.IncreaseLeafNodeCount("DetectiveQuestion")
    end
  end
  
  self:CallServer("RpcDetectiveQuestionUnlockQuestion", Cb, Question)
  if true ~= DonotShowToast then
    EventManager:FireEvent(EventID.OnNewDetectiveQuestion, Question)
  end
end

function Component:AddUnlockDetectiveAnswerCallback(AnswerId, Callback)
  DebugPrint("AddUnlockDetectiveAnswerCallback AnswerId", AnswerId)
  if not self.UnlockDetectiveAnswerCallback then
    self.UnlockDetectiveAnswerCallback = {}
  end
  self.UnlockDetectiveAnswerCallback[AnswerId] = Callback
end

function Component:RemoveUnlockDetectiveAnswerCallback(AnswerId)
  DebugPrint("RemoveUnlockDetectiveAnswerCallback AnswerId", AnswerId)
  if self.UnlockDetectiveAnswerCallback then
    self.UnlockDetectiveAnswerCallback[AnswerId] = nil
  end
end

function Component:DoAnswerTaskNodeCallback(AnswerId)
  if self.UnlockDetectiveAnswerCallback then
    local Callback = self.UnlockDetectiveAnswerCallback[AnswerId]
    if Callback then
      Callback(AnswerId)
    end
    self:RemoveUnlockDetectiveAnswerCallback(AnswerId)
  end
end

function Component:AddUnlockDetectiveResultCallback(ResultId, Callback)
  DebugPrint("AddUnlockDetectiveResultCallback AnswerId", ResultId)
  if not self.UnlockDetectiveResultCallback then
    self.UnlockDetectiveResultCallback = {}
  end
  self.UnlockDetectiveResultCallback[ResultId] = Callback
end

function Component:RemoveUnlockDetectiveResultCallback(ResultId)
  DebugPrint("RemoveUnlockDetectiveResultCallback ResultId", ResultId)
  if self.UnlockDetectiveResultCallback then
    self.UnlockDetectiveResultCallback[ResultId] = nil
  end
end

function Component:DoResultTaskNodeCallback(ResultId)
  if self.UnlockDetectiveResultCallback then
    local Callback = self.UnlockDetectiveResultCallback[ResultId]
    if Callback then
      Callback(ResultId)
    end
    self:RemoveUnlockDetectiveResultCallback(ResultId)
  end
end

return Component
