local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FishingBook", {
  [2101] = {
    FishConditionCont = "Textmap_FishCondition_Day",
    FishId = 2101,
    FishingNoteId = 2101
  },
  [2102] = {
    FishConditionCont = "Textmap_FishCondition_Day",
    FishId = 2102,
    FishingNoteId = 2102
  }
})
