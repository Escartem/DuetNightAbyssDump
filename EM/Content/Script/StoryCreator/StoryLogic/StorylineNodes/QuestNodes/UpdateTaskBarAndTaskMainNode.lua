local UpdateTaskBarAndTaskMainNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")

function UpdateTaskBarAndTaskMainNode:Init()
  self.NewDescription = ""
  self.NewDetail = ""
  self.CurQuestChainId = 0
  self.CurDoingQuestId = 0
  self.SubTaskTargetIndex = 0
end

function UpdateTaskBarAndTaskMainNode:Start(Context)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:FinishAction()
    return
  end
  self.Context = Context
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    self.CurQuestChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
  else
    self.CurQuestChainId = self.QuestChainId
  end
  if Avatar.QuestChains[self.CurQuestChainId] then
    self.CurDoingQuestId = Avatar.QuestChains[self.CurQuestChainId].DoingQuestId
  else
    self.CurDoingQuestId = self.QuestData.QuestId
  end
  TaskUtils:SetQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, {
    NodeKey = self.Key,
    Node = self,
    Description = self.NewDescription,
    Detail = self.NewDetail,
    SubTaskIndex = self.SubTaskTargetIndex
  })
  self:OnChooseTrack()
end

function UpdateTaskBarAndTaskMainNode:OnCancelTrack()
end

function UpdateTaskBarAndTaskMainNode:OnChooseTrack()
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
  if Avatar.QuestChains[self.CurQuestChainId] then
    self.CurDoingQuestId = Avatar.QuestChains[self.CurQuestChainId].DoingQuestId
  end
  if Avatar.TrackingQuestChainId == self.CurQuestChainId then
    IsTracking = true
  end
  if IsTracking then
    self:ChangeMainTaskBarInfo()
  else
    self:FinishAction()
  end
end

function UpdateTaskBarAndTaskMainNode:ChangeMainTaskBarInfo()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    self:FinishAction()
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:FinishAction()
    return
  end
  local ChainId = self.CurQuestChainId
  local DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  local IsInSpecialQuest = Avatar.InSpecialQuest
  local QuestExtraInfo = TaskUtils:GetQuestExtraInfo(ChainId, DoingQuestId)
  if not QuestExtraInfo or nil == QuestExtraInfo or IsEmptyTable(QuestExtraInfo) then
    self:FinishAction()
    return
  end
  local NewDescrible = ""
  if nil ~= self.Key and QuestExtraInfo[self.Key] then
    NewDescrible = QuestExtraInfo[self.Key].Description
  else
    for _, Data in pairs(QuestExtraInfo) do
      if Data.Node and Data.Node.Type == "UpdateTaskBarAndTaskMainNode" then
        NewDescrible = Data.Description
        break
      end
    end
  end
  if "" == NewDescrible then
    self:FinishAction()
    return
  end
  NewDescrible = GText(NewDescrible)
  
  local function SetTaskContentUIInfo(InFlag, InTaskDescribe)
    if InFlag then
      TaskUIObj.CurSpecialTaskInfo.TaskDescribe = InTaskDescribe
      TaskUIObj.Text_TaskContent:SetText(TaskUIObj.CurSpecialTaskInfo.TaskDescribe)
    else
      TaskUIObj.CurTaskInfo.TaskDescribe = InTaskDescribe
      TaskUIObj.Text_TaskContent:SetText(TaskUIObj.CurTaskInfo.TaskDescribe)
    end
    self:FinishAction()
  end
  
  if self.SubTaskTargetIndex > 0 and TaskUIObj.SubTaskWidgetsTable["Branch_" .. tostring(self.SubTaskTargetIndex)] then
    local TargetSubWidget = TaskUIObj.SubTaskWidgetsTable["Branch_" .. tostring(self.SubTaskTargetIndex)]
    if IsValid(TargetSubWidget) then
      TargetSubWidget:BindToAnimationFinished(TargetSubWidget.CompletionTask, {
        TargetSubWidget,
        function()
          TargetSubWidget:UnbindAllFromAnimationFinished(TargetSubWidget.CompletionTask)
          TargetSubWidget.Text_Describe:SetText(NewDescrible)
          EMUIAnimationSubsystem:EMPlayAnimation(TargetSubWidget, TargetSubWidget.Refresh)
          self:FinishAction()
        end
      })
      EMUIAnimationSubsystem:EMPlayAnimation(TargetSubWidget, TargetSubWidget.CompletionTask)
    end
  elseif TaskUIObj:IsAnimationPlaying(TaskUIObj.Main_Task_In) then
    TaskUIObj:BindToAnimationFinished(TaskUIObj.Main_Task_In, {
      TaskUIObj,
      function()
        TaskUIObj:UnbindAllFromAnimationFinished(TaskUIObj.Main_Task_In)
        SetTaskContentUIInfo(IsInSpecialQuest, NewDescrible)
      end
    })
  elseif TaskUIObj:IsAnimationPlaying(TaskUIObj.Main_Task_Out) then
    TaskUIObj:BindToAnimationFinished(TaskUIObj.Main_Task_Out, {
      TaskUIObj,
      function()
        TaskUIObj:UnbindAllFromAnimationFinished(TaskUIObj.Main_Task_Out)
        SetTaskContentUIInfo(IsInSpecialQuest, NewDescrible)
      end
    })
  else
    if IsInSpecialQuest then
      TaskUIObj.CurSpecialTaskInfo.TaskDescribe = NewDescrible
      TaskUIObj.Text_TaskContent:SetText(TaskUIObj.CurSpecialTaskInfo.TaskDescribe)
    else
      TaskUIObj.CurTaskInfo.TaskDescribe = NewDescrible
      TaskUIObj.Text_TaskContent:SetText(TaskUIObj.CurTaskInfo.TaskDescribe)
    end
    TaskUIObj:PlayAnimation(TaskUIObj.Main_Task_In)
    TaskUIObj:BindToAnimationFinished(TaskUIObj.Main_Task_In, {
      TaskUIObj,
      function()
        TaskUIObj:UnbindAllFromAnimationFinished(TaskUIObj.Main_Task_In)
        self:FinishAction()
      end
    })
  end
end

function UpdateTaskBarAndTaskMainNode:FinishAction()
  if self.HasFinished then
    return
  end
  self:Finish()
end

function UpdateTaskBarAndTaskMainNode:Clear()
end

function UpdateTaskBarAndTaskMainNode:OnQuestlineFail()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

function UpdateTaskBarAndTaskMainNode:ClearWhenQuestSuccess()
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

return UpdateTaskBarAndTaskMainNode
