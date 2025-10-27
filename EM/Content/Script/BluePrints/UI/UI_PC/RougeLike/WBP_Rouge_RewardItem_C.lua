require("UnLua")
local WBP_Rouge_RewardItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_Rouge_RewardItem_C:Construct()
  self.RewardItems = {}
  self.State2ChangeIndex = {
    Ing = 0,
    Complete = 1,
    Received = 2
  }
  self.RewardItemWidth = nil
  self.RewardScrollBoxWidth = self.ScrollBox_ItemRewards.Slot:GetSize().X
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
end

function WBP_Rouge_RewardItem_C:Destruct()
  self:ClearListenEvent()
end

function WBP_Rouge_RewardItem_C:OnListItemObjectSet(Content)
  if Content.NotReward then
    self:SetRenderOpacity(0)
    return
  else
    self:SetRenderOpacity(1)
  end
  self.Content = Content
  self.ID = Content.RewardInfoId
  self.Index = Content.Index
  self.Parent = Content.Parent
  self.Bg:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Bg_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Name:SetText(Content.GradePoints)
  self.Btn_Jump.IsForbidden = true
  self.Btn_Jump:SetText(GText("UI_Achievement_GetReward"))
  self.Group_IngBtn:SetVisibility(ESlateVisibility.Collapsed)
  local LockedSelf = true
  local LockedNext = true
  local State = "Ing"
  local avatar = GWorld:GetAvatar()
  if avatar then
    local WeeklyMaxScore = avatar.RougeLike.WeeklyTotalScore
    if WeeklyMaxScore >= Content.GradePoints then
      LockedSelf = false
    end
    if WeeklyMaxScore >= Content.GradePoints + self.Parent.EachGradePoints then
      LockedNext = false
    end
    if avatar:IsRougeLikeWeeklyRewardGot(self.Index) then
      State = "Received"
    elseif not LockedSelf then
      State = "Complete"
    end
  end
  for _, item in pairs(self.RewardItems) do
    item:RemoveFromParent()
  end
  local totalWidth = 0
  self.RewardItems = {}
  if self.ID then
    local RewardInfo = DataMgr.Reward[self.ID]
    local RewardList = {}
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Icon = ItemUtils.GetItemIconPath(ItemId, RewardTypes[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          Id = ItemId,
          Type = ItemType,
          ItemCount = Count,
          Icon = Icon,
          Rarity = Rarity
        }
        table.insert(RewardList, RewardContent)
      end
    end
    table.sort(RewardList, function(A, B)
      local rarityX = A.Rarity or 1
      local rarityY = B.Rarity or 1
      if rarityX == rarityY then
        return A.Id < B.Id
      else
        return rarityX > rarityY
      end
    end)
    for _, ItemInfo in pairs(RewardList) do
      local Object = {}
      Object.ParentWidget = self
      Object.ItemType = ItemInfo.Type
      Object.Id = ItemInfo.Id
      Object.Count = ItemInfo.ItemCount
      Object.Icon = ItemInfo.Icon
      Object.Rarity = ItemInfo.Rarity or 1
      Object.IsShowDetails = true
      Object.HandleMouseDown = true
      Object.UIName = "RougeReward"
      Object.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.OnMenuOpenChanged
      }
      if ItemInfo.TableName == "Char" then
        Object.NotInteractive = true
      else
        Object.NotInteractive = false
      end
      local rewardItem = self:NewRewardItem()
      rewardItem:Init(Object)
      rewardItem:SetVisibility(ESlateVisibility.Visible)
      table.insert(self.RewardItems, rewardItem)
      if not self.RewardItemWidth then
        rewardItem:ForceLayoutPrepass()
        self.RewardItemWidth = rewardItem:GetDesiredSize().X + rewardItem.Slot.Padding.Left + rewardItem.Slot.Padding.Right
      end
      totalWidth = totalWidth + self.RewardItemWidth
    end
    local size = self.Spacer_Reward.Size
    if totalWidth < self.RewardScrollBoxWidth then
      size:Set(self.RewardScrollBoxWidth - totalWidth, 0)
    else
      size:Set(0, 0)
    end
    self.Spacer_Reward:SetSize(size)
  end
  self.CompleteMask:SetVisibility(ESlateVisibility.Collapsed)
  self:ChangeState(State)
  if LockedSelf then
    self.WS_Left:SetActiveWidgetIndex(0)
    self:PlayAnimation(self.Progress)
  else
    self.WS_Left:SetActiveWidgetIndex(1)
    self:PlayAnimation(self.Recive)
  end
  if LockedNext then
    self.WS_Right:SetActiveWidgetIndex(0)
  else
    self.WS_Right:SetActiveWidgetIndex(1)
  end
  if 1 == self.Index then
    self.WS_Left:SetVisibility(ESlateVisibility.Collapsed)
    self.WS_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif self.Index == self.Parent.MaxRewardGot then
    self.WS_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WS_Right:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.WS_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WS_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:PlayAnimNew()
