local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ZhiLiuChat", {
  [1] = {
    ChatType = 1,
    Key = 1,
    Sequence = 1
  },
  [2] = {
    ChatType = 1,
    Key = 2,
    Sequence = 2
  },
  [3] = {
    ChatType = 1,
    Key = 3,
    Sequence = 3
  },
  [4] = {
    ChatType = 2,
    Key = 4,
    Sequence = 1
  },
  [5] = {
    ChatType = 2,
    Key = 5,
    Sequence = 2
  },
  [6] = {
    ChatType = 2,
    Key = 6,
    Sequence = 3
  }
})
