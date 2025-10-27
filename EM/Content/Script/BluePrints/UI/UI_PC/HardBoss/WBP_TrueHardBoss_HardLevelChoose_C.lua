require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_TrueHardBoss_HardLevelChoose_C = Class("BluePrints.UI.BP_UIState_C")
local SelectedIndex = {}

function WBP_TrueHardBoss_HardLevelChoose_C:Construct()
  self.Super.Construct(self)
  self.List_BossLevels.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self.List_BossLevels:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnUINavigation
  })
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_TrueHardBoss_HardLevelChoose_C:Destruct()
  print(_G.LogTag, "gyy HardLevelChoose Destruct")
  self.Super.Destruct(self)
end

function WBP_TrueHardBoss_HardLevelChoose_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.HardBossId = nil
  self.LastIsLocked = nil
  self.IsLocked = nil
  self.Flag = nil
  self.SelectFirstTimeFinish = false
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local ExtraInfo = (...)
  local HardBossId = ExtraInfo.HardBossId
  self.HardBossId = HardBossId
  self.Common_Button_Close_PC:BindEventOnClicked(self, self.OnClickClose)
  self.Common_Button_Close_PC.SoundFunc = self.CloseSound
  self.Common_Button_Text_PC.SoundFunc = self.ChallengeSound
  self:PlayInAnim()
end

function WBP_TrueHardBoss_HardLevelChoose_C:PlayInAnim()
  if self:IsAnimationPlaying(self.Out) then
    self:UnbindAllFromAnimationFinished(self.Out)
  end
  self:RefreshOtherInfo()
  self:InitRewardTimesInfo()
  self:InitListBossInfo()
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.In)
      self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:SetFocus()
      self:FocusOnFirstItem()
    end
  })
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:PlayAnimationForward(self.In)
end

function WBP_TrueHardBoss_HardLevelChoose_C:RefreshOtherInfo()
  self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Common_Button_Text_PC:BindEventOnClicked(self, self.OnClickChallenge)
  self.Common_Button_Text_PC:BindForbidStateExecuteEvent(self, self.OnClickChallengeForbid)
  self.Common_Button_Text_PC:SetText(GText("UI_HardBoss_Start"))
  self.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  self.Text_DetailTips:SetText(GText("UI_HardBoss_FirstTime"))
end

function WBP_TrueHardBoss_HardLevelChoose_C:InitRewardTimesInfo()
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

function WBP_TrueHardBoss_HardLevelChoose_C:InitListBossInfo()
  local BtnInfo = DataMgr.HardBossMain
  self.Text_BossName:SetText(GText(BtnInfo[self.HardBossId].HardBossName))
  local DifficultyIdTab = BtnInfo[self.HardBossId].DifficultyId
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  if SelectedIndex[self.HardBossId] then
    self.Flag = false
  else
    self.Flag = true
  end
  local Index = 1
  for i, DifficultyId in ipairs(DifficultyIdTab) do
    local LevelChooseObj = NewObject(UE4.LoadClass(ClassPath))
    LevelChooseObj.Id = DifficultyId
    LevelChooseObj.Index = Index
    LevelChooseObj.Parent = self
    LevelChooseObj.SelectedIndex = SelectedIndex
    LevelChooseObj.NumberOfChoices = #DifficultyIdTab
    Index = Index + 1
    self.List_BossLevels:AddItem(LevelChooseObj)
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:SelectFirstTime()
  if not self.SelectFirstTimeFinish then
    self.SelectFirstTimeFinish = true
    local CurSelectLevelContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
    CurSelectLevelContent.Entry:OnCellClickedWithoutSound()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:RefreshListBossInfo(Index)
  self:LeaveSelectMode()
  self:PlayAnimation(self.ClickRefresh)
  if SelectedIndex[self.HardBossId] ~= nil then
    local CurSelectBossContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
    local Entry = CurSelectBossContent.Entry
    CurSelectBossContent.IsSelect = false
    Entry:StopAllAnimations()
    Entry:PlayAnimation(Entry.Normal)
  end
  SelectedIndex[self.HardBossId] = Index
  local CurSelectLevelContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
  self.List_BossLevels:BP_NavigateToItem(CurSelectLevelContent)
  local AllDifficultyInfo = DataMgr.HardBossDifficulty
  local DifficultyInfo = AllDifficultyInfo[CurSelectLevelContent.Id]
  self.CurDifficultyId = DifficultyInfo.DifficultyID
  self.CurSelectDifficultyLevel = DifficultyInfo.DifficultyLevel
  self.CurUnlockCondition = DifficultyInfo.UnlockCondition
  self.LastIsLocked = self.IsLocked
  self.IsLocked = CurSelectLevelContent.IsLocked
  self.Text_BossLv:SetText(GText("BATTLE_UI_BLOOD_LV") .. self.CurSelectDifficultyLevel)
  self.Text_BossDetail:SetText(GText(DifficultyInfo.DifficultyDes))
  self.Text_LockTips:SetText(string.format(GText("UI_HardBoss_Unlocklevel"), self.CurSelectDifficultyLevel))
  local ImagePath = DifficultyInfo.ImgPath
  if nil ~= ImagePath then
    local ImageObject = LoadObject(ImagePath)
    local ImgMat = self.Image_LinShiImage:GetDynamicMaterial()
    ImgMat:SetTextureParameterValue("IconMap", ImageObject)
  end
  if self.IsLocked then
    self.Group_LockTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC.IsForbidden = true
    if self.LastIsLocked ~= self.IsLocked then
      self.Common_Button_Text_PC:PlayButtonForbidAnim()
    end
  else
    local Avatar = GWorld:GetAvatar()
    if Avatar and 0 == Avatar.HardBoss:GetPassCount(self.CurDifficultyId) then
      self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Group_DetailTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.Group_LockTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC.IsForbidden = false
    if self.LastIsLocked ~= self.IsLocked then
      self.Common_Button_Text_PC:PlayButtonUnForbidAnim()
    end
  end
  self:RefreshRewardsList(DifficultyInfo)
