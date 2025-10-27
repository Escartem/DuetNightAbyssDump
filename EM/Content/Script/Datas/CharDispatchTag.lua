local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharDispatchTag", {
  Battle = {
    Description = "UI_DispatchTag_Des_Battle",
    DispatchEffect = "battle",
    DispatchTag = "Battle",
    DispatchTagId = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A09.T_Dispatch_A09",
    Name = "UI_DispatchTag_Battle"
  },
  Benefit = {
    Description = "UI_DispatchTag_Des_Benefit",
    DispatchEffect = "Benefit",
    DispatchTag = "Benefit",
    DispatchTagId = 6,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_B02.T_Dispatch_B02",
    Name = "UI_DispatchTag_Benefit"
  },
  Chaos = {
    Description = "UI_DispatchTag_Des_Chaos",
    DispatchEffect = "Chaos",
    DispatchTag = "Chaos",
    DispatchTagId = 10,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_B04.T_Dispatch_B04",
    Name = "UI_DispatchTag_Chaos"
  },
  Collect = {
    Description = "UI_DispatchTag_Des_Collect",
    DispatchEffect = "collect",
    DispatchTag = "Collect",
    DispatchTagId = 2,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A03.T_Dispatch_A03",
    Name = "UI_DispatchTag_Collect"
  },
  Empathy = {
    Description = "UI_DispatchTag_Des_Empathy",
    DispatchEffect = "Empathy",
    DispatchTag = "Empathy",
    DispatchTagId = 9,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_B03.T_Dispatch_B03",
    Name = "UI_DispatchTag_Empathy"
  },
  Fish = {
    Description = "UI_DispatchTag_Des_Fish",
    DispatchEffect = "fish",
    DispatchTag = "Fish",
    DispatchTagId = 4,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A04.T_Dispatch_A04",
    Name = "UI_DispatchTag_Fish"
  },
  Lucky = {
    Description = "UI_DispatchTag_Des_Lucky",
    DispatchEffect = "Lucky",
    DispatchEffectParam = 7002,
    DispatchTag = "Lucky",
    DispatchTagId = 14,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A08.T_Dispatch_A08",
    IsBuff = 1,
    Name = "UI_DispatchTag_Lucky"
  },
  Mine = {
    Description = "UI_DispatchTag_Des_Mine",
    DispatchEffect = "mine",
    DispatchTag = "Mine",
    DispatchTagId = 3,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A07.T_Dispatch_A07",
    Name = "UI_DispatchTag_Mine"
  },
  Morality = {
    Description = "UI_DispatchTag_Des_Morality",
    DispatchEffect = "Morality",
    DispatchTag = "Morality",
    DispatchTagId = 7,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_B01.T_Dispatch_B01",
    Name = "UI_DispatchTag_Morality"
  },
  Pet = {
    Description = "UI_DispatchTag_Des_Pet",
    DispatchEffect = "pet",
    DispatchTag = "Pet",
    DispatchTagId = 5,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A01.T_Dispatch_A01",
    Name = "UI_DispatchTag_Pet"
  },
  Rigorous = {
    Description = "UI_DispatchTag_Des_Rigorous",
    DispatchEffect = "Rigorous",
    DispatchEffectParam = 5000,
    DispatchTag = "Rigorous",
    DispatchTagId = 12,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_B05.T_Dispatch_B05",
    IsBuff = 1,
    Name = "UI_DispatchTag_Rigorous"
  },
  Skilled = {
    Description = "UI_DispatchTag_Des_Skilled",
    DispatchEffect = "Skilled",
    DispatchEffectParam = 10000,
    DispatchTag = "Skilled",
    DispatchTagId = 13,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A06.T_Dispatch_A06",
    IsBuff = 1,
    Name = "UI_DispatchTag_Skilled"
  },
  Wisdom = {
    Description = "UI_DispatchTag_Des_Wisdom",
    DispatchEffect = "Wisdom",
    DispatchTag = "Wisdom",
    DispatchTagId = 8,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A02.T_Dispatch_A02",
    Name = "UI_DispatchTag_Wisdom"
  },
  Workaholic = {
    Description = "UI_DispatchTag_Des_Workaholic",
    DispatchEffect = "Workaholic",
    DispatchEffectParam = 2000,
    DispatchTag = "Workaholic",
    DispatchTagId = 11,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Dispatch/T_Dispatch_A05.T_Dispatch_A05",
    IsBuff = 1,
    Name = "UI_DispatchTag_Workaholic"
  }
})
