local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local Component = {}

function Component:SetupAnchor(Anchor, Head, AvatarInfo, bSetUpEvent, MessageContent)
  self.HeadAnchor = Anchor
  self.Head = Head
  self._AvatarInfo = AvatarInfo
  self._bSetUpEvent = bSetUpEvent
  self._MessageContent = MessageContent
  if bSetUpEvent then
    self.HeadAnchor.OnGetMenuContentEvent:Bind(self, self.OnAnchorGetUserMenuContent)
    self.HeadAnchor.OnMenuOpenChanged:Add(self, self.HeadMenuOpenChanged)
  end
end

function Component:CleanUpAnchor()
  if self._bSetUpEvent then
    self.HeadAnchor.OnGetMenuContentEvent:Unbind()
    self.HeadAnchor.OnMenuOpenChanged:Remove(self, self.HeadMenuOpenChanged)
  end
  self.HeadAnchor = nil
  self.Head = nil
  self._bSetUpEvent = false
end

function Component:OnAnchorGetUserMenuContent(Anchor)
  local function InitShowRecordBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_ShowRecord")
    
    function Content.Callback()
      if AvatarInfo.Uid == GWorld:GetAvatar().Uid then
        PersonInfoController:OpenView()
      else
        GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(AvatarInfo.Uid)
      end
      self.HeadAnchor:Close()
    end
  end
  
  local function AddFriend(Content, AvatarInfo)
    if not FriendModel:GetFriendDict()[AvatarInfo.Uid] then
      Content.Text = GText("UI_Friend_AddFriend")
      
      function Content.Callback()
        FriendController:OpenAddFriendDialog(self, AvatarInfo)
        self.HeadAnchor:Close()
      end
    else
      Content.Text = GText("UI_Chat_SendMsg")
      
      function Content.Callback()
        ChatController:SelectPlayerToChat(AvatarInfo.Uid)
        self.HeadAnchor:Close()
      end
    end
  end
  
  local function InviteTeam(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_InviteTeam")
    
    function Content.Callback()
      TeamController:SendTeamInvite(AvatarInfo.Uid)
      self.HeadAnchor:Close()
    end
  end
  
  local function AddBlackList(Content, AvatarInfo)
    if FriendModel:GetBlackListDict()[AvatarInfo.Uid] then
      Content.Text = GText("UI_Friend_DelBlackList")
      
      function Content.Callback()
        FriendController:SendCancelBlackList(AvatarInfo.Uid)
        self.HeadAnchor:Close()
      end
    else
      Content.Text = GText("UI_Friend_AddBlackList")
      
      function Content.Callback()
        FriendController:OpenAddBlacklistDialog(self, AvatarInfo)
        self.HeadAnchor:Close()
      end
    end
  end
  
  local function AccusePlayer(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_Accuse")
    
    function Content.Callback()
      local Params = {
        PlayerName = AvatarInfo.Nickname,
        UID = AvatarInfo.Uid,
        TextLenMax = 50,
        ChatMassage = self._MessageContent,
        ForbidRightBtn = true,
        DontCloseWhenRightBtnClicked = true
      }
      
      function Params.HideItemTips()
        self:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
          bHideDialogItem = true,
          DialogItemIndex = 1,
          bShouldPlayAnim = false
        })
        self:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
          bHideDialogItem = true,
          DialogItemIndex = 2,
          bShouldPlayAnim = false
        })
      end
      
      Params.EditTextConfig = {
        Owner = self,
        TextLimit = 50,
        Events = {
          OnTextChanged = self.OnTextChange,
          OnTextComposing = self.OnTextComposing,
          OnEditTextFocusReceived = function()
            if self.bTipsShowed then
              self.Owner:HideDialogTip(2, false)
              self.bTipsShowed = false
            end
          end
        }
      }
      ChatController:OpenChatReportDialog(Params)
      self.HeadAnchor:Close()
    end
  end
  
  local Switch = {}
  local IsYourSelf = self._AvatarInfo.Uid == ChatController:GetAvatar().Uid
  if IsYourSelf then
    if GWorld:GetAvatar():IsInDungeon() then
      Switch = nil
    else
      Switch = {InitShowRecordBtn}
    end
  else
    if GWorld:GetAvatar():IsInDungeon() then
      if GWorld.GameInstance.IsInTempScene and GWorld.GameInstance:IsInTempScene() then
        Switch = {InviteTeam, AddBlackList}
      else
        Switch = {InviteTeam, AddBlackList}
      end
    else
      Switch = {
        AddFriend,
        InitShowRecordBtn,
        InviteTeam,
        AddBlackList
      }
    end
    if self._MessageContent then
      table.insert(Switch, AccusePlayer)
    end
    local ForbidItemIdxList = self:GetForbidContentIdxList()
    if #ForbidItemIdxList > 0 then
      for i, v in ipairs(ForbidItemIdxList) do
        table.remove(Switch, v)
      end
    end
    local bInviting = TeamController:GetModel():GetInviteSendBox()[self._AvatarInfo.Uid]
    if not IsYourSelf and bInviting then
      table.remove(Switch, GWorld:GetAvatar():IsInDungeon() and 2 or 3)
    end
  end
  return ChatController:OpenPlayerBtnList(self, self._AvatarInfo, Switch)
end

function Component:GetForbidContentIdxList()
  local ResultList = {}
  local PlayerAvatar = GWorld:GetAvatar()
  if PlayerAvatar and PlayerAvatar:IsInTeam() then
    local TeamData = TeamController:GetModel()
    local TeamMember, PosIdx = TeamData:GetTeamMember(self._AvatarInfo.Uid)
    if 0 ~= PosIdx then
      table.insert(ResultList, GWorld:GetAvatar():IsInDungeon() and 2 or 3)
    end
  end
  return ResultList
end

function Component:HeadMenuOpenChanged(bOpen)
  if self.OnHeadMenuOpenChanged then
    self:OnHeadMenuOpenChanged(bOpen)
  end
  if bOpen then
    return
  end
  if self.Head then
    self.Head:PlayNormal()
  end
end

return Component
