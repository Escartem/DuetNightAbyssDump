require("UnLua")
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local MaxTeammate = TeamCommon.MaxTeamMembers - 1
local TeamModel = TeamController:GetModel()
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.Teammate2UI = {}
  self.TeammateCount = 0
  self.DelQueue = Deque.New()
  self.AddQueue = Deque.New()
  self.bDelQueueProcessing = false
  self.bAddQueueProcessing = false
  self.SizeBox_Invite:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.SizeBox_Leave:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Leave:BindEventOnClicked(self, self.OnLeaveTeamClicked)
  self.Btn_Invite:BindEventOnClicked(self, self.OnInviteClicked)
  self.Btn_Leave:SetText(GText("UI_Team_Leave"))
  self.Btn_Invite:SetText(GText("UI_Friend_Invite"))
  self.WB_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_panel_expand", nil, nil)
  if GWorld:IsStandAlone() then
    TeamController:RegisterEvent(self, function(self, EventId, ...)
      if EventId == TeamCommon.EventId.TeamOnChangeLeader then
        local NewLeader, OldLeaderId = ...
        self:NotifyOnChangeLeader(NewLeader.Uid, OldLeaderId)
      elseif EventId == TeamCommon.EventId.TeamOnDelPlayer then
        local MemberInfo = (...)
        self:NotifyOnTeamDelPlayer(MemberInfo)
      elseif EventId == TeamCommon.EventId.TeamOnAddPlayer then
        local MemberInfo = (...)
        self:NotifyOnTeamAddPlayer(MemberInfo)
      end
    end)
  else
    TeamController:RegisterEvent(self, function(self, EventId, ...)
      if EventId == TeamCommon.EventId.DsTeamOnAddPlayer then
        local MemberInfo = (...)
        self:NotifyOnTeamAddPlayer(MemberInfo)
      elseif EventId == TeamCommon.EventId.DsTeamOnDelPlayer then
        local MemberInfo = (...)
        self:NotifyOnTeamDelPlayer(MemberInfo)
      end
    end)
  end
  if self.Button_Fold then
    self.Button_Fold.OnClicked:Add(self, self.Close)
    self.Button_Close.OnClicked:Add(self, self.Close)
  end
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  if not GWorld:IsStandAlone() then
    self.SizeBox_Invite:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.SizeBox_Leave:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.QueueTimerInterval = self.Mine.Normal:GetEndTime()
  self.WB_Player:ClearChildren()
  self.TeammateCount = 0
  self.Teammate2UI = {}
  local TeamData = TeamModel:GetTeam()
  for i = 1, #TeamData.Members do
    local Member = TeamData.Members[i]
    if not TeamModel:IsYourself(Member.Uid) then
      if not self.WB_Player:IsVisible() then
        self.WB_Player:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self:AddTeammateUI(Member, nil, i, true)
    else
      self:AddTeammateUI(Member, self.Mine, i)
    end
  end
  self:AddDispatcher(EventID.LoadUI, self, function(self, UIName)
    if UIName ~= (self.ConfigName or self.WidgetName) then
      self:StopAnimation(self.Auto_In)
      self:Close()
    end
  end)
end

function M:NotifyOnChangeLeader(Uid, OldLeaderId)
  self:_UpdateMemberTag(Uid)
  self:_UpdateMemberTag(OldLeaderId)
end

function M:NotifyOnTeamDelPlayer(MemberInfo)
  if TeamModel:IsYourself(MemberInfo.Uid) then
    self:Close()
    return
  end
  if self.Teammate2UI[MemberInfo.Uid] then
    self.DelQueue:PushFront(MemberInfo.Uid)
    if not self.bDelQueueProcessing then
      self.bAddQueueProcessing = true
      self:ProcessDelQueue()
    end
  end
end

