require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local CommonUtils = require("Utils.CommonUtils")
local WeaponUtils = require("BluePrints.Client.CustomTypes.Weapon")
local ModModel = ModController:GetModel()
local M = Class()

function M:InitItemInfo(ItemType, ItemId, UnitId)
  local WeaponData = DataMgr.Weapon[ItemId]
  local BattleWeaponData = DataMgr.BattleWeapon[ItemId]
  local Avatar = GWorld:GetAvatar()
  local WeaponServerData
  local Level = 1
  local EnhanceLevel, MaxEnhanceLevel = 0, 0
  if UnitId and type(UnitId) == "string" and not CommonUtils.IsObjId(UnitId) then
    UnitId = CommonUtils.Str2ObjId(UnitId)
  end
  WeaponServerData = Avatar.Weapons[UnitId]
  self.Text_Mod:SetText(GText("UI_Bag_MODSapacity"))
  local GradeLevel = 0
  if WeaponServerData then
    Level = WeaponServerData.Level
    EnhanceLevel = WeaponServerData.EnhanceLevel
    GradeLevel = WeaponServerData.GradeLevel
    local Cost = WeaponServerData:GetModSuitCost()
    self.Text_Mod01:SetText(Cost)
    self.Text_Mod02:SetText(WeaponServerData:LevelUpData().ModVolume)
  else
    self.Text_Mod01:SetText("0")
    self.Text_Mod02:SetText(DataMgr.WeaponLevelUp[1].ModVolume)
  end
  self.ParentWidget.Text_WeaponLevel02:SetText(Level)
  self.ParentWidget.Text_WeaponLevel03:SetText(WeaponData.WeaponMaxLevel)
  assert(DataMgr.WeaponBreak[ItemId], "\232\175\183\230\163\128\230\159\165\230\173\166\229\153\168\231\170\129\231\160\180\232\161\168, WeaponId:", ItemId)
  for _, v in pairs(DataMgr.WeaponBreak[ItemId]) do
    if MaxEnhanceLevel < v.WeaponBreakNum then
      MaxEnhanceLevel = v.WeaponBreakNum
    end
  end
  self:SetWeaponEnhanceLevel(EnhanceLevel, MaxEnhanceLevel)
  self.ParentWidget.Panel_CardLevel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.ParentWidget.Text_CardLevel:SetText(GradeLevel)
  if DataMgr.WeaponCardLevel[ItemId] and GradeLevel == DataMgr.WeaponCardLevel[ItemId].CardLevelMax then
    self.ParentWidget.Bg_CardLevel:SetColorAndOpacity(self.ParentWidget.BgMaxLevelColor)
    self.ParentWidget.Text_CardLevel:SetColorAndOpacity(self.ParentWidget.TextMaxLevelColor)
  else
    self.ParentWidget.Bg_CardLevel:SetColorAndOpacity(self.ParentWidget.BgNormalColor)
    self.ParentWidget.Text_CardLevel:SetColorAndOpacity(self.ParentWidget.TextNormalColor)
  end
  local WeaponTypeName = self:GetWeaponTypeName(ItemId)
  self.Text_SubTitle:SetText(WeaponTypeName)
  self:UpdateAttrInfo(ItemId)
  local PassiveSkillDesc = SkillUtils.CalcWeaponPassiveEffectsDesc(WeaponServerData or BattleWeaponData)
  if nil ~= PassiveSkillDesc and "" ~= PassiveSkillDesc then
    self.Text_SkillEffect:SetVisibility(ESlateVisibility.Visible)
    self.Text_SkillEffect:SetText(PassiveSkillDesc)
  else
    self.Text_SkillEffect:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetWeaponEnhanceLevel(EnhanceLevel, MaxEnhanceLevel)
  for i = 1, 6 do
    local str = "Switch_Star0" .. i
    local StarWidget = self.ParentWidget[str]
    if StarWidget then
      if i <= EnhanceLevel then
        StarWidget:SetActiveWidgetIndex(0)
      elseif i <= MaxEnhanceLevel then
        StarWidget:SetActiveWidgetIndex(1)
      else
        StarWidget:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end

function M:GetWeaponType(WeaponId)
  local BattleWeaponData = DataMgr.BattleWeapon[WeaponId]
  for _, v in pairs(BattleWeaponData.WeaponTag) do
    local WeaponTagData = DataMgr.WeaponTag[v]
    if WeaponTagData and WeaponTagData.WeaponTagfilter then
      if WeaponTagData.WeaponTagfilter == "RangedType" then
        return false
      else
        return true
      end
    end
  end
  return false
end

function M:GetWeaponTypeName(WeaponId)
  local WeaponType, WeaponName
  local BattleWeaponData = DataMgr.BattleWeapon[WeaponId]
  for _, v in pairs(BattleWeaponData.WeaponTag) do
    local WeaponTagData = DataMgr.WeaponTag[v]
    if WeaponTagData and WeaponTagData.WeaponTagfilter then
      if WeaponTagData.WeaponTagfilter == "RangedType" then
        WeaponType = GText("UI_BAG_Longrange")
      elseif WeaponTagData.WeaponTagfilter == "MeleeType" then
        WeaponType = GText("UI_BAG_Meleeweapon")
      end
      if WeaponTagData.WeaponTagTextmap then
        WeaponName = GText(WeaponTagData.WeaponTagTextmap)
      end
    end
  end
  if not WeaponType then
    ScreenPrint("WeaponId" .. WeaponId .. "\231\154\132WeaponType\228\184\186\231\169\186\239\188\140\232\175\183\230\163\128\230\159\165WeaponTag\228\184\173\230\152\175\229\144\166\233\133\141\231\189\174\229\175\185\229\186\148\231\154\132WeaponTagfilter")
    return ""
  end
  if not WeaponName then
    ScreenPrint("WeaponId" .. WeaponId .. "\231\154\132WeaponName\228\184\186\231\169\186\239\188\140\232\175\183\230\163\128\230\159\165WeaponTag\228\184\173\230\152\175\229\144\166\233\133\141\231\189\174\229\175\185\229\186\148\231\154\132WeaponTagTextmap")
    return WeaponType
  end
  return WeaponType .. "\239\188\154" .. WeaponName
