local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommonDye", {
  [30112] = {
    CommonDyeID = 30112,
    DyeID = {
      30102,
      30103,
      30104,
      30105,
      30106,
      30107,
      30109
    }
  }
})
