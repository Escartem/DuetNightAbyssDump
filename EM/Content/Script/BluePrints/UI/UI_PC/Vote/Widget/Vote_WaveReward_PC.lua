require("UnLua")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(IsCurrentWave, Type, CurrentDungeonProgress, RewardId)
end

function M:InitContinue(IsCurrentWave)
  self.RewardContentList = {}
  if IsCurrentWave then
    self.Panel_NextWave:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Text_Next:SetText(GText("UI_Vote_Continue_Next"))
  else
    self.Panel_Wave:SetRenderOpacity(0.5)
  end
end

function M:InitLeave(DefenceWave, CurrentDungeonProgress)
  self.RewardContentList = {}
  if DefenceWave > 3 then
    self.ForbidListView:SetVisibility(1)
  end
  if DefenceWave == CurrentDungeonProgress then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local VoteMain = UIManager:GetUIObj("Vote")
    VoteMain:BindToAnimationFinished(VoteMain.Auto_In, {
      self,
      self.PlayAnimationPanelIn
    })
    self:AddDispatcher(EventID.OnVoteUIAutoInFinished, self, self.PlayAnimationPanelIn)
  else
    self.Panel_Finish:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitRewardList(CurrentDungeonProgress, RewardId, IsContinue)
  self:SetWaveText(CurrentDungeonProgress)
  local Reward = DataMgr.Reward[RewardId]
  if not Reward then
    print(_G.LogTag, "Error: Reward Data is nil, RewardId:", RewardId)
    return
  end
  self.ResourceNum = 0
  self.IsContinue = IsContinue
  local ListItemNums = self.RewardList:GetNumItems()
  local Avatar = GWorld:GetAvatar()
  if not IsContinue then
    if not Avatar then
      return
    end
    local CachedDungeonProgressRewards = Avatar:GetCachedDungeonProgressRewards()
    if not CachedDungeonProgressRewards[CurrentDungeonProgress] then
      return
    end
    local WalnutTag = tostring(RewardBox:GetTag("Walnut"))
    for ItemType, Rewards in pairs(CachedDungeonProgressRewards[CurrentDungeonProgress]) do
      for ItemId, ItemTable in pairs(Rewards) do
        local RealType = string.gsub(ItemType, "s$", "")
        local WalnutNum = RewardBox:FindCountByTag(ItemTable, "Walnut")
        local ExtraNum = RewardBox:FindCountByTag(ItemTable, "Extra")
        local NormalNum = RewardBox:FindCountByTag(ItemTable, "Normal")
        local FirstNum = RewardBox:FindCountByTag(ItemTable, "First")
        self:CreateOneReward("Walnut", RealType, ItemId, WalnutNum, ListItemNums)
        self:CreateOneReward("Normal", RealType, ItemId, NormalNum, ListItemNums)
        self:CreateOneReward("Extra", RealType, ItemId, ExtraNum, ListItemNums)
        self:CreateOneReward("First", RealType, ItemId, FirstNum, ListItemNums)
      end
    end
  else
    self:ReadRewardInfo(Reward, ListItemNums)
  end
  if self.ResourceNum < 5 then
    self.RewardList:SetEmptyGridItemCount(math.max(0, 5 - self.ResourceNum))
    for i = self.ResourceNum + 1, 5 do
      local Content = self:NewItemContent(nil, 0, nil, nil, ListItemNums <= self.ResourceNum)
    end
  end
end

function M:OnContinueFirstItemNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    local VoteMain = UIManager(self):GetUIObj("Vote")
    return VoteMain.Box_Leave.Box_Leave
  end
end

function M:OnLeaveLastItemNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Right then
    local VoteMain = UIManager(self):GetUIObj("Vote")
    return VoteMain.Box_Continue.Box_Continue
  end
end

