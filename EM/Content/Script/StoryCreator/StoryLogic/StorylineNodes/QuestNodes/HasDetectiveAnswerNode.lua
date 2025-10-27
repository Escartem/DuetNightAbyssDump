local HasDetectiveAnswerNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")

function HasDetectiveAnswerNode:Init()
  self.AnswerIds = {}
  self.FinishAnswerTable = {}
end

function HasDetectiveAnswerNode:Execute(Callback)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    TaskUtils:SetQuestExtraInfo(self.QuestChainId, self.QuestData.QuestId, {
      NodeKey = self.Key,
      Node = self,
      Description = GText("\230\137\147\229\188\128\230\142\168\231\144\134\231\149\140\233\157\162")
    })
    self:OnChooseTrack()
    
    function HasDetectiveAnswerNodeCallback(AnswerId)
      DebugPrint("HasDetectiveAnswerNode HasDetectiveAnswerNodeCallback AnswersId: " .. AnswerId)
      self.FinishAnswerTable[AnswerId] = true
      for _, IsFinish in pairs(self.FinishAnswerTable) do
        if false == IsFinish then
          return
        end
      end
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      local ReasoningUI = UIManager:GetUIObj("DetectiveMinigame")
      if ReasoningUI then
        ReasoningUI.AutoClose = true
      end
      self:ClearTaskBarNeedOpenDetectiveGame()
      Callback()
    end
    
    local DetectiveGameUnlockedAnswers = ReasoningUtils:GetInferredAnswersAndDependencies()
    local AllAnswerUnlocked = true
    for _, Id in pairs(self.AnswerIds) do
      local AnswerV = DetectiveGameUnlockedAnswers[Id]
      if nil == AnswerV then
        DebugPrint("HasDetectiveAnswerNode: False AnswersId: " .. Id)
        self.FinishAnswerTable[Id] = false
        AllAnswerUnlocked = false
        Avatar:AddUnlockDetectiveAnswerCallback(Id, HasDetectiveAnswerNodeCallback)
      else
        DebugPrint("HasDetectiveAnswerNode: True AnswersId: " .. Id)
        self.FinishAnswerTable[Id] = true
      end
    end
    if AllAnswerUnlocked then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      local ReasoningUI = UIManager:GetUIObj("DetectiveMinigame")
      if ReasoningUI then
        ReasoningUI.AutoClose = true
      end
      self:ClearTaskBarNeedOpenDetectiveGame()
      Callback()
    end
  end
end

function HasDetectiveAnswerNode:Clear()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Id in pairs(self.AnswerIds) do
      Avatar:RemoveUnlockDetectiveAnswerCallback(Id)
    end
  end
  self:ClearTaskBarNeedOpenDetectiveGame()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

function HasDetectiveAnswerNode:OnCancelTrack()
  self.IsTracking = false
  self:ClearTaskBarNeedOpenDetectiveGame()
end

function HasDetectiveAnswerNode:OnChooseTrack()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:FinishAction()
    return
  end
  local IsTracking = false
  self.CurQuestChainId = self.QuestChainId
  if Avatar.InSpecialQuest then
    self.CurQuestChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
  end
  self.CurDoingQuestId = Avatar.QuestChains[self.CurQuestChainId].DoingQuestId
  if Avatar.TrackingQuestChainId == self.CurQuestChainId then
    IsTracking = true
    self.IsTracking = true
  end
  if IsTracking then
    self:ChangeMainTaskBarInfo()
  end
end

function HasDetectiveAnswerNode:ChangeMainTaskBarInfo()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Text = TaskUIObj.Text_Tips02:GetText()
  TaskUIObj.Text_Tips02:SetText(GText("Minigame_Textmap_100304"))
  TaskUIObj.NeedOpenDetectiveGame = true
end

function HasDetectiveAnswerNode:ClearTaskBarNeedOpenDetectiveGame()
  if not self.IsTracking then
    return
  end
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    return
  end
  TaskUIObj.Text_Tips02:SetText(self.Text)
  TaskUIObj.NeedOpenDetectiveGame = false
end

function HasDetectiveAnswerNode:ClearWhenQuestSuccess()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

return HasDetectiveAnswerNode
