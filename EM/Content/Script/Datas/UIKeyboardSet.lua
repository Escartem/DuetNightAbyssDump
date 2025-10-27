local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("UIKeyboardSet", {
  BattleFort = {
    ActionNameList = {
      "Attack",
      "Fire",
      "QuitChallenge",
      "OpenMenu"
    },
    IsWhiteList = true,
    KeyboardSetName = "BattleFort"
  },
  BlackScreen = {
    IsWhiteList = true,
    KeyboardSetName = "BlackScreen"
  },
  Dead = {
    ActionNameList = {"OpenMenu", "Recovery"},
    IsWhiteList = true,
    KeyboardSetName = "Dead"
  },
  DeadInRegion = {
    ActionNameList = {"Recovery"},
    IsWhiteList = true,
    KeyboardSetName = "DeadInRegion"
  },
  InBattleWheel = {
    ActionNameList = {
      "OpenBattleWheel"
    },
    IsWhiteList = true,
    KeyboardSetName = "InBattleWheel"
  },
  InDeliver = {IsWhiteList = true, KeyboardSetName = "InDeliver"},
  Invitation = {IsWhiteList = true, KeyboardSetName = "Invitation"},
  LoadingReconnect = {
    IsWhiteList = true,
    KeyboardSetName = "LoadingReconnect"
  },
  PopupConfirm = {
    ActionNameList = {"BulletJump"},
    KeyboardSetName = "PopupConfirm"
  }
})
