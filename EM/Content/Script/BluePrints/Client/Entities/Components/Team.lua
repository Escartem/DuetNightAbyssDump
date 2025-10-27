local TeamController = require("BluePrints.UI.WBP.Team.TeamController")
local Component = {}

function Component:EnterWorld()
  TeamController:Init()
end

function Component:LeaveWorld()
  TeamController:Destory()
end

function Component:TeamKickMember(Uid)
  DebugPrint("TeamKickMember", Uid)
  
  local function Cb(ErrCode)
    ErrCode = ErrCode or ErrorCode.RET_SUCCESS
    DebugPrint("TeamKickMember", ErrorCode:Name(ErrCode))
    TeamController:RecvTeamKickMember(ErrCode, Uid)
  end
  
  self:CallServer("TeamKickMember", Cb, Uid)
end

function Component:NotifyTeamMemberPropChange(ChangeData, Uid)
  DebugPrint("NotifyTeamMemberPropChange", Uid, CommonUtils.TableToString(ChangeData))
  TeamController:RecvTeamMemberPropChange(ChangeData, Uid)
end

function Component:TeamInvite(Uid)
  DebugPrint("TeamInvite", Uid)
  
  local function Cb(ErrCode)
    DebugPrint("TeamInvite", ErrorCode:Name(ErrCode))
    TeamController:RecvTeamInvite(ErrCode, Uid)
  end
  
  self:CallServer("TeamInvite", Cb, Uid)
end

function Component:TeamRefuseInvite(Uid, AutoRefuse)
  DebugPrint("TeamRefuseInvite", Uid, AutoRefuse)
  self:CallServerMethod("TeamRefuseInvite", Uid, AutoRefuse)
end

function Component:TeamRequestTeamInfo(TeamInfo)
  PrintTable(TeamInfo, 3, LXYTag .. "TeamRequestTeamInfo  ")
end

function Component:TeamAgreeInvite(Uid)
  DebugPrint("TeamAgreeInvite", Uid)
  
  local function Cb(ErrCode)
    DebugPrint("TeamAgreeInvite", ErrorCode:Name(ErrCode))
    TeamController:RecvTeamAgreeInvite(ErrCode, Uid)
  end
  
  self:CallServer("TeamAgreeInvite", Cb, Uid)
end

function Component:TeamLeave()
  DebugPrint("TeamLeave")
  
  local function Cb(ErrCode)
    DebugPrint("TeamLeave Callback", ErrorCode:Name(ErrCode))
    TeamController:RecvTeamLeave(ErrCode)
  end
  
  self:CallServer("TeamLeave", Cb)
end

function Component:TeamChangeLeader(NewLeaderUid)
  DebugPrint("TeamChangeLeader", NewLeaderUid)
  
  local function Cb(ErrCode)
    DebugPrint("TeamChangeLeader", ErrorCode:Name(ErrCode))
    TeamController:RecvTeamChangeLeader(ErrCode, NewLeaderUid)
  end
  
  self:CallServer("TeamChangeLeader", Cb, NewLeaderUid)
end

function Component:SetTeamOrientation(NewTeamOrientation)
  DebugPrint("SetTeamOrientation", NewTeamOrientation)
  self:CallServerMethod("SetTeamOrientation", NewTeamOrientation)
end

function Component:NotifyTeamInviteReceived(InviteInfo)
  PrintTable(InviteInfo, 100, "NotifyTeamInviteReceived  ")
  TeamController:RecvTeamBeInvited(InviteInfo)
end

function Component:NotifyTeamInviteRefused(Uid)
  DebugPrint("NotifyTeamInviteRefused", Uid)
  if type(Uid) == "table" then
    Uid = Uid.Uid
  end
  TeamController:RecvTeamBeRefused(Uid)
end

function Component:NotifyTeamMemberSelectWalnut(Uid, WalnutId)
  DebugPrint("NotifyTeamMemberSelectWalnut", Uid, WalnutId)
  EventManager:FireEvent(EventID.TeamSelectWalnut, Uid, WalnutId)
end

function Component:NotifyTeamMemberSelectTicket(Uid, TicketId)
  DebugPrint("NotifyTeamMemberSelectTicket", Uid, TicketId)
end

function Component:NotifyTeamInviteAgreed(Uid)
  DebugPrint("NotifyTeamInviteAgreed", Uid)
  TeamController:RecvTeamBeAgreed(Uid)
end

