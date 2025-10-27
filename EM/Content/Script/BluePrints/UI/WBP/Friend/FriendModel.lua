local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  self._SortType = nil
  self._OnlineFriendList = nil
  self._FriendList = nil
  self._FriendRequestList = nil
  self._Avatar = nil
  self:GetAvatar()
  self:_InitSortFunc()
  self:InitReddotCount()
  self:GetFriendList(true)
  self:GetFriendRequestList(true)
  self:AddReddotCount()
end

function M:GetFriendList(bUpdate)
  if not (self._FriendList or self._OnlineFriendList) or bUpdate then
    self._FriendList = {}
    self._OnlineFriendList = {}
    for Uid, Friend in pairs(self:GetFriendDict()) do
      table.insert(self._FriendList, Uid)
      if Friend.Info.IsOnline then
        table.insert(self._OnlineFriendList, Uid)
      end
    end
  end
  return self._FriendList, self._OnlineFriendList
end

function M:GetFriendRequestList(bUpdate)
  if not self._FriendRequestList or bUpdate then
    self._FriendRequestList = {}
    for Uid, FriendRequest in pairs(self:GetRequestRecvBox()) do
      table.insert(self._FriendRequestList, Uid)
    end
  end
  if not next(self._FriendRequestList) then
    self:CleanReddotCount()
  end
  return self._FriendRequestList
end

function M:CacheSearchRes(AvatarInfo)
  if not AvatarInfo then
    self._SearchRes = {}
    return
  end
  self._SearchRes = {
    [AvatarInfo.Uid] = AvatarInfo
  }
end

function M:ClearSearchRes()
  self._SearchRes = {}
end

function M:GetSearchRes()
  return self._SearchRes
end

function M:GetFriendDict()
  return self:GetAvatar().Friends
end

function M:GetSelfUid()
  return self:GetAvatar().Uid
end

function M:GetBlackListDict()
  return self:GetAvatar().Blacklist
end

function M:GetRecentMatchDict()
  return self:GetAvatar().RecentMatchList
end

function M:GetRequestSendBox()
  return self:GetAvatar().FriendRequestSendBox
end

function M:GetRequestRecvBox()
  return self:GetAvatar().FriendRequestReceiveBox
end

function M:GetRecommendDict()
  return self:GetAvatar().RecommendFriendList
end

function M:GetRegionFriendDict()
  local RegionFriendDict = {}
  local FriendDict = self:GetFriendDict()
  local RegionAvatars = self:GetAvatar().RegionAvatars or {}
  for i, V in pairs(RegionAvatars) do
    if V.AvatarInfo and V.AvatarInfo.Uid and not FriendDict[V.AvatarInfo.Uid] then
      RegionFriendDict[V.AvatarInfo.Uid] = V.AvatarInfo
    end
  end
  return RegionFriendDict
end

function M:GetRegionDict()
  local RegionFriendDict = {}
  local RegionAvatars = self:GetAvatar().RegionAvatars or {}
  for i, V in pairs(RegionAvatars) do
    if V.AvatarInfo and V.AvatarInfo.Uid then
      RegionFriendDict[V.AvatarInfo.Uid] = V.AvatarInfo
    end
  end
  return RegionFriendDict
end

function M:GetNicknameByUid(Uid)
  local Nickname = ""
  if "" == Nickname then
    local FriendInfo = self:GetFriendDict()[Uid]
    if FriendInfo then
      return FriendInfo.Info.Nickname
    end
  end
  if "" == Nickname then
    local RecentMatch = self:GetRecentMatchDict()[Uid]
    if RecentMatch then
      return RecentMatch.Nickname
    end
  end
  return ""
end

function M:AddReddotCount()
  local ReddotNode = ReddotManager.GetTreeNode(FriendCommon.ReddotName)
  if ReddotNode.Count > 0 then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(FriendCommon.ReddotName)
  local LastRequests = CacheDetail.LastRequests or {}
  CacheDetail.LastRequests = {}
  if not next(self._FriendRequestList) then
    return
  end
  local bDiff = false
  for Uid, _ in pairs(LastRequests) do
    if not (self:GetRequestRecvBox() or {})[Uid] then
      bDiff = true
      break
    end
  end
  for Uid, _ in pairs(self:GetRequestRecvBox() or {}) do
    if not bDiff and not LastRequests[Uid] then
      bDiff = true
    end
    CacheDetail.LastRequests[Uid] = 1
  end
  if bDiff or not CacheDetail.IsRead then
    CacheDetail.IsRead = false
    ReddotManager.IncreaseLeafNodeCount(FriendCommon.ReddotName)
  end
