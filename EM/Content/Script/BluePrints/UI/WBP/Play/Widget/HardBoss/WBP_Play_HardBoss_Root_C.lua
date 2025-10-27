require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_Play_HardBoss_Root_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Play_HardBoss_Root_C:Construct()
  self.SelectedIndex = nil
  self.CurTeleportId = nil
  self.CurTabId = nil
  self.TitleWidget = nil
  self.IsInSelectState = false
  self.AllTabInfo = {}
  self.List_Boss.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self:PlayInAnim()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Play_HardBoss_Root_C:Destruct()
  self:RemoveTimer("AddHardBossItem")
  self:ClearListenEvent()
end

function WBP_Play_HardBoss_Root_C:PlayInAnim()
  self:UpdateTabReddot()
  self:RefreshOtherInfo()
  self:InitRewardTimesInfo()
  self:InitListBossInfo()
end

function WBP_Play_HardBoss_Root_C:UpdateTabReddot()
  if not ReddotManager.GetTreeNode("HardBossMain") then
    ReddotManager.AddNode("HardBossMain")
  end
  local TreeNode = ReddotManager.GetTreeNode("HardBossMain")
  if TreeNode.Count > 0 then
    ReddotManager.DecreaseLeafNodeCount("HardBossMain")
  end
end

function WBP_Play_HardBoss_Root_C:RefreshOtherInfo()
  self.Btn_Enter:BindEventOnClicked(self, self.OnClickTrack)
  self.Btn_Enter:SetText(GText("UI_HardBoss_Track"))
  self.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  self.Text_HardLevelUnlock:SetText(GText("UI_HardBoss_Maxlevel"))
  self.Text_DetailTips:SetText(GText("UI_HardBoss_FirstTime"))
end

function WBP_Play_HardBoss_Root_C:InitRewardTimesInfo()
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

function WBP_Play_HardBoss_Root_C:InitListBossInfo()
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
  local SortedUnlockHardBossMain = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, HardBossData in ipairs(SortedHardBossMain) do
      if Avatar:CheckHardBossUnlockCondition(HardBossData.HardBossId) then
        table.insert(SortedUnlockHardBossMain, HardBossData)
      end
    end
  end
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  local Index = 1
  local EmptyNum = 0
  local TryTime = 0
  self.List_Boss:ClearListItems()
  local HasEmptyCell = false
  
  local function SetAfterFillEmpty()
    if HasEmptyCell then
      self.List_Boss.ConsumeMouseWheel = EConsumeMouseWheel.Never
      self.List_Boss:SetEmptyGridItemCount(EmptyNum)
    else
      self.List_Boss.ConsumeMouseWheel = EConsumeMouseWheel.WhenScrollingPossible
    end
  end
  
  local function FillWrapBoxFunc()
    local ScrollBoxSize = USlateBlueprintLibrary.GetLocalSize(self.List_Boss:GetCachedGeometry())
    local Item = self.List_Boss:GetItemAt(0)
    if not Item then
      return false
    end
    local Entry = Item.Entry
    if not Entry then
      if Index <= 1 then
        return false
      elseif TryTime < 20 then
        TryTime = TryTime + 1
        return true
      else
        return false
      end
    end
    local EntrySize = USlateBlueprintLibrary.GetLocalSize(Entry:GetCachedGeometry())
    if 0 == ScrollBoxSize.X or 0 == EntrySize.X then
      return false
    end
    local XCount = math.floor(ScrollBoxSize.X / EntrySize.X) + 1
    if XCount < Index then
      return false
    end
    local BossObj = NewObject(UE4.LoadClass(ClassPath))
    BossObj.Parent = self
    BossObj.Empty = true
    Index = Index + 1
    self.List_Boss:AddItem(BossObj)
    HasEmptyCell = true
    EmptyNum = EmptyNum + 1
    return true
  end
  
  self:AddTimer(self.IntervalTime, function()
    if Index > #SortedUnlockHardBossMain then
      if not FillWrapBoxFunc() then
        self:RemoveTimer("AddHardBossItem")
        SetAfterFillEmpty()
      end
      return
    end
    local HardBossData = SortedUnlockHardBossMain[Index]
    local BossObj = NewObject(UE4.LoadClass(ClassPath))
    BossObj.Id = HardBossData.HardBossId
    BossObj.Index = Index
    BossObj.Parent = self
    BossObj.Empty = false
    Index = Index + 1
    self.List_Boss:AddItem(BossObj)
  end, true, 0, "AddHardBossItem", true)
  SetAfterFillEmpty()
