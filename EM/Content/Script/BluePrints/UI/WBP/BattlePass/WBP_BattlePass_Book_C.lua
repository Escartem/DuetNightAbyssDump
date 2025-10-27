local TimeUtils = require("Utils.TimeUtils")
local BattlePassUtils = require("BluePrints.UI.WBP.BattlePass.BattlePassUtils")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
local FSMStates = {
  Default = 0,
  FocusItemCantGet = 1,
  FocusItemCanGet = 2
}
local BATTLE_PASS_LEVEL_PURCHASE_POPUP = 100183
local BATTLE_PASS_LACK_COIN1_POPUP = 100136
local BATTLE_PASS_ALL_LACK_COIN_POPUP = 100137
local WBP_BattlePass_Book_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_BattlePass_Book_C:Construct()
  self.Overridden.Construct(self)
  self.Avatar = GWorld:GetAvatar()
  self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_GetAll:SetGamePadImg("Y")
  self.Btn_GetAll:SetGamePadIconVisible(true)
  self.Btn_GetAll:SetText(GText("UI_BattlePass_ClaimAll"))
  self.Btn_GetAll:BindEventOnClicked(self, self.GetAllReward)
  self.Btn_Unlock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_BuyLv:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.BattlePassId = self.Avatar.BattlePassVersion
  self.BattlePassInfo = DataMgr.BattlePassMain[self.BattlePassId]
  self.Reward_Sp.Content = nil
  self.Reward_Sp:SetSp()
  self.List_Reward.BP_OnEntryGenerated:Add(self, self.OnEntryGenerated)
  self.List_Reward.BP_OnEntryReleased:Add(self, self.OnEntryReleased)
  self.Text_Title:SetText(GText(self.BattlePassInfo.BattlePassTitle))
  self.RewardTab_Normal:Init(self)
  self.RewardTab_Sp:Init(self, self.OpenPurchase)
  self.Key_Swtich_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitPetIconInfo()
  self:InitLevelInfo()
  self:InitTime()
  self:InitBtn()
  self:InitMissionInfo()
  self.Type2Index = {
    Daily = 1,
    Weekly = 2,
    Version = 3
  }
  self.Index2Type = {
    [1] = "Daily",
    [2] = "Weekly",
    [3] = "Version"
  }
  self.List_Mission.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.IsEmpty = true
    Content.Parent = self
    return Content
  end)
  self:InitWhenSwitch()
  self.CurSelectedTab = nil
  self.CurSelectedTabIndex = nil
  self.PlayLevelUp = false
  self.PlayUnlock = false
  self.NeedShowAutoGetPopupUI = false
  self.ShowingPopupUI = false
  self.HaveGetAllTip = nil
  self.SumTime = 1
  self.Speed = 1 / self.SumTime
  self:BindToAnimationFinished(self.ProgressPrompt, {
    self,
    function()
      self:SetLevelBar(0, 1)
      self.TargetPercent = self.CurExp / self.BattlePassInfo.LevelExp
      self:AddLevelBarTimer()
    end
  })
  EventManager:AddEvent(EventID.BattlePassTaskProgressChange, self, self.OnBattlePassTaskProgressChange)
  EventManager:AddEvent(EventID.BattlePassLevelChange, self, self.OnBattlePassLevelChange)
  EventManager:AddEvent(EventID.BattlePassRank2Unlock, self, self.OnBattlePassRank2Unlock)
  EventManager:AddEvent(EventID.BattlePassPetCanClaim, self, self.OnBattlePassPetCanClaim)
  EventManager:AddEvent(EventID.BattlePassAutoGetTaskReward, self, self.OnBattlePassAutoGetTaskReward)
  ReddotManager.AddListener("BattlePassMission", self, self.OnBattlePassMissionReddotChange)
  self.List_Mission:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnUINavigation
  })
  self.Key_L_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    }
  })
  self.Key_R_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    }
  })
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_BattlePass_Book_C:Destruct()
  self:InitWhenSwitch()
  self.CurSelectedTab = nil
  self.CurSelectedTabIndex = nil
  self.PetIconList:Clear()
  self.List_Reward:ClearListItems()
  self:ClearBindEventAndTimer()
  EventManager:RemoveEvent(EventID.BattlePassTaskProgressChange, self)
  EventManager:RemoveEvent(EventID.BattlePassLevelChange, self)
  EventManager:RemoveEvent(EventID.BattlePassRank2Unlock, self)
  EventManager:RemoveEvent(EventID.BattlePassPetCanClaim, self)
  EventManager:RemoveEvent(EventID.BattlePassAutoGetTaskReward, self)
  ReddotManager.RemoveListener("BattlePassReward", self)
  ReddotManager.RemoveListener("BattlePassMission", self)
  self:ClearListenEvent()
  self.Overridden.Construct(self)
end

function WBP_BattlePass_Book_C:Init(Parent)
  self.Parent = Parent
  self.Btn_Check:BindEventOnClicked(self, self.JumpToDetail)
  self:InitBottomKeyInfo()
end

function WBP_BattlePass_Book_C:JumpToDetail()
  if self.Parent then
    self.Parent:JumpToDetail()
  end
end

function WBP_BattlePass_Book_C:InitSkinOrAccessoryInfo(Type, Id)
  local Name, Rarity
  if "Skin" == Type then
    Name = GText(DataMgr.Skin[Id].SkinName)
    Rarity = DataMgr.Skin[Id].Rarity
  elseif "Accessory" == Type then
    Name = GText(DataMgr.CharAccessory[Id].Name)
    Rarity = DataMgr.CharAccessory[Id].Rarity
  end
  if Name then
    self.Text_ShowTitle:SetText(Name)
  end
  if Rarity then
    self:UpdateShowTitleFontByRarity(Rarity)
    self.Tag_Quality:Init(Rarity)
  end
end

function WBP_BattlePass_Book_C:UpdateShowTitleFontByRarity(Rarity)
  local ShowTitleFontMap = {
    [6] = self.Font_Red,
    [5] = self.Font_Gold,
    [4] = self.Font_Purple,
    [3] = self.Font_Blue
  }
  local FontToSet = ShowTitleFontMap[Rarity]
  if FontToSet then
    self.Text_ShowTitle:SetFont(FontToSet)
  end
end

function WBP_BattlePass_Book_C:InitPetIconInfo()
  if not ShopUtils:IsCanOpenPay(false) then
    self.Text_Desc:SetText(GText("UI_BattlePass_Oversea_PurchaseLocked"))
  else
    self.Text_Desc:SetText(GText("UI_BattlePass_PetClaimDetail"))
  end
  self.PetList = DataMgr.BattlePassMain[self.BattlePassId].PetId
  self.PetIconList:Clear()
  self.PetIconLengt = 0
  for Index, PetId in ipairs(self.PetList) do
    local PetIconPath = DataMgr.Pet[PetId].Icon
    if PetIconPath then
      local PetIcon = LoadObject(PetIconPath)
      self.PetIconList:Add(PetIcon)
    end
  end
  self.PetIconLengt = self.PetIconList:Length()
end

function WBP_BattlePass_Book_C:InitLevelInfo()
  self.Text_Exp:SetText(GText("UI_BattlePass_BPExp"))
  self.Text_WeekExp:SetText(GText("UI_BattlePass_BPWeeklyMaxExp"))
  self:RefreshLevelInfo()
  self:RefreshLevelBar()
end

function WBP_BattlePass_Book_C:RefreshLevelInfo()
  self.LastLevel = self.CurLevel
  self.CurLevel = self.Avatar.BattlePassLevel
  self.LastExp = self.CurExp
  self.CurExp = self.Avatar.BattlePassExp
  self.BattlePass_Level.Text_Level:SetText(self.CurLevel)
  self.Num_Exp_Now:SetText(self.Avatar.BattlePassExp)
  self.Num_Exp_Total:SetText(self.BattlePassInfo.LevelExp)
  self.Num_WeekExp_Now:SetText(self.Avatar.BattlePassWeeklyExp)
  self.Num_WeekExp_Total:SetText(self.BattlePassInfo.WeeklyMaxExp)
