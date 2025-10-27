local Component = {}

function Component:PlayerEnterSettlementOnlineArea(UidArray)
  DebugPrint("gmy@PlayerEnterSettlementOnlineArea", #UidArray, table.concat(UidArray, " "))
  self.SettlementUidArray = UidArray
end

function Component:PlayerExitSettlementOnlineArea(Uid)
  DebugPrint("gmy@PlayerExitSettlementOnlineArea", Uid)
  if self.SettlementUidArray then
    for Index, TeammateUid in ipairs(self.SettlementUidArray) do
      if TeammateUid == Uid then
        table.remove(self.SettlementUidArray, Index)
        break
      end
    end
  end
  DebugPrint("gmy@PlayerExitSettlementOnlineArea End", Uid, self.SettlementUidArray and #self.SettlementUidArray or 0)
end

function Component:OnExitSettlement()
  DebugPrint("gmy@OnExitSettlement")
  self.SettlementUidArray = nil
end

function Component:IsInMultiSettlement()
  DebugPrint("gmy@SettlementOnlineMgr Component:IsInMultiSettlement", self.SettlementUidArray, self.SettlementUidArray and #self.SettlementUidArray or 0)
  return self.SettlementUidArray and #self.SettlementUidArray > 1
end

function Component:NotifySettlementAreaPlayerSelectWalnut(Uid, WalnutId)
  DebugPrint("NotifySettlementAreaPlayerSelectWalnut", Uid, WalnutId)
  EventManager:FireEvent(EventID.SettlementSelectWalnut, Uid, WalnutId)
end

function Component:NotifySettlementAreaPlayerSelectTicket(Uid, TicketId)
  DebugPrint("NotifySettlementAreaPlayerSelectTicket", Uid, TicketId)
end

function Component:SettlementBattleEvent(EventName, ...)
  print(_G.LogTag, "SettlementBattleEvent", EventName)
  local func = self["SettlementBattleEvent_" .. EventName]
  if func then
    func(self, ...)
  else
    print(_G.LogTag, "Unknown SettlementBattleEvent", EventName)
  end
end

function Component:SettlementBattleEvent_StartVote(DungeonId, bMatch)
  DebugPrint("gmy@Component:SettlementBattleEvent_StartVote", DungeonId)
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "Avatar is nil")
  local Panel = UIManager(self):GetUI("DungeonMatchTimingBar")
  if Panel and Panel.bClosing then
    UIManager(self):UnLoadUINew("DungeonMatchTimingBar")
  end
  UIManager(self):LoadUINew("DungeonMatchTimingBar", DungeonId, Const.DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING, bMatch)
  TeamController:RecvTeamOnVoteStart(DungeonId)
end

function Component:SettlementBattleEvent_OnMemberVote(Uid)
  DebugPrint(DebugTag, LXYTag, "TeamBattleEvent_OnMemberVote", Uid)
  TeamController:RecvTeamOnVoteAgreed(Uid)
end

function Component:SettlementBattleEvent_Refused(Uid)
  DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_Refused", Uid)
  EventManager:FireEvent(EventID.TeamMatchOneRefused, Uid)
  TeamController:RecvTeamOnVoteRefused(Uid)
  if not TeamController:GetModel():IsYourself(Uid) then
    UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_REJECT"), 1.5)
  end
end

function Component:SettlementBattleEvent_SelectWalnut(DungeonId)
  DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_SelectWalnut", DungeonId)
  UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Settlement, DungeonId, GWorld.GameInstance.CombatData.TempTeamInfo)
  EventManager:FireEvent(EventID.SelectWalnut)
end

function Component:SettlementBattleEvent_WalnutSelectComplete()
  DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_WalnutSelectComplete")
  EventManager:FireEvent(EventID.WalnutSelectComplete)
end

function Component:SettlementBattleEvent_SelectTicket(DungeonId)
  DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_SelectTicket", DungeonId)
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
    DebugPrint("gmy@SettlementOnlineMgr SelectTicket", DungeonId, PackageData.Content_1.TicketId)
    
    local function Functor()
      local bIsSolo = #self.SettlementUidArray <= 1
      if bIsSolo then
        UIManager(self):LoadUINew("DungeonMatchTimingBar", DungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
      end
    end
    
    Avatar:SelectTicket(Functor, DungeonId, PackageData.Content_1.TicketId)
  end
  
  local function OnCancelVote()
    local Avatar = GetValidAvatar()
    if Avatar then
      Avatar:VoteStartBattle(false)
    end
  end
  
  local CurSelectedDungeonId = DungeonId
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

function Component:SettlementBattleEvent_Matching()
  DebugPrint("gmy@Component:SettlementBattleEvent_Matching")
  EventManager:FireEvent(EventID.TeamMatchStartMatching)
end

function Component:SettlementBattleEvent_WaitEntering()
  DebugPrint("gmy@Component:SettlementBattleEvent_WaitEntering")
  EventManager:FireEvent(EventID.TeamMatchStartEntering)
  TeamController:RecvTeamOnVoteEntering()
end

function Component:SettlementBattleEvent_BattleFailed()
  DebugPrint(ErrorTag, "gmy@Component:SettlementBattleEvent_BattleFailed")
  if not self:IsInBigWorld() then
    self:ExitDungeon()
  end
end

return Component