end

function WBP_Play_HardBoss_Root_C:RefreshListBossInfo(Index, IsFirstTime)
  if self.SelectedIndex ~= nil then
    local CurSelectBossContent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    local SubCell = CurSelectBossContent.Entry
    SubCell.IsSelect = false
    SubCell:StopAllAnimations()
    SubCell:PlayAnimation(SubCell.Normal)
  end
  self.SelectedIndex = Index
  local CurSelectBossContent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
  self.List_Boss:BP_NavigateToItem(CurSelectBossContent)
  local BtnInfo = DataMgr.HardBossMain
  local BossInfo = BtnInfo[CurSelectBossContent.Id]
  self.CurBossId = CurSelectBossContent.Id
  self.CurTeleportId = BossInfo.TeleportId
  local BossBackGround = LoadObject(BossInfo.MainIcon)
  local ImgMat = self.Image_Boss:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconMap", BossBackGround)
  self.Group_Title:ClearChildren()
  self.TitleWidget = nil
  if BossInfo.TitleBp then
    self.TitleWidget = UIManager(self):CreateWidget(BossInfo.TitleBp, false)
    self.TitleWidget:SetInfo(BossInfo.HardBossName)
    self.Group_Title:AddChild(self.TitleWidget)
  end
  self.Text_BossDetail:SetText(GText(BossInfo.HardBossDes))
  if not IsFirstTime then
    self:PlayAnimation(self.Change)
  end
  if self.TitleWidget then
    self.TitleWidget:PlayAnimation(self.TitleWidget.In)
  end
  self:RefreshRewardsList(BossInfo)
end

