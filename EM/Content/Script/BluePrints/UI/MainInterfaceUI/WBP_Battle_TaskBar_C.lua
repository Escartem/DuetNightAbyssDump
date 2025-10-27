local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.BP_UIState_C")
local QuestState = {Unlock = 1, Doing = 2}

function M:Initialize(Initializer)
  self.CurTaskInfo = {}
  self.CurSpecialTaskInfo = {}
  self.IsInExplore = false
  self.ListenNewQuestChainDataTimer = nil
  self.Platform = "PC"
  self.IsInLoading = false
end

function M:Construct()
  self.Super.Construct(self)
  self.Text_Complete:SetText(GText("UI_QUEST_SUCCESS"))
  self.Text_NewTask:SetText(GText("UI_QUEST_NEW"))
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:ListenForInputAction("ActiveGuide", EInputEvent.IE_Pressed, false, {
      self,
      self.OnClickedButtonArea
    })
  else
    self.Button_Area.OnClicked:Add(self, self.OnClickedButtonArea)
    self.Button_Area.OnPressed:Add(self, self.OnPressedButtonArea)
    self.Button_Area.OnReleased:Add(self, self.OnReleasedButtonArea)
    self.Platform = "Mobile"
  end
  EventManager:AddEvent(EventID.OnReceiveTask, self, self.SetTaskIconAndName)
  EventManager:AddEvent(EventID.StartRougeCanonMiniGame, self, self.SetRougeCanonInfo)
  EventManager:AddEvent(EventID.EndRougeCanonMiniGame, self, self.RemoveRougeCanonInfo)
  EventManager:AddEvent(EventID.QuestChainFinished, self, self.QuestChainFinished)
  EventManager:AddEvent(EventID.OnUpdateQuestChain, self, self.UpdateQuestChain)
  EventManager:AddEvent(EventID.OnDungeonTaskProgress, self, self.OnDungeonTaskProgress)
  EventManager:AddEvent(EventID.OnChangeKeyBoardSet, self, self.RefreshKeyName)
  EventManager:AddEvent(EventID.OnSwitchGamepadSet, self, self.SetGamepadIcons)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, self, self.OnCloseLoading)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainStart, self, self.OnInLoading)
  self.IsDestroied = false
  self:AddInputMethodChangedListen()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:Destruct()
  self.Super.Destruct(self)
  EventManager:RemoveEvent(EventID.OnReceiveTask, self)
  EventManager:RemoveEvent(EventID.StartRougeCanonMiniGame, self)
  EventManager:RemoveEvent(EventID.EndRougeCanonMiniGame, self)
  EventManager:RemoveEvent(EventID.QuestChainFinished, self)
  EventManager:RemoveEvent(EventID.OnUpdateQuestChain, self)
  EventManager:RemoveEvent(EventID.OnDungeonTaskProgress, self)
  EventManager:RemoveEvent(EventID.OnChangeKeyBoardSet, self)
  EventManager:RemoveEvent(EventID.OnSwitchGamepadSet, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainStart, self)
  self.IsDestroied = true
  if self.ListenNewQuestChainDataTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenNewQuestChainDataTimer)
  end
  if self:IsListeningForInputAction("ActiveGuide") then
    self:StopListeningForInputAction("ActiveGuide", EInputEvent.IE_Pressed)
  end
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
end

function M:OnCloseLoading()
  self.IsInLoading = false
  GWorld.GameInstance:AddTimer(3, function()
    if self.LoadingCallback and self.CacheOldQuestChainId and self.CacheOldQuestId then
      self.LoadingCallback(self, self.CacheOldQuestChainId, self.CacheOldQuestId)
      self.LoadingCallback = nil
      self.CacheOldQuestChainId = nil
      self.CacheOldQuestId = nil
    end
  end, false)
end

function M:OnInLoading()
  self.IsInLoading = true
  if self.Panel_Tips2:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    self:PlayAnimation(self.Tooltip2_Out)
    if self.Platform ~= "Mobile" then
      self:PlayAnimation(self.Tooltip_In)
    end
  end
end

