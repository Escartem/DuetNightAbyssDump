require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.Tab01.Btn_Click.OnClicked:Add(self, self.OnBtnClick1)
  self.Tab02.Btn_Click.OnClicked:Add(self, self.OnBtnClick2)
  self.Arrow_L.Btn.OnClicked:Add(self, self.ShowPreDungeon)
  self.Arrow_R.Btn.OnClicked:Add(self, self.ShowNextDungeon)
  self.FeinaEventBtn.Btn_Click.OnClicked:Add(self, self.GoToDungeon)
  if self.Controller_L then
    self.Controller_L:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LB",
          Owner = self
        }
      }
    })
    self.Controller_R:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RB",
          Owner = self
        }
      }
    })
    self.Controller_Tab_L:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
          Owner = self
        }
      }
    })
    self.Controller_Tab_R:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RT",
          Owner = self
        }
      }
    })
    self.Controller_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
          Owner = self
        }
      }
    })
    self.FeinaEventBtn.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
          Owner = self
        }
      }
    })
  end
  self.FeinaEventBtn.Text_Button:SetText(GText("DUNGEONSINGLE"))
end

function M:Destruct()
  self.Tab01.Btn_Click.OnClicked:Remove(self, self.OnBtnClick1)
  self.Tab02.Btn_Click.OnClicked:Remove(self, self.OnBtnClick2)
  self.Arrow_L.Btn.OnClicked:Remove(self, self.ShowPreDungeon)
  self.Arrow_R.Btn.OnClicked:Remove(self, self.ShowNextDungeon)
  self.FeinaEventBtn.Btn_Click.OnClicked:Remove(self, self.GoToDungeon)
  self.List_Reward.OnCreateEmptyContent:Unbind()
  self.Super.Destruct(self)
end

function M:GoToDungeon()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local EventId = DataMgr.EventConstant.FeinaEventId.ConstantValue
  local DungeonId = self.Tab01.IsClick and self.DungeonId[1] or self.DungeonId[2]
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  local CurTabIndex = 1
  if ActivityMain then
    CurTabIndex = ActivityMain.CurTabIndex
  end
  local ExitDungeonInfo = {Type = "FeinaEvent", CurTabIndex = CurTabIndex}
  GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
  Avatar:EnterEventDungeon(function()
    self.RootPanel:DirectlyClose()
  end, DungeonId, nil, EventId)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_btn_enter_level", nil, nil)
end

function M:ShowPreDungeon()
  self.RootPanel:RefreshCurSubUI(self.Index - 1)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_btn_small", nil, nil)
end

function M:ShowNextDungeon()
  self.RootPanel:RefreshCurSubUI(self.Index + 1)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_btn_small", nil, nil)
end

function M:OnBtnClick1()
  if 1 == #self.DungeonId or self.Tab01.IsClick then
    return
  end
  self:ShowDungeon1()
  self:PlayAnimation(self.Switch_Tab)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_tab_btn_click", nil, nil)
end

function M:OnBtnClick2()
  if 1 == #self.DungeonId or self.Tab02.IsClick then
    return
  end
  if not self.IsPassDungeon1 then
    local FeinaEventDungeonConfig = DataMgr.FeinaEventDungeon[self.DungeonId[2]]
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText(FeinaEventDungeonConfig.LockToast))
  else
    self:ShowDungeon2()
    self:PlayAnimation(self.Switch_Tab)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_tab_btn_click", nil, nil)
end

function M:ShowDungeon1()
  self.Tab01.IsClick = true
  self.Tab02.IsClick = false
  self.Tab01.Btn_Click:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Tab02.Btn_Click:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Tab01:PlayAnimation(self.Tab01.Click)
  if self.IsPassDungeon1 then
    if self.IsPassDungeon2 then
      self.Tab02:PlayAnimation(self.Tab02.Finish)
    else
      self.Tab02:PlayAnimation(self.Tab02.Normal)
    end
  end
  self:ShowDungeonById(self.DungeonId[1], 1)
end

function M:ShowDungeon2()
  self.Tab02.IsClick = true
  self.Tab01.IsClick = false
  self.Tab02.Btn_Click:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Tab01.Btn_Click:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Tab02:PlayAnimation(self.Tab02.Click)
  self.Tab01:PlayAnimation(self.Tab01.Finish)
  self:ShowDungeonById(self.DungeonId[2], 2)
end