end

function WBP_TrueHardBoss_HardLevelChoose_C:RefreshRewardsList(DifficultyInfo)
  self.ListView_Rewards:ClearListItems()
  local RewardViewId = DifficultyInfo.DifficultyRewardView
  self.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local RewardInfo = DataMgr.RewardView[RewardViewId]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Quantity or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      local ItemId = Ids[i]
      Content.UIName = "HardBossLevelChoose"
      Content.IsShowDetails = true
      Content.Id = ItemId
      if RewardCount[i] then
        if #RewardCount[i] > 1 then
          Content.MaxCount = RewardCount[i][2]
        end
        Content.Count = RewardCount[i][1]
      end
      Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
      Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      Content.ItemType = TableName[i]
      self.ListView_Rewards:AddItem(Content)
    end
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:ChallengeSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnClickChallenge()
  local Avatar = GWorld:GetAvatar()
  local RemainTimes = Avatar.HardBoss.HardBossRewardTimesLeft or 0
  local IsNoMorePrompts = EMCache:Get("IsBossBattlePopupNoMorePrompts", true) or false
  if RemainTimes > 0 or IsNoMorePrompts or Avatar and 0 == Avatar.HardBoss:GetPassCount(self.CurDifficultyId) then
    self:BeginBossBattle()
  else
    self:ShowConfirmWindow()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnClickChallengeForbid()
  local Avatar = GWorld:GetAvatar()
  ConditionUtils.CheckCondition(Avatar, self.CurUnlockCondition, true)
end

function WBP_TrueHardBoss_HardLevelChoose_C:BeginBossBattle()
  local Avatar = GWorld:GetAvatar()
  if Avatar and not self.IsLocked then
    local function Callback(Ret)
      if ErrorCode:Check(Ret) then
        print(_G.LogTag, "gyy BeginBossBattle Succ")
        
        self:Close(false)
      else
        print(_G.LogTag, "gyy BeginBossBattle Fail")
        self:Close(true)
      end
    end
    
    print(_G.LogTag, "gyy BeginBossBattle")
    self:BlockAllUIInput(true)
    Avatar:EnterHardBoss(self.HardBossId, self.CurDifficultyId, Callback)
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:ShowConfirmWindow()
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction(_, Data)
    self:BeginBossBattle()
    self:UpdateSelectedInfo(Data)
  end
  
  function CommonDialogParams.LeftCallbackFunction(_, Data)
    self:UpdateSelectedInfo(Data)
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(Const.Popup_SecondConfirm, CommonDialogParams, self)
end

