local Component = {}

function Component:InitComp(DungeonId)
  local GameState = UE.UGameplayStatics.GetGameState(self)
  self.CurrentDungeonId = GameState.DungeonId
  self:BindEvents()
  if IsStandAlone(self) then
    self:StandaloneConstruct()
    self.IsStandAlone = true
  else
    self:MultiConstruct()
    self.IsStandAlone = false
    self:StartSelectCountDown()
    self:InitTeamHeads()
  end
  self:InitWalnuts()
  self:InitGameInputMode()
  if GWorld.GameInstance.IsInSettlementScene then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self:PlayAnimation(self.In)
  end
end

function Component:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  if GWorld.GameInstance.IsInSettlementScene then
    self:Close()
  end
end

function Component:InitTeamHeads(WalnutRewardPlayer)
  self.TeamHeadUI = {
    self.State_Mine,
    self.WBP_Walnut_PlayerState_1,
    self.WBP_Walnut_PlayerState_2,
    self.WBP_Walnut_PlayerState
  }
  self.TeamHeadTable = {}
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerNum = 0
  self.State_Mine.Item_Walnut.State = 0
  if self.WBP_Walnut_PlayerState_1.Item_Walnut then
    self.WBP_Walnut_PlayerState_1.Item_Walnut.State = 0
  end
  if self.WBP_Walnut_PlayerState_2.Item_Walnut then
    self.WBP_Walnut_PlayerState_2.Item_Walnut.State = 0
  end
  if self.WBP_Walnut_PlayerState.Item_Walnut then
    self.WBP_Walnut_PlayerState.Item_Walnut.State = 0
  end
  for i, PlayerState in pairs(GameState.PlayerArray) do
    local AvatarEidStr = PlayerState.AvatarEidStr
    PlayerNum = PlayerNum + 1
    local Eid = PlayerState.Eid
    local TeamHead = self.TeamHeadUI[PlayerNum].Team_Head
    TeamHead.Eid = Eid
    TeamHead:Init("Walnut", PlayerState, PlayerNum, true, PlayerState.Eid == MainPlayer.Eid, self)
    DebugPrint("PlayerState.AvatarEidStr", AvatarEidStr)
    self.TeamHeadTable[PlayerState.AvatarEidStr] = self.TeamHeadUI[PlayerNum]
    self.TeamHeadUI[PlayerNum]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:ChangeStateIcon(self.TeamHeadUI[PlayerNum].Item_Walnut, true, nil)
    self.TeamHeadUI[PlayerNum].Item_Walnut.Button_Area.OnClicked:Clear()
    self.TeamHeadUI[PlayerNum].Item_Walnut.Button_Area.OnClicked:Add(self, function()
      self:OnItemWalnutClicked(self.TeamHeadUI[i].Item_Walnut)
    end)
  end
  for i = PlayerNum + 1, 4 do
    local TeamHead = self.TeamHeadUI[i]
    TeamHead:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Component:ReceiveTeammateChoose(WalnutRewardPlayer)
  if not self.TeamHeadTable then
    DebugPrint("ReceiveTeammateChoose TeamHeadTable nil")
    return
  end
  PrintTable(self.TeamHeadTable)
  if nil == WalnutRewardPlayer then
    return
  end
  for AvatarEidStr, WalnutId in pairs(WalnutRewardPlayer) do
    DebugPrint("ReceiveTeammateChoose", AvatarEidStr, WalnutId)
    local AllTeamHead = self.TeamHeadTable[AvatarEidStr]
    local TeamHead = AllTeamHead.Team_Head
    local ItemWalnut = AllTeamHead.Item_Walnut
    ItemWalnut.WalnutId = WalnutId
    if 0 == WalnutId then
      TeamHead:SetIsChosenState(false)
    elseif -1 == WalnutId then
      TeamHead:SetIsChosenState(true)
      local WalnutIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
      self:ChangeStateIcon(AllTeamHead.Item_Walnut, false, WalnutIcon)
      AllTeamHead.Text_State:SetText(GText("UI_Walnut_Not_Select"))
    else
      TeamHead:SetIsChosenState(true)
      ItemWalnut.State = 1
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
  end
end

function Component:StartSelectCountDown()
  self:AddTimer(0.1, self.WalnutSelectCountDown, true, 0, "WalnutSelectCountDown")
end

function Component:WalnutSelectCountDown()
  local CurrentCountDown = self:GetRemainWalnutSelectTime("NextWalnut")
  if CurrentCountDown < 0 then
    CurrentCountDown = 0
  end
  local CurrentCountDownStr = string.format("%d", math.floor(CurrentCountDown))
  self.Text_CountDown:SetText(CurrentCountDownStr)
  self.Text_CountDown_1:SetText(CurrentCountDownStr)
  if CurrentCountDown < 1 then
    self:RemoveTimer("WalnutSelectCountDown")
  end
end

function Component:GetRemainWalnutSelectTime(TimerName)
  local GameState = UGameplayStatics.GetGameState(self)
  local Info = GameState.ClientTimerStruct:GetTimerInfo(TimerName)
  local WalnutRewardVoteTime = Info.Time - (GameState.ReplicatedRealTimeSeconds - Info.RealTimeSeconds)
  return WalnutRewardVoteTime
end

function Component:PlayWalnutReady()
  for _, AllTeamHead in pairs(self.TeamHeadTable) do
    local TeamHead = AllTeamHead.Team_Head
    if not TeamHead.IsChosen then
      TeamHead:SetIsChosenState(true)
      local WalnutIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
      self:ChangeStateIcon(AllTeamHead.Item_Walnut, false, WalnutIcon)
      AllTeamHead.Text_State:SetText(GText("UI_Walnut_Not_Select"))
    end
  end
  self:PlayAnimation(self.LayoutRefresh_InDungeon)
  self:StartWalnutReadyCountDown()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.NavigateWidget = self.GameInputModeSubsystem:GetNavigateWidget()
  self.NavigateWidget:SetRenderOpacity(0)
  self:UpdateCommonKeys("RS", GText("UI_Controller_CheckTeam"))
  self.WalnutChoiceFinish = 1
  self.State = 0
  self:AddTimer(0.1, function()
    self:SetFocus()
  end)
end

function Component:StartWalnutReadyCountDown()
  self.Text_Choose_Multi:SetText(GText("UI_Walnut_Begin"))
  self:AddTimer(0.1, self.WalnutReadyCountDown, true, 0, "WalnutReadyCountDown")
end

function Component:WalnutReadyCountDown()
  local CurrentCountDown = self:GetRemainWalnutSelectTime("WalnutReady")
  local CountDownNumber = math.floor(CurrentCountDown)
  if self.WalnutSelectCountDownNumber ~= CountDownNumber then
    self.WalnutSelectCountDownNumber = CountDownNumber
    self:PlayAnimation(self.RefreshCountDown)
    AudioManager(self):PlayUISound(self, "event:/ui/common/mihan_level_before_choose_count_down", nil, nil)
  end
  local CurrentCountDownStr = string.format("%d", CountDownNumber)
  self.Text_CountDown:SetText(CurrentCountDownStr)
  self.Text_CountDown_1:SetText(CurrentCountDownStr)
  if CurrentCountDown < 1 then
    self:RemoveTimer("WalnutReadyCountDown")
  end
end

return Component
