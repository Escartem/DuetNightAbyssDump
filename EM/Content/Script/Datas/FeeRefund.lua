local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FeeRefund", {
  [1] = {
    EventId = 105001,
    Id = 1,
    Mail = 10007,
    PayLevel1 = 0,
    PayLevel2 = 2000,
    PayLevel3 = 5000,
    PayProportion = 10,
    ProgressMax = 10000,
    RefundLevel1 = 2,
    RefundLevel2 = 1.5,
    RefundLevel3 = 1.28,
    RefundMax = 2
  }
})
