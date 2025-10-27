require("UnLua")
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local ChatModel = ChatController:GetModel()
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
M._components = {
  "BluePrints.UI.WBP.Chat.View.HeadAnchorComp"
}

function M:Construct()
  self.Button_Area.OnHovered:Add(self, self.BtnAreaOnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.BtnAreaOnUnhovered)
  self.Button_Area.OnClicked:Add(self, self.BtnAreaOnClicked)
  self.Button_Area.OnPressed:Add(self, self.BtnAreaOnPressed)
  self.WBP_Com_ItemHead:BindOnClickEvent(function()
    if self._bSetUpEvent then
      self.Head_Anchor:Open(true)
    else
      DebugPrint(LXYTag, WarningTag, "\229\137\175\230\156\172\228\184\173\233\128\148\229\138\160\229\133\165\231\154\132\228\186\186\239\188\140\230\178\161\230\156\137AvatarInfo\239\188\140\230\151\160\230\179\149\229\129\154\230\155\180\229\164\154\230\147\141\228\189\156")
    end
  end)
end

function M:Destruct()
  self.Button_Area.OnHovered:Remove(self, self.BtnAreaOnHovered)
  self.Button_Area.OnUnhovered:Remove(self, self.BtnAreaOnUnhovered)
  self.Button_Area.OnClicked:Remove(self, self.BtnAreaOnClicked)
  self.Button_Area.OnPressed:Remove(self, self.BtnAreaOnPressed)
  self:RemoveReddotListen()
  self:RemoveEventListen()
end

function M:BP_OnEntryReleased()
  self:CleanUpAnchor()
end

function M:AddReddotListen(Uid)
  self:RemoveReddotListen()
  self.ReddotName = ChatCommon.ReddotNamePre .. Uid
  ReddotManager.AddListener(self.ReddotName, self, function(self, Count)
    if Count > 0 then
      self.Common_Subsize_Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      if Count >= ChatCommon.ReddotMaxCount then
        Count = ChatCommon.ReddotMaxCount .. "+"
      end
      self.Common_Subsize_Reddot_Num:SetNum(Count)
    else
      self.Common_Subsize_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end, nil, true)
end

function M:RemoveReddotListen()
  if not self.ReddotName then
    return
  end
  ReddotManager.RemoveListener(self.ReddotName, self)
end

function M:AddEventListen()
  self:RemoveEventListen()
  EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, function(self, Eid, Type, PrevType)
    local TeamData = self.Content.Data
    if Type == UE4.ETeamRecoveryState.Dying and Eid == TeamData.Eid then
      self.TeamPlayer_Tag:SetDeadState(true)
    end
  end)
  EventManager:AddEvent(EventID.CharRecover, self, function(self, Eid)
    local TeamData = self.Content.Data
    if Eid == TeamData.Eid then
      self.TeamPlayer_Tag:SetDeadState(false)
    end
  end)
end

function M:RemoveEventListen()
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, self)
  EventManager:RemoveEvent(EventID.CharRecover, self)
end

function M:StopAllBtnAnim()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.UnHover)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Click)
end

function M:BtnAreaOnHovered()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Hover)
end

function M:BtnAreaOnUnhovered()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.UnHover)
end

function M:BtnAreaOnClicked()
  if self.Content.bSelected then
    return
  end
  self:Select()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
end

function M:BtnAreaOnPressed()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Press)
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.UnHover and not self.Content.bSelected then
    self:PlayAnimation(self.Normal)
  end
end

function M:RefreshSelect(IsSelect)
  if IsSelect and self.Content.bSelected or not IsSelect and not self.Content.bSelected then
    return
  end
  if IsSelect then
    self:Select()
  else
    self:UnSelect()
  end
end

function M:UnSelect()
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Normal)
  self.Text_PlayerName:SetColorAndOpacity(self.PlayerNameNormal)
  self.Content.bSelected = false
end

function M:Select()
  if not self.Content.Data then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Click)
  self.Text_PlayerName:SetColorAndOpacity(self.PlayerNameSelect)
  self.Owner:OnPlayerListUISelected(self.Content)
  self.Content.bSelected = true
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Owner = Content.Owner
  self.Content = Content
  self.IsEnter = Content.IsSelect
  self:SetNavigationRuleBase(EUINavigation.Down, Content.IsStopNavDown and EUINavigationRule.Stop or EUINavigationRule.Escape)
  local CurrChannel = ChatModel:GetCurrentChannel()
  local Switch = {
    [ChatCommon.ChannelDef.InTeam] = self.OnListItemObjectSet_InTeam,
    [ChatCommon.ChannelDef.Friend] = self.OnListItemObjectSet_Friend
  }
  if Switch[CurrChannel] then
    Switch[CurrChannel](self)
  end
  if self.Content.bNotNeedClickBtn then
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  if self.Content.bSelected then
    self:Select()
  else
    self:UnSelect()
  end
end

function M:OnListItemObjectSet_League()
end

