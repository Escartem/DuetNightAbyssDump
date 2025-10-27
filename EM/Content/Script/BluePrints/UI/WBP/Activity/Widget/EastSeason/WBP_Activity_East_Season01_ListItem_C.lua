require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Goto.Button_Area.OnClicked:Add(self, self.OnBtnGotoClicked)
  self.Btn_Reward.Button_Area.OnClicked:Add(self, self.OnBtnRewardClicked)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self:InitUI()
  self:SetGamepadIconVisibility(false)
end

function M:InitUI()
  self.Text_Desc:SetText(GText(self.Content.StarterQuestDes))
  self:UpdateListItemState()
  self.List_Item:ClearListItems()
  local RewardInfo = DataMgr.Reward[self.Content.QuestReward[1]]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      local ItemId = Ids[i]
      Content.UIName = "ActivityEastSeason01Item"
      Content.IsShowDetails = true
      Content.Id = ItemId
      Content.Count = RewardUtils:GetCount(RewardCount[i])
      local ItemData = DataMgr[TableName[i]][ItemId]
      Content.Icon = ItemData.Icon
      Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      Content.ItemType = TableName[i]
      Content.ParentWidget = self
      Content.bHasGot = self.IsGetReward
      Content.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.MenuOpenChangedEvent
      }
      self.List_Item:AddItem(Content)
    end
  end
  if self.Key_Reward then
    self.Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self.Btn_Goto.Text_Button:SetText(GText("UI_GameEvent_Goto"))
  self.Btn_Reward:SetText(GText("UI_GameEvent_ClaimReward"))
  self.Text_Progressing:SetText(GText("UI_GameEvent_ToBeFinished"))
end

function M:UpdateQuestCompletionState()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local CommonQuestActivity = Avatar.CommonQuestActivity
    local Progress = CommonQuestActivity[self.Content.EventId][self.Content.QuestId].Progress
    local Target = self.Content.Target
    self.IsCanGetReward = Progress >= Target
    self.IsGetReward = CommonQuestActivity[self.Content.EventId][self.Content.QuestId].RewardsGot
    self.Text_Progress:SetText(Progress .. "/" .. Target)
    self.Text_Complete:SetText(Progress .. "/" .. Target)
  end
end

function M:UpdateQuestProgressAndRewardState()
  if self.IsGetReward then
    self.Switch_Btn:SetActiveWidgetIndex(2)
  elseif self.IsCanGetReward then
    self.Switch_Btn:SetActiveWidgetIndex(1)
  else
    self.Switch_Btn:SetActiveWidgetIndex(0)
    if self.Content.JumpUIId then
      self.WS_Text:SetActiveWidgetIndex(0)
    else
      self.WS_Text:SetActiveWidgetIndex(1)
    end
  end
end

function M:OnBtnGotoClicked()
  PageJumpUtils:JumpToTargetPageByJumpId(self.Content.JumpUIId)
end

function M:OnBtnRewardClicked()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      if 0 == Ret then
        self.IsGetReward = true
        
        self:UpdateQuestProgressAndRewardState()
        self.Content.ParentWidget:UpdateGetAllBtn()
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
        self.Content.ParentWidget:RefreshTabReddot()
      end
    end
    
    Avatar:CallServer("CommonQuestActivityGetReward", Callback, self.Content.EventId, self.Content.QuestId)
  end
end

function M:MenuOpenChangedEvent(IsOpen)
  if IsOpen then
    self.IsOpenMenu = true
  else
    self.IsOpenMenu = false
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.bIsSelected = true
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnItemSelectionChanged(true)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.bIsSelected = false
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnItemSelectionChanged(false)
  end
end

function M:OnItemSelectionChanged(IsSelected)
  self.bIsSelected = IsSelected
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if IsSelected then
      self:SetGamepadIconVisibility(true)
      self:PlayAnimation(self.Hover)
    else
      self:SetGamepadIconVisibility(false)
      self:PlayAnimation(self.UnHover)
    end
  end
end

function M:SetGamepadIconVisibility(bShow)
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self.Key_Reward:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_Goto:SetGamepadIconVisibility(true)
    self.Btn_Reward:SetGamePadIconVisible(true)
  else
    self.Key_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Goto:SetGamepadIconVisibility(false)
    self.Btn_Reward:SetGamePadIconVisible(false)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_LeftThumbstick" == InKeyName then
    self.List_Item:SetFocus()
    self:SetGamepadIconVisibility(false)
    self.IsFocusItem = true
    IsHandled = true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.IsFocusItem and true ~= self.IsOpenMenu then
      self:SetFocus()
      self.IsFocusItem = false
      self:SetGamepadIconVisibility(true)
    elseif self.IsFocusItem and true == self.IsOpenMenu then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    else
      self.Content.ParentWidget:CloseSelf()
    end
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.IsFocusItem ~= true then
    if self.IsGetReward then
      IsHandled = true
    elseif self.IsCanGetReward then
      self:OnBtnRewardClicked()
    else
      self:OnBtnGotoClicked()
    end
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.bIsSelected then
    if CurInputDevice == ECommonInputType.MouseAndKeyboard then
      self:PlayAnimation(self.UnHover)
      self:SetGamepadIconVisibility(false)
      if self.IsFocusItem and self.IsOpenMenu ~= true then
        self:SetFocus()
        self.IsFocusItem = false
      end
    elseif CurInputDevice == ECommonInputType.Gamepad then
      self:OnItemSelectionChanged(true)
    end
  end
end

function M:UpdateListItemState()
  self:UpdateQuestCompletionState()
  self:UpdateQuestProgressAndRewardState()
end

return M
