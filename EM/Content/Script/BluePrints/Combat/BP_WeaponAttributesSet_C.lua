require("UnLua")
local BP_WeaponAttributesSet_C = Class("BluePrints.Combat.BaseAttributesSet")
BP_WeaponAttributesSet_C.CppAttrs = {}

function BP_WeaponAttributesSet_C:LevelUp(NewLevel, WeaponId)
  local Owner = self.OwnerActor.Owner
  if Owner:IsMainPlayer() then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if Owner == Owner.MeleeWeapon then
      UIManager:ShowLevelUpToast(NewLevel, "MeleeWeapon", WeaponId)
    elseif Owner == Owner.RangedWeapon then
      UIManager:ShowLevelUpToast(NewLevel, "RangedWeapon", WeaponId)
    end
  end
end

return BP_WeaponAttributesSet_C
