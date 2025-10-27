local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MapMarkIcon", {
  [1] = {
    MarkIconID = 1,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Star.T_Map_MarkIcon_Star",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Star.T_Gp_Mark_Star"
    }
  },
  [2] = {
    MarkIconID = 2,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Mission.T_Map_MarkIcon_Mission",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Mission.T_Gp_Mark_Mission"
    }
  },
  [3] = {
    MarkIconID = 3,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Enemy.T_Map_MarkIcon_Enemy",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Enemy.T_Gp_Mark_Enemy"
    }
  },
  [4] = {
    MarkIconID = 4,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Collect.T_Map_MarkIcon_Collect",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Collect.T_Gp_Mark_Collect"
    }
  },
  [5] = {
    MarkIconID = 5,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Fish.T_Map_MarkIcon_Fish",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Fish.T_Gp_Mark_Fish"
    }
  },
  [6] = {
    MarkIconID = 6,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Mining.T_Map_MarkIcon_Mining",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Mining.T_Gp_Mark_Mining"
    }
  },
  [7] = {
    MarkIconID = 7,
    MarkIconPath = {
      Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Pet.T_Map_MarkIcon_Pet",
      Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Pet.T_Gp_Mark_Pet"
    }
  }
})