function M:OnListItemObjectSet_InTeam()
  local TeamData = self.Content.Data
  local Index = self.Content.Index
  if nil == TeamData then
    self:_SetEmptyState(true)
    return
  end
  local Name = TeamData.Nickname
  self.Text_PlayerName:SetText(Name)
  self.Num_Level:SetText(TeamData.Level)
  self:_SetEmptyState(false)
  self:_SetStar(nil)
  self:_SetHeadIcon(TeamData.HeadIconId)
  self.WBP_Com_ItemHead:SetHeadFrame(TeamData.HeadFrameId)
  self:_SetTeamIndexInfo(TeamData, Index)
  self:SetupAnchor(self.Head_Anchor, self.WBP_Com_ItemHead, TeamData, not TeamData.bDsData)
  self.Common_Subsize_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddEventListen()
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnListItemObjectSet_Friend()
  local FriendData = self.Content.Data
  local Name = FriendData.Info.Nickname
  local Remark = FriendData.Remark and FriendData.Remark ~= "" and string.format("(%s)", FriendData.Remark) or ""
  self.Text_PlayerName:SetText(Name .. Remark)
  self.Num_Level:SetText(FriendData.Info.Level)
  self:_SetEmptyState(false)
  self:_SetStar(FriendData.Star)
  self:_SetHeadIcon(FriendData.Info.HeadIconId)
  self.WBP_Com_ItemHead:SetHeadFrame(FriendData.Info.HeadFrameId)
  self:_SetOnlineState(FriendData.Info)
  self:SetupAnchor(self.Head_Anchor, self.WBP_Com_ItemHead, FriendData.Info, true)
  self:AddReddotListen(FriendData.Info.Uid)
end

function M:_SetStar(bStar)
  local StarVisibility = bStar and "SelfHitTestInvisible" or "Collapsed"
  self.Image_Star:SetVisibility(UIConst.VisibilityOp[StarVisibility])
  local PlayerNameSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Text_PlayerName)
  local Size = PlayerNameSlot:GetSize()
  Size.X = bStar and self.PlayerNameWithStar or self.PlayerNameWithoutStar
  PlayerNameSlot:SetSize(Size)
end

function M:_SetHeadIcon(HeadIconId)
  local function SetHeadOpacity(bHasHead)
    local Opacity = bHasHead and 1 or self.PlayerHeadEmpty
    
    self.WBP_Com_ItemHead:SetRenderOpacity(Opacity)
  end
  
  if not HeadIconId then
    SetHeadOpacity(false)
    return
  end
  local HeadData = DataMgr.HeadSculpture[HeadIconId]
  if not HeadData or not HeadData.HeadPath then
    SetHeadOpacity(false)
    return
  end
  local HeadIcon = LoadObject(HeadData.HeadPath)
  if not IsValid(HeadIcon) then
    SetHeadOpacity(false)
    return
  end
  SetHeadOpacity(true)
  self.WBP_Com_ItemHead:SetHeadIcon(HeadIcon)
end

function M:_SetEmptyState(bIsEmpty)
  self.WBP_Com_ItemHead:SetHeadIconEmpty(bIsEmpty)
  if bIsEmpty then
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Common_Subsize_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Group_Level:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Common_Subsize_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:_SetOnlineState(AvatarInfo)
  self.Group_TeamPlayerNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_OnlineState:SetVisibility(UIConst.VisibilityOp.Visible)
  if not AvatarInfo.IsOnline then
    self.Text_OnlineState:SetText(GText("UI_Friend_State_Offline"))
    self.Text_OnlineState:SetColorAndOpacity(self.PlayerOffline)
    self.Image_StatePoint:SetColorAndOpacity(self.PlayerOffline.SpecifiedColor)
  elseif not AvatarInfo.IsInDungeon and not AvatarInfo.IsInSpecialQuest then
    self.Text_OnlineState:SetText(GText("UI_Friend_Online"))
    self.Text_OnlineState:SetColorAndOpacity(self.PlayerOnline)
    self.Image_StatePoint:SetColorAndOpacity(self.PlayerOnline.SpecifiedColor)
  else
    self.Text_OnlineState:SetText(GText("UI_Chat_InDungeon"))
    self.Text_OnlineState:SetColorAndOpacity(self.PlayerBusy)
    self.Image_StatePoint:SetColorAndOpacity(self.PlayerBusy.SpecifiedColor)
  end
end

function M:_SetTeamIndexInfo(AvatarInfo, Index)
  self.Group_OnlineState:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_TeamPlayerNum:SetVisibility(UIConst.VisibilityOp.Visible)
  local TeamModel = TeamController:GetModel()
  if nil == Index then
    local MainPlayer = GWorld:GetMainPlayer()
    local Member = TeamModel:GetTeamMember(MainPlayer.Eid)
    Index = Member.Index
  end
  self.TeamPlayer_Tag:Init(TeamModel:IsTeamLeader(AvatarInfo.Uid), Index, AvatarInfo.Uid)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonRight then
    if self.IsOpen then
      IsEventHandled = true
      self.WBP_Com_ItemHead:BtnAreaOnUnhovered()
      self.WBP_Com_ItemHead:PlayNormal()
      self:SetFocus()
    end
  elseif InKeyName == Const.GamepadFaceButtonDown and not self.IsOpen and self._bSetUpEvent then
    self.Head_Anchor:Open(true)
    self.WBP_Com_ItemHead:BtnAreaOnHovered()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.IsEnter = true
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self:IsAnimationPlaying(self.In) then
    return UIUtils.Handle
  end
  self:Select()
  return UIUtils.Handle
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.IsEnter then
    self:Select()
  end
end

function M:OnHeadMenuOpenChanged(bOpen)
  self.IsOpen = bOpen
  self.Owner:UpdateUIStyleInPlatform()
end

AssembleComponents(M)
return M