function M:SetWaveText(CurrentDungeonProgress)
  local Ten = CurrentDungeonProgress // 10
  local Bit = CurrentDungeonProgress % 10
  if Ten > 0 then
    self.Text_Ten:SetColorAndOpacity(self.Text_Bit.ColorAndOpacity)
  else
    local SlateColor = FSlateColor()
    local LinearColor = FLinearColor(1, 1, 1, 0.2)
    SlateColor.SpecifiedColor = LinearColor
    self.Text_Ten:SetColorAndOpacity(SlateColor)
  end
  self.Text_Ten:SetText(Ten)
  self.Text_Bit:SetText(Bit)
end

function M:CreateOneReward(RewardTag, ItemType, ItemId, Count, ListItemNums)
  if Count <= 0 then
    return
  end
  local BonusType
  if "Walnut" == RewardTag then
    BonusType = 3
  elseif "Extra" == RewardTag then
    BonusType = 1
  elseif "First" == RewardTag then
    BonusType = 2
  end
  local Content = self:NewItemContent(ItemType, ItemId, Count, BonusType, ListItemNums <= self.ResourceNum)
  if Content then
    self.ResourceNum = self.ResourceNum + 1
    self.RewardContentList[self.ResourceNum] = Content
  end
end

function M:ReadRewardInfo(Reward, ListItemNums)
  for i, ResourceId in ipairs(Reward.Id) do
    local DungeonDoubleCost = 1
    local DungeonId = GWorld.GameInstance:GetCurrentDungeonId() or 90401
    if Avatar and Avatar.bDungeonDoubleCost and not DataMgr.Dungeon[DungeonId].IsWalnutDungeon then
      DungeonDoubleCost = 2
    end
    local Content
    if Reward.Type[i] == "Reward" then
      local RewardInfo = DataMgr.Reward[ResourceId]
      self:ReadRewardInfo(RewardInfo, ListItemNums)
    else
      Content = self:NewItemContent(Reward.Type[i], ResourceId, Reward.Count[i][1] * DungeonDoubleCost, nil, ListItemNums <= self.ResourceNum)
      if Content then
        self.ResourceNum = self.ResourceNum + 1
        self.RewardContentList[self.ResourceNum] = Content
      end
    end
  end
end

function M:NewItemContent(ItemType, ItemId, Count, BonusType, NeedAdd, IsExtra)
  if 0 == ItemId then
    local Obj
    if NeedAdd then
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      self.RewardList:AddItem(Obj)
    else
      Obj = self.RewardList:GetItemAt(self.ResourceNum)
      Obj.SelfWidget:OnListItemObjectSet(Obj)
      self.RewardList:RequestRefresh()
    end
    return Obj
  end
  local ItemData = DataMgr[ItemType][ItemId]
  if not ItemData then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", ItemType, "ItemId", ItemId)
    return nil
  end
  local Obj
  print(_G.LogTag, "LXZ NewItemContent", ItemId, Count, ItemData.Icon)
  if NeedAdd then
    Obj = NewObject(UIUtils.GetCommonItemContentClass())
  else
    Obj = self.RewardList:GetItemAt(self.ResourceNum)
  end
  Obj.ItemType = ItemType:gsub("^%l", string.upper)
  Obj.Id = ItemId
  Obj.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
  Obj.Icon = ItemData.Icon
  Obj.Count = Count
  Obj.IsShowDetails = true
  Obj.UIName = "Vote"
  Obj.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnItemMenuOpenChanged
  }
  Obj.OnAddedToFocusPathEvent = {
    Obj = self,
    Callback = self.OnAddedToFocusPathEvent
  }
  Obj.OnRemovedFromFocusPathEvent = {
    Obj = self,
    Callback = self.OnRemovedFromFocusPathEvent
  }
  Obj.BonusType = BonusType
  if NeedAdd then
    self.RewardList:AddItem(Obj)
  else
    Obj.SelfWidget:OnListItemObjectSet(Obj)
    self.RewardList:RequestRefresh()
  end
  return Obj
end

function M:OnItemMenuOpenChanged(bIsOpen)
  local VoteMain = UIManager(self):GetUIObj("Vote")
  VoteMain:OnItemMenuOpenChanged(bIsOpen)
