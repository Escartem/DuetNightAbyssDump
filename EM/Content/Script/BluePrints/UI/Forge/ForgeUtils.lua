require("UnLua")
local ForgeUtils = {}

function ForgeUtils:ConstructItemContentFromResourceId(ResType, ResId)
  local ItemIcon = ItemUtils.GetItemIconPath(ResId, ResType)
  local ItemRarity = ItemUtils.GetItemRarity(ResId, ResType)
  local Content = {
    UIName = "ForgeMain",
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
    Id = ResId,
    ItemType = ResType,
    Rarity = ItemRarity,
    Icon = ItemIcon
  }
  return Content
end

function ForgeUtils:ConstructItemContentFromDraftId(DraftId)
  local DraftInfo = DataMgr.Draft[DraftId]
  local Content = {
    Id = DraftInfo.ProductId,
    UIName = "ForgeMain",
    ItemType = DraftInfo.ProductType,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
    HandleMouseDown = true
  }
  local ProductName = ""
  if DraftInfo then
    if DraftInfo.ProductType == "Weapon" then
      local WeaponInfo = DataMgr.Weapon[DraftInfo.ProductId]
      ProductName = GText(WeaponInfo.WeaponName)
      Content.Icon = WeaponInfo.Icon
      Content.Rarity = WeaponInfo.WeaponRarity
    elseif DraftInfo.ProductType == "Mod" then
      local ModInfo = DataMgr.Mod[DraftInfo.ProductId]
      ProductName = GText(ModInfo.Name)
      Content.Icon = ModInfo.Icon
      Content.Rarity = ModInfo.Rarity
    elseif DraftInfo.ProductType == "Resource" then
      local ResInfo = DataMgr.Resource[DraftInfo.ProductId]
      ProductName = GText(ResInfo.ResourceName)
      Content.Icon = ResInfo.Icon
      Content.Rarity = ResInfo.Rarity
    elseif DraftInfo.ProductType == "CharAccessory" then
      local AccessoryInfo = DataMgr.CharAccessory[DraftInfo.ProductId]
      ProductName = GText(AccessoryInfo.Name)
      Content.Icon = AccessoryInfo.Icon
      Content.Rarity = AccessoryInfo.Rarity
    elseif DraftInfo.ProductType == "Other" then
    end
    if DraftInfo.ProductNum and DraftInfo.ProductNum > 1 then
      ProductName = ProductName .. " x" .. tostring(DraftInfo.ProductNum)
    end
  end
  Content.ProductName = ProductName
  return Content
end

function ForgeUtils:SecondsToHMS(Second)
  local Hour = math.floor(Second / 3600)
  Second = Second % 3600
  local Minute = math.floor(Second / 60)
  Second = Second % 60
  return Hour, Minute, Second
end

function ForgeUtils:GetResourceNum(ResType, ResId)
  local PlayerAvatar = GWorld:GetAvatar()
  if "Mod" == ResType then
    return PlayerAvatar:GetModCount2ModId(ResId)
  elseif "Resource" == ResType then
    return PlayerAvatar:GetResourceNum(ResId)
  end
  return 0
end

return ForgeUtils
