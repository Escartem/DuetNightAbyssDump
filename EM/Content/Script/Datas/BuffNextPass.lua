local T = {}
T.RT_1 = {Width = 2}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BuffNextPass", {
  Dafu_Passive_Ranged = {
    MaterialPath = "/Game/Asset/Char/Player/Char026_Dafu/Materials/MI_Dafu_EffectOL01.MI_Dafu_EffectOL01",
    NextPassKey = "Dafu_Passive_Ranged",
    Params = {Width = 0.2}
  },
  Kezhou_Skill02_Body = {
    MaterialPath = "/Game/Asset/Char/Player/Char030_Kezhou/Materials/MI_Kezhou_EffectOL01.MI_Kezhou_EffectOL01",
    NextPassKey = "Kezhou_Skill02_Body",
    Params = {Width = 0.5}
  },
  Mon_Strong_Double = {
    MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common1.MI_Monster_Common1",
    NextPassKey = "Mon_Strong_Double",
    Params = T.RT_1
  },
  Mon_Strong_Single = {
    MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common.MI_Monster_Common",
    NextPassKey = "Mon_Strong_Single",
    Params = T.RT_1
  },
  Mon_Strong_Tripple = {
    MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common2.MI_Monster_Common2",
    NextPassKey = "Mon_Strong_Tripple",
    Params = T.RT_1
  },
  Tuosi_Skill02_Body = {
    MaterialPath = "/Game/Asset/Char/Player/Char025_Tuosi/Materials/MI_Tuosi_EffectOL01.MI_Tuosi_EffectOL01",
    NextPassKey = "Tuosi_Skill02_Body"
  }
})
