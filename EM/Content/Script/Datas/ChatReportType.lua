local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ChatReportType", {
  [1] = {
    Id = "JunkInform",
    Index = 1,
    Text = "UI_COMMONPOP_TEXT_100090_3"
  },
  [2] = {
    Id = "OffensiveLanguage",
    Index = 2,
    Text = "UI_COMMONPOP_TEXT_100090_4"
  },
  [3] = {
    Id = "Harass",
    Index = 3,
    Text = "UI_COMMONPOP_TEXT_100090_5"
  },
  [4] = {
    Id = "RealLifeThreat",
    Index = 4,
    Text = "UI_COMMONPOP_TEXT_100090_6"
  },
  [5] = {
    Id = "Cheat",
    Index = 5,
    Text = "UI_COMMONPOP_TEXT_100090_7"
  },
  [6] = {
    Id = "RealMoneyTrading",
    Index = 6,
    Text = "UI_COMMONPOP_TEXT_100090_8"
  },
  [7] = {
    Id = "IntentionalDisruption",
    Index = 7,
    Text = "UI_COMMONPOP_TEXT_100090_9"
  },
  [8] = {
    Id = "HateSpeech",
    Index = 8,
    Text = "UI_COMMONPOP_TEXT_100090_10"
  }
})
