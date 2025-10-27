local TimeUtils = require("Utils.TimeUtils")
local ContractModel = require("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_Model")
local EMCache = require("EMCache.EMCache")
local WBP_Rouge_DifficultySelection_P_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Rouge_DifficultySelection_P_C:Construct()
  self:Init()
  self.RoomIndex = nil
  self.Score = nil
  self.IsInSelectState = false
  self:AddDispatcher(EventID.CurrentSquadChange, self, self.OnCurrentSquadChange)
end

function WBP_Rouge_DifficultySelection_P_C:Destruct()
  self:ClearListenEvent()
  EventManager:RemoveEvent(EventID.OnRougeLikeInfoUpdate, self)
end

function WBP_Rouge_DifficultySelection_P_C:InitParent(Parent)
  self.Parent = Parent
end

function WBP_Rouge_DifficultySelection_P_C:Init()
  ContractModel:InitModel(GWorld:GetAvatar())
  self.Btn_Enter.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Enter.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Out.Button_Area.OnClicked:Add(self, self.EarlySettlement)
  self.Btn_Out.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Start.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Heat.OnClicked:Add(self, self.OpenContractPanel)
  self.Btn_Heat.OnHovered:Add(self, self.OnBtnHeatHovered)
  self.Text_Start:SetText(GText("System_Name_Rouge_Enter_2"))
  self.Text_Clear:SetText(GText("Rouge_CompeleScore"))
  self.Text_Reward:SetText(GText("Rouge_FirstTimeReward"))
  self.Text_HeatName:SetText(GText("UI_Rougelike_Contract_Name"))
  self.Text_Lock:SetText(GText("UI_RL_DifficultyLocked"))
  self.Text_Progress:SetText(GText("UI_RL_CurrentProgress"))
  self.Text_Points:SetText(GText("UI_Rougelike_Contract_ScoreBonus"))
  self.Btn_Out.Text_Button:SetText(GText("UI_RL_BtnFinish"))
  self.Title_Level:SetText(GText("UI_RL_SecondTitle"))
  self.Text_Tip:SetText(GText("UI_Rougelike_MODTip"))
  self.Btn_Enter.Img_Slot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Out.Img_Slot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
  if not self.Weekly_Points then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
    if StyleOfPlay.Rouge_Points then
      self.Weekly_Points = StyleOfPlay.Rouge_Points
    end
  end
  if self.Weekly_Points then
    self.Weekly_Points.Text_Points:SetText(GText("UI_RL_WeeklyScore"))
    EventManager:AddEvent(EventID.OnRougeLikeInfoUpdate, self, self.UpdateRougeLikeScore)
    self:UpdateRougeLikeScore()
  end
  self:UpdateRougeLikeInfoAbstract()
end

function WBP_Rouge_DifficultySelection_P_C:InitWidgetInfoInGamePad()
  if self.Icon_Key_Reward then
    self.Icon_Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  if self.Icon_Key_Heat then
    self.Icon_Key_Heat:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
  if self.Btn_Enter.Img_GamePad then
    self.Btn_Enter.Img_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  end
  if self.Btn_Out.Img_GamePad then
    self.Btn_Out.Img_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      }
    })
  end
  if self.Key_Controller_Start then
    self.Key_Controller_Start:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  end
end

function WBP_Rouge_DifficultySelection_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_DifficultySelection_P_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_DifficultySelection_P_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if not self.DefaultList.Preview.IsExpand then
      if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
        IsEventHandled = true
        self:OnBtnClicked()
      elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
        IsEventHandled = true
        self:OpenContractPanelByGamePad()
      elseif InKeyName == UIConst.GamePadKey.LeftThumb then
        IsEventHandled = true
        self:EnterSelectMode()
      elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
        IsEventHandled = true
        self:EarlySettlement()
      elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
      IsEventHandled = true
      self.DefaultList:OnCloseSquadGamepad()
      self:UpdateTabDifficultySelection()
      self:FocusOnFirstItem()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnClickEsc()
  end
  return IsEventHandled
end

