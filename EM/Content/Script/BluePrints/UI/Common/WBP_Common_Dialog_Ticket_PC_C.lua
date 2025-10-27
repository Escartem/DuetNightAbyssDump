require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  self:AddDispatcher(EventID.TeamMatchOneRefused, self, self.OnTeamMatchCancel)
  self:AddDispatcher(EventID.TeamMatchStartMatching, self, self.OnTeamMatchStartMatching)
  self:AddDispatcher(EventID.DungeonSelectTicketEnd, self, self.OnDungeonSelectTicketEnd)
  self:AddDispatcher(EventID.TeamMatchCancel, self, self.OnTeamMatchCancel)
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.Owner = Owner
  self.DungeonId = Params.DungeonId
  self:InitItemList(self.DungeonId)
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "NO AVATAR")
  self.bIsInTeam = Avatar:IsInMultiSettlement() or Avatar:IsInTeam()
  self.bIsInMultiDungeon = Avatar:IsInMultiDungeon()
  if self.bIsInTeam then
    self:BindDialogEvent("OnRightBtnClicked", self.OnRightBtnClicked)
    self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.CountdownSeconds = DataMgr.GlobalConstant.TicketSelectTime.ConstantValue
    self:StartSelectCountDown()
  elseif self.bIsInMultiDungeon then
    self:BindDialogEvent("OnRightBtnClicked", self.OnRightBtnClicked)
    self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.CountdownSeconds = DataMgr.GlobalConstant.TicketSelectTime.ConstantValue
    self:StartSelectCountDownInDungeon()
  else
    self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnRightBtnClicked()
  self.Owner:ForbidRightBtn(true)
end

function M:InitItemList(DungeonId)
  self.TicketItemTable = {}
  if not DungeonId then
    DebugPrint("ZDX_DungeonId is nil")
    return
  end
  DebugPrint("ZDX_DungeonId is", DungeonId)
  local DungeonData = DataMgr.Dungeon[DungeonId]
  self.TicketIds = {}
  if DungeonData.NoTicketEnter then
    table.insert(self.TicketIds, -1)
  end
  if DungeonData.TicketId then
    for i, Id in pairs(DungeonData.TicketId) do
      table.insert(self.TicketIds, Id)
    end
  end
  if 0 ~= #self.TicketIds then
    for i, Id in pairs(self.TicketIds) do
      local Item = self:CreateWidgetNew("DeputeTicket")
      Item.Button_Area.OnClicked:Add(self, function()
        self:OnItemClicked(Id)
      end)
      self.Item:AddChild(Item)
      Item:InitInfo(Id, self.Owner, self)
      self.TicketItemTable[Id] = Item
    end
  else
    DebugPrint("ZDX_TicketId List is nil")
  end
end

function M:OnContentFocusReceived(MyGeometry, InFocusEvent)
  if self.Item:GetChildAt(0) then
    self.Item:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.Item:GetChildAt(0) then
    self.Item:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:PostInitContent(Params, PopupData, Owner)
  self:OnItemClicked(self.TicketIds[1], true)
  self.LastTickedItem:SetFocus()
end

function M:OnItemClicked(TicketId, bNotPlayAnim)
  if self.bIsInTeam then
    self.Owner:ForbidRightBtn(false)
  end
  if TicketId then
    local bSelected = self.TicketItemTable[TicketId]:OnClicked()
    if self.LastTickedItem and self.LastTickedItem ~= self.TicketItemTable[TicketId] and bSelected then
      self.LastTickedItem:OnCellUnSelect()
    end
    if bSelected then
      if not bNotPlayAnim then
        AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
      end
      self.LastTickedItem = self.TicketItemTable[TicketId]
      self.TicketId = TicketId
    else
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_disable", nil, nil)
    end
  end
end

function M:PackageData()
  return {
    TicketId = self.TicketId
  }
end

function M:StartSelectCountDown()
  local EndTime = TimeUtils.NowTime() + self.CountdownSeconds
  self:AddTimer(0.1, function()
    local RemainSeconds = math.max(0, math.floor(EndTime - TimeUtils.NowTime()))
    self.Text_CountDown:SetText(tostring(RemainSeconds))
    if RemainSeconds <= 0 then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      Avatar:VoteStartBattle(false)
      self.Owner:OnClose()
      self:RemoveTimer("TicketSelectCountDown")
    end
  end, true, 0, "TicketSelectCountDown")
end

function M:StartSelectCountDownInDungeon()
  local GameState = UGameplayStatics.GetGameState(self)
  local Info = GameState.ClientTimerStruct:GetTimerInfo("SelectTicket")
  local NowTime = GameState.ReplicatedRealTimeSeconds
  self:AddTimer(0.1, function()
    local CurrentCountDown, CountDownPercent = self:GetRemainDungeonSelectTicketTime()
    local IntCountDown = math.ceil(CurrentCountDown)
    self.Text_CountDown:SetText(tostring(IntCountDown))
    if CurrentCountDown < 1 then
      EventManager:FireEvent(EventID.OnSelectTicketTimeout, self.TicketId)
      self.Owner:OnClose()
      self:RemoveTimer("TicketSelectCountDown")
    end
  end, true, 0, "TicketSelectCountDown")
end

function M:GetRemainDungeonSelectTicketTime()
  local GameState = UGameplayStatics.GetGameState(self)
  local Info = GameState.ClientTimerStruct:GetTimerInfo("SelectTicket")
  local RemainVoteTime = Info.Time - (GameState.ReplicatedRealTimeSeconds - Info.RealTimeSeconds)
  local RemainPercent = (GameState.ReplicatedRealTimeSeconds - Info.RealTimeSeconds) / Info.Time
  return RemainVoteTime, RemainPercent
end

function M:OnTeamMatchCancel()
  self.Owner:OnClose()
end

function M:OnTeamMatchStartMatching()
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "Avatar is nil")
  local bIsInTeam = Avatar:IsInTeam()
  if bIsInTeam then
    UIManager(self):LoadUINew("DungeonMatchTimingBar", self.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING, true)
  end
  self.Owner:OnClose()
end

function M:OnDungeonSelectTicketEnd()
  self.Owner:OnClose()
end

return M
