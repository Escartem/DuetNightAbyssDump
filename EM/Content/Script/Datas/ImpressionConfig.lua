local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ImpressionConfig", {
  Benefit = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Benefit.T_Impression_Benefit'",
    StatusEffectIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Benefit_Golden.T_Impression_Benefit_Golden'",
    StatusId = "Benefit",
    StatusName = "Impression_Name_Benefit"
  },
  Chaos = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Chaos.T_Impression_Chaos'",
    StatusEffectIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Chaos_Golden.T_Impression_Chaos_Golden'",
    StatusId = "Chaos",
    StatusName = "Impression_Name_Chaos"
  },
  Common = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk.T_Interactive_Talk'",
    StatusId = "Common"
  },
  Empathy = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Empathy.T_Impression_Empathy'",
    StatusEffectIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Empathy_Golden.T_Impression_Empathy_Golden'",
    StatusId = "Empathy",
    StatusName = "Impression_Name_Empathy"
  },
  Morality = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Morality.T_Impression_Morality'",
    StatusEffectIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Morality_Golden.T_Impression_Morality_Golden'",
    StatusId = "Morality",
    StatusName = "Impression_Name_Morality"
  },
  Wisdom = {
    StatusCommonIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Wisdom.T_Impression_Wisdom'",
    StatusEffectIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Wisdom_Golden.T_Impression_Wisdom_Golden'",
    StatusId = "Wisdom",
    StatusName = "Impression_Name_Wisdom"
  }
})
