local CommonConst = require("CommonConst")
local CommonUtils = require("Utils.CommonUtils")
local ServerConfig = require("ServerConfig")
local TimerMgr = require("BluePrints.Common.TimerMgr")
local HeroUSDKUtils = {}

function HeroUSDKUtils.IsEnable()
  return HeroUSDKSubsystem(GWorld.GameInstance):IsHeroSDKEnable()
end

function HeroUSDKUtils.IsGlobalSDK()
  return HeroUSDKSubsystem(GWorld.GameInstance):IsGlobalSDK()
end

function HeroUSDKUtils.HasLogin()
  return HeroUSDKSubsystem(GWorld.GameInstance).UserInfo.sdkUserId ~= ""
end

function HeroUSDKUtils.GetUserInfo()
  return HeroUSDKSubsystem(GWorld.GameInstance).UserInfo
end

function HeroUSDKUtils.GenHeroHDCGameRoleInfo(RoleId, RoleName, Level)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  if not IsValid(GWorld.GameInstance) then
    return nil
  end
  local GameRoleInfo = FHeroHDCGameRoleInfo()
  GameRoleInfo.channelUserId = HeroUSDKSubsystem(GWorld.GameInstance).UserInfo.sdkUserId
  GameRoleInfo.gameUserId = CommonUtils.ObjId2Str(PlayerAvatar.Eid)
  GameRoleInfo.serverId = tostring(PlayerAvatar.Hostnum)
  GameRoleInfo.serverName = ServerConfig[PlayerAvatar.Hostnum].Name
  GameRoleInfo.roleId = PlayerAvatar.Uid
  GameRoleInfo.roleName = PlayerAvatar.Nickname
  GameRoleInfo.roleAvatar = ""
  GameRoleInfo.level = Level and tostring(Level) or tostring(PlayerAvatar.Level)
  GameRoleInfo.vipLevel = "0"
  GameRoleInfo.gold1 = tostring(PlayerAvatar.Resources[CommonConst.PlatinumItemId] and PlayerAvatar.Resources[CommonConst.PlatinumItemId].Count or 0)
  GameRoleInfo.gold2 = tostring(PlayerAvatar.Resources[CommonConst.ExpItemId] and PlayerAvatar.Resources[CommonConst.ExpItemId].Count or 0)
  return GameRoleInfo
end

function HeroUSDKUtils.SetHeroUSDKUploadBaseData(Data, PlayerAvatar)
  Data.Server_Id = tonumber(PlayerAvatar.HostNum)
  Data.Role_Id = CommonUtils.ObjId2Str(PlayerAvatar.Eid)
  Data.Role_Name = PlayerAvatar.Account
end

function HeroUSDKUtils.GenHeroUSDKUploadChatItemData(ChatContents)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local HeroUSDKUploadChatData = FHeroUSDKUploadChatData()
  for i = 1, #ChatContents do
    local HeroUSDKUploadChatItemData = FHeroUSDKUploadChatItemData()
    HeroUSDKUtils.SetHeroUSDKUploadBaseData(HeroUSDKUploadChatItemData, PlayerAvatar)
    HeroUSDKUploadChatItemData.Type = 0
    HeroUSDKUploadChatItemData.Message = tostring(ChatContents[i])
    HeroUSDKUploadChatItemData.Vip_Level = 0
    HeroUSDKUploadChatItemData.Level = PlayerAvatar.Level
    HeroUSDKUploadChatItemData.Channel_Id = HeroUSDKSubsystem():GetChannelId()
    HeroUSDKUploadChatData.Chat_Items:Add(HeroUSDKUploadChatItemData)
  end
  return HeroUSDKUploadChatData
end

function HeroUSDKUtils.GenHeroUSDKUploadReportData(ReportData)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local HeroUSDKUploadReportData = FHeroUSDKUploadReportData()
  for i = 1, #ReportData do
    local HeroUSDKUploadReportItemData = FHeroUSDKUploadReportItemData()
    HeroUSDKUtils.SetHeroUSDKUploadBaseData(HeroUSDKUploadReportItemData, PlayerAvatar)
    HeroUSDKUploadReportItemData.From_Server_Id = ReportData[i].FromServerId
    HeroUSDKUploadReportItemData.From_Role_Id = ReportData[i].FromRoleId
    HeroUSDKUploadReportItemData.From_Role_Name = ReportData[i].FromRoleName
    HeroUSDKUploadReportItemData.Level = PlayerAvatar.Level
    HeroUSDKUploadReportItemData.Vip_Level = 0
    HeroUSDKUploadReportItemData.Text = ReportData[i].Text
    HeroUSDKUploadReportItemData.Remark = ReportData[i].Remark
    HeroUSDKUploadReportItemData.Reason = ReportData[i].Reason
    HeroUSDKUploadReportData.Report_Items:Add(HeroUSDKUploadReportItemData)
  end
  return HeroUSDKUploadReportData
end

