require("UnLua")
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local TeamModel = TeamController:GetModel()
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0
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
  self.HB_My:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WB_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if not self.IsAddingToParent then
    self:RegisterEvent()
  end
  DebugPrint(LXYTag, "\231\187\132\233\152\159\229\164\180\229\131\143\231\149\140\233\157\162Construct , IsAddingToParent", self.IsAddingToParent)
end

function M:_UpdateMemberTag(Uid)
  if Uid == TeamModel:GetAvatar().Uid then
    self.Head_My:UpdateTag()
  elseif self.Teammate2UI[Uid] then
    self.Teammate2UI[Uid]:UpdateTag()
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
  Utils.Traceback(LXYTag, "\231\187\132\233\152\159\229\164\180\229\131\143\229\138\160\228\186\186Uid " .. Member.Uid .. " Name " .. Member.Nickname)
  self:AddTimer(self.Normal:GetEndTime(), function()
    self:AddTeammateUI(Member, true, nil, Member.Index)
  end)
end

function M:ProcessDelQueue()
  for _, HeadUI in pairs(self.Teammate2UI) do
    HeadUI:PlayAnimation(HeadUI.Normal)
  end
  self:PlayAnimation(self.Normal)
  if not next(self.Teammate2UI) then
    self.WB_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.DelQueue:IsEmpty() then
    DebugPrint(DebugTag, LXYTag, "ProcessDelQueue , empty")
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
  Utils.Traceback(LXYTag, "\231\187\132\233\152\159\229\164\180\229\131\143\229\135\143\228\186\186Uid " .. Uid)
  self:AddTimer(self.Normal:GetEndTime(), function()
    self:DelTeammateUI(Uid)
  end)
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  self.ParentWidget, self.bBattle = ...
  self:AppendToParent(self.ParentWidget)
  self:InitHeadItem(false)
end

function M:RegisterEvent()
  TeamController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == TeamCommon.EventId.TeamOnAddPlayer then
      local MemberInfo = (...)
      if MemberInfo.Uid == TeamModel:GetAvatar().Uid then
        return
      end
      if not self.Teammate2UI[MemberInfo.Uid] then
        self.AddQueue:PushFront(MemberInfo)
        if not self.bAddQueueProcessing then
          self.bDelQueueProcessing = true
          self:ProcessAddQueue()
        end
      end
    elseif EventId == TeamCommon.EventId.TeamOnDelPlayer then
      local MemberInfo = (...)
      if MemberInfo.Uid == TeamModel:GetAvatar().Uid then
        return
      end
      if self.Teammate2UI[MemberInfo.Uid] then
        self.DelQueue:PushFront(MemberInfo.Uid)
        if not self.bDelQueueProcessing then
          self.bAddQueueProcessing = true
          DebugPrint(DebugTag, LXYTag, "ProcessDelQueueOuter")
          self:ProcessDelQueue()
        end
      end
    elseif EventId == TeamCommon.EventId.TeamOnInit then
      DebugPrint(WarningTag, LXYTag, "TeamController:TeamOnInit")
      self:InitHeadItem()
    elseif EventId == TeamCommon.EventId.TeamOnChangeLeader then
      local NewLeader, OldLeaderId = ...
      self:_UpdateMemberTag(NewLeader.Uid)
      self:_UpdateMemberTag(OldLeaderId)
    elseif EventId == TeamCommon.EventId.TeamLeave then
      self:InitHeadItem()
    elseif EventId == TeamCommon.EventId.TeamOnVoteAgreed then
      local Uid = (...)
      self:_UpdateOneHeadState(Uid)
    elseif EventId == TeamCommon.EventId.TeamOnVoteAbort then
      local Uids = (...)
      for _, Uid in ipairs(Uids) do
        self:_UpdateOneHeadState(Uid)
      end
    elseif EventId == TeamCommon.EventId.TeamOnVoteStart or EventId == TeamCommon.EventId.TeamOnVoteInvalid or EventId == TeamCommon.EventId.TeamOnVoteRefused or EventId == TeamCommon.EventId.TeamOnVoteEntering then
      self:UpdateAllHeadState()
    elseif EventId == TeamCommon.EventId.TeamOnMemberChange then
      local Member, Pos = ...
      local HeadUI = self:GetHeadUIByUid(Member.Uid)
      if HeadUI then
        HeadUI:Init(TeamCommon.HeadUser.Team, self, Member, Pos, false)
      end
    end
  end)
end

function M:_UpdateOneHeadState(Uid)
  local HeadUI = self:GetHeadUIByUid(Uid)
  if HeadUI then
    HeadUI:SetHeadState()
  end
end

function M:UpdateAllHeadState()
  for _, HeadUI in pairs(self.Teammate2UI) do
    HeadUI:SetHeadState()
  end
  self.Head_My:SetHeadState()
end

function M:GetHeadUIByUid(Uid)
  if Uid == TeamModel:GetAvatar().Uid then
    return self.Head_My:IsVisible() and self.Head_My or nil
  end
  return self.Teammate2UI[Uid]
end

function M:InitHeadItem(bAnim)
  DebugPrint(WarningTag, LXYTag, "teamMainView:InnitHaditem, bBattle", self.bBattle)
  if nil == bAnim then
    bAnim = true
  end
  self.WB_Player:ClearChildren()
  self.TeammateCount = 0
  self.Teammate2UI = {}
  self.bAddQueueProcessing = false
  self.bDelQueueProcessing = false
  local TeamData = TeamModel:GetTeam()
  self:OnInitAddBtn()
  if self.bBattle then
    self.HB_My:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if not TeamData then
      return
    end
  else
    self.HB_My:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if not TeamData then
      local MyFakeMember = GWorld:GetAvatar()
      self:AddTeammateUI(MyFakeMember, false, self.Head_My)
      return
    end
  end
  for i, Member in ipairs(TeamData.Members) do
    DebugPrint(DebugTag, LXYTag, "TeamMainView InitHeadItem", i, Member.Uid)
    if not TeamModel:IsYourself(Member.Uid) then
      if not self.WB_Player:IsVisible() then
        self.WB_Player:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self:AddTeammateUI(Member, bAnim, nil, i)
    elseif not self.bBattle then
      self:AddTeammateUI(Member, false, self.Head_My, i)
    end
  end
end

function M:PlayMove(bReverse, Speed)
  Speed = Speed or 1.0
  if bReverse then
    self:PlayAnimationReverse(self.Slide_Left, Speed)
  else
    self:PlayAnimationForward(self.Slide_Left, Speed)
  end
end

function M:Close()
  self.IsAddingToParent = false
  M.Super.Close(self)
end

function M:Destruct()
  DebugPrint(LXYTag, "\231\187\132\233\152\159\229\164\180\229\131\143\231\149\140\233\157\162Destruct , IsAddingToParent", self.IsAddingToParent)
  if not self.IsAddingToParent then
    TeamController:ClearHeadUI(self.ParentWidget)
    TeamController:UnRegisterEvent(self)
    self:RemoveFromParent()
    DebugPrint(LXYTag, "\231\187\132\233\152\159\231\149\140\233\157\162\230\158\144\230\158\132\228\184\173....")
    PrintTable(self.ListenEvent, LXYTag, "\228\186\139\228\187\182\229\136\151\232\161\168")
    M.Super.Destruct(self)
  end
end

return M
