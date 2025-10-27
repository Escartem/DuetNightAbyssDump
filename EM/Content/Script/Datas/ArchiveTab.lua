local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArchiveTab", {
  [1] = {
    ArchiveID = 1004,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All",
    TabId = 1,
    TabName = "UI_Archive_Tab_AllResource",
    TabPara = "AllResource"
  },
  [2] = {
    ArchiveID = 1004,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Item",
    TabId = 2,
    TabName = "UI_Archive_Tab_NormalResource",
    TabPara = "NormalResource"
  },
  [3] = {
    ArchiveID = 1004,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Task",
    TabId = 3,
    TabName = "UI_Archive_Tab_TaskResource",
    TabPara = "TaskResource"
  },
  [4] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_All",
    TabId = 4,
    TabName = "UI_Archive_Tab_AllEnemy",
    TabPara = "AllMonster"
  },
  [5] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Infection",
    TabId = 5,
    TabName = "UI_Archive_Tab_InfectionEnemy",
    TabPara = "Mon.Gr"
  },
  [6] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Alliance",
    TabId = 6,
    TabName = "UI_Archive_Tab_AllianceEnemy",
    TabPara = "Mon.Sq"
  },
  [7] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Empire",
    TabId = 7,
    TabName = "UI_Archive_Tab_EmpireEnemy",
    TabPara = "Mon.Jt"
  },
  [8] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Church",
    TabId = 8,
    TabName = "UI_Archive_Tab_ChurchEnemy",
    TabPara = "Mon.Jh"
  },
  [10] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Archive_Boss",
    TabId = 10,
    TabName = "UI_Archive_Tab_BossEnemy",
    TabPara = "Mon.Boss"
  },
  [11] = {
    ArchiveID = 1006,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Other",
    TabId = 11,
    TabName = "UI_Archive_Tab_OtherEnemy",
    TabPara = "OtherMonster"
  }
})
