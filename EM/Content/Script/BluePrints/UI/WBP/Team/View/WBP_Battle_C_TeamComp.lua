local TeamModel = TeamController:GetModel()
local Component = {}

function Component:InitTeam()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DebugPrint(DebugTag, LXYTag, "TeamSyncDebug \231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143\239\188\140WBP_Battle_C::OnLoaded, WBP_Battle_C_TeamComp::InitTeam")
  if self.Platform == "PC" then
    self.TeamInputAction = DataMgr.KeyboardMap.ShowTeamInfo
    self:ListenForInputAction(self.TeamInputAction.ActionName, EInputEvent.IE_Pressed, false, {
      self,
      self.OpenTeamInfo
    })
    UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange_Team)
  end
  self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
  TeamController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == TeamCommon.EventId.TeamOnInit then
      self:_ShowTeamPart(true)
    elseif EventId == TeamCommon.EventId.TeamLeave then
      if GWorld:IsStandAlone() then
        self:_ShowTeamPart(false)
      end
    elseif EventId == TeamCommon.EventId.TeamOnVoteAgreed then
      local Uid = (...)
      if Uid == TeamModel:GetAvatar().Uid then
        self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        self.HUD_MainBar:PlayAnimation(self.HUD_MainBar.Agree)
      end
    elseif EventId == TeamCommon.EventId.TeamOnChangeLeader then
      local NewLeader = (...)
      if self.Platform == "Mobile" then
        return
      end
      if TeamModel:IsYourself(NewLeader.Uid) and GWorld:IsStandAlone() then
        self.WBP_Team_Tag:Init(true, NewLeader.Index, NewLeader.Uid)
      end
    elseif EventId == TeamCommon.EventId.TeamOnVoteRefused then
      self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
    elseif EventId == TeamCommon.EventId.TeamOnVoteInvalid then
      self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
    elseif EventId == TeamCommon.EventId.TeamOnVoteEntering then
      self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.HUD_MainBar:PlayAnimation(self.HUD_MainBar.Agree)
    elseif EventId == TeamCommon.EventId.OnEnterMultiGame then
      self:RefreshTeamWhenEnterGame(true)
    elseif EventId == TeamCommon.EventId.OnEnterSingelGame then
      self:RefreshTeamWhenEnterGame(false)
    end
  end)
  self:AddDispatcher(EventID.OnRepEidPlayerState, self, function(self, Eid)
    DebugPrint("TeamSyncDebug OnRepEidPlayerState\229\144\140\230\173\165\233\152\159\229\143\139", Eid)
    if 0 ~= Eid then
      self:AddTeammateUI(Eid, true, nil)
    end
  end)
  self:AddDispatcher(EventID.OnDelPlayerState, self, self.RemoveBattleTeamBloodBar)
  self:AddDispatcher(EventID.OnRepOwnerEidPhantomState, self, function(self, Eid, OwnerEid)
    DebugPrint("TeamSyncDebug OnRepEidPlayerState\229\144\140\230\173\165\233\173\133\229\189\177", Eid, "OwnerEid:", OwnerEid)
    if 0 ~= Eid and 0 ~= OwnerEid then
      self:AddTeammateUI(Eid, false, nil)
    end
  end)
  self:AddDispatcher(EventID.OnDelPhantomState, self, self.RemoveBattleTeamBloodBar)
end

function Component:OnInputDeviceChange_Team()
  if not TeamModel:GetTeam() then
    return
  end
  if TeamController:IsGamepad() then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    local KeyIcons = UIUtils.GetIconListByActionName("ShowTeamInfo")
    self.Key_Team_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = KeyIcons[1]
        }
      }
    })
    DebugPrint("OnInputDeviceChange_Team Key_Gamepad Visibility", self.Key_Team_GamePad:IsVisible())
  elseif not TeamController:IsMobile() then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.Key_Team:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = self.TeamInputAction.Key
        }
      }
    })
  end
end

