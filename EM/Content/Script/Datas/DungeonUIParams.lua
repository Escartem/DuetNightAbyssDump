local T = {}
T.RT_1 = {
  CoDefence_1 = "DUNGEON_DEFENCE_114",
  CoDefence_2 = "DUNGEON_DEFENCE_115",
  CoDefence_3 = "DUNGEON_DEFENCE_116",
  CoDefence_4 = "DUNGEON_DEFENCE_117",
  CoDefence_5 = "DUNGEON_DEFENCE_118",
  CoDefence_6 = "DUNGEON_DEFENCE_119",
  CoDefence_7 = "DUNGEON_DEFENCE_120",
  TotalPointNums = 3
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DungeonUIParams", {
  [1000] = {
    UIName = {
      [1] = "DungenonDefenseProFloat",
      [2] = "GuideCountDown",
      [3] = "WaveStartBP"
    },
    UIParamID = 1000,
    UIParams = {
      [1] = {
        mytestkey = "mytestvalue"
      },
      [2] = {
        mytestkey1 = "mytestvalue1"
      },
      [3] = {
        mytestkey2 = "mytestvalue2"
      }
    }
  },
  [1002] = {
    UIName = {
      [1] = "RegionMultiDestroyProgress"
    },
    UIParamID = 1002,
    UIParams = {
      [1] = {
        MultiDestroy_1 = "DUNGEON_ENGINE_102",
        MultiDestroy_2 = "DUNGEON_ENGINE_104",
        MultiDestroy_3 = "DUNGEON_ENGINE_101",
        MultiDestroy_4 = "DUNGEON_ENGINE_103",
        TotalPointNums = 4
      }
    }
  },
  [1003] = {
    UIName = {
      [1] = "RegionCoDefenceProgress",
      [2] = "DungenonDefenseProFloat"
    },
    UIParamID = 1003,
    UIParams = {
      [1] = T.RT_1,
      [2] = {
        DefenceProSubTitle = "UI_Mail_Date_Remain",
        DefenceProTitle = "DUNGEON_NAME_20003"
      }
    }
  },
  [1004] = {
    UIName = {
      [1] = "RegionHijackFloatPanel"
    },
    UIParamID = 1004,
    UIParams = {
      [1] = {
        HijackPanel_1 = "DUNGEON_PAOTAI_201",
        HijackPanel_2 = "DUNGEON_PAOTAI_202"
      }
    }
  },
  [1005] = {
    UIName = {
      [1] = "RegionCoDefenceProgress"
    },
    UIParamID = 1005,
    UIParams = {
      [1] = T.RT_1
    }
  }
})