function WBP_Rouge_DifficultySelection_P_C:OnClickEsc()
  if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
    self.DefaultList:OnCloseSquadGamepad()
    self:UpdateTabDifficultySelection()
  else
    self.Parent:BackToRougeMain()
  end
end

function WBP_Rouge_DifficultySelection_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_DifficultySelection_P_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_DifficultySelection_P_C:InitGamepadView()
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_Heat then
    self.Controller_Heat:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Btn_Enter.Img_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Enter.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Out.Img_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Out.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if UIUtils.HasAnyFocus(self) then
    self:SetFocusWhenSwitch()
  end
end

function WBP_Rouge_DifficultySelection_P_C:SetFocusWhenSwitch()
  if self.DefaultList.Preview.IsExpand then
    self.DefaultList.List_Default:NavigateToIndex(0)
  else
    self:FocusOnFirstItem()
  end
end

function WBP_Rouge_DifficultySelection_P_C:InitKeyboardView()
  self:LeaveSelectMode()
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Heat then
    self.Controller_Heat:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Btn_Enter.Img_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Enter.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Out.Img_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Out.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Rouge_DifficultySelection_P_C:FocusOnFirstItem()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.SelectCell)
  end
end

function WBP_Rouge_DifficultySelection_P_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  self:UpdateUIStyleInPlatform(true)
  self:InitSelectTab()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.List_Prop)
  end
  self.IsInSelectState = true
end

function WBP_Rouge_DifficultySelection_P_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  self:UpdateUIStyleInPlatform(false)
  self:InitNormalTab()
  self:FocusOnFirstItem()
  self.IsInSelectState = false
end

function WBP_Rouge_DifficultySelection_P_C:OnUINavigation(NavigationDirection)
  local Index
  if self.SelectCell then
    Index = self.ScrollBox_List:GetChildIndex(self.SelectCell)
  end
  if Index then
    if NavigationDirection == EUINavigation.Up then
      return self:OnNavigationToIndex(Index - 1)
    elseif NavigationDirection == EUINavigation.Down then
      return self:OnNavigationToIndex(Index + 1)
    end
  end
  return nil
end

function WBP_Rouge_DifficultySelection_P_C:OnNavigationToIndex(Index)
  local Item = self.ScrollBox_List:GetChildAt(Index)
  if Item then
    local Ans = Item:OnSubCellClicked()
    if Ans then
      return Item
    else
      return self.SelectCell
    end
  end
  return nil
end

function WBP_Rouge_DifficultySelection_P_C:UpdateRougeLikeScore()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RougeLikeRewardId = Avatar.RougeLike.WeeklyRewardId
    local RewardInfo = DataMgr.RougeLikeReward[RougeLikeRewardId]
    if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
      self.CurWeeklyMaxScore = Avatar.RougeLike.WeeklyTotalScore
      local MaxScore = #RewardInfo.Reward * RewardInfo.EachGradePoints
      if MaxScore < self.CurWeeklyMaxScore then
        self.CurWeeklyMaxScore = MaxScore
      end
      self.Weekly_Points.Text_Has:SetText(self.CurWeeklyMaxScore)
      self.Weekly_Points.Text_Total:SetText(MaxScore)
    end
  end
end

function WBP_Rouge_DifficultySelection_P_C:UpdateRougeLikeInfoAbstract()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Abstract)
      self.RoomIndex = Abstract.RoomIndex
      
      self.Score = Abstract.Score
      self.Panel_Progress:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Text_Now:SetText(self.RoomIndex)
    end
    
    Avatar:GetProgressingRougeLikeAbstract(Callback)
  end
end

function WBP_Rouge_DifficultySelection_P_C:OnClickedLevelCell(LevelCell)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsRougeLikeInProgress() and Avatar.RougeLike.ProgressingDifficultyId ~= LevelCell.DifficultyId then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("UI_RL_InRouge"))
    return false
  else
    if self.SelectCell ~= nil then
      self.SelectCell:UnSelected()
      self:PlayAnimation(self.Switch)
    end
    self.SelectCell = LevelCell
    self.SelectCell:Selected()
    self.CurCellDifficultyId = LevelCell.DifficultyId
    self:RefreshDifficultyInfo(LevelCell.DifficultyId)
    return true
  end