function WBP_Play_HardBoss_Root_C:RefreshRewardsList(BossInfo)
  self.ListView_Rewards:ClearListItems()
  local HardBossDifficulty = DataMgr.HardBossDifficulty
  local HighestDifficultyId = BossInfo.DifficultyId[1]
  local Avatar = GWorld:GetAvatar()
  self.IsUpdate = false
  self.HaveFreeChance = false
  local HardBossDifficultyCache = EMCache:Get("HardBossDifficulty", true) or {}
  self.DifficultyIndexCache = HardBossDifficultyCache[BossInfo.HardBossId]
  if Avatar then
    for DifficultyIndex = #BossInfo.DifficultyId, 1, -1 do
      local DifficultyId = BossInfo.DifficultyId[DifficultyIndex]
      if Avatar:CheckHardBossCondition(DifficultyId) then
        if not self.HaveFreeChance and 0 == Avatar.HardBoss:GetPassCount(DifficultyId) then
          self.HaveFreeChance = true
        end
        if HighestDifficultyId == BossInfo.DifficultyId[1] then
          if not self.DifficultyIndexCache and DifficultyIndex > 1 or self.DifficultyIndexCache and DifficultyIndex > self.DifficultyIndexCache then
            self.IsUpdate = true
            self.DifficultyIndexCache = DifficultyIndex
          end
          HighestDifficultyId = DifficultyId
        end
      end
    end
  end
  if self.IsUpdate then
    self.Group_HardLevelUnlock:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_HardLevelUnlock:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.HaveFreeChance then
    self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local AllRewardView = {}
  for DifficultyIndex = #BossInfo.DifficultyId, 1, -1 do
    local DifficultyId = BossInfo.DifficultyId[DifficultyIndex]
    table.insert(AllRewardView, HardBossDifficulty[DifficultyId].DifficultyRewardView)
  end
  self.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local AllRewardInfo = {}
  for _, RewardViewId in pairs(AllRewardView) do
    local RewardInfo = DataMgr.RewardView[RewardViewId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        if not AllRewardInfo[ItemId] then
          local Content = NewObject(UIUtils.GetCommonItemContentClass())
          Content.UIName = "HardBossMain"
          Content.IsShowDetails = true
          Content.Id = ItemId
          Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
          Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          Content.ItemType = TableName[i]
          Content.OnMenuOpenChangedEvents = {
            Obj = self,
            Callback = self.OnMenuOpenChanged
          }
          AllRewardInfo[ItemId] = Content
        end
      end
    end
  end
  local SortedAllRewardInfo = {}
  for _, RewardContent in pairs(AllRewardInfo) do
    table.insert(SortedAllRewardInfo, RewardContent)
  end
  table.sort(SortedAllRewardInfo, function(a, b)
    if a.Rarity == b.Rarity then
      return a.Id > b.Id
    else
      return a.Rarity > b.Rarity
    end
  end)
  for _, RewardContent in ipairs(SortedAllRewardInfo) do
    self.ListView_Rewards:AddItem(RewardContent)
  end
end

function WBP_Play_HardBoss_Root_C:OnClickTrack()
  if not self.CurTeleportId then
    return
  end
  if self.IsUpdate then
    local HardBossDifficultyCache = EMCache:Get("HardBossDifficulty", true) or {}
    HardBossDifficultyCache[self.CurBossId] = self.DifficultyIndexCache
    EMCache:Set("HardBossDifficulty", HardBossDifficultyCache, true)
  end
  local SubRegionId = DataMgr.TeleportPoint[self.CurTeleportId].TeleportPointSubRegion
  local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
  if RegionId then
    UIManager(self):LoadUINew("LevelMapMain", false, RegionId, "TeleportPoint", self.CurTeleportId)
  end
end

function WBP_Play_HardBoss_Root_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Play_HardBoss_Root_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Play_HardBoss_Root_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Play_HardBoss_Root_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Play_HardBoss_Root_C:InitGamepadView()
  if self.Btn_Enter then
    self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:SetFocus()
end

function WBP_Play_HardBoss_Root_C:InitKeyboardView()
  self:LeaveSelectMode()
  if self.Btn_Enter then
    self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Play_HardBoss_Root_C:InitWidgetInfoInGamePad()
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadImg("A")
  end
  if self.Key_Rewards then
    self.Key_Rewards:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
end

function WBP_Play_HardBoss_Root_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_Play_HardBoss_Root_C:ClickListItemWhenSelectItemChanged(Content)
  Content.Entry:OnCellClicked()
end

function WBP_Play_HardBoss_Root_C:BP_GetDesiredFocusTarget()
  if self.SelectedIndex then
    local CurSelectPermanent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    return CurSelectPermanent.Entry
  else
    return self.List_Boss
  end
end

function WBP_Play_HardBoss_Root_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitSelectTab()
  self:SetectFirstItem(self.ListView_Rewards)
  self.IsInSelectState = true
end

function WBP_Play_HardBoss_Root_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:InitNormalTab()
  self:FocusOnFirstItem()
  self.IsInSelectState = false
end

function WBP_Play_HardBoss_Root_C:SetectFirstItem(List)
  if List then
    if List:GetNumItems() > 0 then
      List:NavigateToIndex(0)
    else
      List:SetFocus()
    end
  end
end

function WBP_Play_HardBoss_Root_C:InitSelectTab()
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure"),
      bLongPress = false
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(false)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Play_HardBoss_Root_C:InitNormalTab()
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Tips_Ensure"),
      bLongPress = false
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(true)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    if self.Root.ComTab.UpdateUIStyleInPlatform then
      self.Root.ComTab:UpdateUIStyleInPlatform(false)
    end
    if self.Root.ComTab.WBP_Com_Tab_ResourceBar then
      self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Play_HardBoss_Root_C:InitMenuOpenTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(false)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Play_HardBoss_Root_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:InitMenuOpenTab()
  elseif self.IsInSelectState then
    self:InitSelectTab()
  else
    self:InitNormalTab()
  end
end

function WBP_Play_HardBoss_Root_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      self:OnClickTrack()
    elseif InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      self:EnterSelectMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.IsInSelectState then
      IsEventHandled = true
      self:LeaveSelectMode()
    end
    if self.IsInSelectState then
      IsEventHandled = true
    else
    end
  end
  return IsEventHandled
end

function WBP_Play_HardBoss_Root_C:FocusOnFirstItem()
  if self.SelectedIndex then
    local CurSelectPermanent = self.List_Boss:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    self.List_Boss:BP_NavigateToItem(CurSelectPermanent)
  else
    self.List_Boss:SetFocus()
  end
end

function WBP_Play_HardBoss_Root_C:SwitchIn()
  self:InitNormalTab()
  if self.TitleWidget then
    self.TitleWidget:PlayAnimation(self.TitleWidget.In)
  end
end

function WBP_Play_HardBoss_Root_C:TrySelectFirstTime(Entry)
  if not self.SelectFirstTime then
    self.SelectFirstTime = true
    Entry:OnCellClickedWithoutSound()
    Entry:SetFocus()
  end
end

return WBP_Play_HardBoss_Root_C
