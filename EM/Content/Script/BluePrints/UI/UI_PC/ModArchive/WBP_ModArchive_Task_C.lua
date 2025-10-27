require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_ModArchive_Task_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_ModArchive_Task_C:OnSelected(Params)
  if Params then
    self.Owner = Params.Owner
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self:UpdateOnInputDeviceTypeChange()
  self:SetFocus()
  self.HasSelected = true
  self.MaxPhase = #DataMgr.ModTaskPhase
  self.Avatar = GWorld:GetAvatar()
  if not self.CurPhaseId then
    self.CurPhaseId = 1
  end
  if self.Flag or self.Flag == nil then
    self.Flag = true
  else
    self.Flag = false
  end
  self.TaskDoNotInAnim = false
  self.AllTasks = DataMgr.ModGuideBookTask
  self.PhaseAddedNum = {}
  self:SetVisibility(ESlateVisibility.Visibility)
  self.Group_GetAll:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Reward:SetText(GText("UI_Achievement_GetAllReward"))
  self.Btn_Reward:SetGamePadImg("Y")
  self.TitleItem.Btn_Get:SetText(GText("UI_Achievement_GetReward"))
  self.TitleItem.Btn_Get:SetDefaultGamePadImg("A")
  self.TitleItem.Owner = self
  self.TitleItem.Btn_Left:BindEventOnClicked(self, self.ClickLeftBtn)
  self.TitleItem.Btn_Right:BindEventOnClicked(self, self.ClickRightBtn)
  self.TitleItem.Btn_Left:BindForbidStateExecuteEvent(self, self.ClickLeftBtnForbid)
  self.TitleItem.Btn_Right:BindForbidStateExecuteEvent(self, self.ClickRightBtnForbid)
  self.TitleItem.Btn_Get:UnBindEventOnClickedByObj(self)
  self.TitleItem.Btn_Get:BindEventOnClicked(self, self.OnClickGetPhaseReward)
  self.Btn_Reward:UnBindEventOnClickedByObj(self)
  self.Btn_Reward:BindEventOnClicked(self, self.OnClickGetAllReward)
  self.TitleItem.Text_TaskRewards:SetText(GText("UI_ModTask_QuestPhase_Reward"))
  self.TitleItem:PlayAnimation(self.TitleItem.Normal)
  self.TitleItem.Com_PageTurner:InitPageTurner(self.MaxPhase, self, self.HandleIndexFunc, self.CurPhaseId)
  self:CheckPhaseValid()
  self.TitleItem:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnNavigateRight
  })
  self:RefreshInfo()
  self:RefreshLRBtnState()
  self:RefreshTabReddot()
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Owner:SwitchComKeyTipsState(3)
  elseif self.Group_GetAll:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Owner:SwitchComKeyTipsState(4)
  else
    self.Owner:SwitchComKeyTipsState(1)
  end
end

