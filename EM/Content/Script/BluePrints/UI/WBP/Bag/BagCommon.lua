local BagCommon = {}
BagCommon.NpcId = 900005
BagCommon.MainUIName = "BagMain"
BagCommon.BagSellPageZOrder = 56
BagCommon.StuffType = {
  Weapon = "Weapon",
  Mod = "Mod",
  Resource = "Resource"
}
BagCommon.ItemTypeToTabId = {
  MeleeWeapon = 101,
  RangedWeapon = 102,
  Mod = 2,
  Resource = 3,
  TaskItem = 4,
  ReadItem = 5,
  FishItem = 6,
  ConsumableItem = 7
}
BagCommon.ConsumableItemTypeSortWeight = {
  ResourcePack = 1,
  SelectResource = 2,
  SelectPet = 3,
  SelectWeapon = 4,
  SelectCharacter = 5,
  SelectWeaponAccessory = 6,
  SelectCharAccessory = 7,
  SelectWeaponSkin = 8,
  SelectGeneralSkin = 9,
  SelectSkin = 10
}
BagCommon.SiftModelIds = {
  [BagCommon.ItemTypeToTabId.MeleeWeapon] = 1003,
  [BagCommon.ItemTypeToTabId.RangedWeapon] = 1004,
  [BagCommon.ItemTypeToTabId.Mod] = 1002,
  [BagCommon.ItemTypeToTabId.Resource] = 1001
}
BagCommon.SortFilters = {
  [BagCommon.ItemTypeToTabId.MeleeWeapon] = {
    "UI_Select_Level"
  },
  [BagCommon.ItemTypeToTabId.RangedWeapon] = {
    "UI_Select_Level"
  },
  [BagCommon.ItemTypeToTabId.Mod] = {
    "UI_Select_Kind",
    "UI_Select_Unique",
    "UI_Select_Level",
    "UI_Select_Price"
  },
  [BagCommon.ItemTypeToTabId.Resource] = {
    "UI_Select_Unique",
    "UI_Select_Price"
  },
  [BagCommon.ItemTypeToTabId.TaskItem] = {
    "UI_Select_Unique"
  },
  [BagCommon.ItemTypeToTabId.ReadItem] = {
    "UI_Select_Unique"
  },
  [BagCommon.ItemTypeToTabId.FishItem] = {
    "UI_Select_Unique"
  },
  [BagCommon.ItemTypeToTabId.ConsumableItem] = {
    "UI_Select_Unique"
  }
}
BagCommon.DefaultSelectTabId = BagCommon.ItemTypeToTabId.Resource
BagCommon.MinSellInputCount = 0
BagCommon.MaxSellInputCount = 999
BagCommon.MaxWeaponCount = 1000
BagCommon.AllBagState = {
  NormalState = "NormalState",
  ChooseSaleState = "ChooseSaleState",
  WeaponResolveState = "WeaponResolveState"
}
BagCommon.BagStuffSelectUIName = "BagStuffSelectToList"
BagCommon.BagItemSelectOpMode = {
  ResolveMode = "ResolveMode",
  SellMode = "SellMode"
}
BagCommon.RarityColorInfo = {
  Grey = 1,
  Green = 2,
  Blue = 3,
  Purple = 4,
  Yellow = 5
}
BagCommon.BagCacheDataName = "BagTabSelect"
BagCommon.LastStuffSellTimeStamp = "LastStuffNoMorePromptsTimeStamp"
BagCommon.LastWeaponResolveTimeStamp = "LastWeaponNoMorePromptsTimeStamp"
BagCommon.LastWeaponTooMoreWarningTimeStamp = "LastWeaponNoMoreWarningTimeStamp"
BagCommon.OptionalItemType = {
  Avatar = "Avatar",
  Weapon = "Weapon",
  Pet = "Pet"
}

function BagCommon:IsFishResource(ResourceId)
  local numId = tonumber(ResourceId)
  return numId and DataMgr.ResourceId2FishId[math.tointeger(numId)] ~= nil
end

function BagCommon:IsFishResourceLocked(FishResourceId, FishSize)
  local FishId = tonumber(FishResourceId)
  local Size = tonumber(FishSize)
  if not FishId or not Size then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  local BagFish = Avatar.FishSizes[FishId]
  return BagFish and BagFish:GetLockState(Size) or false
end

return BagCommon
