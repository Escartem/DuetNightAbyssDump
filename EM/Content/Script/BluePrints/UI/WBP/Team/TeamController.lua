local TeamModel = require("BluePrints.UI.WBP.Team.TeamModel")
local TeamCommon = require("BluePrints.UI.WBP.Team.TeamCommon")
local GlobalConstant = DataMgr.GlobalConstant
local M = Class("BluePrints.Common.MVC.Controller")
M.HeadUIs = {}

function M:Init()
  M.Super.Init(self)
  self.InviteRecvTimer = "Team_InviteRecvTimer"
  self.TeamRecoveryTimer = "Team_TeamRecoveryTimer"
  self.AutoResetHeadStateTimer = "Team_AutoResetHeadStateTimer"
  M.HeadUIs = {}
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnCloseLoading)
  EventManager:AddEvent(EventID.OnAvatarStatusUpdate, self, self.OnAvatarStatusUpdate)
end

function M:SetTeamPopupBarOpen(bOpen)
  self.bTeamPopupBarOpen = bOpen
end

function M:GetTeamPopupBarOpen()
  return self.bTeamPopupBarOpen
end

function M:IsTeamPopupBarOpenInGamepad()
  return self:GetTeamPopupBarOpen() and self:IsGamepad()
end

function M:OnCloseLoading()
  DebugPrint(" TeamSyncDebug   xxxTeamReconnectNotify   \230\137\139\229\138\168")
  TeamModel:DestoryTeamDataWithDs()
  if GWorld:IsStandAlone() then
    self:TrySyncTeamInSingleGame()
  else
    self:TrySyncTeamInMultiGame()
  end
end

function M:OnAvatarStatusUpdate(OldStatus, NewStatus)
  if AvatarUtils:HasAvatarStatusChanged(OldStatus, NewStatus, TeamCommon.InStatusShouldDeleteInvite) then
    local bCantAgreeInvite = true
    for _, StateEnum in ipairs(TeamCommon.CanEnterMultiGameStatus) do
      if self:GetAvatar():CheckCanSetStatus(nil, StateEnum) then
        bCantAgreeInvite = false
        break
      end
    end
    if bCantAgreeInvite and TeamModel:GetBackInviteInfo() then
      self:SendTeamRefuseInvite(false)
      self:ShutDownTeamInvite()
    end
  end
end

function M:Destory()
  M.HeadUIs = {}
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  EventManager:RemoveEvent(EventID.OnAvatarStatusUpdate, self)
  M.Super.Destory(self)
end

function M:GetModel()
  return TeamModel
end

function M:GetEventName()
  return EventID.TeamControllerEvent
end

function M:ShowToast(Text, Duration)
  DebugPrint(LXYTag, "\231\187\132\233\152\159Toast", Text)
  M.Super.ShowToast(self, Text, Duration, {bPopWait = true})
end

function M:OpenHeadUI(ParentWidget, bBattle)
  local HeadUI = self:GetUIMgr(ParentWidget):LoadUINew(TeamCommon.HeadUIName, ParentWidget, bBattle)
  M.HeadUIs[ParentWidget] = HeadUI
  return HeadUI
end

function M:GetHeadUI(ParentWidget)
  return M.HeadUIs[ParentWidget]
end

function M:ClearHeadUI(ParentWidget)
  M.HeadUIs[ParentWidget] = nil
end

function M:OpenKickMemberDialog(AvatarInfo, ParentWidget)
  local Params = {
    RightCallbackFunction = function()
      self:SendTeamKickMember(AvatarInfo.Uid)
    end,
    ShortText = string.format(GText("UI_Team_Kick_Content"), AvatarInfo.Nickname)
  }
  self:GetUIMgr(ParentWidget):ShowCommonPopupUI(TeamCommon.KickConfirmDialog, Params, ParentWidget)
end

function M:ShutDownTeamInvite()
  if self:IsExistTimer(self.InviteRecvTimer) then
    self:StopTimer(self.InviteRecvTimer)
  end
  TeamModel:CleanInviteInfo()
