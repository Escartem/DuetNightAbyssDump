require("UnLua")
local WBP_Task_NpcSideTaskTips_C = Class("BluePrints.UI.BP_UIState_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function WBP_Task_NpcSideTaskTips_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_Task_NpcSideTaskTips_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.ReceiveNode = (...)
  self:PlayAnimation(self.In)
  local TextTitle = GText("UI_QUEST_SUBTAB_NAME_SIDE")
  if DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId] and DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId].QuestChainType == Const.SpecialSideQuestChainType then
    TextTitle = GText("UI_QUEST_SUBTAB_NAME_SpecialSlide")
  end
  self.Text_Title:SetText(TextTitle)
  if DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId] then
    local BranchQuestChainName = DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId].QuestChainName or "UI_QUEST_UNKNOWN"
    local BranchQuestNpcNameId = DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId].QuestNpcId or "UI_QUEST_UNKNOWN"
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local SignTexture = TaskUtils:GetGrayIconTextureByQuestChainType(self.ReceiveNode.SideQuestChainId)
      if SignTexture then
        self.Image_Sign:SetBrushResourceObject(SignTexture)
      end
    end
    local NpcName
    if "UI_QUEST_UNKNOWN" ~= BranchQuestNpcNameId then
      NpcName = DataMgr.Npc[BranchQuestNpcNameId].UnitName
    end
    self.Text_SideTitleName:SetText(GText(BranchQuestChainName))
    if nil ~= NpcName then
      self.Text_NPCName:SetText(GText(NpcName))
    end
  else
    self.Text_SideTitleName:SetText(GText("UI_QUEST_UNKNOWN"))
    self.Text_NPCName:SetText("NICKNAME")
  end
  local BranchQuestTitle = "UI_QUEST_CONTENT"
  local BranchQuestDetail = DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId].QuestDetail or "UI_QUEST_UNKNOWN"
  self.Text_MissionDetailTitle:SetText(GText(BranchQuestTitle))
  self.Text_TaskDetail:SetText(GText(BranchQuestDetail))
  self.Text_RewardDetailTitle:SetText(GText("UI_QUEST_REWARDS"))
  self.Btn_Start:SetText(GText("UI_Quest_TakeQuest"))
  self.Btn_Start:BindEventOnClicked(self, self.Approve)
  self.Btn_Close:BindEventOnClicked(self, self.Cancel)
  self:InitRewardList()
  self.EMScrollBox_3:ScrollToStart()
  self:SetFocus()
  self.Key_TitleRewards:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self:InitCommonWidget()
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_talk_stage", "OpenNpcSideTips", nil)
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_task_panel_show", "OpenNpcSideTips_Extra", nil)
end

function WBP_Task_NpcSideTaskTips_C:Destruct()
  self.Super.Destruct(self)
  AudioManager(self):SetEventSoundParam(self, "OpenNpcSideTips", {ToEnd = 1})
end

function WBP_Task_NpcSideTaskTips_C:InitRewardList()
  local RewardList = DataMgr.QuestChain[self.ReceiveNode.SideQuestChainId].QuestChainReward
  local TempRewardRetTable = {}
  if RewardList then
    for _, RewardId in pairs(RewardList) do
      local RewardInfo = DataMgr.Reward[RewardId]
      if RewardInfo then
        local Ids = RewardInfo.Id or {}
        local RewardCount = RewardInfo.Count or {}
        local TableName = RewardInfo.Type or {}
        for i = 1, #Ids do
          local ItemId = Ids[i]
          local Count = RewardUtils:GetCount(RewardCount[i])
          local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
          local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          local ItemType = TableName[i]
          local RewardContent = TaskUtils:CreateRewardContent({
            Id = ItemId,
            Count = Count,
            OwnerWidget = self,
            Icon = Icon,
            Rarity = Rarity,
            IsShowDetails = true,
            ItemType = ItemType
          })
          RewardContent.OnMenuOpenChangedEvents = {
            Obj = self,
            Callback = self.OnRewardItemMenuAnchorChanged
          }
          table.insert(TempRewardRetTable, RewardContent)
        end
      end
    end
  end
  if not IsEmptyTable(TempRewardRetTable) then
    table.sort(TempRewardRetTable, function(a, b)
      return a.Rarity > b.Rarity
    end)
    for _, v in pairs(TempRewardRetTable) do
      self.List_Reward:AddItem(v)
    end
  end
end

function WBP_Task_NpcSideTaskTips_C:Approve()
  self.ReceiveNode:FinishAction("ApproveOut")
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm_positive", nil, nil)
end

function WBP_Task_NpcSideTaskTips_C:Cancel()
  self.ReceiveNode:FinishAction("CancelOut")
end

function WBP_Task_NpcSideTaskTips_C:CloseTips()
  self.List_Reward:ClearListItems()
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.Out)
      self:Close()
    end
  })
  self:PlayAnimation(self.Out)
end

