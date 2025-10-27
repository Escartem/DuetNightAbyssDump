require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C",
  "BluePrints.UI.UIComponent.StarsUIComponent"
}

function M:Construct()
  self.Text_Lv:SetText(GText("UI_LEVEL_NAME"))
  self.Btn_ExpReward.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Init(Level, MaxLevel, ExpPercent, StarNumber, BreakLevelUpData, Type, Tag, IsPreviewMode)
  self.IsPreviewMode = IsPreviewMode
  self.Text_Level:SetText(Level)
  if MaxLevel then
    self.Text_MaxLevel:SetText(MaxLevel)
    self.Split:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_MaxLevel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_MaxLevel:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local MaxStarNumber = BreakLevelUpData and #BreakLevelUpData or 0
  self:SetStars(StarNumber, MaxStarNumber)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self)
  local ExpCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Exp_Bar)
  local Margin = ExpCanvasSlot:GetOffsets()
  if MaxLevel and Level == MaxLevel then
    Margin.Right = 0
  else
    Margin.Right = CanvasSlot:GetSize().X * (1 - ExpPercent)
  end
  ExpCanvasSlot:SetOffsets(Margin)
  if not self.IsPreviewMode and ("Char" == Tag or "Ranged" == Tag or "Melee" == Tag) then
    self.CurLevel = Level
    self.BreakLevelUpData = BreakLevelUpData
    self.Type = Type
    self.Tag = Tag
    self.Btn_ExpReward.Btn_Area.OnClicked:Add(self, self.OnExpRewardBtnClicked)
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_ExpReward:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_ExpReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnExpRewardBtnClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  local Params = self:MakeBreakRewardData()
  Params.AutoFocus = true
  UIManager(self):ShowCommonPopupUI(100251, Params, self)
end

function M:MakeBreakRewardData()
  if not self.BreakLevelUpData or nil == self.Type then
    return {}
  end
  local Avatar = GWorld:GetAvatar()
  local Params = {}
  local ConfigData = {}
  
  function ConfigData.ReceiveAllCallBack(_, ReceiveAllParm)
    self:GetAllRewards(ReceiveAllParm)
  end
  
  ConfigData.ReceiveAllParam = {}
  ConfigData.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
  ConfigData.ShowTotalProgress = false
  local Items = {}
  for _, BreakData in pairs(self.BreakLevelUpData) do
    if BreakData.CollectReward then
      local BreakNum = BreakData[self.Type .. "BreakNum"]
      local BreakLevel = BreakData[self.Type .. "BreakLevel"]
      local StrTypeId = tostring(BreakData[self.Type .. "Id"])
      local ReceiveParm = table.concat({
        self.Type,
        "Break",
        ".",
        StrTypeId,
        ".",
        BreakNum
      })
      local StoredReward = Avatar.StoredCollectReward[ReceiveParm]
      local CollectedReward = Avatar.CollectRewardExpRecord[ReceiveParm]
      local Item = {}
      Item.ItemId = BreakNum
      Item.BreakLevel = BreakLevel
      Item.CanReceive = nil ~= StoredReward
      Item.RewardsGot = not Item.CanReceive and CollectedReward
      
      function Item.ReceiveCallBack(_, ReceiveAllParm)
        self:GetReward(ReceiveAllParm)
      end
      
      Item.ReceiveParm = {ReceiveParm}
      Item.BreakStarCount = BreakNum
      Item.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
      Item.NotreachText = GText("UI_Archive_CollectionInProgress")
      local Rewards = {}
      local RewardsInfo = DataMgr.Reward[BreakData.CollectReward]
      for Index, ItemId in ipairs(RewardsInfo.Id) do
        local RewardContent = {
          ItemId = ItemId,
          ItemType = RewardsInfo.Type[Index],
          Count = RewardsInfo.Count[Index][1],
          Rarity = DataMgr.Resource[ItemId].Rarity
        }
        table.insert(Rewards, RewardContent)
      end
      Item.Rewards = Rewards
      table.insert(Items, Item)
      if Item.CanReceive and not Item.RewardsGot then
        table.insert(ConfigData.ReceiveAllParam, ReceiveParm)
      end
    end
  end
  ConfigData.Items = Items
  Params.ConfigData = ConfigData
  return Params
end

function M:GetReward(Content)
  local Avatar = GWorld:GetAvatar()
  local ReceiveParm = Content.ConfigData.ReceiveParm
  if Avatar and #ReceiveParm > 0 then
    local DialogWidget = Content.Owner
    
    local function CallBack(Ret, Rewards)
      self:RefreshRewardDialog(DialogWidget, Rewards)
    end
    
    DialogWidget:BlockAllUIInput(true)
    Avatar:GetStoredCollectReward(CallBack, ReceiveParm)
  end
end

function M:GetAllRewards(ReceiveAllParm)
  local Avatar = GWorld:GetAvatar()
  local RewardPathTable = {}
  for _, RewardPath in ipairs(ReceiveAllParm) do
    table.insert(RewardPathTable, RewardPath)
  end
  if Avatar and #RewardPathTable > 0 then
    local DialogWidget = ReceiveAllParm.SelfWidget
    
    local function CallBack(Ret, Rewards)
      self:RefreshRewardDialog(DialogWidget, Rewards)
    end
    
    DialogWidget:BlockAllUIInput(true)
    Avatar:GetStoredCollectReward(CallBack, RewardPathTable)
  end
end

function M:RefreshRewardDialog(DialogWidget, Rewards)
  if not DialogWidget then
    return
  end
  DialogWidget:BlockAllUIInput(false)
  local Avatar = GWorld:GetAvatar()
  local HaveReWardToGet = false
  for i = 1, DialogWidget.List_Item:GetNumItems() do
    local Item = DialogWidget.List_Item:GetItemAt(i - 1)
    if Item then
      local RewardId = DialogWidget.ConfigData.Items[i].ReceiveParm[1]
      local StoredReward = Avatar.StoredCollectReward[RewardId]
      local CollectedReward = Avatar.CollectRewardExpRecord[RewardId]
      local CanReceive = nil ~= StoredReward
      local IsRewardsGot = not CanReceive and CollectedReward
      if CanReceive and not IsRewardsGot then
        HaveReWardToGet = true
      end
      Item.ConfigData.CanReceive = CanReceive
      Item.ConfigData.RewardsGot = IsRewardsGot
      if Item.SelfWidget then
        Item.SelfWidget:RefreshBtn(IsRewardsGot)
      end
    end
  end
  DialogWidget:RefreshButton(HaveReWardToGet)
  UIManager(GWorld.GameInstance):LoadUINew("GetItemPage", nil, nil, nil, Rewards)
end

function M:ShowRewardReddot(bShow)
  if bShow and not self.IsPreviewMode then
    self.Btn_ExpReward.Reddot:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Btn_ExpReward.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:GetBtnExpRewardVisible()
  if not self.Btn_ExpReward then
    return false
  end
  return self.Btn_ExpReward:GetVisibility() ~= ESlateVisibility.Collapsed
end

AssembleComponents(M)
return M
