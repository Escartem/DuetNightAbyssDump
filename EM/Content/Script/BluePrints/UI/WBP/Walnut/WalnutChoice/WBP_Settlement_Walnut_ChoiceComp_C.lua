local TeamController = require("BluePrints.UI.WBP.Team.TeamController")
local TeamModel = TeamController:GetModel()
local Component = {}

function Component:InitComp(DungeonId, RawTempTeamInfo)
  self.CurrentDungeonId = DungeonId
  self.SelectYes = false
  local TempTeamInfo = self:FilterTempTeamInfo(RawTempTeamInfo)
  self.RawTempTeamInfo = RawTempTeamInfo
  self:BindEvents()
  self:AddDispatcher(EventID.SettlementSelectWalnut, self, self.ReceiveTeammateChoose)
  self:AddDispatcher(EventID.WalnutSelectComplete, self, self.WalnutSelectComplete)
  self:AddDispatcher(EventID.TeamMatchOneRefused, self, self.TeamMatchOneRefused)
  self:AddDispatcher(EventID.TeamMatchStartEntering, self, self.CloseSelf)
  self:AddDispatcher(EventID.TeamMatchStartMatching, self, self.OnStartMatching)
  self.IsSingle = self:IsSinglePlayer()
  if self:IsStandAloneSolo() then
    self:StandaloneConstruct()
    self.IsStandAlone = true
  else
    self:MultiConstruct()
    self.IsStandAlone = false
    if self.IsSingle then
      self:ShowTimerPanel(false)
    else
      self:StartDeputeSelectCountDown()
    end
    self:InitTeamHeads(TempTeamInfo)
  end
  self:InitWalnuts()
  self:InitGameInputMode()
  self:PlayAnimation(self.In)
  EventManager:FireEvent(EventID.OnRefreshDeputeBtn, true)
end

function Component:IsStandAloneSolo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  return Avatar.SettlementUidArray == nil
end

function Component:IsSinglePlayer()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  if Avatar.SettlementUidArray == nil then
    return true
  end
  return #Avatar.SettlementUidArray <= 1
end

function Component:FilterTempTeamInfo(RawTempTeamInfo)
  local TempTeamInfo = {}
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return TempTeamInfo
  end
  if not Avatar.SettlementUidArray then
    return TempTeamInfo
  end
  for _, SettlementUid in pairs(Avatar.SettlementUidArray) do
    local Info = RawTempTeamInfo[SettlementUid]
    if Info then
      table.insert(TempTeamInfo, Info)
      DebugPrint("ljl@WalnutChoice", Info.Uid, Info.PlayerName)
    end
  end
  return TempTeamInfo
end

function Component:OnClickButtonYes()
  local WalnutId = self.CurrentSelectContent.Id
  if nil == WalnutId then
    WalnutId = -1
  end
  local Avatar = GWorld:GetAvatar()
  Avatar:SelectWalnut(self:ShowChooseSuccessToast(self.CurrentSelectContent), self.CurrentDungeonId, WalnutId)
  self.SelectYes = true
  if not self.IsStandAlone then
    EventManager:FireEvent(EventID.SelectedWalnut)
  else
    self:CloseSelf()
  end
end

function Component:OnClickButtonNo()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if not self.IsStandAlone then
    Avatar:VoteStartBattle(false)
  end
  EventManager:FireEvent(EventID.OnRefreshDeputeBtn, false)
  self:CloseSelf()
end

function Component:OnBtnGiveUpClicked()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local CommonDialog = UIManager(self):ShowCommonPopupUI(100141, {
    RightCallbackObj = self,
    RightCallbackFunction = function(Obj, PackageData)
      if not self.IsStandAlone then
        Avatar:VoteStartBattle(false)
      end
      self:CloseSelf()
    end,
    ForbiddenRightCallbackObj = self
  }, self)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
end

