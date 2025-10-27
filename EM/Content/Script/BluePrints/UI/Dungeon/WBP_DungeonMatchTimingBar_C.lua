require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local DeputeDetail = require("BluePrints.UI.WBP.Play.Widget.Depute.WBP_Play_DeputeDetail_C")
local M = Class("BluePrints.UI.BP_UIState_C")
local DUNGEON_MATCH_BAR_STATE = Const.DUNGEON_MATCH_BAR_STATE
local STATE_SET_FUNCTOR = {}
local SQUAD_PANEL_MAP = {}
local WAITING_CONFIRM_TIME = CommonConst.ONLINE_TEAM_VOTE_TIME
local WAITING_MATCHING_TIME = CommonConst.ONLINE_MATCH_TIME
local PROGRESS_PERCENT_SIZE_X = 578
local PROGRESS_PERCENT_SIZE_Y = 72
local FORCE_CLOSE_TIME = 5

function M:Construct()
  M.Super.Construct(self)
  STATE_SET_FUNCTOR = {
    [DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM] = M.SetState_SponsorWaitingConfirm,
    [DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING] = M.SetState_TeammateConfirming,
    [DUNGEON_MATCH_BAR_STATE.TEAMMATE_WAITING_CONFIRMING] = M.SetState_TeammateWaitingConfirming,
    [DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING] = M.SetState_WaitingMatching,
    [DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL] = M.SetState_WaitingMatchingWithCancel,
    [DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON] = M.SetState_WaitingEnterDungeon
  }
  SQUAD_PANEL_MAP = {
    [DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING] = true
  }
  self:SetMatchPanel()
  self:InitEvents()
  self:InitKeyMap()
  self:InitInputSettings()
end

function M:Destruct()
  self:ResetMatchPanel()
  self:ClearLoopSound()
  M.Super.Destruct(self)
end

function M:Initialize(Initializer)
  self.Super.Initialize(self)
end

function M:OnLoaded(DungeonId, EnterState, bIsMatch)
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C:OnLoaded ", DungeonId, EnterState, debug.traceback())
  self.DungeonId = DungeonId
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  assert(DungeonData, "\229\137\175\230\156\172ID\233\148\153\232\175\175" .. tostring(self.DungeonId))
  local MatchTitle = GText(DungeonData.DungeonName)
  local LevelIndex = self:GetDungeonIndex(DungeonId)
  local LevelText = GText(Const.RomanNum[LevelIndex])
  MatchTitle = string.format("%s%s", MatchTitle, LevelText)
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnLoaded", DungeonId, LevelIndex)
  if bIsMatch then
    MatchTitle = string.format("%s%s", MatchTitle, GText("UI_DUNGEON_TITLE_MATCHING"))
  end
  self.bIsMatch = bIsMatch
  self.bIsFocusable = true
  self.SquadFolding = true
  self.Title_Level:SetText(MatchTitle)
  self.StartTimeStamp = os.clock()
  self:SwitchState(nil, EnterState)
  self:PlayInitSound()
  self:InitSquadPanel()
  TeamController:SetTeamPopupBarOpen(true)
end

function M:PlayInitSound()
end

function M:PlayCancelSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", "", nil)
end

function M:Tick(MyGeometry, InDeltaTime)
  self.Overridden.Tick(self, MyGeometry, InDeltaTime)
  self:UpdateTimeProgress()
end

function M:SwitchState(OldState, NewState)
  DebugPrint("gmy@M:SwitchState OldState, NewState", OldState, NewState)
  if OldState then
  else
    self:PlayAnimation(self.In)
  end
  if OldState == NewState then
    return
  end
  if DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON == NewState then
    self:ClearLoopSound()
    AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_confirm", "", nil)
  end
  self.NowState = NewState
  if NewState then
    self:SetState(NewState)
  end
end

function M:SetState(State)
  local Functor = STATE_SET_FUNCTOR[State]
  if Functor then
    Functor(self)
  end
end

