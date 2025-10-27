local T = {}
T.RT_1 = {
  [1] = 0,
  [2] = 1
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TalkTag", {
  Huozai04Tag = {
    TalkTagId = "Huozai04Tag",
    Value = T.RT_1
  },
  TestTag = {
    TalkTagId = "TestTag",
    Value = {
      [1] = 0,
      [2] = 1,
      [3] = 2,
      [4] = 3,
      [5] = 4
    }
  },
  XiAoTag = {
    TalkTagId = "XiAoTag",
    Value = T.RT_1
  }
})
