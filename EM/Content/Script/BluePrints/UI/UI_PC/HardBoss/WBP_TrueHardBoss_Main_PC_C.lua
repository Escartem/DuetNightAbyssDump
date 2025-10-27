require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_TrueHardBoss_Main_PC_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_TrueHardBoss_Main_PC_C:Construct()
  self.SelectedIndex = nil
  self.CurTeleportId = nil
  self.CurTabId = nil
  self.AllTabInfo = {}
  self:PlayInAnim()
end

function WBP_TrueHardBoss_Main_PC_C:PlayInAnim()
  self:UpdateTabReddot()
  self:RefreshOtherInfo()
  self:InitRewardTimesInfo()
  self:InitListBossInfo()
end

function WBP_TrueHardBoss_Main_PC_C:UpdateTabReddot()
  local Item = UIManager(self):GetUIObj("StyleOfPlay")
  Item:UpdateTabReddot("HardBossMain", false)
  EMCache:Set("HardBossTabReddot", false, true)
  EventManager:FireEvent(EventID.OnHardBossReddotUpdate)
end

function WBP_TrueHardBoss_Main_PC_C:RefreshOtherInfo()
  self.Common_Button_Text_PC:SetKeyPanelVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_Button_Text_PC:BindEventOnClicked(self, self.OnClickTrack)
  self.Common_Button_Text_PC:SetText(GText("UI_HardBoss_Track"))
  self.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  self.Text_UnlockLevelTitle:SetText(GText("UI_HardBoss_Maxlevel") .. ": ")
end

function WBP_TrueHardBoss_Main_PC_C:InitRewardTimesInfo()
  local Text = GText("UI_HardBoss_ChancesRemain")
  local RemainTimes = 0
  local TotalTimes = DataMgr.GlobalConstant.BossRewardRefresh.ConstantValue
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    RemainTimes = Avatar.HardBoss.HardBossRewardTimesLeft
  end
  if RemainTimes <= 0 then
    Text = Text .. "<Warning>" .. RemainTimes .. "/" .. math.floor(TotalTimes) .. "</>"
  else
    Text = Text .. RemainTimes .. "/" .. math.floor(TotalTimes)
  end
  self.Text_RewardTimes:SetText(Text)
end

function WBP_TrueHardBoss_Main_PC_C:InitListBossInfo()
  local SortedHardBossMain = {}
  for _, HardBossData in pairs(DataMgr.HardBossMain) do
    table.insert(SortedHardBossMain, HardBossData)
  end
  table.sort(SortedHardBossMain, function(a, b)
    if (a.DisplayPriority or 0) == (b.DisplayPriority or 0) then
      return a.HardBossId < b.HardBossId
    else
      return (a.DisplayPriority or 0) < (b.DisplayPriority or 0)
    end
  end)
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  local Index = 1
  self.LastIndex = 0
  self.List_Boss:ClearListItems()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, HardBossData in ipairs(SortedHardBossMain) do
      if Avatar:CheckHardBossUnlockCondition(HardBossData.HardBossId) then
        local BossObj = NewObject(UE4.LoadClass(ClassPath))
        BossObj.Id = HardBossData.HardBossId
        BossObj.Index = Index
        BossObj.Parent = self
        BossObj.Empty = false
        Index = Index + 1
        self.List_Boss:AddItem(BossObj)
      end
    end
  end
  self.LastIndex = Index - 1
end

function WBP_TrueHardBoss_Main_PC_C:FillWrapBox(Index)
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  
  local function FillWrapBoxFunc()
    local HasEmptyCell = false
    local ScrollBoxSize = USlateBlueprintLibrary.GetLocalSize(self.ScrollBox_BossList:GetCachedGeometry())
    local Entry = self.List_Boss:GetItemAt(0).Entry
    local EntrySize = USlateBlueprintLibrary.GetLocalSize(Entry:GetCachedGeometry())
    if 0 == ScrollBoxSize.Y or 0 == EntrySize.Y then
      return false
    end
    local YCount = math.floor(ScrollBoxSize.Y / EntrySize.Y) + 1
    for i = 1, YCount - Index do
      local BossObj = NewObject(UE4.LoadClass(ClassPath))
      BossObj.Parent = self
      BossObj.Empty = true
      self.List_Boss:AddItem(BossObj)
      HasEmptyCell = true
    end
    if HasEmptyCell then
      self.ScrollBox_BossList:SetScrollBarVisibility(ESlateVisibility.Collapsed)
      self.ScrollBox_BossList:SetConsumeMouseWheel(EConsumeMouseWheel.Never)
    else
      self.ScrollBox_BossList:SetScrollBarVisibility(ESlateVisibility.Visible)
      self.ScrollBox_BossList:SetConsumeMouseWheel(EConsumeMouseWheel.WhenScrollingPossible)
    end
    return true
  end
  
  local function TimerFunc()
    if FillWrapBoxFunc() then
      self:RemoveTimer("FillWrapBoxTimer", true)
      return true
    end
    return false
  end
  
  self:AddTimer(0.05, TimerFunc, true, nil, "FillWrapBoxTimer", true)
