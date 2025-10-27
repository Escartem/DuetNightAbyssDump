local FriendModel = FriendController:GetModel()
local TeamModel = TeamController:GetModel()
local Component = {}

function Component:InitComp(Owner, MemberInfo, Index, bAnim)
  self.MemberInfo = MemberInfo
  self.Owner = Owner
  self.Panel_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Icon_Self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:UpdateTag()
  self:SetHeadState(self.MemberInfo.HeadState)
  self.Head_Team:SetHeadIconById(MemberInfo.HeadIconId, true)
  self.Head_Team:SetHeadFrame(MemberInfo.HeadFrameId)
  if TeamController:IsMobile() then
    self.Head_Anchor:SetPlacement(EMenuPlacement.MenuPlacement_BelowRightAnchor)
  end
  self.Head_Team:SetGamepadCursor()
  if not self.Owner.bBattle then
    self.Head_Team:SetHoldUp(true)
    self.Head_Team:BindOnClickEvent(function()
      self.Head_Anchor:Open(true)
    end)
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  if bAnim then
    self:PlayAnimation(self.Add)
  end
end

function Component:SetHeadState(HeadState)
  self.HeadState = HeadState or self.MemberInfo.HeadState
  if not self.HeadState then
    self.HeadState = TeamCommon.HeadState.Normal
  end
  if self.HeadState == TeamCommon.HeadState.Normal then
    self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  else
    self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:StopAllAnimations()
  if self.HeadState == TeamCommon.HeadState.VoteEnter then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:PlayAnimation(self.Agree)
  elseif self.HeadState == TeamCommon.HeadState.WaitingEnter then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:PlayAnimation(self.WaitLoop, 0, 0)
  elseif self.HeadState == TeamCommon.HeadState.Offline then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:PlayAnimation(self.Disconnect)
  elseif self.HeadState == TeamCommon.HeadState.CantEnterDungeon then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(4)
    self:PlayAnimation(self.UnableTeam)
  elseif self.HeadState == TeamCommon.HeadState.VoteRefused then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(3)
    self:PlayAnimation(self.Disagree, 0, 1, EUMGSequencePlayMode.Forward, 1.0, false)
  end
end

function Component:OnAnimationFinishedComp(InAnim)
  if InAnim == self.Add then
    self.Owner:ProcessAddQueue()
  elseif InAnim == self.Quit then
    DebugPrint(DebugTag, LXYTag, "ProcessDelQueueInner  ", self.MemberInfo.Uid)
    self:StopAllAnimations()
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:RemoveFromParent()
    self.Owner.WB_Player:AddChild(self)
    self.Owner:ProcessDelQueue(self)
  elseif InAnim == self.Disagree then
    self.MemberInfo.HeadState = TeamCommon.HeadState.Normal
    self:SetHeadState()
  end
end

function Component:OnGetMenuContentComp(Anchor)
  if not self.Head_Team.bSelected then
    return
  end
  
  local function InitTeamKickBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Team_Kick")
    
    function Content.Callback()
      TeamController:OpenKickMemberDialog(AvatarInfo, FriendController:GetView(self))
      self.Head_Anchor:Close()
    end
  end
  
  local function InitTeamLeaderTransBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Team_Transfer")
    
    function Content.Callback()
      TeamController:SendTeamChangeLeader(AvatarInfo.Uid)
      self.Head_Anchor:Close()
    end
  end
  
  local function InitShowRecordBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_ShowRecord")
    
    function Content.Callback()
      if TeamModel:IsYourself(AvatarInfo.Uid) then
        PersonInfoController:OpenView()
      else
        TeamController:GetAvatar():CheckOtherPlayerPersonallInfo(AvatarInfo.Uid)
      end
      self.Head_Anchor:Close()
    end
  end
  
  local function InitLeaveTeamBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Team_Leave")
    
    function Content.Callback()
      TeamController:SendTeamLeave()
      self.Head_Anchor:Close()
    end
  end
  
  local function InitAddFriendBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Friend_AddFriend")
    
    function Content.Callback()
      self.Head_Anchor:Close()
      FriendController:OpenAddFriendDialog(self, AvatarInfo)
    end
  end
  
  local Switch = {}
  if TeamModel:IsYourself(self.MemberInfo.Uid) then
    if TeamModel:GetTeam() then
      Switch = {InitLeaveTeamBtn, InitShowRecordBtn}
    else
      Switch = {InitShowRecordBtn}
    end
  else
    if TeamModel:IsTeamLeader(TeamModel:GetAvatar().Uid) then
      Switch = {
        InitTeamKickBtn,
        InitTeamLeaderTransBtn,
        InitShowRecordBtn
      }
    else
      Switch = {InitShowRecordBtn}
    end
    if not FriendModel:GetFriendDict()[self.MemberInfo.Uid] then
      table.insert(Switch, InitAddFriendBtn)
    end
  end
  return ChatController:OpenPlayerBtnList(self, self.MemberInfo, Switch)
end

function Component:OnMenuOpenChangedComp(bOpen)
  if bOpen then
    self.Owner.bOpenBtnList = true
    self.Owner.OpenedUid = self.MemberInfo.Uid
    return
  end
  if self.Head_Team then
    self.Head_Team:PlayNormal()
  end
  if self.Owner.FocusUIByUid and TeamController:IsGamepad() then
    self.Owner:FocusUIByUid(self.Owner.OpenedUid)
  end
  self.Owner.bOpenBtnList = false
  self.Owner.OpenedUid = nil
end

function Component:OnTeammateDelete()
  DebugPrint(DebugTag, LXYTag, "Quit  ", self.MemberInfo.Uid)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:PlayAnimation(self.Quit)
end

function Component:PlayMove(bReverse)
  DebugPrint(DebugTag, LXYTag, "PlayMove , MoveUI ", self.MemberInfo.Uid)
  self:UpdateTag()
  if bReverse then
    self:PlayAnimationReverse(self.Slide_Left)
  else
    self:PlayAnimationForward(self.Slide_Left)
  end
end

function Component:UpdateTag()
  local Uid = self.MemberInfo.Uid
  self.Index = self.MemberInfo.Index
  if self.Index then
    self.Tag_Team:Init(TeamModel:IsTeamLeader(Uid), self.Index, Uid)
  else
    self.Tag_Team:Init(false, 1, Uid)
  end
end

return Component