function M:SetTaskIconAndName(TaskIconPath, TextTitle, TaskContent)
  self.Text_TaskContent:SetText("")
  self.Text_TaskContent:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
  self.VBox_SubTasks:SetVisibility(ESlateVisibility.Collapsed)
  if not (TaskIconPath and TextTitle) or not TaskContent then
    return
  end
  self.ReceiveTaskContent = TaskContent
  local CurContent = TaskContent
  if string.find(GText(CurContent), "%\239\188\136%%d/%%d%\239\188\137") then
    if not self.CurProgress then
      self.CurProgress = GameState(self).CurProgressCache or 0
    end
    if not self.TotalProgress then
      self.TotalProgress = GameState(self).TotalProgressCache or 1
    end
    CurContent = string.format(GText(CurContent), self.CurProgress, self.TotalProgress)
  else
    CurContent = GText(CurContent)
  end
  local Title = GText(TextTitle)
  local Content = CurContent
  if not Title or not Content then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Text_TaskName:SetText(Title)
  self.Text_TaskContent:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_TaskContent:SetText(Content)
  if self.Visibility == ESlateVisibility.Collapsed then
    self:SetVisibilityEx(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.VBox_TaskBar.Visibility == ESlateVisibility.Collapsed then
    self.VBox_TaskBar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  local IsInEnterRouge = Avatar:IsInEnterRougeLike()
  local IsInRouge = Avatar:IsInRougeLike()
  local IsInTrial = GameState.GameModeType == "Trial"
  local IsInAbyss = GameState.GameModeType == "Abyss"
  if IsInRouge or IsInEnterRouge or IsInTrial or IsInAbyss then
  else
  end
  if GameState:IsInDungeon() and self.Panel_Lock:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Panel_Lock:SetVisibility(ESlateVisibility.Collapsed)
  end
  if "" ~= TaskIconPath then
    self.Icon_GuidePoint:SetVisibility(ESlateVisibility.Visible)
    local GuideIconTexture = LoadObject(TaskIconPath)
    if GuideIconTexture then
      self.Icon_GuidePoint:SetBrushResourceObject(GuideIconTexture)
    end
  else
    self.Icon_GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local LoadingUI = GameInstance:GetLoadingUI()
  if LoadingUI then
    EventManager:AddEvent(EventID.CloseLoading, self, function()
      self:PlayAnimation(self.Main_Task_In)
      EventManager:RemoveEvent(EventID.CloseLoading, self)
    end)
  else
    self:PlayAnimation(self.Main_Task_In)
  end
end

function M:OnDungeonTaskProgress(CurProgress, TotalProgress)
  self.CurProgress = CurProgress
  self.TotalProgress = TotalProgress
  if self.ReceiveTaskContent ~= nil and string.find(GText(self.ReceiveTaskContent), "%\239\188\136%%d/%%d%\239\188\137") then
    local CurStr = string.format(GText(self.ReceiveTaskContent), self.CurProgress, self.TotalProgress)
    self.Text_TaskContent:SetText(CurStr)
  end
end

function M:SetCurTaskBarInfo(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.CurTaskInfo = self.CurTaskInfo or {}
  local CurQuestChainId = QuestChainId
  local CurQuestId
  if Avatar.QuestChains[QuestChainId] and Avatar.QuestChains[QuestChainId].DoingQuestId then
    CurQuestId = Avatar.QuestChains[QuestChainId].DoingQuestId
  end
  local CurQuestChainConfig, CurTaskName
  if DataMgr.QuestChain[CurQuestChainId] then
    CurQuestChainConfig = DataMgr.QuestChain[CurQuestChainId]
    CurTaskName = GText(CurQuestChainConfig.QuestChainName)
  end
  local CurTaskDescribe, IsChainFirstTask, IsChainLastTask, IsChapterStart, IsChapterEnd, QuestUIId
  if CurQuestChainId and CurQuestId then
    local Count = self:GetBranchQuestCountInfo(CurQuestChainId, CurQuestId)
    if "" == Count then
      self.VBox_SubTasks:ClearChildren()
    end
    local TaskDetailInfo = TaskUtils:GetQuestDetail(CurQuestChainId, CurQuestId)
    if not TaskDetailInfo then
      CurTaskDescribe = GText("UI_QUEST_UNKNOWN")
      IsChainFirstTask = false
      IsChainLastTask = false
      IsChapterStart = false
      IsChapterEnd = false
      QuestUIId = nil
    else
      CurTaskDescribe = TaskDetailInfo.QuestDescription
      IsChainFirstTask = TaskDetailInfo.bIsStartQuest
      IsChainLastTask = TaskDetailInfo.bIsEndQuest
      IsChapterStart = TaskDetailInfo.bIsStartChapter
      IsChapterEnd = TaskDetailInfo.bIsEndChapter
      QuestUIId = TaskDetailInfo.QuestUIId
    end
  end
  if not CurTaskDescribe or not DataMgr.TextMap[CurTaskDescribe] then
    ScreenPrint(string.format("TaskBar: \228\187\187\229\138\161\230\160\143\228\187\187\229\138\161\230\143\143\232\191\176\228\184\141\229\173\152\229\156\168TextMap: %s", CurTaskDescribe))
    CurTaskDescribe = GText("UI_QUEST_UNKNOWN")
  end
  local RetTaskDescribe = GText(CurTaskDescribe)
  self.CurTaskInfo.QuestChainId = CurQuestChainId
  self.CurTaskInfo.QuestId = CurQuestId
  self.CurTaskInfo.QuestChainConfig = CurQuestChainConfig
  self.CurTaskInfo.TaskName = CurTaskName
  self.CurTaskInfo.TaskDescribe = RetTaskDescribe
  self.CurTaskInfo.IsChainFirstTask = IsChainFirstTask
  self.CurTaskInfo.IsChainLastTask = IsChainLastTask
  self.CurTaskInfo.IsChapterStart = IsChapterStart
  self.CurTaskInfo.IsChapterEnd = IsChapterEnd
  self.CurTaskInfo.QuestUIId = QuestUIId
end

function M:GetBranchQuestCountInfo(QuestChainId, QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChainId = QuestChainId
  local DoingQuestId = QuestId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  local Info = TaskUtils:GetQuestExtraInfo(ChainId, DoingQuestId)
  if not Info then
    return ""
  end
  local UpdateCountInf = ""
  local IsUpdateMainBar = false
  for _, Data in pairs(Info) do
    if Data.Node and Data.Node.Type == "BranchQuestStartNode" and Data.IsUpdateCountInfo then
      UpdateCountInf = "(" .. "0" .. "/" .. Data.NeedFinishCount .. ")"
      IsUpdateMainBar = Data.IsUpdateCountInfo and Data.NeedFinishCount > 0
    end
  end
  if IsUpdateMainBar then
    local IsValid = true
    for _, Data in pairs(Info) do
      if Data.Node and Data.Node.Type == "CheckBranchQuestFinishedNode" then
        UpdateCountInf = "(" .. Data.CurrentFinishedCount .. "/" .. Data.NeedFinishCount .. ")"
        IsValid = Data.CurrentFinishedCount <= Data.NeedFinishCount and Data.NeedFinishCount > 0
      end
    end
    if IsValid then
      return UpdateCountInf
    end
  end
  return ""
end

function M:TrySetUpdateTaskBarNodeInfo(QuestChainId, QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChainId = QuestChainId
  local DoingQuestId = QuestId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  local Info = TaskUtils:GetQuestExtraInfo(ChainId, DoingQuestId)
  if not Info then
    return
  end
  for _, Data in pairs(Info) do
    if Data.Node and Data.Node.Type == "UpdateTaskBarAndTaskMainNode" then
      self.CurTaskInfo.TaskDescribe = GText(Data.Description)
    end
  end
end

function M:TrySetSubTaskCountInfo(CurQuestChainId, CurQuestId, InNodeKey)
  local ChildWidgetNum = self.VBox_SubTasks:GetChildrenCount()
  if 0 == ChildWidgetNum then
    return false
  else
    for i = 0, ChildWidgetNum - 1 do
      local ChildWidget = self.VBox_SubTasks:GetChildAt(i)
      if IsValid(ChildWidget) and ChildWidget:CheckIsEqualKey(InNodeKey) then
        local ExportInfo = TaskUtils:GetQuestCountExtraInfoString(CurQuestChainId, CurQuestId, InNodeKey)
        if ExportInfo then
          ChildWidget.Text_Describe:SetText(ChildWidget.SourceGText .. ExportInfo)
          return true
        end
      end
    end
    return false
  end
end

function M:UpdateTaskExtraInfo(OpType, ExtraInfo)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local IsTracking = false
  if nil == ExtraInfo or nil == ExtraInfo[3] then
    return
  end
  local Count, Max = ExtraInfo[1], ExtraInfo[2]
  local QuestChainId = tonumber(ExtraInfo[3])
  local QuestId = ExtraInfo[4]
  local Node = ExtraInfo[5]
  local ChainId = QuestChainId
  local DoingQuestId = QuestId
  local InSpecialQuest = Avatar.InSpecialQuest
  if InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  if Avatar.TrackingQuestChainId == ChainId then
    IsTracking = true
  end
  if "Modify" == OpType or "Add" == OpType then
    TaskUtils:SetQuestExtraInfo(ChainId, DoingQuestId, {
      NodeKey = Node.Key,
      Count = Count,
      RetCount = Max,
      Node = Node
    })
    if ChainId > 0 and DoingQuestId > 0 and IsTracking then
      self:SetCurTaskBarInfoWithExtraInfo(ChainId, DoingQuestId, Node.Key)
    end
  end
end

function M:SetCurTaskBarInfoWithExtraInfo(ChainId, DoingQuestId, NodeKey)
  local UpdateCountInfo = TaskUtils:GetQuestCountExtraInfoString(ChainId, DoingQuestId, NodeKey)
  if "" == UpdateCountInfo or nil == NodeKey then
    return
  end
  local IsUpdateBranchCountInfo = self:TrySetSubTaskCountInfo(ChainId, DoingQuestId, NodeKey)
  if not IsUpdateBranchCountInfo then
    local RetContent = ""
    local CheckEndsWithCountInfo = nil ~= string.match(self.Text_TaskContent.Text, "%(%d+/%d+%)$")
    if CheckEndsWithCountInfo then
      RetContent = string.gsub(self.Text_TaskContent.Text, "%(%d+/%d+%)$", "") .. UpdateCountInfo
    else
      RetContent = self.Text_TaskContent.Text .. UpdateCountInfo
    end
    self.Text_TaskContent:SetText(RetContent)
  end
end

function M:ClearCurTaskBarExtraInfo()
  local CheckEndsWithCountInfo = string.match(self.Text_TaskContent.Text, "%(%d+/%d+%)$") ~= nil
  local NewCotent = ""
  if CheckEndsWithCountInfo then
    NewCotent = string.gsub(self.Text_TaskContent.Text, "%(%d+/%d+%)$", "")
    self.Text_TaskContent:SetText(NewCotent)
  end
end

function M:UpdateTaskInfo(STLTaskInfo, OpType)
  self:SetCurTaskBarInfo(STLTaskInfo.TaskChainId)
  self:SetTaskBarTextContent()
  if "Add" == OpType then
    self:TryUpdateTaskBarByAdd(STLTaskInfo)
  elseif "Delete" == OpType then
    self:TryUpdateTaskBarByDelete(STLTaskInfo)
  end
end

function M:UpdateSpecialTaskInfo(OpType, SpecialNodeInfo)
  if "AddSpecialTaskInfo" == OpType then
    local BattleFortUI = UIManager(GWorld.GameInstance):GetUIObj("BattleFort")
    if self.Panel_Tips.Visibility == UE4.ESlateVisibility.Collapsed and nil == BattleFortUI and self.Platform ~= "Mobile" then
      self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Panel_Tips:SetRenderOpacity(1.0)
      local MessageContent = GText("UI_QUEST_TRACK")
      
      local function GenAndParseActionMapContent(Panel)
        local ActionMapText = GText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ActiveGuide")))
        Panel.Key:CreateCommonKey({
          KeyInfoList = {
            {Type = "Text", Text = ActionMapText}
          }
        })
        Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Panel.Text_Tips02:SetText(MessageContent)
      end
      
      GenAndParseActionMapContent(self, MessageContent)
    end
    if self:IsAnimationPlaying(self.Main_Task_In) then
      self:StopAnimation(self.Main_Task_In)
    elseif self:IsAnimationPlaying(self.Main_Task_Out) then
      self:StopAnimation(self.Main_Task_Out)
    end
    self.CurSpecialTaskInfo = SpecialNodeInfo
    self:SetTaskBarSpecialTextContent()
    self:PlayAnimation(self.Main_Task_In)
  elseif "DeleteSpecialTaskInfo" == OpType then
    if self:IsAnimationPlaying(self.Main_Task_In) then
      self:StopAnimation(self.Main_Task_In)
    elseif self:IsAnimationPlaying(self.Main_Task_Out) then
      self:StopAnimation(self.Main_Task_Out)
    end
    self:PlayAnimation(self.Main_Task_Out)
    self:SetTaskBarSpecialTextContent()
    self:BindToAnimationFinished(self.Main_Task_Out, {
      self,
      function()
        self:UnbindAllFromAnimationFinished(self.Main_Task_Out)
        self:PlayAnimation(self.Main_Task_In)
      end
    })
  elseif "ChangeSpecialTaskInfo" == OpType then
    self.CurSpecialTaskInfo = SpecialNodeInfo
    if self:IsAnimationPlaying(self.Main_Task_In) then
      self:SetTaskBarSpecialTextContent()
    elseif self:IsAnimationPlaying(self.Main_Task_Out) then
      self:SetTaskBarSpecialTextContent()
    end
  end
end

function M:TryUpdateTaskBarByAdd(STLTaskInfo)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DoingQuestId = 0
  local TipCache = EMCache:Get("TextTaskTipAnim", true) or {}
  if Avatar.QuestChains[Avatar.TrackingQuestChainId] then
    DoingQuestId = Avatar.QuestChains[Avatar.TrackingQuestChainId].DoingQuestId
  end
  if self.CurTaskInfo.IsChapterStart and (not self.CurTaskInfo.QuestUIId or 0 == self.CurTaskInfo.QuestUIId) and (nil == TipCache[DoingQuestId] or false == TipCache[DoingQuestId]) then
    TipCache[DoingQuestId] = true
    EMCache:Set("TextTaskTipAnim", TipCache, true)
    UIManager(GWorld.GameInstance):LoadUINew("TaskChapterBeginEndTip", STLTaskInfo.TaskChainId, STLTaskInfo.TaskId, true)
  elseif not self.CurTaskInfo.IsChapterStart and self.CurTaskInfo.IsChainFirstTask then
    self:PlayTaskBarAnimByState("Add")
  elseif not self.CurTaskInfo.IsChapterStart and not self.CurTaskInfo.IsChainFirstTask then
    self:PlayTaskBarAnimByState("UpdateIn")
  else
    self:PlayTaskBarAnimByState("UpdateIn")
  end
end

function M:TryUpdateTaskBarByDelete(STLTaskInfo)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.CurTaskInfo.IsChainLastTask then
    self:PlayTaskBarAnimByState("Delete")
  elseif self.CurTaskInfo.IsChapterEnd and not self.CurTaskInfo.IsChainLastTask then
    UIManager(GWorld.GameInstance):LoadUINew("TaskChapterBeginEndTip", STLTaskInfo.TaskChainId, STLTaskInfo.TaskId, false)
  else
    self:PlayTaskBarAnimByState("UpdateOut")
  end
end

function M:OnTipEndPlayTaskBarAnim(QuestChainId, QuestId, IsBeginOrEnd)
  if IsBeginOrEnd then
    local TaskDetail = TaskUtils:GetQuestDetail(QuestChainId, QuestId)
    local IsFirst = false
    if nil ~= TaskDetail then
      IsFirst = TaskDetail.bIsStartQuest
    end
    self:SetCurTaskBarInfo(QuestChainId)
    self:SetTaskBarTextContent()
    local Info = TaskUtils:GetQuestExtraInfo(QuestChainId, QuestId)
    if Info then
      for k, v in pairs(Info) do
        if v then
          self:SetCurTaskBarInfoWithExtraInfo(QuestChainId, QuestId, k)
        end
      end
    end
    self:PlayTaskBarAnimByState(IsFirst and "Add" or "UpdateIn")
  elseif QuestChainId and QuestId then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local NewTrackingQuestChainId = Avatar.TrackingQuestChainId
      if not Avatar.QuestChains[NewTrackingQuestChainId] then
        return
      end
      local DoingQuestId = Avatar.QuestChains[NewTrackingQuestChainId].DoingQuestId
      if NewTrackingQuestChainId ~= QuestChainId then
        self:ChangeTrackingChainByFinishQuest()
        return
      elseif DoingQuestId ~= QuestId then
        self:ChangeTrackingChainByFinishQuest()
        return
      elseif NewTrackingQuestChainId == self.CurTaskInfo.QuestChainId and nil == self.ListenNewQuestChainDataTimer then
        self.ListenNewQuestChainDataTimer = GWorld.GameInstance:AddTimer(0.5, function()
          self:LoopListenNewChainData(self.CurTaskInfo.QuestChainId)
        end, true)
      end
    end
  else
    self:ChangeTrackingChainByFinishQuest()
  end
end

function M:SetTaskBarTextContent()
  self.Text_TaskName:SetText(self.CurTaskInfo.TaskName)
  self.Text_TaskContent:SetText(self.CurTaskInfo.TaskDescribe)
end

function M:SetTaskBarSpecialTextContent()
  self.Text_TaskName:SetText(self.CurSpecialTaskInfo.TaskName)
  self.Text_TaskContent:SetText(self.CurSpecialTaskInfo.TaskDescribe)
end

function M:ChangeMainTaskBarCountInfoByBranchQuestNode(InQuestChainId, InQuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChainId = InQuestChainId
  local DoingQuestId = InQuestId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  local IsInSpecialQuest = Avatar.InSpecialQuest
  local UpdateCount = self:GetBranchQuestCountInfo(ChainId, DoingQuestId)
  local CurrentText = ""
  if IsInSpecialQuest then
    CurrentText = self.CurSpecialTaskInfo.TaskDescribe
  else
    CurrentText = self.CurTaskInfo.TaskDescribe
  end
  local CheckEndsWithCountInfo = string.match(CurrentText, "%(%d+/%d+%)$") ~= nil
  
  local function SetTaskContentUICountInfo(InCountInfo)
    if CheckEndsWithCountInfo then
      CurrentText = string.gsub(CurrentText, "%(%d+/%d+%)$", "") .. InCountInfo
    else
      CurrentText = CurrentText .. InCountInfo
    end
    self.Text_TaskContent:SetText(CurrentText)
  end
  
  if self:IsAnimationPlaying(self.Main_Task_In) then
    self:BindToAnimationFinished(self.Main_Task_In, {
      self,
      function()
        self:UnbindAllFromAnimationFinished(self.Main_Task_In)
        SetTaskContentUICountInfo(UpdateCount)
      end
    })
  elseif self:IsAnimationPlaying(self.Main_Task_Out) then
    self:BindToAnimationFinished(self.Main_Task_Out, {
      self,
      function()
        self:UnbindAllFromAnimationFinished(self.Main_Task_Out)
        SetTaskContentUICountInfo(UpdateCount)
      end
    })
  else
    SetTaskContentUICountInfo(UpdateCount)
  end
end

function M:PlayTaskBarAnimByState(State)
  self.Panel_NewTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_CompleteText:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetVisibilityEx(UE4.ESlateVisibility.SelfHitTestInvisible)
  if "Add" == State then
    if self.Panel_Tips.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local IsHide = self:CheckCanHide(self.CurTaskInfo.QuestChainId)
    if IsHide then
      self.Panel_Lock:SetVisibility(ESlateVisibility.Collapsed)
    end
    if not self:IsAnimationPlaying(self.Get_in) and not self:IsAnimationPlaying(self.MissonComplete_Out) then
      self:PlayAnimation(self.Get_in)
      self:BindToAnimationFinished(self.Get_in, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.Get_in)
          if IsHide then
            self.Panel_Lock:SetVisibility(ESlateVisibility.Visible)
          end
          self:TriggerQuestTrackPanelTips(true)
        end
      })
      return
    end
    if self:IsAnimationPlaying(self.MissonComplete_Out) then
      self:BindToAnimationFinished(self.MissonComplete_Out, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.MissonComplete_Out)
          self:PlayAnimation(self.Get_in)
          self:BindToAnimationFinished(self.Get_in, {
            self,
            function()
              self:UnbindAllFromAnimationFinished(self.Get_in)
              if IsHide then
                self.Panel_Lock:SetVisibility(ESlateVisibility.Visible)
              end
            end
          })
          self:TriggerQuestTrackPanelTips(true)
        end
      })
    end
  elseif "Delete" == State then
    if self.Panel_Tips.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local IsHide = self:CheckCanHide(self.CurTaskInfo.QuestChainId)
    if IsHide then
      self.Panel_Lock:SetVisibility(ESlateVisibility.Collapsed)
    end
    if not self:IsAnimationPlaying(self.Get_in) and not self:IsAnimationPlaying(self.MissonComplete_Out) then
      self.Panel_CompleteText:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local OldQuestChainId = self.CurTaskInfo.QuestChainId
      local OldQuestId = self.CurTaskInfo.QuestId
      self:BindToAnimationFinished(self.MissonComplete_Out, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.MissonComplete_Out)
          if IsHide then
            self.Panel_Lock:SetVisibility(ESlateVisibility.Visible)
          end
          if self.IsInLoading then
            self.CacheOldQuestChainId = OldQuestChainId
            self.CacheOldQuestId = OldQuestId
            self.LoadingCallback = self.TryListenNewQuestChainDataChange
          else
            self:TryListenNewQuestChainDataChange(OldQuestChainId, OldQuestId)
          end
        end
      })
      self:PlayAnimation(self.MissonComplete_Out)
      return
    end
  elseif "UpdateIn" == State then
    if self.Panel_Tips.Visibility == UE4.ESlateVisibility.Collapsed and self.Platform ~= "Mobile" then
      local MessageContent = GText("UI_QUEST_TRACK")
      
      local function GenAndParseActionMapContent(Panel)
        local ActionMapText = GText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ActiveGuide")))
        Panel.Key:CreateCommonKey({
          KeyInfoList = {
            {Type = "Text", Text = ActionMapText}
          }
        })
        Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Panel.Text_Tips02:SetText(MessageContent)
      end
      
      GenAndParseActionMapContent(self, MessageContent)
      self:PlayAnimation(self.Tooltip_In)
      if self.Panel_Tips2:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
        self:PlayAnimation(self.Tooltip2_Out)
      end
    end
    if self:IsAnimationPlaying(self.MissonComplete_Out) then
      self:BindToAnimationFinished(self.MissonComplete_Out, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.MissonComplete_Out)
          self:SetTaskBarTextContent()
          self:PlayAnimation(self.Main_Task_In)
        end
      })
    elseif not self:IsAnimationPlaying(self.Main_Task_In) and not self:IsAnimationPlaying(self.Main_Task_Out) then
      self:PlayAnimation(self.Main_Task_In)
      self:SetTaskBarTextContent()
    end
  elseif "UpdateOut" == State then
    local function IndicatorLoopFunc()
      self:BindToAnimationFinished(self.Main_Task_In, {
        self,
        
        function()
          self:UnbindAllFromAnimationFinished(self.Main_Task_In)
          EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
        end
      })
      self:PlayAnimation(self.Main_Task_In)
    end
    
    if not self:IsAnimationPlaying(self.Main_Task_In) and not self:IsAnimationPlaying(self.Main_Task_Out) then
      self:SetTaskBarTextContent()
      self:PlayAnimation(self.Main_Task_Out)
      self:BindToAnimationFinished(self.Main_Task_Out, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.Main_Task_Out)
          IndicatorLoopFunc()
        end
      })
      return
    end
  elseif "TrackIn" == State then
    if self.Panel_Tips.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if not self:IsAnimationPlaying(self.TaskBar_In) and not self:IsAnimationPlaying(self.TaskBar_Out) then
      self:PlayAnimation(self.TaskBar_In)
      self:BindToAnimationFinished(self.TaskBar_In, {
        self,
        function()
          self:UnbindAllFromAnimationFinished(self.TaskBar_In)
          if self.IsInExplore then
            self.Title:SetVisibility(ESlateVisibility.Collapsed)
          else
            self.Title:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          end
          local BattleFortUI = UIManager(GWorld.GameInstance):GetUIObj("BattleFort")
          if not BattleFortUI and 0 == self.VBox_SubTasks:GetChildrenCount() then
            self:TriggerQuestTrackPanelTips(true)
          end
        end
      })
      return
    end
  elseif "TrackOut" == State and not self:IsAnimationPlaying(self.TaskBar_In) and not self:IsAnimationPlaying(self.TaskBar_Out) then
    self:PlayAnimation(self.TaskBar_Out)
    self:BindToAnimationFinished(self.TaskBar_Out, {
      self,
      function()
        self:UnbindAllFromAnimationFinished(self.TaskBar_Out)
        self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
      end
    })
    return
  end
