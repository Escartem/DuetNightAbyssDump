local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("H5RewardAccount2Mail", {
  ["hero@asdaf1"] = {
    MailID = {
      [1] = 10001,
      [2] = 10002,
      [3] = 10003
    },
    ServerId = 101,
    cid = 18,
    cuid = "asdaf1"
  }
})
