require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.TitleText, self.RewardInfoList = ...
  self.LastShowRewardList = {}
  self.IsInit = true
  local Offset = self.Offset_M
  if Offset and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local Padding = self.Padding
    Padding.Bottom = Offset
    self:SetPadding(Padding)
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:InitRewardInfo(TitleText, RewardInfoList)
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    local BattleNode = UIBattleMain.Pos_Reward
    if BattleNode then
      BattleNode:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self.FrameCount = 0
  self:CleanTimer()
  self:UnbindAllFromAnimationFinished(self.Auto_In)
  self:UnbindAllFromAnimationFinished(self.Reward_Turn)
  self:UnbindAllFromAnimationFinished(self.Auto_Out)
  self:StopAllAnimations()
  self:BindToAnimationFinished(self.Auto_In, {
    self,
    self.PlayOutAnim
  })
  self:BindToAnimationFinished(self.Reward_Turn, {
    self,
    self.PlayOutAnim
  })
  self.List_Reward:ClearListItems()
  self.TotalCount = 9
  self.CurrentCount = 1
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.TotalCount = 5
  end
  self.RewardList = {}
  if RewardInfoList then
    self.RewardList = self:MergeRewardInfo(RewardInfoList)
    table.sort(self.RewardList, function(A, B)
      if A.Rarity == B.Rarity then
        return A.ItemId < B.ItemId
      end
      return A.Rarity > B.Rarity
    end)
  end
  if TitleText then
    self.Text_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_RewardTitle:SetText(GText(TitleText))
  else
    self.Text_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.RewardList then
    self.TotalRewardCount = #self.RewardList
    self:ShowRewardInfo()
  end
end

function M:ShowRewardInfo()
  AudioManager(self):PlayUISound(self, "event:/ui/common/reward_light", nil, nil)
  self:PlayAnimation(self.Auto_In)
  self:AddItemToListRewardIn()
  self:AddItemToListRewardOut()
end

function M:AddItemToListRewardIn()
  self.LastShowRewardList = {}
  self.List_Reward:ClearListItems()
  for index, _ in pairs(self.RewardList) do
    if index > self.TotalCount then
      break
    end
    local RewardInfo = self.RewardList[self.CurrentCount]
    if not RewardInfo then
      break
    end
    table.insert(self.LastShowRewardList, RewardInfo)
    self.CurrentCount = self.CurrentCount + 1
    local ItemType = RewardInfo.ItemType
    local ItemId = RewardInfo.ItemId
    local Count = RewardInfo.Count
    local Object = NewObject(UIUtils.GetCommonItemContentClass())
    Object.ParentWidget = self
    Object.ItemType = ItemType
    Object.Id = ItemId
    Object.Count = Count or nil
    Object.Icon = ItemUtils.GetItemIconPath(ItemId, ItemType)
    Object.Rarity = ItemUtils.GetItemRarity(ItemId, ItemType)
    Object.IsShowDetails = false
    Object.bPlayInAnim = true
    Object.NotInteractive = true
    self.List_Reward:AddItem(Object)
  end
end

function M:AddItemToListRewardOut()
  if self.LastShowRewardList then
    self.List_Reward_1:ClearListItems()
    for _, RewardInfo in pairs(self.LastShowRewardList) do
      local ItemType = RewardInfo.ItemType
      local ItemId = RewardInfo.ItemId
      local Count = RewardInfo.Count
      local Object = NewObject(UIUtils.GetCommonItemContentClass())
      Object.ParentWidget = self
      Object.ItemType = ItemType
      Object.Id = ItemId
      Object.Count = Count or nil
      Object.Icon = ItemUtils.GetItemIconPath(ItemId, ItemType)
      Object.Rarity = ItemUtils.GetItemRarity(ItemId, ItemType)
      Object.IsShowDetails = false
      Object.NotInteractive = true
      self.List_Reward_1:AddItem(Object)
    end
  end
end

function M:MergeRewardInfo(RewardInfoList)
  local RewardList = {}
  for _, RewardInfo in pairs(RewardInfoList) do
    local ItemType = RewardInfo.ItemType
    local ItemId = RewardInfo.ItemId
    local Count = RewardInfo.Count
    if not RewardList[ItemType] then
      RewardList[ItemType] = {}
      RewardList[ItemType][ItemId] = Count
    elseif not RewardList[ItemType][ItemId] then
      RewardList[ItemType][ItemId] = Count
    else
      RewardList[ItemType][ItemId] = RewardList[ItemType][ItemId] + Count
    end
  end
  local Res = {}
  for ItemType, ItemData in pairs(RewardList) do
    for ItemId, Count in pairs(ItemData) do
      local Rarity = ItemUtils.GetItemRarity(ItemId, ItemType)
      table.insert(Res, {
        ItemType = ItemType,
        ItemId = ItemId,
        Count = Count,
        Rarity = Rarity
      })
    end
  end
  return Res
end

function M:SetFollowNode()
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    local BattleNode = UIBattleMain.Pos_Reward
    if BattleNode then
      local BattleGeometry = UIBattleMain.Pos_Reward:GetTickSpaceGeometry()
      local BattleLocalCenter = USlateBlueprintLibrary.GetLocalSize(BattleGeometry) / 2
      local BattleNodePos = USlateBlueprintLibrary.LocalToAbsolute(BattleGeometry, BattleLocalCenter)
      local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(UIBattleMain, BattleNodePos)
      local RootNode = self.VB_Reward
      assert(nil ~= RootNode, "ZDX_:SetFollowNode RootNode is nil!!!")
      local RewardSize = RootNode:GetDesiredSize()
      if 0 == ViewportPosition.X and 0 == ViewportPosition.Y then
        assert(false, "ZDX_:SetFollowNode ViewportPosition is 0!!!")
        return
      end
      self:SetPositionInViewport(ViewportPosition - RewardSize / 2, false)
    end
  end
end

function M:PlayOutAnim()
  if self.TotalRewardCount > self.CurrentCount then
    self:AddTimer(self.RefreshTime, function()
      self:PlayAnimation(self.Reward_Turn)
      self:AddItemToListRewardOut()
      self:AddItemToListRewardIn()
    end, false, nil, "PlayOutAnim")
  else
    self:AddTimer(self.RefreshTime, self.CloseSelf, false, nil, "PlayOutAnim", false)
  end
end

function M:CloseSelf()
  EventManager:FireEvent(EventID.OnHudRewardClose, self)
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    local BattleNode = UIBattleMain.Pos_Reward
    if BattleNode then
      BattleNode:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self:Close()
end

function M:OnAnimationFinished(InAnimation)
end

function M:IsShowing()
  if self:IsAnimationPlaying(self.Auto_In) or self:IsAnimationPlaying(self.Auto_Out) or self:IsExistTimer("PlayOutAnim") then
    return true
  end
  return false
end

return M
