require("UnLua")
local ChatModel = ChatController:GetModel()
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.bOpen = true
  self:PlayAnimation(self.Normal)
  self:InitChannel()
  self:InitKeyInfo()
  self.Text_DialogSingle:SetText(" ")
  self.Btn_Click.OnClicked:Add(self, self.OnClick)
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.ChatMsgRecv then
      local TimeWrap, MsgWrap = ...
      self:ShowChatText(MsgWrap)
    elseif EventId == ChatCommon.EventID.CloseMainView then
      self:InitChannel()
    end
  end)
  ReddotManager.AddListener(ChatCommon.ReddotName, self, function(self, Count)
    if 0 == Count then
      self.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      local NumText = tostring(Count)
      if Count > ChatCommon.ReddotMaxCount then
        NumText = ChatCommon.ReddotMaxCount .. "+"
      end
      self.Reddot_Num:SetNum(NumText)
    end
  end)
  self.Text_DialogSingle.bOverrideAccessibleDefaults = true
  self.Text_DialogSingle.DefaultTextStyleOverride.OverflowPolicy = ETextOverflowPolicy.Ellipsis
  self.Text_DialogSingle:SetDefaultTextStyle(self.Text_DialogSingle.DefaultTextStyleOverride)
end

function M:Destruct()
  ChatController:UnRegisterEvent(self)
  ReddotManager.RemoveListener(ChatCommon.UIName, self)
end

function M:InitChannel()
  local Channel = ChatModel:GetCurrentChannel()
  self:SwitchChannelImage(Channel)
end

function M:SwitchChannelImage(Channel)
  local TypeIcon = DataMgr.Channel[Channel].SIcon
  local Icon = LoadObject(TypeIcon)
  self.Image_ChatChannelIcon:SetBrushResourceObject(Icon)
end

function M:OnClick()
  if not self.bOpen then
    return
  end
  self:PlayAnimation(self.Click)
  local Params = {
    bBattle = false,
    bInDungeonSettlement = self.bInDungeonSettlement and GWorld:GetAvatar().SettlementUidArray
  }
  local ChatMainUI = ChatController:OpenView(self, Params)
  if ChatMainUI and ChatMainUI:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    ChatMainUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:ShowChatText(MsgWrap)
  local SenderName = ChatController:ParseSpeakerHeader(MsgWrap)
  local Content = ChatController:ParseEmojiToText(MsgWrap)
  Content = ChatController:ParseModSuitText(MsgWrap)
  local Message = SenderName .. Content
  self:PlayAnimation(self.Change)
  self.Text_DialogSingle:SetText(Message)
end

function M:InitKeyInfo()
  self.ControllerKeyImg:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    },
    bLongPress = true
  })
  self.ControllerKeyImg:AddExecuteLogic(self, self.OnClick)
  self.Com_KeyText:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Enter"}
    }
  })
end

function M:RefreshKey(IsGamePad)
  if IsGamePad then
    self.WS_Key:SetActiveWidgetIndex(1)
  else
    self.WS_Key:SetActiveWidgetIndex(0)
  end
end

function M:IsShowGamePad(IsShow)
  if IsShow then
    self.WS_Key:SetActiveWidgetIndex(1)
    self.ControllerKeyImg:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.WS_Key:SetActiveWidgetIndex(0)
    self.ControllerKeyImg:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:HideWSKey(IsShow)
  if IsShow then
    self.WS_Key:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.WS_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
