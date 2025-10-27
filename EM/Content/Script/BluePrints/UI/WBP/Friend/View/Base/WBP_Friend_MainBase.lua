require("UnLua")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  FriendController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == FriendCommon.EventId.BlockUI then
      local Dialog = FriendController:GetDialog(self)
      if IsValid(Dialog) then
        Dialog:BlockAllUIInput(true)
      else
        self:BlockAllUIInput(true)
      end
    elseif EventId == FriendCommon.EventId.UnblockUI then
      local Dialog = FriendController:GetDialog(self)
      if IsValid(Dialog) then
        Dialog:BlockAllUIInput(false)
      else
        self:BlockAllUIInput(false)
      end
      local ChatView = ChatController:GetView(self)
      if IsValid(ChatView) and not ChatView.IsBeginToClose then
        ChatView:SetFocus()
      end
    end
  end)
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.CloseMainView then
      self:SetFocus()
    elseif EventId == ChatCommon.EventID.OnChatBtnListOpen then
      self:OnChatBtnListOpen(...)
    end
  end)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "FriendMainBase", nil)
end

function M:ShowPlayerInfoBtn(bShow)
end

function M:OnChatBtnListOpen()
end

function M:Destruct()
  FriendController:UnRegisterEvent(self)
  ChatController:UnRegisterEvent(self)
  AudioManager(self):SetEventSoundParam(self, "FriendMainBase", {ToEnd = 1})
  M.Super.Destruct(self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self:SetFocus()
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  local AttachWidget = self:GetAttachWidget()
  self._TeamHeadPanel = TeamController:OpenHeadUI(AttachWidget)
  
  function self._TeamHeadPanel.OnTeamMainFocusChanged(bFocused)
    if not TeamController:IsGamepad() then
      return
    end
    local Visibility = bFocused and "Collapsed" or "SelfHitTestInvisible"
    local KeyWidgets = {
      self.WBP_Com_Tab_P.Key_Left,
      self.WBP_Com_Tab_P.Key_Right,
      self.WBP_Com_Tab_P.Com_KeyTips.Panel_Key,
      self.Key_UID
    }
    for _, KeyWidget in ipairs(KeyWidgets) do
      KeyWidget:SetVisibility(UIConst.VisibilityOp[Visibility])
    end
    self.CurrWidget:OnTeamMainFocusChanged(bFocused)
  end
end

function M:GetAttachWidget()
  local AttachWidget
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    AttachWidget = self.WBP_Com_Tab_M.Panel_Team
  else
    AttachWidget = self.WBP_Com_Tab_P.Group_Team
  end
  AttachWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  return AttachWidget
end

function M:SelectTab(TabType)
end

function M:Close()
  if self.IsBeginToClose then
    return
  end
  local AttachWidget = self:GetAttachWidget()
  if self._TeamHeadPanel and TeamController:GetHeadUI(AttachWidget) == self._TeamHeadPanel then
    self._TeamHeadPanel:Close()
    AttachWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  M.Super.Close(self)
end

return M
