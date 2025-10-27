require("UnLua")
local WBP_Forging_MaterialReturn_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Forging_MaterialReturn_PC_C:UpdateView(ResInfos)
  for _, ResInfo in ipairs(ResInfos) do
    local ResWidget = self:CreateWidgetNew("ComItemUniversalM")
    if ResInfo.ResType == "Weapon" then
      local WeaponData = DataMgr.Weapon[ResInfo.ResId]
      if WeaponData then
        ResWidget:SetRarity(WeaponData.WeaponRarity)
        ResWidget:SetIcon(WeaponData.Icon)
      end
    elseif ResInfo.ResType == "Mod" then
      local ModData = DataMgr.Mod[ResInfo.ResId]
      if ModData then
        Content.Rarity = ModData.Rarity
        Content.Icon = ModData.Icon
      end
    elseif ResInfo.ResType == "Resource" then
      local ResourceData = DataMgr.Resource[ResInfo.ResId]
      if ResourceData then
        Content.Icon = ResourceData.Icon
        Content.Rarity = ResourceData.Rarity
      end
    end
  end
end

return WBP_Forging_MaterialReturn_PC_C
