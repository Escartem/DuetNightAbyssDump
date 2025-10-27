require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(RootPage)
  self.VoteMain = RootPage
  self.TeamHeadList = {}
  self.WB_Player:ClearChildren()
  self.WB_Player_L:ClearChildren()
  self.WB_Player_R:ClearChildren()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  for i, PlayerState in pairs(GameState.PlayerArray) do
    local Eid = PlayerState.Eid
    local TeamHead = self:CreateWidgetNew("TeamHead")
    TeamHead.Eid = Eid
    TeamHead:Init("Vote", PlayerState, i, true, PlayerState.Eid == MainPlayer.Eid, self)
    self.WB_Player:AddChild(TeamHead)
    self.TeamHeadList[Eid] = {
      TeamHead = TeamHead,
      PlayerState = PlayerState,
      Index = i
    }
  end
  self.bSelectContinue = false
  self.bSelectLeave = false
  self:AddDispatcher(EventID.UpdateVotePlayerActiveState, self, self.UpdateVotePlayerActiveState)
end

function M:UpdateVotePlayerActiveState(Eid, bIsInactive)
end

function M:OnPlayerVote(VoteValue, Eid, bMainPlayer, bFirstMainPlayer)
  if 0 == self.WB_Player_L:GetChildrenCount() and 0 == self.WB_Player_R:GetChildrenCount() then
    self:PlayAnimation(self.Left_In)
    self:PlayAnimation(self.Right_In)
  end
  if VoteValue == EVoteState.Continue then
    self:OnPlayerVoteContinue(Eid, bMainPlayer, bFirstMainPlayer)
  else
    self:OnPlayerVoteLeave(Eid, bMainPlayer, bFirstMainPlayer)
  end
end

function M:OnPlayerVoteContinue(Eid, bMainPlayer, bFirstMainPlayer)
  local TeamHead = self.TeamHeadList[Eid].TeamHead
  self:SortHead(TeamHead, self.WB_Player_R)
  TeamHead:Init("Vote", self.TeamHeadList[Eid].PlayerState, self.TeamHeadList[Eid].Index, false, bMainPlayer, self)
  if TeamHead == self.SelectedHead then
    self.SelectedHead:OnReleaseSelected(false)
    self.SelectedHead = nil
  end
  TeamHead:OnPlayerVoteContinue()
  if bMainPlayer then
    if not bFirstMainPlayer then
      self:PlayAnimationReverse(self.Left_ChangeColor)
    end
    self:PlayAnimation(self.Right_ChangeColor)
  end
  if (self.bSelectContinue or self.bSelectLeave) and 0 == self.WB_Player_L:GetChildrenCount() then
    self.bSelectLeave = false
  end
  if not self.bSelectContinue then
    self.bSelectContinue = true
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_select_continue", nil, nil)
end

function M:OnPlayerVoteLeave(Eid, bMainPlayer, bFirstMainPlayer)
  local TeamHead = self.TeamHeadList[Eid].TeamHead
  self.WB_Player_L:AddChild(TeamHead)
  TeamHead:Init("Vote", self.TeamHeadList[Eid].PlayerState, self.TeamHeadList[Eid].Index, false, bMainPlayer, self)
  if TeamHead == self.SelectedHead then
    self.SelectedHead:OnReleaseSelected(false)
    self.SelectedHead = nil
  end
  TeamHead:OnPlayerVoteLeave()
  if bMainPlayer then
    if not bFirstMainPlayer then
      self:PlayAnimationReverse(self.Right_ChangeColor)
    end
    self:PlayAnimation(self.Left_ChangeColor)
  end
  if (self.bSelectContinue or self.bSelectLeave) and 0 == self.WB_Player_R:GetChildrenCount() then
    self.bSelectContinue = false
  end
  if not self.bSelectLeave then
    self.bSelectLeave = true
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_select_finish", nil, nil)
end

function M:SortHead(TeamHead, Widget)
  local TmpList = Widget:GetAllChildren()
  Widget:ClearChildren()
  Widget:AddChild(TeamHead)
  for i, v in pairs(TmpList) do
    local PlayerState = v.PlayerState
    local Index = v.Index
    local bMainPlayer = v.bMainPlayer
    Widget:AddChild(v)
    v:Init("Vote", PlayerState, Index, false, bMainPlayer, self)
  end
end

function M:ChangeSelectedHead(TeamHead)
  self.VoteMain:OnGamePadOpenTeamInfo()
  if TeamHead == self.SelectedHead then
    print(_G.LogTag, "LXZ ChangeSelectedHead000", TeamHead:GetName())
    return
  end
  if self.SelectedHead then
    print(_G.LogTag, "LXZ ChangeSelectedHead", TeamHead:GetName(), self.SelectedHead:GetName())
    self.SelectedHead:OnReleaseSelected(true)
  end
  self.SelectedHead = TeamHead
end

function M:CloseAllAnchor()
  for i = 0, self.WB_Player_L:GetChildrenCount() do
    local Widget = self.WB_Player_L:GetChildAt(i)
    if Widget then
      Widget.Head_Anchor:Close()
    end
  end
  for i = 0, self.WB_Player:GetChildrenCount() do
    local Widget = self.WB_Player:GetChildAt(i)
    if Widget then
      Widget.Head_Anchor:Close()
    end
  end
  for i = 0, self.WB_Player_R:GetChildrenCount() do
    local Widget = self.WB_Player_R:GetChildAt(i)
    if Widget then
      Widget.Head_Anchor:Close()
    end
  end
end

function M:BP_GetDesiredFocusTarget()
  if 0 ~= self.WB_Player_L:GetChildrenCount() then
    return self.WB_Player_L:GetChildAt(0).Head_Team.Button_Area
  elseif 0 ~= self.WB_Player:GetChildrenCount() then
    return self.WB_Player:GetChildAt(0).Head_Team.Button_Area
  else
    return self.WB_Player_R:GetChildAt(0).Head_Team.Button_Area
  end
end

return M
