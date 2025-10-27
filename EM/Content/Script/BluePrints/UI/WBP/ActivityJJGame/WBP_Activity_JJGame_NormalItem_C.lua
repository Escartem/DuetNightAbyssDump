require("UnLua")
local NormalTaskNewReddotName = "JJGameTask_Normal_New"
local NormalTaskBPPath = "/Game/UI/WBP/Activity/Widget/JJGame/Normal/WBP_Activity_JJGame_NormalSubItem.WBP_Activity_JJGame_NormalSubItem"
local TaskType = {
  Daily = {1, 2},
  Cycle = 3,
  Achievement = 4
}
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.MidTermConst = DataMgr.MidTermGoalConstant
  self.List_Task:SetAllowOverscroll(false)
  self.List_Task:DisAbleScroll(true)
end

function M:Destruct()
  if self.HasNewTask then
    self:TryClearNormalTaskNewReddot()
  end
end

function M:Init(TaskConfig)
  self.TaskConfig = TaskConfig
  self.Owner = TaskConfig.Owner
  self.JJGameBase = self.Owner.Owner
  self.YesterdayRewardGot = TaskConfig.YesterdayRewardGot
  self.Text_Title:SetText(GText(TaskConfig.Name))
  self._Avatar = GWorld:GetAvatar()
  self:UpdateTaskList()
  self:UpdateNormalTaskTabNewReddot()
end

function M:UpdateNormalTaskTabNewReddot()
  if not self.Owner then
    return
  end
  if self.HasNewTask then
    self.Owner.Owner.Com_Tab:ShowTabRedDot(1, true)
  else
    self.Owner.Owner.Com_Tab:ShowTabRedDot(1, false)
  end
end

function M:UpdateTaskList()
  self.List_Task:ClearListItems()
  self.TaskContentList = {}
  local SortedTaskList = self:SortTaskList(self._Avatar.MidTermTasks)
  for i, Task in pairs(SortedTaskList) do
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if not TaskData then
      print("TaskData is nil, Task.UniqueID = ", Task.UniqueID)
      Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
    else
      local TaskItem
      if type(self.TaskConfig.TaskType) == "table" then
        if TaskData.TaskType == self.TaskConfig.TaskType[1] then
          TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.DailyRewardPoint_1.ConstantValue, TaskData.TaskDes)
        elseif TaskData.TaskType == self.TaskConfig.TaskType[2] then
          TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.DailyRewardPoint_2.ConstantValue, TaskData.TaskDes)
        end
      elseif TaskData.TaskType == self.TaskConfig.TaskType then
        TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.CycleRewardPoint.ConstantValue, TaskData.TaskDes)
        TaskItem.MidTermTasksRecord = self._Avatar.MidTermTasksRecord[Task.UniqueID]
      end
      if TaskItem then
        TaskItem.TaskProp = Task
        TaskItem.TaskConfig = TaskData
        table.insert(self.TaskContentList, TaskItem)
        self.List_Task:AddItem(TaskItem)
      end
    end
  end
  self.List_Task:RequestPlayEntriesAnim()
  if self.TaskConfig.Name == "UI_Event_MidTerm_DailyTask" then
    self.List_Task:SetFocus()
  end
  self:TryIncreaceNormalTaskNewReddot()
end

function M:UpdateTaskList_M()
  self.List_Task:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.VB_Task:ClearChildren()
  self.TaskContentList = {}
  local SortedTaskList = self:SortTaskList(self._Avatar.MidTermTasks)
  for i, Task in pairs(SortedTaskList) do
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if not TaskData then
      print("TaskData is nil, Task.UniqueID = ", Task.UniqueID)
    else
      local TaskItemObj = UIManager(self):CreateWidget(NormalTaskBPPath)
      local TaskItem
      if type(self.TaskConfig.TaskType) == "table" then
        if TaskData.TaskType == self.TaskConfig.TaskType[1] then
          TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.DailyRewardPoint_1.ConstantValue, TaskData.TaskDes)
        elseif TaskData.TaskType == self.TaskConfig.TaskType[2] then
          TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.DailyRewardPoint_2.ConstantValue, TaskData.TaskDes)
        end
      elseif TaskData.TaskType == self.TaskConfig.TaskType then
        TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.CycleRewardPoint.ConstantValue, TaskData.TaskDes)
        TaskItem.MidTermTasksRecord = self._Avatar.MidTermTasksRecord[Task.UniqueID]
      end
      if TaskItem then
        TaskItem.TaskProp = Task
        TaskItem.TaskConfig = TaskData
        table.insert(self.TaskContentList, TaskItem)
        self.VB_Task:AddChild(TaskItemObj)
        TaskItemObj:OnListItemObjectSet(TaskItem)
      end
    end
  end
  if self.TaskConfig.Name == "UI_Event_MidTerm_DailyTask" then
    self.VB_Task:GetChildAt(0):SetFocus()
  end
  self:TryIncreaceNormalTaskNewReddot()
end

function M:SortTaskList(TaskList)
  local SortedTaskList = {}
  for k, v in pairs(TaskList) do
    table.insert(SortedTaskList, {
      key = tonumber(k),
      value = v
    })
  end
  table.sort(SortedTaskList, function(a, b)
    return a.key < b.key
  end)
  local result = {}
  for _, pair in ipairs(SortedTaskList) do
    table.insert(result, pair.value)
  end
  return result
end

function M:TryIncreaceNormalTaskNewReddot()
  for _, TaskItem in pairs(self.TaskContentList) do
    if not self.YesterdayRewardGot and (TaskItem.TaskConfig.TaskType == TaskType.Daily[1] or TaskItem.TaskConfig.TaskType == TaskType.Daily[2]) then
    else
      local CacheKey = TaskItem.TaskProp.UniqueID
      local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalTaskNewReddotName)
      if CacheData and nil == CacheData[CacheKey] then
        CacheData[CacheKey] = true
        ReddotManager.IncreaseLeafNodeCount(NormalTaskNewReddotName)
      end
      if CacheData and true == CacheData[CacheKey] then
        self.HasNewTask = true
      end
    end
  end
end

function M:TryClearNormalTaskNewReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalTaskNewReddotName)
  if CacheData then
    for key, _ in pairs(CacheData) do
      CacheData[key] = false
    end
  end
  ReddotManager.ClearLeafNodeCount(NormalTaskNewReddotName)
  self.HasNewTask = false
end

function M:NewItemContent(TaskType, TaskId, TaskPoint, TaskDes)
  local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
  ItemContent.Owner = self
  ItemContent.TaskType = TaskType
  ItemContent.Id = TaskId
  ItemContent.Point = TaskPoint
  ItemContent.Desc = TaskDes
  ItemContent.YesterdayRewardGot = self.YesterdayRewardGot
  return ItemContent
end

function M:OnAchvFinished(TaskId)
  if not self.TaskContentList then
    return
  end
  for _, TaskItem in pairs(self.TaskContentList) do
    if TaskItem.SelfWidget and TaskItem.SelfWidget.OnAchvFinished then
      TaskItem.SelfWidget:OnAchvFinished(TaskId)
    end
  end
end

function M:OnMidTermTaskProgressChange(TaskId, Progress)
  if not self.TaskContentList then
    return
  end
  for _, TaskItem in pairs(self.TaskContentList) do
    if TaskItem.SelfWidget and TaskItem.SelfWidget.OnMidTermTaskProgressChange then
      TaskItem.SelfWidget:OnMidTermTaskProgressChange(TaskId, Progress)
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:BP_GetDesiredFocusTarget()
  return self.List_Task
end

return M