function WBP_ModArchive_Task_C:InitTasks()
  self.ValidTask = {}
  self.CanGetRewardTask = {}
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Targets = DataMgr.Target
  for i, v in pairs(self.AllTasks) do
    local Valid = true
    if v.ConditionId and not ConditionUtils.CheckCondition(Avatar, v.ConditionId) then
      Valid = false
    end
    if v.QuestPhaseId ~= self.CurPhaseId then
      Valid = false
    end
    for k = 1, #v.TargetId do
      if not Targets[v.TargetId[k]] then
        Valid = false
      end
    end
    if Valid then
      local TaskInfo = {}
      TaskInfo.TaskId = v.TaskId
      TaskInfo.QuestPhaseId = v.QuestPhaseId
      TaskInfo.DisplayId = v.DisplayId
      TaskInfo.TaskType = v.TaskType
      TaskInfo.TaskReward = v.TaskReward
      TaskInfo.TaskName = v.TaskName
      TaskInfo.TaskDes = v.TaskDes
      TaskInfo.JumpTaskTypeParam = v.JumpTaskTypeParam
      TaskInfo.CollectTaskTypeParam = v.CollectTaskTypeParam
      if v.TaskType == "Jump" then
        local CompleteCount = Avatar.AchvTargets:GetAchvTarget(v.TargetId[1]).Count
        if CompleteCount >= v.Target then
          TaskInfo.Complete = true
        else
          TaskInfo.Complete = false
        end
      elseif v.TaskType == "Collect" then
        local ModStates = {}
        TaskInfo.Complete = true
        for i = 1, #v.CollectTaskTypeParam do
          ModStates[v.CollectTaskTypeParam[i]] = false
        end
        for ModId, GetTime in pairs(Avatar.HoldMods) do
          if false == ModStates[ModId] then
            ModStates[ModId] = true
          end
        end
        for i = 1, #v.CollectTaskTypeParam do
          if not ModStates[v.CollectTaskTypeParam[i]] then
            TaskInfo.Complete = false
          end
        end
        TaskInfo.ModStates = ModStates
      end
      local ModBookQuest = Avatar.ModBookQuests:GetModBookQuest(v.TaskId)
      if ModBookQuest.IsComplete and ModBookQuest:IsComplete() then
        TaskInfo.Complete = true
      end
      if ModBookQuest.RewardsGot then
        TaskInfo.RewardsGot = true
      else
        TaskInfo.RewardsGot = false
      end
      table.insert(self.ValidTask, TaskInfo)
    end
  end
  table.sort(self.ValidTask, function(a, b)
    if a.Complete ~= b.Complete then
      return not a.Complete
    end
    return a.TaskId < b.TaskId
  end)
  if self.Flag then
    self.List_Task:ClearListItems()
    self.Nums = 0
    for i, task in ipairs(self.ValidTask) do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      self.Nums = self.Nums + 1
      Content.Owner = self
      Content.Index = self.Nums
      Content.TaskInfo = task
      Content.TaskDoNotInAnim = self.TaskDoNotInAnim
      self.List_Task:AddItem(Content)
    end
    self:AddDelayFrameFunc(function()
      self.List_Task:ScrollIndexIntoView(0)
    end, 1, "DelaySelectFirst")
  else
    self.List_Task_Back:ClearListItems()
    self.Nums = 0
    for i, task in ipairs(self.ValidTask) do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      self.Nums = self.Nums + 1
      Content.Owner = self
      Content.Index = self.Nums
      Content.TaskInfo = task
      Content.TaskDoNotInAnim = self.TaskDoNotInAnim
      self.List_Task_Back:AddItem(Content)
    end
    self:AddDelayFrameFunc(function()
      self.List_Task_Back:ScrollIndexIntoView(0)
    end, 1, "DelaySelectFirst")
  end
  self.TaskDoNotInAnim = false
end

function WBP_ModArchive_Task_C:RefreshInfo()
  DebugPrint("zwjk123 RefreshInfo")
  local PreTaskId = 0
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self:InitTasks()
  self:PlayAnimation(self.In)
  if self.CurWidget then
    PreTaskId = self.CurWidget.TaskInfo.TaskId
  elseif self.ValidTask and self.ValidTask[1] then
    PreTaskId = self.ValidTask[1].TaskId
  else
    PreTaskId = DataMgr.ModPhaseId2QuestId[self.CurPhaseId][1]
  end
  if self.Owner.ShouldShowTips then
    return
  end
  if self.Flag and self.List_Task then
    self.SelectItem = nil
    local DelayFrame = 5
    if not self.Owner.InFinished then
      DelayFrame = 35
    end
    self:AddDelayFrameFunc(function()
      if PreTaskId > 0 and self.CurInputDeviceType == ECommonInputType.GamePad then
        for i, v in ipairs(self.ValidTask) do
          if v.TaskId == PreTaskId then
            DebugPrint("z1122 ", PreTaskId)
            self.List_Task:NavigateToIndex(i - 1)
            self.List_Task:SetSelectedIndex(i - 1)
            self:AddDelayFrameFunc(function()
              self.List_Task:ScrollIndexIntoView(i - 1)
              local SelectItem = self.List_Task:BP_GetSelectedItem()
              if SelectItem and SelectItem.SelfWidget then
                SelectItem.SelfWidget:SetFocus()
                SelectItem.SelfWidget:RefreshInputDeviceType()
                SelectItem.SelfWidget:OnFocusNew()
              end
            end, 2, "DelayFocus")
            break
          end
        end
      else
        self.List_Task:SetSelectedIndex(0)
        local SelectItem = self.List_Task:BP_GetSelectedItem()
        if SelectItem and SelectItem.SelfWidget then
          SelectItem.SelfWidget:RefreshInputDeviceType()
          SelectItem.SelfWidget:OnFocusNew()
        end
      end
    end, DelayFrame, "TaskReturnFocus")
  elseif not self.Flag and self.List_Task_Back then
    self.SelectItem = nil
    local DelayFrame = 5
    if not self.Owner.InFinished then
      DelayFrame = 35
    end
    self:AddDelayFrameFunc(function()
      if PreTaskId > 0 and self.CurInputDeviceType == ECommonInputType.GamePad then
        for i, v in ipairs(self.ValidTask) do
          if v.TaskId == PreTaskId then
            self.List_Task_Back:NavigateToIndex(i - 1)
            self.List_Task_Back:SetSelectedIndex(i - 1)
            self:AddDelayFrameFunc(function()
              self.List_Task_Back:ScrollIndexIntoView(i - 1)
              local SelectItem = self.List_Task_Back:BP_GetSelectedItem()
              if SelectItem and SelectItem.SelfWidget then
                SelectItem.SelfWidget:SetFocus()
                SelectItem.SelfWidget:RefreshInputDeviceType()
                SelectItem.SelfWidget:OnFocusNew()
              end
            end, 2, "DelayFocus")
            break
          end
        end
      else
        self.List_Task_Back:SetSelectedIndex(0)
        local SelectItem = self.List_Task_Back:BP_GetSelectedItem()
        if SelectItem and SelectItem.SelfWidget then
          SelectItem.SelfWidget:RefreshInputDeviceType()
          SelectItem.SelfWidget:OnFocusNew()
        end
      end
    end, DelayFrame, "TaskReturnFocus")
  end
