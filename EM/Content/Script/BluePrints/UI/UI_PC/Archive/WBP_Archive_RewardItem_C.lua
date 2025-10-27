require("UnLua")
local WBP_Archive_RewardItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Archive_RewardItem_C:Construct()
  self.Btn_Reward:BindEventOnClicked(self, self.OnClicked)
  self.Text_Ing:SetText(GText("UI_Archive_CollectionInProgress"))
  self.Btn_Reward:SetText(GText("UI_Archive_CollectionClaim"))
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_RewardItem_C:Destruct()
  self:ClearListenEvent()
end

function WBP_Archive_RewardItem_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.Num = self.Content.Index * self.Content.Step
  self.Text_Name:SetText(string.format(GText("UI_Archive_CollectionTarget"), self.Num))
  self:RefreshState()
  self:RefreshRewardsList()
end

function WBP_Archive_RewardItem_C:RefreshState()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Archive = Avatar.Archives[self.Content.Type]
    local CurrentNum = Archive:GetArchiveCount()
    if CurrentNum < self.Num then
      self.Change:SetActiveWidgetIndex(0)
    elseif Archive.ArchiveRewardGot[self.Num] then
      self.Change:SetActiveWidgetIndex(2)
    else
      self.Change:SetActiveWidgetIndex(1)
    end
  else
    self.Change:SetActiveWidgetIndex(0)
  end
end

function WBP_Archive_RewardItem_C:TryOnClicked()
  if 1 == self.Change:GetActiveWidgetIndex() then
    self:OnClicked()
  end
end

function WBP_Archive_RewardItem_C:OnClicked()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      self:RefreshState()
      
      self:RefreshRewardsList()
      self:RefreshReddotInfo()
      if not ErrorCode:Check(Ret) then
        return
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        self:SetFocus()
      end, self)
    end
    
    Avatar:GetArchiveReward(Callback, self.Content.Type, self.Num)
  end
end

function WBP_Archive_RewardItem_C:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if CacheDetail[self.Content.Type] and CacheDetail[self.Content.Type][self.Num] then
    CacheDetail[self.Content.Type][self.Num] = nil
    if nil == next(CacheDetail[self.Content.Type]) then
      CacheDetail[self.Content.Type] = nil
    end
    ReddotManager.DecreaseLeafNodeCount("ArchiveReward")
  end
end

function WBP_Archive_RewardItem_C:RefreshRewardsList()
  local Rewards = {
    self.Content.RewardId
  }
  self.List_Reward:ClearListItems()
  self.List_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local IsGot = 2 == self.Change:GetActiveWidgetIndex()
  for _, RewardId in pairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        local ItemId = Ids[i]
        Content.IsShowDetails = true
        Content.Id = ItemId
        Content.Count = RewardUtils:GetCount(RewardCount[i])
        Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        Content.Parent = self
        Content.bHasGot = IsGot
        Content.OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.OnMenuOpenChanged
        }
        self.List_Reward:AddItem(Content)
      end
    end
  end
end

function WBP_Archive_RewardItem_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_RewardItem_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_RewardItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_RewardItem_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_RewardItem_C:InitGamepadView()
  self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function WBP_Archive_RewardItem_C:InitKeyboardView()
  self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Archive_RewardItem_C:InitWidgetInfoInGamePad()
end

function WBP_Archive_RewardItem_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      IsEventHandled = true
      self.Content.Root:EnterOrLeaveSelectMode(self)
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self.Content.Root:LeaveSelectModeOrClose(self)
    elseif "Gamepad_FaceButton_Bottom" == InKeyName then
      IsEventHandled = true
      self:TryOnClicked()
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_RewardItem_C:BP_GetDesiredFocusTarget()
  self.Content.Root:TryChangeCurFocusedRewardItem(self)
  if self.Content.Root.IsInSelectState then
    self.List_Reward:NavigateToIndex(0)
    self:UpdateUIStyle(false)
    return self.List_Reward
  else
    return self
  end
end

function WBP_Archive_RewardItem_C:BeginHover()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
    self:UpdateUIStyle(true)
  end
end

function WBP_Archive_RewardItem_C:StopHover(InSwitch)
  if InSwitch or UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
    self:UpdateUIStyle(false)
  end
end

function WBP_Archive_RewardItem_C:UpdateUIStyle(IsVisible)
  if IsVisible then
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Archive_RewardItem_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:UpdateUIStyle(false)
  elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.Content.Root.IsInSelectState then
      self:UpdateUIStyle(false)
    else
      self:UpdateUIStyle(true)
    end
  end
  self.Content.Root:OnMenuOpenChanged(bIsOpen)
end

return WBP_Archive_RewardItem_C
