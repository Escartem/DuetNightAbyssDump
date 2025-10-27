local FriendModel = require("BluePrints.UI.WBP.Friend.FriendModel")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local CommonUtils = require("Utils.CommonUtils")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
  self._Dialog = nil
  self.FriendRequest_Dialog = nil
  self.BlackList_Dialog = nil
  self.RefreshRecommandTimer = nil
  self.NetDelayTimer = nil
  self:GetAvatar()
end

function M:GetModel()
  return FriendModel
end

function M:GetEventName()
  return EventID.FriendControllerEvent
end

function M:OpenView(WorldContex, TabType)
  return M.Super.OpenView(self, WorldContex, FriendCommon.MainUIId, false, TabType)
end

function M:OpenDialog(WorldContex, DialogType)
  if DialogType == FriendCommon.FriendDialogType.FriendRequest then
    local Params_FriendRequest = {
      Type = DialogType,
      Title = GText("UI_Friend_FriendRequest"),
      HintText = GText("UI_TRAIN_CLOSE"),
      ButtonBarName = "Dialog_Button_L",
      ShowBKeyClose = true
    }
    self.FriendRequest_Dialog = self:GetUIMgr(WorldContex):ShowCommonPopupUI(100131, Params_FriendRequest, self:GetView(WorldContex))
  elseif DialogType == FriendCommon.FriendDialogType.BlackList then
    local Params_BlackList = {
      Type = DialogType,
      Title = GText("UI_Friend_BlackList"),
      HintText = GText("UI_TRAIN_CLOSE"),
      ButtonBarName = nil
    }
    self.BlackList_Dialog = self:GetUIMgr(WorldContex):ShowCommonPopupUI(100132, Params_BlackList, self:GetView(WorldContex))
  end
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, FriendCommon.UIName)
end

function M:GetDialog(WorldContex)
  if IsValid(self.BlackList_Dialog) then
    return self.BlackList_Dialog
  else
    self.BlackList_Dialog = nil
  end
  if IsValid(self.FriendRequest_Dialog) then
    return self.FriendRequest_Dialog
  else
    self.FriendRequest_Dialog = nil
  end
end

function M:OpenAddFriendDialog(WorldContext, AvatarInfo)
  local Params = {
    UseGenaral = true,
    MultilineType = 1,
    TextLenMax = DataMgr.GlobalConstant.FriendReqMaxLen.ConstantValue,
    DefaultText = GText("UI_Friend_ReDef"),
    HintText = GText("UI_Friend_RequestHint"),
    OnSDKChecked = function(bRes, InputWidget, ...)
      if not bRes then
        return
      end
      self:SendRequest(FriendCommon.EventId.AddFriend, AvatarInfo.Uid, ...)
    end,
    EditTextConfig = {Owner = self, IsMultiLine = false}
  }
  self:GetUIMgr(WorldContext):ShowCommonPopupUI(FriendCommon.RequestDialogNotInput, Params, self:GetView(WorldContext))
end

function M:OpenAddBlacklistDialog(WorldContext, AvatarInfo)
  local Params = {
    RightCallbackFunction = function()
      self:SendRequest(FriendCommon.EventId.AddBlackList, AvatarInfo.Uid, AvatarInfo)
    end
  }
  self:GetUIMgr(WorldContext):ShowCommonPopupUI(FriendCommon.PullBlackDialog, Params, self:GetView(WorldContext))
end

function M:OverrideButtonSound(button, soundEvent, eventKey)
  button:TryOverrideSoundFunc(function()
    AudioManager(button):PlayUISound(button, soundEvent, eventKey, nil)
  end)
end

function M:SendRequest(Reason, ...)
  DebugPrint("+++++++++++++++FriendController:SendRequest  Reason =" .. Reason)
  if M["Send" .. Reason] then
    if M["Recv" .. Reason] then
      self:StopTimer(self.NetDelayTimer)
      self:StartNetDelayTimer()
    end
    M["Send" .. Reason](M, ...)
  end
end