end

function WBP_BattlePass_Book_C:RefreshLevelBar()
  if self.PlayLevelUp then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattlePassLevelUp = UIManager:GetUIObj("BattlePassLevelUp")
  if BattlePassLevelUp then
    return
  end
  if not self.LastLevel and not self.LastExp then
    self:SetLevelBar(self.Avatar.BattlePassExp, self.BattlePassInfo.LevelExp)
  elseif self.CurLevel < self.LastLevel then
    self:SetLevelBar(self.Avatar.BattlePassExp, self.BattlePassInfo.LevelExp)
  elseif self.CurLevel == self.LastLevel then
    if self.CurExp <= self.LastExp then
      self:SetLevelBar(self.Avatar.BattlePassExp, self.BattlePassInfo.LevelExp)
    else
      self.TargetPercent = self.CurExp / self.BattlePassInfo.LevelExp
      self:AddLevelBarTimer()
    end
  else
    self:SetLevelBar(self.BattlePassInfo.LevelExp, self.BattlePassInfo.LevelExp)
  end
end

function WBP_BattlePass_Book_C:SetLevelBar(CurrentExp, MaxExp)
  self:RemoveLevelBarTimer()
  self.Exp_Bar:SetPercent(CurrentExp / MaxExp)
end

function WBP_BattlePass_Book_C:SetLevelBarLerp(DeltaTime)
  if self.TargetPercent then
    local CurPercent = self.Exp_Bar.Percent
    local Percent = CurPercent + DeltaTime * self.Speed
    if Percent >= self.TargetPercent then
      self.Exp_Bar:SetPercent(self.TargetPercent)
      self:RemoveLevelBarTimer()
    else
      self.Exp_Bar:SetPercent(Percent)
    end
  else
    self:RemoveLevelBarTimer()
  end
end

function WBP_BattlePass_Book_C:InitTime()
  self.BattlePassEndTime = DataMgr.BattlePassMain[self.BattlePassId].BattlePassEndTime
  self.NextDayEndTime = math.floor(TimeUtils.NextDailyRefreshTime())
  self.NextWeekEndTime = math.floor(TimeUtils.NextWeeklyRefreshTime())
  self.Time_Left.Text_TimeTitle:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:RefreshTime(self.NextDayEndTime, self.NextWeekEndTime, self.BattlePassEndTime)
  self:AddTimer(1, self.RefreshTime, true, 0, "RefreshBattlePassTime", true, self.NextDayEndTime, self.NextWeekEndTime, self.BattlePassEndTime)
end

function WBP_BattlePass_Book_C:RefreshTime(DayEndTime, WeekEndTime, VersionEndTime)
  local RemainTimeDictDaily = UIUtils.GetLeftTimeStrStyle2(DayEndTime)
  local RemainTimeDictWeekly = UIUtils.GetLeftTimeStrStyle2(WeekEndTime)
  local RemainTimeDictVersion = UIUtils.GetLeftTimeStrStyle2(VersionEndTime)
  self.Time_Left:SetTimeText(GText("UI_BattlePass_RemainTime"), RemainTimeDictVersion)
  self.WBP_BattlePass_MissionTab_Daily:SetTimeText(GText("UI_BattlePass_RemainTime"), RemainTimeDictDaily)
  self.WBP_BattlePass_MissionTab_Weekly:SetTimeText(GText("UI_BattlePass_RemainTime"), RemainTimeDictWeekly)
  self.WBP_BattlePass_MissionTab_Version:SetTimeText(GText("UI_BattlePass_RemainTime"), RemainTimeDictVersion)
  if self.CurSelectedTab and self.CurSelectedTab.Type == "Version" then
    local AllDisplayWidget = self.List_Mission:GetDisplayedEntryWidgets()
    for _, Widget in pairs(AllDisplayWidget) do
      Widget:TryRefreshTime()
    end
  end
end

function WBP_BattlePass_Book_C:InitBtn()
  self.Button_Area.OnClicked:Add(self, self.PageTurnerToNext)
  self.Btn_Pet.OnClicked:Add(self, self.PageTurnerToNextNew)
  self:RefreshBtnBuy()
  self:RefreshBtnUnlock()
end

function WBP_BattlePass_Book_C:RefreshBtnBuy()
  local bIsLevelMax = BattlePassUtils:IsMaxLevel()
  DebugPrint("gmy@WBP_BattlePass_Book_C WBP_BattlePass_Book_C:InitBtn", GText("UI_BattlePass_MaxLevel"))
  if bIsLevelMax then
    self.Btn_BuyLv:SetDefaultGamePadImg("RS")
    self.Btn_BuyLv:SetText(GText("UI_BattlePass_MaxLevel"))
    self.Btn_BuyLv:ForbidBtn(true)
  else
    self.Btn_BuyLv:SetDefaultGamePadImg("RS")
    self.Btn_BuyLv:SetText(GText("UI_BattlePass_BuyLevel"))
    self.Btn_BuyLv:ForbidBtn(false)
    self.Btn_BuyLv:UnBindEventOnClicked()
    self.Btn_BuyLv:BindEventOnClicked(self, function()
      self:OpenPurchaseDialog()
    end)
  end
end

function WBP_BattlePass_Book_C:RefreshBtnUnlock()
  if not ShopUtils:IsCanOpenPay(false) then
    self.Btn_Unlock:InitBtnInfo("Forbidden", GText("UI_BattlePass_UnlockGoldRank"), function()
      self:ShowUITip()
    end, nil, nil, "X", false)
    self.RewardTab_Sp:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    if self.Avatar.BattlePassUnlockRank2 then
      self.Btn_Unlock:InitBtnInfo("Normal", GText("UI_BattlePass_CheckRank"), function()
        self:OpenPurchase()
      end, nil, nil, "X", false)
    else
      self.Btn_Unlock:InitBtnInfo("Normal", GText("UI_BattlePass_UnlockGoldRank"), function()
        self:OpenPurchase()
      end, nil, nil, "X", false)
    end
    if self.Avatar.BattlePassUnlockRank2 and self.Avatar.BattlePassUnlockRank3 then
      self.RewardTab_Sp:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.RewardTab_Sp:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function WBP_BattlePass_Book_C:ScrollToNext()
  local FirstCanGetReward, FirstCantGetReward
  local Contents = self.List_Reward:GetListItems()
  local Length = Contents:Length()
  for _, Content in pairs(Contents) do
    if self:CheckHaveAnyRewardCanGet_Item(Content) then
      if not FirstCanGetReward or FirstCanGetReward.BattlePassLevel > Content.BattlePassLevel then
        FirstCanGetReward = Content
      end
    elseif self:CheckHaveAnyRewardCantGet_Item(Content) and (not FirstCantGetReward or FirstCantGetReward.BattlePassLevel > Content.BattlePassLevel) then
      FirstCantGetReward = Content
    end
  end
  if FirstCanGetReward then
    self:ScrollToTarget(FirstCanGetReward)
  elseif FirstCantGetReward then
    self:ScrollToTarget(FirstCantGetReward)
  else
    local Content = self.List_Reward:GetItemAt(Length - 1)
    if Content then
      self:ScrollToTarget(Content)
    end
  end
  self:AddTimer(0.001, self.RefreshRewardSpAfterScroll, false, 0, nil, true)
end

function WBP_BattlePass_Book_C:CheckHaveAnyRewardCanGet_Item(Content)
  if 1 == Content.IsGotState_Rank1 or Content.IsUnlocked and 1 == Content.IsGotState_Rank2 then
    return true
  else
    return false
  end
