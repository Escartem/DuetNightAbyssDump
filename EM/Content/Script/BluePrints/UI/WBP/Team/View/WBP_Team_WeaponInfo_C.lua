require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Level_Name:SetText(GText("BATTLE_UI_BLOOD_LV"))
end

function M:Destruct()
end

function M:Init(WeaponId, WeaponLevel, WeaponType)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  DebugPrint(DebugTag, LXYTag, "WBP_Team_WeaponInfo_C:: WeaponId", WeaponId)
  local WeaponData = DataMgr.Weapon[WeaponId]
  local WeaponName = GText(WeaponData.WeaponName)
  self.Text_Info:SetText(WeaponName)
  local TagIconPath
  if WeaponType == CommonConst.WeaponType.MeleeWeapon then
    TagIconPath = TeamCommon.MeleeWeaponIconPath
  elseif WeaponType == CommonConst.WeaponType.RangedWeapon then
    TagIconPath = TeamCommon.RangedWeaponIconPath
  end
  UE.UResourceLibrary.LoadObjectAsync(self, TagIconPath, {
    self,
    M.OnIconLoadFinish
  })
  self.Text_Level:SetText(WeaponLevel)
end

function M:OnIconLoadFinish(Object)
  if IsValid(self) and self.Icon_Info then
    self.Icon_Info:SetBrushResourceObject(Object)
  end
end

return M
