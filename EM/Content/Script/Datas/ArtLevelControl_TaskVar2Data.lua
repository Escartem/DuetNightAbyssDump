local T = {}
T.RT_1 = {
  [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00010",
  [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00011",
  [3] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00012",
  [4] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00013",
  [5] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00018",
  [6] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00019",
  [7] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00020",
  [8] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00021",
  [9] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00025",
  [10] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00026",
  [11] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00027",
  [12] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00028"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArtLevelControl_TaskVar2Data", {
  BH_Thea_Online = {
    [1019] = {
      Id = 17,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_Online_Task.BH_Thea_Online_Task"
      },
      OutTime = 0,
      RegionId = 1019,
      VarName = "BH_Thea_Online"
    }
  },
  DaFengBaoXiang200303 = {
    [1041] = {
      Id = 13,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Fil_DaFengBaoXiang200303_Task.Huaxu_Yanjindu_Fil_DaFengBaoXiang200303_Task"
      },
      OutTime = 0,
      RegionId = 1041,
      VarName = "DaFengBaoXiang200303"
    }
  },
  IQ1002 = {
    [1011] = {
      Id = 2,
      InTime = 0.5,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ1002_Task.Chapter01_TrafficWay_IQ1002_Task",
        [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_TrafficWay_IQ1002_Task_NavMesh.Chapter01_TrafficWay_IQ1002_Task_NavMesh"
      },
      OutTime = 0.5,
      RegionId = 1011,
      UnLoadLevel = T.RT_1,
      VarName = "IQ1002"
    }
  },
  IQ1003 = {
    [1011] = {
      Id = 1,
      InTime = 0.5,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_IcelakeCIty_IQ1003_Task.Chapter01_IcelakeCIty_IQ1003_Task",
        [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_IQ1003_Task_NavMesh.Chapter01_IcelakeCity_IQ1003_Task_NavMesh"
      },
      OutTime = 0.5,
      RegionId = 1011,
      UnLoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00029",
        [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00030",
        [3] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00031",
        [4] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00040",
        [5] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00041",
        [6] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00042",
        [7] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00043",
        [8] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00053",
        [9] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00054",
        [10] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00055",
        [11] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00056",
        [12] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00004",
        [13] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00005",
        [14] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00006",
        [15] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00007",
        [16] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00008",
        [17] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00009",
        [18] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00010"
      },
      VarName = "IQ1003"
    }
  },
  IQ100303 = {
    [1011] = {
      Id = 5,
      InTime = 0.5,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ100303_Task.Chapter01_TrafficWay_IQ100303_Task",
        [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_TrafficWay_IQ100303_Task_NavMesh.Chapter01_TrafficWay_IQ100303_Task_NavMesh"
      },
      OutTime = 0.5,
      RegionId = 1011,
      UnLoadLevel = T.RT_1,
      VarName = "IQ100303"
    }
  },
  IQ100304 = {
    [1017] = {
      Id = 12,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Sew_Main/Task_Data/Chapter01_Sew03_IQ100304_Task.Chapter01_Sew03_IQ100304_Task"
      },
      OutTime = 0,
      RegionId = 1017,
      VarName = "IQ100304"
    }
  },
  IQ10030498 = {
    [1011] = {
      Id = 18,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ10030498_Task.Chapter01_TrafficWay_IQ10030498_Task"
      },
      OutTime = 0,
      RegionId = 1011,
      VarName = "IQ10030498"
    }
  },
  IQ100306 = {
    [1019] = {
      Id = 11,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_IQ100306_Task.BH_Thea_IQ100306_Task",
        [2] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/NavMesh_Data/BH_Thea_IQ100306_Task_Navmesh.BH_Thea_IQ100306_Task_Navmesh"
      },
      OutTime = 0,
      RegionId = 1019,
      UnLoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/NavMesh_Data/BH_Thea_Navmesh.BH_Thea_Navmesh"
      },
      VarName = "IQ100306"
    }
  },
  IQ10030601 = {
    [1019] = {
      Id = 14,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_IQ10030601_Task.BH_Thea_IQ10030601_Task"
      },
      OutTime = 0,
      RegionId = 1019,
      VarName = "IQ10030601"
    }
  },
  IQ110103 = {
    [1021] = {
      Id = 3,
      InTime = 0.5,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha01_IQ110103_Task.Haiboliya_Longsha01_IQ110103_Task",
        [2] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha01_IQ110103_Task_Navmesh.Haiboliya_Longsha01_IQ110103_Task_Navmesh"
      },
      OutTime = 0.5,
      RegionId = 1021,
      UnLoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha01_NavMesh.Haiboliya_Longsha01_NavMesh"
      },
      VarName = "IQ110103"
    }
  },
  IQ110107 = {
    [1021] = {
      Id = 4,
      InTime = 0.5,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_IQ110107_Task.Haiboliya_Longsha02_IQ110107_Task",
        [2] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha02_IQ110107_Task_Navmesh.Haiboliya_Longsha02_IQ110107_Task_Navmesh"
      },
      OutTime = 0.5,
      RegionId = 1021,
      UnLoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha02_NavMesh.Haiboliya_Longsha02_NavMesh"
      },
      VarName = "IQ110107"
    }
  },
  LinshiNPC110101 = {
    [1021] = {
      Id = 7,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_LinshiNPC110101_Task.Haiboliya_Longsha02_LinshiNPC110101_Task"
      },
      OutTime = 0,
      RegionId = 1021,
      VarName = "LinshiNPC110101"
    }
  },
  NPC110108 = {
    [1021] = {
      Id = 6,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_NPC110108_Task.Haiboliya_Longsha02_NPC110108_Task"
      },
      OutTime = 0,
      RegionId = 1021,
      VarName = "NPC110108"
    }
  },
  NengYuanNPC110105 = {
    [1021] = {
      Id = 8,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_NengYuanNPC110105_Task.Haiboliya_Longsha02_NengYuanNPC110105_Task"
      },
      OutTime = 0,
      RegionId = 1021,
      VarName = "NengYuanNPC110105"
    }
  },
  ShenWenNPC110105 = {
    [1021] = {
      Id = 9,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_ShenWenNPC110105_Task.Haiboliya_Longsha02_ShenWenNPC110105_Task"
      },
      OutTime = 0,
      RegionId = 1021,
      VarName = "ShenWenNPC110105"
    }
  },
  XimengNPC110105 = {
    [1021] = {
      Id = 10,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_XimengNPC110105_Task.Haiboliya_Longsha02_XimengNPC110105_Task"
      },
      OutTime = 0,
      RegionId = 1021,
      VarName = "XimengNPC110105"
    }
  },
  ZhuXingMuXiang200302 = {
    [1041] = {
      Id = 15,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Plai_ZhuXingMuXiang200302_Task.Huaxu_Yanjindu_Plai_ZhuXingMuXiang200302_Task"
      },
      OutTime = 0,
      RegionId = 1041,
      VarName = "ZhuXingMuXiang200302"
    }
  },
  ZhuXingMuXiang20030203 = {
    [1041] = {
      Id = 16,
      InTime = 0,
      LoadLevel = {
        [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Plai_ZhuXingMuXiang20030203_Task.Huaxu_Yanjindu_Plai_ZhuXingMuXiang20030203_Task"
      },
      OutTime = 0,
      RegionId = 1041,
      VarName = "ZhuXingMuXiang20030203"
    }
  }
})
