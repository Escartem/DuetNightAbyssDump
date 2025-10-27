local FriendCommon = {}
FriendCommon.UIName = "FriendMain"
FriendCommon.DialogName = "FriendDialog"
FriendCommon.ReddotName = "NewFriendRequest"
FriendCommon.FriendDialogType = {FriendRequest = -1, BlackList = -2}
FriendCommon.FriendTabType = {
  MyFriend = 1,
  AddFriend = 2,
  RecentMatch = 3,
  RegionFriend = 4
}
FriendCommon.EmptyItem = 0
FriendCommon.MainUIId = 14
FriendCommon.DeleteDialog = 100078
FriendCommon.PullBlackDialog = 100076
FriendCommon.RejectAllDialog = 100077
FriendCommon.RemarkDialogNotInput = 100085
FriendCommon.RequestDialogNotInput = 100086
FriendCommon.EventId = {
  RefreshFriend = "RefreshFriend",
  AddFriend = "AddFriend",
  AgreeAdd = "AgreeAdd",
  RefuseAdd = "RefuseAdd",
  DeleteFriend = "DeleteFriend",
  SetRemark = "SetRemark",
  SetStar = "SetStar",
  Search = "Search",
  AddBlackList = "AddBlackList",
  CancelBlackList = "CancelBlackList",
  AgreeAll = "AgreeAll",
  RefuseAll = "RefuseAll",
  GetRecommandList = "GetRecommandList",
  RecommandCdUpdate = "RecommandCdUpdate",
  UpdateMatchList = "UpdateMatchList",
  BlockUI = "BlockUI",
  UnblockUI = "UnblockUI",
  UpdateOneFriend = "UpdateOneFriend",
  RefreshMatchFriend = "RefreshMatchFriend",
  RefreshMatchFriendUI = "RefreshMatchFriendUI"
}
_G.FriendCommon = FriendCommon
return FriendCommon
