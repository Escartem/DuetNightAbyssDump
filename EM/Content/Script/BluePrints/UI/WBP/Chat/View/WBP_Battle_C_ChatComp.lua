local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local ChatModel = ChatController:GetModel()
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local Component = {}

function Component:EndChat()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  ReddotManager.RemoveListener(ChatCommon.UIName, self)
  ChatController:UnRegisterEvent(self)
  self.ChatSimpleOpenQueue = nil
  self:RemoveChatSimpleProcessTimer()
  local PlatfromType = CommonUtils.GetDeviceTypeByPlatformName(self)
  self["_EndChat" .. PlatfromType](self, Avatar)
  local ChatEntryConf = DataMgr.MainUI[ChatCommon.MainUIId]
  if self.ChatUnlockKey then
    Avatar:UnBindOnUIFirstTimeUnlock(ChatEntryConf.UIUnlockRuleName, self.ChatUnlockKey)
  end
end

function Component:InitChat()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChatEntryConf = DataMgr.MainUI[ChatCommon.MainUIId]
  assert(ChatEntryConf, "\232\129\138\229\164\169\231\154\132\229\133\165\229\143\163\233\133\141\231\189\174\228\184\141\229\173\152\229\156\168\239\188\140\231\173\150\229\136\146\233\156\128\232\166\129\230\163\128\230\159\165MainUI\233\133\141\232\161\168\239\188\140\232\129\138\229\164\169\231\179\187\231\187\159\231\154\132id\228\184\186" .. ChatCommon.MainUIId)
  self.ChatSimpleOpenQueue = Deque.New()
  local PlatfromType = CommonUtils.GetDeviceTypeByPlatformName(self)
  self["_InitChat" .. PlatfromType](self, Avatar, ChatEntryConf)
  self.bRebuildChatSimple = false
  local UnlockRuleName = ChatEntryConf.UIUnlockRuleName
  if UnlockRuleName then
    local bUnlocked = Avatar:CheckUIUnlocked(UnlockRuleName)
    if bUnlocked then
      self:_EnterChannel()
    else
      self.ChatUnlockKey = Avatar:BindOnUIFirstTimeUnlock(UnlockRuleName, function()
        if not self.ChatUnlockKey then
          return
        end
        self:_EnterChannel()
        self.ChatUnlockKey = nil
      end)
    end
  else
    self:_EnterChannel()
  end
end

function Component:_InitChatPC(Avatar, ...)
  local ChatEntryConf = (...)
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_ChatChannelNormal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_ChatEntry.OnClicked:Add(self, self.ChatEntryOnClicked)
  self.Btn_ChatEntry.OnHovered:Add(self, self.ChatEntryOnHovered)
  self.Btn_ChatEntry.OnUnhovered:Add(self, self.ChatEntryOnLeaved)
  self.ChatFocusArea.OnClicked:Add(self, self.OnChatFocusAreaClicked)
  self.Text_ChatChannelSelect:SetText(GText(ChatEntryConf.Name))
  self.Chat_Entry:LoadImage(ChatCommon.MainUIId)
  self.Key_ChatEntry:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    },
    bLongPress = true
  })
  self:_SetUpChannelText()
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.CloseMainView then
      local bBattle = (...)
      if not bBattle then
        return
      end
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Chat_Out)
      self.bRebuildChatSimple = true
      self:InitChatSimple()
      self.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:_SetUpChannelText()
    elseif EventId == ChatCommon.EventID.ChatMsgRecv then
      local TimeWrap, MsgWrap = ...
      if 1 == Avatar.ChatChannelMute[MsgWrap.Message.ChannelType] then
        print("yklua \230\148\182\229\136\176\230\182\136\230\129\175\239\188\140\228\189\134\230\152\175\229\156\168\229\133\141\230\137\147\230\137\176\229\136\151\232\161\168\228\184\173")
        return
      end
      self:UpdateChatSimple(MsgWrap)
    elseif EventId == ChatCommon.EventID.OpenMainView then
      local bBattle = (...)
      if not bBattle then
        return
      end
      self.Group_Select:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Visible)
      for _, Widget in pairs(self.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
        Widget:Close()
      end
      self.Pos_ChatSimple:ClearListItems()
      self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Chat_In)
    elseif EventId == ChatCommon.EventID.EnterChatChannel then
      local ErrCode, ChannelType = ...
      if ErrCode ~= ErrorCode.RET_SUCCESS then
        return
      end
      if IsValid(ChatController:GetView(self)) then
        return
      end
      if ChatModel:GetCurrentChannel() ~= ChannelType then
        return
      end
      if ChatEntryConf.ShowCondition ~= nil then
        local ConditionSucc = ConditionUtils.CheckCondition(Avatar, ChatEntryConf.ShowCondition)
        if ConditionSucc then
          self.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        else
          self.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.Collapsed)
        end
      else
        self.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self.bRebuildChatSimple = true
      self:InitChatSimple()
    elseif EventId == ChatCommon.EventID.CloseChatChannel then
      local bCloseCurrentChannel = (...)
      if not bCloseCurrentChannel then
        return
      end
      self.bRebuildChatSimple = true
      self:InitChatSimple()
      self.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:_SetUpChannelText()
    end
  end)
  ReddotManager.AddListener(ChatCommon.ReddotName, self, function(self, Count)
    if 0 == Count then
      self.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      local NumText = tostring(Count)
      if Count >= ChatCommon.ReddotMaxCount then
        NumText = ChatCommon.ReddotMaxCount .. "+"
      end
      self.Select_Reddot_Num:SetNum(NumText)
    end
  end)
