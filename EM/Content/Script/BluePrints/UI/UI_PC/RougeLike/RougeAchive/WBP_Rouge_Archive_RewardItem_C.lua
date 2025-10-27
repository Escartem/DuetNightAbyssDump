require("UnLua")
local WBP_Rouge_Archive_RewardItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_Archive_RewardItem_C:Construct()
  self.Btn_Reward:BindEventOnClicked(self, self.OnClicked)
  if not self.DataModel then
    self.DataModel = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.Rouge_Archive_DataModel")
    self.DataModel:InitData(GWorld:GetAvatar())
  end
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

function WBP_Rouge_Archive_RewardItem_C:Destruct()
  self:ClearListenEvent()
end

function WBP_Rouge_Archive_RewardItem_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.ItemIndex = Content.Index
  self.Num = self.Content.Index * self.Content.Step
  self.Text_Name:SetText(string.format(GText("UI_Archive_CollectionTarget"), self.Num))
  self:RefreshState()
  self:RefreshRewardsList()
end

function WBP_Rouge_Archive_RewardItem_C:RefreshState()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local IsGot = Avatar.RougeLike:IsManualRewardGot(self.Content.Type, self.ItemIndex)
    local CurrentNum = self.DataModel:GetUnlockedItemNum(self.Content.Type)
    local CanGet = CurrentNum >= self.Num
    if not CanGet then
      self.Change:SetActiveWidgetIndex(0)
    elseif IsGot then
      self.Change:SetActiveWidgetIndex(2)
    else
      self.Change:SetActiveWidgetIndex(1)
    end
  else
    self.Change:SetActiveWidgetIndex(0)
  end
end

function WBP_Rouge_Archive_RewardItem_C:TryOnClicked()
  if 1 == self.Change:GetActiveWidgetIndex() then
    self:OnClicked()
  end
end

function WBP_Rouge_Archive_RewardItem_C:OnClicked()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Errorcode, Rewards)
      self:RefreshState()
      
      self:RefreshRewardsList()
      self:RefreshReddotInfo()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        self:SetFocus()
      end, self)
    end
    
    Avatar:GetRougeLikeManualReward(Callback, self.Content.Type, self.ItemIndex)
  end
end

function WBP_Rouge_Archive_RewardItem_C:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
  if CacheDetail[self.Content.Type] and CacheDetail[self.Content.Type][self.Content.Index] then
    CacheDetail[self.Content.Type][self.Content.Index] = nil
    if nil == next(CacheDetail[self.Content.Type]) then
      CacheDetail[self.Content.Type] = nil
    end
    ReddotManager.DecreaseLeafNodeCount("RougeArchiveReward")
  end
end

function WBP_Rouge_Archive_RewardItem_C:RefreshRewardsList()
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
        Content.UIName = "RougeDifficultySelection"
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

function WBP_Rouge_Archive_RewardItem_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Archive_RewardItem_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Archive_RewardItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_Archive_RewardItem_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_Archive_RewardItem_C:InitWidgetInfoInGamePad()
end

function WBP_Rouge_Archive_RewardItem_C:InitKeyboardView()
  self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.Normal)
end

function WBP_Rouge_Archive_RewardItem_C:InitGamepadView()
  self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end

function WBP_Rouge_Archive_RewardItem_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      IsEventHandled = true
      self:EnterOrLeaveSelectMode(self.Content.Index)
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      if self.Content.Root.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode(self.Content.Index)
      end
    elseif "Gamepad_FaceButton_Bottom" == InKeyName and not self.Content.Root.IsInSelectState then
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

function WBP_Rouge_Archive_RewardItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Content.Root.Key_01:SetVisibility(UIConst.VisibilityOp.Visible)
    if not self.Content.Root.IsInSelectState then
      self.Btn_Reward:SetGamePadIconVisible(true)
    end
    self:PlayAnimation(self.Hover)
  end
  return UIUtils.Handled
end

function WBP_Rouge_Archive_RewardItem_C:OnFocusLost(InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Content.Root.Key_01:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if not self.Content.Root.IsInSelectState then
      self.Btn_Reward:SetGamePadIconVisible(false)
    end
    self:PlayAnimationReverse(self.Hover)
  end
end

function WBP_Rouge_Archive_RewardItem_C:EnterOrLeaveSelectMode(Index)
  if self.Content.Root.IsInSelectState then
    self:LeaveSelectMode(Index)
  else
    self:EnterSelectMode(Index)
  end
end

function WBP_Rouge_Archive_RewardItem_C:EnterSelectMode(Index)
  if self.Content.Root.IsInSelectState then
    return
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.Content.Root.Btn_GetAll:SetGamePadIconVisible(false)
    self.Content.Root.Key_01:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckReward")
    })
    self.Content.Root.Key_03:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Tips_Close")
    })
    self.Btn_Reward:SetGamePadIconVisible(false)
    local Item = self.List_Reward:GetItemAt(0)
    if Item.SelfWidget then
      Item.SelfWidget:SetFocus()
    end
    self.Content.Root.IsInSelectState = true
  end
end

function WBP_Rouge_Archive_RewardItem_C:LeaveSelectMode()
  if not self.Content.Root.IsInSelectState then
    return
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.Content.Root.Key_01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Content.Root.Btn_GetAll:SetGamePadIconVisible(true)
    self.Btn_Reward:SetGamePadIconVisible(true)
    self.Content.Root.Key_01:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Controller_CheckReward")
    })
    self.Content.Root.Key_03:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Controller_Close")
    })
    self:SetFocus()
    self.Content.Root.IsInSelectState = false
  end
end

function WBP_Rouge_Archive_RewardItem_C:LeaveSelectModeOrClose(Index)
  if not self.Content.Root.IsInSelectState then
    self:OnReturnKeyDown()
  end
  self:LeaveSelectMode(Index)
end

function WBP_Rouge_Archive_RewardItem_C:UpdateUIStyle(IsVisible)
  if IsVisible then
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_Archive_RewardItem_C:OnMenuOpenChanged(bIsOpen, Obj)
  if not bIsOpen and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    Obj.SelfWidget.Item:PlayAnimation(Obj.SelfWidget.Item.Hover)
  end
  self.Content.Root:OnMenuOpenChanged(bIsOpen)
end

return WBP_Rouge_Archive_RewardItem_C
