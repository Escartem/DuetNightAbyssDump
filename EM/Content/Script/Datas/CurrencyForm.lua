local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CurrencyForm", {
  [100] = {
    IfAdd = true,
    IfMax = false,
    ResourceID = 100
  },
  [103] = {
    IfAdd = true,
    IfMax = true,
    ResourceID = 103
  }
})