function M:RecvResponse(Reason, ...)
  self:StopTimer(self.NetDelayTimer)
  if M["Recv" .. Reason] then
    M["Recv" .. Reason](M, ...)
  end
end

function M:SendAddFriend(Uid, Message)
  self:GetAvatar():FriendSendAddRequest(Uid, Message)
end

function M:RecvRefreshMatchFriend(ErrCode, ...)
  if not self:CheckError(ErrCode, true) then
    return
  end
  self:NotifyEvent(FriendCommon.EventId.RefreshMatchFriendUI)
end

function M:SendRefreshMatchFriend()
  self:GetAvatar():RefreshRecentMatchedFriend()
end

function M:RecvAddFriend(ErrCode, ...)
  local Uid, bToast = ...
  if nil == bToast then
    bToast = true
  end
  ChatController:GetModel():AddFriendReddotNode(Uid, true)
  if not self:CheckError(ErrCode, true) then
    return
  end
  if bToast then
    self:ShowToast(GText("UI_Toast_Friend_AddRequestSend"))
  end
  self:NotifyEvent(FriendCommon.EventId.AddFriend, Uid)
end

function M:SendRefreshFriend()
  if 0 == FriendModel:GetFriendDict():Length() then
    self:RecvResponse(FriendCommon.EventId.RefreshFriend, ErrorCode.RET_SUCCESS)
    return
  end
  self:GetAvatar():RefreshFriendData()
end

function M:RecvRefreshFriend(ErrCode)
  if ErrCode == ErrorCode.RET_FRIEND_REFRESH_TOO_FAST then
    ErrCode = ErrorCode.RET_SUCCESS
  end
  if not self:CheckError(ErrCode, true) then
    return
  end
  self:NotifyEvent(FriendCommon.EventId.RefreshFriend, ErrCode)
end

function M:SendAgreeAdd(Uid, Coroutine)
  self:GetAvatar():FriendAgreeAddRequest(Uid, Coroutine)
  DebugPrint("SendAgreeAdd ++++++++++++++++++++++++++++++++++++++")
end

function M:RecvAgreeAdd(ErrCode, ...)
  local Uid, Coroutine = ...
  if not Coroutine then
    self:StopTimer(self.NetDelayTimer)
    self:NotifyEvent(FriendCommon.EventId.UnblockUI)
  else
    coroutine.resume(Coroutine, ErrCode)
    return
  end
  if not self:CheckError(ErrCode) then
    if ErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or ErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      self:NotifyEvent(FriendCommon.EventId.AgreeAdd, false)
    end
    return
  end
  self:GetModel():RemoveLastRequests(Uid)
  local FriendName = self:GetModel():GetFriendDict()[Uid].Info.Nickname
  self:ShowToast(string.format(GText("UI_Toast_Friend_PassRequest"), FriendName))
  self:NotifyEvent(FriendCommon.EventId.AgreeAdd, false)
end

function M:SendRefuseAdd(Uid, Coroutine)
  local FriendName = self:GetModel():GetRequestRecvBox()[Uid].Info.Nickname
  self:GetAvatar():FriendRefuseAddRequest(Uid, FriendName, Coroutine)
end

function M:RecvRefuseAdd(ErrCode, ...)
  local Uid, FriendName, Coroutine = ...
  if not Coroutine then
    self:StopTimer(self.NetDelayTimer)
    self:NotifyEvent(FriendCommon.EventId.UnblockUI)
  else
    coroutine.resume(Coroutine, ErrCode)
    return
  end
  if not self:CheckError(ErrCode) then
    if ErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or ErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      self:NotifyEvent(FriendCommon.EventId.RefuseAdd, false)
    end
    return
  end
  self:GetModel():RemoveLastRequests(Uid)
  self:ShowToast(string.format(GText("UI_Toast_Friend_RejectRequest"), FriendName))
  self:NotifyEvent(FriendCommon.EventId.RefuseAdd, false)
end

function M:SendDeleteFriend(Uid)
  local FriendName = self:GetModel():GetFriendDict()[Uid].Info.Nickname
  self:GetAvatar():FriendSendDeleteRequest(Uid, FriendName)