end

function M:SendTeamKickMember(Uid)
  self:GetAvatar():TeamKickMember(Uid)
end

function M:RecvTeamKickMember(ErrCode, Uid)
  if not self:CheckError(ErrCode, true) then
    return
  end
  self:NotifyEvent(TeamCommon.EventId.TeamKickMember, Uid)
end

function M:SendTeamInvite(Uid)
  local Timer = TeamModel:GetInviteSendBox()[Uid]
  if Timer then
    return
  end
  self:GetAvatar():TeamInvite(Uid)
end

function M:RecvTeamInvite(ErrCode, Uid)
  local Timer = TeamModel:GetInviteSendBox()[Uid]
  if Timer then
    return
  end
  if not self:CheckError(ErrCode, true) then
    return
  end
  local TimerKey = self:SetUpDoInviteTimer(Uid, TeamCommon.LoopTimerInterval)
  TeamModel:AddSentInvite(Uid, TimerKey)
  self:ShowToast(GText("UI_Team_InviteSend"))
  self:NotifyEvent(TeamCommon.EventId.TeamInvite, Uid)
end

function M:SendTeamRefuseInvite(bAutoRefuse)
  local InviteInfo = TeamModel:GetBackInviteInfo()
  if not InviteInfo then
    self:CheckError(ErrorCode.RET_TEAM_INVATE_NOT_EXIST, true)
    self:NotifyEvent(TeamCommon.EventId.TeamInviteFailed, ErrorCode.RET_TEAM_INVATE_NOT_EXIST)
    return
  end
  local Uid = InviteInfo.Uid
  if self:IsExistTimer(self.InviteRecvTimer) then
    self:StopTimer(self.InviteRecvTimer)
  end
  if TeamModel:PopInviteInfo() then
    self:AddTimer(0.01, function()
      self:SetUpBeInviteTimer(TeamCommon.LoopTimerInterval)
    end, false, 0, nil, true)
  end
  self:GetAvatar():TeamRefuseInvite(Uid, bAutoRefuse)
end

function M:SendSetTeamOrientation(NewTeamOrientation)
  self:GetAvatar():SetTeamOrientation(NewTeamOrientation)
end

function M:SendVoteStartBattle(bAccepted)
  self:GetAvatar():VoteStartBattle(bAccepted)
end

function M:SendTeamAgreeInvite(Uid)
  self:GetAvatar():TeamAgreeInvite(Uid)
  local InviteView = self:GetView(GWorld.GameInstance, TeamCommon.TipUIName)
  if IsValid(InviteView) then
    InviteView:Close()
  end
end

function M:RecvTeamAgreeInvite(ErrCode, Uid)
  if not self:CheckError(ErrCode, true) then
    self:NotifyEvent(TeamCommon.EventId.TeamInviteFailed, ErrCode)
    self:SendTeamRefuseInvite(false)
    return
  end
  local InviteInfo = TeamModel:GetBackInviteInfo()
  if not InviteInfo and Uid ~= InviteInfo.Uid then
    self:CheckError(ErrorCode.RET_TEAM_INVATE_NOT_EXIST, true)
    TeamModel:PopInviteInfo()
    return
  end
  self:ShutDownTeamInvite()
  self:NotifyEvent(TeamCommon.EventId.TeamAgreeInvite, Uid)
end

function M:SendTeamLeave()
  self:GetAvatar():TeamLeave()
end

function M:RecvTeamLeave(ErrCode, bKick)
  if not self:CheckError(ErrCode, true) then
    return
  end
  local OldTeamData = TeamModel:GetTeam()
  if not OldTeamData then
    return
  end
  local Text = GText("UI_Team_YouLeaveTeam")
  if bKick then
    Text = GText("UI_Team_YouBeKicked")
  elseif 1 == #TeamModel:GetTeam().Members then
    Text = GText("UI_Team_TeamDisband")
  end
  if GWorld:IsStandAlone() then
    self:ShowToast(Text)
  end
  TeamModel:SetTeam(nil)
  self:NotifyEvent(TeamCommon.EventId.TeamLeave, OldTeamData)