function HeroUSDKUtils.GenHeroUSDKUploadLogItemData(LogItemData)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local HeroUSDKUploadLogData = FHeroUSDKUploadLogData()
  for i = 1, #LogItemData do
    local HeroUSDKUploadLogItemData = FHeroUSDKUploadLogItemData()
    HeroUSDKUtils.SetHeroUSDKUploadBaseData(HeroUSDKUploadLogItemData, PlayerAvatar)
    HeroUSDKUploadLogItemData.Ban_Type = LogItemData[i].BanType
    HeroUSDKUploadLogItemData.Ban_Reason = LogItemData[i].BanReason
    HeroUSDKUploadLogItemData.Ban_Begin_Time = LogItemData[i].BanBeginTime
    HeroUSDKUploadLogItemData.Ban_End_Time = LogItemData[i].BanEndTime
    HeroUSDKUploadLogData.Log_Items:Add(HeroUSDKUploadLogItemData)
  end
  return HeroUSDKUploadLogData
end

function HeroUSDKUtils.CheckStringSensitive(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, SkipServerCheck)
  local SDKFinished = false
  local ServerFinished = SkipServerCheck or false
  local SDKSucc = false
  local ServerSucc = false
  local FirstSDKCheck = false
  local RealStr = string.gsub(Str, "%s", "")
  print(_G.LogTag, "LXZ SDK CheckStringSensitive")
  HeroUSDKSubsystem():RequestRealTimeContentValidate(RealStr, {
    CallObject,
    function(CallObject, ResponseData)
      print(_G.LogTag, "LXZ SDK CheckStringSensitive Callback", ServerFinished, ServerSucc, ServerFinished)
      SDKFinished = true
      if 0 == ResponseData.Data.Result then
        SDKSucc = true
      end
      local ExtraParam = {
        SDKFinished = SDKFinished,
        ServerFinished = ServerFinished,
        SDKSucc = SDKSucc,
        ServerSucc = ServerSucc,
        FirstSDKCheck = FirstSDKCheck,
        ResponseData = ResponseData
      }
      HeroUSDKUtils.TryCheckStringSensitiveFinished(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
      FirstSDKCheck = true
    end
  }, {})
  local Avatar = GWorld:GetAvatar()
  if not Avatar or ServerFinished then
    return
  end
  print(_G.LogTag, "LXZ Server CheckStringSensitive")
  
  local function CallBack(NowErrorCode, BackStr)
    ServerFinished = true
    if NowErrorCode == ErrorCode.RET_SUCCESS then
      ServerSucc = true
    end
    local ExtraParam = {
      SDKFinished = SDKFinished,
      ServerFinished = ServerFinished,
      SDKSucc = SDKSucc,
      ServerSucc = ServerSucc,
      FirstSDKCheck = FirstSDKCheck,
      ErrorCode = NowErrorCode,
      Str = BackStr
    }
    if SDKFinished and SDKSucc or not SDKFinished then
      HeroUSDKUtils.TryCheckStringSensitiveFinished(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
    end
  end
  
  Avatar:FilterStringSensitiveWord(RealStr, CallBack)
end

function HeroUSDKUtils.TryCheckStringSensitiveFinished(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
  print(_G.LogTag, "LXZ TryCheckStringSensitiveFinished", ExtraParam.ServerFinished, ExtraParam.SDKFinished, ExtraParam.ResponseData, ExtraParam.ServerSucc, ExtraParam.SDKSucc, ExtraParam.FirstSDKCheck)
  if ExtraParam.SDKFinished and not ExtraParam.FirstSDKCheck then
    HeroUSDKUtils.CheckStringSensitiveFinished(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
  elseif ExtraParam.ServerFinished and not ExtraParam.SDKFinished then
    TimerMgr.AddTimer(CallObject, 1, HeroUSDKUtils.CheckStringSensitiveFinished, false, 0, "WaitSensitiveFinished", true, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
  end
end

function HeroUSDKUtils.CheckStringSensitiveFinished(CallObject, Str, SensitiveCallBack, NotSensitiveCallBack, ExtraParam)
  TimerMgr.RemoveTimer(CallObject, "WaitSensitiveFinished", true)
  if not ExtraParam.ResponseData then
    if ExtraParam.ErrorCode == ErrorCode.RET_SUCCESS then
      print(_G.LogTag, "LXZ Server CheckStringSensitiveFinished succ")
      NotSensitiveCallBack(CallObject, Str)
    else
      print(_G.LogTag, "LXZ Server CheckStringSensitiveFinished fail")
      SensitiveCallBack(CallObject, ExtraParam.Str, Str, nil)
    end
  else
    print(_G.LogTag, "LXZ SDK CheckStringSensitiveFinished")
    if 0 == ExtraParam.ResponseData.Data.Result then
      print(_G.LogTag, "LXZ SDK CheckStringSensitiveFinished succ")
      print(_G.LogTag, "LXZ SDK CheckStringSensitiveFinished", ExtraParam.ResponseData.Msg, ExtraParam.ResponseData.Code)
      NotSensitiveCallBack(CallObject, Str)
    else
      print(_G.LogTag, "LXZ SDK CheckStringSensitiveFinished fail", ExtraParam.ResponseData.Data.Result)
      print(_G.LogTag, "LXZ SDK Msg:", ExtraParam.ResponseData.Msg)
      print(_G.LogTag, "LXZ SDK Code:", ExtraParam.ResponseData.Code)
      print(_G.LogTag, "LXZ SDK Data Result:", ExtraParam.ResponseData.Data.Result)
      print(_G.LogTag, "LXZ SDK Data Replace_Content:", ExtraParam.ResponseData.Data.Replace_Content)
      SensitiveCallBack(CallObject, ExtraParam.ResponseData.Data.Replace_Content, Str, ExtraParam.ResponseData.Data.Words)
    end
  end
end

return HeroUSDKUtils
