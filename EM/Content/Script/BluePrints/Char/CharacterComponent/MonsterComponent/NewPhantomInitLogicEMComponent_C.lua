require("UnLua")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local M = Class({
  "BluePrints.Char.CharacterComponent.MonsterComponent.NewMonInitLogicEMComponent_C"
})

function M:OnCharacterReady_AuthorityInit(Context)
  local Owner = self.Owner
  local RoleId = Context.IntParams:Find("RoleId") or -1
  local PlayerHp = Context.IntParams:Find("PlayerHp")
  local PlayerSp = Context.IntParams:Find("PlayerSp")
  local DeathInfo = Context:GetLuaTable("DeathInfo")
  local ModPassives = Context:GetLuaTable("ModPassives")
  local MeleeWeapon = Context:GetLuaTable("MeleeWeapon")
  local RangedWeapon = Context:GetLuaTable("RangedWeapon")
  local UltraWeapons = Context:GetLuaTable("UltraWeapons")
  local ReplaceAttrs = Context:GetLuaTable("ReplaceAttrs")
  self:SetPhantomInfo(PlayerHp, PlayerSp)
  Owner:SetDeathInfo(DeathInfo)
  Owner:ServerSetRoleMod(RoleId, ModPassives, false)
  Owner:ServerSetUpWeapons(MeleeWeapon, RangedWeapon, UltraWeapons)
  Owner:InitAllWeaponModifier(ReplaceAttrs)
end

function M:CallBlueprintCharacterReadyAndBeginPlay()
  self.Owner.Overridden.OnCharacterReady(self.Owner)
  self.Owner.Overridden.ReceiveBeginPlay(self.Owner)
end

function M:GetDataInfo()
  self.Owner.BattleCharInfo = nil
  local RoleId = self.Owner.CurrentRoleId
  if not RoleId or 0 == RoleId then
    return
  end
  self.Owner.BattleCharInfo = DataMgr.BattleChar[RoleId]
end

function M:SetPhantomInfo(PlayerHp, PlayerSp)
  if PlayerHp then
    self.Owner:SetAttr("Hp", math.min(PlayerHp, self.Owner:GetAttr("MaxHp")))
  end
  if PlayerSp then
    self.Owner:SetAttr("Sp", math.min(PlayerSp, self.Owner:GetAttr("MaxSp")))
  end
end

function M:TryPlayLevelEnterMontage_Lua(LevelEnterMontagePath)
  local MontageTime = self.Owner:PlayMontageByPath(LevelEnterMontagePath)
  self.Owner:AddDelayFrameFunc(function()
    self.Owner:SetMeshVisibilityBasedAnimTickOption(EVisibilityBasedAnimTickOption.AlwaysTickPose)
  end, 5)
  return MontageTime
end

return M
