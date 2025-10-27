require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitItemInfo(ItemType, ItemId, UnitId)
  local PlayerAvatar = GWorld:GetAvatar()
  self.ParentWidget.Text_Phantom:SetText(GText("UI_Shadow_Name"))
  local PhantomInfo = DataMgr.Resource[ItemId]
  if PhantomInfo and PhantomInfo.FunctionDes then
    self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Describe:SetText(GText(PhantomInfo.FunctionDes))
  else
    self.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Level
  for _, v in pairs(PlayerAvatar.Chars) do
    if v.CharId == DataMgr.Resource[ItemId].UseParam then
      Level = v.Level
    end
  end
  self.ParentWidget.Text_Level02:SetText(Level)
  local WeaponUuid = PlayerAvatar.Resources[ItemId].WeaponUuid
  self.Text_Weapon:SetText(GText("UI_Shadow_Carrying"))
  local WeaponItem = self:CreateWidgetNew("PhantomWeaponItemDetails")
  if WeaponUuid and "" ~= WeaponUuid then
    WeaponItem.Switch_Type:SetActiveWidget(WeaponItem.Panel_Material)
    local WeaponServerData = PlayerAvatar.Weapons[WeaponUuid]
    local WeaponInfo = DataMgr.Weapon[WeaponServerData.WeaponId]
    WeaponItem.Img_Weapon:SetBrushResourceObject(LoadObject(WeaponInfo.Icon))
    WeaponItem.Text_Name:SetText(GText(WeaponServerData.WeaponName))
    WeaponItem.Text_Level02:SetText(WeaponServerData.Level)
  else
    WeaponItem.Switch_Type:SetActiveWidget(WeaponItem.Panel_Empty)
    WeaponItem.Text_Empty:SetText(GText("UI_Armory_Weapon_NoAssist"))
  end
  self.Weapon:AddChild(WeaponItem)
end

return M