end

function M:TryListenNewQuestChainDataChange(OldQuestChainId, OldQuestId)
  local TaskDetail = TaskUtils:GetQuestDetail(OldQuestChainId, OldQuestId)
  local IsEndChapter = false
  if nil ~= TaskDetail then
    IsEndChapter = TaskDetail.bIsEndChapter
  end
  if IsEndChapter then
    UIManager(GWorld.GameInstance):LoadUINew("TaskChapterBeginEndTip", OldQuestChainId, OldQuestId, false)
  else
    self:ChangeTrackingChainByFinishQuest()
  end
end

function M:LoopListenNewChainData(OldQuestChainId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local NewTrackingQuestChainId = Avatar.TrackingQuestChainId
    if NewTrackingQuestChainId ~= OldQuestChainId then
      self:ChangeTrackingChainByFinishQuest()
      if self.ListenNewQuestChainDataTimer ~= nil then
        GWorld.GameInstance:RemoveTimer(self.ListenNewQuestChainDataTimer)
      end
    end
  end
end

function M:ChangeTrackingChainByFinishQuest()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  if not Avatar.QuestChains[TrackingQuestChainId] then
    self:PlayAnimation(self.TaskBar_Out)
    return
  end
  local DoingQuestId = Avatar.QuestChains[TrackingQuestChainId].DoingQuestId
  local TipCache = EMCache:Get("TextTaskTipAnim", true) or {}
  if 0 ~= TrackingQuestChainId and 0 ~= DoingQuestId and not GameMode:IsInDungeon() then
    local STLTaskInfo = self:CreateSTLTaskInfo(TrackingQuestChainId, DoingQuestId)
    if not STLTaskInfo then
      return
    end
    self:SetCurTaskBarInfo(STLTaskInfo.TaskChainId)
    self:TrySetUpdateTaskBarNodeInfo(TrackingQuestChainId, DoingQuestId)
    self:SetTaskBarTextContent()
    local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
    if IconTexture then
      self.Icon_GuidePoint:SetBrushResourceObject(IconTexture)
    end
    if not STLTaskInfo.IsChainFirstTask and not STLTaskInfo.IsChapterStart then
      self:PlayTaskBarAnimByState("UpdateIn")
    elseif STLTaskInfo.IsChainFirstTask and not STLTaskInfo.IsChapterStart then
      self:PlayTaskBarAnimByState("Add")
    elseif STLTaskInfo.IsChainFirstTask and (nil == TipCache[DoingQuestId] or false == TipCache[DoingQuestId]) then
      GWorld.GameInstance:AddTimer(0.5, function()
        TipCache[DoingQuestId] = true
        EMCache:Set("TextTaskTipAnim", TipCache, true)
        UIManager(GWorld.GameInstance):LoadUINew("TaskChapterBeginEndTip", STLTaskInfo.TaskChainId, STLTaskInfo.TaskId, true)
      end, false, 0, nil, false)
    else
      self:PlayTaskBarAnimByState("UpdateIn")
    end
  end
end

function M:PlayMissionStateChange()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_state_change", nil, nil)
end

function M:PlayGetInAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_update", nil, nil)
end

function M:PlayCompleteAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_complete", nil, nil)
end

function M:RefreshGuideInfo()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  if GameState then
    GameState:TryShowDungeonFirstGuide(GameState.GameModeType)
  end
end

function M:ShowQuestHint(InMessageId)
  if self:IsPlayingAnimation(self.Tooltip_Out) then
    self:StopAnimation(self.Tooltip_Out)
  end
  self.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if DataMgr.Message[InMessageId] and DataMgr.Message[InMessageId].MessageContentPC and DataMgr.Message[InMessageId].MessageContentPhone then
    local MessageId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[InMessageId].MessageContentPC, DataMgr.Message[InMessageId].MessageContentPhone)
    local MessageContent = GText(MessageId)
    
    local function GenAndParseActionMapContent(Panel, SourceContent)
      local FirstIndex = string.find(SourceContent, "&")
      if not FirstIndex then
        Panel.Text_Tips01:SetText(SourceContent)
        Panel.Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.Collapsed)
        return SourceContent
      end
      Panel.Key:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local SecondIndex = string.find(SourceContent, "&", FirstIndex + 1)
      local ActionContent = string.sub(SourceContent, FirstIndex, SecondIndex)
      local ActionMapText = GText(CommonUtils:StringReplaceActionName(ActionContent))
      Panel.Key:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = ActionMapText}
        }
      })
      local sub1 = string.sub(SourceContent, 1, FirstIndex - 1)
      local sub2 = string.sub(SourceContent, SecondIndex + 1)
      Panel.Text_Tips01:SetText(sub1)
      Panel.Text_Tips02:SetText(sub2)
    end
    
    GenAndParseActionMapContent(self, MessageContent)
    self:PlayAnimation(self.Tooltip_In)
    if self.Panel_Tips2:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      self:PlayAnimation(self.Tooltip2_Out)
    end
    self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:HideQuestHint(InMessageId)
  if self:IsPlayingAnimation(self.Tooltip_In) then
    self:StopAnimation(self.Tooltip_In)
  end
  self:BindToAnimationFinished(self.Tooltip_Out, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.Tooltip_Out)
      self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  })
  if DataMgr.Message[InMessageId] and DataMgr.Message[InMessageId].MessageContentPC and DataMgr.Message[InMessageId].MessageContentPhone then
    self:PlayAnimation(self.Tooltip_Out)
  end
