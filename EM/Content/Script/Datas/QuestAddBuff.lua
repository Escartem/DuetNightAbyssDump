local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestAddBuff", {
  [10010108] = {
    AddorRemove = "Add",
    BuffId = {304, 309},
    QuestId = 10010108,
    QuestStartorSuccess = "Start"
  },
  [10010212] = {
    AddorRemove = "Add",
    BuffId = {99},
    QuestId = 10010212,
    QuestStartorSuccess = "Start"
  },
  [10010305] = {
    AddorRemove = "Add",
    BuffId = {306},
    QuestId = 10010305,
    QuestStartorSuccess = "Success"
  },
  [10010306] = {
    AddorRemove = "Remove",
    BuffId = {
      304,
      99,
      306,
      309
    },
    QuestId = 10010306,
    QuestStartorSuccess = "Success"
  }
})
