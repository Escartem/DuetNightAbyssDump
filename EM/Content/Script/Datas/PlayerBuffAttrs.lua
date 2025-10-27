local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerBuffAttrs", {
  ATK = {
    Attr = "ATK",
    AttrName = "PlayerLevel_Buff_ATK",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Atk.T_ExperienceBuff_Atk",
    PlayerBuffLockedTips = "PlayerBuff_LockedTips_4",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Atk_Small.T_ExperienceBuff_Atk_Small",
    UnlockLevel = 45
  },
  DEF = {
    Attr = "DEF",
    AttrName = "PlayerLevel_Buff_DEF",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Def.T_ExperienceBuff_Def",
    PlayerBuffLockedTips = "PlayerBuff_LockedTips_2",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Def_Small.T_ExperienceBuff_Def_Small",
    UnlockLevel = 25
  },
  MaxES = {
    Attr = "MaxES",
    AttrName = "PlayerLevel_Buff_MaxEs",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Shield.T_ExperienceBuff_Shield",
    PlayerBuffLockedTips = "PlayerBuff_LockedTips_1",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Shield_Small.T_ExperienceBuff_Shield_Small",
    UnlockLevel = 15
  },
  MaxHp = {
    Attr = "MaxHp",
    AttrName = "PlayerLevel_Buff_MaxHp",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Hp.T_ExperienceBuff_Hp",
    PlayerBuffLockedTips = "PlayerBuff_LockedTips_3",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Experience/T_ExperienceBuff_Hp_Small.T_ExperienceBuff_Hp_Small",
    UnlockLevel = 35
  }
})
