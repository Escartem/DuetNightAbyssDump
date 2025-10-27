local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TestCharGroupPool", {
  [1] = {
    PoolId = 1,
    RuleIdList = {
      "101101:1010101",
      "102101:1010201",
      "102301:1010101",
      "102401:1020502",
      "103101:1020203",
      "104201:1010203"
    }
  }
})
