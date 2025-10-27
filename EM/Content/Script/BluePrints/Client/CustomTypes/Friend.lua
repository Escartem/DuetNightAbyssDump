local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local TimeUtils = require("Utils.TimeUtils")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Friend = Class("Friend", CustomTypes.CustomAttr)
Friend.__Props__ = {
  Uid = prop.prop("Int", "client save"),
  Eid = prop.prop("ObjId", "client save"),
  Remark = prop.prop("Str", "client save", ""),
  Star = prop.prop("Bool", "client save", false),
  Info = prop.prop("AvatarInfo.AvatarInfo", "client save")
}

function Friend:Init(Uid)
  self.Uid = Uid
end

function Friend:IsOnMission()
  return 0 == self.Info.CurrentRegionId
end

function Friend:Update(Infos)
  self.Info:Update(Infos)
end

function Friend:Serialize()
  local info = self.Info:Serialize()
  return info
end

FormatProperties(Friend)
local FriendDict = Class("FriendDict", CustomTypes.CustomDict)
FriendDict.KeyType = BaseTypes.Int
FriendDict.ValueType = Friend

function FriendDict:NewFriend(Uid)
  return Friend(Uid)
end

function FriendDict:NewFriendByAvatarInfo(info)
  local friend = Friend(info.Uid)
  friend.Eid = info.Eid
  friend:Update(info)
  return friend
end

local RecentMatchedFriend = Class("RecentMatchedFriend", CustomTypes.CustomAttr)
RecentMatchedFriend.__Props__ = {
  Uid = prop.prop("Int", "client save"),
  Eid = prop.prop("ObjId", "client save"),
  MatchTime = prop.prop("Int", "client save"),
  Info = prop.prop("AvatarInfo.AvatarInfo", "client save")
}

function RecentMatchedFriend:Init(Uid)
  self.Uid = Uid
end

function RecentMatchedFriend:IsOnMission()
  return 0 == self.Info.CurrentRegionId
end

function RecentMatchedFriend:Update(Infos)
  self.Info:Update(Infos)
end

function RecentMatchedFriend:Serialize()
  local info = self.Info:Serialize()
  return info
end

FormatProperties(RecentMatchedFriend)
local RecentMatchedFriendDict = Class("RecentMatchedFriendDict", CustomTypes.CustomDict)
RecentMatchedFriendDict.KeyType = BaseTypes.Int
RecentMatchedFriendDict.ValueType = RecentMatchedFriend

function RecentMatchedFriendDict:NewRecentMatchedFriend(Uid)
  return RecentMatchedFriend(Uid)
end

function RecentMatchedFriendDict:NewRecentMatchedFriendByAvatarInfo(info)
  local RecentMatchedFriend = RecentMatchedFriend(info.Uid)
  RecentMatchedFriend.Eid = info.Eid
  RecentMatchedFriend:Update(info)
  return RecentMatchedFriend
end

local FriendRequest = Class("FriendRequest", CustomTypes.CustomAttr)
FriendRequest.__Props__ = {
  Uid = prop.prop("Int", "client save"),
  Time = prop.prop("Int", "client save", 0),
  Remark = prop.prop("Str", "client save", ""),
  Info = prop.prop("AvatarInfo.AvatarInfo", "client save")
}

function FriendRequest:Init(uid, remark, info)
  self.Uid = uid
  if remark then
    self.Remark = remark
  end
  if info then
    info.Uid = uid
    self.Info:Update(info)
  end
end

function FriendRequest:Update(info)
  self.Info:Update(info)
end

function FriendRequest:IsExpired()
  local MaxDay = DataMgr.GlobalConstant.FriendApplyDuration.ConstantValue
  return self.Time + MaxDay * CommonConst.SECOND_IN_DAY < TimeUtils.NowTime()
end

FormatProperties(FriendRequest)
local FriendRequestDict = Class("FriendRequestDict", CustomTypes.CustomDict)
FriendRequestDict.KeyType = BaseTypes.Int
FriendRequestDict.ValueType = FriendRequest

function FriendRequestDict:NewFriendRequest(uid)
  return FriendRequest(uid)
end

function FriendRequestDict:NewFriendRequestByAvatarInfo(info)
  local friendRequest = FriendRequest(info.Uid)
  friendRequest:Update(info)
  return friendRequest
end

return {
  Friend = Friend,
  FriendDict = FriendDict,
  FriendRequest = FriendRequest,
  FriendRequestDict = FriendRequestDict,
  RecentMatchedFriend = RecentMatchedFriend,
  RecentMatchedFriendDict = RecentMatchedFriendDict
}