end

function WBP_Rouge_DifficultySelection_P_C:SetInfo()
  self.CurCellDifficultyId = nil
  self.SelectCell = nil
  self.SeasonId = nil
  self:RefreshHeatValue()
  self.ScrollBox_List:ClearChildren()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.SeasonId = Avatar.RougeLike.ProgressingSeasonId
  end
  local AllDiffculty = DataMgr.RougeLikeSeason[self.SeasonId].DifficultyId
  if AllDiffculty then
    self.HighestDiffcultyId = AllDiffculty[#AllDiffculty]
  end
  local RougeLikeDifficulty = DataMgr.RougeLikeDifficulty
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local SelectedIndex, SelectedDifficultyId
  local UnlockTable = {}
  if Avatar then
    for i = 1, #AllDiffculty do
      local UnlockCondition = RougeLikeDifficulty[AllDiffculty[i]].UnlockCondition
      local Unlock = false
      if UnlockCondition then
        Unlock = Avatar:CheckCondition(UnlockCondition)
      else
        Unlock = true
      end
      UnlockTable[AllDiffculty[i]] = Unlock
      if SelectedIndex then
        if UnlockTable[AllDiffculty[i]] and RougeLikeDifficulty[AllDiffculty[i]].UnlockLevel >= RougeLikeDifficulty[AllDiffculty[SelectedIndex]].UnlockLevel then
          SelectedIndex = i
        end
      elseif UnlockTable[AllDiffculty[i]] then
        SelectedIndex = i
      end
    end
    if Avatar:IsRougeLikeInProgress() then
      Avatar:GetProgressingRougeLikeAbstract()
      SelectedDifficultyId = Avatar.RougeLike.ProgressingDifficultyId
    else
      SelectedIndex = SelectedIndex or 1
    end
    if SelectedDifficultyId then
      SelectedIndex = nil
    end
  end
  for i = 1, #AllDiffculty do
    local Obj = UIManager:_CreateWidgetNew("RougeDifficultyListItem")
    self.ScrollBox_List:AddChild(Obj)
    Obj:BindEventOnClicked(self, self.OnClickedLevelCell, Obj)
    Obj:ItemSetNavigationRuleCustom(self, self.OnUINavigation)
    Obj:InitInfo(AllDiffculty[i], i, UnlockTable[AllDiffculty[i]])
    if SelectedDifficultyId == AllDiffculty[i] or SelectedIndex == i then
      self:OnClickedLevelCell(Obj)
    end
  end
  self:RefreshSquad()
end

function WBP_Rouge_DifficultySelection_P_C:RefreshDifficultyInfo(DifficultyId)
  local RougeLikeDifficulty = DataMgr.RougeLikeDifficulty
  self.Text_Point:SetText(RougeLikeDifficulty[DifficultyId].CompleteScore)
  self.Text_Total:SetText(RougeLikeDifficulty[DifficultyId].RoomTotal)
  if self.SelectCell.Unlock then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:IsRougeLikeInProgress() then
      self.Switch_Btn:SetActiveWidgetIndex(0)
      self.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if self.RoomIndex then
        self.Panel_Progress:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
        self.Text_Now:SetText(self.RoomIndex)
      else
        self.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Out:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Btn_Enter.Text_Button:SetText(GText("UI_RL_BtnContinue"))
    else
      self.Switch_Btn:SetActiveWidgetIndex(2)
      if DifficultyId == self.HighestDiffcultyId then
        self.Heat_Button:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      self.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Text_Tip:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.Switch_Btn:SetActiveWidgetIndex(1)
    self.Text_Lock:SetText(string.format(GText("UI_RL_UnlockLevel"), RougeLikeDifficulty[DifficultyId].UnlockLevel))
    self.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:RefreshRewardsList(DifficultyId)
end

function WBP_Rouge_DifficultySelection_P_C:RefreshRewardsList(DifficultyId)
  local Avatar = GWorld:GetAvatar()
  local IsGot = false
  if Avatar and Avatar.RougeLike.PassCount and Avatar.RougeLike.PassCount[DifficultyId] and Avatar.RougeLike.PassCount[DifficultyId] >= 1 then
    IsGot = true
  end
  local RougeLikeDifficulty = DataMgr.RougeLikeDifficulty
  local Rewards = {
    RougeLikeDifficulty[DifficultyId].FirstTimeReward
  }
  self.List_Prop:ClearListItems()
  self.List_Prop:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  for _, RewardId in pairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        local ItemId = Ids[i]
        Content.UIName = "RougeDifficultySelection"
        Content.IsShowDetails = true
        Content.bIsResetFocus = true
        Content.Id = ItemId
        Content.Count = RewardUtils:GetCount(RewardCount[i])
        Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        Content.Parent = self
        Content.bHasGot = IsGot
        Content.OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.OnMenuOpenChanged
        }
        self.List_Prop:AddItem(Content)
      end
    end
  end
