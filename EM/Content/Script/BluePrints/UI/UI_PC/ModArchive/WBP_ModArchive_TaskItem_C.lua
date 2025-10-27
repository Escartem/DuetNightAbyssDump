require("UnLua")
local WBP_ModArchive_TaskItem_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_ModArchive_TaskItem_C:OnListItemObjectSet(ListItemObject)
  ListItemObject.SelfWidget = self
  self.Content = ListItemObject
  self.Owner = self.Content.Owner
  self.TaskInfo = self.Content.TaskInfo
  self.InAnimFinished = false
  if self.Content.TaskDoNotInAnim then
    self:OnInAnimFinished()
  else
    self:PlayAnimation(self.In)
    self:BindToAnimationFinished(self.In, {
      self,
      self.OnInAnimFinished
    })
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshList()
  self:OnFocusLostNew()
end

function WBP_ModArchive_TaskItem_C:RefreshList()
  self:InitTaskItem()
end

function WBP_ModArchive_TaskItem_C:InitTaskItem()
  self.Text_Title:SetText(GText(self.TaskInfo.TaskName))
  self.Text_TitleNum:SetText(GText(self.TaskInfo.DisplayId))
  self.Text_Desc:SetText(GText(self.TaskInfo.TaskDes))
  if self.TaskInfo.Complete and self.TaskInfo.RewardsGot then
    self.Group_EndBG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_EndBG:SetVisibility(ESlateVisibility.Hidden)
  end
  self.Text_TaskRewards:SetText(GText("UI_ModGuideBook_RewardView"))
  if self.Key_Rewards then
    self.Key_Rewards:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  if self.TaskInfo.Complete and not self.TaskInfo.RewardsGot then
    self.WS_Bottom:SetActiveWidgetIndex(3)
    self.Btn_Reward:SetText(GText("UI_Achievement_GetReward"))
    self.Btn_Reward:UnBindEventOnClickedByObj(self)
    self.Btn_Reward:BindEventOnClicked(self, self.OnClickGetReward)
    self.Btn_Reward:SetDefaultGamePadImg("X")
  elseif self.TaskInfo.Complete and self.TaskInfo.RewardsGot then
    self.WS_Bottom:SetActiveWidgetIndex(2)
    self.Text_Got:SetText(GText("UI_Finished"))
  elseif self.TaskInfo.TaskType == "Collect" then
    self.WS_Bottom:SetActiveWidgetIndex(1)
  else
    self.WS_Bottom:SetActiveWidgetIndex(0)
    self.Btn_Build:SetText(GText("UI_GameEvent_EventPortal_Goto"))
    self.Btn_Build:UnBindEventOnClickedByObj(self)
    self.Btn_Build:BindEventOnClicked(self, self.OnClickJumpTo)
  end
  self.ListView_Rewards.BP_OnEntryInitialized:Clear()
  self.ListView_Rewards.BP_OnEntryInitialized:Add(self, self.OnEntryInitialized)
  self.ListView_Rewards:ClearListItems()
  local Rewards = {}
  for i = 1, #self.TaskInfo.TaskReward do
    local Reward = DataMgr.Reward[self.TaskInfo.TaskReward[i]]
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
  end
  self:SortRewardsArray(Rewards)
  for i = 1, #Rewards do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = Rewards[i].Id
    Content.Count = Rewards[i].Count
    Content.Icon = Rewards[i].Icon
    Content.Rarity = Rewards[i].Rarity
    Content.IsShowDetails = Rewards[i].IsShowDetails
    Content.ItemType = Rewards[i].ItemType
    Content.bHasGot = self.TaskInfo.Complete and self.TaskInfo.RewardsGot
    
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
    self.ListView_Rewards:AddItem(Content)
  end
  self.List_Reward:ClearChildren()
  if self.TaskInfo.TaskType == "Jump" then
  elseif self.TaskInfo.TaskType == "Collect" then
    local TargetMods = {}
    self.Mods = {}
    local CompleteNum = 0
    self.ModNum = #self.TaskInfo.CollectTaskTypeParam
    for i = 1, self.ModNum do
      local ModId = self.TaskInfo.CollectTaskTypeParam[i]
      local ModInfo = DataMgr.Mod[self.TaskInfo.CollectTaskTypeParam[i]]
      if self.TaskInfo.ModStates[ModId] then
        CompleteNum = CompleteNum + 1
      end
      local Content = {
        Id = ModId,
        Rarity = ModInfo.Rarity,
        Icon = ModInfo.Icon,
        ItemType = "Mod",
        IsShowDetails = true,
        HandleMouseDown = true,
        AfterInitCallback = function(Widget)
          Widget.WS:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          if self.TaskInfo.ModStates[Widget.Content.Id] or self.TaskInfo.Complete then
            Widget.WS:SetActiveWidgetIndex(1)
          else
            Widget.WS:SetActiveWidgetIndex(0)
          end
          Widget:BindEvents(self, {
            OnMenuOpenChanged = self.OnTipsOpenChanged
          })
        end
      }
      self.Mods[ModId] = self:CreateWidgetNew("ModArchiveTaskSubItem")
      self.List_Reward:AddChild(self.Mods[ModId])
      self.Mods[ModId]:Init(Content)
      self.Mods[ModId]:SetNavigationRuleCustom(EUINavigation.Left, {
        self,
        self.OnNavigateLeft
      })
      self.Mods[ModId]:SetNavigationRuleCustom(EUINavigation.Right, {
        self,
        self.OnNavigateRight
      })
      self.Mods[ModId]:SetNavigationRuleCustom(EUINavigation.Up, {
        self,
        self.OnNavigateUp
      })
      self.Mods[ModId]:SetNavigationRuleCustom(EUINavigation.Down, {
        self,
        self.OnNavigateDown
      })
    end
    self.Text_Progressing:SetText(GText("UI_ModGuideBook_Task_Collecting") .. " (" .. CompleteNum .. "/" .. #self.TaskInfo.CollectTaskTypeParam .. ")")
    self.ListView_Rewards:SetNavigationRuleCustom(EUINavigation.Up, {
      self,
      self.OnRewardNavigateUp
    })
  end
end

function WBP_ModArchive_TaskItem_C:OnClickJumpTo()
  if self.TaskInfo.Complete or self.TaskInfo.TaskType == "Collect" then
    return
  end
  PageJumpUtils:JumpToTargetPageByJumpId(self.TaskInfo.JumpTaskTypeParam[1])
end

function WBP_ModArchive_TaskItem_C:SortRewardsArray(RewardsArray)
  table.sort(RewardsArray, function(a, b)
    if a.Rarity ~= b.Rarity then
      return a.Rarity > b.Rarity
    end
    if a.Id ~= b.Id then
      return a.Id > b.Id
    end
    if a.Count ~= b.Count then
      return a.Count > b.Count
    end
    return false
  end)
end

function WBP_ModArchive_TaskItem_C:OnTipsOpenChanged(bIsOpen)
  DebugPrint("zwkkk OnTipsOpenChanged", bIsOpen, self:GetName())
  self.Owner:OnTipsOpenChanged(bIsOpen, self)
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if bIsOpen then
    DebugPrint("zw1234 OnTipsOpenChanged Collapsed")
    self.Key_Rewards:SetVisibility(ESlateVisibility.Collapsed)
  elseif not self.ListView_Rewards:HasFocusedDescendants() then
    self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_TaskItem_C:OnClickGetReward()
  local Avatar = GWorld:GetAvatar()
  
  local function CallBack(ErrCode, Reward)
    if ErrorCode:Check(ErrCode) then
      local ItemPage = UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, Reward)
      self.TaskInfo.RewardsGot = true
      self:SetReward()
      self.Owner:CheckAllRewardBtnState()
      self.Owner.Owner:RefreshReddot()
    end
  end
  
  Avatar:ModBookQuestGetReward(self.TaskInfo.TaskId, CallBack)