end

function WBP_BattlePass_Book_C:CheckHaveAnyRewardCantGet_Item(Content)
  if 0 == Content.IsGotState_Rank1 or Content.IsUnlocked and 0 == Content.IsGotState_Rank2 then
    return true
  else
    return false
  end
end

function WBP_BattlePass_Book_C:ScrollToTarget(Content)
  self.List_Reward:BP_NavigateToItem(Content)
end

function WBP_BattlePass_Book_C:InitRewardInfo()
  self.List_Reward:ClearListItems()
  local BattlePassRewardData = BattlePassUtils:GetBattlePassReward(self.BattlePassId)
  for Level, RewardInfo in ipairs(BattlePassRewardData or {}) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    self:ChangeContentWithUnlockInfo(Content)
    self:ChangeContentWithGotInfo(Content, RewardInfo)
    Content.BattlePassLevel = RewardInfo.BattlePassLevel
    Content.Rank1Reward = RewardInfo.Rank1Reward
    Content.Rank2Reward = RewardInfo.Rank2Reward
    Content.Root = self
    self.List_Reward:AddItem(Content)
  end
end

function WBP_BattlePass_Book_C:ChangeContentWithUnlockInfo(Content)
  Content.IsUnlocked = self.Avatar.BattlePassUnlockRank2
end

function WBP_BattlePass_Book_C:ChangeContentWithGotInfo(Content, RewardInfo)
  local Rank1GotInfo = self.Avatar.BattlePassRank1LevelRewardsGot
  local Rank2GotInfo = self.Avatar.BattlePassRank2LevelRewardsGot
  if Rank1GotInfo[RewardInfo.BattlePassLevel] then
    Content.IsGotState_Rank1 = 2
  elseif RewardInfo.BattlePassLevel > self.Avatar.BattlePassLevel then
    Content.IsGotState_Rank1 = 0
  else
    Content.IsGotState_Rank1 = 1
  end
  if self.Avatar.BattlePassUnlockRank2 then
    if Rank2GotInfo[RewardInfo.BattlePassLevel] then
      Content.IsGotState_Rank2 = 2
    elseif RewardInfo.BattlePassLevel > self.Avatar.BattlePassLevel then
      Content.IsGotState_Rank2 = 0
    else
      Content.IsGotState_Rank2 = 1
    end
  else
    Content.IsGotState_Rank2 = 0
  end
end

function WBP_BattlePass_Book_C:CheckHaveAnyRewardCanGet()
  local Rank1GotInfo = self.Avatar.BattlePassRank1LevelRewardsGot
  local Rank2GotInfo = self.Avatar.BattlePassRank2LevelRewardsGot
  local BattlePassRewardData = BattlePassUtils:GetBattlePassReward(self.BattlePassId)
  for Level, RewardInfo in ipairs(BattlePassRewardData or {}) do
    if RewardInfo.BattlePassLevel <= self.Avatar.BattlePassLevel then
      if not Rank1GotInfo[RewardInfo.BattlePassLevel] then
        return true
      end
      if self.Avatar.BattlePassUnlockRank2 and not Rank2GotInfo[RewardInfo.BattlePassLevel] then
        return true
      end
    end
  end
  return false
end

function WBP_BattlePass_Book_C:GetReward(Level, IsRank2)
  local function Callback(Rewards)
    self:UpdateItems()
    
    self:RefreshRewardSp()
    self:RefreshGetAllRewardBtn(self.CurTabId)
    if IsRank2 then
      self:RefreshBattlePassRewardReddotInfo(Level, "Rank2")
    else
      self:RefreshBattlePassRewardReddotInfo(Level, "Rank1")
    end
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if not ShopUtils:IsCanOpenPay(false) or self.Avatar.BattlePassUnlockRank2 then
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
    else
      UIManager:LoadUINew("BattlePassGetItemPage", nil, nil, nil, Rewards, nil, nil, self, self.Parent and self.Parent.ActorController)
    end
  end
  
  self.Avatar:RpcBattlePassGetLevelReward(Level, IsRank2, Callback)
end

function WBP_BattlePass_Book_C:GetAllBattlePassReward()
  if self:CheckHaveAnyRewardCanGet() then
    local function Callback(Rewards)
      self:UpdateItems()
      
      self:RefreshRewardSp()
      self:RefreshGetAllRewardBtn(self.CurTabId)
      self:RefreshBattlePassRewardReddotInfo()
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      if not ShopUtils:IsCanOpenPay(false) or self.Avatar.BattlePassUnlockRank2 then
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
      else
        UIManager:LoadUINew("BattlePassGetItemPage", nil, nil, nil, Rewards, nil, nil, self, self.Parent and self.Parent.ActorController)
      end
    end
    
    self.Avatar:RpcBattlePassGetAllLevelReward(Callback)
  end
end

function WBP_BattlePass_Book_C:UpdateItems()
  local Contents = self.List_Reward:GetListItems()
  local BattlePassRewardData = BattlePassUtils:GetBattlePassReward(self.BattlePassId)
  if BattlePassRewardData then
    for _, Content in pairs(Contents) do
      local RewardInfo = BattlePassRewardData[Content.BattlePassLevel]
      self:ChangeContentWithUnlockInfo(Content)
      self:ChangeContentWithGotInfo(Content, RewardInfo)
    end
  end
  local AllDisplayWidget = self.List_Reward:GetDisplayedEntryWidgets()
  for _, Widget in pairs(AllDisplayWidget) do
    Widget:Refresh()
  end
end

function WBP_BattlePass_Book_C:OnEntryGenerated(Entry)
  local Content = self:GetCurSpecialRewardContent(Entry.Content.BattlePassLevel)
  if not self.Reward_Sp.Content or Content and Content.BattlePassLevel > self.Reward_Sp.Content.BattlePassLevel then
    self.Reward_Sp:Init(Content)
  end
end

function WBP_BattlePass_Book_C:OnEntryReleased(Entry)
  local ReleasedTargetLevel = self:GetTargetLevel(Entry.Content.BattlePassLevel)
  if ReleasedTargetLevel >= self.Reward_Sp.Content.BattlePassLevel then
    local TargetLevel = self:GetTargetLevel(Entry.Content.BattlePassLevel - 1)
    if ReleasedTargetLevel > TargetLevel then
      local Content = self:GetContent(TargetLevel)
      if Content then
        self.Reward_Sp:Init(Content)
      end
    end
  end
end

function WBP_BattlePass_Book_C:RefreshRewardSpAfterScroll()
  local AllDisplayWidget = self.List_Reward:GetDisplayedEntryWidgets()
  local TargetContent
  for _, Widget in pairs(AllDisplayWidget) do
    local Content = self:GetCurSpecialRewardContent(Widget.Content.BattlePassLevel)
    if not TargetContent or TargetContent.BattlePassLevel < Content.BattlePassLevel then
      TargetContent = Content
    end
  end
  if TargetContent and self.Reward_Sp.Content and TargetContent.BattlePassLevel ~= self.Reward_Sp.Content.BattlePassLevel then
    self.Reward_Sp:Init(TargetContent)
  end
end

function WBP_BattlePass_Book_C:RefreshRewardSp()
  local AllDisplayWidget = self.List_Reward:GetDisplayedEntryWidgets()
  local TargetContent
  for _, Widget in pairs(AllDisplayWidget) do
    local Content = self:GetCurSpecialRewardContent(Widget.Content.BattlePassLevel)
    if not TargetContent or TargetContent.BattlePassLevel < Content.BattlePassLevel then
      TargetContent = Content
    end
  end
  if TargetContent then
    self.Reward_Sp:Init(TargetContent)
  end
end

function WBP_BattlePass_Book_C:GetCurSpecialRewardContent(Level)
  local TargetLevel = self:GetTargetLevel(Level)
  return self:GetContent(TargetLevel)
