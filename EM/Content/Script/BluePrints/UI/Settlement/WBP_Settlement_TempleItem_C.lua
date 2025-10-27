require("UnLua")
local WBP_Settlement_TempleItem_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Settlement_TempleItem_C:SetStarLevel(Count, FailReason)
  self.StarCount = Count
  if "" == FailReason then
    self.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_STAR"))
    self.HB_StarSign:SetVisibility(ESlateVisibility.HitTestInvisible)
    local Num = self.HB_StarSign:GetChildrenCount()
    for i = 1, Num do
      local StarWidgetName = "WBP_LevelMap_TempleStarItem_" .. i
      if self[StarWidgetName] then
        self[StarWidgetName]:SetBigStar()
      end
    end
    for i = Num, self.StarCount + 1, -1 do
      local StarWidgetName = "WBP_LevelMap_TempleStarItem_" .. i
      if self[StarWidgetName] then
        self[StarWidgetName]:PlayOffAnim()
      end
    end
  else
    self.Text_Title:SetText(GText("UI_TEMPLE_FAILURE_REASON"))
    self.Text_StarDesc:SetText(GText("UI_TEMPLE_FAILURE_" .. FailReason))
    self.Text_StarDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function WBP_Settlement_TempleItem_C:SetNoStarLevel(FailReason)
  if "" == FailReason then
    self.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_STAR"))
    self.Text_StarDesc:SetText(GText("UI_TEMPLE_NO_STAR"))
    self.Text_StarDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Text_Title:SetText(GText("UI_TEMPLE_FAILURE_REASON"))
    self.Text_StarDesc:SetText(GText("UI_TEMPLE_FAILURE_" .. FailReason))
    self.Text_StarDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function WBP_Settlement_TempleItem_C:SetPoints(Points)
  self.Text_PointsNum:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.Text_PointsNum:SetText(Points)
end

