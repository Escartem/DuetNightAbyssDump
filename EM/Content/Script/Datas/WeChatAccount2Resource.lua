local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeChatAccount2Resource", {
  robot_1 = {
    Resource = {
      [100] = 100,
      [110] = 20
    },
    ServerId = 101,
    cid = 18,
    cuid = "asdaf1"
  }
})
