require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_ModArchive_Main_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ModArchive_Main_C:Construct()
  self.Btn_Close:Init("Close", self, self.OnCloseBtnClick)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if self.CurInputDeviceType and self.CurInputDeviceType ~= ECommonInputType.GamePad then
    self:SwitchComKeyTipsState(1)
  else
    self:SwitchComKeyTipsState(3)
  end
end

function WBP_ModArchive_Main_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Owner = (...)
  DebugPrint("\233\173\148\228\185\139\229\140\163 ", self.Owner)
  self.CurTipsIndex = 1
  self.Group_Page:ClearChildren()
  self.IsClosing = false
  self.CurTab = 0
  self.TabMain = {}
  self.MaxPhase = #DataMgr.ModTaskPhase
  self.TaskHasReddotIndex = {}
  self:RefreshData()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mozhixia_open", "ModArchiveOpen", nil)
  EventManager:AddEvent(EventID.OnGuideEnd, self, self.OnGuideEnd)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnFirstInFinished
  })
  self:PlayAnimation(self.In)
  self:InitArchiveTab()
  self.Text_Title:SetText(GText("MAIN_UI_MODGUIDEBOOK"))
  self:RefreshDot()
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    self:BlockAllUIInput(true)
  end
  self:AddTabReddotListen()
end

function WBP_ModArchive_Main_C:InitArchiveTab()
  DebugPrint("zwkk InitArchiveTab")
  local Tabs = {}
  Tabs[1] = {
    Text = GText("UI_ModGuideBook_Task"),
    Idx = 1
  }
  Tabs[2] = {
    Text = GText("UI_ModGuideBook_Archive_Mod"),
    Idx = 2
  }
  Tabs[3] = {
    Text = GText("UI_ModGuideBook_Recommend"),
    Idx = 3
  }
  local ConfigData = {
    Owner = self,
    LeftKey = "Q",
    RightKey = "E",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder",
    ChildWidgetName = "ModArchiveTabSubItem",
    Tabs = Tabs,
    SoundFuncReceiver = self,
    SoundFunc = self.MainTabClickSoundFunc
  }
  self.ModArchive_Tab:Init(ConfigData)
  self.ModArchive_Tab:BindEventOnTabSelected(self, self.OnTabSelected)
  local TabId = self:CheckTabId()
  self.ModArchive_Tab:SelectTab(TabId)
end

function WBP_ModArchive_Main_C:OnTabSelected()
  DebugPrint("zwkk OnTabSelected", self.CurTab)
  local NextTab = self.ModArchive_Tab:GetCurrentTabIndex()
  if NextTab ~= self.CurTab then
    DebugPrint("zwkk OnTabSelected111", self.CurTab)
    if 2 == self.CurTab and self.TabMain[2] then
      self.TabMain[2]:PreClose()
    end
    self.CurTab = NextTab
    self:PreSwitchPanel(self.CurTab)
    if self.TabMain[self.CurTab] then
      self.TabMain[self.CurTab]:OnSelected()
    elseif not self.TabMain[self.CurTab] then
      if 1 == self.CurTab then
        self:InitTaskPanel()
      elseif 2 == self.CurTab then
        self:InitArchivePanel()
      elseif 3 == self.CurTab then
        self:InitRecommendPanel()
      end
    end
    if 2 == self.CurTab and self.TabMain[2] then
      self.TabMain[2]:AddTabReddotListen()
    elseif self.TabMain[2] then
      self.TabMain[2]:RemoveTabReddotListen()
    end
    if 1 == self.CurTab then
      AudioManager(self):PlayUISound(self, "event:/ui/common/mozhixia_state_change_in", nil, nil)
    end
  end
end

function WBP_ModArchive_Main_C:InitTaskPanel()
  self.TaskPanel = self:CreateWidgetNew("ModArchiveTask")
  self.Group_Page:AddChild(self.TaskPanel)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.TaskPanel)
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  local Params = {Owner = self, Index = 1}
  self.TaskPanel:OnSelected(Params)
  self.TabMain[1] = self.TaskPanel
end