function WBP_Settlement_TempleItem_C:SetStarRewards(RewardsInfo, CurrentStar, HistoryMaxStar)
  self.Text_Title:SetText(GText("UI_TEMPLE_REWARDS"))
  self.Group_Star:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_LessRewards:SetVisibility(ESlateVisibility.Visible)
  for i = 1, #RewardsInfo do
    self["VX_BgGlow0" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["VX_GotProgressFrame0" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["VX_FBframe_" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["VX_Mid_" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["VX_ReGlow_" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["VX_BoomGlow_" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  for i = 1, CurrentStar do
    RewardsInfo[i].bHasGot = true
  end
  for i = #RewardsInfo, CurrentStar + 1, -1 do
    if i >= 2 then
      self["VX_Bar" .. i - 1 .. "_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    end
    self["VX_BgGlow0" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_GotProgressFrame0" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_FBframe_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_Mid_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_ReGlow_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_BoomGlow_" .. i]:SetVisibility(ESlateVisibility.Hidden)
  end
  for i = 1, HistoryMaxStar do
    RewardsInfo[i].bHasGot = true
    self["VX_BgGlow0" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_FBframe_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_Mid_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_ReGlow_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_BoomGlow_" .. i]:SetVisibility(ESlateVisibility.Hidden)
    self["VX_GotProgressFrame0" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  for i = 1, #RewardsInfo do
    self["Item0" .. i]:Init(RewardsInfo[i])
  end
end

function WBP_Settlement_TempleItem_C:SetNoStarRewards(RewardsInfo, IsPass, IntervalTime, FirstDelayTime)
  self.Text_Title:SetText(GText("UI_TEMPLE_REWARDS"))
  self.Group_Star:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_LessRewards:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_MoreRewards:SetVisibility(ESlateVisibility.Visible)
  self.List_Reward:ClearListItems()
  self.RewardsInfo = RewardsInfo
  self.IsPass = IsPass
  self.IntervalTime = IntervalTime
  self.FirstDelayTime = FirstDelayTime
end

function WBP_Settlement_TempleItem_C:ActiveStar1()
  if self.StarCount ~= nil and self.StarCount >= 1 then
    self.WBP_LevelMap_TempleStarItem_1:PlayStarInAnim()
  end
end

function WBP_Settlement_TempleItem_C:ActiveStar2()
  if self.StarCount ~= nil and self.StarCount >= 2 then
    self.WBP_LevelMap_TempleStarItem_2:PlayStarInAnim()
  end
end

function WBP_Settlement_TempleItem_C:ActiveStar3()
  if self.StarCount ~= nil and self.StarCount >= 3 then
    self.WBP_LevelMap_TempleStarItem_3:PlayStarInAnim()
  end
end

function WBP_Settlement_TempleItem_C:PlayStarInAnim()
  self:PlayAnimation(self.StarSign_In)
end

function WBP_Settlement_TempleItem_C:PlayPointsInAnim()
  self:PlayAnimation(self.PointsNum_In)
end

function WBP_Settlement_TempleItem_C:PlayRewardsInAnim()
  self:PlayAnimation(self.Rewards_In)
end

function WBP_Settlement_TempleItem_C:StartShowNoStarRewards()
  local function AddProp()
    local CurrentNum = self.List_Reward:GetNumItems()
    
    if CurrentNum < #self.RewardsInfo then
      self.List_Reward:AddItem(self:NewPropContent(self.RewardsInfo[CurrentNum + 1]), self.List_Reward)
      self.List_Reward:SetScrollbarVisibility(ESlateVisibility.Collapsed)
    else
      self:RemoveTimer("AddTempleProp", true)
    end
  end
  
  if self.IntervalTime ~= nil and nil ~= self.RewardsInfo then
    self:AddTimer(self.IntervalTime, AddProp, true, 0, "AddTempleProp", true)
    self:AddTimer(self.IntervalTime + 1, function()
      self.List_Reward:SetFocus()
    end)
  end
end

function WBP_Settlement_TempleItem_C:NewPropContent(Content, RewardViewWidget)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  if nil ~= Content then
    Obj.ParentWidget = self
    Obj.Id = Content.Id
    Obj.Count = Content.Count
    
    function Obj.AfterInitCallback(Widget)
      if not Widget.Content.IsPlayedInAnimation then
        Widget:PlayInAnimation()
        Widget.Content.IsPlayedInAnimation = true
      else
        Widget:PlayAnimation(Widget.Normal_In, Widget.Normal_In:GetEndTime())
      end
      self:OpenTipsBindEvents(Widget)
    end
    
    Obj.Icon = Content.Icon
    Obj.Rarity = Content.Rarity
    if Content.IsWalnut then
      Obj.IsShowDetails = false
      Obj.OnMouseButtonUpEvents = Content.OnMouseButtonUpEvents
    else
      Obj.IsShowDetails = true
    end
    Obj.ItemType = Content.ItemType
    Obj.IsSpecial = Content.IsSpecial
    Obj.IsBonus = Content.IsBonus
    Obj.IsWalnutBonus = Content.IsWalnutBonus
    Obj.UIName = "DungeonSettlement"
    Obj.FirstRewardFlag = Content.IsFirst
    Obj.bHasGot = self.IsPass
  end
  return Obj
end

function WBP_Settlement_TempleItem_C:OpenTipsBindEvents(Widget)
  local Events = {}
  Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
  Widget:BindEvents(self, Events)
end

function WBP_Settlement_TempleItem_C:ItemMenuAnchorChanged()
  if UIManager(self.ParentUI):IsHaveMenuAnchorOpen() then
    self.ParentUI:UpdateMainUIInGamePadClick()
  elseif self.ParentUI.CurInputDeviceType == ECommonInputType.Gamepad then
    self.ParentUI:SwitchMainUIPCToGamePad()
    self.ParentUI:SetFocusInGamePad()
    self.ParentUI:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
  else
    self.ParentUI:UpdateMainUIWithPCOrMoble()
  end
end

return WBP_Settlement_TempleItem_C