function Component:RefreshTeamWhenEnterGame(bMultiGame)
  self:ResetTeamAbout()
  if not IsStandAlone(self) then
    self.TeamBloodBars, self.TeamBloodBarCount = {}, 0
  end
  if bMultiGame then
    if #TeamModel:GetTeam().Members <= 1 then
      return
    end
    self:_ShowTeamPart(true)
    local AddedPhantom = {}
    for i, Member in ipairs(TeamModel:GetTeam().Members) do
      DebugPrint(LXYTag, "TeamSyncDebug WBP_Battle_C::RefreshTeam.......PlayerArray Exist\239\188\140 Eid:", Member.Uid)
      local bSelfCharacter = false
      if TeamModel:IsYourself(Member.Uid) and self.Platform == "PC" then
        self.WBP_Team_Tag:Init(false, Member.Index, Member.Uid)
        bSelfCharacter = true
      else
        self:AddTeammateUI(Member.Uid, true)
      end
      local Player = Battle(self):GetEntity(Member.Uid)
      if Player then
        for i, Phantom in pairs(Player:GetAllTeammates()) do
          if Phantom.PhantomOwner and Phantom.PhantomOwner.Eid == Player.Eid then
            self:AddTeammateUI(Phantom.Eid, false)
            AddedPhantom[Phantom.Eid] = 1
          end
        end
      end
    end
    for _, PhantomState in pairs(GameState(self).PhantomArray) do
      if not AddedPhantom[PhantomState.Eid] then
        self:AddTeammateUI(PhantomState.Eid, false)
      end
    end
  elseif TeamModel:GetTeam() then
    self:_ShowTeamPart(true)
  else
    self:_ShowTeamPart(false)
  end
end

function Component:ResetTeamAbout()
  if not TeamModel:GetAvatar() then
    return
  end
  DebugPrint(LXYTag, "TeamSyncDebug \233\135\141\231\189\174\230\136\152\230\150\151\231\149\140\233\157\162\228\184\138\232\183\159\231\187\132\233\152\159\231\155\184\229\133\179\231\154\132\228\184\156\232\165\191")
  self:_ShowTeamPart(false)
  self.VB_PlayerBar:ClearChildren()
  self.Team:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Team:SetRenderOpacity(1)
  self:CloseTeamInfo()
  if not self.TeamHeadUI then
    self.TeamHeadUI = TeamController:GetHeadUI(self.Pos_Player)
  end
  if self.TeamHeadUI then
    self.TeamHeadUI:Close()
    self.TeamHeadUI = nil
    self.Pos_Player:ClearChildren()
    self.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Component:OpenTeamInfo()
  if not TeamModel:GetTeam() or #TeamModel:GetTeam().Members <= 1 then
    return
  end
  if not GWorld:IsStandAlone() then
    if not self.TeamBloodBars or not next(self.TeamBloodBars) then
      return
    end
  elseif not self.TeamHeadUI then
    return
  end
  DebugPrint(DebugTag, LXYTag, "OpenTeamInfo")
  self:PlayAnimation(self.Team_Out)
  RunAsyncTask(self, "OpenTeamInfoAsync", function(CoObj)
    local TeamInfoUI = UIManager(self):GetUIObjAsync(TeamCommon.InfoUIName, CoObj)
    if IsValid(TeamInfoUI) then
      TeamInfoUI:UnbindAllFromAnimationFinished(TeamInfoUI.Auto_Out)
      TeamInfoUI:StopAnimation(TeamInfoUI.Auto_Out)
      TeamInfoUI:InitUIInfo(TeamCommon.InfoUIName, false, nil)
      DebugPrint(DebugTag, LXYTag, "\229\164\141\231\148\168TeamInfoUI")
    else
      TeamInfoUI = UIManager(self):LoadUIAsync(TeamCommon.InfoUIName, CoObj)
      DebugPrint(DebugTag, LXYTag, "\229\136\155\229\187\186TeamInfoUI")
    end
  end)
end

function Component:CloseTeamInfo()
  RunAsyncTask(self, "CloseTeamInfoAsync", function(CoObj)
    local TeamInfoUI = UIManager(self):GetUIObjAsync(TeamCommon.InfoUIName, CoObj)
    if IsValid(TeamInfoUI) then
      TeamInfoUI:Close()
    end
  end)
end

