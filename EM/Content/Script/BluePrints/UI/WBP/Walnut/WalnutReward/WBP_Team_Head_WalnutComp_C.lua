local Component = {}
local HeadState = {
  Normal = 1,
  Agree = 2,
  Disconnent = 3,
  WaitLoop = 4
}

function Component:InitComp(...)
  local PlayerState, Index, IsFirstInit, bMainPlayer, RootPage, bNotInDungeon, bTeamLeader = ...
  self.RootPage = RootPage
  self.bNotInDungeon = bNotInDungeon
  self:SetHeadState()
  self:SetHeadInfo(PlayerState, Index, bMainPlayer, bTeamLeader)
  self.IsChosen = false
  if IsFirstInit then
    self.IsInFinish = false
    self:PlayAnimation(self.In)
    self:BindAnimation()
  end
  self.Head_Team:BindOnMouseHover(function(bHovered)
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    elseif bHovered then
      self.Head_Anchor:Open(true)
    else
      self.Head_Anchor:Close()
    end
  end)
  self.Head_Team:BindOnClickEvent(function()
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      if UIManager(self):GetUIObj("WalnutReward") then
        local WalnutReward = UIManager(self):GetUIObj("WalnutReward")
        WalnutReward.State = 3
        WalnutReward:UpdateCommonKeys("B", GText("UI_Controller_ClosePlayer"))
        WalnutReward:RecordCurrentTeamMemberFocus()
      end
      if UIManager(self):GetUIObj("WalnutChoice") then
        local WalnutChoice = UIManager(self):GetUIObj("WalnutChoice")
        WalnutChoice.State = 4
        WalnutChoice:UpdateCommonKeys("B", GText("UI_Controller_ClosePlayer"))
      end
    end
    self.RootPage:ChangeSelectedHead(self)
    self.Head_Anchor:Open(true)
  end)
  self.Head_Team:SetHoldUp(true)
  self.Head_Anchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.Panel_Level:SetVisibility(ESlateVisibility.Collapsed)
end

function Component:OnMenuOpenChanged(IsOpen)
  UIManager(self):SetIsMenuAnchorOpen(IsOpen)
  if not IsOpen and self.Head_Team.bSelected then
    self:PlayAnimation(self.Normal)
    self.Head_Team:PlayNormal()
  end
end

function Component:BindAnimation()
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self.IsInFinish = true
      if self.IsChosen then
        self:PlayAnimation(self.Agree)
      else
        self:PlayAnimation(self.WaitLoop, 0, 0)
      end
    end
  })
end

function Component:SetHeadInfo(...)
  local PlayerState, Index, bMainPlayer, bTeamLeader = ...
  if not PlayerState then
    return
  end
  local Uid = PlayerState.Eid
  if self.bNotInDungeon then
    self.PlayerState = PlayerState
    self.bMainPlayer = bMainPlayer
    self:SetHeadIconByRoleId(PlayerState)
    self.PlayerLevel = PlayerState.Level
    self.PlayerName = PlayerState.Nickname
    Uid = PlayerState.Uid
  else
    self.PlayerState = PlayerState
    if self.PlayerState.OnRepbIsEMInactiveDelegate then
      self.PlayerState.OnRepbIsEMInactiveDelegate:Add(self, self.OnPlayerInactive)
    end
    self.bMainPlayer = bMainPlayer
    self:SetHeadIconByRoleId(PlayerState)
    self.PlayerLevel = PlayerState.PlayerLevel
    self.PlayerName = PlayerState.PlayerName
  end
  self.Index = Index
  local DsMember = TeamController:GetModel():GetTeamMember(Uid)
  if DsMember then
    self.Index = DsMember.Index
    Uid = DsMember.Uid
  end
  self.Tag_Team:Init(bTeamLeader, self.Index, Uid)
  if bMainPlayer then
    self.Icon_Self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Icon_Self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:SetHeadState()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function Component:SetHeadIconByRoleId(PlayerState)
  self.Head_Team:SetHeadIconById(PlayerState.HeadIconId, true)
  self.Head_Team:SetHeadFrame(PlayerState.HeadFrameId)
end

function Component:OnPlayerInactive()
  self:WalnutHeadStopAllAnimation()
  if self.PlayerState.bIsEMInactive then
    self:PlayAnimation(self.Disconnect)
  elseif self.IsChosen then
    self:PlayAnimation(self.Agree)
  else
    self:PlayAnimation(self.WaitLoop, 0, 0)
  end
end

function Component:SetIsChosenState(IsChosen)
  if self.IsChosen == IsChosen then
    return
  end
  self.IsChosen = IsChosen
  if self.IsInFinish then
    self:WalnutHeadStopAllAnimation()
    if IsChosen then
      self:PlayAnimation(self.Agree)
    else
      self:PlayAnimation(self.WaitLoop, 0, 0)
    end
  end
end

function Component:WalnutHeadStopAllAnimation()
  self:StopAnimation(self.WaitLoop)
  self:StopAnimation(self.Agree)
  self:StopAnimation(self.Disconnect)
  self:StopAnimation(self.Normal)
end

function Component:OnReleaseSelected(bNeedBubbleOut)
  self.Head_Team:PlayNormal()
end

function Component:OnGetMenuContentComp(Anchor)
  return self:OpenPlayerBubble()
end

function Component:OpenPlayerBubble()
  local PlayerBubbleWidget = UIManager(self):_CreateWidgetNew("VotePlayerBubble")
  PlayerBubbleWidget:Init(self.PlayerLevel, self.PlayerName, self.bVoteContinue)
  return PlayerBubbleWidget
end

return Component
