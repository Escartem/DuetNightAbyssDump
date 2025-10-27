require("UnLua")
require("DataMgr")
local WBP_RankInfo_C = Class()

function WBP_RankInfo_C:SetTextByTable(Text_Table)
  self.Text_Index:SetText(Text_Table[1])
  self.Text_PlayerName:SetText(Text_Table[2])
  self.Text_SortParam:SetText(Text_Table[3])
  self.Text_UseCharacter:SetText(Text_Table[4])
  self.Text_MeleeWeapon:SetText(Text_Table[5])
  self.Text_RangedWeapon:SetText(Text_Table[6])
  self.Text_DamageValue:SetText(Text_Table[7])
end

function WBP_RankInfo_C:SetTextByInfo(Index, Info)
  self.Text_Index:SetText(Index)
  self.Text_PlayerName:SetText(Info.Account)
  self.Text_SortParam:SetText(Info.RankValue)
  local CharName = GText(DataMgr.Char[Info.Char.CharId].CharName)
  self.Text_UseCharacter:SetText(CharName)
  local MeleeWeaponName = GText(DataMgr.Weapon[Info.MeleeWeapon.WeaponId].WeaponName)
  self.Text_MeleeWeapon:SetText(MeleeWeaponName)
  local RangedWeaponName = GText(DataMgr.Weapon[Info.RangedWeapon.WeaponId].WeaponName)
  self.Text_RangedWeapon:SetText(RangedWeaponName)
  self.Text_DamageValue:SetText(Info.Damage)
end

return WBP_RankInfo_C