function WBP_Task_NpcSideTaskTips_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local KeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if KeyName == UIConst.GamePadKey.LeftThumb then
    local Visible = self.Key_TitleRewards:GetVisibility()
    if Visible == UE4.ESlateVisibility.Collapsed then
      self:ShowGamepadRewardKey(true)
      self:TileViewQuit()
      self:SetWatchTaskContentGamePadKeys()
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif Visible == UE4.ESlateVisibility.Visible then
      self:ShowGamepadRewardKey(false)
      self:TileViewSelectFirst()
      self.Com_MidKeyTips:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    end
    return UWidgetBlueprintLibrary.Handled()
  elseif KeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.List_Reward:HasAnyUserFocus() or self.List_Reward:HasFocusedDescendants() then
      self:ShowGamepadRewardKey(true)
      self:TileViewQuit()
      self:SetWatchTaskContentGamePadKeys()
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      return UWidgetBlueprintLibrary.Handled()
    else
      self:Cancel()
    end
  elseif KeyName == UIConst.GamePadKey.FaceButtonBottom then
    self:Approve()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Task_NpcSideTaskTips_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.EMScrollBox_3:SetControlScrollbarInside(false)
    if self.EMScrollBox_3:HasAnyUserFocus() then
      self:SetFocus()
    end
    if self.List_Reward:HasAnyUserFocus() then
      self.Com_MidKeyTips:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
      self:ShowGamepadRewardKey(false)
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    elseif self.List_Reward:HasFocusedDescendants() then
      self.Com_MidKeyTips:UpdateKeyInfo({})
      self:ShowGamepadRewardKey(false)
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:SetWatchTaskContentGamePadKeys()
      self:ShowGamepadRewardKey(true)
      self.Btn_Start:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self:_SetUpScrollBox(self.EMScrollBox_3)
    self:ShowGamepadRewardKey(false)
    self.Com_MidKeyTips:UpdateKeyInfo({})
  end
end

function WBP_Task_NpcSideTaskTips_C:OnRewardItemMenuAnchorChanged(bIsOpen)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self.Com_MidKeyTips:UpdateKeyInfo({})
    else
      self.Com_MidKeyTips:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
    end
  end
end

function WBP_Task_NpcSideTaskTips_C:SetWatchTaskContentGamePadKeys()
  if not self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  local ContentHeight = self.EMScrollBox_3:GetDesiredSize().Y
  local VisibleHeight = USlateBlueprintLibrary.GetLocalSize(self.EMScrollBox_3:GetTickSpaceGeometry()).Y
  self.LastVisibleHeight = self.LastVisibleHeight or VisibleHeight
  if 0 == VisibleHeight then
    self:AddTimer(0.001, self.SetWatchTaskContentGamePadKeys, false, 0, "WBP_Task_NpcSideTaskTips", true)
    return
  elseif math.abs(VisibleHeight - self.LastVisibleHeight) > 0.001 then
    self.LastVisibleHeight = VisibleHeight
    self:AddTimer(0.001, self.SetWatchTaskContentGamePadKeys, false, 0, "WBP_Task_NpcSideTaskTips", true)
    return
  end
  if ContentHeight - VisibleHeight > 0.001 then
    self.EMScrollBox_3:SetScrollBarVisibility(UIConst.VisibilityOp.Visible)
    self.Com_MidKeyTips:UpdateKeyInfo(self.WatchTaskContentGamePadKeys)
  else
    self.EMScrollBox_3:SetScrollBarVisibility(UIConst.VisibilityOp.Collapsed)
    self.Com_MidKeyTips:UpdateKeyInfo(self.BackGamePadKey)
  end
end

function WBP_Task_NpcSideTaskTips_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local CurScrollOffset = self.EMScrollBox_3:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.EMScrollBox_3:GetScrollOffsetOfEnd())
    self.EMScrollBox_3:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Task_NpcSideTaskTips_C:TileViewSelectFirst()
  local Items = self.List_Reward:GetListItems()
  if Items and Items:Num() > 0 then
    self.List_Reward:SetFocus()
    self.List_Reward:SetSelectedIndex(0)
    self.List_Reward:NavigateToIndex(0)
  end
end

function WBP_Task_NpcSideTaskTips_C:TileViewQuit()
  self:SetFocus()
end

function WBP_Task_NpcSideTaskTips_C:ShowGamepadRewardKey(flag)
  if flag then
    self.Key_TitleRewards:SetVisibility(UE4.ESlateVisibility.Visible)
    self.EMScrollBox_3:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_TitleRewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.EMScrollBox_3:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function WBP_Task_NpcSideTaskTips_C:InitCommonWidget()
  self.WatchTaskContentGamePadKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_UIGUIDE_CLOSE")
    }
  }
  self.BackGamePadKey = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_UIGUIDE_CLOSE")
    }
  }
  self.SelectTaskRewardGamePadKeys = {
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
end

return WBP_Task_NpcSideTaskTips_C
