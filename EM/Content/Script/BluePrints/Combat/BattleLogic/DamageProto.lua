local sproto = require("Utils.Sproto.Sproto")
local CommonUtils = require("Utils.CommonUtils")
local DamageProtoStr = [[
.Damage {
	.RateStruct {
		ExtraDamage 0 : integer
		ExtraEffect 1 : integer
	}
	.DamageValues {]]
local DamageTypes = CommonUtils.Keys(DataMgr.DamageType)
table.sort(DamageTypes)
for Index, DamageType in ipairs(DamageTypes) do
  DamageProtoStr = DamageProtoStr .. [[

		]] .. DamageType .. " " .. tostring(Index - 1) .. " : RateStruct"
end
DamageProtoStr = DamageProtoStr .. [[

	]] .. [[
}
	.Vector {
		X 0 : double
		Y 1 : double
		Z 2 : double
	}
	SourceEid 0 : integer
	TargetEid 1 : integer
	DamageType 2 : string
	TrueValue 3 : integer
	EnergyShieldReduce 4 : integer
	DamageValues 5 :DamageValues
	CollisionName 6 : string
	SkillId 7 : integer
	DamageCritLevel 8 : integer
	EnableIcon 9 : integer
	KillTarget 10 : boolean
	DamageTag 11 : *string
	HitPosition 12 : Vector
	HitDirection 13 : Vector
	CauseHitDamage 14 : boolean
}
]]
PrintTable({DamageProtoStr = DamageProtoStr})
local DamageProto = sproto.parse(DamageProtoStr)
return DamageProto
