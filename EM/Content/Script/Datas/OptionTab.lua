local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("OptionTab", {
  [1] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingKeyboard.T_Tab_SettingKeyboard'",
    IsMobileHide = true,
    TabId = 1,
    TabName = "UI_OPTION_SETKEY",
    Tag = "Key"
  },
  [2] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingControl.T_Tab_SettingControl'",
    TabId = 2,
    TabName = "UI_OPTION_CONTROLLER",
    Tag = "Control"
  },
  [3] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingDisplay.T_Tab_SettingDisplay'",
    TabId = 3,
    TabName = "UI_OPTION_DISPLAY",
    Tag = "View"
  },
  [4] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingSound.T_Tab_SettingSound'",
    TabId = 4,
    TabName = "UI_OPTION_AUDIO",
    Tag = "Voice"
  },
  [5] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingLang.T_Tab_SettingLang'",
    TabId = 5,
    TabName = "UI_OPTION_LANGUAGE",
    Tag = "Language"
  },
  [6] = {
    FillUpTo = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingOther.T_Tab_SettingOther'",
    TabId = 6,
    TabName = "UI_OPTION_Other",
    Tag = "Other"
  }
})
