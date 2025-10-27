local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestPickup", {
  [1] = {
    DropId = 30007,
    PickupCount = 1,
    QuestChainId = 100102,
    QuestPickupId = 1
  },
  [2] = {
    DropId = 30008,
    PickupCount = 1,
    QuestChainId = 100102,
    QuestPickupId = 2
  },
  [3] = {
    DropId = 30009,
    PickupCount = 1,
    QuestChainId = 100102,
    QuestPickupId = 3
  }
})
