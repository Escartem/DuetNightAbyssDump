local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ActionPointPrice", {
  [1] = {
    PurchasePrice = 40,
    PurchaseResourceId = 100,
    PurchaseTime = 1
  },
  [2] = {
    PurchasePrice = 60,
    PurchaseResourceId = 100,
    PurchaseTime = 2
  },
  [3] = {
    PurchasePrice = 60,
    PurchaseResourceId = 100,
    PurchaseTime = 3
  },
  [4] = {
    PurchasePrice = 100,
    PurchaseResourceId = 100,
    PurchaseTime = 4
  },
  [5] = {
    PurchasePrice = 100,
    PurchaseResourceId = 100,
    PurchaseTime = 5
  },
  [6] = {
    PurchasePrice = 150,
    PurchaseResourceId = 100,
    PurchaseTime = 6
  },
  [7] = {
    PurchasePrice = 150,
    PurchaseResourceId = 100,
    PurchaseTime = 7
  },
  [8] = {
    PurchasePrice = 200,
    PurchaseResourceId = 100,
    PurchaseTime = 8
  }
})
