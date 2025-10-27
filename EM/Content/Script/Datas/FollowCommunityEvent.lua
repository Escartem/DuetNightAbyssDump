local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FollowCommunityEvent", {
  China = {
    CommunityList = {
      1,
      2,
      3
    },
    ServerId = "China"
  }
})
