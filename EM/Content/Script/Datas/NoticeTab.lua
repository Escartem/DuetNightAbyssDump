local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("NoticeTab", {
  [1] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_AnnouncementActivity.T_Tab_AnnouncementActivity'",
    TabId = 1,
    Text = "UI_Notice_Activity"
  },
  [2] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_AnnouncementSystem.T_Tab_AnnouncementSystem'",
    TabId = 2,
    Text = "UI_GameAnnouncement_MainTitle"
  },
  [3] = {
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_AnnouncementInfo.T_Tab_AnnouncementInfo'",
    TabId = 3,
    Text = "UI_Notice_News"
  }
})