end

function M:OnAddedToFocusPathEvent()
  self.SelectedContent = self.RewardList:BP_GetSelectedItem()
  self.bFirstSelect = true
  local VoteMain = UIManager(self):GetUIObj("Vote")
  VoteMain.SelectContinueWaveReward = self.IsContinue
end

function M:OnRemovedFromFocusPathEvent()
end

function M:Close()
  self:PlayAnimationReverse(self.Out)
  M.Super.Close(self)
end

function M:OnListItemObjectSet(Content)
  print(_G.LogTag, "LXZ OnListItemObjectSet", Content:GetName())
  Content.SelfWidget = self
  if -1 == Content.RewardId then
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Panel_Wave:SetVisibility(ESlateVisibility.Collapsed)
    self.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  self.Text_Wave:SetText(GText("UI_Vote_Wave"))
  if Content.Type == "Continue" then
    self:InitContinue(Content.IsCurrentWave)
  else
    self:InitLeave(Content.DefenceWave, Content.CurrentDungeonProgress)
  end
  self.RewardList:ClearListItems()
  self:InitRewardList(Content.CurrentDungeonProgress, Content.RewardId, Content.Type == "Continue")
  self:PlayAnimation(self.In)
end

function M:PlayAnimationPanelIn()
  self.Panel_Finish:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.Panel_Finish_In)
end

function M:OnItemIsHoverChanged(Item, IsHovered)
  if IsHovered then
    return
  end
  local Idx = self.RewardList:GetIndexForItem(Item)
  local Reward = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.RewardList, Idx)
  if Reward.Content.IsSelect == true and Reward.Content.IsShowTips == false then
    Reward.Content.IsSelect = false
    Reward:StopAllAnimations()
    Reward.VX_Loop:SetVisibility(ESlateVisibility.Collapsed)
    Reward:PlayAnimation(Reward.Normal)
    Reward:OnMouseLeave()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Right" == InKeyName then
      local Content = self.RewardList:BP_GetSelectedItem()
      if Content and not self.IsContinue and (1 == self.ResourceNum or self.RewardContentList[self.ResourceNum] == Content) then
        local VoteMain = UIManager(self):GetUIObj("Vote")
        VoteMain.Box_Continue.Box_Continue:SetFocus()
      end
    elseif "Gamepad_DPad_Left" == InKeyName then
      local Content = self.RewardList:BP_GetSelectedItem()
      if Content and self.IsContinue and self.RewardContentList[1] == Content then
        local VoteMain = UIManager(self):GetUIObj("Vote")
        VoteMain.Box_Leave.Box_Leave:SetFocus()
      end
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.5
  if math.abs(AddOffset) < 0.4 then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  if "Gamepad_LeftX" ~= InKeyName then
    return
  end
  print(_G.LogTag, "LXZ OnAnalogValueChanged", InKeyName, AddOffset, self.bFirstSelect)
  if AddOffset > 0 then
    local Content = self.RewardList:BP_GetSelectedItem()
    if Content and not self.IsContinue and (1 == self.ResourceNum or self.RewardContentList[self.ResourceNum] == Content) and self.SelectedContent == Content then
      if self.bFirstSelect then
        self.bFirstSelect = false
        return UE4.UWidgetBlueprintLibrary.Handled()
      else
        local VoteMain = UIManager(self):GetUIObj("Vote")
        VoteMain.Box_Continue.Box_Continue:SetFocus()
      end
    end
  else
    local Content = self.RewardList:BP_GetSelectedItem()
    if Content and self.IsContinue and self.RewardContentList[1] == Content and self.SelectedContent == Content then
      if self.bFirstSelect then
        self.bFirstSelect = false
        return UE4.UWidgetBlueprintLibrary.Handled()
      else
        local VoteMain = UIManager(self):GetUIObj("Vote")
        VoteMain.Box_Leave.Box_Leave:SetFocus()
      end
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
