local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ImpressionDifficulty", {
  Easy = {
    DifficultyColor = "3a9e4f",
    DifficultyId = "Easy",
    DifficultyMinValue = 0.7,
    DifficultyName = "Impression_UI_Easy"
  },
  Hard = {
    DifficultyColor = "b6482a",
    DifficultyId = "Hard",
    DifficultyMinValue = 0.05,
    DifficultyName = "Impression_UI_Hard"
  },
  Impossible = {
    DifficultyColor = "82122a",
    DifficultyId = "Impossible",
    DifficultyMinValue = 0,
    DifficultyName = "Impression_UI_Impossible"
  },
  Middle = {
    DifficultyColor = "c6952b",
    DifficultyId = "Middle",
    DifficultyMinValue = 0.3,
    DifficultyName = "Impression_UI_Middle"
  }
})
