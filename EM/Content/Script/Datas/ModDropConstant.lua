local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModDropConstant", {
  DailyFreeTicketAmount = {
    ConstantName = "DailyFreeTicketAmount"
  },
  DailyModDungeonAmount = {
    ConstantName = "DailyModDungeonAmount"
  },
  EventBonus = {ConstantName = "EventBonus"}
})
