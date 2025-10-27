local CheckBranchQuestFinishedNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function CheckBranchQuestFinishedNode:Init()
  self.BranchQuestFinishOptions = nil
  self.BranchQuestOptionTable = nil
  self.NeedFinishCount = 0
  self.FinishedCount = 0
  self.InportInfos = {}
  self.IsBranchSetCountInfo = false
  self.CurQuestChainId = 0
  self.CurDoingQuestId = 0
end

function CheckBranchQuestFinishedNode:Start(Context, InportInfo)
  self.Context = Context
  if self.BranchQuestOptionTable == nil then
    self.BranchQuestOptionTable = {}
    for k, v in pairs(self.BranchQuestFinishOptions) do
      if v.IsNeedFinish == true then
        self.BranchQuestOptionTable["Branch_" .. tostring(k)] = false
        self.NeedFinishCount = self.NeedFinishCount + 1
      end
    end
  end
  if self.BranchQuestOptionTable[InportInfo] ~= nil then
    self.BranchQuestOptionTable[InportInfo] = true
    self.FinishedCount = self.FinishedCount + 1
  end
  if IsEmptyTable(self.InportInfos) then
    table.insert(self.InportInfos, InportInfo)
  else
    local IsExisted = false
    for _, v in pairs(self.InportInfos) do
      if v == InportInfo then
        IsExisted = true
      end
    end
    if not IsExisted then
      table.insert(self.InportInfos, InportInfo)
    end
  end
  self:CheckBranchStartSetCountInfo()
  TaskUtils:SetQuestExtraInfo(self.QuestChainId, self.QuestData.QuestId, {
    NodeKey = self.Key,
    Node = self,
    CurrentFinishedCount = self.FinishedCount,
    NeedFinishCount = self.NeedFinishCount
  })
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.CurQuestChainId = self.QuestChainId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    self.CurQuestChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
  end
  if Avatar.QuestChains[self.CurQuestChainId] then
    self.CurDoingQuestId = Avatar.QuestChains[self.CurQuestChainId].DoingQuestId
  end
  self:UpdateWorldTaskPanel(InportInfo)
end

function CheckBranchQuestFinishedNode:CheckBranchStartSetCountInfo()
  local QuestExtraInfo = TaskUtils:GetQuestExtraInfo(self.QuestChainId, self.QuestData.QuestId)
  if not QuestExtraInfo or nil == QuestExtraInfo or IsEmptyTable(QuestExtraInfo) then
    return
  end
  for _, Data in pairs(QuestExtraInfo) do
    if Data.Node and Data.Node.Type == "BranchQuestStartNode" and Data.IsUpdateCountInfo then
      self.IsBranchSetCountInfo = Data.IsUpdateCountInfo
    end
  end
end

function CheckBranchQuestFinishedNode:OnCancelTrack()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    return
  end
end

function CheckBranchQuestFinishedNode:OnChooseTrack()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    return
  end
  if self.InportInfos then
    for _, InportInfo in pairs(self.InportInfos) do
      local TaskUIObj = TaskUtils:GetTaskBarWidget()
      if not TaskUIObj then
        return
      end
      if self.IsBranchSetCountInfo and self.BranchQuestOptionTable[InportInfo] ~= nil then
        TaskUIObj:ChangeMainTaskBarCountInfoByBranchQuestNode(self.QuestChainId, self.QuestData.QuestId)
      end
      if TaskUIObj.SubTaskWidgetsTable and not IsEmptyTable(TaskUIObj.SubTaskWidgetsTable) and IsValid(TaskUIObj.SubTaskWidgetsTable[InportInfo]) and IsValid(TaskUIObj.SubTaskWidgetsTable[InportInfo]) then
        TaskUIObj.SubTaskWidgetsTable[InportInfo]:PlayAnimation(TaskUIObj.SubTaskWidgetsTable[InportInfo].CompletionTask)
      end
    end
  end
end