function M:ShowDungeonById(DungeonId, Index)
  local FeinaEventDungeonConfig = DataMgr.FeinaEventDungeon[DungeonId]
  self.Text_Name:SetText(GText(FeinaEventDungeonConfig.DungeonName))
  self.Text_Desc:SetText(GText(FeinaEventDungeonConfig.DungeonDes))
  local IsGetReward = false
  if 1 == Index then
    IsGetReward = self.IsPassDungeon1
  elseif 2 == Index then
    IsGetReward = self.IsPassDungeon2
  end
  local PassReward = FeinaEventDungeonConfig.PassReward
  self:RefreshRewardItemList(PassReward, IsGetReward)
end

function M:InitLevelDetail(DungeonId, IsPassDungeon1, IsPassDungeon2, Index)
  self.IsGamepadClickItem = false
  self.IsClose = false
  self.DungeonId = DungeonId
  self.IsPassDungeon1 = IsPassDungeon1
  self.IsPassDungeon2 = IsPassDungeon2
  self.Index = Index
  self.Text_Reward:SetText(GText("UI_Dungeon_First_Reward"))
  self:InitLevelDetailTap()
  self:UpdateLevelBanner()
  self:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Panel_L:SetVisibility(1 == Index and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_R:SetVisibility(4 == Index and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self:ShowDungeon1()
  self:RefreshOpInfoByInputDevice()
end

function M:RefreshRewardItemList(DungeonReward, IsGetReward)
  self.List_Reward:ClearListItems()
  if not DungeonReward then
    return
  end
  local RewardInfo = DataMgr.Reward[DungeonReward]
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
      local RewardContent = NewObject(UIUtils.GetCommonItemContentClass())
      RewardContent.Id = ItemId
      RewardContent.Count = Count
      RewardContent.Icon = Icon
      RewardContent.Rarity = Rarity
      RewardContent.ItemType = ItemType
      RewardContent.IsShowDetails = true
      RewardContent.bHasGot = IsGetReward
      RewardContent.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.OnMenuOpenChanged
      }
      self.List_Reward:AddItem(RewardContent)
    end
  end
  self.List_Reward:RequestFillEmptyContent()
end

function M:UpdateLevelBanner()
  for Index = 1, 4 do
    self.Level["Bg_Level0" .. Index]:SetVisibility(Index == self.Index and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
  local CurBanner = self.Level["Bg_Level0" .. self.Index]
  CurBanner:PlayAnimation(CurBanner.In)
  CurBanner.Spine_Story:SetAnimation(0, "In", false)
  CurBanner.Spine_Story:AddAnimation(0, "Loop", true, 0)
  self.Level.Text_Num:SetText(self.Index)
end

function M:InitLevelDetailTap()
  self.Panel_Tab:SetVisibility(1 == #self.DungeonId and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Tab01.IsClick = true
  self.Tab01.Btn_Click:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Tab01:PlayAnimation(self.Tab01.Click)
  if not self.IsPassDungeon1 then
    self.Tab01.Panel_Finish:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Tab02.Panel_Finish:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Tab02:PlayAnimation(self.Tab02.Fobidden)
    self.Tab02.IsLock = true
  elseif self.IsPassDungeon1 and not self.IsPassDungeon2 then
    self.Tab01.Panel_Finish:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Tab02.Panel_Finish:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Tab02:PlayAnimation(self.Tab02.Normal)
    self.Tab02.IsLock = false
  elseif self.IsPassDungeon2 then
    self.Tab01.Panel_Finish:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Tab02.Panel_Finish:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Tab02:PlayAnimation(self.Tab02.Finish)
    self.Tab02.IsLock = false
  end
end

function M:CloseSelf()
  self.IsClose = true
  self.IsGamepadClickItem = false
  self:PlayAnimation(self.Out)
end

function M:DirectlyClose()
  self.IsClose = true
  self.IsGamepadClickItem = false
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.Controller_L then
    self.Controller_L:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_R:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Tab_L:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Tab_R:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Reward:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.FeinaEventBtn.Key_GamePad:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
end

function M:HideGamepadTips(IsHide)
  if self.Controller_L then
    self.Controller_L:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_R:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Tab_L:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Tab_R:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Controller_Reward:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.FeinaEventBtn.Key_GamePad:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.RootPanel.Reward.Key_Controller:SetVisibility(not IsHide and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnMenuOpenChanged(IsOpen)
  if not UIUtils.IsGamepadInput() then
    return
  end
  if IsOpen then
    self.RootPanel:CloseBottomKetInfo()
  else
    self.RootPanel:UpdateBottomKeyInfo()
  end
end

return M