end

function WBP_BattlePass_Book_C:GetTargetLevel(Level)
  return (math.floor((Level - 1) / self.BattlePassInfo.MilestoneInterval) + 1) * self.BattlePassInfo.MilestoneInterval
end

function WBP_BattlePass_Book_C:GetContent(Level)
  local Contents = self.List_Reward:GetListItems()
  for _, Content in pairs(Contents) do
    if Content.BattlePassLevel == Level then
      return Content
    end
  end
end

function WBP_BattlePass_Book_C:InitMissionInfo()
  self:InitDailyMission()
  self:InitWeeklyMission()
  self:InitVersionMission()
end

function WBP_BattlePass_Book_C:InitDailyMission()
  self.WBP_BattlePass_MissionTab_Daily:Init("Daily", self)
end

function WBP_BattlePass_Book_C:InitWeeklyMission()
  self.WBP_BattlePass_MissionTab_Weekly:Init("Weekly", self)
end

function WBP_BattlePass_Book_C:InitVersionMission()
  self.WBP_BattlePass_MissionTab_Version:Init("Version", self)
end

function WBP_BattlePass_Book_C:OpenMissionList(Tab, IsForce)
  if self.CurSelectedTab then
    if self.CurSelectedTab.Type == Tab.Type then
      if not IsForce then
        return
      end
    else
      self.CurSelectedTab:UnSelected()
    end
  end
  self.CurSelectedTab = Tab
  self.CurSelectedTab:Selected()
  self:PlaySwitchAnim()
  self.CurSelectedTabIndex = self.Type2Index[self.CurSelectedTab.Type]
  self.List_Mission:ClearListItems()
  self:FillListWithMissionInfo(self.CurSelectedTab.Type)
  self.List_Mission:ScrollToTop()
  self:AddTimer(0.01, function()
    self.List_Mission:RequestFillEmptyContent()
    self.List_Mission:RequestPlayEntriesAnim()
  end, false, 0, nil, true)
end

function WBP_BattlePass_Book_C:GetSortedMissionTable(MissionInfo)
  local BattlePassTask = DataMgr.BattlePassTask
  local SortedMissionTable = {}
  for BattlePassTaskId, TargetCounter in pairs(MissionInfo) do
    table.insert(SortedMissionTable, BattlePassTaskId)
  end
  table.sort(SortedMissionTable, function(a, b)
    if MissionInfo[a].RewardsGot then
      if MissionInfo[b].RewardsGot then
        return a < b
      elseif MissionInfo[b]:IsComplete() then
        return false
      else
        return false
      end
    elseif MissionInfo[b].RewardsGot then
      return true
    elseif MissionInfo[a]:IsComplete() then
      if MissionInfo[b]:IsComplete() then
        return a < b
      else
        return true
      end
    elseif MissionInfo[b]:IsComplete() then
      return false
    elseif BattlePassTask[a].JumpUIId then
      if BattlePassTask[b].JumpUIId then
        return a < b
      else
        return true
      end
    elseif BattlePassTask[b].JumpUIId then
      return false
    else
      return a < b
    end
  end)
  return SortedMissionTable
end

function WBP_BattlePass_Book_C:FillListWithMissionInfo(Type)
  local MissionInfo
  if "Daily" == Type then
    MissionInfo = self.Avatar.BattlePassTaskDaily
  elseif "Weekly" == Type then
    MissionInfo = self.Avatar.BattlePassTaskWeekly
  elseif "Version" == Type then
    MissionInfo = self.Avatar.BattlePassTaskVersion
  end
  if MissionInfo then
    local BattlePassTask = DataMgr.BattlePassTask
    local SortedMissionTable = self:GetSortedMissionTable(MissionInfo)
    for _, BattlePassTaskId in ipairs(SortedMissionTable) do
      local TargetCounter = MissionInfo[BattlePassTaskId]
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.ID = TargetCounter.UniqueID
      Content.Type = BattlePassTask[Content.ID].BattlePassType
      Content.Progress = TargetCounter.Progress
      Content.Target = TargetCounter.Target
      Content.RewardsGot = TargetCounter.RewardsGot
      Content.BattlePassId = self.BattlePassId
      Content.Parent = self
      if "Version" == Content.Type then
        Content.TaskEndTime = BattlePassTask[Content.ID].TaskEndTime
      end
      self.List_Mission:AddItem(Content)
    end
  end
end

function WBP_BattlePass_Book_C:CheckHaveAnyMissionRewardCanGet()
  local MissionInfos = {
    self.Avatar.BattlePassTaskDaily,
    self.Avatar.BattlePassTaskWeekly,
    self.Avatar.BattlePassTaskVersion
  }
  for _, MissionInfo in ipairs(MissionInfos) do
    if self:CheckHaveMissionRewardCanGet(MissionInfo) then
      return true
    end
  end
  return false
end

function WBP_BattlePass_Book_C:CheckHaveMissionRewardCanGet(MissionInfo)
  for BattlePassTaskId, TargetCounter in pairs(MissionInfo) do
    if not TargetCounter.RewardsGot and TargetCounter:IsComplete() then
      return true
    end
  end
  return false
end

function WBP_BattlePass_Book_C:GetMissionReward(BattlePassType, BattlePassTaskId)
  local function Callback(Reward)
    self:RefreshMissionList(self.CurSelectedTab.Type)
    
    self:RefreshGetAllRewardBtn(self.CurTabId)
    self:RefreshLevelInfo()
    self:RefreshLevelBar()
  end
  
  self.Avatar:RpcBattlePassGetTaskReward(Callback, BattlePassType, BattlePassTaskId)
end

function WBP_BattlePass_Book_C:GetAllMissionReward()
  local function Callback(Reward)
    self:RefreshMissionList(self.CurSelectedTab.Type)
    
    self:RefreshGetAllRewardBtn(self.CurTabId)
    self:RefreshLevelInfo()
    self:RefreshLevelBar()
  end
  
  self.Avatar:RpcBattlePassGetAllTaskReward(Callback)
end

function WBP_BattlePass_Book_C:RefreshMissionList(Type)
  local MissionInfo
  if "Daily" == Type then
    MissionInfo = self.Avatar.BattlePassTaskDaily
  elseif "Weekly" == Type then
    MissionInfo = self.Avatar.BattlePassTaskWeekly
  elseif "Version" == Type then
    MissionInfo = self.Avatar.BattlePassTaskVersion
  end
  if MissionInfo then
    local BattlePassTask = DataMgr.BattlePassTask
    local SortedMissionTable = self:GetSortedMissionTable(MissionInfo)
    for Index, BattlePassTaskId in ipairs(SortedMissionTable) do
      local TargetCounter = MissionInfo[BattlePassTaskId]
      local Content = self.List_Mission:GetItemAt(Index - 1)
      local IfAdd = false
      if not Content then
        IfAdd = true
        Content = NewObject(UIUtils.GetCommonItemContentClass())
      end
      Content.ID = TargetCounter.UniqueID
      Content.Type = BattlePassTask[Content.ID].BattlePassType
      Content.Progress = TargetCounter.Progress
      Content.Target = TargetCounter.Target
      Content.RewardsGot = TargetCounter.RewardsGot
      Content.BattlePassId = self.BattlePassId
      Content.Parent = self
      if "Version" == Content.Type then
        Content.TaskEndTime = BattlePassTask[Content.ID].TaskEndTime
      end
      if IfAdd then
        self.List_Mission:AddItem(Content)
      end
    end
    local Num = self.List_Mission:GetNumItems()
    if Num > #SortedMissionTable then
      for i = #SortedMissionTable + 1, Num do
        local Content = self.List_Mission:GetItemAt(i - 1)
        self.List_Mission:RemoveItem(Content)
      end
    end
    local AllDisplayWidget = self.List_Mission:GetDisplayedEntryWidgets()
    for _, Widget in pairs(AllDisplayWidget) do
      Widget:Refresh()
    end
  end