end

function M:CreateSTLTaskInfo(QuestChainId, QuestId)
  local TaskInfo
  local TaskDetail = TaskUtils:GetQuestDetail(QuestChainId, QuestId)
  if nil == TaskDetail then
    return nil
  end
  
  local function GetTaskInfoString(TaskText)
    return GText(TaskText)
  end
  
  local CurTaskName
  if DataMgr.QuestChain[TaskDetail.QuestChainId] and DataMgr.QuestChain[TaskDetail.QuestChainId].QuestChainName then
    CurTaskName = GetTaskInfoString(DataMgr.QuestChain[TaskDetail.QuestChainId].QuestChainName)
  else
    CurTaskName = GText("UI_QUEST_UNKNOWN")
  end
  if TaskDetail then
    local TempTaskInfo = {
      TaskChainId = QuestChainId,
      TaskId = QuestId,
      TaskName = CurTaskName,
      TaskDescription = GetTaskInfoString(TaskDetail.QuestDescription),
      IsChainFirstTask = TaskDetail.bIsStartQuest,
      IsChapterStart = TaskDetail.bIsStartChapter,
      IsChainLastTask = TaskDetail.bIsEndQuest,
      IsChapterEnd = TaskDetail.bIsEndChapter
    }
    TaskInfo = TempTaskInfo
  end
  return TaskInfo