function M:NotifyOnTeamAddPlayer(MemberInfo)
  if TeamModel:IsYourself(MemberInfo.Uid) then
    return
  end
  if not self.Teammate2UI[MemberInfo.Uid] then
    self.AddQueue:PushFront(MemberInfo)
    if not self.bAddQueueProcessing then
      self.bDelQueueProcessing = true
      self:ProcessAddQueue()
    end
  end
end

function M:ProcessAddQueue()
  if not next(self.Teammate2UI) then
    self.WB_Player:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.AddQueue:IsEmpty() then
    self.bAddQueueProcessing = false
    if not self.DelQueue:IsEmpty() then
      self:ProcessDelQueue()
    else
      self.bDelQueueProcessing = false
    end
    return
  end
  self.bAddQueueProcessing = true
  local Member = self.AddQueue:PopBack()
  self:AddTimer(self.QueueTimerInterval, function()
    self:AddTeammateUI(Member, nil, self.TeammateCount, true)
  end)
end

function M:ProcessDelQueue()
  for _, ItemUI in ipairs(self.Teammate2UI) do
    ItemUI:PlayAnimation(ItemUI.Normal)
  end
  self:PlayAnimation(self.Normal)
  if not next(self.Teammate2UI) then
    self.WB_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.DelQueue:IsEmpty() then
    self.bDelQueueProcessing = false
    if not self.AddQueue:IsEmpty() then
      self:ProcessAddQueue()
    else
      self.bAddQueueProcessing = false
    end
    return
  end
  self.bDelQueueProcessing = true
  local Uid = self.DelQueue:PopBack()
  self:AddTimer(self.QueueTimerInterval, function()
    self:DelTeammateUI(Uid)
  end)
end

function M:OnLeaveTeamClicked()
  local Params = {
    RightCallbackFunction = function()
      TeamController:SendTeamLeave()
    end
  }
  UIManager(self):ShowCommonPopupUI(TeamCommon.LeaveConfirmDialog, Params)
  self:Close()
end

function M:OnInviteClicked()
  FriendController:OpenView(self, FriendCommon.FriendTabType.MyFriend)
  self:Close()
end

function M:AddTeammateUI(Member, ItemUI, Index, bAnim)
  for _, Widget in pairs(self.WB_Player:GetAllChildren()) do
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
  end
  if not ItemUI then
    if self.WB_Player:GetChildrenCount() < MaxTeammate then
      ItemUI = self:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleInfoItem.UIName)
      self.WB_Player:AddChild(ItemUI)
    else
      ItemUI = self.WB_Player:GetChildAt(self.TeammateCount)
      ItemUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    ItemUI:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.TeammateCount = self.TeammateCount + 1
  end
  self.Teammate2UI[Member.Uid] = ItemUI
  ItemUI:Init(self, Member, Index, bAnim)
  if self.TeammateCount >= MaxTeammate then
    self.SizeBox_Invite:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:DelTeammateUI(Uid)
  for _, Widget in pairs(self.WB_Player:GetAllChildren()) do
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
  end
  local DelIndex = self.Teammate2UI[Uid].Pos
  for _, ItemUI in ipairs(self.Teammate2UI) do
    if DelIndex < ItemUI.Pos then
      ItemUI:PlayMove()
    end
  end
  self.Teammate2UI[Uid]:Close()
  self.Teammate2UI[Uid] = nil
  self.TeammateCount = self.TeammateCount - 1
  local ItemUI = self.WB_Player:GetChildAt(0)
  if IsValid(ItemUI) then
    ItemUI:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  end
end

function M:Close()
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_panel_shrink", nil, nil)
  M.Super.Close(self)
end

function M:Destruct()
  self.Btn_Leave:UnBindEventOnClicked(self, self.OnLeaveTeamClickeds)
  self.Btn_Invite:UnBindEventOnClicked(self, self.OnInviteClicked)
  TeamController:UnRegisterEvent(self)
  if self.Button_Fold then
    self.Button_Fold.OnClicked:Remove(self, self.Close)
    self.Button_Close.OnClicked:Remove(self, self.Close)
  end
  M.Super.Destruct(self)
end

return M