end

function WBP_ModArchive_Task_C:RefreshPhaseProgress()
  self.PhaseAddedNum[self.CurPhaseId] = 0
  local PreArchivePhase = EMCache:Get("ModBookArchivePhase", true)
  local NewArchivePhase = {}
  if PreArchivePhase then
    for i, v in pairs(PreArchivePhase) do
      NewArchivePhase[i] = v
    end
  end
  local CurPhaseCompleteNum = 0
  for i, v in ipairs(self.ValidTask) do
    local TaskAvatarInfo = self.Avatar.ModBookQuests[v.TaskId]
    if TaskAvatarInfo and 0 ~= TaskAvatarInfo.FinishTime then
      CurPhaseCompleteNum = CurPhaseCompleteNum + 1
    end
  end
  NewArchivePhase[self.CurPhaseId] = CurPhaseCompleteNum
  if PreArchivePhase and PreArchivePhase[self.CurPhaseId] then
    local PrePhaseCompleteNum = PreArchivePhase[self.CurPhaseId]
    if CurPhaseCompleteNum > PrePhaseCompleteNum then
      self.PhaseAddedNum[self.CurPhaseId] = CurPhaseCompleteNum - PrePhaseCompleteNum
    end
  else
    self.PhaseAddedNum[self.CurPhaseId] = CurPhaseCompleteNum
  end
  EMCache:Set("ModBookArchivePhase", NewArchivePhase, true)
end

function WBP_ModArchive_Task_C:OnShowTipsClose()
  if self.List_Task then
    self.SelectItem = nil
    local DelayFrame = 5
    if not self.Owner.InFinished then
      DelayFrame = 35
    end
    self:AddDelayFrameFunc(function()
      self.List_Task:SetFocus()
      self.List_Task:SetSelectedIndex(0)
      local SelectItem = self.List_Task:BP_GetSelectedItem()
      if SelectItem and SelectItem.SelfWidget then
        SelectItem.SelfWidget:OnFocusNew()
      end
    end, DelayFrame, "TaskReturnFocus")
  end
  self:AddProgress(self.CompleteNum, self.MaxValidTaskNum)
end

function WBP_ModArchive_Task_C:OnTipsOpenChanged(bIsOpen, Widget)
  DebugPrint("zwkkk OnTipsOpenChanged", bIsOpen, self:GetName())
  if not self.CurInputDeviceType or self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self.Owner:OnTipsOpenChanged(bIsOpen)
end

function WBP_ModArchive_Task_C:OnSelectionChange(Item)
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if not Item then
    return
  end
  if not Item.SelfWidget then
    return
  end
  if not self.CurWidget then
    self.CurWidget = Item.SelfWidget
  end
  DebugPrint("zwkjlk ", Item.SelfWidget:GetName(), self.CurWidget:GetName())
  if self.CurWidget ~= Item.SelfWidget then
    self.CurWidget:OnFocusLostNew()
    Item.SelfWidget:OnFocusNew()
  end
  self.CurWidget = Item.SelfWidget