end

function M:SwitchTaskBarContentByTracking(IsTrack, IsPlayTextAnim)
  self.Panel_NewTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not GameMode:IsInDungeon() then
    self:RemoveOptionalTask()
  end
  local TrackingQuestId = Avatar.TrackingQuestChainId
  if TrackingQuestId <= 0 and not GameMode:IsInDungeon() then
    self:PlayTaskBarAnimByState("TrackOut")
    AudioManager(self):UpdateQuestChainIdAndQuestId()
    return
  end
  local DoingQuestId = 0
  if Avatar.QuestChains[TrackingQuestId] then
    DoingQuestId = Avatar.QuestChains[TrackingQuestId].DoingQuestId
    if 0 == DoingQuestId then
      self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
      AudioManager(self):UpdateQuestChainIdAndQuestId()
      return
    end
  else
    self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
    AudioManager(self):UpdateQuestChainIdAndQuestId()
    return
  end
  local CurQuestChainId
  if self.CurTaskInfo and self.CurTaskInfo.QuestChainId then
    CurQuestChainId = self.CurTaskInfo.QuestChainId
  end
  if CurQuestChainId ~= TrackingQuestId or IsTrack then
    CurQuestChainId = TrackingQuestId
    local TrackTaskInfo = TaskUtils:GetTrackingQuestDetailInfo()
    local CurQuestExtraInfo = TaskUtils.QuestExtraInfo[TrackingQuestId]
    if CurQuestExtraInfo and CurQuestExtraInfo[TrackTaskInfo.QuestId] and TrackTaskInfo then
      local CurCount = CurQuestExtraInfo[TrackTaskInfo.QuestId].Count
      local MaxCount = CurQuestExtraInfo[TrackTaskInfo.QuestId].RetCount
      if CurCount and MaxCount and CurCount >= MaxCount and TrackTaskInfo.bIsEndQuest == true then
        self:SetVisibilityEx(UE4.ESlateVisibility.Collapsed)
        AudioManager(self):UpdateQuestChainIdAndQuestId()
        return
      end
    end
    local QuestExtraInfo = TaskUtils:GetQuestExtraInfo(TrackingQuestId, DoingQuestId)
    local keys = {}
    if QuestExtraInfo and not IsEmptyTable(QuestExtraInfo) then
      for k in pairs(QuestExtraInfo) do
        table.insert(keys, k)
      end
      table.sort(keys)
    end
    if TrackTaskInfo and not GameMode:IsInDungeon() then
      AudioManager(self):UpdateQuestChainIdAndQuestId(TrackingQuestId, DoingQuestId)
      self:SetCurTaskBarInfo(CurQuestChainId)
      self:SetTaskBarTextContent()
      local TipCache = EMCache:Get("TextTaskTipAnim", true) or {}
      if TrackTaskInfo.bIsStartChapter and 0 == TrackTaskInfo.QuestUIId and true == IsPlayTextAnim and (nil == TipCache[DoingQuestId] or false == TipCache[DoingQuestId]) then
        TipCache[DoingQuestId] = true
        EMCache:Set("TextTaskTipAnim", TipCache, true)
        UIManager(GWorld.GameInstance):LoadUINew("TaskChapterBeginEndTip", CurQuestChainId, DoingQuestId, true)
      else
        self:PlayTaskBarAnimByState("TrackIn")
      end
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        self.Icon_GuidePoint:SetBrushResourceObject(IconTexture)
      end
      if QuestExtraInfo and not IsEmptyTable(QuestExtraInfo) then
        for i = 1, #keys do
          local Data = QuestExtraInfo[keys[i]]
          if Data.Node then
            Data.Node:OnChooseTrack()
          end
        end
      end
      return
    elseif GameMode:IsInDungeon() and GameState.GameModeType ~= "Training" then
      self:SetCurTaskBarInfo(CurQuestChainId)
      self:SetTaskBarTextContent()
      self:PlayTaskBarAnimByState("TrackIn")
      if QuestExtraInfo and not IsEmptyTable(QuestExtraInfo) then
        for i = #keys, 1, -1 do
          local Data = QuestExtraInfo[keys[i]]
          if Data.Node then
            Data.Node:OnChooseTrack()
          end
        end
      end
      return
    else
      self:PlayTaskBarAnimByState("TrackOut")
      return
    end
  end
