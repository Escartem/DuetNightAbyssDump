require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local StuffIconObject = {}

function StuffIconObject:CreateBagItemContent(Content)
  if nil == Content then
    return
  end
  local StuffObj = NewObject(UIUtils.GetCommonItemContentClass())
  StuffObj.Uuid = Content.Uuid
  StuffObj.Type = Content.StuffType
  StuffObj.GridIndex = Content.GridIndex
  StuffObj.StuffId = Content.StuffId
  StuffObj.UnitId = Content.StuffId
  StuffObj.ItemType = Content.StuffType
  StuffObj.StuffType = Content.StuffType
  StuffObj.Count = Content.StuffCount
  StuffObj.Icon = Content.StuffIcon
  StuffObj.StuffName = Content.StuffName
  StuffObj.ClickCallback = Content.ClickCallback
  StuffObj.NeedRedPoint = Content.NeedRedPoint
  StuffObj.IsSelect = Content.IsSelect
  StuffObj.LockType = Content.LockType
  StuffObj.Level = Content.Level
  StuffObj.Rarity = Content.Rarity
  StuffObj.Price = Content.Price
  StuffObj.CoinId = Content.CoinId
  StuffObj.bInGear = Content.IsEquipped
  StuffObj.StateTagInfo = Content.StateTagInfo
  StuffObj.AttrIcon = Content.AttrIcon
  StuffObj.IsPhantom = Content.IsPhantom
  StuffObj.AssisterId = Content.AssisterId
  StuffObj.LevelCardNum = Content.GradeLevel
  StuffObj.AnimNameWithCreate = Content.AnimNameWithCreate
  local StuffObjType = StuffObj.Type
  if "Weapon" == StuffObjType then
    StuffObjType = "BattleWeapon"
    StuffObj.SiftTag = DataMgr[StuffObjType][StuffObj.StuffId].WeaponTag
  elseif "Mod" == StuffObjType then
    StuffObj.FilterTag = DataMgr[StuffObjType][StuffObj.StuffId].FilterTag
  end
  if Content.ParentWidget then
    StuffObj.ParentWidget = Content.ParentWidget
  end
  if Content.FishInfo then
    StuffObj.FishInfo = Content.FishInfo
  end
  return StuffObj
end

function StuffIconObject:GetWeaponStuffData(StuffServerData, ParentWidget, ClickCallback)
  local StuffConfig = {}
  local WeaponConfigData = StuffServerData:Data()
  local WeaponBattleData = StuffServerData:BattleData()
  if nil == WeaponConfigData or nil == WeaponBattleData then
    return nil
  end
  StuffConfig.Uuid = StuffServerData.Uuid
  StuffConfig.StuffId = WeaponConfigData.WeaponId
  StuffConfig.StuffType = CommonConst.DataType.Weapon
  StuffConfig.StuffCount = 1
  StuffConfig.StuffName = GText(WeaponConfigData.WeaponName)
  StuffConfig.ClickCallback = ClickCallback or "ClickStuffIcon"
  StuffConfig.NeedRedPoint = false
  StuffConfig.LockType = StuffServerData:IsLock() and 1 or 0
  StuffConfig.Level = StuffServerData.Level
  StuffConfig.Rarity = WeaponConfigData.WeaponRarity or 1
  StuffConfig.Price = WeaponConfigData.WeaponValue or 1
  StuffConfig.SortPriority = WeaponConfigData.SortPriority or 1
  StuffConfig.CoinId = WeaponConfigData.DecomposeReward
  StuffConfig.AssisterId = StuffServerData.AssisterId
  if StuffServerData.GradeLevel > 0 then
    StuffConfig.GradeLevel = StuffServerData.GradeLevel
  end
  StuffConfig.ParentWidget = ParentWidget
  StuffConfig.StuffIcon = WeaponConfigData.Icon
  StuffConfig.SiftTag = StuffServerData.WeaponTags
  if nil == StuffConfig.StuffIcon then
    DebugPrint("Error The Weapon Texture is missing, Weapon is ", StuffConfig.StuffId)
    StuffConfig.StuffIcon = "/Game/UI/UI_PNG/03Image/Weapon/Head_Baonu_WP.Head_Baonu_WP"
  end
  return StuffConfig
end

function StuffIconObject:IsAura(ModConfigData)
  if not ModConfigData.ApplySlot then
    return false
  end
  if type(ModConfigData.ApplySlot) == "table" then
    for _, slot in ipairs(ModConfigData.ApplySlot) do
      if 9 == slot then
        return true
      end
    end
  else
    return 9 == ModConfigData.ApplySlot
  end
  return false