function Component:AddBattleTeamBloodBar(Eid, bIsPlayer, Entity)
  if not Battle(self):GetEntity(Eid) then
    Battle(self):AddEntity(Eid, Entity)
  end
  if not self.TeamBloodBars or not self.TeamBloodBarCount then
    DebugPrint("TeamSyncDebug  \231\173\137Loading\231\187\147\230\157\159\239\188\140ds\229\175\185\232\177\161\229\144\140\230\173\165\229\174\140\230\136\144\228\185\139\229\144\142\229\134\141\229\136\155\229\187\186\232\161\128\230\157\161")
    return true
  end
  Entity = Entity or Battle(self):GetEntity(Eid)
  Utils.Traceback(LXYTag, "TeamSyncDebug \231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143\239\188\140 EventID::ShowTeammateBloodUI, WBP_Battle_C::AddTeammateUI,  WBP_Battle_C_TeamComp::AddBattleTeamBloodBar")
  DebugPrint(DebugTag, LXYTag, "TeamSyncDebug \233\152\159 WBP_Battle_C::AddBattleTeamBloodBar, Eid, PlayerCount, bIsPlayer", Eid, GameState(self).PlayerArray:Num(), bIsPlayer)
  local PlayerEid, PhantomEid = Eid, Eid
  if not bIsPlayer then
    PlayerEid, PhantomEid = TeamModel:GetOwnerEidOfUnknowEid(self, Eid)
    if not PlayerEid then
      DebugPrint(LXYTag, ErrorTag, "TeamSyncDebug\231\187\132\233\152\159\230\159\165\232\175\162\233\173\133\229\189\177\229\189\146\229\177\158\229\164\177\232\180\165\239\188\140\233\173\133\229\189\177Eid", Eid)
      return false
    end
    local PhantomState = GameState(self):GetPhantomState(PhantomEid)
    local PhantomCharConf = DataMgr.Phantom[PhantomState.CharId]
    if PhantomCharConf and PhantomCharConf.IsHostage then
      DebugPrint(LXYTag, WarningTag, "TeamSyncDebug\228\186\186\232\180\168\231\137\185\230\174\138\229\164\132\231\144\134\239\188\140\228\184\141\229\186\148\232\175\165\232\162\171\229\189\147\228\189\156\233\173\133\229\189\177")
      return false
    end
  end
  if TeamModel:IsYourself(PlayerEid) then
    DebugPrint(LXYTag, "TeamSyncDebug\233\152\159 \232\135\170\229\183\177\231\154\132Eid\228\184\141\230\152\190\231\164\186\232\161\128\230\157\161 true")
    return false
  end
  if bIsPlayer then
    TeamController:AddTeamMemberWithDs(self, Eid)
    self.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if not self.VB_PlayerBar:IsVisible() then
    DebugPrint(LXYTag, "TeamSyncDebug\233\152\159 \232\161\128\230\157\161\230\140\130\230\142\165\231\130\185\228\184\141\229\143\175\232\167\129 false")
    return false
  end
  if not next(self.TeamBloodBars) and 0 == self.TeamBloodBarCount then
    self:_ShowTeamPart(true)
  end
  local BloodBar = self.TeamBloodBars[PlayerEid]
  if not BloodBar then
    local MaxTeammate = TeamCommon.MaxTeamMembers - 1
    if MaxTeammate > self.VB_PlayerBar:GetChildrenCount() then
      DebugPrint(LXYTag, "TeamSyncDebug\229\136\155\229\187\186\230\150\176\231\154\132\233\152\159\229\143\139\232\161\128\230\157\161")
      BloodBar = self:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleBloodBar.UIName)
      self.VB_PlayerBar:AddChild(BloodBar)
    else
      DebugPrint(LXYTag, "TeamSyncDebug\229\164\141\231\148\168\229\183\178\231\187\143\229\136\155\229\187\186\231\154\132\233\152\159\229\143\139\232\161\128\230\157\161")
      for _, InActiveUI in pairs(self.VB_PlayerBar:GetAllChildren()) do
        if not InActiveUI:IsVisible() then
          BloodBar = InActiveUI
          break
        end
      end
      BloodBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    DebugPrint(LXYTag, "TeamSyncDebug\233\152\159\229\143\139\232\161\128\230\157\161\232\174\176\229\189\149")
    self.TeamBloodBars[PlayerEid] = BloodBar
    self.TeamBloodBarCount = self.TeamBloodBarCount + 1
    if bIsPlayer and IsValid(Entity) then
      for _, PhantomEntity in pairs(Entity:GetPhantomTeammates(false, false)) do
        PhantomEntity.PhantomOwner = Entity
        self:AddTeammateUI(PhantomEntity.Eid, false, PhantomEntity)
      end
    end
  end
  BloodBar:SetOwner(self)
  if IsValid(Entity) then
    BloodBar:AddEid(PlayerEid, PhantomEid, self.TeamBloodBarCount)
  else
    BloodBar:AddEidWithOutCharacter(PlayerEid, PhantomEid, self.TeamBloodBarCount)
  end
  return true
end