function WBP_TrueHardBoss_HardLevelChoose_C:UpdateSelectedInfo(Data)
  local IsSelected = Data.SelectHint.IsSelected
  EMCache:Set("IsBossBattlePopupNoMorePrompts", IsSelected, true)
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      if self.Common_Button_Text_PC.IsForbidden then
        self:OnClickChallengeForbid()
      else
        self:OnClickChallenge()
      end
    elseif InKeyName == UIConst.GamePadKey.RightThumb then
      IsEventHandled = true
      self:EnterSelectMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      else
        IsEventHandled = true
        self:OnReturnKeyDown()
      end
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnReturnKeyDown()
  self:Close(true, true)
end

function WBP_TrueHardBoss_HardLevelChoose_C:CloseSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnClickClose()
  self:Close(true)
end

function WBP_TrueHardBoss_HardLevelChoose_C:Close(Flag, IsEsc)
  print(_G.LogTag, "gyy HardLevelChoose Close, PlayOutAnimation:", Flag)
  if Flag and self:IsPlayingAnimation() then
    print(_G.LogTag, "gyy HardLevelChoose CloseFail IsPlayingAnimation")
    return
  end
  if IsEsc then
    AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "HardBossLevelChoose", nil)
  end
  self:BlockAllUIInput(true)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = PlayerController:GetMyPawn()
  local Eid = Player.MechanismEid
  local Mechanism = Battle(self):GetEntity(Eid)
  if Mechanism then
    print(_G.LogTag, "LXZ Close", Flag)
    Mechanism:EndInteractive(Player, true)
  end
  if Flag then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.CloseDirectly
    })
    self:PlayAnimationForward(self.Out)
  else
    self:CloseDirectly()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:CloseDirectly()
  print(_G.LogTag, "gyy HardLevelChoose RealClose")
  self.List_BossLevels:ClearListItems()
  self.Super.Close(self)
end

function WBP_TrueHardBoss_HardLevelChoose_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_TrueHardBoss_HardLevelChoose_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:InitGamepadView()
  self.Common_Button_Text_PC:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key_BossRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:SetFocus()
end

function WBP_TrueHardBoss_HardLevelChoose_C:InitKeyboardView()
  self:LeaveSelectMode()
  self.Common_Button_Text_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_BossRewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_TrueHardBoss_HardLevelChoose_C:InitWidgetInfoInGamePad()
  self.Key_BossRewards:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    }
  })
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:ClickListItemWhenSelectItemChanged(Content)
  if Content.Entry then
    local Ans = Content.Entry:OnCellClicked()
    if not Ans then
      self:FocusOnFirstItem()
    end
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:BP_GetDesiredFocusTarget()
  if self.HardBossId and SelectedIndex[self.HardBossId] then
    local CurSelectLevelContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
    return CurSelectLevelContent.Entry
  else
    return self.List_BossLevels
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  self.Key_BossRewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self:SetectFirstItem(self.ListView_Rewards)
  self.IsInSelectState = true
end

function WBP_TrueHardBoss_HardLevelChoose_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  self.Key_BossRewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Common_Button_Text_PC:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:FocusOnFirstItem()
  self.IsInSelectState = false
end

function WBP_TrueHardBoss_HardLevelChoose_C:SetectFirstItem(List)
  if List then
    if List:GetNumItems() > 0 then
      List:NavigateToIndex(0)
    else
      List:SetFocus()
    end
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:FocusOnFirstItem()
  if self.HardBossId and SelectedIndex[self.HardBossId] then
    local CurSelectLevelContent = self.List_BossLevels:GetItemAt(math.max(SelectedIndex[self.HardBossId] - 1, 0))
    self.List_BossLevels:BP_NavigateToItem(CurSelectLevelContent)
    self:AddTimer(0.01, function()
      self.List_BossLevels:BP_NavigateToItem(CurSelectLevelContent)
    end, false, 0, "NavigateToItem")
  else
    self.List_BossLevels:SetFocus()
  end
end

function WBP_TrueHardBoss_HardLevelChoose_C:OnUINavigation(NavigationDirection)
  self:EnterSelectMode()
  return nil
end

return WBP_TrueHardBoss_HardLevelChoose_C
