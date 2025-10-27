local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PersonalDetails", {
  Abyss_Difficulty = {
    DataType = "String",
    Des = "UI_Deteal_Abyss_1",
    Event = "Abyss_Difficulty",
    Sort = 1,
    TabID = 101
  },
  Abyss_Star = {
    DataType = "Int",
    Des = "UI_Deteal_Abyss_2",
    Event = "Abyss_Star",
    Sort = 3,
    TabID = 101
  },
  Rouge_Difficulty = {
    DataType = "Int",
    Des = "MAIN_UI_ROUGE",
    Event = "Rouge_Difficulty",
    Sort = 4,
    TabID = 101
  }
})