function M:SetState_SponsorWaitingConfirm()
  DebugPrint("gmy@M:SetState_WaitingConfirm")
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_hud_show", "dungeon_match_loop", nil)
  self.EndTimeStamp = self.StartTimeStamp + WAITING_CONFIRM_TIME
  local NowTime = os.clock()
  local Delay = self.EndTimeStamp - NowTime
  self.OvertimeTimer = self:AddTimer(Delay, self.OverTimeEnd, false)
  self.Text_Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Timing:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Split_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Enter:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Hint:SetText(GText("DUNGEON_TITLE_WAITING_CONFIRM"))
  self:SetBtnYes(false)
  self:SetBtnNo(true, GText("UI_PATCH_CANCEL"), function()
    DebugPrint("gmy@M:SponsorWaitingConfirm Cancel")
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      if self:IsInSettlement() then
        Avatar:VoteStartBattle(false)
      else
        Avatar:CancelEnterDungeon(CommonConst.DungeonNetMode.DedicatedServer)
      end
      self:Close()
    end
    self:PlayCancelSound()
  end)
end

function M:SetState_TeammateConfirming()
  DebugPrint("gmy@M:SetState_TeammateConfirming")
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_hud_show", "dungeon_match_loop", nil)
  local Avatar = GWorld:GetAvatar()
  self.EndTimeStamp = self.StartTimeStamp + WAITING_CONFIRM_TIME
  local NowTime = os.clock()
  local Delay = self.EndTimeStamp - NowTime
  self.OvertimeTimer = self:AddTimer(Delay, self.OverTimeEnd, false)
  self.Text_Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Timing:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Split_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Enter:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Hint:SetText(GText("DUNGEON_TITLE_CONFIRMING"))
  self:SetBtnYes(true, GText("UI_BTN_AGREE"), function()
    local SquadId = self:GetSquadId()
    DebugPrint("gmy@M:TeammateConfirm", SquadId)
    Avatar:VoteStartBattle(true, SquadId)
    self:SwitchState(self.NowState, DUNGEON_MATCH_BAR_STATE.TEAMMATE_WAITING_CONFIRMING)
  end)
  self:SetBtnNo(true, GText("UI_BTN_REJECT"), function()
    local SquadId = self:GetSquadId()
    DebugPrint("gmy@M:TeammateReject", SquadId)
    Avatar:VoteStartBattle(false, SquadId)
    self:PlayCancelSound()
    self:Close()
  end)
end

function M:SetState_TeammateWaitingConfirming()
  DebugPrint("gmy@M:SetState_TeammateWaitingConfirming")
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_hud_show", "dungeon_match_loop", nil)
  self.bWaitingTextChange = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Agree)
  self:SetBtnYes(false)
  self:SetBtnNo(false)
end

function M:TextChange()
  if self.bWaitingTextChange then
    if self.NowState == DUNGEON_MATCH_BAR_STATE.TEAMMATE_WAITING_CONFIRMING then
      self.Text_Hint:SetText(GText("DUNGEON_TITLE_WAITING_CONFIRM"))
    elseif self.NowState == DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON then
      self.Text_Hint:SetText(GText("DUNGEON_TITLE_ENTER_GAME"))
    else
      self.Text_Hint:SetText(GText("DUNGEON_TITLE_MATCHING_GAME"))
    end
  end
end

function M:SetState_WaitingMatching()
  DebugPrint("gmy@M:SetState_WaitingMatching")
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_state_search", "dungeon_match_loop", nil)
  if self.OvertimeTimer then
    self:RemoveTimer(self.OvertimeTimer)
  end
  self.StartTimeStamp = os.clock()
  self.EndTimeStamp = self.StartTimeStamp + WAITING_MATCHING_TIME
  local NowTime = os.clock()
  local Delay = self.EndTimeStamp - NowTime
  self.OvertimeTimer = self:AddTimer(Delay, self.OverTimeEnd, false)
  self.Text_Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Timing:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Split_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Enter:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimation(self.Agree)
  self.bWaitingTextChange = true
  self:SetBtnYes(false)
  self:SetBtnNo(false)
end

