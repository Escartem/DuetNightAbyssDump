local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SpecialLoading", {
  [1] = {
    Id = 1,
    RegionType = {From = "Main", To = "Fantasy"},
    TriggerCondition = {
      QuestUnstart = {QuestId = 10020802}
    },
    WBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_White.WBP_Com_Loading_White'"
  },
  [2] = {
    Id = 2,
    RegionType = {From = "Main", To = "EX"},
    WBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'"
  },
  [3] = {
    Id = 3,
    RegionType = {From = "EX", To = "Main"},
    WBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'"
  }
})
