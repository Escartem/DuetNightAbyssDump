local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GMIntegration", {
  AddDispatchCh02 = {
    GMCommands = {
      [1] = "gm CompleteCondition 100306",
      [2] = "gm CompleteCondition 81006",
      [3] = "sgm sl 27"
    },
    GMDisplayName = "\230\150\176\229\162\158\231\172\172\228\186\140\231\171\160\231\154\132\230\180\190\233\129\163",
    GMIntegrationName = "AddDispatchCh02"
  },
  Balcony = {
    GMCommands = {
      [1] = "gm skipregion 1 100102 1"
    },
    GMDisplayName = "\233\152\179\229\143\176",
    GMIntegrationName = "Balcony",
    GMTab = "\229\156\186\230\153\175"
  },
  Batt01 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010503",
      [6] = "gm skipregion 1 104201 1"
    },
    GMDisplayName = "\229\143\164\230\136\152\229\156\186\229\185\187\229\162\1311",
    GMIntegrationName = "Batt01",
    GMTab = "\228\187\187\229\138\161"
  },
  Batt02 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010517",
      [6] = "gm skipregion 1 104601 1"
    },
    GMDisplayName = "\229\143\164\230\136\152\229\156\186\229\185\187\229\162\1312",
    GMIntegrationName = "Batt02",
    GMTab = "\228\187\187\229\138\161"
  },
  Batt03 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010518",
      [6] = "gm skipregion 1 104701 1"
    },
    GMDisplayName = "\229\143\164\230\136\152\229\156\186\229\185\187\229\162\1313",
    GMIntegrationName = "Batt03",
    GMTab = "\228\187\187\229\138\161"
  },
  CE_EX01_1 = {
    GMCommands = {
      [1] = "gm MockAllSystemCondition",
      [2] = "gm FSG 2002",
      [3] = "gm FSG 2004",
      [4] = "gm FSG 2007",
      [5] = "gm FSG 2008",
      [6] = "gm FSG 2009",
      [7] = "gm FSG 2010",
      [8] = "gm FSG 2011",
      [9] = "gm FSG 2012",
      [10] = "gm FSG 2013",
      [11] = "gm FSG 2014",
      [12] = "gm FSG 2015",
      [13] = "gm FSG 2016",
      [14] = "gm FSG 2017",
      [15] = "gm FSG 2018",
      [16] = "gm FSG 2019",
      [17] = "gm FSG 2020",
      [18] = "gm FSG 2021",
      [19] = "gm FSG 2022",
      [20] = "gm FSG 2025",
      [21] = "gm FSG 2026",
      [22] = "gm FSG 2031",
      [23] = "gm FSG 2034",
      [24] = "gm FSG 2035",
      [25] = "gm FSG 2036",
      [26] = "gm FSG 2038",
      [27] = "gm FSG 2039"
    },
    GMIntegrationName = "CE_EX01_1"
  },
  CE_EX01_2 = {
    GMCommands = {
      [1] = "gm succquestchain 100102",
      [2] = "gm succquestchain 100103",
      [3] = "gm succquestchain 100201",
      [4] = "gm succquestchain 200101",
      [5] = "gm succquestchain 100202",
      [6] = "gm succquestchain 100203",
      [7] = "gm succquestchain 100204",
      [8] = "gm succquestchain 100205",
      [9] = "gm succquestchain 200102",
      [10] = "gm succquestchain 100206",
      [11] = "gm succquestchain 100207",
      [12] = "gm succquestchain 100208",
      [13] = "sgm aitv 1011 Morality 60",
      [14] = "sgm aitv 1011 Empathy 60",
      [15] = "sgm aitv 1011 Wisdom 60",
      [16] = "sgm aitv 1011 Benefit 60",
      [17] = "sgm aitv 1011 Chaos 60",
      [18] = "sgm ar 3001 50",
      [19] = "sgm ar 2001 25250",
      [20] = "sgm ct 40"
    },
    GMIntegrationName = "CE_EX01_2"
  },
  Clouds = {
    GMCommands = {
      [1] = "gm skipregion 1 100103 1"
    },
    GMDisplayName = "\228\186\145\230\181\183",
    GMIntegrationName = "Clouds",
    GMTab = "\229\156\186\230\153\175"
  },
  DynCh01 = {
    GMCommands = {
      [1] = "gm CompleteCondition 100202",
      [2] = "gm CompleteCondition 100203",
      [3] = "gm CompleteCondition 100204",
      [4] = "gm CompleteCondition 100206",
      [5] = "gm CompleteCondition 81002",
      [6] = "gm CompleteCondition 81003",
      [7] = "gm CompleteCondition 81004"
    },
    GMDisplayName = "\232\167\163\233\148\129\231\172\172\228\184\128\231\171\160\229\138\168\230\128\129\228\186\139\228\187\182",
    GMIntegrationName = "DynCh01"
  },
  DynCh02 = {
    GMCommands = {
      [1] = "gm CompleteCondition 100306",
      [2] = "gm CompleteCondition 81006"
    },
    GMDisplayName = "\232\167\163\233\148\129\231\172\172\228\186\140\231\171\160\229\138\168\230\128\129\228\186\139\228\187\182",
    GMIntegrationName = "DynCh02"
  },
  DynEx01 = {
    GMCommands = {
      [1] = "gm CompleteCondition 110109",
      [2] = "gm CompleteCondition 81005"
    },
    GMDisplayName = "\232\167\163\233\148\129ex01\229\138\168\230\128\129\228\186\139\228\187\182",
    GMIntegrationName = "DynEx01"
  },
  DynPrologue = {
    GMCommands = {
      [1] = "gm CompleteCondition 100103",
      [2] = "gm CompleteCondition 81001"
    },
    GMDisplayName = "\232\167\163\233\148\129\229\186\143\231\171\160\229\138\168\230\128\129\228\186\139\228\187\182",
    GMIntegrationName = "DynPrologue"
  },
  East01 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm skipregion 1 104101 1",
      [5] = "gm succquestchain 990103"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\230\128\187\239\188\137",
    GMIntegrationName = "East01",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C1 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 990103",
      [5] = "gm skipregion 1 104108 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\228\184\128\239\188\137",
    GMIntegrationName = "East01C1",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C2 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 120101",
      [5] = "gm skipregion 1 104110 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\228\186\140\239\188\137",
    GMIntegrationName = "East01C2",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C3 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 120102",
      [5] = "gm skipregion 1 104109 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\228\184\137\239\188\137",
    GMIntegrationName = "East01C3",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C4 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 120103",
      [5] = "gm skipregion 1 104110 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\230\137\182\231\150\143\231\186\191\239\188\137",
    GMIntegrationName = "East01C4",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C5 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 120103",
      [5] = "gm skipregion 1 104109 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\232\153\172\229\133\136\231\148\159\231\186\191\239\188\137",
    GMIntegrationName = "East01C5",
    GMTab = "\228\187\187\229\138\161"
  },
  East01C6 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm succquestchain 120104",
      [5] = "gm succquestchain 120105",
      [6] = "gm skipregion 1 104110 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\228\184\128\230\156\159\239\188\136\229\133\173\239\188\137",
    GMIntegrationName = "East01C6",
    GMTab = "\228\187\187\229\138\161"
  },
  EastOpen = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100102",
      [3] = "gm succquestchain 100103",
      [4] = "gm succquestchain 100201",
      [5] = "gm succquestchain 100208",
      [6] = "gm succquestchain 100301",
      [7] = "gm succquestchain 100307",
      [8] = "sgm sl 40",
      [9] = "gm skipregion 1 101107 1"
    },
    GMDisplayName = "\228\184\156\229\155\189\229\188\149\229\133\165",
    GMIntegrationName = "EastOpen",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina01 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 100208",
      [5] = "gm skipregion 1 101105 1",
      [6] = "gm aade",
      [7] = "gm CompleteCondition 4220"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\228\184\128\239\188\137",
    GMIntegrationName = "Feina01",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina02 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120111",
      [5] = "gm skipregion 1 101105 1",
      [6] = "gm aade",
      [7] = "gm CompleteCondition 4220"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\228\186\140\239\188\137",
    GMIntegrationName = "Feina02",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina03 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120112",
      [5] = "gm skipregion 1 101105 1",
      [6] = "gm aade",
      [7] = "gm CompleteCondition 4220"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\228\184\137\239\188\137",
    GMIntegrationName = "Feina03",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina04 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120113",
      [5] = "gm skipregion 1 101105 1",
      [6] = "gm aade",
      [7] = "gm CompleteCondition 4220"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\229\155\155\239\188\137",
    GMIntegrationName = "Feina04",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina04Fight = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120113",
      [5] = "gm SuccQuest 12011407",
      [6] = "gm skipregion 1 101103 6",
      [7] = "gm aade"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\229\155\155\239\188\137\230\136\152\230\150\151",
    GMIntegrationName = "Feina04Fight",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina04Find02 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120113",
      [5] = "gm SuccQuest 12011405",
      [6] = "gm skipregion 1 101103 6",
      [7] = "gm aade"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\229\155\155\239\188\137\229\134\176\230\185\150",
    GMIntegrationName = "Feina04Find02",
    GMTab = "\228\187\187\229\138\161"
  },
  Feina04Party = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120113",
      [5] = "gm SuccQuest 12011411",
      [6] = "gm skipregion 1 101105 1",
      [7] = "gm aade"
    },
    GMDisplayName = "\232\143\178\229\168\156\230\180\187\229\138\168\239\188\136\229\155\155\239\188\137\230\153\154\228\188\154",
    GMIntegrationName = "Feina04Party",
    GMTab = "\228\187\187\229\138\161"
  },
  FinishAllStarterQuest = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\137\128\230\156\137\230\150\176\230\137\139\228\187\187\229\138\161",
    GMIntegrationName = "FinishAllStarterQuest"
  },
  FinishStarterQuest1 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200101",
      [2] = "sgm GMStarterQuestComplete 10200102",
      [3] = "sgm GMStarterQuestComplete 10200103",
      [4] = "sgm GMStarterQuestComplete 10200104",
      [5] = "sgm GMStarterQuestComplete 10200105"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1811",
    GMIntegrationName = "FinishStarterQuest1"
  },
  FinishStarterQuest2 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200106",
      [2] = "sgm GMStarterQuestComplete 10200107",
      [3] = "sgm GMStarterQuestComplete 10200108",
      [4] = "sgm GMStarterQuestComplete 10200109",
      [5] = "sgm GMStarterQuestComplete 10200110"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1812",
    GMIntegrationName = "FinishStarterQuest2"
  },
  FinishStarterQuest3 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200111",
      [2] = "sgm GMStarterQuestComplete 10200112",
      [3] = "sgm GMStarterQuestComplete 10200113",
      [4] = "sgm GMStarterQuestComplete 10200114",
      [5] = "sgm GMStarterQuestComplete 10200115"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1813",
    GMIntegrationName = "FinishStarterQuest3"
  },
  FinishStarterQuest4 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200116",
      [2] = "sgm GMStarterQuestComplete 10200117",
      [3] = "sgm GMStarterQuestComplete 10200118",
      [4] = "sgm GMStarterQuestComplete 10200119",
      [5] = "sgm GMStarterQuestComplete 10200120",
      [6] = "sgm GMStarterQuestComplete 10200121"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1814",
    GMIntegrationName = "FinishStarterQuest4"
  },
  FinishStarterQuest5 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200122",
      [2] = "sgm GMStarterQuestComplete 10200123",
      [3] = "sgm GMStarterQuestComplete 10200124",
      [4] = "sgm GMStarterQuestComplete 10200125",
      [5] = "sgm GMStarterQuestComplete 10200126",
      [6] = "sgm GMStarterQuestComplete 10200127"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1815",
    GMIntegrationName = "FinishStarterQuest5"
  },
  FinishStarterQuest6 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200128",
      [2] = "sgm GMStarterQuestComplete 10200129",
      [3] = "sgm GMStarterQuestComplete 10200130",
      [4] = "sgm GMStarterQuestComplete 10200131",
      [5] = "sgm GMStarterQuestComplete 10200132"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1816",
    GMIntegrationName = "FinishStarterQuest6"
  },
  FinishStarterQuest7 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200133",
      [2] = "sgm GMStarterQuestComplete 10200134",
      [3] = "sgm GMStarterQuestComplete 10200135",
      [4] = "sgm GMStarterQuestComplete 10200136",
      [5] = "sgm GMStarterQuestComplete 10200137",
      [6] = "sgm GMStarterQuestComplete 10200138"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1817",
    GMIntegrationName = "FinishStarterQuest7"
  },
  FinishStarterQuest8 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200139",
      [2] = "sgm GMStarterQuestComplete 10200140",
      [3] = "sgm GMStarterQuestComplete 10200141",
      [4] = "sgm GMStarterQuestComplete 10200142",
      [5] = "sgm GMStarterQuestComplete 10200143"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1818",
    GMIntegrationName = "FinishStarterQuest8"
  },
  FinishStarterQuest9 = {
    GMCommands = {
      [1] = "sgm GMStarterQuestComplete 10200144",
      [2] = "sgm GMStarterQuestComplete 10200145",
      [3] = "sgm GMStarterQuestComplete 10200146",
      [4] = "sgm GMStarterQuestComplete 10200147",
      [5] = "sgm GMStarterQuestComplete 10200148",
      [6] = "sgm GMStarterQuestComplete 10200149"
    },
    GMDisplayName = "\229\174\140\230\136\144\230\150\176\230\137\139\228\187\187\229\138\161\233\152\182\230\174\1819",
    GMIntegrationName = "FinishStarterQuest9"
  },
  GXY_1xLv3_mod = {
    GMCommands = {
      [1] = "sgm aom 11001 3",
      [2] = "sgm aom 11002 3",
      [3] = "sgm aom 11003 3",
      [4] = "sgm aom 11004 3",
      [5] = "sgm aom 11007 3",
      [6] = "sgm aom 11101 3",
      [7] = "sgm aom 11102 3",
      [8] = "sgm aom 11103 3",
      [9] = "sgm aom 11104 3",
      [10] = "sgm aom 11105 3",
      [11] = "sgm aom 11106 3",
      [12] = "sgm aom 12001 3",
      [13] = "sgm aom 12002 3",
      [14] = "sgm aom 12003 3",
      [15] = "sgm aom 12006 3",
      [16] = "sgm aom 12101 3",
      [17] = "sgm aom 12102 3",
      [18] = "sgm aom 12103 3",
      [19] = "sgm aom 13001 3",
      [20] = "sgm aom 13002 3",
      [21] = "sgm aom 13003 3",
      [22] = "sgm aom 13006 3",
      [23] = "sgm aom 13101 3",
      [24] = "sgm aom 13102 3",
      [25] = "sgm aom 13103 3"
    },
    GMIntegrationName = "GXY_1xLv3_mod"
  },
  GXY_2xLv3_mod = {
    GMCommands = {
      [1] = "sgm aom 21005 3",
      [2] = "sgm aom 21006 3",
      [3] = "sgm aom 21111 3",
      [4] = "sgm aom 21112 3",
      [5] = "sgm aom 21113 3",
      [6] = "sgm aom 21114 3",
      [7] = "sgm aom 21115 3",
      [8] = "sgm aom 21116 3",
      [9] = "sgm aom 22007 3",
      [10] = "sgm aom 22008 3",
      [11] = "sgm aom 22111 3",
      [12] = "sgm aom 22112 3",
      [13] = "sgm aom 22113 3",
      [14] = "sgm aom 23007 3",
      [15] = "sgm aom 23008 3",
      [16] = "sgm aom 23111 3",
      [17] = "sgm aom 23112 3",
      [18] = "sgm aom 23113 3",
      [19] = "sgm aom 24001 3",
      [20] = "sgm aom 24002 3",
      [21] = "sgm aom 24003 3",
      [22] = "sgm aom 24004 3",
      [23] = "sgm aom 24005 3",
      [24] = "sgm aom 24006 3",
      [25] = "sgm aom 24101 3",
      [26] = "sgm aom 24102 3",
      [27] = "sgm aom 24103 3",
      [28] = "sgm aom 25001 3",
      [29] = "sgm aom 25002 3",
      [30] = "sgm aom 25003 3"
    },
    GMIntegrationName = "GXY_2xLv3_mod"
  },
  GXY_3xLv5_mod = {
    GMCommands = {
      [1] = "sgm aom 31121 5",
      [2] = "sgm aom 31122 5",
      [3] = "sgm aom 31123 5",
      [4] = "sgm aom 31124 5",
      [5] = "sgm aom 31125 5",
      [6] = "sgm aom 31126 5",
      [7] = "sgm aom 31201 5",
      [8] = "sgm aom 31202 5",
      [9] = "sgm aom 31203 5",
      [10] = "sgm aom 31204 5",
      [11] = "sgm aom 31301 5",
      [12] = "sgm aom 31321 5",
      [13] = "sgm aom 31322 5",
      [14] = "sgm aom 31323 5",
      [15] = "sgm aom 31324 5",
      [16] = "sgm aom 31325 5",
      [17] = "sgm aom 31326 5",
      [18] = "sgm aom 31501 5",
      [19] = "sgm aom 31502 5",
      [20] = "sgm aom 31511 5",
      [21] = "sgm aom 31512 5",
      [22] = "sgm aom 31513 5",
      [23] = "sgm aom 31521 5",
      [24] = "sgm aom 31531 5",
      [25] = "sgm aom 31532 5",
      [26] = "sgm aom 31541 5",
      [27] = "sgm aom 32004 5",
      [28] = "sgm aom 32005 5",
      [29] = "sgm aom 32101 5",
      [30] = "sgm aom 32102 5"
    },
    GMIntegrationName = "GXY_3xLv5_mod"
  },
  GXY_4xLv20_char = {
    GMCommands = {
      [1] = "sgm aoc 1101 20",
      [2] = "sgm aoc 2301 20",
      [3] = "sgm aoc 3103 20",
      [4] = "sgm aoc 3201 20",
      [5] = "sgm aoc 3301 20",
      [6] = "sgm aoc 4202 20"
    },
    GMIntegrationName = "GXY_4xLv20_char"
  },
  GXY_charbreak_resource = {
    GMCommands = {
      [1] = "sgm ar 10001 10000",
      [2] = "sgm ar 10002 10000",
      [3] = "sgm ar 10003 10000",
      [4] = "sgm ar 10004 10000",
      [5] = "sgm ar 10005 10000",
      [6] = "sgm ar 10006 10000",
      [7] = "sgm ar 10007 10000",
      [8] = "sgm ar 10008 10000",
      [9] = "sgm ar 10009 10000",
      [10] = "sgm ar 10010 10000",
      [11] = "sgm ar 10011 10000",
      [12] = "sgm ar 10012 10000",
      [13] = "sgm ar 10013 10000",
      [14] = "sgm ar 10014 10000",
      [15] = "sgm ar 10015 10000",
      [16] = "sgm ar 10016 10000",
      [17] = "sgm ar 10017 10000",
      [18] = "sgm ar 10018 10000",
      [19] = "sgm ar 10019 10000",
      [20] = "sgm ar 10020 10000",
      [21] = "sgm ar 10021 10000",
      [22] = "sgm ar 10022 10000",
      [23] = "sgm ar 10023 10000",
      [24] = "sgm ar 10024 10000"
    },
    GMIntegrationName = "GXY_charbreak_resource"
  },
  GXY_common_resource = {
    GMCommands = {
      [1] = "sgm ar 101 9999999",
      [2] = "sgm ar 102 9999999",
      [3] = "sgm ar 201 999999",
      [4] = "sgm ar 202 999999",
      [5] = "sgm ar 2007 9999999",
      [6] = "sgm ar 2008 9999999",
      [7] = "sgm ar 2009 9999999",
      [8] = "sgm ar 2010 9999999",
      [9] = "sgm ar 2011 9999999",
      [10] = "sgm ar 2012 9999999",
      [11] = "sgm ar 2013 9999999",
      [12] = "sgm ar 2014 9999999",
      [13] = "sgm ar 20001 9999999",
      [14] = "sgm ar 20002 9999999",
      [15] = "sgm ar 20003 9999999",
      [16] = "sgm ar 20004 9999999",
      [17] = "sgm ar 20005 9999999",
      [18] = "sgm ar 20006 9999999",
      [19] = "sgm ar 20007 9999999",
      [20] = "sgm ar 20008 9999999",
      [21] = "sgm ar 20009 9999999",
      [22] = "sgm ar 20010 9999999",
      [23] = "sgm ar 20011 9999999",
      [24] = "sgm ar 20012 9999999",
      [25] = "sgm ar 20013 9999999",
      [26] = "sgm ar 20014 9999999",
      [27] = "sgm ar 20015 9999999",
      [28] = "sgm ar 20016 9999999",
      [29] = "sgm ar 20017 9999999",
      [30] = "sgm ar 20018 9999999"
    },
    GMIntegrationName = "GXY_common_resource"
  },
  GXY_weaponbreak_resource = {
    GMCommands = {
      [1] = "sgm ar 11001 10000",
      [2] = "sgm ar 11002 10000",
      [3] = "sgm ar 11003 10000",
      [4] = "sgm ar 11004 10000",
      [5] = "sgm ar 11005 10000",
      [6] = "sgm ar 11006 10000",
      [7] = "sgm ar 11007 10000",
      [8] = "sgm ar 11008 10000",
      [9] = "sgm ar 11009 10000",
      [10] = "sgm ar 11010 10000",
      [11] = "sgm ar 11011 10000",
      [12] = "sgm ar 11012 10000",
      [13] = "sgm ar 11013 10000",
      [14] = "sgm ar 11014 10000",
      [15] = "sgm ar 11015 10000",
      [16] = "sgm ar 11016 10000",
      [17] = "sgm ar 11017 10000",
      [18] = "sgm ar 11018 10000"
    },
    GMIntegrationName = "GXY_weaponbreak_resource"
  },
  GuideBook = {
    GMCommands = {
      [1] = "gm A:GMUnlockGuideBook()"
    },
    GMDisplayName = "\232\167\163\233\148\129\230\149\153\229\173\166\230\137\139\229\134\140\230\157\161\231\155\174",
    GMIntegrationName = "GuideBook"
  },
  Nai01 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010415",
      [6] = "gm skipregion 1 104301 1"
    },
    GMDisplayName = "\230\137\182\231\150\143\229\185\187\229\162\1311",
    GMIntegrationName = "Nai01",
    GMTab = "\228\187\187\229\138\161"
  },
  Nai02 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010416",
      [6] = "gm skipregion 1 104401 1"
    },
    GMDisplayName = "\230\137\182\231\150\143\229\185\187\229\162\1312",
    GMIntegrationName = "Nai02",
    GMTab = "\228\187\187\229\138\161"
  },
  Nai03 = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm SuccQuestChain 120103",
      [5] = "gm SuccQuest 12010417",
      [6] = "gm skipregion 1 105001 1"
    },
    GMDisplayName = "\230\137\182\231\150\143\229\185\187\229\162\1313",
    GMIntegrationName = "Nai03",
    GMTab = "\228\187\187\229\138\161"
  },
  ResetDispatch = {
    GMCommands = {
      [1] = "sgm rdgl"
    },
    GMDisplayName = "\233\135\141\231\189\174\228\184\128\230\137\185\230\180\190\233\129\163",
    GMIntegrationName = "ResetDispatch"
  },
  Rou_Blessing_10101 = {
    GMCommands = {
      [1] = "sgm rlgb 101 1",
      [2] = "sgm rlgb 102 1",
      [3] = "sgm rlgb 103 1",
      [4] = "sgm rlgb 104 1",
      [5] = "sgm rlgb 105 1",
      [6] = "sgm rlgb 106 1",
      [7] = "sgm rlgb 107 1",
      [8] = "sgm rlgb 108 1",
      [9] = "sgm rlgb 109 1",
      [10] = "sgm rlgb 110 1",
      [11] = "sgm rlgb 111 1",
      [12] = "sgm rlgb 112 1",
      [13] = "sgm rlgb 113 1",
      [14] = "sgm rlgb 114 1",
      [15] = "sgm rlgb 115 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\231\130\137\229\191\131\231\130\142",
    GMIntegrationName = "Rou_Blessing_10101"
  },
  Rou_Blessing_10102 = {
    GMCommands = {
      [1] = "sgm rlgb 201 1",
      [2] = "sgm rlgb 202 1",
      [3] = "sgm rlgb 203 1",
      [4] = "sgm rlgb 204 1",
      [5] = "sgm rlgb 205 1",
      [6] = "sgm rlgb 206 1",
      [7] = "sgm rlgb 207 1",
      [8] = "sgm rlgb 208 1",
      [9] = "sgm rlgb 209 1",
      [10] = "sgm rlgb 210 1",
      [11] = "sgm rlgb 211 1",
      [12] = "sgm rlgb 212 1",
      [13] = "sgm rlgb 213 1",
      [14] = "sgm rlgb 214 1",
      [15] = "sgm rlgb 215 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\230\181\174\230\181\183\230\156\136",
    GMIntegrationName = "Rou_Blessing_10102"
  },
  Rou_Blessing_10103 = {
    GMCommands = {
      [1] = "sgm rlgb 301 1",
      [2] = "sgm rlgb 302 1",
      [3] = "sgm rlgb 303 1",
      [4] = "sgm rlgb 304 1",
      [5] = "sgm rlgb 305 1",
      [6] = "sgm rlgb 306 1",
      [7] = "sgm rlgb 307 1",
      [8] = "sgm rlgb 308 1",
      [9] = "sgm rlgb 309 1",
      [10] = "sgm rlgb 310 1",
      [11] = "sgm rlgb 311 1",
      [12] = "sgm rlgb 312 1",
      [13] = "sgm rlgb 313 1",
      [14] = "sgm rlgb 314 1",
      [15] = "sgm rlgb 315 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\232\190\137\232\144\164\231\159\179",
    GMIntegrationName = "Rou_Blessing_10103"
  },
  Rou_Blessing_10104 = {
    GMCommands = {
      [1] = "sgm rlgb 401 1",
      [2] = "sgm rlgb 402 1",
      [3] = "sgm rlgb 403 1",
      [4] = "sgm rlgb 404 1",
      [5] = "sgm rlgb 405 1",
      [6] = "sgm rlgb 406 1",
      [7] = "sgm rlgb 407 1",
      [8] = "sgm rlgb 408 1",
      [9] = "sgm rlgb 409 1",
      [10] = "sgm rlgb 410 1",
      [11] = "sgm rlgb 411 1",
      [12] = "sgm rlgb 412 1",
      [13] = "sgm rlgb 413 1",
      [14] = "sgm rlgb 414 1",
      [15] = "sgm rlgb 415 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\230\181\129\230\152\142\230\158\157",
    GMIntegrationName = "Rou_Blessing_10104"
  },
  Rou_Blessing_10105 = {
    GMCommands = {
      [1] = "sgm rlgb 501 1",
      [2] = "sgm rlgb 502 1",
      [3] = "sgm rlgb 503 1",
      [4] = "sgm rlgb 504 1",
      [5] = "sgm rlgb 505 1",
      [6] = "sgm rlgb 506 1",
      [7] = "sgm rlgb 507 1",
      [8] = "sgm rlgb 508 1",
      [9] = "sgm rlgb 509 1",
      [10] = "sgm rlgb 510 1",
      [11] = "sgm rlgb 511 1",
      [12] = "sgm rlgb 512 1",
      [13] = "sgm rlgb 513 1",
      [14] = "sgm rlgb 514 1",
      [15] = "sgm rlgb 515 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\233\169\177\233\187\175\232\157\182",
    GMIntegrationName = "Rou_Blessing_10105"
  },
  Rou_Blessing_10106 = {
    GMCommands = {
      [1] = "sgm rlgb 601 1",
      [2] = "sgm rlgb 602 1",
      [3] = "sgm rlgb 603 1",
      [4] = "sgm rlgb 604 1",
      [5] = "sgm rlgb 605 1",
      [6] = "sgm rlgb 606 1",
      [7] = "sgm rlgb 607 1",
      [8] = "sgm rlgb 608 1",
      [9] = "sgm rlgb 609 1",
      [10] = "sgm rlgb 610 1",
      [11] = "sgm rlgb 611 1",
      [12] = "sgm rlgb 612 1",
      [13] = "sgm rlgb 613 1",
      [14] = "sgm rlgb 614 1",
      [15] = "sgm rlgb 615 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\230\155\179\229\133\137\232\153\171",
    GMIntegrationName = "Rou_Blessing_10106"
  },
  Rou_Blessing_10107 = {
    GMCommands = {
      [1] = "sgm rlgb 701 1",
      [2] = "sgm rlgb 702 1",
      [3] = "sgm rlgb 703 1",
      [4] = "sgm rlgb 704 1",
      [5] = "sgm rlgb 705 1",
      [6] = "sgm rlgb 706 1",
      [7] = "sgm rlgb 707 1",
      [8] = "sgm rlgb 708 1",
      [9] = "sgm rlgb 709 1",
      [10] = "sgm rlgb 710 1",
      [11] = "sgm rlgb 711 1",
      [12] = "sgm rlgb 712 1",
      [13] = "sgm rlgb 713 1",
      [14] = "sgm rlgb 714 1",
      [15] = "sgm rlgb 715 1"
    },
    GMDisplayName = "\232\130\137\233\184\189\231\165\157\231\166\143-\230\177\178\232\161\128\232\138\177",
    GMIntegrationName = "Rou_Blessing_10107"
  },
  SSS = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide",
      [4] = "gm skipRegion 1 101101 1",
      [5] = "gm succquestchain 100201",
      [6] = "gm succquestchain 100202",
      [7] = "gm succquestchain 100203",
      [8] = "gm succquestchain 100204",
      [9] = "gm succquestchain 100205",
      [10] = "gm succquestchain 100206",
      [11] = "gm succquestchain 100208",
      [12] = "sgm aitv 1011 Morality 100",
      [13] = "sgm aitv 1011 Empathy 100",
      [14] = "sgm aitv 1011 Wisdom 100",
      [15] = "sgm aitv 1011 Benefit 100",
      [16] = "sgm aitv 1011 Chaos 100"
    },
    GMIntegrationName = "SSS",
    GMTab = "\228\187\187\229\138\161"
  },
  StartChapter01 = {
    GMCommands = {
      [1] = "sgm aoc 1601",
      [2] = "gm succquestchain 100102",
      [3] = "gm succquestchain 100103",
      [4] = "gm skipregion 1 101103 10",
      [5] = "gm TestTrackingQuest 100201",
      [6] = "sgm FSG 3001"
    },
    GMDisplayName = "\231\155\180\230\142\165\229\188\128\229\167\139\231\172\172\228\184\128\231\171\160",
    GMIntegrationName = "StartChapter01",
    GMTab = "\228\187\187\229\138\161"
  },
  SystemCommonUnlock = {
    GMCommands = {
      [1] = "gm UnlockRegionTeleport 1",
      [2] = "gm MockAllSystemCondition",
      [3] = "gm SuccessAllSystemGuide"
    },
    GMDisplayName = "\233\128\154\231\148\168\232\167\163\233\148\129\233\161\185",
    GMIntegrationName = "SystemCommonUnlock"
  },
  SystemCommonUnlock1 = {
    GMCommands = {
      [1] = "gm MockAllSystemCondition",
      [2] = "gm SuccessAllSystemGuide"
    },
    GMDisplayName = "\233\128\154\231\148\168\232\167\163\233\148\129\233\161\185",
    GMIntegrationName = "SystemCommonUnlock1"
  },
  TrainingGroundQuest = {
    GMCommands = {
      [1] = "gm succquestchain 100103",
      [2] = "gm startquest 10020109",
      [3] = "gm TestTrackingQuest 100201",
      [4] = "gm cm 6001001 1 1"
    },
    GMDisplayName = "\232\174\173\231\187\131\229\156\186\229\188\149\229\175\188",
    GMIntegrationName = "TrainingGroundQuest"
  },
  UnlockDispatch = {
    GMCommands = {
      [1] = "Gm CADC"
    },
    GMDisplayName = "\232\167\163\233\148\129\230\137\128\230\156\137\228\186\139\228\187\182\231\154\132\229\143\175\230\180\190\233\129\163",
    GMIntegrationName = "UnlockDispatch"
  },
  UnlockDispatchSys = {
    GMCommands = {
      [1] = "gm CompleteCondition 100103",
      [2] = "gm CompleteCondition 100202",
      [3] = "gm CompleteCondition 100203",
      [4] = "gm CompleteCondition 100204",
      [5] = "gm CompleteCondition 100206",
      [6] = "gm CompleteCondition 81001",
      [7] = "gm CompleteCondition 81002",
      [8] = "gm CompleteCondition 81003",
      [9] = "gm CompleteCondition 81004",
      [10] = "gm CompleteCondition 81005",
      [11] = "sgm sl 22",
      [12] = "gm CompleteCondition 110109",
      [13] = "sgm aac"
    },
    GMDisplayName = "\233\166\150\230\172\161\232\167\163\233\148\129\230\180\190\233\129\163\239\188\136\229\174\140\230\136\144ex01\239\188\137",
    GMIntegrationName = "UnlockDispatchSys"
  },
  UnlockRougeAll = {
    GMCommands = {
      [1] = "gm CompleteCondition 5052",
      [2] = "gm CompleteCondition 5053",
      [3] = "gm CompleteCondition 5054",
      [4] = "gm CompleteCondition 5055",
      [5] = "gm CompleteCondition 5056",
      [6] = "gm CompleteCondition 5057",
      [7] = "gm CompleteCondition 5058",
      [8] = "gm CompleteCondition 5059",
      [9] = "gm CompleteCondition 5060",
      [10] = "gm CompleteCondition 5069",
      [11] = "gm CompleteCondition 5072"
    },
    GMDisplayName = "\232\167\163\233\148\129\232\130\137\233\184\189\230\137\128\230\156\137\233\154\190\229\186\166",
    GMIntegrationName = "UnlockRougeAll"
  },
  XibiBoss = {
    GMCommands = {
      [1] = "gm succquestchain 100102",
      [2] = "gm succquest 10010305",
      [3] = "gm skipregion 1 100103 1"
    },
    GMDisplayName = "\229\186\143\231\171\160\239\188\136\232\165\191\230\175\148\229\176\148boss\230\136\152\239\188\137",
    GMIntegrationName = "XibiBoss",
    GMTab = "\228\187\187\229\138\161"
  },
  alch = {
    GMCommands = {
      [1] = "gm skipregion 1 103201 1"
    },
    GMDisplayName = "\231\130\188\233\135\145\233\153\162",
    GMIntegrationName = "alch",
    GMTab = "\229\156\186\230\153\175"
  },
  bainianchun = {
    GMCommands = {
      [1] = "gm skipregion 1 104110 1"
    },
    GMDisplayName = "\231\153\190\229\185\180\230\152\165",
    GMIntegrationName = "bainianchun",
    GMTab = "\229\156\186\230\153\175"
  },
  ch021 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 200227",
      [11] = "gm succquest 20021501",
      [12] = "gm TestTrackingQuest 100301"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\228\184\128\229\185\149",
    GMIntegrationName = "ch021",
    GMTab = "\228\187\187\229\138\161"
  },
  ch022 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 100301",
      [11] = "gm succquest 20021501",
      [12] = "gm TestTrackingQuest 100302"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\228\186\140\229\185\149",
    GMIntegrationName = "ch022",
    GMTab = "\228\187\187\229\138\161"
  },
  ch023 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 100301",
      [11] = "gm succquest 20021501",
      [12] = "gm succquestchain 100302",
      [13] = "gm TestTrackingQuest 100303"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\228\184\137\229\185\149",
    GMIntegrationName = "ch023",
    GMTab = "\228\187\187\229\138\161"
  },
  ch024 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 100301",
      [11] = "gm succquest 20021501",
      [12] = "gm succquestchain 100302",
      [13] = "gm succquestchain 100303",
      [14] = "gm TestTrackingQuest 100304"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\229\155\155\229\185\149",
    GMIntegrationName = "ch024",
    GMTab = "\228\187\187\229\138\161"
  },
  ch025 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 100301",
      [11] = "gm succquest 20021501",
      [12] = "gm succquestchain 100302",
      [13] = "gm succquestchain 100303",
      [14] = "gm succquestchain 100304",
      [15] = "gm TestTrackingQuest 100305"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\228\186\148\229\185\149",
    GMIntegrationName = "ch025",
    GMTab = "\228\187\187\229\138\161"
  },
  ch026 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 60",
      [3] = "sgm ct 50",
      [4] = "gm succquestchain 100202",
      [5] = "gm succquestchain 100102",
      [6] = "gm succquestchain 100103",
      [7] = "gm succquestchain 100201",
      [8] = "gm succquestchain 100208",
      [9] = "gm succquestchain 110109",
      [10] = "gm succquestchain 100301",
      [11] = "gm succquest 20021501",
      [12] = "gm succquestchain 100302",
      [13] = "gm succquestchain 100303",
      [14] = "gm succquestchain 100304",
      [15] = "gm succquestchain 100305",
      [16] = "gm TestTrackingQuest 100306",
      [17] = "gm SS = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())",
      [18] = "gm SS:SetInt(\"thea100306\", 3)",
      [19] = "gm SS:GetInt(\"thea100306\")"
    },
    GMDisplayName = "\231\172\172\228\186\140\231\171\160\231\172\172\229\133\173\229\185\149",
    GMIntegrationName = "ch026",
    GMTab = "\228\187\187\229\138\161"
  },
  chaosheng = {
    GMCommands = {
      [1] = "gm skipregion 1 104103 1"
    },
    GMDisplayName = "\230\189\174\229\163\176\229\178\169\231\169\180",
    GMIntegrationName = "chaosheng",
    GMTab = "\229\156\186\230\153\175"
  },
  dongjiao = {
    GMCommands = {
      [1] = "gm skipregion 1 104505 1"
    },
    GMDisplayName = "\228\184\156\233\131\138\233\135\142\229\164\150",
    GMIntegrationName = "dongjiao",
    GMTab = "\229\156\186\230\153\175"
  },
  dream = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100207",
      [3] = "gm skipregion 1 101401 1"
    },
    GMIntegrationName = "dream"
  },
  dreamboss1 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100207",
      [3] = "gm startquest 10020803",
      [4] = "gm skipregion 1 101402 1"
    },
    GMIntegrationName = "dreamboss1"
  },
  dreamboss2 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100207",
      [3] = "gm startquest 10020804",
      [4] = "gm skipregion 1 101402 1"
    },
    GMIntegrationName = "dreamboss2"
  },
  enlike = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100206",
      [3] = "sgm ar 2001 15000"
    },
    GMDisplayName = "\231\172\172\228\184\128\231\171\160\239\188\136\230\129\169\233\135\140\229\133\139\228\185\139\230\173\187\239\188\137",
    GMIntegrationName = "enlike",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01 = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock1",
      [2] = "gm succquestchain 100102",
      [3] = "gm succquestchain 100103",
      [4] = "gm succquestchain 100201",
      [5] = "gm succquestchain 100208",
      [6] = "gm succquestchain 200215",
      [7] = "gm succquestchain 200104",
      [8] = "gm TestTrackingQuest 110101",
      [9] = "sgm sl 60"
    },
    GMDisplayName = "\231\155\180\230\142\165\229\188\128\229\167\139EX01",
    GMIntegrationName = "ex01",
    GMTab = "\228\187\187\229\138\161"
  },
  ex0101 = {
    GMCommands = {
      [1] = "gm skipregion 1 102101 1"
    },
    GMDisplayName = "EX01_Fort01",
    GMIntegrationName = "ex0101",
    GMTab = "\229\156\186\230\153\175"
  },
  ex0102 = {
    GMCommands = {
      [1] = "gm skipregion 1 102102 1"
    },
    GMDisplayName = "EX01_Fort02",
    GMIntegrationName = "ex0102",
    GMTab = "\229\156\186\230\153\175"
  },
  ex0103 = {
    GMCommands = {
      [1] = "gm skipregion 1 102103 1"
    },
    GMDisplayName = "EX01_Fort03",
    GMIntegrationName = "ex0103",
    GMTab = "\229\156\186\230\153\175"
  },
  ex0104 = {
    GMCommands = {
      [1] = "gm skipregion 1 102104 1"
    },
    GMDisplayName = "EX01_Fort04",
    GMIntegrationName = "ex0104",
    GMTab = "\229\156\186\230\153\175"
  },
  ex01Haier = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 110108",
      [3] = "gm succquest 11010908",
      [4] = "gm skipregion 1 102104 1"
    },
    GMDisplayName = "EX01\230\181\183\229\176\148\230\179\149",
    GMIntegrationName = "ex01Haier",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01Maifu = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102102 3",
      [3] = "gm succquestchain 110107",
      [4] = "gm succquest 11010809",
      [5] = "gm TestTrackingQuest 11010810"
    },
    GMDisplayName = "EX01\228\184\139\230\176\180\233\129\147\229\137\141\229\159\139\228\188\143",
    GMIntegrationName = "ex01Maifu",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01NengyuanDown = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102101 3",
      [3] = "gm succquestchain 110101",
      [4] = "gm succquest 11010305",
      [5] = "gm TestTrackingQuest 11010306"
    },
    GMDisplayName = "EX01\232\131\189\230\186\144\229\174\164\228\184\139\229\177\130",
    GMIntegrationName = "ex01NengyuanDown",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01NengyuanUP = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102101 3",
      [3] = "gm succquestchain 110101",
      [4] = "gm succquest 11010313",
      [5] = "gm TestTrackingQuest 11010305"
    },
    GMDisplayName = "EX01\232\131\189\230\186\144\229\174\164\228\184\138\229\177\130",
    GMIntegrationName = "ex01NengyuanUP",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01PaitaiPre = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102102 3",
      [3] = "gm succquestchain 110103",
      [4] = "gm succquest 11010523",
      [5] = "gm TestTrackingQuest 11010526"
    },
    GMDisplayName = "EX01\230\142\168\232\189\166-\229\135\134\229\164\135",
    GMIntegrationName = "ex01PaitaiPre",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01Paoji = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102102 2",
      [3] = "gm succquestchain 110103",
      [4] = "gm succquest 11010512",
      [5] = "gm TestTrackingQuest 11010513"
    },
    GMDisplayName = "EX01\229\164\167\231\130\174\231\142\169\230\179\149",
    GMIntegrationName = "ex01Paoji",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01Sew = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102103 3",
      [3] = "gm succquestchain 110107",
      [4] = "gm succquest 11010814",
      [5] = "gm TestTrackingQuest 11010801"
    },
    GMDisplayName = "EX01\228\184\139\230\176\180\233\129\147",
    GMIntegrationName = "ex01Sew",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01Shenpan = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102104 3",
      [3] = "gm succquestchain 110108"
    },
    GMDisplayName = "EX01\231\155\145\231\139\177\229\174\161\229\136\164",
    GMIntegrationName = "ex01Shenpan",
    GMTab = "\228\187\187\229\138\161"
  },
  ex01Tuiche = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm skipregion 1 102102 3",
      [3] = "gm succquestchain 110103",
      [4] = "gm succquest 11010511",
      [5] = "gm TestTrackingQuest 11010512"
    },
    GMDisplayName = "EX01\230\142\168\232\189\166-\231\130\174\229\143\176",
    GMIntegrationName = "ex01Tuiche",
    GMTab = "\228\187\187\229\138\161"
  },
  findsaiqi1 = {
    GMCommands = {
      [1] = "sgm sl 19",
      [2] = "gm succquestchain 100206",
      [3] = "gm succquestchain 200215",
      [4] = "gm succquest 10020705",
      [5] = "gm skipregion 1 101101 10"
    },
    GMDisplayName = "\231\172\172\228\184\128\231\171\160\239\188\136\232\191\189\232\184\170\232\181\155\231\144\170-\229\159\142\233\151\168\229\137\141\239\188\137",
    GMIntegrationName = "findsaiqi1",
    GMTab = "\228\187\187\229\138\161"
  },
  findsaiqi2 = {
    GMCommands = {
      [1] = "sgm sl 19",
      [2] = "gm succquestchain 100206",
      [3] = "gm succquestchain 200215",
      [4] = "gm succquest 10020706",
      [5] = "gm skipregion 1 101103 1"
    },
    GMDisplayName = "\231\172\172\228\184\128\231\171\160\239\188\136\232\191\189\232\184\170\232\181\155\231\144\170-\229\134\176\230\185\150\228\184\139\239\188\137",
    GMIntegrationName = "findsaiqi2",
    GMTab = "\228\187\187\229\138\161"
  },
  fish = {
    GMCommands = {
      [1] = "SystemCommonUnlock",
      [2] = "gm succquest 20021501",
      [3] = "sgm ar 5110100 1",
      [4] = "sgm ar 5110200 1",
      [5] = "sgm ar 5110300 1",
      [6] = "sgm ar 5110400 1",
      [7] = "sgm ar 5110500 1",
      [8] = "sgm ar 5210100 99",
      [9] = "sgm ar 5210200 99",
      [10] = "sgm ar 5210300 99",
      [11] = "sgm ar 5210400 99",
      [12] = "gm skipregion 1 100101 1"
    },
    GMDisplayName = "\229\191\171\233\128\159\229\188\128\229\167\139\233\146\147\233\177\188",
    GMIntegrationName = "fish"
  },
  fish_icelake = {
    GMCommands = {
      [1] = "SystemCommonUnlock",
      [2] = "gm succquest 20021501",
      [3] = "sgm ar 5110100 1",
      [4] = "sgm ar 5210100 99",
      [5] = "sgm ar 5210200 99",
      [6] = "sgm ar 5210300 99",
      [7] = "sgm ar 5210400 99",
      [8] = "gm skipregion 1 101103 1"
    },
    GMDisplayName = "\229\191\171\233\128\159\229\188\128\229\167\139\233\146\147\233\177\188\239\188\136\229\143\170\230\156\137\231\174\128\229\141\149\233\177\188\231\171\191\239\188\137",
    GMIntegrationName = "fish_icelake"
  },
  flow = {
    GMCommands = {
      [1] = "gm skipregion 1 101111 1"
    },
    GMDisplayName = "\232\138\177\229\186\151",
    GMIntegrationName = "flow",
    GMTab = "\229\156\186\230\153\175"
  },
  guaxiang = {
    GMCommands = {
      [1] = "gm skipregion 1 105601 1"
    },
    GMDisplayName = "\230\173\162\230\181\129\229\141\166\232\177\161\230\136\191\233\151\180",
    GMIntegrationName = "guaxiang",
    GMTab = "\229\156\186\230\153\175"
  },
  haojing = {
    GMCommands = {
      [1] = "gm skipregion 1 104503 1"
    },
    GMDisplayName = "\231\154\147\228\186\172\229\159\142\229\140\186",
    GMIntegrationName = "haojing",
    GMTab = "\229\156\186\230\153\175"
  },
  ht = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100204",
      [3] = "gm startquest 10020506",
      [4] = "gm skipregion 1 101101 8",
      [5] = "gm TestTrackingQuest 100205"
    },
    GMIntegrationName = "ht"
  },
  icelake = {
    GMCommands = {
      [1] = "gm skipregion 1 101103 5"
    },
    GMDisplayName = "\229\134\176\230\185\150\229\159\142\230\179\170\230\185\150\229\140\186",
    GMIntegrationName = "icelake",
    GMTab = "\229\156\186\230\153\175"
  },
  icelakeboss = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 19",
      [3] = "gm succquestchain 100206",
      [4] = "gm succquestchain 200102",
      [5] = "gm startquest 10020708",
      [6] = "gm skipregion 1 101103 2"
    },
    GMIntegrationName = "icelakeboss"
  },
  icelakecity = {
    GMCommands = {
      [1] = "gm skipregion 1 101101 1"
    },
    GMDisplayName = "\229\134\176\230\185\150\229\159\142\229\134\133",
    GMIntegrationName = "icelakecity",
    GMTab = "\229\156\186\230\153\175"
  },
  jianjia = {
    GMCommands = {
      [1] = "gm skipregion 1 104107 1"
    },
    GMDisplayName = "\232\146\185\232\145\173\230\181\166",
    GMIntegrationName = "jianjia",
    GMTab = "\229\156\186\230\153\175"
  },
  jiaolan = {
    GMCommands = {
      [1] = "gm skipregion 1 104504 1"
    },
    GMDisplayName = "\230\164\146\229\133\176\230\157\145",
    GMIntegrationName = "jiaolan",
    GMTab = "\229\156\186\230\153\175"
  },
  jitan = {
    GMCommands = {
      [1] = "gm skipregion 1 104101 1"
    },
    GMDisplayName = "\231\131\155\233\152\180\231\165\173\229\157\155",
    GMIntegrationName = "jitan",
    GMTab = "\229\156\186\230\153\175"
  },
  julong = {
    GMCommands = {
      [1] = "gm skipregion 1 104901 1"
    },
    GMDisplayName = "\230\189\156\233\190\153\229\177\133",
    GMIntegrationName = "julong",
    GMTab = "\229\156\186\230\153\175"
  },
  kk = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 12",
      [3] = "gm succquestchain 100202",
      [4] = "gm succquestchain 200103",
      [5] = "gm startquest 10020305",
      [7] = "gm skipregion 1 101301 1",
      [8] = "gm TestTrackingQuest 100203"
    },
    GMIntegrationName = "kk"
  },
  kuangkeng1 = {
    GMCommands = {
      [1] = "gm skipregion 1 101301 1"
    },
    GMDisplayName = "\231\159\191\229\157\14501",
    GMIntegrationName = "kuangkeng1",
    GMTab = "\229\156\186\230\153\175"
  },
  kuangkeng2 = {
    GMCommands = {
      [1] = "gm skipregion 1 101305 1"
    },
    GMDisplayName = "\231\159\191\229\157\14502",
    GMIntegrationName = "kuangkeng2",
    GMTab = "\229\156\186\230\153\175"
  },
  kuangkeng3 = {
    GMCommands = {
      [1] = "gm skipregion 1 101303 1"
    },
    GMDisplayName = "\231\159\191\229\157\14503",
    GMIntegrationName = "kuangkeng3",
    GMTab = "\229\156\186\230\153\175"
  },
  kuangkeng4 = {
    GMCommands = {
      [1] = "gm skipregion 1 101304 1"
    },
    GMDisplayName = "\231\159\191\229\157\14504",
    GMIntegrationName = "kuangkeng4",
    GMTab = "\229\156\186\230\153\175"
  },
  kurong = {
    GMCommands = {
      [1] = "gm skipregion 1 104106 1"
    },
    GMDisplayName = "\230\158\175\232\141\163\233\152\129",
    GMIntegrationName = "kurong",
    GMTab = "\229\156\186\230\153\175"
  },
  letmein = {
    GMCommands = {
      [1] = "gm aade"
    },
    GMDisplayName = "\232\167\163\233\148\129\230\137\128\230\156\137\229\140\186\229\159\159",
    GMIntegrationName = "letmein"
  },
  letmeplay = {
    GMCommands = {
      [1] = "gm succquestchain 200101",
      [2] = "gm succquestchain 200102",
      [3] = "gm succquestchain 200103",
      [4] = "gm succquestchain 200215",
      [5] = "gm succquestchain 200228",
      [6] = "gm succquestchain 200229",
      [7] = "sgm ar 2001 50000"
    },
    GMDisplayName = "\230\184\133\230\137\128\230\156\137\229\141\161\228\184\187\231\186\191\230\148\175\231\186\191",
    GMIntegrationName = "letmeplay",
    GMTab = "\228\187\187\229\138\161"
  },
  mee = {
    GMCommands = {
      [1] = "gm skipregion 1 101104 1"
    },
    GMDisplayName = "\229\134\155\229\155\162\228\188\154\232\174\174\229\174\164",
    GMIntegrationName = "mee",
    GMTab = "\229\156\186\230\153\175"
  },
  outside = {
    GMCommands = {
      [1] = "gm skipregion 1 101105 1"
    },
    GMDisplayName = "\229\165\165\231\137\185\232\181\155\229\190\183\229\174\182",
    GMIntegrationName = "outside",
    GMTab = "\229\156\186\230\153\175"
  },
  pool = {
    GMCommands = {
      [1] = "gm skipregion 1 101101 18"
    },
    GMDisplayName = "\232\180\171\230\176\145\229\140\186",
    GMIntegrationName = "pool",
    GMTab = "\229\156\186\230\153\175"
  },
  qianshu01 = {
    GMCommands = {
      [1] = "gm skipregion 1 104201 1"
    },
    GMDisplayName = "\229\141\131\230\158\162\231\139\169\233\152\18101",
    GMIntegrationName = "qianshu01",
    GMTab = "\229\156\186\230\153\175"
  },
  qianshu02 = {
    GMCommands = {
      [1] = "gm skipregion 1 104601 1"
    },
    GMDisplayName = "\229\141\131\230\158\162\231\139\169\233\152\18102",
    GMIntegrationName = "qianshu02",
    GMTab = "\229\156\186\230\153\175"
  },
  qianshu03 = {
    GMCommands = {
      [1] = "gm skipregion 1 104701 1"
    },
    GMDisplayName = "\229\141\131\230\158\162\231\139\169\233\152\18103",
    GMIntegrationName = "qianshu03",
    GMTab = "\229\156\186\230\153\175"
  },
  sana = {
    GMCommands = {
      [1] = "gm skipregion 1 101106 1"
    },
    GMDisplayName = "\231\150\151\229\133\187\233\153\162",
    GMIntegrationName = "sana",
    GMTab = "\229\156\186\230\153\175"
  },
  searchsaiqi = {
    GMCommands = {
      [1] = "sgm ar 2001 8000",
      [2] = "gm succquestchain 100206",
      [3] = "gm succquestchain 200102",
      [4] = "gm startquest 10020705",
      [5] = "gm skipregion 1 101101 2"
    },
    GMIntegrationName = "searchsaiqi"
  },
  secr = {
    GMCommands = {
      [1] = "gm skipregion 1 101108 1"
    },
    GMDisplayName = "\231\167\152\229\175\134\229\159\186\229\156\176",
    GMIntegrationName = "secr",
    GMTab = "\229\156\186\230\153\175"
  },
  sew = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100201",
      [3] = "gm succquestchain 200101",
      [4] = "gm succquest 10020210",
      [5] = "gm skipregion 1 101702 3"
    },
    GMIntegrationName = "sew"
  },
  sew1 = {
    GMCommands = {
      [1] = "gm skipregion 1 101701 1"
    },
    GMDisplayName = "\228\184\139\230\176\180\233\129\14701",
    GMIntegrationName = "sew1",
    GMTab = "\229\156\186\230\153\175"
  },
  sew2 = {
    GMCommands = {
      [1] = "gm skipregion 1 101702 1"
    },
    GMDisplayName = "\228\184\139\230\176\180\233\129\14702",
    GMIntegrationName = "sew2",
    GMTab = "\229\156\186\230\153\175"
  },
  sew3 = {
    GMCommands = {
      [1] = "gm skipregion 1 101703 1"
    },
    GMDisplayName = "\228\184\139\230\176\180\233\129\14703",
    GMIntegrationName = "sew3",
    GMTab = "\229\156\186\230\153\175"
  },
  shanwaishan = {
    GMCommands = {
      [1] = "gm skipregion 1 105201 1"
    },
    GMDisplayName = "\229\177\177\229\164\150\229\177\177",
    GMIntegrationName = "shanwaishan",
    GMTab = "\229\156\186\230\153\175"
  },
  shihai = {
    GMCommands = {
      [1] = "gm skipregion 1 104105 1"
    },
    GMDisplayName = "\229\176\152\230\188\160\231\159\179\230\181\183",
    GMIntegrationName = "shihai",
    GMTab = "\229\156\186\230\153\175"
  },
  shijingzhe = {
    GMCommands = {
      [1] = "gm skipregion 1 101304 2"
    },
    GMDisplayName = "\229\153\172\230\153\182\232\128\133",
    GMIntegrationName = "shijingzhe",
    GMTab = "\229\156\186\230\153\175"
  },
  sick = {
    GMCommands = {
      [1] = "gm skipregion 1 101110 1"
    },
    GMDisplayName = "\229\140\187\233\153\162\231\151\133\230\136\191",
    GMIntegrationName = "sick",
    GMTab = "\229\156\186\230\153\175"
  },
  sjz = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "sgm sl 12",
      [3] = "gm succquestchain 100202",
      [4] = "gm succquestchain 200103",
      [5] = "gm startquest 10020312",
      [6] = "gm skipregion 1 101304 1"
    },
    GMIntegrationName = "sjz"
  },
  taixu = {
    GMCommands = {
      [1] = "gm skipregion 1 105301 1"
    },
    GMDisplayName = "\229\164\170\232\153\154\233\153\181",
    GMIntegrationName = "taixu",
    GMTab = "\229\156\186\230\153\175"
  },
  tavern = {
    GMCommands = {
      [1] = "gm skipregion 1 101107 1"
    },
    GMDisplayName = "\230\176\180\228\187\153\229\185\179\229\142\159",
    GMIntegrationName = "tavern",
    GMTab = "\229\156\186\230\153\175"
  },
  thea = {
    GMCommands = {
      [1] = "gm skipregion 1 101901 1"
    },
    GMDisplayName = "\230\173\140\229\137\167\233\153\162",
    GMIntegrationName = "thea",
    GMTab = "\229\156\186\230\153\175"
  },
  tingya = {
    GMCommands = {
      [1] = "gm skipregion 1 104102 1"
    },
    GMDisplayName = "\229\144\172\233\184\166\229\142\159",
    GMIntegrationName = "tingya",
    GMTab = "\229\156\186\230\153\175"
  },
  trafficway = {
    GMCommands = {
      [1] = "gm skipregion 1 101103 14"
    },
    GMDisplayName = "\229\134\176\230\185\150\229\159\142\229\133\172\232\183\175\229\140\186",
    GMIntegrationName = "trafficway",
    GMTab = "\229\156\186\230\153\175"
  },
  train = {
    GMCommands = {
      [1] = "gm enterdungeon 900001"
    },
    GMDisplayName = "\230\162\166\229\162\131\232\174\173\231\187\131\229\156\186",
    GMIntegrationName = "train",
    GMTab = "\229\156\186\230\153\175"
  },
  village = {
    GMCommands = {
      [1] = "gm skipregion 1 100101 1"
    },
    GMDisplayName = "\230\157\145\229\186\132",
    GMIntegrationName = "village",
    GMTab = "\229\156\186\230\153\175"
  },
  void = {
    GMCommands = {
      [1] = "gm skipregion 1 100104 1"
    },
    GMDisplayName = "\230\178\153\230\181\183\232\153\154\231\169\186",
    GMIntegrationName = "void",
    GMTab = "\229\156\186\230\153\175"
  },
  waitsaiqi = {
    GMCommands = {
      [1] = "sgm ar 2001 8000",
      [2] = "gm succquestchain 100206",
      [3] = "gm succquestchain 200102",
      [4] = "gm skipregion 1 101101 2"
    },
    GMIntegrationName = "waitsaiqi"
  },
  walk = {
    GMCommands = {
      [1] = "gm SystemCommonUnlock",
      [2] = "gm succquestchain 100205",
      [3] = "gm succquestchain 200102",
      [4] = "gm skipregion 1 101103 1",
      [5] = "gm startquest 10020608"
    },
    GMIntegrationName = "walk"
  },
  wangxi01 = {
    GMCommands = {
      [1] = "gm skipregion 1 104301 1"
    },
    GMDisplayName = "\229\190\128\233\154\15301",
    GMIntegrationName = "wangxi01",
    GMTab = "\229\156\186\230\153\175"
  },
  wangxi02 = {
    GMCommands = {
      [1] = "gm skipregion 1 104401 1"
    },
    GMDisplayName = "\229\190\128\233\154\15302",
    GMIntegrationName = "wangxi02",
    GMTab = "\229\156\186\230\153\175"
  },
  wangxi03 = {
    GMCommands = {
      [1] = "gm skipregion 1 105001 1"
    },
    GMDisplayName = "\229\190\128\233\154\15303",
    GMIntegrationName = "wangxi03",
    GMTab = "\229\156\186\230\153\175"
  },
  weimang = {
    GMCommands = {
      [1] = "gm skipregion 1 104109 1"
    },
    GMDisplayName = "\229\190\174\232\140\171\229\184\130",
    GMIntegrationName = "weimang",
    GMTab = "\229\156\186\230\153\175"
  },
  won1 = {
    GMCommands = {
      [1] = "gm skipregion 1 101401 1"
    },
    GMDisplayName = "\230\136\191\233\151\180\229\185\187\229\162\131",
    GMIntegrationName = "won1",
    GMTab = "\229\156\186\230\153\175"
  },
  won2 = {
    GMCommands = {
      [1] = "gm skipregion 1 101401 2"
    },
    GMDisplayName = "\232\138\177\230\181\183\229\185\187\229\162\131",
    GMIntegrationName = "won2",
    GMTab = "\229\156\186\230\153\175"
  },
  won3 = {
    GMCommands = {
      [1] = "gm skipregion 1 101402 1"
    },
    GMDisplayName = "\232\181\155\231\144\170\229\185\187\229\162\131\229\156\176\233\157\162",
    GMIntegrationName = "won3",
    GMTab = "\229\156\186\230\153\175"
  },
  won4 = {
    GMCommands = {
      [1] = "gm skipregion 1 101402 2"
    },
    GMDisplayName = "\232\181\155\231\144\170\229\185\187\229\162\131\231\169\186\228\184\173",
    GMIntegrationName = "won4",
    GMTab = "\229\156\186\230\153\175"
  },
  wuyousheng = {
    GMCommands = {
      [1] = "gm skipregion 1 105501 1"
    },
    GMDisplayName = "\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176",
    GMIntegrationName = "wuyousheng",
    GMTab = "\229\156\186\230\153\175"
  },
  yanyin = {
    GMCommands = {
      [1] = "gm skipregion 1 104801 1"
    },
    GMDisplayName = "\229\129\131\233\154\144\229\174\171",
    GMIntegrationName = "yanyin",
    GMTab = "\229\156\186\230\153\175"
  },
  youming = {
    GMCommands = {
      [1] = "gm skipregion 1 104104 1"
    },
    GMDisplayName = "\229\185\189\230\152\142\230\182\167",
    GMIntegrationName = "youming",
    GMTab = "\229\156\186\230\153\175"
  },
  youxing = {
    GMCommands = {
      [1] = "gm skipregion 1 104108 1"
    },
    GMDisplayName = "\230\184\184\230\152\159\229\159\160",
    GMIntegrationName = "youxing",
    GMTab = "\229\156\186\230\153\175"
  },
  zhilvge = {
    GMCommands = {
      [1] = "gm skipregion 1 105101 1"
    },
    GMDisplayName = "\230\137\167\229\190\139\233\152\129\229\174\164\229\134\133",
    GMIntegrationName = "zhilvge",
    GMTab = "\229\156\186\230\153\175"
  }
})