end

function M:RecvDeleteFriend(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  local Uid, FriendName = ...
  ChatController:SendChatNewMsgRead(Uid)
  ChatController:GetModel():ReadChannelMessage(ChatCommon.ChannelDef.Friend, Uid)
  if FriendName then
    self:ShowToast(string.format(GText("UI_Toast_Friend_DeleteSuccess"), FriendName))
  end
  self:NotifyEvent(FriendCommon.EventId.DeleteFriend, false, Uid)
end

function M:SendSetRemark(Uid, Remark)
  self:GetAvatar():FriendSetRemark(Uid, Remark)
end

function M:RecvSetRemark(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  local Uid = (...)
  self:NotifyEvent(FriendCommon.EventId.SetRemark, Uid)
end

function M:SendSetStar(Uid, bStar)
  if bStar then
    self:GetAvatar():FriendSetStar(Uid, bStar)
  else
    self:GetAvatar():FriendCancleStar(Uid, bStar)
  end
end

function M:RecvSetStar(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  local Uid, bStar = ...
  self:ShowToast(GText(bStar and "UI_Toast_Friend_SetStarSuccess" or "UI_Toast_Friend_RemoveStarSuccess"))
  self:NotifyEvent(FriendCommon.EventId.SetStar, true)
end

function M:SendSearch(Uid)
  self:GetAvatar():FriendSearch(Uid)
end

function M:RecvSearch(ErrCode, ...)
  local Uid, AvatarInfo = ...
  self:GetModel():CacheSearchRes(AvatarInfo)
  if not self:CheckError(ErrCode) then
    self:NotifyEvent(FriendCommon.EventId.Search, false)
    return
  end
  AvatarInfo.Uid = Uid
  self:NotifyEvent(FriendCommon.EventId.Search, true)
end

function M:SendAddBlackList(Uid, AvatarInfo)
  local PureAvatarInfo = {
    Uid = Uid,
    Nickname = AvatarInfo.Nickname,
    HeadIconId = AvatarInfo.HeadIconId,
    HeadFrameId = AvatarInfo.HeadFrameId,
    Level = AvatarInfo.Level
  }
  self:GetAvatar():FriendAddBlackList(Uid, PureAvatarInfo)
end

function M:RecvAddBlackList(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  local Uid, FriendName = ...
  ChatController:GetModel():ClearReddotCount(ChatCommon.ChannelDef.Friend, Uid)
  ChatController:GetModel():SetCurrentFriendUid(nil)
  self:ShowToast(string.format(GText("UI_Toast_Friend_AddBlcakListSuccess"), FriendName))
  self:NotifyEvent(FriendCommon.EventId.AddBlackList, false, Uid)
end

function M:SendCancelBlackList(Uid)
  local Nickname = self:GetModel():GetBlackListDict()[Uid].Nickname
  self:GetAvatar():FriendCancleBlackList(Uid, Nickname)
end

function M:RecvCancelBlackList(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  local Uid, Nickname = ...
  self:ShowToast(string.format(GText("UI_Toast_Friend_CancelBlcakListSuccess"), Nickname))
  self:NotifyEvent(FriendCommon.EventId.CancelBlackList, false)
end

function M:SendAgreeAll()
  local Coroutine
  local NewErrCode = ErrorCode.RET_SUCCESS
  DebugPrint("SendAgreeAll ++++++++++++++++++++++++++++++++++++++")
  Coroutine = coroutine.create(function()
    for _, Uid in ipairs(CommonUtils.Keys(self:GetModel():GetRequestRecvBox())) do
      self:SendAgreeAdd(Uid, Coroutine)
      NewErrCode = coroutine.yield()
      if NewErrCode == ErrorCode.RET_SUCCESS or NewErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or NewErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      else
        break
      end
      self:GetModel():RemoveLastRequests(Uid)
    end
    self:RecvResponse(FriendCommon.EventId.AgreeAll, NewErrCode)
  end)
  coroutine.resume(Coroutine)
end

function M:RecvAgreeAll(ErrCode)
  DebugPrint("RecvAgreeAll ++++++++++++++++++++++++++++++++++++++")
  if not self:CheckError(ErrCode) then
    if ErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or ErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      ErrCode = ErrorCode.RET_SUCCESS
    else
      return
    end
  end
  self:ShowToast(GText("UI_Toast_Friend_PassAllRequest"))
  self:NotifyEvent(FriendCommon.EventId.AgreeAll, false)
end

function M:SendRefuseAll()
  local Coroutine
  local NewErrCode = ErrorCode.RET_SUCCESS
  Coroutine = coroutine.create(function()
    for _, Uid in ipairs(CommonUtils.Keys(self:GetModel():GetRequestRecvBox())) do
      self:SendRefuseAdd(Uid, Coroutine)
      NewErrCode = coroutine.yield()
      if NewErrCode == ErrorCode.RET_SUCCESS or NewErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or NewErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      else
        break
      end
      self:GetModel():RemoveLastRequests(Uid)
    end
    self:RecvResponse(FriendCommon.EventId.RefuseAll, NewErrCode)
  end)
  coroutine.resume(Coroutine)
end

function M:RecvRefuseAll(ErrCode)
  if not self:CheckError(ErrCode) then
    if ErrCode == ErrorCode.RET_FRIEND_OTHER_PARTY_HOLD_MAX or ErrCode == ErrorCode.RET_FRIEND_REQUEST_TIMEOUT then
      ErrCode = ErrorCode.RET_SUCCESS
    else
      return
    end
  end
  self:ShowToast(GText("UI_Toast_Friend_RejectAllRequest"))
  self:NotifyEvent(FriendCommon.EventId.RefuseAll, false)
end

function M:SendGetRecommandList()
  self:GetAvatar():FriendGenerateRecommendList()
  self:GetModel():ClearSearchRes()
  self:StopTimer(self.RefreshRecommandTimer)
  self:StartRefreshRecommandTimer()
end

function M:RecvGetRecommandList(ErrCode, ...)
  if not self:CheckError(ErrCode) then
    return
  end
  self:NotifyEvent(FriendCommon.EventId.GetRecommandList, true)
end

function M:RecvRealUpdateFriendInfo(AvatarInfo)
  if TeamController then
    TeamController:RecvTeamMemberPropChange(AvatarInfo, AvatarInfo.Uid)
  end
  FriendModel:GetFriendList(true)
  self:NotifyEvent(FriendCommon.EventId.UpdateOneFriend, AvatarInfo.Uid)
end

function M:StartRefreshRecommandTimer()
  local Interval = 0.2
  local TotalTime = DataMgr.GlobalConstant.RecommandFriendCD.ConstantValue + 0.2
  local Timer = self:AddTimer(Interval, function()
    TotalTime = TotalTime - Interval
    if TotalTime <= 0 then
      self:NotifyEvent(FriendCommon.EventId.RecommandCdUpdate, true)
      self:StopTimer(self.RefreshRecommandTimer)
      self.RefreshRecommandTimer = nil
      TotalTime = DataMgr.GlobalConstant.RecommandFriendCD.ConstantValue + 0.2
      return
    end
    local Percent = TotalTime / DataMgr.GlobalConstant.RecommandFriendCD.ConstantValue
    self:NotifyEvent(FriendCommon.EventId.RecommandCdUpdate, false, Percent)
  end, true, 0, nil, true)
  self.RefreshRecommandTimer = Timer
end

function M:StartNetDelayTimer()
  local Delay = 5
  local Timer = self:AddTimer(Delay, function()
    self:ShowToast(GText("UI_Toast_NetDelay"))
    self:NotifyEvent(FriendCommon.EventId.UnblockUI)
    DebugPrint("TimerDone++++++++++++++++++", self.NetDelayTimer)
    self.NetDelayTimer = nil
  end, false, 0, nil, true)
  self.NetDelayTimer = Timer
  DebugPrint("++++++++++++++++++ startTimer", Timer)
end

_G.FriendController = M
return M
