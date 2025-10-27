require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:SetSp()
  self.IsSp = true
end

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.Reward_Normal:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.OnUINavigation
  })
  self.Reward_Normal:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.OnUINavigation
  })
  self.Reward_Sp:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.OnUINavigation
  })
  self.Reward_Sp:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.OnUINavigation
  })
  self.Reward_Sp_1:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.OnUINavigation
  })
  self.Reward_Sp_1:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.OnUINavigation
  })
  if self.IsSp then
    self.Reward_Normal:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      self.OnUINavigation
    })
    self.Reward_Normal:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      self.OnUINavigation
    })
    self.Reward_Sp:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      self.OnUINavigation
    })
    self.Reward_Sp:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      self.OnUINavigation
    })
    self.Reward_Sp_1:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      self.OnUINavigation
    })
    self.Reward_Sp_1:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      self.OnUINavigation
    })
  end
  self:Refresh()
end

function M:Refresh()
  self:RefreshState()
  self:RefreshLevel()
  self:RefreshReward(self.Reward_Normal, self.Content.Rank1Reward, 1, self.Content.IsGotState_Rank1, false)
  self:RefreshReward(self.Reward_Sp, self.Content.Rank2Reward, 1, self.Content.IsGotState_Rank2, true)
  self:RefreshReward(self.Reward_Sp_1, self.Content.Rank2Reward, 2, self.Content.IsGotState_Rank2, true)
end

function M:RefreshState()
end

function M:RefreshLevel()
  if self.Content.BattlePassLevel >= 0 and self.Content.BattlePassLevel < 10 then
    self.Text_Level:SetText("0" .. tostring(self.Content.BattlePassLevel))
  else
    self.Text_Level:SetText(self.Content.BattlePassLevel)
  end
end

function M:RefreshReward(CommonItem, RewardId, Index, IsGotState, IsRank2)
  local RewardInfo = DataMgr.Reward[RewardId]
  if RewardInfo and RewardInfo.Id and RewardInfo.Id[Index] then
    CommonItem:SetVisibility(UIConst.VisibilityOp.Visible)
    local RewardContent = {}
    local ItemId = RewardInfo.Id[Index]
    RewardContent.Id = ItemId
    RewardContent.UnitId = ItemId
    RewardContent.Count = RewardUtils:GetCount(RewardInfo.Count[Index])
    RewardContent.Icon = ItemUtils.GetItemIconPath(ItemId, RewardInfo.Type[Index])
    RewardContent.Rarity = ItemUtils.GetItemRarity(ItemId, RewardInfo.Type[Index])
    RewardContent.UnitName = ItemUtils:GetDropName(ItemId, RewardInfo.Type[Index])
    RewardContent.ItemType = RewardInfo.Type[Index]
    RewardContent.HandleMouseDown = true
    RewardContent.Parent = self
    if 1 == IsGotState then
      RewardContent.bCanGet = true
      RewardContent.CanGetStyle = "White"
      RewardContent.bHasGot = false
      if not self.IsSp then
        RewardContent.OnMouseButtonUpEvents = {
          Obj = self.Content.Root,
          Callback = self.Content.Root.GetReward,
          Params = {
            self.Content.BattlePassLevel,
            IsRank2
          }
        }
        RewardContent.IsShowDetails = false
      else
        RewardContent.IsShowDetails = true
      end
    elseif 2 == IsGotState then
      RewardContent.bCanGet = false
      RewardContent.bHasGot = true
      RewardContent.IsShowDetails = true
    else
      RewardContent.bCanGet = false
      RewardContent.bHasGot = false
      RewardContent.IsShowDetails = true
    end
    if IsRank2 and not self.Content.IsUnlocked then
      RewardContent.LockType = 1
    end
    RewardContent.OnAddedToFocusPathEvent = {
      Obj = self,
      Callback = self.OnFocusItemChanged,
      Params = RewardContent
    }
    CommonItem:Init(RewardContent)
  else
    CommonItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Up then
    return self:OnNavigationToIndex(self.SelectedIndex - 1)
  elseif NavigationDirection == EUINavigation.Down then
    return self:OnNavigationToIndex(self.SelectedIndex + 1)
  elseif NavigationDirection == EUINavigation.Left then
    if self.IsSp then
      self.Content.Root:TryLeaveSpecialMode()
    end
  elseif NavigationDirection == EUINavigation.Right and self.IsSp then
    self.Content.Root:TryLeaveSpecialMode()
  end
  return self.FocusedReward
end

function M:OnNavigationToIndex(Index)
  if Index <= 0 or Index > 3 then
    if self.IsSp then
      self.Content.Root:TryLeaveSpecialMode()
    end
    return self.FocusedReward
  end
  if 1 == Index then
    if self.Reward_Normal:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self.FocusedReward = self.Reward_Normal
    end
  elseif 2 == Index then
    if self.Reward_Sp:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self.FocusedReward = self.Reward_Sp
    end
  elseif 3 == Index then
    if self.Reward_Sp_1:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self.FocusedReward = self.Reward_Sp_1
    end
  else
    return self.FocusedReward
  end
  self.SelectedIndex = Index
  if not self.IsSp then
    self.Content.Root:SetCurFocusedRewardIndex(self, self.SelectedIndex)
  end
  return self.FocusedReward
end

function M:GetTargetIndexAndReward(Index)
  if not Index or 1 == Index then
    return 1, self.Reward_Normal
  elseif 2 == Index then
    return 2, self.Reward_Sp
  elseif self.Reward_Sp_1:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    return 3, self.Reward_Sp_1
  else
    return 2, self.Reward_Sp
  end
end

function M:BP_GetDesiredFocusTarget()
  if self.IsSp then
    self.SelectedIndex, self.FocusedReward = self:GetTargetIndexAndReward()
    return self.Reward_Normal
  else
    local FocusedIndex = self.Content.Root:GetCurFocusedRewardIndex()
    self.SelectedIndex, self.FocusedReward = self:GetTargetIndexAndReward(FocusedIndex)
    self.Content.Root:SetCurFocusedRewardIndex(self, self.SelectedIndex)
    return self.FocusedReward
  end
end

function M:OnFocusItemChanged(RewardContent)
  self.Content.Root:OnFocusItemChanged(RewardContent.bCanGet)
end

return M