end

function M:SendTeamChangeLeader(NewLeaderUid)
  self:GetAvatar():TeamChangeLeader(NewLeaderUid)
end

function M:RecvTeamChangeLeader(ErrCode, NewLeaderUid)
  if not self:CheckError(ErrCode, true) then
    return
  end
  self:NotifyEvent(TeamCommon.EventId.TeamChangeLeader, NewLeaderUid)
end

function M:RecvTeamBeInvited(InviteInfo)
  if TeamModel:IsInviteExist(InviteInfo) then
    return
  end
  local bQueueEmpty = TeamModel.InviteRecvQueue:IsEmpty()
  TeamModel:PushInviteInfo(InviteInfo)
  if bQueueEmpty then
    self:SetUpBeInviteTimer(TeamCommon.LoopTimerInterval)
  end
end

function M:RecvTeamBeRefused(Uid)
  local TimerKey = TeamModel:GetInviteSendBox()[Uid]
  if not TimerKey then
    return
  end
  local Nickname = FriendController:GetModel():GetNicknameByUid(Uid)
  if Nickname then
    self:ShowToast(string.format(GText("UI_Team_FriendRefuse"), Nickname))
  end
  self:StopTimer(TimerKey)
  TeamModel:DelSentInvite(Uid)
  self:NotifyEvent(TeamCommon.EventId.TeamBeRefused, Uid)
end

function M:RecvTeamBeAgreed(Uid)
  local TimerKey = TeamModel:GetInviteSendBox()[Uid]
  if not TimerKey then
    return
  end
  local Nickname = FriendController:GetModel():GetNicknameByUid(Uid)
  if Nickname then
    self:ShowToast(string.format(GText("UI_Chat_SbJoin"), Nickname))
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_accept_invite", nil, nil)
  self:StopTimer(TimerKey)
  TeamModel:DelSentInvite(Uid)
  self:NotifyEvent(TeamCommon.EventId.TeamBeAgreed, Uid)
end

function M:RecvTeamOnAddPlayer(MemberInfo)
  TeamModel:AddTeamMember(MemberInfo)
  self:NotifyEvent(TeamCommon.EventId.TeamOnAddPlayer, MemberInfo)
  ChatController:SendMemberChangeTipsToTeam(MemberInfo, TeamCommon.EventId.TeamOnAddPlayer)
end

function M:RecvTeamOnDelPlayer(Uid, LeaveReason)
  local Member = TeamModel:GetTeamMember(Uid)
  if Member and not Member.bDsData then
    local Text = ""
    if Uid == self:GetAvatar().Uid and TeamModel:GetTeam() then
      self:RecvTeamLeave(ErrorCode.RET_SUCCESS, true)
      return
    end
    if LeaveReason == CommonConst.LeaveTeamReason.Willing then
      Text = GText("UI_Team_SomeOneLeave")
    elseif LeaveReason == CommonConst.LeaveTeamReason.Kick then
      Text = GText("UI_Team_SomeOneKicked")
    elseif LeaveReason == CommonConst.LeaveTeamReason.OffLine then
      Text = GText("UI_Team_SomeOneOffLine")
    end
    if GWorld:IsStandAlone() then
      self:ShowToast(string.format(Text, Member.Nickname))
    end
    TeamModel:DelTeamMember(Member)
    ChatController:SendMemberChangeTipsToTeam(Member, TeamCommon.EventId.TeamOnDelPlayer)
    self:NotifyEvent(TeamCommon.EventId.TeamOnDelPlayer, Member, LeaveReason)
  end
end

function M:RecvTeamOnInit(Team)
  TeamModel:SetTeam(Team)
  local TeamData = TeamModel:GetTeam()
  local TeamNumber = nil == TeamData and 0 or #TeamData.Members
  for i = 1, TeamNumber do
    local MemberInfo = TeamData.Members[i]
    ChatController:SendMemberChangeTipsToTeam(MemberInfo, TeamCommon.EventId.TeamOnAddPlayer)
  end
  self:ShutDownTeamInvite()
  self:NotifyEvent(TeamCommon.EventId.TeamOnInit, TeamModel:GetTeam())