function Component:InitTeamHeads(PlayerArray)
  self.TeamHeadUI = {
    self.State_Mine,
    self.WBP_Walnut_PlayerState_1,
    self.WBP_Walnut_PlayerState_2,
    self.WBP_Walnut_PlayerState
  }
  self.TeamHeadTable = {}
  self.Uid2WalnutMap = {}
  self.TeamCount = #PlayerArray
  self.CurrentSelectCount = 0
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for i, PlayerData in pairs(PlayerArray) do
    local Uid = PlayerData.Uid
    local TeamHead = self.TeamHeadUI[i].Team_Head
    TeamHead.Eid = Uid
    TeamHead:Init("Walnut", PlayerData, i, true, PlayerData.IsMainPlayer, self)
    self.TeamHeadTable[PlayerData.Uid] = self.TeamHeadUI[i]
    self.TeamHeadUI[i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:ChangeStateIcon(self.TeamHeadUI[i].Item_Walnut, true, nil)
    self.Uid2WalnutMap[Uid] = -1
    self.TeamHeadUI[i].Item_Walnut.Button_Area.OnClicked:Clear()
    self.TeamHeadUI[i].Item_Walnut.Button_Area.OnClicked:Add(self, function()
      self:OnItemWalnutClicked(self.TeamHeadUI[i].Item_Walnut)
    end)
  end
  for i = self.TeamCount + 1, 4 do
    local TeamHead = self.TeamHeadUI[i]
    TeamHead:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Component:SetDefaultSelect(TeamHead, AllTeamHead)
  TeamHead:SetIsChosenState(true)
  local WalnutIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
  self:ChangeStateIcon(AllTeamHead.Item_Walnut, false, WalnutIcon)
  AllTeamHead.Text_State:SetText(GText("UI_Walnut_Not_Select"))
end

function Component:WalnutSelectComplete()
  for Uid, WalnutId in pairs(self.Uid2WalnutMap) do
    if -1 == WalnutId then
      local AllTeamHead = self.TeamHeadTable[Uid]
      local TeamHead = AllTeamHead.Team_Head
      self:SetDefaultSelect(TeamHead, AllTeamHead)
    end
  end
  self.Panel_Yes:SetVisibility(ESlateVisibility.Collapsed)
  self:RemoveTimer("WalnutSelectCountDown")
  self:PlayWalnutReady()
end

function Component:ReceiveTeammateChoose(Uid, WalnutId)
  local AllTeamHead = self.TeamHeadTable[Uid]
  local TeamHead = AllTeamHead.Team_Head
  local ItemWalnut = AllTeamHead.Item_Walnut
  ItemWalnut.WalnutId = WalnutId
  if -1 == WalnutId then
    self:SetDefaultSelect(TeamHead, AllTeamHead)
    AllTeamHead.Text_State:SetText(GText("UI_Walnut_Not_Select"))
  else
    TeamHead:SetIsChosenState(true)
    local WalnutData = DataMgr.Walnut[WalnutId]
    local WalnutType = WalnutData.WalnutType
    local WalnutTypeData = DataMgr.WalnutType[WalnutType]
    local WalnutIcon = WalnutData.Icon
    self:ChangeStateIcon(AllTeamHead.Item_Walnut, false, WalnutIcon)
    local WalnutNumber = WalnutData.WalnutNumber
    local NumberString = tostring(WalnutNumber)
    local NumberStringLen = string.len(NumberString)
    for i = 1, 3 - NumberStringLen do
      NumberString = "0" .. NumberString
    end
    AllTeamHead.Text_State:SetText(GText(WalnutData.Name))
  end
  self.Uid2WalnutMap[Uid] = WalnutId
end

function Component:PlayWalnutReady()
  self:PlayAnimation(self.LayoutRefresh)
  self:StartDeputeWalnutReadyCountDown()
  self.Btn_No.Button_Area.OnClicked:Clear()
  self.Btn_No.Button_Area.OnClicked:Add(self, self.OnBtnGiveUpClicked)
end

function Component:WalnutSelectComplete()
  for Uid, WalnutId in pairs(self.Uid2WalnutMap) do
    if -1 == WalnutId then
      local AllTeamHead = self.TeamHeadTable[Uid]
      local TeamHead = AllTeamHead.Team_Head
      self:SetDefaultSelect(TeamHead, AllTeamHead)
    end
  end
  self.Panel_Yes:SetVisibility(ESlateVisibility.Collapsed)
  self:RemoveTimer("WalnutSelectCountDown")
  self:PlayWalnutReady()
end

function Component:GetDeputeWalnutCountDown(StartTime, CountDownTime)
  local GameState = UGameplayStatics.GetGameState(self)
  return CountDownTime - (GameState.ReplicatedRealTimeSeconds - StartTime)
end

function Component:StartDeputeSelectCountDown()
  self.Text_CountDown:SetText(DataMgr.GlobalConstant.WalnutSelectTime.ConstantValue)
  self.Text_CountDown_1:SetText(DataMgr.GlobalConstant.WalnutSelectTime.ConstantValue)
  local GameState = UGameplayStatics.GetGameState(self)
  self.ReadyTime = GameState.ReplicatedRealTimeSeconds
  self.WalnutCountDownNumber = 0
  self:AddTimer(0.5, self.DeputeWalnutSelectCountDown, true, 0, "WalnutSelectCountDown")
end

function Component:StartDeputeWalnutReadyCountDown()
  if not self.IsStandAlone and self.IsSingle then
    self:ShowTimerPanel(true)
  end
  self.Text_Choose_Multi:SetText(GText("UI_Walnut_Begin"))
  self.Text_CountDown:SetText(DataMgr.GlobalConstant.WalnutDungeonReadyTime.ConstantValue)
  self.Text_CountDown_1:SetText(DataMgr.GlobalConstant.WalnutDungeonReadyTime.ConstantValue)
  local GameState = UGameplayStatics.GetGameState(self)
  self.ReadyTime = GameState.ReplicatedRealTimeSeconds
  self.WalnutCountDownNumber = 0
  self:AddTimer(0.5, self.DeputeWalnutReadyCountDown, true, 0, "WalnutReadyCountDown")
end

function Component:DeputeWalnutSelectCountDown()
  self:DisplayCountDown(self.ReadyTime, DataMgr.GlobalConstant.WalnutSelectTime.ConstantValue, "WalnutSelectCountDown")
end

function Component:DeputeWalnutReadyCountDown()
  self:DisplayCountDown(self.ReadyTime, DataMgr.GlobalConstant.WalnutDungeonReadyTime.ConstantValue, "WalnutReadyCountDown")
end

function Component:DisplayCountDown(ReadyTime, CountDownTime, TimerName)
  local CurrentCountDown = self:GetDeputeWalnutCountDown(ReadyTime, CountDownTime)
  CurrentCountDown = math.floor(CurrentCountDown)
  if "WalnutReadyCountDown" == TimerName and self.WalnutCountDownNumber ~= CurrentCountDown then
    self.WalnutCountDownNumber = CurrentCountDown
    self:PlayAnimation(self.RefreshCountDown)
    AudioManager(self):PlayUISound(self, "event:/ui/common/mihan_level_before_choose_count_down", nil, nil)
  end
  if CurrentCountDown < 0 then
    CurrentCountDown = 0
  end
  local CurrentCountDownStr = string.format("%d", CurrentCountDown)
  self.Text_CountDown:SetText(CurrentCountDownStr)
  self.Text_CountDown_1:SetText(CurrentCountDownStr)
  if CurrentCountDown < 1 then
    self:RemoveTimer(TimerName)
  end
end

function Component:TeamMatchOneRefused(Uid)
  local TeamInfo = self.RawTempTeamInfo[Uid]
  if TeamInfo and not TeamInfo.IsMainPlayer then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Walnut_Giveup_Toast"), GText(TeamInfo.PlayerName)), 1.5)
  end
  self:CloseSelf()
end

function Component:CloseSelf()
  if self:IsAnimationPlaying(self.Auto_Out) then
    return
  end
  self:PlayAnimation(self.Auto_Out)
  self:Close()
end

function Component:OnStartMatching()
  DebugPrint("gmy@WBP_Depute_Walnut_ChoiceComp_C Component:OnStartMatching")
  if not UIManager(self):GetUIObj("DungeonMatchTimingBar") then
    DebugPrint("gmy@WBP_Depute_Walnut_ChoiceComp_C Component:OnStartMatching", 222)
    UIManager(self):LoadUINew("DungeonMatchTimingBar", self.CurrentDungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING)
  end
  self:CloseSelf()
end

function Component:GetSquadId()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local DungeonInfo = Avatar.Dungeons[self.CurrentDungeonId]
    if DungeonInfo and DungeonInfo.Squad then
      return DungeonInfo.Squad
    end
  end
  return 1
end

function Component:CloseByEscape()
  local Avatar = GWorld:GetAvatar()
  if Avatar and self.IsStandAlone then
    EventManager:FireEvent(EventID.OnRefreshDeputeBtn, false)
    self:Close()
    return true
  end
end

return Component
