local T = {}
T.RT_1 = {"CharTitle"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharTrialEvent", {
  [105101014] = {
    CharId = 1801,
    CharTrialId = 101017,
    ColorVarName = "Type_Light",
    Eventld = 105101014,
    HideBPNode = T.RT_1,
    InterfaceJumpId = 57,
    TrialReward = 20000,
    TrialType = "Char",
    WalnutId = 1005
  },
  [105102011] = {
    CharId = 5301,
    CharTrialId = 101012,
    ColorVarName = "Type_Wind",
    Eventld = 105102011,
    GachaTabId = 2,
    HideBPNode = T.RT_1,
    SkinId = 530101,
    TrialReward = 20000,
    TrialType = "Skin"
  },
  [105102012] = {
    CharId = 2101,
    CharTrialId = 101014,
    ColorVarName = "Type_Water",
    Eventld = 105102012,
    GachaTabId = 1,
    HideBPNode = T.RT_1,
    SkinId = 210102,
    TrialReward = 20000,
    TrialType = "Skin"
  },
  [105102013] = {
    CharId = 5101,
    CharTrialId = 101015,
    ColorVarName = "Type_Wind",
    Eventld = 105102013,
    GachaTabId = 1,
    HideBPNode = T.RT_1,
    SkinId = 510101,
    TrialReward = 20000,
    TrialType = "Skin"
  }
})