end

function M:RecvDsServerDie()
  self:RecvTeamOnVoteInvalid()
  self:NotifyEvent(TeamCommon.EventId.TeamOnDsDie)
end

function M:RecvTeamOnChangeLeader(Uid)
  local NewLeader = TeamModel:GetTeamMember(Uid)
  local OldLeaderId = TeamModel:GetTeamLeaderId()
  if NewLeader and not NewLeader.bDsData then
    if Uid == self:GetAvatar().Uid then
      self:ShowToast(GText("UI_Team_YouBecomeLeader"))
    else
      self:ShowToast(string.format(GText("UI_Team_SomeOneBecomeLeader"), NewLeader.Nickname))
    end
    TeamModel:SetTeadLeaderId(Uid)
    self:NotifyEvent(TeamCommon.EventId.TeamOnChangeLeader, NewLeader, OldLeaderId)
  end
end

function M:RecvTeamOnVoteAgreed(Uid)
  local Member = TeamModel:GetTeamMember(Uid)
  if Member and not Member.bDsData then
    Member.HeadState = TeamCommon.HeadState.VoteEnter
  end
  self:NotifyEvent(TeamCommon.EventId.TeamOnVoteAgreed, Uid)
end

function M:RecvTeamOnVoteStart(DungeonId)
  TeamModel:CacheNowDungeonId(DungeonId)
  if not TeamModel:GetTeam() then
    return
  end
  for _, Member in ipairs(TeamModel:GetTeam().Members) do
    Member.HeadState = TeamCommon.HeadState.WaitingEnter
  end
  self:NotifyEvent(TeamCommon.EventId.TeamOnVoteStart, DungeonId)
end

function M:RecvTeamOnVoteRefused(Uid)
  TeamModel:CleanNowDungeonId()
  if not TeamModel:GetTeam() then
    return
  end
  for _, Member in ipairs(TeamModel:GetTeam().Members) do
    Member.HeadState = TeamCommon.HeadState.Normal
  end
  if Uid and not TeamModel:IsYourself(Uid) then
    local Member = TeamModel:GetTeamMember(Uid)
    if Member then
      Member.HeadState = TeamCommon.HeadState.VoteRefused
    end
  end
  self:NotifyEvent(TeamCommon.EventId.TeamOnVoteRefused)
end

function M:RecvTeamOnVoteInvalid(Ret)
  TeamModel:CleanNowDungeonId()
  if Ret then
    self:CheckError(Ret)
  end
  if not TeamModel:GetTeam() then
    return
  end
  for _, Member in ipairs(TeamModel:GetTeam().Members) do
    Member.HeadState = TeamCommon.HeadState.Normal
  end
  self:NotifyEvent(TeamCommon.EventId.TeamOnVoteInvalid)
end

function M:RecvTeamMemberPropChange(ChangeInfo, Uid)
  if not TeamModel:GetTeam() then
    return
  end
  local Member, Pos = TeamModel:GetTeamMember(Uid)
  DebugPrint(DebugTag, LXYTag, "RecvTeamMemberPropChange", Uid)
  if Member and not Member.bDsData then
    CommonUtils.MergeTables(Member, ChangeInfo)
    if Member.Offline then
      Member.HeadState = TeamCommon.HeadState.Offline
    end
    self:NotifyEvent(TeamCommon.EventId.TeamOnMemberChange, Member, Pos)
  end
end

function M:RecvTeamOnVoteEntering()
  TeamModel:CleanNowDungeonId()
  if not TeamModel:GetTeam() then
    return
  end
  for _, Member in ipairs(TeamModel:GetTeam().Members) do
    if Member.HeadState == TeamCommon.HeadState.WaitingEnter then
      Member.HeadState = TeamCommon.HeadState.VoteEnter
    end
  end
  self:NotifyEvent(TeamCommon.EventId.TeamOnVoteEntering)
