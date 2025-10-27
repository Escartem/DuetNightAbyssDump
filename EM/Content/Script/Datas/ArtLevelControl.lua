local T = {}
T.RT_1 = {
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00010",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00011",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00012",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00013",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00018",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00019",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00020",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00021",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00025",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00026",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00027",
  "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00028"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArtLevelControl", {
  [1] = {
    Id = 1,
    InTime = 0.5,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_IcelakeCIty_IQ1003_Task.Chapter01_IcelakeCIty_IQ1003_Task",
      [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_IQ1003_Task_NavMesh.Chapter01_IcelakeCity_IQ1003_Task_NavMesh"
    },
    OutTime = 0.5,
    RegionId = 1011,
    UnLoadLevelList = {
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00029",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00030",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00031",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00040",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00041",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00042",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00043",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00053",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00054",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00055",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_Icelake_NavMesh_00056",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00004",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00005",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00006",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00007",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00008",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00009",
      "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_IcelakeCity_NavMesh_00010"
    },
    VarName = "IQ1003"
  },
  [2] = {
    Id = 2,
    InTime = 0.5,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ1002_Task.Chapter01_TrafficWay_IQ1002_Task",
      [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_TrafficWay_IQ1002_Task_NavMesh.Chapter01_TrafficWay_IQ1002_Task_NavMesh"
    },
    OutTime = 0.5,
    RegionId = 1011,
    UnLoadLevelList = T.RT_1,
    VarName = "IQ1002"
  },
  [3] = {
    Id = 3,
    InTime = 0.5,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha01_IQ110103_Task.Haiboliya_Longsha01_IQ110103_Task",
      [2] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha01_IQ110103_Task_Navmesh.Haiboliya_Longsha01_IQ110103_Task_Navmesh"
    },
    OutTime = 0.5,
    RegionId = 1021,
    UnLoadLevelList = {
      "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha01_NavMesh.Haiboliya_Longsha01_NavMesh"
    },
    VarName = "IQ110103"
  },
  [4] = {
    Id = 4,
    InTime = 0.5,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_IQ110107_Task.Haiboliya_Longsha02_IQ110107_Task",
      [2] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha02_IQ110107_Task_Navmesh.Haiboliya_Longsha02_IQ110107_Task_Navmesh"
    },
    OutTime = 0.5,
    RegionId = 1021,
    UnLoadLevelList = {
      "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Navmesh_Data/Haiboliya_Longsha02_NavMesh.Haiboliya_Longsha02_NavMesh"
    },
    VarName = "IQ110107"
  },
  [5] = {
    Id = 5,
    InTime = 0.5,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ100303_Task.Chapter01_TrafficWay_IQ100303_Task",
      [2] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Navmesh_Data/Chapter01_TrafficWay_IQ100303_Task_NavMesh.Chapter01_TrafficWay_IQ100303_Task_NavMesh"
    },
    OutTime = 0.5,
    RegionId = 1011,
    UnLoadLevelList = T.RT_1,
    VarName = "IQ100303"
  },
  [6] = {
    Id = 6,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_NPC110108_Task.Haiboliya_Longsha02_NPC110108_Task"
    },
    OutTime = 0,
    RegionId = 1021,
    VarName = "NPC110108"
  },
  [7] = {
    Id = 7,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_LinshiNPC110101_Task.Haiboliya_Longsha02_LinshiNPC110101_Task"
    },
    OutTime = 0,
    RegionId = 1021,
    VarName = "LinshiNPC110101"
  },
  [8] = {
    Id = 8,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_NengYuanNPC110105_Task.Haiboliya_Longsha02_NengYuanNPC110105_Task"
    },
    OutTime = 0,
    RegionId = 1021,
    VarName = "NengYuanNPC110105"
  },
  [9] = {
    Id = 9,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_ShenWenNPC110105_Task.Haiboliya_Longsha02_ShenWenNPC110105_Task"
    },
    OutTime = 0,
    RegionId = 1021,
    VarName = "ShenWenNPC110105"
  },
  [10] = {
    Id = 10,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Task_Data/Haiboliya_Longsha02_XimengNPC110105_Task.Haiboliya_Longsha02_XimengNPC110105_Task"
    },
    OutTime = 0,
    RegionId = 1021,
    VarName = "XimengNPC110105"
  },
  [11] = {
    Id = 11,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_IQ100306_Task.BH_Thea_IQ100306_Task",
      [2] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/NavMesh_Data/BH_Thea_IQ100306_Task_Navmesh.BH_Thea_IQ100306_Task_Navmesh"
    },
    OutTime = 0,
    RegionId = 1019,
    UnLoadLevelList = {
      "/Game/Maps/Levels/Chapter01/BH_Thea_Main/NavMesh_Data/BH_Thea_Navmesh.BH_Thea_Navmesh"
    },
    VarName = "IQ100306"
  },
  [12] = {
    Id = 12,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Sew_Main/Task_Data/Chapter01_Sew03_IQ100304_Task.Chapter01_Sew03_IQ100304_Task"
    },
    OutTime = 0,
    RegionId = 1017,
    VarName = "IQ100304"
  },
  [13] = {
    Id = 13,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Fil_DaFengBaoXiang200303_Task.Huaxu_Yanjindu_Fil_DaFengBaoXiang200303_Task"
    },
    OutTime = 0,
    RegionId = 1041,
    VarName = "DaFengBaoXiang200303"
  },
  [14] = {
    Id = 14,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_IQ10030601_Task.BH_Thea_IQ10030601_Task"
    },
    OutTime = 0,
    RegionId = 1019,
    VarName = "IQ10030601"
  },
  [15] = {
    Id = 15,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Plai_ZhuXingMuXiang200302_Task.Huaxu_Yanjindu_Plai_ZhuXingMuXiang200302_Task"
    },
    OutTime = 0,
    RegionId = 1041,
    VarName = "ZhuXingMuXiang200302"
  },
  [16] = {
    Id = 16,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Task_Data/Huaxu_Yanjindu_Plai_ZhuXingMuXiang20030203_Task.Huaxu_Yanjindu_Plai_ZhuXingMuXiang20030203_Task"
    },
    OutTime = 0,
    RegionId = 1041,
    VarName = "ZhuXingMuXiang20030203"
  },
  [17] = {
    Id = 17,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/Task_Data/BH_Thea_Online_Task.BH_Thea_Online_Task"
    },
    OutTime = 0,
    RegionId = 1019,
    VarName = "BH_Thea_Online"
  },
  [18] = {
    Id = 18,
    InTime = 0,
    LoadLevel = {
      [1] = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Task_Data/Chapter01_TrafficWay_IQ10030498_Task.Chapter01_TrafficWay_IQ10030498_Task"
    },
    OutTime = 0,
    RegionId = 1011,
    VarName = "IQ10030498"
  }
})
