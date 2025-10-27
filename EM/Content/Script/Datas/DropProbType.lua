local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DropProbType", {
  DropTag_Prob = {
    DropTypeKey = "DropTag_Prob",
    DropTypeText = "DropTypeText_Prob"
  },
  DropType_Fixed = {
    DropTypeKey = "DropType_Fixed",
    DropTypeText = "DropTypeText_Fixed"
  },
  DropType_Rare = {
    DropTypeKey = "DropType_Rare",
    DropTypeText = "DropTypeText_Rare",
    IsRareItem = true
  }
})
