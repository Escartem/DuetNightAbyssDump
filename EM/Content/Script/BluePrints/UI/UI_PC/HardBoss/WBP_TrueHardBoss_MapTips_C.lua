require("UnLua")
local WBP_TrueHardBoss_MapTips_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_TrueHardBoss_MapTips_PC_C:Construct()
  self.Super.Construct(self)
  self.Common_Button_Text_PC:BindEventOnClicked(self, self.CloseStyleOfPlay)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_TrueHardBoss_MapTips_PC_C:Destruct()
  self.Super.Destruct(self)
end

function WBP_TrueHardBoss_MapTips_PC_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_TrueHardBoss_MapTips_PC_C:OnLoaded()
  self.Super.OnLoaded(self)
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshMapTips(UIIndex, RegionID, BornID)
  if self:IsAnimationPlaying(self.Out) then
    self:UnbindAllFromAnimationFinished(self.Out)
  end
  self.UIIndex = UIIndex
  self:RefreshOtherInfo()
  self:RefreshText()
  self:RefreshRewardTimesInfo()
  self:RefreshRewardsList()
  self:PlayAnimationForward(self.In)
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshOtherInfo()
  self.Common_Button_Text_PC:SetText(GText("UI_HardBoss_Toward"))
  self.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  self.Text_DetailTips:SetText(GText("UI_HardBoss_FirstTime"))
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshText()
  local HardBossListData = DataMgr.HardBossMain
  self.Text_BossName:SetText(GText(HardBossListData[self.UIIndex].HardBossName))
  self.Text_BossDetail:SetText(GText(HardBossListData[self.UIIndex].HardBossDes))
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshRewardTimesInfo()
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
  self.Text_RewardTips:SetText(Text)
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshRewardsList()
  self.ListView_Rewards:ClearListItems()
  local BossInfo = DataMgr.HardBossMain[self.UIIndex]
  local HardBossDifficulty = DataMgr.HardBossDifficulty
  local HaveFreeChance = false
  local HighestDifficultyId = BossInfo.DifficultyId[1]
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for DifficultyIndex = #BossInfo.DifficultyId, 1, -1 do
      local DifficultyId = BossInfo.DifficultyId[DifficultyIndex]
      if Avatar:CheckHardBossCondition(DifficultyId) then
        if not HaveFreeChance and 0 == Avatar.HardBoss:GetPassCount(DifficultyId) then
          HaveFreeChance = true
        end
        if HighestDifficultyId == BossInfo.DifficultyId[1] then
          HighestDifficultyId = DifficultyId
        end
      end
    end
  end
  if HaveFreeChance then
    self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local ImagePath = HardBossDifficulty[HighestDifficultyId].ImgPath
  if nil ~= ImagePath then
    local ImageObject = LoadObject(ImagePath)
    local ImgMat = self.Image_LinShiImage:GetDynamicMaterial()
    ImgMat:SetTextureParameterValue("IconMap", ImageObject)
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

function WBP_TrueHardBoss_MapTips_PC_C:PlayOutAnimFinished()
  self:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_TrueHardBoss_MapTips_PC_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_TrueHardBoss_MapTips_PC_C:Close()
  self.Super.Close(self)
end

function WBP_TrueHardBoss_MapTips_PC_C:CloseStyleOfPlay()
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if StyleOfPlay then
    StyleOfPlay:PlayOutAnim()
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      self.Common_Button_Text_PC:OnBtnClicked()
    elseif InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      self:EnterSelectMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      else
        IsEventHandled = true
        self.Parent:ClosePanel()
      end
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self.Parent:ClosePanel()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_TrueHardBoss_MapTips_PC_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:InitGamepadView()
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key_TitleRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:SetFocus()
end

function WBP_TrueHardBoss_MapTips_PC_C:InitKeyboardView()
  self:LeaveSelectMode()
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_TitleRewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_TrueHardBoss_MapTips_PC_C:InitWidgetInfoInGamePad()
  self.Key_TitleRewards:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function WBP_TrueHardBoss_MapTips_PC_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:ClickListItemWhenSelectItemChanged(Content)
  if Content.Entry then
    Content.Entry:OnCellClicked()
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:BP_GetDesiredFocusTarget()
  if self.HardBossId and SelectedIndex[self.HardBossId] then
    local CurSelectLevelContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
    return CurSelectLevelContent.Entry
  else
    return self.List_BossLevels
  end
end

function WBP_TrueHardBoss_MapTips_PC_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  self.Key_TitleRewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self:SetectFirstItem(self.ListView_Rewards)
  self.IsInSelectState = true
end

function WBP_TrueHardBoss_MapTips_PC_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  self.Key_TitleRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:SetFocus()
  self.IsInSelectState = false
end

function WBP_TrueHardBoss_MapTips_PC_C:SetectFirstItem(List)
  if List then
    if List:GetNumItems() > 0 then
      List:NavigateToIndex(0)
    else
      List:SetFocus()
    end
  end
end

return WBP_TrueHardBoss_MapTips_PC_C