end

function WBP_ModArchive_Task_C:OnGuideEnd()
  local SelectItem = self.List_Task:GetItemAt(0)
  if not self.Flag then
    SelectItem = self.List_Task_Back:GetItemAt(0)
  end
  if SelectItem and SelectItem.SelfWidget then
    SelectItem.SelfWidget:SetFocus()
    SelectItem.SelfWidget:RefreshInputDeviceType()
    SelectItem.SelfWidget:OnFocusNew()
  end
end

function WBP_ModArchive_Task_C:ClickLeftBtn()
  if self.CantSwitch then
    return
  end
  if 1 ~= self.CurPhaseId then
    self.CurPhaseId = self.CurPhaseId - 1
    self:StopAllAnimations()
    self.CantSwitch = true
    if self.Flag then
      self:PlayAnimation(self.Switch_Left)
    else
      self:PlayAnimation(self.Switch_Left_Back)
    end
    self.Flag = not self.Flag
    self.TaskDoNotInAnim = true
    self.TitleItem.Com_PageTurner:PageLeft(false)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
end

function WBP_ModArchive_Task_C:ClickRightBtn()
  if self.CantSwitch then
    return
  end
  if self.CurPhaseId ~= self.MaxPhase then
    self.CurPhaseId = self.CurPhaseId + 1
    self:StopAllAnimations()
    self.CantSwitch = true
    if self.Flag then
      self:PlayAnimation(self.Switch_Right)
    else
      self:PlayAnimation(self.Switch_Right_Back)
    end
    self.Flag = not self.Flag
    self.TaskDoNotInAnim = true
    self.TitleItem.Com_PageTurner:PageRight(false)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
end

function WBP_ModArchive_Task_C:HandleIndexFunc(NewPageIndex)
  if NewPageIndex ~= self.CurPhaseId then
    self.CurPhaseId = NewPageIndex
    if NewPageIndex > self.CurPhaseId then
      self:StopAllAnimations()
      self.CantSwitch = true
      if self.Flag then
        self:PlayAnimation(self.Switch_Right)
      else
        self:PlayAnimation(self.Switch_Right_Back)
      end
    else
      self:StopAllAnimations()
      self.CantSwitch = true
      if self.Flag then
        self:PlayAnimation(self.Switch_Left)
      else
        self:PlayAnimation(self.Switch_Left_Back)
      end
    end
    self.Flag = not self.Flag
    self.TaskDoNotInAnim = true
  end
end

function WBP_ModArchive_Task_C:Stage_Change()
  self.CantSwitch = false
  self:InitTasks()
  self:RefreshLRBtnState()
  self.CurWidget = nil
  AudioManager(self):PlayUISound(self, "event:/ui/common/mozhixia_page_change", nil, nil)
end