end

function WBP_ModArchive_TaskItem_C:SetReward()
  self:InitTaskItem()
end

function WBP_ModArchive_TaskItem_C:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large", nil, nil)
  if self.InAnimFinished then
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
  end
  self.IsHovering = true
  if self.Owner then
    self.Owner.CurWidget = self
  end
  DebugPrint("zwkkk Hover")
end

function WBP_ModArchive_TaskItem_C:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if self.InAnimFinished then
    self:StopAllAnimations()
    self:PlayAnimation(self.UnHover)
  end
  self.IsHovering = false
  DebugPrint("zwkkk UnHover")
end

function WBP_ModArchive_TaskItem_C:OnClickItem()
  DebugPrint("zwkkk OnClickItem")
end

function WBP_ModArchive_TaskItem_C:OnStartJumpOrReward()
  if 3 == self.WS_Bottom:GetActiveWidgetIndex() then
    self.Btn_Reward:StopAllAnimations()
    self.Btn_Reward:PlayAnimation(self.Btn_Reward.Normal)
    self:OnClickGetReward()
  elseif 0 == self.WS_Bottom:GetActiveWidgetIndex() then
    self.Btn_Build:StopAllAnimations()
    self.Btn_Build:PlayAnimation(self.Btn_Build.Normal)
    self:OnClickJumpTo()
  end
