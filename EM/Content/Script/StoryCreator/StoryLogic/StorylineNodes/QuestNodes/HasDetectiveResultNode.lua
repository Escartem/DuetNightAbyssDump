local HasDetectiveResultNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function HasDetectiveResultNode:Init()
  self.ResultIds = {}
  self.FinishResultTable = {}
end

function HasDetectiveResultNode:Execute(Callback)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    TaskUtils:SetQuestExtraInfo(self.QuestChainId, self.QuestData.QuestId, {
      NodeKey = self.Key,
      Node = self,
      Description = GText("\230\137\147\229\188\128\230\142\168\231\144\134\231\149\140\233\157\162")
    })
    self:OnChooseTrack()
    
    function HasDetectiveResultNodeCallback(ResultId)
      DebugPrint("HasDetectiveResultNode HasDetectiveResultNodeCallback ResultId: " .. ResultId)
      self.FinishResultTable[ResultId] = true
      for _, IsFinish in pairs(self.FinishResultTable) do
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
    
    local DetectiveGameUnlockedResults = Avatar.DetectiveGameUnlockedResults
    local AllResultUnlocked = true
    for _, Id in pairs(self.ResultIds) do
      local ResultV = DetectiveGameUnlockedResults[Id]
      if nil == ResultV then
        DebugPrint("HasDetectiveResultNode: False ResultId: " .. Id)
        self.FinishResultTable[Id] = false
        AllResultUnlocked = false
        Avatar:AddUnlockDetectiveResultCallback(Id, HasDetectiveResultNodeCallback)
      else
        DebugPrint("HasDetectiveResultNode: True ResultId: " .. Id)
        self.FinishResultTable[Id] = true
      end
    end
    if AllResultUnlocked then
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

function HasDetectiveResultNode:Clear()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Id in pairs(self.ResultIds) do
      Avatar:RemoveUnlockDetectiveResultCallback(Id)
    end
  end
  self:ClearTaskBarNeedOpenDetectiveGame()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

function HasDetectiveResultNode:OnCancelTrack()
  self.IsTracking = false
  self:ClearTaskBarNeedOpenDetectiveGame()
end

function HasDetectiveResultNode:OnChooseTrack()
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

function HasDetectiveResultNode:ChangeMainTaskBarInfo()
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

function HasDetectiveResultNode:ClearTaskBarNeedOpenDetectiveGame()
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

function HasDetectiveResultNode:ClearWhenQuestSuccess()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

return HasDetectiveResultNode