end

function M:AddOptionalTask(Text)
  local OptionalTaskWidgetClass = LoadClass("/Game/UI/WBP/Battle/Widget/TaskBar/WBP_Battle_TaskBar_OptionalTask")
  local Widget = UE4.UWidgetBlueprintLibrary.Create(self, OptionalTaskWidgetClass)
  if Widget then
    self.VBox_OptionalTasks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.VBox_OptionalTasks:AddChildToVerticalBox(Widget)
    Widget.Text_Describe:SetText(GText(Text))
  end
end

function M:RemoveOptionalTask()
  self.VBox_OptionalTasks:SetVisibility(ESlateVisibility.Collapsed)
  self.VBox_OptionalTasks:ClearChildren()
end

function M:AddSynthesisOptionalTask(Text, IconName)
  local Widget = UIManager(self):_CreateWidgetNew("SynthesisDestructionSubTask", IconName)
  if Widget then
    self.VBox_OptionalTasks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.VBox_OptionalTasks:AddChildToVerticalBox(Widget)
    Widget.Text_Describe:SetText(GText(Text))
    local IconPath = UIConst.DungeonTaskPath[IconName]
    local IconTexture = LoadObject(IconPath)
    if IconTexture then
      Widget.Img_Gp:SetBrushResourceObject(IconTexture)
    end
    Widget:PlayAnimation(Widget.In)
  end