end

function WBP_BattlePass_Book_C:OnBattlePassTaskProgressChange(TaskType, TaskId)
  if self.CurSelectedTab and self.CurSelectedTab.Type == TaskType then
    self:RefreshMissionList(TaskType)
    self:RefreshGetAllRewardBtn(self.CurTabId)
  end
  self:RefreshLevelInfo()
  self:RefreshLevelBar()
end

function WBP_BattlePass_Book_C:OnBattlePassLevelChange()
  if self.CurTabId == "BattlePassReward" then
    self:UpdateItems()
    self:RefreshRewardSp()
    self:RefreshGetAllRewardBtn(self.CurTabId)
  end
  self:RefreshBtnBuy()
  self:RefreshLevelInfo()
  self:TryPlayLevelUpAnimation()
  self:RefreshLevelBar()
end

function WBP_BattlePass_Book_C:OnBattlePassRank2Unlock()
  if self.CurTabId == "BattlePassReward" then
    self:UpdateItems()
    self:RefreshRewardSp()
    self:RefreshGetAllRewardBtn(self.CurTabId)
  end
  self:RefreshBtnUnlock()
  if UIUtils.HasAnyFocus(self) and self.CurTabId == "BattlePassReward" then
    self:PlayUnlockAnimation()
  else
    self.PlayUnlock = true
  end
end

function WBP_BattlePass_Book_C:TryPlayLevelUpAnimation()
  if UIUtils.HasAnyFocus(self) then
    self:PlayLevelUpAnimation()
  elseif self.CurLevel > 1 then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local BattlePassLevelUp = UIManager:GetUIObj("BattlePassLevelUp")
    if BattlePassLevelUp then
      BattlePassLevelUp:Refresh(self.CurLevel)
      self.PlayLevelUp = false
    else
      self.PlayLevelUp = true
    end
  end
end

function WBP_BattlePass_Book_C:PlayLevelUpAnimation()
  if self.CurLevel > 1 then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local BattlePassLevelUp = UIManager:LoadUINew("BattlePassLevelUp", self.CurLevel)
    BattlePassLevelUp:Refresh(self.CurLevel)
    self:SetLevelBar(1, 1)
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_exp_bar_update", nil, nil)
    self:PlayAnimation(self.ProgressPrompt)
    self.PlayLevelUp = false
  end
end

function WBP_BattlePass_Book_C:TryCloseLevelUpUI()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattlePassLevelUp = UIManager:GetUIObj("BattlePassLevelUp")
  if BattlePassLevelUp then
    BattlePassLevelUp:Close()
    self.PlayLevelUp = false
  end
end

function WBP_BattlePass_Book_C:PlayUnlockAnimation()
  self.RewardTab_Sp:PlayUnlockAnimation()
  self.PlayUnlock = false
end

function WBP_BattlePass_Book_C:JumptoOtherUI(JumpUIId)
  PageJumpUtils:JumpToTargetPageByJumpId(JumpUIId)
end

function WBP_BattlePass_Book_C:JumpToPetDetail()
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewPetIds = self.PetList,
    SelectedTargetId = self.PetList[self.CurrentPetIndex],
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
  })
end

function WBP_BattlePass_Book_C:RefreshGetAllRewardBtn(TabId)
  local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if "BattlePassReward" == TabId then
    if self:CheckHaveAnyRewardCanGet() then
      if IsUseKeyAndMouse then
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      else
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self:RefreshTab(true)
    else
      self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:RefreshTab(false)
    end
  elseif "BattlePassMission" == TabId then
    if self:CheckHaveAnyMissionRewardCanGet() then
      if IsUseKeyAndMouse then
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      else
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self:RefreshTab(true)
    else
      self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:RefreshTab(false)
    end
  end
end

function WBP_BattlePass_Book_C:OnBattlePassMissionReddotChange()
  if not ReddotManager.GetTreeNode("BattlePassMission") then
    ReddotManager.AddNode("BattlePassMission")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassMission")
  if CacheDetail.Daily then
    self.WBP_BattlePass_MissionTab_Daily:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WBP_BattlePass_MissionTab_Daily:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if CacheDetail.Weekly then
    self.WBP_BattlePass_MissionTab_Weekly:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WBP_BattlePass_MissionTab_Weekly:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if CacheDetail.Version then
    self.WBP_BattlePass_MissionTab_Version:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WBP_BattlePass_MissionTab_Version:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_BattlePass_Book_C:OnBattlePassPetCanClaim()
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction()
    self.Parent:SwitchTab("BattlePassPetSelection")
  end
  
  self.BattlePassPetCanClaimPopupUI = UIManager(self):ShowCommonPopupUI(100184, CommonDialogParams, self)
end

function WBP_BattlePass_Book_C:RefreshBattlePassRewardReddotInfo(Level, RankType)
end

function WBP_BattlePass_Book_C:OnSpaceBarDown()
  if self.Btn_GetAll:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    self:GetAllReward()
    return true
  else
    return false
  end
end

function WBP_BattlePass_Book_C:InitBottomKeyInfo()
  self.BottomKeyInfo = {}
  table.insert(self.BottomKeyInfo, {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    },
    Desc = GText("UI_CTL_SwichPet"),
    bLongPress = false
  })
  table.insert(self.BottomKeyInfo, {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "RH"}
    },
    Desc = GText("UI_CTL_RotatePreview"),
    bLongPress = false
  })
  table.insert(self.BottomKeyInfo, {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.Parent.OnClickBack,
        Owner = self.Parent
      }
    },
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK"),
    bLongPress = false
  })
end

function WBP_BattlePass_Book_C:RefreshTab(HaveGetAllTip)
  if HaveGetAllTip and not self.HaveGetAllTip then
    table.insert(self.BottomKeyInfo, 1, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Space",
          ClickCallback = self.OnSpaceBarDown,
          Owner = self
        }
      },
      Desc = GText("UI_BattlePass_ClaimAll"),
      bLongPress = false
    })
  elseif self.HaveGetAllTip and not HaveGetAllTip then
    table.remove(self.BottomKeyInfo, 1)
  end
  self.HaveGetAllTip = HaveGetAllTip
  self.Parent:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function WBP_BattlePass_Book_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightX" == InKeyName then
    IsEventHandled = true
    if self.Parent.ActorController then
      local DeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
      self.Parent.ActorController:OnDragging({X = DeltaX})
    end
  end
  return IsEventHandled
end

function WBP_BattlePass_Book_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      self:ClickMissionList()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      if self.Btn_GetAll:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
        IsEventHandled = true
        self:GetAllReward()
      end
    elseif InKeyName == UIConst.GamePadKey.SpecialRight then
      IsEventHandled = true
      self:OpenPurchaseDialog()
    elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
      IsEventHandled = true
      self:JumpToDetail()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = self:TryLeaveSpecialMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      IsEventHandled = true
      if not ShopUtils:IsCanOpenPay(false) then
        self:ShowUITip()
      else
        self:OpenPurchase()
      end
    elseif InKeyName == UIConst.GamePadKey.RightThumb then
      IsEventHandled = true
      self:PageTurnerToNextNew()
    elseif InKeyName == UIConst.GamePadKey.LeftThumb and self.CurTabId == "BattlePassReward" then
      IsEventHandled = self:TryEnterSpecialMode()
    end
  elseif "SpaceBar" == InKeyName then
    IsEventHandled = self:OnSpaceBarDown()
  end
  return IsEventHandled
end

function WBP_BattlePass_Book_C:TryChangeSelectedTab(NavigationDirection)
  if NavigationDirection == EUINavigation.Up then
    return self:OnNavigationToIndex(self.CurSelectedTabIndex - 1)
  elseif NavigationDirection == EUINavigation.Down then
    return self:OnNavigationToIndex(self.CurSelectedTabIndex + 1)
  end
