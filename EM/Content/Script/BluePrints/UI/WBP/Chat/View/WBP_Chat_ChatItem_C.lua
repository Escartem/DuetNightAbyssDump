require("UnLua")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local TimeUtils = require("Utils.TimeUtils")
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local ChatModel = ChatController:GetModel()
local ChatFocusType = ChatCommon.ChatFocusType
local UIUtils = require("Utils.UIUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.Chat.View.HeadAnchorComp"
}

function M:Construct()
  self.Text_NewMessage:SetText(GText("UI_Chat_NewMsgLine"))
  self.Head_AnchorLeft.OnGetMenuContentEvent:Bind(self, self.OnAnchorGetUserMenuContent)
  self.Head_AnchorLeft.OnMenuOpenChanged:Add(self, self.HeadMenuOpenChanged)
  self.Head_AnchorRight.OnGetMenuContentEvent:Bind(self, self.OnAnchorGetUserMenuContent)
  self.Head_AnchorRight.OnMenuOpenChanged:Add(self, self.HeadMenuOpenChanged)
end

function M:Destruct()
  self.Head_AnchorLeft.OnGetMenuContentEvent:Unbind()
  self.Head_AnchorLeft.OnMenuOpenChanged:Remove(self, self.HeadMenuOpenChanged)
  self.Head_AnchorRight.OnGetMenuContentEvent:Unbind()
  self.Head_AnchorRight.OnMenuOpenChanged:Remove(self, self.HeadMenuOpenChanged)
  self:CleanUpAnchor()
end

function M:BP_OnEntryReleased()
  self.Text_LeftDialog:SetText("")
  self.Text_LeftDialog:SetText("")
  self.Content.UI = nil
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Content = Content
  self.MsgWrap = Content.Data
  self.Owner = Content.Owner
  self.SelectMask = nil
  self.Group_Switcher:SetActiveWidgetIndex(self.MsgWrap.MsgType)
  local Switch = {
    [ChatCommon.MsgType.Other] = self.OnListItemObjectSet_Other,
    [ChatCommon.MsgType.System] = self.OnListItemObjectSet_System,
    [ChatCommon.MsgType.Self] = self.OnListItemObjectSet_Self,
    [ChatCommon.MsgType.Time] = self.OnListItemObjectSet_Time
  }
  if Switch[self.MsgWrap.MsgType] then
    Switch[self.MsgWrap.MsgType](self, Content)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self:OnCreateChatItem(self.Owner, Content)
    self:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
      self,
      self.OnNavigateUp
    })
    self:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
      self,
      self.OnNavigateDown
    })
  end
end

function M:OnListItemObjectSet_Other(Content)
  self.HeadAnchor = self.Head_AnchorLeft
  self.Head = self.HeadLeft
  self.HeadAnchor:SetPlacement(EMenuPlacement.MenuPlacement_MenuRight)
  self.TextPlayerName = self.Text_LeftPlayerName
  self.TextDialog = self.Text_LeftDialog
  self.TextDialogFontSize = self.TextDialog:BP_GetCurrentDefaultTextStyle().Font.Size
  self.NumLevel = self.Num_LevelLeft
  self.GroupFace = self.Group_FaceLeft
  self.ImageFace = self.Image_FaceLeft
  self.ImageBg = self.Image_LeftDialogBG
  self.Switcher = self.WidgetSwitcher_Bubble_L
  self.ModPlan = self.Bubble_ModPlan_L
  self.TitleWidget = self.TitleLeft
  self:InitSelectMask(self.Image_LeftControllerLight)
  self:_SetUpChatContent(self.MsgWrap)
end

function M:OnListItemObjectSet_System(Content)
  local Text = Content.Text
  if nil == Text and nil ~= self.MsgWrap.Message then
    Text = self.MsgWrap.Message.Content
  end
  self.Text_Tips:SetText(Text)
end

function M:OnListItemObjectSet_Self(Content)
  self.HeadAnchor = self.Head_AnchorRight
  self.Head = self.HeadRight
  self.HeadAnchor:SetPlacement(EMenuPlacement.MenuPlacement_MenuLeft)
  self.TextPlayerName = self.Text_RightPlayerName
  self.TextDialog = self.Text_RightDialog
  self.TextDialogFontSize = self.TextDialog:BP_GetCurrentDefaultTextStyle().Font.Size
  self.NumLevel = self.Num_LevelRight
  self.GroupFace = self.Group_FaceRight
  self.ImageFace = self.Image_FaceRight
  self.ImageBg = self.Image_RightDialogBG
  self.Switcher = self.WidgetSwitcher_Bubble_R
  self.ModPlan = self.Bubble_ModPlan_R
  self.TitleWidget = self.TitleRight
  self:InitSelectMask(self.Image_RightControllerLight)
  self:_SetUpChatContent(self.MsgWrap)
end