function WBP_ModArchive_Main_C:InitArchivePanel()
  self.ArchivePanel = self:CreateWidgetNew("ModArchiveArchive")
  self.Group_Page:AddChild(self.ArchivePanel)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.ArchivePanel)
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  local Params = {Owner = self, Index = 2}
  self.ArchivePanel:OnSelected(Params)
  self.TabMain[2] = self.ArchivePanel
end

function WBP_ModArchive_Main_C:InitRecommendPanel()
  self.RecommendPanel = self:CreateWidgetNew("ModArchiveRecommend")
  self.Group_Page:AddChild(self.RecommendPanel)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.RecommendPanel)
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  local Params = {Owner = self, Index = 3}
  self.RecommendPanel:OnSelected(Params)
  self.TabMain[3] = self.RecommendPanel
end

function WBP_ModArchive_Main_C:PreSwitchPanel(Idx)
  for i = 1, 3 do
    if i ~= Idx and self.TabMain[i] then
      self.TabMain[i]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_ModArchive_Main_C:CheckTabId()
  local Data = DataMgr.ModGuideBookTask
  local Avatar = GWorld:GetAvatar()
  for i, v in pairs(Data) do
    DebugPrint("123123456 ", i, v)
    local ModBookQuest = Avatar.ModBookQuests:GetModBookQuest(i)
    if ModBookQuest.IsComplete and not ModBookQuest:IsComplete() then
      return 1
    end
  end
  return 2
end

function WBP_ModArchive_Main_C:OnCloseBtnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:OnClose()
end