end

function WBP_Rouge_DifficultySelection_P_C:OnBtnClicked()
  if self.IsInSelectState then
    return
  end
  if not self.SelectCell.Unlock then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret)
      self:BlockAllUIInput(false)
      
      if ErrorCode:Check(Ret) then
        local ExitDungeonInfo = {Type = "Rouge"}
        GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
      end
    end
    
    if not self:CheckSeasonTimeValid(self.SeasonId) then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Rou_Toast_27005"))
      return
    end
    local RougeLikeDifficulty = DataMgr.RougeLikeDifficulty
    if RougeLikeDifficulty[self.CurCellDifficultyId] and self.SelectCell and self.SelectCell.Unlock then
      self:BlockAllUIInput(true)
      Avatar:EnterRougeLike(Callback, self.CurCellDifficultyId, self.SquadId)
    else
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Rou_Toast_27027"))
    end
  end
end

function WBP_Rouge_DifficultySelection_P_C:OnBtnHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/confirm_btn_hover", nil, nil)
end

function WBP_Rouge_DifficultySelection_P_C:EarlySettlement()
  if not self.Score then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  local TalentPoints = math.floor(self.Score / DataMgr.RougeLikeSeason[self.SeasonId].TalentPointsTransform)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local PopUpId = 100144
  local TipText = string.format(GText(DataMgr.CommonPopupUIContext[PopUpId].Tip[1]), self.Score, TalentPoints)
  UIManager:ShowCommonPopupUI(100144, {
    Tips = {TipText},
    RightCallbackFunction = function()
      self:BlockAllUIInput(true)
      local Avatar = GWorld:GetAvatar()
      Avatar:InterruptRougeLike()
      EventManager:AddEvent(EventID.OnRougeLikeInfoUpdate, self, function()
        self:BlockAllUIInput(false)
        self.Score = nil
        self:RefreshListItemAndSelectedInfo()
        EventManager:RemoveEvent(EventID.OnRougeLikeInfoUpdate, self)
      end)
    end
  }, self)
end

function WBP_Rouge_DifficultySelection_P_C:CheckSeasonTimeValid(SeasonId)
  if not SeasonId then
    return false
  end
  if not DataMgr.RougeLikeSeason[SeasonId] then
    return false
  end
  local SeasonInfo = DataMgr.RougeLikeSeason[SeasonId]
  local NowTime = TimeUtils.NowTime()
  return NowTime >= SeasonInfo.SeasonStartTime and NowTime <= SeasonInfo.SeasonEndTime
end

function WBP_Rouge_DifficultySelection_P_C:OpenContractPanelByGamePad()
  if self.IsInSelectState then
    return
  end
  if self.Heat_Button:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    return
  end
  self:OpenContractPanel()
end

function WBP_Rouge_DifficultySelection_P_C:OpenContractPanel()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:LoadUINew("RougeLikeContractPanel", self)
end