function WBP_ModArchive_Task_C:RefreshLRBtnState()
  self.StillHasReward = false
  if 1 == self.CurPhaseId then
    self.TitleItem.Btn_Left:ForbidBtn(true)
    if self.TitleItem.Key_TitleLeft then
      self.TitleItem.Key_TitleLeft:SetForbidKey(true)
    end
  else
    self.TitleItem.Btn_Left:ForbidBtn(false)
    if self.TitleItem.Key_TitleLeft then
      self.TitleItem.Key_TitleLeft:SetForbidKey(false)
    end
  end
  if self.CurPhaseId == self.MaxPhase then
    self.TitleItem.Btn_Right:ForbidBtn(true)
    if self.TitleItem.Key_TitleRight then
      self.TitleItem.Key_TitleRight:SetForbidKey(true)
    end
  else
    local NextPhase = self.CurPhaseId + 1
    local Avatar = GWorld:GetAvatar()
    if DataMgr.ModTaskPhase and DataMgr.ModTaskPhase[NextPhase] and DataMgr.ModTaskPhase[NextPhase].Condition and not ConditionUtils.CheckCondition(Avatar, DataMgr.ModTaskPhase[NextPhase].Condition) then
      self.TitleItem.Btn_Right:ForbidBtn(true)
      if self.TitleItem.Key_TitleRight then
        self.TitleItem.Key_TitleRight:SetForbidKey(true)
      end
    else
      self.TitleItem.Btn_Right:ForbidBtn(false)
      if self.TitleItem.Key_TitleRight then
        self.TitleItem.Key_TitleRight:SetForbidKey(false)
      end
    end
  end
  local AllComplete = true
  local HasGetReward = self.Avatar.ModBookQuestPhaseRewardsGot[self.CurPhaseId]
  local CompleteNum = 0
  local TaskCanGetRewardsNum = 0
  local MaxValidTaskNum = #self.ValidTask
  for i, TaskInfo in ipairs(self.ValidTask) do
    local TaskAvatarInfo = self.Avatar.ModBookQuests[TaskInfo.TaskId]
    if 0 ~= TaskAvatarInfo.FinishTime then
      CompleteNum = CompleteNum + 1
      if not TaskAvatarInfo.RewardsGot then
        TaskCanGetRewardsNum = TaskCanGetRewardsNum + 1
      end
    else
      AllComplete = false
    end
  end
  self:RefreshPhaseProgress()
  self:RemoveTimer("PhaseProgressAdd")
  self.ShouldSlowAdd = false
  if self.PhaseAddedNum[self.CurPhaseId] and self.PhaseAddedNum[self.CurPhaseId] > 0 then
    self.ShouldSlowAdd = true
    local Material = self.TitleItem.Image_TaskProgress:GetDynamicMaterial()
    if Material then
      Material:SetScalarParameterValue("Percent", (CompleteNum - self.PhaseAddedNum[self.CurPhaseId]) / MaxValidTaskNum)
    end
    local MaterialGlow = self.TitleItem.Progress_AddGlow:GetDynamicMaterial()
    if MaterialGlow then
      DebugPrint("111\232\174\190\231\189\174 Glow ", 1 - (CompleteNum - self.PhaseAddedNum[self.CurPhaseId]) / MaxValidTaskNum)
      MaterialGlow:SetScalarParameterValue("InitialPosition", 1 - (CompleteNum - self.PhaseAddedNum[self.CurPhaseId]) / MaxValidTaskNum)
      MaterialGlow:SetScalarParameterValue("Percent", 0.0)
    end
    if not self.Owner.InFinished or self.Owner.ShouldShowTips then
      self.CompleteNum = CompleteNum
      self.MaxValidTaskNum = MaxValidTaskNum
    else
      self:AddProgress(CompleteNum, MaxValidTaskNum)
    end
  else
    local Material = self.TitleItem.Image_TaskProgress:GetDynamicMaterial()
    if Material then
      Material:SetScalarParameterValue("Percent", CompleteNum / MaxValidTaskNum)
    end
  end
  self.TitleItem.Text_TaskProgressNum:SetText(CompleteNum .. "/" .. MaxValidTaskNum)
  if not (not AllComplete or HasGetReward) or 0 ~= TaskCanGetRewardsNum then
    self.Group_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.StillHasReward = true
  else
    self.Group_GetAll:SetVisibility(ESlateVisibility.Collapsed)
    self.StillHasReward = false
  end
  self.TitleItem.ListView_Rewards:ClearListItems()
  local Rewards = {}
  local Reward = DataMgr.Reward[DataMgr.ModTaskPhase[self.CurPhaseId].PhaseReward]
  for j, ResourceId in ipairs(Reward.Id) do
    local Info = {}
    local ItemData = DataMgr[Reward.Type[j]][ResourceId]
    Info.Id = ResourceId
    Info.Count = Reward.Count[j][1]
    Info.ItemName = ItemData.ResourceName
    Info.ItemType = "Resource"
    Info.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
    Info.Icon = ItemData.Icon
    Info.IsShowDetails = true
    table.insert(Rewards, Info)
  end
  for i = 1, #Rewards do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = Rewards[i].Id
    Content.Count = Rewards[i].Count
    Content.Icon = Rewards[i].Icon
    Content.Rarity = Rewards[i].Rarity
    Content.IsShowDetails = Rewards[i].IsShowDetails
    Content.ItemType = Rewards[i].ItemType
    if HasGetReward then
      Content.bHasGot = true
    else
      Content.bHasGot = false
    end
    
    function Content.AfterInitCallback(Widget)
      Widget:BindEvents(self, {
        OnMenuOpenChanged = self.OnTipsOpenChanged
      })
    end
    
    Content.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = self.OnClickItem,
      Params = {}
    }
    self.TitleItem.ListView_Rewards:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    local Num = self.TitleItem.ListView_Rewards:GetNumItems()
    local ItemUIs = self.TitleItem.ListView_Rewards:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.TitleItem.ListView_Rewards, ItemUIs) - ItemUIs:Length()
    DebugPrint("\233\156\128\232\166\129\229\161\171\229\133\133\231\154\132\231\169\186\230\160\188\229\173\144\230\149\176 ", RestCount)
    if RestCount > 0 then
      for i = 1, RestCount do
        self.TitleItem.ListView_Rewards:AddItem(self:CreateEmptyContent())
      end
    end
  end, false, 0)
  self.TitleItem.Text_Title:SetText(string.format(GText("UI_GameEvent_StarterQuest_Phase"), self.CurPhaseId))
  if HasGetReward then
    self.TitleItem.WS_Bottom:SetActiveWidgetIndex(0)
    self.TitleItem.Text_BottomTips:SetText(GText("UI_Finished"))
  elseif AllComplete then
    self.TitleItem.WS_Bottom:SetActiveWidgetIndex(1)
  else
    self.TitleItem.WS_Bottom:SetActiveWidgetIndex(0)
    self.TitleItem.Text_BottomTips:SetText(GText("UI_ModTask_QuestPhase_Complete"))
  end
  self.Owner:RefreshReddot()
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    if self.StillHasReward then
      self.Owner:SwitchComKeyTipsState(4)
    else
      self.Owner:SwitchComKeyTipsState(1)
    end
  end