end

function WBP_Rouge_RewardItem_C:PlayAnim(Content)
  local currentTime = UGameplayStatics.GetTimeSeconds(self)
  if self.Index - 1 >= self.Parent.ScrollIndex and currentTime < Content.StartTime + 0.05 * (self.Index - self.Parent.ScrollIndex) + 0.1 and self.Parent.PlayInAnimation then
    self.Group_Normal:SetRenderOpacity(0)
    if self.Handle then
      self:RemoveTimer(self.Handle)
    end
    local Difference = self.Index - self.Parent.ScrollIndex
    local time = 0.05 * Difference
    if 0 == time then
      time = 0.01
    end
    self.Handle = self:AddTimer(time, function()
      self.Group_Normal:SetRenderOpacity(1)
      self:PlayAnimation(self.In)
    end, false, 0, nil, true)
  else
    self.Group_Normal:SetRenderOpacity(1)
    self:PlayAnimation(self.In, self.In:GetEndTime())
  end
end

function WBP_Rouge_RewardItem_C:PlayAnimNew()
  self:StopAnimation(self.In)
  if self.Parent.PlayInAnimation and self.State == "Complete" then
    self:PlayAnimation(self.In)
  end
end

function WBP_Rouge_RewardItem_C:OnClicked()
  if self.State == "Complete" then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local function Callback(Rewards)
        self:ChangeState("Received")
        
        self:PlayAnimation(self.Click)
        if not ReddotManager.GetTreeNode("RougeLikeReward") then
          ReddotManager.AddNode("RougeLikeReward")
        end
        local TreeNode = ReddotManager.GetTreeNode("RougeLikeReward")
        if TreeNode.Count > 0 then
          ReddotManager.DecreaseLeafNodeCount("RougeLikeReward")
        end
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
          self:SetFocus()
        end, self)
      end
      
      Avatar:GetRougeLikeWeeklyReward(Callback, self.Index)
    end
  end
end

function WBP_Rouge_RewardItem_C:OnBtnHovered()
  if self.State == "Complete" then
    self:StopAnimation(self.Unhover)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Rouge_RewardItem_C:OnBtnUnhovered()
  if self.State == "Complete" then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_RewardItem_C:OnBtnPressed()
  if self.State == "Complete" then
    self:StopAllAnimations()
    self:PlayAnimation(self.Press)
  end
end

function WBP_Rouge_RewardItem_C:ChangeState(NewState)
  if self.State2ChangeIndex[NewState] then
    self.State = NewState
    self.Change:SetActiveWidgetIndex(self.State2ChangeIndex[self.State])
    if self.State2ChangeIndex[NewState] == self.State2ChangeIndex.Received then
      for _, Item in pairs(self.RewardItems) do
        Item:SetIsGot(true)
      end
    end
  end
end

function WBP_Rouge_RewardItem_C:CheckIsCompleteState()
  if self.State == "Complete" then
    return true
  else
    return false
  end
end

function WBP_Rouge_RewardItem_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_RewardItem_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_RewardItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_RewardItem_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_RewardItem_C:InitGamepadView()
  self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function WBP_Rouge_RewardItem_C:InitKeyboardView()
  self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Rouge_RewardItem_C:BP_GetDesiredFocusTarget()
  self.Content.Parent:TryChangeCurFocusedItem(self)
  if self.Content.Parent.IsInSelectState then
    self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local Reward = self.ScrollBox_ItemRewards:GetChildAt(1)
    return Reward
  else
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    return self.Btn_Click
  end
end

function WBP_Rouge_RewardItem_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      IsEventHandled = self.Content.Parent:TryEnterSelectMode(self)
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = self.Content.Parent:TryLeaveSelectMode(self)
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Rouge_RewardItem_C:EnterSelectMode()
  self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local Reward = self.ScrollBox_ItemRewards:GetChildAt(1)
  Reward:SetFocus()
end

function WBP_Rouge_RewardItem_C:LeaveSelectMode()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.ScrollBox_ItemRewards:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self.Btn_Click:SetFocus()
end

function WBP_Rouge_RewardItem_C:OnMenuOpenChanged(bIsOpen)
  self.Parent:OnMenuOpenChanged(bIsOpen)
end

return WBP_Rouge_RewardItem_C