end

function StuffIconObject:GetModStuffData(StuffServerData, ParentWidget, ClickCallback)
  local StuffConfig = {}
  local ModConfigData = StuffServerData:Data()
  if nil == ModConfigData then
    return nil
  end
  StuffConfig.Uuid = StuffServerData.Uuid
  StuffConfig.StuffId = StuffServerData.ModId
  StuffConfig.StuffType = CommonConst.DataType.Mod
  StuffConfig.StuffCount = StuffServerData.Count
  StuffConfig.StuffName = GText(ModConfigData.Name)
  StuffConfig.ClickCallback = ClickCallback or "ClickStuffIcon"
  StuffConfig.NeedRedPoint = false
  StuffConfig.bAura = self:IsAura(ModConfigData)
  if StuffServerData.IsLock and StuffServerData:IsLock() then
    StuffConfig.LockType = 1
  else
    StuffConfig.LockType = 0
  end
  StuffConfig.Level = StuffServerData.Level
  StuffConfig.Rarity = StuffServerData.Rarity or 1
  StuffConfig.ApplicationType = StuffServerData.ApplicationType or 1
  if nil ~= ModConfigData.BreakDown then
    for k, v in pairs(ModConfigData.BreakDown) do
      StuffConfig.CoinId = k
      StuffConfig.Price = v
    end
    local ModLevelConfig = StuffServerData:LevelData()
    for i = 1, StuffServerData.Level do
      local ModLevelInfo = ModLevelConfig[i]
      local ConsumeRarityInfo = ModLevelInfo.ConsumeRarity[StuffServerData.Rarity]
      for CoinTypeId, Value in pairs(ConsumeRarityInfo) do
        if StuffConfig.CoinId == CoinTypeId then
          StuffConfig.Price = StuffConfig.Price + Value * DataMgr.GlobalConstant.ModSaleCutoff.ConstantValue
        end
      end
    end
  else
    StuffConfig.CoinId = 101
    StuffConfig.Price = -1
  end
  local IconResourcePath = StuffServerData.Icon or ModConfigData.Icon
  StuffConfig.StuffIcon = IconResourcePath
  StuffConfig.ParentWidget = ParentWidget
  StuffConfig.FilterTag = DataMgr[StuffConfig.StuffType][StuffConfig.StuffId].FilterTag
  StuffConfig.TypeName = DataMgr[StuffConfig.StuffType][StuffConfig.StuffId].TypeName
  return StuffConfig
end

function StuffIconObject:GetItemStuffData(StuffServerData, ParentWidget, ClickCallback)
  local StuffConfig = {}
  local ItemConfigData = StuffServerData:Data()
  if nil == ItemConfigData then
    return nil
  end
  if not StuffServerData.FishInfo then
    StuffConfig.Uuid = tostring(ItemConfigData.ResourceId)
    StuffConfig.Price = ItemConfigData.ResourceValue or 1
    StuffConfig.StuffCount = StuffServerData.Count
    StuffConfig.LockType = StuffServerData:IsLock() and 1 or 0
  else
    local FishInfo = StuffServerData.FishInfo
    StuffConfig.Uuid = tostring(ItemConfigData.ResourceId) .. "_" .. tostring(FishInfo.Size)
    StuffConfig.Price = AvatarUtils:CalculateFishPrice(ItemConfigData.ResourceId, FishInfo.Size)
    StuffConfig.StuffCount = FishInfo.Count
    StuffConfig.LockType = BagCommon:IsFishResourceLocked(ItemConfigData.ResourceId, FishInfo.Size) and 1 or 0
    StuffConfig.FishInfo = FishInfo
  end
  StuffConfig.StuffId = ItemConfigData.ResourceId
  StuffConfig.StuffType = CommonConst.DataType.Resource
  StuffConfig.StuffName = GText(ItemConfigData.ResourceName)
  StuffConfig.ClickCallback = ClickCallback or "ClickStuffIcon"
  StuffConfig.NeedRedPoint = false
  StuffConfig.Rarity = ItemConfigData.Rarity or 1
  StuffConfig.UseEffectType = ItemConfigData.UseEffectType
  StuffConfig.CoinId = ItemConfigData.ResourceToCoinType
  StuffConfig.StuffIcon = ItemConfigData.Icon
  StuffConfig.IsPhantom = ItemConfigData.ResourceSType == "PhantomItem"
  StuffConfig.ParentWidget = ParentWidget
  return StuffConfig
end

return StuffIconObject