function Component:NotifyInitTeam(Team)
  PrintTable(Team, 100, "NotifyInitTeam  ")
  TeamController:RecvTeamOnInit(Team)
end

function Component:TeamReconnectNotify(Team)
  PrintTable(Team, 100, "TeamReconnectNotify  ")
  TeamController:RecvTeamRefresh(ErrorCode.RET_SUCCESS, Team)
end

function Component:NotifyAddMember(MemberInfo)
  PrintTable(MemberInfo, 10, "NotifyAddMember  ")
  TeamController:RecvTeamOnAddPlayer(MemberInfo)
end

function Component:NotifyDelMember(Uid, LeaveReason)
  DebugPrint("NotifyDelMember", Uid)
  if not UIManager(self):GetUI("DungeonSettlement") then
    EventManager:FireEvent(EventID.TeamMatchCancel)
  end
  TeamController:RecvTeamOnDelPlayer(Uid, LeaveReason)
end

function Component:NotifyChangeLeader(Uid)
  DebugPrint("NotifyChangeLeader", Uid)
  TeamController:RecvTeamOnChangeLeader(Uid)
end

function Component:VoteStartBattle(bAccepted, SquadId, Callback)
  bAccepted = bAccepted and true or false
  SquadId = SquadId or 0
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  print(_G.LogTag, "VoteStartBattle", bAccepted, SquadId)
  self:CallServer("VoteBattle", cb, bAccepted, SquadId)
end

function Component:TeamBattleEvent(EventName, ...)
  print(_G.LogTag, "TeamBattleEvent", EventName)
  local func = self["TeamBattleEvent_" .. EventName]
  if func then
    func(self, ...)
  else
    print(_G.LogTag, "Unknown TeamBattleEvent", EventName)
  end
end

function Component:TeamBattleEvent_StartVote(DungeonId, bMatch)
  DebugPrint("gmy@Component:TeamBattleEvent_StartVote", DungeonId)
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "Avatar is nil")
  local bIsInTeam = Avatar:IsInTeam()
  if bIsInTeam then
    local Panel = UIManager(self):GetUI("DungeonMatchTimingBar")
    if Panel and Panel.bClosing then
      UIManager(self):UnLoadUINew("DungeonMatchTimingBar")
    end
    UIManager(self):LoadUINew("DungeonMatchTimingBar", DungeonId, Const.DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING, bMatch)
    TeamController:RecvTeamOnVoteStart(DungeonId)
  else
    assert(false, "Not in team")
  end
end

function Component:TeamBattleEvent_OnMemberVote(Uid, Code)
  DebugPrint(DebugTag, LXYTag, "TeamBattleEvent_OnMemberVote", Uid)
  TeamController:RecvTeamOnVoteAgreed(Uid)
end

function Component:TeamBattleEvent_Refused(Uid, Code)
  DebugPrint("gmy@Component:TeamBattleEvent_Refused", Code)
  if Code == ErrorCode.RET_SUCCESS then
    EventManager:FireEvent(EventID.TeamMatchOneRefused, Uid)
  else
    DebugPrint("gmy@Team Component:TeamBattleEvent_Refused", Uid, GWorld:GetAvatar().Uid)
    local _, MemberIndex = TeamController:GetModel():GetTeamMember(Uid)
    if Uid == GWorld:GetAvatar().Uid then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_Miss_Challenge"), MemberIndex), 1.5)
    else
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_Miss_Online"), MemberIndex), 1.5)
    end
    EventManager:FireEvent(EventID.TeamMatchCancel)
  end
  TeamController:RecvTeamOnVoteRefused(Uid)
  self:TeamMatchOneRefused(Uid)
end

function Component:TeamMatchOneRefused(Uid)
  local CurSelectedDungeonId = TeamController:GetModel():GetNowDungeonId()
  DebugPrint("gmy@Team M:TeamMatchOneRefused", CurSelectedDungeonId)
  if CurSelectedDungeonId and DataMgr.Dungeon[CurSelectedDungeonId].IsWalnutDungeon then
    if UIManager(self):GetUI("WalnutChoice") then
      return
    end
    local TeamModel = TeamController:GetModel()
    if not TeamModel:IsYourself(Uid) then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Walnut_Giveup_Toast"), GText(TeamModel:GetTeamMember(Uid).Nickname)), 1.5)
    end
  elseif not TeamController:GetModel():IsYourself(Uid) then
    UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_REJECT"), 1.5)
  end