end

function M:UpdateAttrInfo(WeaponId)
  local SortIndexes = {Melee = 2, Ranged = 3}
  local StuffTypeTag = "Ranged"
  local StuffType = "Weapon"
  if self:GetWeaponType(WeaponId) then
    StuffTypeTag = "Melee"
  end
  local SortIndex = SortIndexes[StuffTypeTag]
  self.ItemAttrs = {}
  self.AttrCount = 0
  self.Index2AttrKey = {}
  local SortType = "SortIndex" .. SortIndex
  self.ItemAttrs = self:GetWeaponAttrInfo(WeaponId)
  local DisplayAttrs = {}
  self.ItemAttrs = self.ItemAttrs or {}
  local WeaponAttrData = DataMgr.BattleWeaponAttr
  for id, Data in pairs(WeaponAttrData) do
    local value = self.ItemAttrs[id] or Data.DefaultValue
    if CommonUtils:ShouldDisplayAttr(id, value, StuffType, StuffTypeTag, WeaponId) then
      self.AttrCount = self.AttrCount + 1
      self.Index2AttrKey[self.AttrCount] = id
      DisplayAttrs[id] = value
    end
  end
  self.ItemAttrs = DisplayAttrs
  table.sort(self.Index2AttrKey, function(x, y)
    return DataMgr.AttrConfig[x][SortType] < DataMgr.AttrConfig[y][SortType]
  end)
  self:UpdataWeaponAttrListView()
end

function M:UpdataWeaponAttrListView()
  self.VerticalBox_Property:ClearChildren()
  local PropertyDescribeData = {}
  for i, Key in ipairs(self.Index2AttrKey) do
    PropertyDescribeData.GridIndex = i
    local Data = DataMgr.AttrConfig[Key]
    local attr = self.ItemAttrs[Key] or 0
    PropertyDescribeData.AttrName = GText(Data.Name)
    PropertyDescribeData.AttrNum = CommonUtils.AttrValueToString(Data, attr)
    PropertyDescribeData.ParentWidget = self
    local PropertyDescribeObj = self:CreatePropertyDescribeItem(PropertyDescribeData)
    self.VerticalBox_Property:AddChildToVerticalBox(PropertyDescribeObj)
  end
end

function M:GetDefaultAttrValue(AttrName)
  if not self.BattleWeaponAttr then
    self.BattleWeaponAttr = DataMgr.BattleWeaponAttr
  end
  local AttrData = self.BattleWeaponAttr[AttrName]
  if not AttrData then
    return 0
  end
  return AttrData.DefaultValue or 0
end

function M:GetAttrLevelGrow(AttrName)
  local BattleInfo = DataMgr.BattleWeapon
  local LevelGrow = BattleInfo[AttrName .. "LevelGrow"]
  if not LevelGrow then
    return
  end
  local LevelUpInfo = self:LevelUpData()
  local GrowFactor = LevelUpInfo[LevelGrow]
  return GrowFactor
end

function M:FillCardValues(CardValues, CardLevelValues, AttrName, CardValue, LevelGrowAttrName)
  CardValue = CardValue or self:GetDefaultAttrValue(AttrName)
  if not CardValue then
    return
  end
  CardValues[AttrName] = CardValue
  CardLevelValues[AttrName] = self:GetAttrLevelGrow(LevelGrowAttrName)
end

function M:GetWeaponAttrInfo(WeaponId)
  local WeaponAttr = {}
  local WeaponAttrLevelValues = {}
  local BattleInfo = DataMgr.BattleWeapon[WeaponId]
  for _, AttrName in pairs(WeaponUtils.Weapon.Attrs) do
    self:FillCardValues(WeaponAttr, WeaponAttrLevelValues, AttrName, BattleInfo[AttrName], AttrName)
  end
  for _AttrName, _ in pairs(DataMgr.Attribute) do
    local AttrName = "ATK_" .. _AttrName
    self:FillCardValues(WeaponAttr, WeaponAttrLevelValues, AttrName, BattleInfo[AttrName], "ATK")
  end
  if BattleInfo.Attribute then
    self:FillCardValues(WeaponAttr, WeaponAttrLevelValues, "ATK_" .. BattleInfo.Attribute, BattleInfo.ATK, "ATK")
  end
  return WeaponAttr
end

function M:CreatePropertyDescribeItem(Content)
  if nil == Content then
    return
  end
  local PropertyDescribeObj = UIManager(self):_CreateWidgetNew("WeaponItemDetailItems")
  PropertyDescribeObj.Text_Property:SetText(Content.AttrName)
  PropertyDescribeObj.Text_Num:SetText(Content.AttrNum)
  if 1 == Content.GridIndex % 2 then
    PropertyDescribeObj.Bg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    PropertyDescribeObj.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  return PropertyDescribeObj
end

return M