function WBP_ModArchive_Main_C:OnClose()
  if self.IsClosing then
    return
  end
  self.IsClosing = true
  self:PlayAnimation(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  AudioManager(self):SetEventSoundParam(self, "ModArchiveOpen", {ToEnd = 1})
  AudioManager(self):StopSound(self, "ModArchiveOpen")
end

function WBP_ModArchive_Main_C:Close()
  DebugPrint("zwkkk Close")
  if self.TabMain[2] then
    self.TabMain[2]:PreClose()
  end
  EventManager:FireEvent(EventID.OnMainUIReddotUpdate)
  self:RemoveTabReddotListen()
  WBP_ModArchive_Main_C.Super.Close(self)
end

function WBP_ModArchive_Main_C:MainTabClickSoundFunc()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
end

function WBP_ModArchive_Main_C:OnTipsOpenChanged(bIsOpen)
  DebugPrint("zwkkk OnTipsOpenChanged", bIsOpen, self:GetName())
  if not self.CurInputDeviceType or self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if bIsOpen then
    self.Com_KeyTips:SetVisibility(ESlateVisibility.Collapsed)
    self.ModArchive_Tab.Key_Left:SetVisibility(ESlateVisibility.Hidden)
    self.ModArchive_Tab.Key_Right:SetVisibility(ESlateVisibility.Hidden)
  else
    self.Com_KeyTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ModArchive_Tab.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ModArchive_Tab.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_Main_C:HideTabKey(Hide)
  if not self.CurInputDeviceType or self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if Hide then
    self.ModArchive_Tab.Key_Left:SetVisibility(ESlateVisibility.Hidden)
    self.ModArchive_Tab.Key_Right:SetVisibility(ESlateVisibility.Hidden)
  else
    self.ModArchive_Tab.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ModArchive_Tab.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_Main_C:OnClickSpace()
  if self.TabMain[self.CurTab] and self.TabMain[self.CurTab].OnSpaceBarKeyDown then
    self.TabMain[self.CurTab]:OnSpaceBarKeyDown()
  end
end

function WBP_ModArchive_Main_C:OnFirstInFinished()
  if self.ShouldShowTips and not CommonUtils:IfExistSystemGuideUI(self) then
    self:LoadUINew("ModArchiveUpdateTips", self.TipsModShows, self.TipsModUnlocks, self)
  else
    self.InFinished = true
  end
  if self.TabMain and self.TabMain[self.CurTab] and self.TabMain[self.CurTab].HasSelected and self.TabMain[self.CurTab].OnMainInFinish then
    self.TabMain[self.CurTab]:OnMainInFinish()
  end
  self:BlockAllUIInput(false)
end

function WBP_ModArchive_Main_C:OnShowTipsClose()
  self.InFinished = true
  self.ShouldShowTips = false
  if self.TabMain and self.TabMain[self.CurTab] and self.TabMain[self.CurTab].HasSelected and self.TabMain[self.CurTab].OnShowTipsClose then
    self.TabMain[self.CurTab]:OnShowTipsClose()
  end
end

function WBP_ModArchive_Main_C:RefreshData()
  self.RewardGets = {}
  local Avatar = GWorld:GetAvatar()
  local ModBookCompleteConditions = {}
  local PreCompleteConditions = EMCache:Get("ModBookCompleteConditions", true)
  local ModShows = {}
  local ModUnlocks = {}
  local ModBookCanGetRewards = {}
  local ModArchiveNewByViewState = false
  self.ModBookModsViewState = EMCache:Get("ModBookModsViewState", true)
  if not self.ModBookModsViewState then
    self.ModBookModsViewState = {}
  end
  local Data = DataMgr.ModGuideBookArchive
  for i, v in pairs(Data) do
    if v.ShowCondition and ConditionUtils.CheckCondition(Avatar, v.ShowCondition) then
      if not ModBookCompleteConditions[i] then
        ModBookCompleteConditions[i] = {}
      end
      ModBookCompleteConditions[i][1] = true
      ModBookCompleteConditions[i][2] = ModBookCompleteConditions[i][2] or false
      if not (PreCompleteConditions and PreCompleteConditions[i]) or not PreCompleteConditions[i][1] then
        for k = 1, #v.ModList do
          table.insert(ModShows, v.ModList[k])
        end
      end
    end
    if v.UnlockCondition and ConditionUtils.CheckCondition(Avatar, v.UnlockCondition) then
      if not ModBookCompleteConditions[i] then
        ModBookCompleteConditions[i] = {}
      end
      ModBookCompleteConditions[i][2] = true
      ModBookCompleteConditions[i][1] = ModBookCompleteConditions[i][1] or false
      if not (PreCompleteConditions and PreCompleteConditions[i]) or not PreCompleteConditions[i][2] then
        for k = 1, #v.ModList do
          table.insert(ModUnlocks, v.ModList[k])
        end
      end
    end
    if (v.ShowCondition or v.UnlockCondition) and (v.ShowCondition and ConditionUtils.CheckCondition(Avatar, v.ShowCondition) or v.UnlockCondition and ConditionUtils.CheckCondition(Avatar, v.UnlockCondition)) and not self.ModBookModsViewState[i] then
      self.ModBookModsViewState[i] = {}
      for Id = 1, #v.ModList do
        local ModId = v.ModList[Id]
        self.ModBookModsViewState[i][ModId] = true
        ModArchiveNewByViewState = true
      end
    end
    local CanGet = true
    if not (not v.ShowCondition or ConditionUtils.CheckCondition(Avatar, v.ShowCondition)) or v.UnlockCondition and not ConditionUtils.CheckCondition(Avatar, v.UnlockCondition) then
      CanGet = false
    else
      for k = 1, #v.ModList do
        local ModId = v.ModList[k]
        if not Avatar.HoldMods[ModId] then
          CanGet = false
          break
        end
      end
    end
    if CanGet and Avatar.HoldModRewards[i] then
      CanGet = false
    end
    self.RewardGets[i] = CanGet
    ModBookCanGetRewards[i] = CanGet
    if CanGet then
      self.ShowArchiveReddot = true
    end
  end
  EMCache:Set("ModBookCompleteConditions", ModBookCompleteConditions, true)
  EMCache:Set("ModBookCanGetRewards", ModBookCanGetRewards, true)
  EMCache:Set("ModBookModsViewState", self.ModBookModsViewState, true)
  EMCache:Set("ModArchiveNewByViewState", ModArchiveNewByViewState, true)
  if #ModShows > 0 or #ModUnlocks > 0 then
    DebugPrint("\229\138\160\232\189\189\229\188\185\231\170\151 ")
    self.ShouldShowTips = true
    self.TipsModShows = ModShows
    self.TipsModUnlocks = ModUnlocks
  end
end

function WBP_ModArchive_Main_C:RefreshDot()
  self:RefreshNewdot()
  self:RefreshReddot()
end

function WBP_ModArchive_Main_C:RefreshReddot()
  local ModBookCanGetRewards = EMCache:Get("ModBookCanGetRewards", true) or {}
  local Groups = DataMgr.ModGuideBookArchive
  local SubTabRed = {}
  local ArchiveTabRed = false
  for i, v in pairs(ModBookCanGetRewards) do
    if v then
      DebugPrint("\229\186\148\232\175\165\230\156\137\231\186\162\231\130\185 ", tonumber(i))
      local ArchiveId = tonumber(i)
      local TabId = DataMgr.ModGuideBookArchive[ArchiveId].TabId
      SubTabRed[TabId] = true
      ArchiveTabRed = true
    end
  end
  local TaskTabRed = false
  local ReddotNode = "ModArchive_Task"
  local Avatar = GWorld:GetAvatar()
  self.TaskHasReddotIndex = {}
  ReddotManager.ClearLeafNodeCount(ReddotNode)
  for PhaseId, Info in pairs(DataMgr.ModPhaseId2QuestId) do
    local TaskReddotNum = 0
    local CurPhaseTaskAllComplete = true
    for _, TaskId in pairs(Info) do
      local TaskAvatarInfo = Avatar.ModBookQuests[TaskId]
      if TaskAvatarInfo and 0 ~= TaskAvatarInfo.FinishTime then
        if not TaskAvatarInfo.RewardsGot then
          self.TaskHasReddotIndex[PhaseId] = true
          TaskTabRed = true
          TaskReddotNum = TaskReddotNum + 1
        end
      else
        CurPhaseTaskAllComplete = false
      end
    end
    if CurPhaseTaskAllComplete and not Avatar.ModBookQuestPhaseRewardsGot[PhaseId] then
      self.TaskHasReddotIndex[PhaseId] = true
      TaskTabRed = true
      TaskReddotNum = TaskReddotNum + 1
    end
    if TaskReddotNum > 0 then
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
      CacheDetail = CacheDetail or {}
      if not CacheDetail.PhaseId then
        CacheDetail.PhaseId = PhaseId
      end
      ReddotManager.IncreaseLeafNodeCount(ReddotNode, TaskReddotNum, CacheDetail)
    end
  end
  if self.TabMain[1] then
    self.TabMain[1]:RefreshTabReddot()
  end
end

function WBP_ModArchive_Main_C:RefreshNewdot()
  local ModBookModsViewState = EMCache:Get("ModBookModsViewState", true) or {}
  local ModArchiveNewByViewState = false
  local HasNewTabs = {}
  local SubTabNew = {}
  local MainTabNew = false
  for i, v in pairs(ModBookModsViewState) do
    for ModIdString, IsNew in pairs(v) do
      if IsNew then
        DebugPrint("\229\147\170\228\184\170\230\152\175new ", ModIdString, i)
        local ArchiveId = tonumber(i)
        HasNewTabs[ArchiveId] = true
        if DataMgr.ModGuideBookArchive[ArchiveId] and DataMgr.ModGuideBookArchive[ArchiveId].TabId then
          local TabId = DataMgr.ModGuideBookArchive[ArchiveId].TabId
          if not SubTabNew[TabId] then
            SubTabNew[TabId] = true
          end
          MainTabNew = true
          ModArchiveNewByViewState = true
        end
      end
    end
  end
  EMCache:Set("ModArchiveNewByViewState", ModArchiveNewByViewState, true)
end

function WBP_ModArchive_Main_C:AddTabReddotListen()
  local ReddotName = "ModArchive_Task"
  if ReddotName then
    ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
      if Count > 0 then
        if RdType == EReddotType.Normal then
          self.ModArchive_Tab:ShowTabRedDot(1, false, true)
        elseif RdType == EReddotType.New then
          self.ModArchive_Tab:ShowTabRedDot(1, true, false)
        end
      else
        self.ModArchive_Tab:ShowTabRedDot(1, false, false)
      end
    end)
  end
  local ReddotName = "ModArchive_Archive"
  if ReddotName then
    ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
      if Count > 0 then
        if RdType == EReddotType.Normal then
          self.ModArchive_Tab:ShowTabRedDot(2, false, true)
        elseif RdType == EReddotType.New then
          self.ModArchive_Tab:ShowTabRedDot(2, true, false)
        end
      else
        self.ModArchive_Tab:ShowTabRedDot(2, false, false)
      end
    end)
  end