end

function M:SendTeamRefresh()
  if TeamModel:GetTeam() and TeamModel:GetTeam().bDsData then
    return
  end
  if not GWorld:IsStandAlone() then
    TeamModel:CreateTeamDataWithDs(self)
  end
  local TeamInfo = TeamModel.CachedRecoveryTeamInfo
  if TeamInfo and not table.isempty(TeamInfo) then
    self:_ApplyRecvTeamRefresh(TeamInfo)
  else
    TeamModel.CachedRecoveryTeamInfo = {}
    if self:IsExistTimer(self.TeamRecoveryTimer) then
      self:StopTimer(self.TeamRecoveryTimer)
    end
    self:AddTimer(15, function()
      TeamModel.CachedRecoveryTeamInfo = nil
    end, false, 0, self.TeamRecoveryTimer)
  end
end

function M:RecvTeamRefresh(ErrCode, TeamInfo)
  if TeamModel.CachedRecoveryTeamInfo and table.isempty(TeamModel.CachedRecoveryTeamInfo) then
    self:_ApplyRecvTeamRefresh(TeamInfo)
  else
    TeamModel.CachedRecoveryTeamInfo = TeamInfo
  end
end

function M:_ApplyRecvTeamRefresh(TeamInfo)
  if not GWorld:IsStandAlone() then
    if not TeamModel:GetTeamBackup() then
      local Msg = string.format(GText("UI_Team_PlayerReOnline"), self:GetAvatar().Nickname)
      ChatController:RecvSystemInfoToTeam(Msg)
    end
    if TeamInfo then
      TeamModel:SetTeamBackup(TeamInfo)
    end
  else
    self:RecvTeamOnInit(TeamInfo)
  end
  TeamModel.CachedRecoveryTeamInfo = nil
end

function M:TrySyncTeamInSingleGame()
  DebugPrint(DebugTag, LXYTag, " TeamSyncDebug  \231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143 \229\141\149\228\186\186\230\156\172\230\136\150\229\164\167\228\184\150\231\149\140\239\188\140 TeamController::TrySyncTeamInBigWorld")
  if not TeamModel:GetTeam() then
    self:SendTeamRefresh()
  end
  self:NotifyEvent(TeamCommon.EventId.OnEnterSingelGame)
end