end

function WBP_ModArchive_Task_C:CreateEmptyContent()
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.IsEmpty = true
  return Obj
end

function WBP_ModArchive_Task_C:OnMainInFinish()
  if self.Owner.ShouldShowTips then
  else
    self:AddProgress(self.CompleteNum, self.MaxValidTaskNum)
  end
end

function WBP_ModArchive_Task_C:AddProgress(CompleteNum, MaxValidTaskNum)
  if not CompleteNum or not MaxValidTaskNum then
    return
  end
  if not self.ShouldSlowAdd then
    return
  end
  local SetNum = 25
  local PerPercent = self.PhaseAddedNum[self.CurPhaseId] / MaxValidTaskNum / SetNum
  DebugPrint("111\232\174\190\231\189\174 AddProgress", self.PhaseAddedNum[self.CurPhaseId] / MaxValidTaskNum, CompleteNum, MaxValidTaskNum)
  
  local function Func()
    SetNum = SetNum - 1
    local Material = self.TitleItem.Image_TaskProgress:GetDynamicMaterial()
    local MaterialGlow = self.TitleItem.Progress_AddGlow:GetDynamicMaterial()
    if not Material or not MaterialGlow then
      return
    end
    if SetNum <= 0 then
      self:RemoveTimer("PhaseProgressAdd")
      Material:SetScalarParameterValue("Percent", CompleteNum / MaxValidTaskNum)
    else
      local CurPercent = Material:K2_GetScalarParameterValue("Percent")
      local AimPercent = CurPercent + PerPercent
      local GlowPercent = MaterialGlow:K2_GetScalarParameterValue("Percent")
      local AimGlowPercent = GlowPercent + PerPercent
      Material:SetScalarParameterValue("Percent", AimPercent)
      MaterialGlow:SetScalarParameterValue("Percent", AimGlowPercent)
      self.TitleItem.VX_Glow:SetRenderTransformAngle(AimPercent * 360.0)
    end
  end
  
  self.TitleItem:PlayAnimation(self.TitleItem.Up)
  AudioManager(self):PlayUISound(self, "event:/ui/common/mozhixia_processbar_add", nil, nil)
  self:AddTimer(0.02, Func, true, 0, "PhaseProgressAdd", true)
end

function WBP_ModArchive_Task_C:CheckAllRewardBtnState()
  local ShouldShow = false
  local AllComplete = true
  local HasGetReward = self.Avatar.ModBookQuestPhaseRewardsGot[self.CurPhaseId]
  for i, TaskInfo in ipairs(self.ValidTask) do
    local TaskAvatarInfo = self.Avatar.ModBookQuests[TaskInfo.TaskId]
    if 0 ~= TaskAvatarInfo.FinishTime then
      if not TaskAvatarInfo.RewardsGot then
        ShouldShow = true
      end
    else
      AllComplete = false
    end
  end
  if ShouldShow or AllComplete and not HasGetReward then
    self.Group_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_GetAll:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Task_C:ClickLeftBtnForbid()
end