function M:SetState_WaitingMatchingWithCancel()
  DebugPrint("gmy@M:SetState_WaitingMatchingWithCancel")
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_in_line_state_search", "dungeon_match_loop", nil)
  self.EndTimeStamp = self.StartTimeStamp + WAITING_MATCHING_TIME
  local NowTime = os.clock()
  local Delay = self.EndTimeStamp - NowTime
  self.OvertimeTimer = self:AddTimer(Delay, self.OverTimeEnd, false)
  self.Text_Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Timing:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Split_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Enter:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Hint:SetText(GText("DUNGEON_TITLE_MATCHING_GAME"))
  self:SetBtnYes(false)
  self:SetBtnNo(true, GText("UI_PATCH_CANCEL"), function()
    DebugPrint("gmy@M:Matching Cancel")
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      if self:IsInSettlement() then
        Avatar:VoteStartBattle(false)
      else
        Avatar:CancelEnterDungeon(CommonConst.DungeonNetMode.DedicatedServer)
      end
    end
    self:PlayCancelSound()
    self:Close()
    EventManager:FireEvent(EventID.OnMatchStateChanged)
    UIManager(self):ShowUITip("CommonToastMain", GText("DUNGEONMATCH_CANCEL"), 1.5)
  end)
end

function M:SetState_WaitingEnterDungeon()
  DebugPrint("gmy@M:SetState_WaitingEnterDungeon")
  self.Panel_Enter:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Split:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Timing:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Split_1:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimation(self.Enter)
  self.bWaitingTextChange = true
  self:SetBtnYes(false)
  self:SetBtnNo(false)
end