function CheckBranchQuestFinishedNode:UpdateWorldTaskPanel(InportInfo)
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not TaskUIObj then
    return
  end
  if self.IsBranchSetCountInfo and self.BranchQuestOptionTable[InportInfo] ~= nil then
    TaskUIObj:ChangeMainTaskBarCountInfoByBranchQuestNode(self.QuestChainId, self.QuestData.QuestId)
  end
  if 0 == TaskUIObj.VBox_SubTasks:GetChildrenCount() then
    self:TryFinishCurrentNode()
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.TrackingQuestChainId ~= self.CurQuestChainId then
    self:TryFinishCurrentNode()
    return
  end
  if TaskUIObj.SubTaskWidgetsTable and not IsEmptyTable(TaskUIObj.SubTaskWidgetsTable) and IsValid(TaskUIObj.SubTaskWidgetsTable[InportInfo]) then
    self.BlackScreenUIDurationTimer = GWorld.GameInstance:AddTimer(0.5, function()
      if IsValid(TaskUIObj.SubTaskWidgetsTable[InportInfo]) then
        TaskUIObj.SubTaskWidgetsTable[InportInfo]:PlayAnimation(TaskUIObj.SubTaskWidgetsTable[InportInfo].CompletionTask)
        TaskUIObj.SubTaskWidgetsTable[InportInfo]:BindToAnimationFinished(TaskUIObj.SubTaskWidgetsTable[InportInfo].CompletionTask, {
          TaskUIObj.SubTaskWidgetsTable[InportInfo],
          function()
            TaskUIObj.SubTaskWidgetsTable[InportInfo]:UnbindAllFromAnimationFinished(TaskUIObj.SubTaskWidgetsTable[InportInfo].CompletionTask)
          end
        })
      end
      self:TryFinishCurrentNode()
    end, false, 0, nil, false)
  end
end

function CheckBranchQuestFinishedNode:TryFinishCurrentNode()
  local NeedFinishCount = 0
  for _, IsFinished in pairs(self.BranchQuestOptionTable) do
    if not IsFinished then
      NeedFinishCount = NeedFinishCount + 1
    end
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and 0 == NeedFinishCount and Avatar.TrackingQuestChainId == self.CurQuestChainId then
    GWorld.GameInstance:AddTimer(0.5, function()
      local TaskUIObj = TaskUtils:GetTaskBarWidget()
      if not IsEmptyTable(TaskUIObj.SubTaskWidgetsTable) then
        for Name, Widget in pairs(TaskUIObj.SubTaskWidgetsTable) do
          if IsValid(Widget) and TaskUIObj.VBox_SubTasks:HasChild(Widget) then
            Widget:PlayAnimation(Widget.Out)
          end
        end
      end
    end, false, 0, nil, false)
    GWorld.GameInstance:AddTimer(1, function()
      local TaskUIObj = TaskUtils:GetTaskBarWidget()
      if not IsEmptyTable(TaskUIObj.SubTaskWidgetsTable) then
        for Name, Widget in pairs(TaskUIObj.SubTaskWidgetsTable) do
          if IsValid(Widget) and TaskUIObj.VBox_SubTasks:HasChild(Widget) then
            TaskUIObj.VBox_SubTasks:RemoveChild(Widget)
            TaskUIObj.SubTaskWidgetsTable[Name] = nil
          end
        end
        TaskUIObj.SubTaskWidgetsTable = {}
      end
      if not self.HasFinished then
        self:FinishAction()
      end
    end, false, 0, nil, false)
  elseif Avatar and 0 == NeedFinishCount and Avatar.TrackingQuestChainId ~= self.CurQuestChainId and not self.HasFinished then
    self:FinishAction()
  end
  self.HasStarted = false
end

function CheckBranchQuestFinishedNode:FinishAction()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if TaskUIObj then
    TaskUIObj:TriggerQuestTrackPanelTips(true)
  end
  self:Finish()
end

function CheckBranchQuestFinishedNode:Clear()
end

function CheckBranchQuestFinishedNode:ClearWhenQuestSuccess()
  self.FinishedCount = 0
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
end

function CheckBranchQuestFinishedNode:ClearWhenQuestFail()
  self.FinishedCount = 0
  TaskUtils:ClearQuestExtraInfo(self.CurQuestChainId, self.CurDoingQuestId, self.Key)
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if not IsEmptyTable(TaskUIObj.SubTaskWidgetsTable) then
    for Name, Widget in pairs(TaskUIObj.SubTaskWidgetsTable) do
      if IsValid(Widget) and TaskUIObj.VBox_SubTasks:HasChild(Widget) then
        TaskUIObj.VBox_SubTasks:RemoveChild(Widget)
        TaskUIObj.SubTaskWidgetsTable[Name] = nil
      end
    end
    TaskUIObj.SubTaskWidgetsTable = {}
  end
end

return CheckBranchQuestFinishedNode