end

function WBP_BattlePass_Book_C:OnNavigationToIndex(Index)
  if Index <= 0 or Index > 3 then
    return self.CurSelectedTab
  end
  if 1 == Index then
    self.WBP_BattlePass_MissionTab_Daily:OnCellClicked()
  elseif 2 == Index then
    self.WBP_BattlePass_MissionTab_Weekly:OnCellClicked()
  elseif 3 == Index then
    self.WBP_BattlePass_MissionTab_Version:OnCellClicked()
  end
  return self.CurSelectedTab
end

function WBP_BattlePass_Book_C:TryEnterSpecialMode()
  if self.InSpecialMode then
    return false
  end
  self.InSpecialMode = true
  self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Reward_Sp:SetFocus()
  return true
end

function WBP_BattlePass_Book_C:TryLeaveSpecialMode()
  if not self.InSpecialMode then
    return false
  end
  self.InSpecialMode = false
  self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if self.CurFocusedRewardItem then
    self.List_Reward:BP_NavigateToItem(self.CurFocusedRewardItem.Content)
  else
    self:NavigateToFirstDisplayedItem(self.List_Reward)
  end
  return true
end

function WBP_BattlePass_Book_C:TryEnterSelectMode(Entry)
  if self.InSelectMode then
    return false
  end
  self.InSelectMode = true
  Entry:EnterSelectMode()
  return true
end

function WBP_BattlePass_Book_C:TryLeaveSelectMode(Entry)
  if not self.InSelectMode then
    return false
  end
  self.InSelectMode = false
  Entry:LeaveSelectMode()
  return true
end

function WBP_BattlePass_Book_C:ClickMissionList()
  if self.CurFocusedMissionList then
    self.CurFocusedMissionList:ClickMissionList()
  end
end

function WBP_BattlePass_Book_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_BattlePass_Book_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_BattlePass_Book_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_BattlePass_Book_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self.InSelectMode = false
  self.InSpecialMode = false
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_BattlePass_Book_C:InitGamepadView()
  if UIManager(self):GetUI("CommonDialog") then
    return
  end
  if UIUtils.HasAnyFocus(self) then
    if self.CurTabId == "BattlePassReward" then
      if self.CurFocusedRewardItem then
        self.CurFocusedRewardItem:SetFocus()
      else
        self:NavigateToFirstDisplayedItem(self.List_Reward)
      end
    elseif self.CurTabId == "BattlePassMission" then
      if self.CurSelectedTab then
        self.CurSelectedTab:SetFocus()
      else
        self.WBP_BattlePass_MissionTab_Daily:SetFocus()
      end
    end
  end
  self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Button_Area:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.PageTurner:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Key_BuyLv:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.WS_Check:SetActiveWidgetIndex(1)
  if self.Btn_GetAll:GetVisibility() == UIConst.VisibilityOp.SelfHitTestInvisible then
    self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self.WidgetSwitcher_L:SetActiveWidgetIndex(1)
  self.WidgetSwitcher_R:SetActiveWidgetIndex(1)
end

function WBP_BattlePass_Book_C:InitKeyboardView()
  if self.CurFocusedMissionList then
    self.CurFocusedMissionList:StopHover(true)
    self.CurFocusedMissionList = nil
  end
  self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  self.PageTurner:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Key_BuyLv:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WS_Check:SetActiveWidgetIndex(0)
  if self.Btn_GetAll:GetVisibility() == UIConst.VisibilityOp.HitTestInvisible then
    self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.WidgetSwitcher_L:SetActiveWidgetIndex(0)
  self.WidgetSwitcher_R:SetActiveWidgetIndex(0)
end

function WBP_BattlePass_Book_C:InitWidgetInfoInGamePad()
  self.Key_Check_GamePad:CreateCommonKey({
    KeyInfoList = {
      {ImgShortPath = "LS", Type = "Img"}
    },
    Desc = GText("UI_Controller_Check")
  })
  self.Key_BuyLv:CreateGamepadKey("Menu")
  self.Key_Check:CreateGamepadKey("View")
  self.ControllerFSM = ControllerFSM.New(self, {
    [FSMStates.Default] = {
      OnEnter = self.EnterState_Default
    },
    [FSMStates.FocusItemCantGet] = {
      OnEnter = self.EnterState_FocusItemCantGet
    },
    [FSMStates.FocusItemCanGet] = {
      OnEnter = self.EnterState_FocusItemCanGet
    }
  })
end

function WBP_BattlePass_Book_C:BP_GetDesiredFocusTarget()
  local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if not IsUseKeyAndMouse then
    if self.CurTabId == "BattlePassReward" then
      if self.CurFocusedRewardItem then
        return self.CurFocusedRewardItem
      else
        return self
      end
    elseif self.CurTabId == "BattlePassMission" then
      if self.CurFocusedMissionList then
        return self.CurFocusedMissionList
      end
      if self.CurSelectedTab then
        return self.CurSelectedTab
      else
        return self.WBP_BattlePass_MissionTab_Daily
      end
    end
  else
    return self
  end
end

function WBP_BattlePass_Book_C:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    if self.CurFocusedMissionList then
      self.CurFocusedMissionList:StopHover()
      self.CurFocusedMissionList = nil
    end
    return self.CurSelectedTab
  end
end

function WBP_BattlePass_Book_C:FocusToFirstMission()
  return self:NavigateToFirstDisplayedItem(self.List_Mission)
end

function WBP_BattlePass_Book_C:GetCurFocusedRewardIndex()
  return self.CurFocusedRewardIndex
end

function WBP_BattlePass_Book_C:SetCurFocusedRewardIndex(RewardItem, Index)
  self.CurFocusedRewardItem = RewardItem
  self.CurFocusedRewardIndex = Index
end

function WBP_BattlePass_Book_C:TryChangeCurFocusedMissionList(MissionItem)
  if self.CurFocusedMissionList then
    self.CurFocusedMissionList:StopHover()
  end
  self.CurFocusedMissionList = MissionItem
  self.CurFocusedMissionList:BeginHover()
end

function WBP_BattlePass_Book_C:NavigateToFirstDisplayedItem(List)
  local ItemUIs = List:GetDisplayedEntryWidgets()
  if ItemUIs:Length() > 0 then
    local Widget = ItemUIs:GetRef(1)
    if Widget then
      List:BP_NavigateToItem(Widget.Content)
      return Widget
    end
  end
  return List
end

function WBP_BattlePass_Book_C:InitWhenSwitch()
  self.CurTabId = nil
  if self.CurFocusedMissionList then
    self.CurFocusedMissionList:StopHover()
    self.CurFocusedMissionList = nil
  end
  self.CurFocusedRewardItem = nil
  self.CurFocusedRewardIndex = nil
  self.InSelectMode = false
  self.InSpecialMode = false
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Key_Check_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_BattlePass_Book_C:SwitchState(...)
  if self.CurTabId == "BattlePassReward" then
    self:OnLeaveRewardTab()
  end
  self:InitWhenSwitch()
  local TabId = (...)
  if "BattlePassReward" == TabId then
    self:SwitchToBattlePassReward(TabId)
  elseif "BattlePassMission" == TabId then
    self:SwitchToBattlePassMission(TabId)
  end
  self:RefreshGetAllRewardBtn(TabId)
  self:PlaySwitchStateAnim(TabId)
end

function WBP_BattlePass_Book_C:SwitchIn(...)
  self:InitWhenSwitch()
  local TabId = (...)
  if "BattlePassReward" == TabId then
    self:SwitchToBattlePassReward(TabId)
  elseif "BattlePassMission" == TabId then
    self:SwitchToBattlePassMission(TabId)
  end
  self:RefreshGetAllRewardBtn(TabId)
  self:SetBindEvent()
  self:PlayInAnim()