function M:OnListItemObjectSet_Time(Content)
  local Time = math.floor(self.MsgWrap.Message.Time + 0.5)
  local NowTime = TimeUtils.NowTime()
  local Year, Month, Day = TimeUtils.TimestampToData(NowTime)
  local TodayTime = TimeUtils.DataToTimestamp(Year, Month, Day, 0, 0, 0)
  local TimeDiff = Time - TodayTime
  local DateText = ""
  if TimeDiff < 0 and TimeDiff >= -CommonConst.SECOND_IN_DAY then
    DateText = GText("UI_Chat_Yesterday") .. "  "
  elseif TimeDiff < -CommonConst.SECOND_IN_DAY then
    DateText = GDate_YMD_Timestamp(Time) .. "  "
  end
  local ClockText = table.concat(string.split(TimeUtils.TimeToHMSStr(Time), ":"), ":", 1, 2)
  self.Text_MessageTime:SetText(DateText .. ClockText)
end

function M:_UpdateHeadClickableState()
  local isSelf = self.MsgWrap.MsgType == ChatCommon.MsgType.Self
  local shouldBeHittestInvisible = isSelf and GWorld:GetAvatar():IsInDungeon() and GWorld.GameInstance.IsInTempScene and GWorld.GameInstance:IsInTempScene()
  if shouldBeHittestInvisible then
    self.Head:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Head:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:_SetUpChatContent(MsgWrap)
  local Message = MsgWrap.Message
  self.Head:SetHoldUp(true)
  self.Head:BindOnClickEvent(function()
    self.HeadAnchor:Open(true)
  end)
  local AvatarInfo = Message.Sender
  local MessageContent = Message
  if Message.Sender.Uid == ChatController:GetAvatar().Uid then
    AvatarInfo = ChatController:GetAvatar()
  elseif ChatModel:GetCurrentFriendUid() and ChatModel:GetCurrentChannel() == ChatCommon.ChannelDef.Friend then
    AvatarInfo = FriendController:GetModel():GetFriendDict()[ChatModel:GetCurrentFriendUid()].Info
  end
  self:SetupAnchor(self.HeadAnchor, self.Head, AvatarInfo, false, MessageContent)
  self.Head:SetHeadIconById(AvatarInfo.HeadIconId)
  self.Head:SetHeadFrame(AvatarInfo.HeadFrameId)
  self.TextPlayerName:SetText(AvatarInfo.Nickname)
  self.NumLevel:SetText(AvatarInfo.Level)
  if self.TitleWidget then
    UIUtils.SetTitle(self.TitleWidget, AvatarInfo)
  end
  self:_ParseEmoji(MsgWrap)
  self:_ParseModSuitInfo(MsgWrap)
  self:_UpdateHeadClickableState()
end

function M:_ShowNormalContent(Content)
  self.ImageBg:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.TextDialog:SetVisibility(UIConst.VisibilityOp.Visible)
  self.TextDialog:SetText(Content)
  self.TextDialog:SetWrapTextAt(self.Owner:CalcWrapTextAt())
end

function M:_ParseEmoji(MsgWrap)
  local Content = MsgWrap.Message.Content
  local EmojiInfos = MsgWrap.EmojiInfos
  self.GroupFace:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if table.isempty(EmojiInfos) then
    self:_ShowNormalContent(Content)
    return
  end
  for _, EmojiInfo in ipairs(EmojiInfos) do
    if not EmojiInfo.bSticker then
      local EmojiInfoPartten = "%[" .. EmojiInfo.Id .. "%]"
      local EmojiHeight = math.floor(self.TextDialogFontSize * 2 * (self.EmojiHeight / 1.5) + 0.5)
      local EmojiWidth = EmojiHeight
      local Deco = self.TextDialog.InstanceDecorators:GetRef(1)
      if not IsValid(Deco) then
        Utils.Traceback(ErrorTag, "\230\137\190\232\147\157\229\155\190\231\156\139\231\156\139\239\188\140\232\129\138\229\164\169\230\176\148\230\179\161\230\150\135\230\156\172\230\161\134\231\154\132\229\175\140\230\150\135\230\156\172\232\163\133\233\165\176\229\153\168\228\184\162\229\164\177")
        return
      end
      local TableRow = FRichImageRow()
      local Res = UDataTableFunctionLibrary.GetDataTableRowFromName(Deco.ImageSet, EmojiInfo.Id, TableRow)
      if not Res then
        Utils.Traceback(ErrorTag, "\230\137\190\231\173\150\229\136\146\231\156\139\231\156\139\239\188\140\232\161\168\230\131\133\229\140\133\229\175\140\230\150\135\230\156\172\231\154\132DataTable\230\137\190\228\184\141\229\136\176\232\191\153\228\184\170Key :" .. EmojiInfo.Id)
        return
      end
      local Img = TableRow.Brush.ResourceObject
      if not IsValid(Img) then
        Utils.Traceback(ErrorTag, "\230\137\190\231\173\150\229\136\146\231\156\139\231\156\139\239\188\140\232\161\168\230\131\133\229\140\133\229\175\140\230\150\135\230\156\172\231\154\132DataTable\230\178\161\230\156\137\233\133\141\231\189\174\232\161\168\230\131\133\232\180\180\229\155\190\239\188\140Key :" .. EmojiInfo.Id)
        return
      end
      local Scale = Img:Blueprint_GetSizeX() / Img:Blueprint_GetSizeY()
      EmojiWidth = math.floor(EmojiHeight * Scale + 0.5)
      local EmojiRichPartten = string.format("<Img id=\"%s\" height=\"%s\" width=\"%s\" stretch=\"ScaleToFill\"></>", EmojiInfo.Id, EmojiHeight, EmojiWidth)
      Content = string.gsub(Content, EmojiInfoPartten, EmojiRichPartten)
    else
      self.GroupFace:SetVisibility(UIConst.VisibilityOp.Visible)
      self.ImageBg:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.TextDialog:SetVisibility(UIConst.VisibilityOp.Collapsed)
      local IconPath = DataMgr.ChatEmoji[EmojiInfo.GroupId][EmojiInfo.Id].Icon
      local Img = IconPath and LoadObject(IconPath) or nil
      if IsValid(Img) then
        self.ImageFace:SetBrushResourceObject(Img)
      end
      return
    end
  end
  self:_ShowNormalContent(Content)