end

function WBP_ModArchive_TaskItem_C:OnGamePadSelected()
  self:SetFocus()
  DebugPrint("zwkkk OnGamePadSelected")
  if self.List_Reward:GetChildrenCount() > 0 then
    DebugPrint("zwkkk \233\173\148\228\185\139\230\165\148Item\232\162\171\232\129\154\231\132\166\228\186\134")
    self.List_Reward:GetChildAt(0):SetFocus()
    self.SelectedModIndex = 0
  else
    DebugPrint("zwkkk \230\140\137\231\144\134\230\157\165\232\175\180\229\186\148\232\175\165\232\191\155\229\136\176\229\165\150\229\138\177\230\160\143\228\186\134", self.RewardIdSelected)
    self.ListView_Rewards:SetFocus()
    self:OnRewardsAddedToFocusPath()
  end
  self.IsSelected = true
end

function WBP_ModArchive_TaskItem_C:OnGamePadUnSelected()
  DebugPrint("zwkkkk OnGamePadUnSelected", self.ListView_Rewards:HasAnyUserFocus())
  self.ListView_Rewards:BP_ClearSelection()
  self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.IsSelected = false
end

function WBP_ModArchive_TaskItem_C:OnEntryInitialized(Item, Widget)
  Widget.WidgetMap = nil
end

function WBP_ModArchive_TaskItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  DebugPrint("zwkkk12 \232\142\183\229\190\151\232\129\154\231\132\166")
  self.InFocus = true
  if self.CurInputDeviceType == ECommonInputType.Gamepad and self.Owner and self.Owner.Owner and 3 ~= self.Owner.Owner.CurTipsIndex then
    self.Owner.Owner:SwitchComKeyTipsState(3)
  end
end

function WBP_ModArchive_TaskItem_C:OnFocusLost(InFocusEvent)
  DebugPrint("zwkkk12 \229\164\177\229\142\187\232\129\154\231\132\166")
  self.InFocus = false
  if not self:HasFocusedDescendants() then
    self:OnFocusLostNew()
  end
end

function WBP_ModArchive_TaskItem_C:OnInAnimFinished()
  self.InAnimFinished = true
  if self:HasAnyUserFocus() then
    self:OnFocusNew()
  end
  if self.IsHovering then
    self:PlayAnimation(self.Hover)
  end
end

function WBP_ModArchive_TaskItem_C:OnAddedToFocusPath(InFocusEvent)
  DebugPrint("zwkkk1234 OnAddedToFocusPath")
end

function WBP_ModArchive_TaskItem_C:OnRemovedFromFocusPath(InFocusEvent)
  DebugPrint("zwkkk1234 OnRemovedFromFocusPath")
