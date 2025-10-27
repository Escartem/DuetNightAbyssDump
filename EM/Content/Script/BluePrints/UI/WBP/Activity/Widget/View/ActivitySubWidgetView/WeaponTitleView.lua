require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(WeaponId, ClickCallback, ParentWiget)
  local WeaponInfo = DataMgr.Weapon[WeaponId]
  if WeaponInfo then
    self:FillWithTitleInfo(WeaponInfo.WeaponName, WeaponInfo.WeaponRarity, WeaponId)
  end
  self.ParentWiget = ParentWiget
  self.ClickCallback = ClickCallback
  self.Btn_Detail.OnClicked:Clear()
  self.Btn_Detail.OnClicked:Add(self, self.BtnClicked)
end

function M:FillWithTitleInfo(TargetName, TargetRarity, WeaponId)
  self.Text_CharName:SetText(GText(TargetName))
  for i = 1, CommonConst.GachaRarityMax do
    if self["Gacha_Star_" .. i] then
      self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  local BattleWeaponInfo = DataMgr.BattleWeapon[WeaponId]
  local TargetProperty = BattleWeaponInfo.WeaponTag[2]
  local WeaponTag = DataMgr.WeaponTag[TargetProperty]
  if WeaponTag then
    local IconName = WeaponTag.Icon
    local AttributeIcon = LoadObject(IconName)
    if AttributeIcon then
      self.Image_WeaponIcon:SetBrushResourceObject(AttributeIcon)
    end
  end
end

function M:BtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.ClickCallback then
    self.ClickCallback(self.ParentWiget)
  end
end

return M