end

function WBP_ModArchive_Main_C:RemoveTabReddotListen()
  ReddotManager.RemoveListener("ModArchive_Task", self)
  ReddotManager.RemoveListener("ModArchive_Archive", self)
  if self.TabMain and self.TabMain[2] then
    self.TabMain[2]:RemoveTabReddotListen()
  end
end

function WBP_ModArchive_Main_C:OnGuideEnd()
  EventManager:RemoveEvent(EventID.OnGuideEnd, self)
  if self.TabMain and self.TabMain[self.CurTab] and self.TabMain[self.CurTab].OnGuideEnd then
    self.TabMain[self.CurTab]:OnGuideEnd()
  end
end

function WBP_ModArchive_Main_C:Destruct()
  EventManager:RemoveEvent(EventID.OnGuideEnd, self)
  WBP_ModArchive_Main_C.Super.Destruct(self)
end

function WBP_ModArchive_Main_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if self.InFinished then
      IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
    end
  elseif self.InFinished then
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Main_C:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self:OnClose()
    return true
  elseif "Q" == InKeyName then
    self.ModArchive_Tab:TabToLeft()
    return true
  elseif "E" == InKeyName then
    self.ModArchive_Tab:TabToRight()
    return true
  end
  return false
end

function WBP_ModArchive_Main_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_DPad_Up" == InKeyName or "Gamepad_LeftStick_Up" == InKeyName then
    return true
  elseif "Gamepad_DPad_Down" == InKeyName or "Gamepad_LeftStick_Down" == InKeyName then
    return true
  elseif "Gamepad_DPad_Left" == InKeyName or "Gamepad_LeftStick_Left" == InKeyName then
    return true
  elseif "Gamepad_DPad_Right" == InKeyName or "Gamepad_LeftStick_Right" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.TabMain and self.TabMain[self.CurTab] and self.TabMain[self.CurTab].CurWidget and self.TabMain[self.CurTab].CurWidget.IsSelected then
      return false
    end
    DebugPrint("zwjkl Close")
    self:OnClose()
    return true
  elseif "Gamepad_LeftShoulder" == InKeyName then
    self.ModArchive_Tab:TabToLeft()
    return true
  elseif "Gamepad_RightShoulder" == InKeyName then
    self.ModArchive_Tab:TabToRight()
    return true
  end
  return false