end

function M:RemoveLastRequests(Uid)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(FriendCommon.ReddotName) or {}
  local LastRequests = CacheDetail.LastRequests or {}
  LastRequests[Uid] = nil
end

function M:CleanReddotCount()
  local ReddotNode = ReddotManager.GetTreeNode(FriendCommon.ReddotName)
  if 0 == ReddotNode.Count then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(FriendCommon.ReddotName)
  if CacheDetail.IsRead then
    return
  end
  CacheDetail.IsRead = true
  ReddotManager.DecreaseLeafNodeCount(FriendCommon.ReddotName)
end

function M:InitReddotCount()
  ReddotManager.AddNode(FriendCommon.ReddotName)
  local DateObj = TimeUtils.TimestampToDataObj(TimeUtils.NowTime())
  local Date = table.concat({
    DateObj.year,
    DateObj.month,
    DateObj.day
  }, "-")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(FriendCommon.ReddotName)
  if Date == CacheDetail.Date and CacheDetail.IsRead then
    return
  end
  CacheDetail.Date = Date
  CacheDetail.IsRead = false
end

function M:_InitSortFunc()
  local function Compare(X, Y)
    if X == Y then
      return false
    end
    if self._SortType == CommonConst.DESC then
      return Y < X
    end
    return X < Y
  end
  
  self._FriendListSortFunc = {
    [1] = function(Uid1, Uid2)
      local F1 = self:GetFriendDict()[Uid1]
      local F2 = self:GetFriendDict()[Uid2]
      if F1.Star ~= F2.Star then
        return F1.Star
      end
      local W1 = self:_CalculateStatusWeight(F1.Info)
      local W2 = self:_CalculateStatusWeight(F2.Info)
      if W1 ~= W2 then
        return W1 < W2
      end
      return Compare(F1.Info.LastLogoutTime, F2.Info.LastLogoutTime)
    end,
    [2] = function(Uid1, Uid2)
      local F1 = self:GetFriendDict()[Uid1]
      local F2 = self:GetFriendDict()[Uid2]
      if F1.Star ~= F2.Star then
        return F1.Star
      end
      local W1 = self:_CalculateStatusWeight(F1.Info)
      local W2 = self:_CalculateStatusWeight(F2.Info)
      if W1 ~= W2 then
        return W1 < W2
      end
      return Compare(F1.Info.Level, F2.Info.Level)
    end,
    [3] = function(Uid1, Uid2)
      local C1 = self:GetAvatar().Chats[Uid1]
      local C2 = self:GetAvatar().Chats[Uid2]
      if C1 and C2 and C1:GetUnreadCount() > 0 ~= (C2:GetUnreadCount() > 0) then
        return C1:GetUnreadCount() > 0
      end
      local F1 = self:GetFriendDict()[Uid1]
      local F2 = self:GetFriendDict()[Uid2]
      if F1.Star ~= F2.Star then
        return F1.Star
      end
      local W1 = self:_CalculateStatusWeight(F1.Info)
      local W2 = self:_CalculateStatusWeight(F2.Info)
      if W1 ~= W2 then
        return W1 < W2
      end
      return C1 and C2 and C1.Messages[C1.Messages:Length()].Time > C2.Messages[C2.Messages:Length()].Time
    end
  }
  self._FriendRequestSortFunc = {
    [1] = function(Uid1, Uid2)
      local FR1 = self:GetRequestRecvBox()[Uid1]
      local FR2 = self:GetRequestRecvBox()[Uid2]
      return Compare(FR1.Time, FR2.Time)
    end
  }
end

function M:SortFriends(FuncIdx, SortType)
  if not self._FriendListSortFunc then
    return
  end
  self._SortType = SortType
  table.sort(self._FriendList, self._FriendListSortFunc[FuncIdx])
  table.sort(self._OnlineFriendList, self._FriendListSortFunc[FuncIdx])
  self._SortType = nil
end

function M:SortFriendRequests(FuncIdx, SortType)
  if not self._FriendRequestSortFunc then
    return
  end
  self._SortType = SortType
  table.sort(self._FriendRequestList, self._FriendRequestSortFunc[FuncIdx])
  self._SortType = nil
end

function M:_CalculateStatusWeight(FriendInfo)
  if FriendInfo.IsOnline and not FriendInfo.IsInDungeon then
    return 1
  elseif FriendInfo.IsOnline and FriendInfo.IsInDungeon then
    return 2
  else
    return 3
  end
end

return M