end

function WBP_BattlePass_Book_C:SwitchToBattlePassReward(TabId)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.CurTabId = TabId
  self:InitRewardInfo()
  self:ScrollToNext()
end

function WBP_BattlePass_Book_C:SwitchToBattlePassMission(TabId)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self.CurTabId = TabId
  if self.CurSelectedTab then
    self.CurSelectedTab:OnCellClicked(true)
  else
    self.WBP_BattlePass_MissionTab_Daily:OnCellClicked(true)
  end
end

function WBP_BattlePass_Book_C:SwitchOut(...)
  if self.CurTabId == "BattlePassReward" then
    self:OnLeaveRewardTab()
  end
  self:InitWhenSwitch()
  self:ClearBindEventAndTimer()
  self:PlayOutAnim()
end

function WBP_BattlePass_Book_C:SetBindEvent()
  self:BindToAnimationFinished(self.Img_Show_Out, {
    self,
    self.PageTurnerToNext
  })
  self:BindToAnimationFinished(self.Img_Show_In, {
    self,
    function()
      self:AddTimer(1.5, function()
        self:PlayAnimation(self.Img_Show_Out)
      end, true, 0, "RefreshPetIconTimer", true)
    end
  })
  self.PageTurner:InitPageTurner(self.PetIconLengt, self, self.UpdateGuideInfo)
  self.Arrow_L:BindEventOnClicked(self, self.PageTurnerToPrevious, true)
  self.Arrow_R:BindEventOnClicked(self, self.PageTurnerToNext, true)
end

function WBP_BattlePass_Book_C:PageTurnerToNextNew()
  if self.Parent then
    self.Parent:PageTurnerToNext()
  end
end

function WBP_BattlePass_Book_C:PageTurnerToNext(StopAtEdge)
  local NewPetIndex
  if not StopAtEdge then
    NewPetIndex = self.CurrentPetIndex % self.PetIconLengt + 1
  else
    NewPetIndex = self.CurrentPetIndex + 1
    if NewPetIndex > self.PetIconLengt then
      return
    end
  end
  self:RemoveTimer("RefreshPetIconTimer")
  self.PageTurner:SwtichPagePointAnimation(NewPetIndex)
  self:UpdateGuideInfo(NewPetIndex)
end

function WBP_BattlePass_Book_C:PageTurnerToPrevious(StopAtEdge)
  local NewPetIndex
  if not StopAtEdge then
    NewPetIndex = (self.CurrentPetIndex - 1) % self.PetIconLengt
    if 0 == NewPetIndex then
      NewPetIndex = self.PetIconLengt
    end
  else
    NewPetIndex = self.CurrentPetIndex - 1
    if NewPetIndex <= 0 then
      return
    end
  end
  self:RemoveTimer("RefreshPetIconTimer")
  self.PageTurner:SwtichPagePointAnimation(NewPetIndex)
  self:UpdateGuideInfo(NewPetIndex)
end

function WBP_BattlePass_Book_C:UpdateGuideInfo(NewIndex)
  if self.CurrentPetIndex == NewIndex then
    return
  end
  self.CurrentPetIndex = NewIndex
  if self.CurrentPetIndex <= self.PetIconLengt then
    local ImgMat = self.Img_Show:GetDynamicMaterial()
    ImgMat:SetTextureParameterValue("IconTex", self.PetIconList:Get(self.CurrentPetIndex))
  end
  self:PlayAnimation(self.Img_Show_In)
end

function WBP_BattlePass_Book_C:ClearBindEventAndTimer()
  self:UnbindAllFromAnimationFinished(self.Img_Show_In)
  self:UnbindAllFromAnimationFinished(self.Img_Show_Out)
  self:UnbindAllFromAnimationFinished(self.ProgressPrompt)
  self:RemoveTimer("RefreshPetIconTimer")
  self:RemoveLevelBarTimer()
end

function WBP_BattlePass_Book_C:PlayInAnim()
  if self:IsAnimationPlaying(self.Out) then
    self:StopAnimation(self.Out)
  end
  if self:IsAnimationPlaying(self.In) then
    self:StopAnimation(self.In)
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_page_daily_in", nil, nil)
  self:PlayAnimation(self.In)
  self.CurrentPetIndex = 1
  local ImgMat = self.Img_Show:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconTex", self.PetIconList:Get(self.CurrentPetIndex))
  self:PlayAnimation(self.Img_Show_In)
  self:PlayAnimation(self.ShowDesc_In)
end

function WBP_BattlePass_Book_C:PlayOutAnim()
  if not self.BindOutAnimation then
    self:BindToAnimationFinished(self.Out, {
      self,
      function()
        self:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    })
    self.BindOutAnimation = true
  end
  if self:IsAnimationPlaying(self.In) then
    self:StopAnimation(self.In)
  end
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:PlayAnimation(self.Out)
end

function WBP_BattlePass_Book_C:PlaySwitchStateAnim(TabId)
  if "BattlePassReward" == TabId then
    if self:IsAnimationPlaying(self.SwitchTab_In) then
      self:StopAnimation(self.SwitchTab_In)
    end
    self:PlayAnimation(self.SwitchTab_Back)
  elseif "BattlePassMission" == TabId then
    if self:IsAnimationPlaying(self.SwitchTab_Back) then
      self:StopAnimation(self.SwitchTab_Back)
    end
    self:PlayAnimation(self.SwitchTab_In)
  end
end

function WBP_BattlePass_Book_C:PlaySwitchAnim()
  if self:IsAnimationPlaying(self.SwitchTab) then
    self:StopAnimation(self.SwitchTab)
  end
  self:PlayAnimation(self.SwitchTab)
end

function WBP_BattlePass_Book_C:ShowUITip()
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BattlePass_Oversea_PurchaseLocked"))
end

function WBP_BattlePass_Book_C:OpenPurchase()
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_btn_click_special", nil, nil)
  local PurchasePanel = UIManager(self):GetUIObj("BattlePassPurchase")
  if PurchasePanel then
    UIManager(self):UnLoadUI("BattlePassPurchase")
    PurchasePanel = nil
  end
  if nil == PurchasePanel then
    PurchasePanel = UIManager(self):LoadUINew("BattlePassPurchase", self.Parent and self.Parent.ActorController, 666)
    DebugPrint("gmy@WBP_BattlePass_Book_C WBP_BattlePass_Book_C:OpenPurchase")
    if self.Parent.ActorController then
      self.Parent.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "Skin", CommonConst.ArmoryTag.Appearance, "Purchase")
    end
  end
end

function WBP_BattlePass_Book_C:OpenPurchaseDialog()
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_btn_click_normal", nil, nil)
  local Params = {
    RightCallbackObj = self,
    RightCallbackFunction = self.StartBuyLevel,
    ShortText = string.format(GText("UI_BattlePass_BuyLevel")),
    MinLevel = 1,
    MaxLevel = self:GetMaxLevel() - self.CurLevel,
    Funds = {
      {
        FundId = DataMgr.GlobalConstant.BattlePassBuyLvMoney.ConstantValue,
        FundNeed = DataMgr.GlobalConstant.BattlePassBuyLvPrice.ConstantValue
      }
    },
    SupportLSFocus = true,
    CurrencyGamepadKey = "LS"
  }
  self.PurchaseDialog = UIManager(self):ShowCommonPopupUI(BATTLE_PASS_LEVEL_PURCHASE_POPUP, Params)
end