function WBP_Rouge_DifficultySelection_P_C:OnBtnHeatHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
end

function WBP_Rouge_DifficultySelection_P_C:RefreshHeatValue()
  local HeatPoints = ContractModel:GetCurrentHeatValue()
  self.Text_HeatPoints:SetText(ContractModel:GetCurrentHeatValue())
  local Bouns = ContractModel:GetCurrentContractPointRate()
  Bouns = math.floor(Bouns * 100)
  self.Text_Bouns:SetText(Bouns)
  if 0 == HeatPoints then
    self:HideHeatPointBouns(true)
  else
    self:HideHeatPointBouns(false)
  end
end

function WBP_Rouge_DifficultySelection_P_C:HideHeatPointBouns(IsHide)
  local Visibility = UIConst.VisibilityOp.Visible
  if IsHide then
    Visibility = UIConst.VisibilityOp.Collapsed
  end
  self.Text_01:SetVisibility(Visibility)
  self.Text_Points:SetVisibility(Visibility)
  self.Text_Plus:SetVisibility(Visibility)
  self.Text_Bouns:SetVisibility(Visibility)
  self.Text_Percent:SetVisibility(Visibility)
  self.Text_02:SetVisibility(Visibility)
end

function WBP_Rouge_DifficultySelection_P_C:RefreshListItemAndSelectedInfo()
  local AllChildren = self.ScrollBox_List:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local SubItem = AllChildren:GetRef(i)
    SubItem:RefreshState()
  end
  self:RefreshDifficultyInfo(self.SelectCell.DifficultyId)
end

function WBP_Rouge_DifficultySelection_P_C:SetVisibility(Visibility)
  self.Overridden.SetVisibility(self, Visibility)
  if self.Weekly_Points then
    self.Weekly_Points:SetVisibility(Visibility)
  end
end

function WBP_Rouge_DifficultySelection_P_C:HideWeeklyPoints()
  if self.Weekly_Points then
    self.Weekly_Points:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_DifficultySelection_P_C:HideSquad()
  if self.DefaultList then
    self.DefaultList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_DifficultySelection_P_C:RefreshSquad()
  self.DefaultList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Avatar = GWorld:GetAvatar()
  self.SquadId = 0
  if Avatar then
    local RougeSquadId = Avatar.DungeonSquad.Rouge
    if RougeSquadId and RougeSquadId > 0 then
      self.SquadId = RougeSquadId
    end
  end
  self.DefaultList:Init(self, true, self.SquadId)
end

function WBP_Rouge_DifficultySelection_P_C:OnCurrentSquadChange(SquadId, IsComMissing)
  self.SquadId = SquadId
end

function WBP_Rouge_DifficultySelection_P_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and not self.DefaultList.Preview.IsExpand then
    if "Gamepad_DPad_Up" == InKeyName then
      IsEventHandled = true
      if self.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return
      end
      if self.IsInSelectState then
        self:LeaveSelectMode()
      end
      self.DefaultList:OnOpenSquadGamepad()
    elseif "Gamepad_DPad_Down" == InKeyName then
      IsEventHandled = true
    end
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Rouge_DifficultySelection_P_C:UpdateTabDifficultySelection()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnClickEsc,
          Owner = self
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  self.Parent.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Rouge_DifficultySelection_P_C:InitSelectTab()
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
          ClickCallback = self.OnClickEsc,
          Owner = self
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  self.Parent.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Rouge_DifficultySelection_P_C:InitNormalTab()
  self:UpdateTabDifficultySelection()
end

function WBP_Rouge_DifficultySelection_P_C:InitMenuOpenTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Text", Text = "Esc"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  self.Parent.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Rouge_DifficultySelection_P_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:InitMenuOpenTab()
  elseif self.IsInSelectState then
    self:InitSelectTab()
  else
    self:InitNormalTab()
  end
end

function WBP_Rouge_DifficultySelection_P_C:BP_GetDesiredFocusTarget()
  self:FocusOnFirstItem()
end

return WBP_Rouge_DifficultySelection_P_C
