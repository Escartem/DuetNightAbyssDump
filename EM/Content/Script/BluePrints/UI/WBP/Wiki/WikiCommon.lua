local WikiCommon = {}
WikiCommon.EntranceUIName = "Wiki_Entrance"
WikiCommon.MainUIName = "Wiki_Main"
WikiCommon.AwardUIName = 100158
WikiCommon.WikiBookBPPath = "/Game/UI/Blueprint/BP_Book_Loop.BP_Book_Loop"
WikiCommon.WikiTipsGuideNoteId = 10100101
WikiCommon.EventID = {
  OpenWikiMain = "OpenWikiMain",
  CloseWikiMain = "CloseWikiMain",
  SwitchCategory = "SwitchCategory"
}
WikiCommon.CategoryType = {
  All = 1,
  Faction = 2,
  Character = 3,
  Customs = 4,
  Civilization = 5
}
WikiCommon.TabList = {
  {
    Text = "UI_Wiki_MainTab_All",
    MainType = 1,
    TabId = WikiCommon.CategoryType.All,
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All'"
  },
  {
    Text = "UI_Wiki_MainTab_Faction",
    MainType = 2,
    TabId = WikiCommon.CategoryType.Faction,
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Faction.T_Tab_Faction'"
  },
  {
    Text = "UI_Wiki_MainTab_Character",
    MainType = 3,
    TabId = WikiCommon.CategoryType.Character,
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Character.T_Tab_Character'"
  },
  {
    Text = "UI_Wiki_MainTab_Customs",
    MainType = 4,
    TabId = WikiCommon.CategoryType.Customs,
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Customs.T_Tab_Customs'"
  },
  {
    Text = "UI_Wiki_MainTab_Civilization",
    MainType = 5,
    TabId = WikiCommon.CategoryType.Civilization,
    IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Civilization.T_Tab_Civilization'"
  }
}
WikiCommon.Categories = {
  {
    CategoryName = WikiCommon.TabList[1].Text
  },
  {
    CategoryName = WikiCommon.TabList[2].Text
  },
  {
    CategoryName = WikiCommon.TabList[3].Text
  },
  {
    CategoryName = WikiCommon.TabList[4].Text
  },
  {
    CategoryName = WikiCommon.TabList[5].Text
  }
}
WikiCommon.ButtonConfig = {
  {
    widget = "WBP_Encyclopedia_Culture",
    button = "Btn_Culture",
    type = WikiCommon.CategoryType.Civilization,
    animations = {
      click = "Click",
      hover = "Hover",
      unhover = "UnHover",
      pressed = "Press",
      normal = "Normal",
      lock = "Lock"
    }
  },
  {
    widget = "WBP_Encyclopedia_Influence",
    button = "Btn_Influence",
    type = WikiCommon.CategoryType.Faction,
    animations = {
      click = "Click",
      hover = "Hover",
      unhover = "UnHover",
      pressed = "Press",
      normal = "Normal",
      lock = "Lock"
    }
  },
  {
    widget = "WBP_Encyclopedia_Personage",
    button = "Btn_Personage",
    type = WikiCommon.CategoryType.Character,
    animations = {
      click = "Click",
      hover = "Hover",
      unhover = "UnHover",
      pressed = "Press",
      normal = "Normal",
      lock = "Lock"
    }
  },
  {
    widget = "WBP_Encyclopedia_Terroir",
    button = "Btn_Terroir",
    type = WikiCommon.CategoryType.Customs,
    animations = {
      click = "Click",
      hover = "Hover",
      unhover = "UnHover",
      pressed = "Press",
      normal = "Normal",
      lock = "Lock"
    }
  }
}
WikiCommon.CategoryConfig = {
  [WikiCommon.CategoryType.Civilization] = {
    widget = "WBP_Encyclopedia_Culture",
    numField = "Culture_Num",
    maxField = "Culture_Num_Max"
  },
  [WikiCommon.CategoryType.Faction] = {
    widget = "WBP_Encyclopedia_Influence",
    numField = "Influence_Num",
    maxField = "Influence_Num_Max"
  },
  [WikiCommon.CategoryType.Character] = {
    widget = "WBP_Encyclopedia_Personage",
    numField = "Personage_Num",
    maxField = "Personage_Num_Max"
  },
  [WikiCommon.CategoryType.Customs] = {
    widget = "WBP_Encyclopedia_Terroir",
    numField = "Terroir_Num_1",
    maxField = "Terroir_Num_Max"
  }
}
_G.WikiCommon = WikiCommon
return WikiCommon
