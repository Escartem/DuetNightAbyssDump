local function New()
  local ETalkType_Internal = {
    Bubble = "Bubble",
    
    Guide = "Guide",
    Show = "Show",
    HintGuide = "HintGuide",
    ForgingGuide = "ForgingGuide",
    UnimportGuide = "UnimportGuide",
    QueueGuide = "QueueGuide",
    Black = "Black",
    Boss = "Boss",
    AudioOnly = "AudioOnly",
    FaultBlack = "FaultBlack",
    BlackISS = "BlackISS",
    Cinematic = "Cinematic",
    FixSimple = "FixSimple",
    FreeSimple = "FreeSimple",
    Simple = "Simple",
    Impression = "Impression",
    QuestImpression = "QuestImpression",
    RougeLike = "RougeLike"
  }
  local Types = DataMgr.TalkType or {}
  for Type, TypeInfo in pairs(Types) do
    if not ETalkType_Internal[Type] then
      ETalkType_Internal[Type] = Type
    end
  end
  return ETalkType_Internal
end

return New()