end

function Component:_InitChatMobile(Avatar, ...)
  local ChatEntryConf = (...)
  local ChatEntryObj = NewObject(UE4.LoadClass("/Game/UI/WBP/Battle/Widget/WBP_Main_Btnlist_Content.WBP_Main_Btnlist_Content_C"))
  ChatEntryObj.BtnId = ChatCommon.MainUIId
  self.Chat_Entry:OnListItemObjectSet(ChatEntryObj)
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.EnterChatChannel then
      local ErrCode, ChannelType = ...
      if ErrCode ~= ErrorCode.RET_SUCCESS then
        return
      end
      if IsValid(ChatController:GetView(self)) then
        return
      end
      if ChatModel:GetCurrentChannel() ~= ChannelType then
        return
      end
      if ChatEntryConf.ShowCondition ~= nil then
        local ConditionSucc = ConditionUtils.CheckCondition(Avatar, ChatEntryConf.ShowCondition)
        if ConditionSucc then
          self.Chat_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        else
          self.Chat_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
        end
      else
        self.Chat_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    end
  end)
  ReddotManager.AddListener(ChatCommon.ReddotName, self, function(self, Count)
    if 0 == Count then
      self.Chat_Entry.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Chat_Entry.Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      local NumText = tostring(Count)
      if Count >= ChatCommon.ReddotMaxCount then
        NumText = ChatCommon.ReddotMaxCount .. "+"
      end
      self.Chat_Entry.Reddot_Num:SetNum(NumText)
    end
  end)
end

function Component:_EndChatPC(Avatar, ...)
  self:StopListeningForInputAction(DataMgr.KeyboardMap.OpenChat.ActionName, EInputEvent.IE_Pressed)
  self.Btn_ChatEntry.OnClicked:Remove(self, self.ChatEntryOnClicked)
  self.Btn_ChatEntry.OnHovered:Remove(self, self.ChatEntryOnHovered)
  self.Btn_ChatEntry.OnUnhovered:Remove(self, self.ChatEntryOnLeaved)
  self.ChatFocusArea.OnClicked:Remove(self, self.OnChatFocusAreaClicked)
end

function Component:_EndChatMobile(Avatar, ...)
end

function Component:_EnterChannel()
  ChatModel:UpdateCurrentChannel()
  for _, Channel in pairs(ChatCommon.ChannelDef) do
    ChatController:SendRequestEnterChatChannel(Channel)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:ListenForInputAction(DataMgr.KeyboardMap.OpenChat.ActionName, EInputEvent.IE_Pressed, false, {
      self,
      self.OpenChat
    })
  end
end

function Component:_LeaveChannel()
end

function Component:OpenChat()
  if IsValid(ChatController:GetView(self)) then
    return
  end
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Chat_Out) or EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Chat_In) then
    return
  end
  self:OpenSystemByAction(DataMgr.KeyboardMap.OpenChat.ActionName, true, true)
end

function Component:InitChatSimple()
  if not self.bRebuildChatSimple then
    return
  end
  local PlatfromType = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "Mobile" == PlatfromType then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar:IsInHardBoss() or Avatar:IsInDungeon() then
    self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.bRebuildChatSimple = false
    return
  end
  self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Pos_ChatSimple:ClearListItems()
  self.bRebuildChatSimple = false
end