function WBP_ModArchive_Task_C:ClickRightBtnForbid()
  if self.CurPhaseId ~= self.MaxPhase then
    local NextPhase = self.CurPhaseId + 1
    if DataMgr.ModTaskPhase and DataMgr.ModTaskPhase[NextPhase] and DataMgr.ModTaskPhase[NextPhase].Condition then
      local Condition = DataMgr.ModTaskPhase[NextPhase].Condition
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText(DataMgr.Condition[Condition].ConditionText))
    end
  end
end

function WBP_ModArchive_Task_C:CheckPhaseValid()
  for i = 1, self.MaxPhase do
    if DataMgr.ModTaskPhase and DataMgr.ModTaskPhase[i] and DataMgr.ModTaskPhase[i].Condition and not ConditionUtils.CheckCondition(self.Avatar, DataMgr.ModTaskPhase[i].Condition) then
      local function ForbidClick()
        if DataMgr.ModTaskPhase and DataMgr.ModTaskPhase[i] and DataMgr.ModTaskPhase[i].Condition then
          local Condition = DataMgr.ModTaskPhase[i].Condition
          
          UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText(DataMgr.Condition[Condition].ConditionText))
        end
      end
      
      self.TitleItem.Com_PageTurner:ReBindClickEvent(i, ForbidClick)
    end
  end
end

function WBP_ModArchive_Task_C:OnClickGetPhaseReward()
  local Avatar = GWorld:GetAvatar()
  
  local function CallBack(ErrCode, Reward)
    if ErrorCode:Check(ErrCode) then
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward, false, nil, self, false)
      self:RefreshLRBtnState()
      self.Owner:RefreshReddot()
    end
  end
  
  Avatar:ModBookQuestGetRewardByPhase(self.CurPhaseId, CallBack)
end

function WBP_ModArchive_Task_C:OnClickGetAllReward()
  local Avatar = GWorld:GetAvatar()
  
  local function CallBack(ErrCode, Reward)
    if ErrorCode:Check(ErrCode) then
      local ItemPage = UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, Reward)
      self:InitTasks()
      self:RefreshLRBtnState()
      self.Owner:RefreshReddot()
    end
  end
  
  Avatar:ModBookQuestGetAllRewardByPhase(self.CurPhaseId, CallBack)
end

function WBP_ModArchive_Task_C:RefreshTabReddot()
  if self.Owner and self.Owner.TaskHasReddotIndex then
    self.TitleItem.Reddot_Left:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurPhaseId > 1 then
      for i = self.CurPhaseId - 1, 1, -1 do
        if self.Owner.TaskHasReddotIndex and self.Owner.TaskHasReddotIndex[i] then
          self.TitleItem.Reddot_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          break
        end
      end
    end
    self.TitleItem.Reddot_Right:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurPhaseId < self.MaxPhase then
      for i = self.CurPhaseId + 1, self.MaxPhase do
        if self.Owner.TaskHasReddotIndex and self.Owner.TaskHasReddotIndex[i] then
          self.TitleItem.Reddot_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          break
        end
      end
    end
  end
end

function WBP_ModArchive_Task_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Task_C:Handle_OnPCDown(InKeyName)
  if "SpaceBar" == InKeyName then
    self:OnSpaceBarKeyDown()
    return true
  end
  return false
end

function WBP_ModArchive_Task_C:OnSpaceBarKeyDown()
  if self.StillHasReward then
    self:OnClickGetAllReward()
  end
end