function M:TrySyncTeamInMultiGame()
  DebugPrint(DebugTag, LXYTag, " TeamSyncDebug \231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143 \229\164\154\228\186\186\229\137\175\230\156\172\239\188\140 TeamController::TrySyncTeamInMultiGame")
  if not GameState(GWorld.GameInstance) then
    DebugPrint(LXYTag, " TeamSyncDebug  \231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143 \229\164\154\228\186\186\229\137\175\230\156\172\228\184\173\239\188\140GameState\228\184\186\231\169\186, \230\151\160\230\179\149\229\136\164\230\150\173\230\152\175\229\144\166\230\156\137\229\164\154\229\144\141\231\142\169\229\174\182")
    return
  end
  DebugPrint("TeamSyncDebug  \231\156\139\231\156\139PlayerArray\231\154\132\230\149\176\233\135\143", #GameState(GWorld.GameInstance).PlayerArray:ToTable())
  DebugPrint("TeamSyncDebug  \231\156\139\231\156\139PhantomArray\231\154\132\229\128\188", #GameState(GWorld.GameInstance).PhantomArray:ToTable())
  self:SendTeamRefresh()
  PrintTable(TeamModel:GetTeam(), 3, LXYTag .. "TeamSyncDebug  \231\156\139\231\156\139TeamModel\231\154\132\233\152\159\228\188\141\229\128\188")
  self:NotifyEvent(TeamCommon.EventId.OnEnterMultiGame)
end

function M:SetUpAutoResetHeadStateTimer()
  self:StopTimer(self.AutoResetHeadStateTimer)
  self:AddTimer(TeamCommon.ResetHeadStateTime, function()
    for _, Member in ipairs(TeamModel.TeamData.Members) do
      Member.HeadState = TeamCommon.HeadState.Normal
    end
    self:NotifyEvent(TeamCommon.EventId.TeamOnVoteInvalid)
  end, false, 0, self.AutoResetHeadStateTimer)
end

function M:SetUpBeInviteTimer(Interval)
  local CurrInvite = TeamModel:GetBackInviteInfo()
  local InviteView = self:GetView(GWorld.GameInstance, TeamCommon.TipUIName)
  if not CurrInvite then
    DebugPrint(LXYTag, "\233\152\159\229\136\151\231\169\186\228\186\134\239\188\140\233\130\128\232\175\183\230\181\129\231\168\139\233\128\128\229\135\186")
    if IsValid(InviteView) then
      InviteView:Close()
      DebugPrint(LXYTag, "\229\133\179\233\151\173\233\130\128\232\175\183UI")
    end
    return
  end
  DebugPrint(LXYTag, "\229\188\128\229\167\139\231\187\132\233\152\159\229\143\151\233\130\128\232\175\183\229\174\154\230\151\182\229\153\168")
  if not self:GetUIMgr():GetUIObj("CommonChangeScene") then
    if not IsValid(InviteView) then
      DebugPrint(LXYTag, "\230\137\147\229\188\128\233\130\128\232\175\183UI")
      InviteView = self:OpenView(GWorld.GameInstance, TeamCommon.TipUIName, CurrInvite)
    else
      DebugPrint(LXYTag, "\233\135\141\231\148\168\233\130\128\232\175\183UI")
      InviteView:StopAllAnimations()
      InviteView:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      InviteView:Construct()
      InviteView:InitUIInfo(TeamCommon.TipUIName, false, nil, CurrInvite)
    end
  end
  local MaxRemainTime = GlobalConstant.TeamInviteStayTime.ConstantValue
  local InviteRemainTime = MaxRemainTime
  self:AddTimer(Interval, function()
    InviteRemainTime = InviteRemainTime - Interval
    if IsValid(InviteView) and not InviteView:HasFocusedDescendants() and self:IsGamepad() then
      DebugPrint(LXYTag, WarningTag, "\231\187\132\233\152\159\233\130\128\232\175\183UI\233\156\128\232\166\129\230\138\162\229\164\186\232\129\154\231\132\166\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
      InviteView:SetFocus()
    end
    if InviteRemainTime > 0 then
      self:NotifyEvent(TeamCommon.EventId.TeamInviteWaiting, InviteRemainTime / MaxRemainTime)
      return
    end
    self:StopTimer(self.InviteRecvTimer)
    self:NotifyEvent(TeamCommon.EventId.TeamInviteWaiting, 0)
  end, true, 0, self.InviteRecvTimer)
end

function M:SetUpDoInviteTimer(Uid, Interval)
  local CurrInviteSent = TeamModel:GetInviteSendBox()
  if not CurrInviteSent then
    DebugPrint(DebugTag, "SetUpDoInviteTimer: InviteSendBox is empty")
  end
  local MaxRemainTime = DataMgr.GlobalConstant.TeamInviteMax.ConstantValue * DataMgr.GlobalConstant.TeamInviteStayTime.ConstantValue + 1
  local InviteRemainTime = MaxRemainTime
  return self:AddTimer(Interval, function()
    InviteRemainTime = InviteRemainTime - Interval
    if InviteRemainTime > 0 then
      return
    end
    DebugPrint(DebugTag, "\229\143\145\229\135\186\229\142\187\231\154\132\231\187\132\233\152\159\233\130\128\232\175\183\229\183\178\231\187\143\232\182\133\230\151\182", Uid)
    self:RecvTeamBeRefused(Uid)
  end, true, 0, nil)
end

function M:DelTeamMemberWithDs(Eid)
  if TeamModel:GetTeam() and TeamModel:GetTeam().bDsData then
    DebugPrint(LXYTag, "TeamSyncDebug  TeamModel \229\176\157\232\175\149\231\167\187\233\153\164ds\233\152\159\229\143\139\230\149\176\230\141\174 ", Eid)
    local Member = TeamModel:GetTeamMember(Eid)
    if Member and Member.bDsData then
      DebugPrint(LXYTag, "TeamSyncDebug TeamModel Ds\233\152\159\229\143\139 \231\167\187\233\153\164\230\136\144\229\138\159 ", Eid)
      TeamModel:DelTeamMemberWithDs(Eid)
      self:NotifyEvent(TeamCommon.EventId.DsTeamOnDelPlayer, Member)
    end
  end
end

function M:AddTeamMemberWithDs(WorldContext, Eid)
  DebugPrint(LXYTag, "TeamSyncDebug TeamModel \229\176\157\232\175\149\230\183\187\229\138\160ds\233\152\159\229\143\139\230\149\176\230\141\174 ", Eid)
  local Res = TeamModel:AddTeamMemberWithDs(WorldContext, Eid)
  if not Res then
    return
  end
  DebugPrint(LXYTag, "TeamSyncDebug  Ds\233\152\159\229\143\139\230\183\187\229\138\160\230\136\144\229\138\159 ")
  local TeamData = TeamModel:GetTeam()
  local TeamDataBackup = TeamModel:GetTeamBackup()
  if not TeamDataBackup or #TeamData.Members > #TeamDataBackup.Members then
    local Member = TeamModel:GetTeamMember(Eid)
    if Member then
      local Msg = Member.Nickname .. GText("UI_JoinMatch")
      ChatController:RecvSystemInfoToTeam(Msg)
      self:ShowToast(Msg)
    end
  end
  local Member = TeamModel:GetTeamMember(Eid)
  self:NotifyEvent(TeamCommon.EventId.DsTeamOnAddPlayer, Member)
end

function M:DoCheckCanEnterDungeon(DungeonId)
  local TeamInfo = TeamModel:GetTeam()
  if TeamInfo then
    local bTeammateNotReady, WhoUids = TeamInfo:IsAnyMemberCanNotEnterDungeon()
    if bTeammateNotReady then
      self:ShowToast(GText("TOAST_DUNGEON_FAIL_UNABLE"))
      self:NotifyEvent(TeamCommon.EventId.TeamOnVoteAbort, WhoUids)
      self:SetUpAutoResetHeadStateTimer()
      return false
    end
    local CostNeed = DataMgr.Dungeon[DungeonId] and DataMgr.Dungeon[DungeonId].DungeonCost[1] or 0
    local MemberNames, WhoUids = {}, {}
    for _, TeamMember in pairs(TeamInfo.Members) do
      if CostNeed > TeamMember.ActionPoint then
        table.insert(MemberNames, TeamMember.Index .. "P")
        table.insert(WhoUids, TeamMember.Uid)
      end
      TeamMember.HeadState = TeamCommon.HeadState.CantEnterDungeon
    end
    if not table.isempty(WhoUids) then
      local MemberNameText = table.concat(MemberNames, "/")
      self:ShowToast(string.format(GText("DUNGEON_ENTER_FAILED_TOAST"), MemberNameText))
      self:NotifyEvent(TeamCommon.EventId.TeamOnVoteAbort, WhoUids)
      self:SetUpAutoResetHeadStateTimer()
      return false
    end
  end
  return true
end

function M:DoWhenEnterDungeonCheckFailed(RetCode, FailedMember)
  if RetCode ~= ErrorCode.RET_TEAM_DUNGEON_CHECK_FAILED then
    return
  end
  if not FailedMember or not next(FailedMember) then
    assert(false, "FailedMember is nil")
    return
  end
  DebugPrint(LXYTag, "gmy@M.EnterDungeonCallback FailedMember", FailedMember and #FailedMember)
  self:CheckError(RetCode)
end

_G.TeamController = M
return M