function M:UpdateTimeProgress()
  if self.StartTimeStamp and self.EndTimeStamp and self.StartTimeStamp < self.EndTimeStamp then
    local NowTime = os.clock()
    local ElapsedTime = NowTime - self.StartTimeStamp
    local TotalTime = self.EndTimeStamp - self.StartTimeStamp
    local RemainTime = self.EndTimeStamp - NowTime
    RemainTime = RemainTime > 0 and RemainTime or 0
    local Percent = ElapsedTime / TotalTime
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Progress)
    CanvasSlot:SetSize(FVector2D((1 - Percent) * PROGRESS_PERCENT_SIZE_X, PROGRESS_PERCENT_SIZE_Y))
    self.Text_Timing:SetText(string.format(GText("DUNGEON_TIME_REMAIN_FMT"), RemainTime))
    if not self:HasFocusedDescendants() and TeamController:IsGamepad() then
      DebugPrint(LXYTag, WarningTag, "\231\187\132\233\152\159\232\191\155\230\156\172\229\128\146\232\174\161\230\151\182UI\233\156\128\232\166\129\230\138\162\229\164\186\232\129\154\231\132\166\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
      self:SetFocus()
    end
  end
end

function M:OverTimeEnd()
  DebugPrint("gmy@M:OverTimeEnd")
  if self.OvertimeTimer then
    self:RemoveTimer(self.OvertimeTimer)
    self.OvertimeTimer = nil
  end
  self:ClearLoopSound()
  local NowState = self.NowState
  if NowState == DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL then
    self:SwitchState(NowState, DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON)
  elseif NowState == DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING then
    if self.bIsMatch then
      self:SwitchState(NowState, DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING)
    else
      self:SwitchState(NowState, DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON)
    end
  elseif NowState == DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM then
    return
  elseif NowState == DUNGEON_MATCH_BAR_STATE.TEAMMATE_WAITING_CONFIRMING then
    return
  elseif NowState == DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING then
    return
  else
    self:Close()
  end
end

function M:InitEvents()
  self:AddDispatcher(EventID.TeamMatchStartMatching, self, self.OnTeamMatchStartMatching)
  self:AddDispatcher(EventID.TeamMatchStartEntering, self, self.OnTeamMatchStartEntering)
  self:AddDispatcher(EventID.TeamMatchOneRefused, self, self.OnTeamMatchCancel)
  self:AddDispatcher(EventID.TeamMatchCancel, self, self.OnTeamMatchCancel)
  self:AddDispatcher(EventID.SelectWalnut, self, self.OnTeamMatchCancel)
  self:AddDispatcher(EventID.SelectTicket, self, self.OnTeamMatchCancel)
  self:AddDispatcher(EventID.InLoading, self, self.ClearLoopSound)
  self:AddDispatcher(EventID.OnMatchPrepareToBattle, self, self.OnMatchPrepareToBattle)
  self:AddDispatcher(EventID.TeamMatchSquadFold, self, self.OnTeamMatchSquadFold)
  self:AddDispatcher(EventID.TeamMatchSquadUnfold, self, self.OnTeamMatchSquadUnfold)
  self:AddDispatcher(EventID.GameViewportInputKeyReleased, self, function(self, Key)
    if Key.KeyName == self.YES_KEY_TEXT then
      self:ConfirmKeyDown()
    elseif Key.KeyName == self.NO_KEY_TEXT then
      self:RefuseKeyDown()
    end
  end)
  self:AddDispatcher(EventID.GameViewportInputKeyPressed, self, function(self, Key)
    DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:InitEvents", Key.KeyName)
    if Key.KeyName == Const.GamepadSpecialRight then
      self:ConfirmKeyDown()
    elseif Key.KeyName == Const.GamepadSpecialLeft then
      self:RefuseKeyDown()
    end
  end)
end

function M:OnTeamMatchStartMatching()
  DebugPrint("gmy@M:OnTeamMatchStartMatching")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local bIsSoloMatch = not Avatar:IsInMultiSettlement()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnTeamMatchStartMatching", bIsSoloMatch)
  if bIsSoloMatch then
    self:SwitchState(self.NowState, DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL)
  else
    self:SwitchState(self.NowState, DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING)
  end
end

function M:OnTeamMatchStartEntering()
  DebugPrint("gmy@M:OnTeamMatchStartEntering")
  self:SwitchState(self.NowState, DUNGEON_MATCH_BAR_STATE.WAITING_ENTER_DUNGEON)
end

function M:OnTeamMatchCancel()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnTeamMatchCancel")
  self:Close()
end

function M:SetMatchPanel()
  EventManager:FireEvent(EventID.TeamMatchTimingStart, true)
end

function M:ResetMatchPanel()
  TeamController:GetModel().bPressedSolo = false
  TeamController:GetModel().bPressedMulti = false
  EventManager:FireEvent(EventID.TeamMatchTimingEnd, false)
end

function M:Close()
  self.Super.Close(self)
  self:ClearLoopSound()
  self.bClosing = true
  self:BindToAnimationFinished(self.Out, {
    self,
    self.RealClose
  })
  self:PlayAnimationForward(self.Out)
  self:RemoveAllDispatcher()
  if self:IsExistTimer(self.BarCloseTimer) then
    self:RemoveTimer(self.BarCloseTimer)
  end
  local _, Key = self:AddTimer(0.5, function()
    TeamController:SetTeamPopupBarOpen(false)
  end)
  self.BarCloseTimer = Key
  if not self.SquadFolding then
    self:SetInputUIOnly(false)
  end
end

function M:ClearLoopSound()
  AudioManager(self):StopSound(self, "dungeon_match_loop")
end

function M:GetDungeonIndex(DungeonId)
  local ChapterId = DataMgr.DungeonId2ChapterId[DungeonId]
  local ChapterData = DataMgr.SelectDungeon[ChapterId]
  local WeeklyChapterData = DataMgr.WeeklySelectDungeon[ChapterId]
  if ChapterData then
    for Index, Id in ipairs(ChapterData.DungeonList) do
      if Id == DungeonId then
        return Index
      end
    end
  end
  if WeeklyChapterData then
    for Index, Id in ipairs(WeeklyChapterData.DungeonList) do
      if Id == DungeonId then
        return Index
      end
    end
  end
  return 1
end

function M:SetBtnYes(bVisible, Text, Callback)
  Text = Text or ""
  Callback = Callback or function()
  end
  self.YesCallback = Callback
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.BtnYes_Mobile:SetVisibility(bVisible and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
    self.BtnYes_Mobile:BindEventOnClicked(self, Callback)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.BtnYes_PC:SetText(Text)
    self.BtnYes_PC:SetVisibility(bVisible and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
    self.BtnYes_PC:SetBtnNormalCallback(Callback)
    self.BtnYes_PC:SetImg(self.YES_GAMEPAD_IMG, self.YES_KEY_TEXT)
  end
end

function M:SetBtnNo(bVisible, Text, Callback)
  Text = Text or ""
  Callback = Callback or function()
  end
  self.NoCallback = Callback
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.BtnNo_Mobile:SetVisibility(bVisible and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
    self.BtnNo_Mobile:BindEventOnClicked(self, Callback)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.BtnNo_PC:SetText(Text)
    self.BtnNo_PC:SetVisibility(bVisible and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
    self.BtnNo_PC:SetBtnNormalCallback(Callback)
    self.BtnNo_PC:SetImg(self.NO_GAMEPAD_IMG, self.NO_KEY_TEXT)
  end
end

function M:InitKeyMap()
  self.YES_KEY_TEXT = "Y"
  self.NO_KEY_TEXT = "N"
  self.YES_GAMEPAD_IMG = "Menu"
  self.NO_GAMEPAD_IMG = "View"
end

function M:ConfirmKeyDown()
  DebugPrint("gmy@M:ConfirmKeyDown")
  if self.YesCallback then
    self.YesCallback()
  end
end

function M:RefuseKeyDown()
  DebugPrint("gmy@M:RefuseKeyDown")
  if self.NoCallback then
    self.NoCallback()
  end
end

function M:OnMatchPrepareToBattle()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnMatchPrepareToBattle")
  self:AddTimer(FORCE_CLOSE_TIME, self.Close, false)
end

function M:GetSquadInfo(DungeonId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local DungeonInfo = DataMgr.Dungeon[DungeonId]
    if DungeonInfo then
      local DungeonType = DungeonInfo.DungeonType
      local SquadIndex = Avatar.DungeonSquad[DungeonType] or 0
      if SquadIndex then
        local SquadInfo = Avatar.Squad[SquadIndex]
        if SquadInfo then
          return SquadInfo, SquadIndex
        end
      end
    end
  end
  return {}, 0
end

function M:GetSquadId()
  if self.DefaultList and self.DefaultList.CurrentSquad then
    DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:GetSquadId", self.DefaultList.CurrentSquad)
    return self.DefaultList.CurrentSquad
  end
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:GetSquadId000")
  return 0
end

function M:InSameDungeonType()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:InSameDungeonType", DeputeDetail.SelectedDungeonId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not DeputeDetail.SelectedDungeonId then
    return false
  end
  local SelectedDungeonInfo = DataMgr.Dungeon[DeputeDetail.SelectedDungeonId]
  if not SelectedDungeonInfo then
    return false
  end
  local SelectedDungeonType = SelectedDungeonInfo.DungeonType
  local NowDungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not NowDungeonInfo then
    return false
  end
  local NowDungeonType = NowDungeonInfo.DungeonType
  return SelectedDungeonType == NowDungeonType
end

function M:InitSquadPanel()
  self.DefaultList:SetVisibility(ESlateVisibility.Visible)
  if self.NowState and self.DungeonId then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local bShowSquadPanel = SQUAD_PANEL_MAP[self.NowState]
    local bInSameDungeonType = self:InSameDungeonType()
    local SquadInfo, SquadId = self:GetSquadInfo(self.DungeonId)
    local bIsNowEquipSquad = 0 == SquadId
    DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:InitSquadPanel", self.NowState, bShowSquadPanel, SquadId, SquadInfo.Props, bIsNowEquipSquad, bInSameDungeonType)
    local bHidden = not bShowSquadPanel or nil == SquadInfo or not bIsNowEquipSquad and SquadInfo.Props == nil or bInSameDungeonType
    self.DefaultList:SetVisibility(bHidden and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
    if bHidden then
      return
    end
    self:RefreshSquadPanel(SquadId)
  else
    self.DefaultList:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitInputSettings()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_BattlePurchase_C M:OnUpdateUIStyleByInputTypeChange", CurInputDevice, CurGamepadName)
  self.DefaultList:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
  else
    self.UsingGamepad = true
  end
end

function M:RefreshSquadPanel(SquadId)
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:RefreshSquadPanel", SquadId)
  self.DefaultList:Init(self, SquadId, self.DungeonId)
end

function M:SetSquadSelectBtnState(bActive)
  if bActive then
    self.DefaultList.WS_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.DefaultList.Btn_Show:SetVisibility(ESlateVisibility.Visible)
  else
    self.DefaultList.WS_Controller:SetVisibility(ESlateVisibility.Collapsed)
    self.DefaultList.Btn_Show:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnTeamMatchSquadFold()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnTeamMatchSquadFold")
  self:SetInputUIOnly(false)
  self.SquadFolding = true
end

function M:OnTeamMatchSquadUnfold()
  DebugPrint("gmy@WBP_DungeonMatchTimingBar_C M:OnTeamMatchSquadUnfold")
  self:SetInputUIOnly(true)
  self.SquadFolding = false
end

function M:IsInSettlement()
  return UIManager(self):GetUI("DungeonSettlement") ~= nil
end

return M