end

function WBP_TrueHardBoss_Main_PC_C:RefreshListBossInfo(Index)
  if self.SelectedIndex ~= nil then
    local CurSelectBossContent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    local SubCell = CurSelectBossContent.Entry.Common_List_Subcell_PC
    SubCell.IsSelect = false
    SubCell:StopAllAnimations()
    SubCell:PlayAnimation(SubCell.Normal)
    CurSelectBossContent.Entry:PlayAnimationForward(CurSelectBossContent.Entry.Text_Normal)
  end
  self.SelectedIndex = Index
  local CurSelectBossContent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
  local BtnInfo = DataMgr.HardBossMain
  local HardBossDifficulty = DataMgr.HardBossDifficulty
  local BossInfo = BtnInfo[CurSelectBossContent.Id]
  self.CurTeleportId = BossInfo.TeleportId
  local AllDifficultyId = BossInfo.DifficultyId
  local UnlockHighestDifficultyId = AllDifficultyId[#AllDifficultyId]
  local UnlockHighestLevel = HardBossDifficulty[UnlockHighestDifficultyId].DifficultyLevel
  self.Text_BossTitle:SetText(GText(BossInfo.HardBossName))
  self.Group_TaskPosition:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_BossDetail:SetText(GText(BossInfo.HardBossDes))
  self.Text_UnlockLevelNum:SetText(GText("BATTLE_UI_BLOOD_LV") .. UnlockHighestLevel)
  CurSelectBossContent.Entry:PlayAnimationForward(CurSelectBossContent.Entry.Text_Select)
  local HardBossCache = EMCache:Get("HardBoss", true) or {}
  if HardBossCache[CurSelectBossContent.Id] then
    HardBossCache[CurSelectBossContent.Id] = nil
    EMCache:Set("HardBoss", HardBossCache, true)
    CurSelectBossContent.Entry.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RefreshRewardsList(BossInfo)
end

function WBP_TrueHardBoss_Main_PC_C:RefreshRewardsList(BossInfo)
  self.ListView_Rewards:ClearListItems()
  local HardBossDifficulty = DataMgr.HardBossDifficulty
  local HighestDifficultyId = BossInfo.DifficultyId[1]
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for DifficultyIndex = #BossInfo.DifficultyId, 1, -1 do
      local DifficultyId = BossInfo.DifficultyId[DifficultyIndex]
      if Avatar:CheckHardBossCondition(DifficultyId) then
        HighestDifficultyId = DifficultyId
        break
      end
    end
  end
  local BossReward = HardBossDifficulty[HighestDifficultyId].DifficultyReward
  self.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  for _, RewardId in pairs(BossReward) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        local ItemId = Ids[i]
        Content.UIName = "HardBossMain"
        Content.IsShowDetails = true
        Content.Id = ItemId
        Content.Count = RewardUtils:GetCount(RewardCount[i])
        Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        self.ListView_Rewards:AddItem(Content)
      end
    end
  end
end

function WBP_TrueHardBoss_Main_PC_C:OnClickTrack()
  if not self.CurTeleportId then
    return
  end
  local SubRegionId = DataMgr.TeleportPoint[self.CurTeleportId].TeleportPointSubRegion
  local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
  if RegionId then
    self.Root:Close()
    UIManager(self):LoadUINew("LevelMapMain", false, RegionId, "TeleportPoint", self.CurTeleportId)
  end
end

return WBP_TrueHardBoss_Main_PC_C