end

function WBP_ModArchive_Main_C:ReceiveEnterState(StackAction)
  WBP_ModArchive_Main_C.Super.ReceiveEnterState(self, StackAction)
  DebugPrint("zwkkk ReceiveEnterState", StackAction)
  if self.TabMain and self.TabMain[self.CurTab] and self.TabMain[self.CurTab].HasSelected and self.TabMain[self.CurTab].RefreshInfo then
    self:RefreshData()
    self:RefreshDot()
    self.TabMain[self.CurTab]:RefreshInfo()
    if self.TabMain[self.CurTab].RefreshLRBtnState then
      self.TabMain[self.CurTab]:RefreshLRBtnState()
    end
  end
end

function WBP_ModArchive_Main_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:InitBtnTipsUI()
end

function WBP_ModArchive_Main_C:InitBtnTipsUI()
  if self.CurInputDeviceType and self.CurInputDeviceType == ECommonInputType.GamePad then
    self.ModArchive_Tab.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ModArchive_Tab.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SwitchComKeyTipsState(3)
  else
    self:SwitchComKeyTipsState(1)
  end
end

function WBP_ModArchive_Main_C:SwitchComKeyTipsState(Index)
  if self.CurInputDeviceType and self.CurInputDeviceType == ECommonInputType.Touch then
    return
  end
  if not self.Com_KeyTips then
    return
  end
  DebugPrint("zwkkjjkk      Index", Index)
  self.CurTipsIndex = Index
  if 1 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClose,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 2 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 3 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Select")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 4 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.OnClickSpace,
            Owner = self
          }
        },
        Desc = GText("UI_CTL_ClaimALL")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClose,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 5 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Select")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 6 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Claim")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  elseif 7 == Index then
    local KeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_KeyTips:UpdateKeyInfo(KeyInfo)
  end
end

return WBP_ModArchive_Main_C