end

function Component:TeamBattleEvent_WaitEntering()
  DebugPrint("gmy@Component:TeamBattleEvent_WaitEntering")
  EventManager:FireEvent(EventID.TeamMatchStartEntering)
  TeamController:RecvTeamOnVoteEntering()
end

function Component:TeamBattleEvent_Matching()
  DebugPrint("gmy@Component:TeamBattleEvent_Matching")
  EventManager:FireEvent(EventID.TeamMatchStartMatching)
end

function Component:TeamBattleEvent_LeaveCancel()
  DebugPrint("gmy@Component:TeamBattleEvent_LeaveCancel")
  UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_LEAVETEAM"), 1.5)
  DebugPrint("gmy@Team Component:TeamBattleEvent_LeaveCancel", UIManager(self):GetUI("DungeonSettlement"))
  if not UIManager(self):GetUI("DungeonSettlement") then
    EventManager:FireEvent(EventID.TeamMatchCancel)
  end
  EventManager:FireEvent(EventID.InterruptWalnutSelect)
  TeamController:RecvTeamOnVoteRefused()
end

function Component:TeamBattleEvent_LeaderCancel()
  DebugPrint("gmy@Component:TeamBattleEvent_LeaderCancel")
  UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL"), 1.5)
  EventManager:FireEvent(EventID.TeamMatchCancel)
  local LeaderUid = TeamController:GetModel():GetTeamLeaderId()
  TeamController:RecvTeamOnVoteRefused(LeaderUid)
end

function Component:TeamBattleEvent_MemberCancel()
  DebugPrint("gmy@Component:TeamBattleEvent_MemberCancel")
  UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_LEAVETEAM"), 1.5)
  if not UIManager(self):GetUI("DungeonSettlement") then
    EventManager:FireEvent(EventID.TeamMatchCancel)
  end
  TeamController:RecvTeamOnVoteRefused()
end

function Component:TeamBattleEvent_EnterFailed(Ret)
  DebugPrint(ErrorTag, "gmy@Component:TeamBattleEvent_EnterFailed", Ret)
  TeamController:RecvTeamOnVoteInvalid(Ret)
  EventManager:FireEvent(EventID.TeamMatchCancel)
end

function Component:TeamBattleEvent_BattleFailed()
  DebugPrint("gmy@Component:TeamBattleEvent_BattleFailed")
  if not self:IsInBigWorld() then
    TeamController:RecvDsServerDie()
    self:ExitDungeon()
  end
  EventManager:FireEvent(EventID.TeamMatchCancel)
end

function Component:TeamBattleEvent_SelectWalnut()
  local DungeonId = TeamController:GetModel():GetNowDungeonId()
  local WalnutChoice = UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Depute, DungeonId)
  local WalnutId = TeamController:GetModel().WalnutId
  if WalnutId then
    WalnutChoice:SelectWalnutById(WalnutId)
  end
  EventManager:FireEvent(EventID.SelectWalnut)
end

function Component:TeamBattleEvent_WalnutSelectComplete()
  EventManager:FireEvent(EventID.WalnutSelectComplete)
end

function Component:TeamBattleEvent_SelectTicket()
  EventManager:FireEvent(EventID.SelectTicket)
  
  local function GetValidAvatar()
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      assert(Avatar, "Avatar is nil")
      return nil
    end
    return Avatar
  end
  
  local function OnRightConfirm(_, PackageData)
    local Avatar = GetValidAvatar()
    if not Avatar then
      return
    end
    local CurSelectedDungeonId = TeamController:GetModel():GetNowDungeonId()
    Avatar:SelectTicket(nil, CurSelectedDungeonId, PackageData.Content_1.TicketId)
  end
  
  local function OnCancelVote()
    local Avatar = GetValidAvatar()
    if Avatar then
      Avatar:VoteStartBattle(false)
    end
  end
  
  local CurSelectedDungeonId = TeamController:GetModel():GetNowDungeonId()
  local CommonDialog = UIManager(self):ShowCommonPopupUI(100123, {
    DungeonId = CurSelectedDungeonId,
    RightCallbackFunction = OnRightConfirm,
    LeftCallbackFunction = OnCancelVote,
    CloseBtnCallbackFunction = OnCancelVote,
    DontCloseWhenRightBtnClicked = true,
    AutoFocus = true,
    YesButtonText = GText("UI_CONFIRM_SELECTION")
  }, self)
end

return Component