function Component:RemoveBattleTeamBloodBar(Eid)
  DebugPrint(DebugTag, LXYTag, "TeamSyncDebug\231\187\132\233\152\159\230\181\129\231\168\139\230\151\182\229\186\143\239\188\140 EventID::CloseTeammateBloodUI, WBP_Battle_C::RemoveTeammateUI,  WBP_Battle_C_TeamComp::RemoveBattleTeamBloodBar")
  if not self.TeamBloodBars then
    return false
  end
  if not self.VB_PlayerBar:IsVisible() then
    return false
  end
  
  local function RealClose(BloodBar, PlayerEid, PhantomEid)
    if not BloodBar then
      return false
    end
    local bClose = BloodBar:RemoveEid(PlayerEid, PhantomEid)
    if bClose then
      self.TeamBloodBars[PlayerEid] = nil
      self.TeamBloodBarCount = self.TeamBloodBarCount - 1
    end
    if not next(self.TeamBloodBars) and 0 == self.TeamBloodBarCount then
      self:_ShowTeamPart(false)
    end
    TeamController:DelTeamMemberWithDs(Eid)
    return true
  end
  
  local BloodBar = self.TeamBloodBars[Eid]
  if RealClose(BloodBar, Eid, Eid) then
    return true
  end
  for PlayerEid, BloodBar in pairs(self.TeamBloodBars) do
    if BloodBar.Phantoms and BloodBar.Phantoms[Eid] and RealClose(BloodBar, PlayerEid, Eid) then
      return true
    end
  end
  if not next(self.TeamBloodBars) then
    self.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  return false
end

function Component:_ShowTeamPart(bShow)
  if self._bShowTeamPart == bShow then
    return
  end
  self._bShowTeamPart = bShow
  if not bShow then
    self:Show1PTagBar(false)
    if self.Platform == "PC" then
      self.VB_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    local TeamInfoUI = TeamController:GetView(self, TeamCommon.InfoUIName)
    if IsValid(TeamInfoUI) and not TeamInfoUI.IsBeginToClose then
      TeamInfoUI:Close()
    end
    self.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.Pos_Player:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.Platform == "PC" then
    self.VB_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:OnInputDeviceChange_Team()
  elseif self.Platform == "Mobile" then
    self.Spacer_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if TeamModel:GetAvatar() then
    local PlayerChar = GWorld:GetMainPlayer()
    local IsLeader = TeamModel:IsTeamLeader(TeamModel:GetAvatar().Uid)
    local bShowBar = PlayerChar:GetPhantomTeammates():Num() > 1
    self:Show1PTagBar(bShowBar)
    if not GWorld:IsStandAlone() then
      IsLeader = false
      self.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if self.Platform == "Mobile" then
        self.Spacer_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      if self.Platform == "PC" then
        local YourselfMember = TeamModel:GetTeamMember(PlayerChar.Eid)
        self.WBP_Team_Tag:Init(false, YourselfMember.Index, YourselfMember.Uid)
      end
      return
    end
    local TeamData = TeamModel:GetTeam()
    if not TeamData then
      return
    end
    if self.Platform == "PC" then
      local YourselfMember = TeamModel:GetTeamMember(TeamModel:GetAvatar().Uid)
      self.WBP_Team_Tag:Init(IsLeader, YourselfMember.Index, YourselfMember.Uid)
    end
    if #TeamData.Members > 0 and self.Pos_Player:IsVisible() then
      if self.TeamHeadUI then
        self.TeamHeadUI:Close()
        self.TeamHeadUI = nil
      end
      self.TeamHeadUI = TeamController:OpenHeadUI(self.Pos_Player, true)
    elseif self.TeamHeadUI then
      self.TeamHeadUI:Close(true)
      self.TeamHeadUI = nil
    end
  end
end

function Component:Show1PTagBar(bShow)
  local Func = self["Show1PTagBar" .. self.Platform]
  if Func then
    Func(self, bShow)
  end
end

function Component:Show1PTagBarPC(bShowBar)
  if not self.VB_Tag:IsVisible() then
    return
  end
  if bShowBar then
    self:PlayAnimation(self.Shadow_Add)
    self.Img_Down:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Img_Up:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self:PlayAnimationReverse(self.Shadow_Add)
    self.Img_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Img_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Component:Show1PTagBarMobile(bShowBar)
  if bShowBar then
    self:PlayAnimation(self.Shadow_Add)
  else
    self:PlayAnimationReverse(self.Shadow_Add)
  end
end

function Component:EndTeam()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.Platform == "PC" then
    UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange_Team)
    self:StopListeningForInputAction(self.TeamInputAction.ActionName, EInputEvent.IE_Pressed)
  end
  if self.TeamHeadUI then
    self.TeamHeadUI:Close()
    self.TeamHeadUI = nil
  end
  TeamController:UnRegisterEvent(self)
end

return Component
