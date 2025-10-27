local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FriendTab", {
  [1] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_MyFri.T_Tab_MyFri'",
    TabId = 1,
    Text = "UI_Friend_MyFriend",
    WidgetName = "MyFriend"
  },
  [2] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_AddFri.T_Tab_AddFri'",
    TabId = 2,
    Text = "UI_Friend_AddFriend",
    WidgetName = "AddFriend"
  },
  [3] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RecentFri.T_Tab_RecentFri'",
    TabId = 3,
    Text = "UI_Friend_RecentMatch",
    WidgetName = "RecentMatch"
  },
  [4] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_SettingLang",
    TabId = 4,
    Text = "UI_Friend_Region",
    WidgetName = "RegionFriend"
  }
})
