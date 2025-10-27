local TimeUtils = require("Utils.TimeUtils")
local ItemUtils = {}

function ItemUtils:IsServerCreate(ItemId)
  local ItemInfo = DataMgr.Drop[ItemId]
  return ItemInfo.CreateMode == "server"
end

function ItemUtils:AddItemsToTarget(Target, Items)
  if type(Target) ~= "table" or type(Items) ~= "table" then
    return
  end
  for ItemId, Count in pairs(Items) do
    if Target[ItemId] then
      Target[ItemId] = Target[ItemId] + Count
    else
      Target[ItemId] = Count
    end
  end
end

function ItemUtils:AddItemToTarget(Target, Id, Count)
  if type(Target) ~= "table" or type(Count) ~= "number" then
    return
  end
  if Target[Id] then
    Target[Id] = Target[Id] + Count
  else
    Target[Id] = Count
  end
end

function ItemUtils:GetDraftName(ItemId)
  local DraftInfo = DataMgr.Draft[ItemId]
  local ProductType = DraftInfo.ProductType
  local ProductId = DraftInfo.ProductId
  local ProductData = DataMgr[ProductType][ProductId]
  local Name = GText("UI_FORGING_BLUEPRINT") .. GText(ProductData[ProductType .. "Name"] or ProductData.Name)
  return Name
end

local function IsNilOrEmpty(InStr)
  return nil == InStr or "" == InStr
end

function ItemUtils:GetDropName(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return ""
  end
  if "Walnut" == TableName then
    local WalnutName = DataMgr.Walnut[ItemId].Name
    return GText(WalnutName)
  end
  local Name = TableName .. "Name"
  local ItemName = GText(ItemData[Name] or ItemData.Name)
  if IsNilOrEmpty(ItemName) then
    return ItemData[Name]
  end
  return ItemName
end

function ItemUtils.GetItemName(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return nil
  end
  if not ItemData.Name then
    if "Weapon" == TableName then
      return ItemData.WeaponName
    elseif "Resource" == TableName then
      return ItemData.ResourceName
    else
      DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176Name\229\173\151\230\174\181, TableName = ", TableName)
      return nil
    end
  else
    return ItemData.Name
  end
end

function ItemUtils.GetItemIcon(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return
  end
  local IconPath = ItemData.Icon
  if IconPath and not string.find(IconPath, "/Game/") then
    IconPath = "/Game/" .. IconPath
  end
  if "Walnut" == TableName then
    IconPath = DataMgr.Walnut[ItemId].Icon
  end
  return LoadObject(IconPath)
end

function ItemUtils.GetItemIconPath(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return
  end
  local IconPath = ItemData.Icon
  if IconPath and not string.find(IconPath, "/Game/") then
    IconPath = "/Game/" .. IconPath
  end
  if "Walnut" == TableName then
    IconPath = DataMgr.Walnut[ItemId].Icon
  end
  return IconPath
end

function ItemUtils.GetItemRarity(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return 0
  end
  return ItemData.Rarity or ItemData[TableName .. "Rarity"] or 0
end

function ItemUtils.GetItemDescribe(ItemId, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return ""
  end
  return GText(ItemData.Description or ItemData[TableName .. "Describe"])
end

function ItemUtils.GetWalnutItemPercent(WalnutItemId)
  DebugPrint("GetWalnutItemPercent WalnutItemId", WalnutItemId)
  local WalnutData = DataMgr.Walnut[WalnutItemId]
  local RewardLv = WalnutData.RewardLv
  local GoldMaxIndex = RewardLv[1]
  local SilverMaxIndex = GoldMaxIndex + RewardLv[2]
  local BronzeMaxIndex = SilverMaxIndex + RewardLv[3]
  local GoldTotal, SilverTotal, BronzeTotal = 0, 0, 0
  local Total = 0
  for i = 1, BronzeMaxIndex do
    local CurrentParam = WalnutData.Param[i]
    Total = Total + CurrentParam
    if i <= GoldMaxIndex then
      GoldTotal = GoldTotal + CurrentParam
    elseif i <= SilverMaxIndex then
      SilverTotal = SilverTotal + CurrentParam
    else
      BronzeTotal = BronzeTotal + CurrentParam
    end
  end
  return GoldTotal / Total, SilverTotal / Total, BronzeTotal / Total
end

function ItemUtils.GetItemLimitedInfo(ResourceId)
  local Res
  if not DataMgr.LimitedTimeResource[ResourceId] then
    return Res
  end
  local LimitedInfoLst = CommonUtils.DeepCopy(DataMgr.LimitedTimeResource[ResourceId])
  table.sort(LimitedInfoLst, function(a, b)
    return a.EndTime < b.EndTime
  end)
  local CurrentTime = TimeUtils.NowTime()
  for _, LimitedInfo in ipairs(LimitedInfoLst) do
    if CurrentTime < LimitedInfo.EndTime then
      Res = LimitedInfo
      break
    end
  end
  return Res
end

function ItemUtils.GetWalnutNumberIconPath(Number)
  return Const.WalnutNumberIconPath[Number + 1]
end

function ItemUtils.CheckResourceObsolete(ResourceId)
  if not ResourceId then
    return false
  end
  local bObsolete = false
  local ErrorMsg = ""
  local DataMgrResource = DataMgr.Resource[ResourceId]
  if not DataMgrResource then
    ErrorMsg = string.format("lgc@[ItemUtils] \230\163\128\230\181\139\229\136\176\230\151\167\231\137\136\229\164\177\230\149\136\233\129\147\229\133\183\239\188\140ResourceId: %s\239\188\140\232\175\165\233\129\147\229\133\183\229\183\178\228\187\142\233\133\141\232\161\168\228\184\173\231\167\187\233\153\164", tostring(ResourceId))
    bObsolete = true
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and DataMgrResource then
    local Resource = Avatar.Resources[ResourceId] or nil
    if Resource and Resource.ResourceName ~= DataMgrResource.ResourceName then
      ErrorMsg = string.format("lgc@[ItemUtils] \230\163\128\230\181\139\229\136\176\230\151\167\231\137\136\229\164\177\230\149\136\233\129\147\229\133\183\239\188\140ResourceId: %s\239\188\140\232\175\165\233\129\147\229\133\183\232\181\132\230\186\144\229\144\141\229\183\178\232\162\171\230\155\180\230\148\185\239\188\140\232\175\183\230\163\128\230\159\165\233\129\147\229\133\183\230\152\175\229\144\166\228\184\142\233\133\141\232\161\168\233\129\147\229\133\183\231\155\184\229\144\140", tostring(ResourceId))
      bObsolete = true
    end
  end
  if bObsolete then
    GWorld.logger.errorlog(ErrorMsg)
    ScreenPrint(ErrorMsg)
  end
  return bObsolete
end

function ItemUtils.CheckGestureItemResourceNeedDisplay(ResourceId)
  if not ResourceId then
    return false
  end
  local ResourceInfo = DataMgr.Resource[ResourceId]
  if ResourceInfo and ResourceInfo.ResourceSType and ResourceInfo.ResourceSType == "GestureItem" and ResourceInfo.DisplayPath then
    return true
  end
  return false
end

function ItemUtils.CheckGestureSkinNeedDisplay(SkinId)
  if not SkinId then
    return false
  end
  local SkinInfo = DataMgr.Skin[SkinId]
  if SkinInfo and SkinInfo.CommonSkinSettingId == nil then
    return true
  end
  return false
end

return ItemUtils