function WBP_BattlePass_Book_C:StartBuyLevel(Res)
  DebugPrint("gmy@WBP_BattlePass_Book_C M:StartBuyLevel", Res and Res.BattlePass and Res.BattlePass.Level)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local FundId = DataMgr.GlobalConstant.BattlePassBuyLvMoney.ConstantValue
    local Resource = Avatar.Resources[FundId] or {Count = 0}
    local AvatarCount = Resource.Count
    local NeedLevel = Res and Res.BattlePass and Res.BattlePass.Level or 1
    local NeedCount = DataMgr.GlobalConstant.BattlePassBuyLvPrice.ConstantValue * NeedLevel
    local NeedTransformCount = NeedCount - AvatarCount
    if AvatarCount < NeedCount then
      local Coin4 = Avatar.Resources[CommonConst.Coins.Coin4]
      local Coin4Count = Coin4 and Coin4.Count or 0
      if NeedTransformCount > Coin4Count then
        local function JumpToShop()
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        end
        
        local Params = {}
        Params.LeftCallbackObj = self
        Params.RightCallbackObj = self
        Params.RightCallbackFunction = JumpToShop
        self.JumpToShopPopupUI = UIManager(self):ShowCommonPopupUI(BATTLE_PASS_ALL_LACK_COIN_POPUP, Params, self)
      else
        local ItemList = {}
        table.insert(ItemList, {
          ItemId = CommonConst.Coins.Coin4,
          ItemType = CommonConst.ItemType.Resource,
          ItemNum = Coin4Count,
          ItemNeed = NeedTransformCount
        })
        local PopUpId = BATTLE_PASS_LACK_COIN1_POPUP
        local ResourceData = DataMgr.Resource[FundId]
        local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
        if string.find(PopoverText, "&ResourceName&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(ResourceData.ResourceName))
        end
        if string.find(PopoverText, "&ResourceName1&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
        end
        if string.find(PopoverText, "&ResourceName2&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ResourceData.ResourceName))
        end
        if string.find(PopoverText, "&Num1&") then
          PopoverText = string.gsub(PopoverText, "&Num1&", NeedTransformCount)
        end
        if string.find(PopoverText, "&Num2&") then
          PopoverText = string.gsub(PopoverText, "&Num2&", NeedTransformCount)
        end
        local Params = {
          RightCallbackFunction = function()
            Avatar:TransformCoin4ToCoin1(NeedTransformCount, function(Count)
              DebugPrint("gmy@WBP_BattlePass_Book_C WBP_BattlePass_Book_C:StartBuyLevel Callback", Count)
              UIUtils.ShowGetItemPageAndOpenBagIfNeeded("Resource", FundId, Count, nil, false, nil, self, false)
              self:OpenPurchaseDialog()
            end)
          end,
          ItemList = ItemList,
          ShortText = PopoverText
        }
        self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
      end
    elseif Res and Res.BattlePass and Res.BattlePass.Level then
      local Level = Res.BattlePass.Level
      Avatar:BattlePassBuyLevel(Level, function()
        DebugPrint("gmy@WBP_BattlePass_Book_C WBP_BattlePass_Book_C:StartBuyLevel Callback")
      end)
    end
  end
end

function WBP_BattlePass_Book_C:GetMaxLevel()
  return BattlePassUtils:GetMaxLevel()
end

function WBP_BattlePass_Book_C:OnAddedToFocusPath(InFocusEvent)
  if self.PlayLevelUp then
    self:PlayLevelUpAnimation()
  end
  if self.NeedShowAutoGetPopupUI then
    self:ShowAutoGetPopupUI()
  end
  if self.PlayUnlock and self.CurTabId == "BattlePassReward" then
    self:PlayUnlockAnimation()
  end
end

function WBP_BattlePass_Book_C:OnBattlePassAutoGetTaskReward()
  self:TryShowAutoGetPopupUI()
end

function WBP_BattlePass_Book_C:CheckBattlePassAutoGetTaskReward()
  if self.Avatar.BattlePassAutoGetTaskReward then
    self:TryShowAutoGetPopupUI()
  end
end

function WBP_BattlePass_Book_C:TryShowAutoGetPopupUI()
  if not self.ShowingPopupUI then
    if UIUtils.HasAnyFocus(self) then
      self:ShowAutoGetPopupUI()
    else
      self.NeedShowAutoGetPopupUI = true
    end
  end
end

function WBP_BattlePass_Book_C:ShowAutoGetPopupUI()
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction()
    self.ShowingPopupUI = false
  end
  
  self.ShowingPopupUI = true
  self.AutoGetPopupUI = UIManager(self):ShowCommonPopupUI(100203, CommonDialogParams, self)
  self.NeedShowAutoGetPopupUI = false
  self.Avatar:CallServerMethod("BattlePassAutoGetTaskRewardReset")
end

function WBP_BattlePass_Book_C:TryClosePopupUI()
  if IsValid(self.BattlePassPetCanClaimPopupUI) then
    self.BattlePassPetCanClaimPopupUI:Close()
  end
  if IsValid(self.PurchaseDialog) then
    self.PurchaseDialog:Close()
  end
  if IsValid(self.JumpToShopPopupUI) then
    self.JumpToShopPopupUI:Close()
  end
  if IsValid(self.PopupUI) then
    self.PopupUI:Close()
  end
  if IsValid(self.AutoGetPopupUI) then
    self.AutoGetPopupUI:Close()
  end
end

function WBP_BattlePass_Book_C:AddLevelBarTimer()
  if not self.LevelBarTimer then
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_exp_bar_grow", "LevelBarUpSound", nil)
    self.LevelBarTimer = self:AddTimer(0.01, self.SetLevelBarLerp, true, 0, "LevelBarTimer", true, 0.01)
  end
end

function WBP_BattlePass_Book_C:RemoveLevelBarTimer()
  if self.LevelBarTimer then
    AudioManager(self):SetEventSoundParam(self, "LevelBarUpSound", {ToEnd = 1})
    AudioManager(self):StopSound(self, "LevelBarUpSound")
    self:RemoveTimer(self.LevelBarTimer)
    self.LevelBarTimer = nil
  end
end

function WBP_BattlePass_Book_C:GetAllReward()
  if self.CurTabId == "BattlePassReward" then
    self:GetAllBattlePassReward()
  elseif self.CurTabId == "BattlePassMission" then
    self:GetAllMissionReward()
  end
end

function WBP_BattlePass_Book_C:EnterState_Default()
  local Index = 1
  if self.HaveGetAllTip then
    Index = 2
  end
  if self.LastState then
    table.remove(self.BottomKeyInfo, Index)
  end
  self.Parent:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function WBP_BattlePass_Book_C:EnterState_FocusItemCantGet()
  local Index = 1
  if self.HaveGetAllTip then
    Index = 2
  end
  if self.LastState and self.LastState ~= FSMStates.Default then
    table.remove(self.BottomKeyInfo, Index)
  end
  table.insert(self.BottomKeyInfo, Index, {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Controller_CheckDetails"),
    bLongPress = false
  })
  self.Parent:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function WBP_BattlePass_Book_C:EnterState_FocusItemCanGet()
  local Index = 1
  if self.HaveGetAllTip then
    Index = 2
  end
  if self.LastState and self.LastState ~= FSMStates.Default then
    table.remove(self.BottomKeyInfo, Index)
  end
  table.insert(self.BottomKeyInfo, Index, {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_BattlePass_QuestRewardClaim"),
    bLongPress = false
  })
  self.Parent:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function WBP_BattlePass_Book_C:OnFocusItemChanged(bCanGet)
  self.LastState = self.ControllerFSM:Current()
  if bCanGet then
    self.ControllerFSM:Enter(FSMStates.FocusItemCanGet)
  else
    self.ControllerFSM:Enter(FSMStates.FocusItemCantGet)
  end
end

function WBP_BattlePass_Book_C:OnLeaveRewardTab()
  self.LastState = self.ControllerFSM:Current()
  self.ControllerFSM:Enter(FSMStates.Default)
end

return WBP_BattlePass_Book_C