function Component:UpdateChatSimple(MsgWrap)
  DebugPrint("Battle_PC_ChatComp:UpdateChatSimple", self.Pos_ChatSimple:GetVisibility())
  if IsValid(ChatController:GetView(self)) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar:IsInHardBoss() or Avatar:IsInDungeon() then
    self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.ChatSimpleOpenQueue = Deque.New()
    self.Pos_ChatSimple:ClearListItems()
    self:RemoveChatSimpleProcessTimer()
  elseif Avatar:IsInBigWorld() then
    self.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if not self.Pos_ChatSimple:IsVisible() then
    return
  end
  self.ChatSimpleOpenQueue:PushBack(MsgWrap)
  self.SimpleChatMovingTime = nil
  self:TryAddChatSimpleProcessTimer()
end

function Component:TryAddChatSimpleProcessTimer()
  if not self:IsExistTimer(self.ProcessTicker) then
    local Interval = 0.05
    local _, TimerKey = self:AddTimer(Interval, function()
      if not GWorld.NetworkMgr:CheckIsConnected(true) then
        self:RemoveChatSimpleProcessTimer()
        return
      end
      if not self.Pos_ChatSimple:IsVisible() then
        self.ChatSimpleOpenQueue = Deque.New()
        self.Pos_ChatSimple:ClearListItems()
        self:RemoveChatSimpleProcessTimer()
        return
      end
      if self.SimpleChatMovingTime == nil then
        self:_ProcessChatSimpleListModify()
      else
        self:_ProcessChatSimpleMove(Interval)
      end
    end, true)
    self.ProcessTicker = TimerKey
  end
end

function Component:_ProcessChatSimpleListModify()
  local MaxCount = DataMgr.GlobalConstant.ChatMsgCountInBattleMain.ConstantValue
  local ListCount = self.Pos_ChatSimple:GetNumItems()
  if MaxCount >= ListCount and ListCount < self.ChatSimpleOpenQueue:Size() then
    local MsgWrap = self.ChatSimpleOpenQueue:Get(ListCount + 1)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.MsgWrap = MsgWrap
    Content.bSound = true
    self.Pos_ChatSimple:AddItem(Content)
  end
  if MaxCount < ListCount then
    local Content = self.Pos_ChatSimple:GetItemAt(0)
    if IsValid(Content.UI) then
      Content.UI:Close()
    end
  end
end

function Component:_ProcessChatSimpleMove(Interval)
  if self.SimpleChatMovingTime < self.SCItemAnimTotalTime then
    for i, UI in pairs(self.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
      UI:DoMove(self.SimpleChatMovingTime)
    end
    self.SimpleChatMovingTime = self.SimpleChatMovingTime + Interval
  end
  if self.SimpleChatMovingTime >= self.SCItemAnimTotalTime then
    self.SimpleChatMovingTime = nil
    for i, UI in pairs(self.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
      UI:ResetTranslation()
    end
    local Content = self.Pos_ChatSimple:GetItemAt(0)
    self.Pos_ChatSimple:RemoveItem(Content)
    self.ChatSimpleOpenQueue:PopFront()
    if self.ChatSimpleOpenQueue:IsEmpty() then
      self:RemoveChatSimpleProcessTimer()
    end
  end
end

function Component:OnSimpleChatClose(ClosingUI)
  self.SimpleChatMovingTime = 0
  self.SCItemAnimTotalTime = math.max(ClosingUI.Out:GetEndTime(), 0.2)
end

function Component:RemoveChatSimpleProcessTimer()
  if not self:IsExistTimer(self.ProcessTicker) then
    return
  end
  self:RemoveTimer(self.ProcessTicker)
  self.ProcessTicker = nil
end

function Component:ChatEntryOnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_system_entrance", nil, nil)
  ChatController:OpenView(self, true)
end

function Component:ChatEntryOnHovered()
  self.Chat_Entry:OnBtnHovered()
end

function Component:OnChatFocusAreaClicked()
  local ChatView = ChatController:GetView(self)
  if IsValid(ChatView) then
    ChatView:SetFocus()
  end
end

function Component:ChatEntryOnLeaved()
  self.Chat_Entry:OnBtnUnhovered()
end

function Component:_SetUpChannelText()
  local ChannelConf = DataMgr.Channel[ChatModel:GetCurrentChannel()]
  if ChannelConf and ChannelConf.SIcon then
    local Icon = LoadObject(ChannelConf.SIcon)
    if IsValid(Icon) then
      self.Image_ChatChannelIcon:SetBrushResourceObject(Icon)
    end
  end
end

function Component:InitChatKeyTip()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local IsGamepad = self.CurInputDeviceType == UE4.ECommonInputType.Gamepad
    self.Group_NormalKey:SetVisibility(IsGamepad and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed)
  end
end

return Component
