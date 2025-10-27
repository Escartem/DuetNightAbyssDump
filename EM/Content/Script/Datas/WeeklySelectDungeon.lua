local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeeklySelectDungeon", {
  [1] = {
    ChapterId = 1,
    ChapterName = "UI_DUNGEON_TYPE_SYNTHESIS",
    ChapterSubName = "UI_DUNGEON_DROP_MOD",
    DungeonList = {
      91302,
      91304,
      91306,
      91307
    },
    GuidanceTitle = 200001,
    Path = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Play_Weekly01.T_Play_Weekly01",
    RewardViewId = 90012,
    Sequence = 10
  }
})