end

function M:RemoveSynthesisOptionalTask()
  local Widget = self.VBox_OptionalTasks:GetChildAt(0)
  if not Widget then
    return
  end
  Widget:BindToAnimationFinished(Widget.Out, function()
    self.VBox_OptionalTasks:RemoveChildAt(0)
    if 0 == self.VBox_OptionalTasks:GetChildrenCount() then
      self.VBox_OptionalTasks:SetVisibility(ESlateVisibility.Collapsed)
    end
  end)
  Widget:PlayAnimation(Widget.Out)
end

function M:SetVisibilityEx(Visibility)
  DebugPrint("WBP_Battle_TaskBar_C SetVisibilityEx", Visibility)
  if self.IsHideByNode then
    DebugPrint("WBP_Battle_TaskBar_C IsHideByNode")
    self:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.VBox_TaskBar:SetVisibility(Visibility)
end

function M:OnClickedButtonArea()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:IsInDungeon() or Avatar:IsInHardBoss() then
    return
  end
  local QuestChainId = Avatar.TrackingQuestChainId
  if 0 == QuestChainId then
    return
  end
  if self.NeedOpenDetectiveGame then
    UIManager(GWorld.GameInstance):LoadUINew("DetectiveMinigame")
    return
  end
  if self:IsAnimationPlaying(self.Press) then
    self:StopAnimation(self.Press)
  end
  if self.Platform == "Mobile" then
    self:PlayAnimation(self.Click)
  end
  if TaskUtils:GetQuestInterfaceJump(self.CurTaskInfo.QuestId) then
    PageJumpUtils:JumpToTargetPageByJumpId(TaskUtils:GetQuestInterfaceJumpId(self.CurTaskInfo.QuestId))
  else
    TaskUtils:QuestOpenMainMapByQuestTrack()
  end
end

