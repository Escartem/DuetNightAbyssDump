local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BuffOnlyAttrs", {
  FakeHpRate = {ActiveRule = false, ID = "FakeHpRate"},
  MaxDamagedValue = {
    ActiveRule = false,
    ID = "MaxDamagedValue"
  }
})