end

function WBP_ModArchive_TaskItem_C:RefreshInputDeviceType()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function WBP_ModArchive_TaskItem_C:OnFocusNew()
  DebugPrint("zw123 OnFocusNew ", self.CurInputDeviceType, self.CurInputDeviceType == ECommonInputType.GamePad, self.Owner)
  if self.CurInputDeviceType and self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_TaskItem_C:OnFocusLostNew()
  if self.CurInputDeviceType and self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
    self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.Collapsed)
    self.Key_Rewards:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_TaskItem_C:OnNavigateLeft()
  if self.SelectedModIndex <= 0 then
    return
  end
  if self.SelectedModIndex % 4 > 0 then
    self.SelectedModIndex = self.SelectedModIndex - 1
    self.List_Reward:GetChildAt(self.SelectedModIndex):SetFocus()
    return self.List_Reward:GetChildAt(self.SelectedModIndex)
  end
  return
end

function WBP_ModArchive_TaskItem_C:OnNavigateRight()
  if self.SelectedModIndex < 0 then
    return
  end
  if self.SelectedModIndex == self.ModNum - 1 then
    return
  end
  if self.SelectedModIndex % 4 < 3 then
    self.SelectedModIndex = self.SelectedModIndex + 1
    self.List_Reward:GetChildAt(self.SelectedModIndex):SetFocus()
    return self.List_Reward:GetChildAt(self.SelectedModIndex)
  end
  return
end

function WBP_ModArchive_TaskItem_C:OnNavigateUp()
  if self.SelectedModIndex < 4 then
    return
  end
  self.SelectedModIndex = self.SelectedModIndex - 4
  self.List_Reward:GetChildAt(self.SelectedModIndex):SetFocus()
  return self.List_Reward:GetChildAt(self.SelectedModIndex)
end

function WBP_ModArchive_TaskItem_C:OnNavigateDown()
  if self.SelectedModIndex < 0 then
    return
  end
  if self.SelectedModIndex > self.ModNum - 5 then
    self.SelectedModIndex = -1
    self.ListView_Rewards:SetFocus()
    self:OnRewardsAddedToFocusPath()
    return
  end
  self.SelectedModIndex = self.SelectedModIndex + 4
  self.List_Reward:GetChildAt(self.SelectedModIndex):SetFocus()
  return self.List_Reward:GetChildAt(self.SelectedModIndex)
end

function WBP_ModArchive_TaskItem_C:OnRewardNavigateUp()
  self.SelectedModIndex = 0
  self:OnRewardsRemovedFromFocusPath()
  return self.List_Reward:GetChildAt(self.SelectedModIndex)
end

function WBP_ModArchive_TaskItem_C:OnRewardsAddedToFocusPath()
  self.FocusInRewards = true
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self.Key_Rewards:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.Collapsed)
end

function WBP_ModArchive_TaskItem_C:OnRewardsRemovedFromFocusPath()
  self.FocusInRewards = false
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_ModArchive_TaskItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName, self:GetName())
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function WBP_ModArchive_TaskItem_C:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self:HasAnyUserFocus() or self.List_Reward:HasFocusedDescendants() then
      DebugPrint("zwjkjkkj ", self:GetName())
      self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      if self.Key_Rewards then
        self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    else
      self:AddDelayFrameFunc(function()
        self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
        self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.Collapsed)
        if self:HasAnyUserFocus() and not self.ListView_Rewards:HasFocusedDescendants() then
          self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
          self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
        end
      end, 1, "CollapseBtn")
    end
    if self.List_Reward:HasFocusedDescendants() or self.ListView_Rewards:HasFocusedDescendants() then
      self.Owner.Owner:SwitchComKeyTipsState(2)
    end
  elseif self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard and self.Key_Rewards then
    DebugPrint("zw1234 UpdateOnInputDeviceTypeChange Collapsed")
    self.Key_Rewards:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return WBP_ModArchive_TaskItem_C