function M:TriggerQuestTrackPanelTips(IsShow)
  if self.Platform == "Mobile" then
    if (self.Panel_Lock:GetVisibility() == ESlateVisibility.Visible or self.Panel_Lock:GetVisibility() == ESlateVisibility.HitTestInvisible) and self.VBox_SubTasks:GetChildrenCount() > 0 then
      self:PlayAnimation(self.DynamicEvent_Out)
    else
      self:PlayAnimation(self.DynamicEvent_In)
    end
    self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not TaskUtils:JudgeCanTrack() then
    self:PlayAnimation(self.Tooltip_Out)
    return
  end
  if self.CurTaskInfo and self.CurTaskInfo.QuestChainId and self.CurTaskInfo.QuestId then
    local Info = TaskUtils:GetQuestExtraInfo(self.CurTaskInfo.QuestChainId, self.CurTaskInfo.QuestId)
    if Info then
      for _, Data in pairs(Info) do
        if Data.Node and Data.Node.Type == "BranchQuestStartNode" and self.Tips.Visibility == UE4.ESlateVisibility.Collapsed then
          self.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          self.Panel_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
          return
        end
      end
    end
  end
  if self.Panel_Lock:GetVisibility() == ESlateVisibility.Visible and self.VBox_SubTasks:GetChildrenCount() > 0 and self.Title.Visibility == UE4.ESlateVisibility.Collapsed then
    self:PlayAnimation(self.DynamicEvent_In)
  end
  if IsShow then
    if self.Tips.Visibility == UE4.ESlateVisibility.Collapsed then
      self.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if self:CheckIsExistDynamicOrLimit() then
      self:PlayAnimation(self.DynamicEvent_In)
    else
      self:PlayAnimation(self.Tooltip_In)
      if self.Panel_Tips2:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
        self:PlayAnimation(self.Tooltip2_Out)
      end
      self.Title:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    local MessageContent = GText("UI_QUEST_TRACK")
    if self.NeedOpenDetectiveGame then
      MessageContent = GText("Minigame_Textmap_100304")
    end
    
    local function GenAndParseActionMapContent(Panel)
      local ActionMapText = GText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ActiveGuide")))
      Panel.Key:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = ActionMapText}
        }
      })
      Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Panel.Text_Tips02:SetText(MessageContent)
    end
    
    GenAndParseActionMapContent(self)
  else
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("LHQ@TaskBar:OnUpdateUIStyleByInputTypeChange, InputDevice", CurInputDevice, "GamepadName:", CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.WS_Key:SetActiveWidgetIndex(1)
    self:SetGamepadIcons()
  elseif CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.WS_Key:SetActiveWidgetIndex(0)
    self.Key:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ActiveGuide", false))
        }
      }
    })
  end
end

function M:RefreshKeyName()
  local KeyName = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ActiveGuide", false))
  self.Key:SetImage("Text", KeyName)
end

function M:SetGamepadIcons()
  local ActiveGuide1 = UIUtils.GetIconListByActionName("ActiveGuide")[1]
  local ActiveGuide2 = UIUtils.GetIconListByActionName("ActiveGuide")[2]
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = ActiveGuide1},
      {Type = "Img", ImgShortPath = ActiveGuide2}
    },
    Type = "Add"
  })
end

function M:SetRougeCanonInfo()
  self.Text_TaskName:SetText(GText("RougePaotaiMiniGameName"))
  self.Text_TaskContent:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_TaskContent:SetText(GText("RougePaotaiMiniGameDescribe"))
  self.VBox_SubTasks:ClearChildren()
  self.VBox_SubTasks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local CurrentEventId = GWorld.RougeLikeManager.EventId
  local MiniGameScoreId = DataMgr.RougeLikeEventSelect[CurrentEventId].MiniGameScoreId
  local Info = DataMgr.RougeLikeMiniGameScore[MiniGameScoreId]
  for Index, Score in ipairs(Info.MiniGameScore) do
    local Widget = self:CreateWidgetNew("RougeGameTarget")
    self.VBox_SubTasks:AddChild(Widget)
    Widget:Init(EventID.OnRougeLikeCanonScoreAdd, Index, Score)
  end
end

function M:RemoveRougeCanonInfo()
  self.VBox_SubTasks:ClearChildren()
  self.VBox_SubTasks:SetVisibility(ESlateVisibility.Collapsed)
end

function M:OnPressedButtonArea()
  if not self:IsAnimationPlaying(self.Click) then
    self:PlayAnimation(self.Press)
  end
end

function M:OnReleasedButtonArea()
  self:PlayAnimation(self.Normal)
end

function M:QuestChainFinished(QuestChainId)
  local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
  if 1 == QuestChainType then
    self.UnlockChainId = TaskUtils:GetUnlockMainStory()
    if self.UnlockChainId then
      self:UpdateUnlockMainStory(self.UnlockChainId)
    elseif self.Panel_Lock:GetVisibility() ~= ESlateVisibility.Collapsed then
      self:PlayAnimation(self.Lock_Out)
    end
  end
end

function M:UpdateUnlockMainStory(QuestChainId)
  self.UnlockChainId = QuestChainId
  local UnlockText = DataMgr.QuestChain[QuestChainId].MainStoryUnlockMessage
  if UnlockText then
    self.Panel_Lock:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Lock_In)
    self.Text_Lock:SetText(GText(UnlockText))
  end
end

function M:UpdateQuestChain(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if QuestChainId ~= self.UnlockChainId then
    return
  end
  local AllQuestData = Avatar.QuestChains or {}
  local Info = AllQuestData[QuestChainId]
  if Info.State == QuestState.Unlock or Info.State == QuestState.Doing then
    self.Panel_Lock:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:CheckCanHide(QuestChainId)
  local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
  if 3 == QuestChainType and self.Panel_Lock:GetVisibility() == ESlateVisibility.Visible and self:CheckIsExistDynamicOrLimit() then
    return true
  else
    return false
  end
end

function M:CheckIsExistDynamicOrLimit()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local CurrentDynamic = ClientEventUtils:GetCurrentDoingDynamicEvent()
  if 0 ~= GameState.ActiveLimitTimeExploreGroup or nil ~= CurrentDynamic then
    return true
  else
    return false
  end
end

function M:SetTaskBarSubTaskIcon(Index, Type)
  if self.SubTaskWidgetsTable == nil then
    return
  end
  local SubWidget = self.SubTaskWidgetsTable["Branch_" .. tostring(Index)]
  if nil == SubWidget then
    return
  end
  if "Optional" == Type then
    SubWidget:SetOptional()
  end
end

return M