function WBP_ModArchive_Task_C:OnKeyUp(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Task_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Left" == InKeyName then
    if self.CurWidget and not self.XInPress and not self.CurWidget.ListView_Rewards:HasFocusedDescendants() then
      self.XInPress = true
      self.CurWidget.Btn_Build:PlayAnimation(self.CurWidget.Btn_Build.Press)
      self.CurWidget.Btn_Reward:PlayAnimation(self.CurWidget.Btn_Reward.Press)
    end
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.IsInPhaseRewardFocus then
      self.IsInPhaseRewardFocus = false
      self.TitleItem:SetFocus()
    elseif self.SelectItem and self.SelectItem.SelfWidget:HasFocusedDescendants() then
      if self.Flag then
        self.List_Task:SetSelectedIndex(self.SelectItem.Index - 1)
        if self.SelectItem then
          self.SelectItem.SelfWidget:OnGamePadUnSelected()
        end
        self.List_Task:SetFocus()
        self.SelectItem = nil
        self.Owner:SwitchComKeyTipsState(3)
        self:AddDelayFrameFunc(function()
          local SelectItem = self.List_Task:BP_GetSelectedItem()
          if SelectItem then
            SelectItem.SelfWidget:SetFocus()
            SelectItem.SelfWidget.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
          end
        end, 1, "ReturnSelectFocus")
      else
        self.List_Task_Back:SetSelectedIndex(self.SelectItem.Index - 1)
        if self.SelectItem then
          self.SelectItem.SelfWidget:OnGamePadUnSelected()
        end
        self.List_Task_Back:SetFocus()
        self.SelectItem = nil
        self.Owner:SwitchComKeyTipsState(3)
        self:AddDelayFrameFunc(function()
          local SelectItem = self.List_Task_Back:BP_GetSelectedItem()
          if SelectItem then
            SelectItem.SelfWidget:SetFocus()
            SelectItem.SelfWidget.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
          end
        end, 1, "ReturnSelectFocus")
      end
    else
      self.Owner:OnClose()
    end
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if self.TitleItem.InFocus then
      self.TitleItem.ListView_Rewards:SetFocus()
      self.IsInPhaseRewardFocus = true
    elseif self.CurWidget then
      self.Owner:SwitchComKeyTipsState(2)
      self.CurWidget.ListView_Rewards:SetFocus()
      self.CurWidget:OnRewardsAddedToFocusPath()
      if self.Flag then
        self.SelectItem = self.List_Task:BP_GetSelectedItem()
      else
        self.SelectItem = self.List_Task_Back:BP_GetSelectedItem()
      end
    end
    return true
  elseif "Gamepad_LeftTrigger" == InKeyName then
    if self.TitleItem.InFocus and not self.IsInPhaseFocus and not self.CantSwitch then
      self.TitleItem.Btn_Left:OnBtnClicked()
    end
    return true
  elseif "Gamepad_RightTrigger" == InKeyName then
    if self.TitleItem.InFocus and not self.IsInPhaseFocus and not self.CantSwitch then
      self.TitleItem.Btn_Right:OnBtnClicked()
    end
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    if self.StillHasReward then
      self:OnClickGetAllReward()
    end
    return true
  end
  return false
end

function WBP_ModArchive_Task_C:Handle_OnGamePadUp(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadUp", InKeyName, self:GetName())
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    if self.Flag then
      self.SelectItem = self.List_Task:BP_GetSelectedItem()
    else
      self.SelectItem = self.List_Task_Back:BP_GetSelectedItem()
    end
    if self.SelectItem and self.SelectItem.SelfWidget and self.SelectItem.SelfWidget.IsHovering then
      self:AddDelayFrameFunc(function()
        self.Owner:SwitchComKeyTipsState(2)
        self.SelectItem.SelfWidget:OnGamePadSelected()
      end, 1, "SelectItem")
    end
    if self.TitleItem.InFocus and not self.IsInPhaseRewardFocus and 1 == self.TitleItem.WS_Bottom:GetActiveWidgetIndex() then
      self.TitleItem.Btn_Get:OnBtnClicked()
    end
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if self.CurWidget and not self.CurWidget.ListView_Rewards:HasFocusedDescendants() then
      self.XInPress = false
      self.CurWidget:OnStartJumpOrReward()
    end
    return true
  end
  return false
end

function WBP_ModArchive_Task_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function WBP_ModArchive_Task_C:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Btn_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.TitleItem.Com_PageTurner:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.Collapsed)
    self.Btn_Reward:SetVisibility(ESlateVisibility.Visible)
    self.TitleItem.Com_PageTurner:SetVisibility(ESlateVisibility.Visible)
    if self.TitleItem.IsHovering then
      self.TitleItem:PlayAnimation(self.TitleItem.Unhover)
    end
    if self.StillHasReward then
      self.Owner:SwitchComKeyTipsState(4)
    else
      self.Owner:SwitchComKeyTipsState(1)
    end
  end
end

function WBP_ModArchive_Task_C:OnNavigateRight()
  local SelectItem = self.List_Task:GetItemAt(0)
  if not self.Flag then
    SelectItem = self.List_Task_Back:GetItemAt(0)
  end
  if SelectItem and SelectItem.SelfWidget then
    SelectItem.SelfWidget:SetFocus()
    SelectItem.SelfWidget:RefreshInputDeviceType()
    SelectItem.SelfWidget:OnFocusNew()
  end
end

return WBP_ModArchive_Task_C