end

function M:_ParseModSuitInfo(MsgWrap)
  self.Switcher:SetActiveWidgetIndex(0)
  local ModSuitInfo = MsgWrap.ModSuitInfo
  local DyePlanInfo = MsgWrap.DyePlanInfo
  if ModSuitInfo then
    self.Switcher:SetActiveWidgetIndex(1)
    local bSelfMsg = self.MsgWrap.MsgType == ChatCommon.MsgType.Self
    self.ModPlan:InitMod(ModSuitInfo, bSelfMsg)
  elseif DyePlanInfo then
    self.Switcher:SetActiveWidgetIndex(1)
    local bSelfMsg = self.MsgWrap.MsgType == ChatCommon.MsgType.Self
    self.ModPlan:InitDye(DyePlanInfo, bSelfMsg)
  end
end

function M:InitSelectMask(Widget)
  self.SelectMask = Widget
  if self.Owner.OnInitSelectMask then
    self.Owner:OnInitSelectMask()
  end
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
      self.Head:BtnAreaOnUnhovered()
      self.Head:PlayNormal()
      self:SetFocus()
    end
  elseif InKeyName == Const.GamepadFaceButtonDown then
    if not self.IsOpen and self.Owner.FocusStateType == ChatFocusType.SelectChat and self.HeadAnchor then
      self.HeadAnchor:Open(true)
      self.Head:BtnAreaOnHovered()
      IsEventHandled = true
    end
  elseif InKeyName == Const.GamepadFaceButtonLeft and not self.IsOpen and self.Owner.FocusStateType == ChatFocusType.SelectChat and self.MsgWrap.ModSuitInfo then
    self.ModPlan:OnBtnClick(0)
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:SelectMessage(IsSelect)
  if not self.SelectMask or IsSelect and self.Owner.FocusStateType ~= ChatFocusType.SelectChat then
    return
  end
  local Visibility = IsSelect and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed
  self.SelectMask:SetVisibility(Visibility)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.IsEnter = true
  self.Owner.CurrSelectChatItem = self
  if self.Owner.FocusStateType == ChatFocusType.SelectChat then
    self.Owner:UpdateUIStyleInPlatform()
  end
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self:IsAnimationPlaying(self.In) then
    return UIUtils.Handle
  end
  self:SelectMessage(true)
  return UIUtils.Handle
end

function M:OnFocusLost(InFocusEvent)
  self.IsEnter = false
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self:IsAnimationPlaying(self.In) then
    return
  end
  self:SelectMessage(false)
end

function M:OnHeadMenuOpenChanged(bOpen)
  self.IsOpen = bOpen
  self.Owner:UpdateUIStyleInPlatform()
end

function M:OnCreateChatItem(Owner, Content)
  if not Owner or not Owner._ChatItemList then
    return
  end
  local Index = Content.Data.Index
  if not Index or 0 == Index then
    Index = #Owner._ChatItemList + 1
    Content.Data.Index = Index
  end
  Owner._ChatItemList[Index] = self
end

function M:OnNavigateUp()
  local Index = self.MsgWrap.Index
  local ChatItemList = self.Owner._ChatItemList
  local FocusStateType = self.Owner.FocusStateType
  for i = Index - 1, 1, -1 do
    local Widget = ChatItemList[i]
    if Widget.SelectMask or FocusStateType ~= ChatFocusType.SelectChat then
      return Widget
    end
  end
  return self
end

function M:OnNavigateDown()
  local Index = self.MsgWrap.Index
  local ChatItemList = self.Owner._ChatItemList
  local FocusStateType = self.Owner.FocusStateType
  local MaxIndex = #ChatItemList
  for i = Index + 1, MaxIndex do
    local Widget = ChatItemList[i]
    if Widget.SelectMask or FocusStateType ~= ChatFocusType.SelectChat then
      return Widget
    end
  end
  return self
end

AssembleComponents(M)
return M
