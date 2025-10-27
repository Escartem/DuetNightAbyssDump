require("UnLua")
local G = Class("BluePrints.UI.BP_UIState_C")

function G:Construct()
  self.Text_Converted:SetText(GText("UI_GACHA_TRANSFORMED"))
end

function G:Init(Parent, TargetType, TargetId, IsNew, IsOdd)
  self.Parent = Parent
  local Rarity, TargetName, IconPath
  self.IsNew = IsNew
  self.TargetId = TargetId
  self.TargetType = TargetType
  self.IsNeedChange = false
  self.IsConvert = false
  if TargetType == CommonConst.GachaCharType then
    Rarity = DataMgr.Char[TargetId].CharRarity
    TargetName = DataMgr.Char[TargetId].CharName
    if self.Parent.ThisTimeGetChar[TargetId] then
      self.Parent.ThisTimeGetChar[TargetId] = self.Parent.ThisTimeGetChar[TargetId] + 1
    else
      self.Parent.ThisTimeGetChar[TargetId] = 1
    end
    self.IsNeedChange = self:CheckCharGradeCanMax(TargetId)
    self.Parent:AddResourceReturn("Char", Rarity, self.IsNeedChange, IsNew)
    IconPath = DataMgr.Char[TargetId].GachaIcon or "/Game/UI/UI_PNG/03Image/Avatar_Tentimes/Tentimes_Heitao.Tentimes_Heitao"
    self:SetImageType(true, TargetId)
  elseif TargetType == CommonConst.GachaWeaponType then
    Rarity = DataMgr.Weapon[TargetId].WeaponRarity
    self.Parent:AddResourceReturn("Weapon", Rarity, false, IsNew)
    TargetName = DataMgr.Weapon[TargetId].WeaponName
    IconPath = DataMgr.Weapon[TargetId].GachaIcon or "/Game/UI/UI_PNG/03Image/Weapon_Tentimes/Head_Broadsword_Huipo.Head_Broadsword_Huipo"
    self:SetImageType(false, TargetId)
  end
  local Icon = LoadObject(IconPath)
  local ImageMaterial = self.Image_Icon:GetDynamicMaterial()
  ImageMaterial:SetTextureParameterValue("IconMap", Icon)
  self:SetTargetRarity(Rarity)
  if IsNew then
    self.Gacha_SignNew:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Gacha_SignNew:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if IsOdd then
    self:PlayAnimation(self.In)
  else
    self:PlayAnimation(self.In2)
  end
end

function G:SetImageType(IsChar, TargetId)
  self.Group_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if IsChar then
    self.Group_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Image_TypeWeapon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Image_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local TargetProperty = DataMgr.BattleChar[TargetId].Attribute
    local IconName = "Armory_" .. TargetProperty
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    self.Image_Type:SetBrushResourceObject(AttributeIcon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Default.T_Armory_Default"))
  else
    self.Image_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Image_TypeWeapon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local WeaponInfo = DataMgr.BattleWeapon[TargetId]
    if not WeaponInfo then
      return
    end
    for _, Tag in pairs(WeaponInfo.WeaponTag) do
      local TagInfo = DataMgr.WeaponTag[Tag]
      if TagInfo and TagInfo.WeaponTagfilter then
        local AttributeIcon = LoadObject(TagInfo.Icon)
        if AttributeIcon then
          local RoleMaterial = self.Image_TypeWeapon:GetDynamicMaterial()
          RoleMaterial:SetTextureParameterValue("IconTex", AttributeIcon)
          self.Group_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        break
      end
    end
  end
end

function G:SetTargetRarity(Rarity)
  for i = 1, CommonConst.GachaRarityMax do
    if self["Gacha_Star_" .. i] then
      self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  for i = 1, Rarity do
    if self["Gacha_Star_" .. i] then
      self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  local Quality
  self.Group_Converted:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.HB_Star:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.IsNeedChange then
    local GachaRebateInfo = DataMgr.GachaRebate.Char[Rarity]
    if GachaRebateInfo and GachaRebateInfo.RebateResIdUp and GachaRebateInfo.RebateNumUp then
      local ResourceId = GachaRebateInfo.RebateResIdUp
      local Count = GachaRebateInfo.RebateNumUp
      local Obj = {}
      Obj.Id = ResourceId
      Obj.ItemType = "Resource"
      local TargetInfo = DataMgr.Resource[ResourceId]
      Obj.Icon = TargetInfo.Icon
      Obj.Rarity = TargetInfo.Rarity
      Obj.IsShowDetails = true
      Obj.UIName = "GachaMain"
      Obj.Count = Count
      self.Item:Init(Obj)
      self.Group_Converted:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Group_Converted:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Parent.CanFocusChangeItem = true
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Parent.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
      self.IsConvert = true
      self.HB_Star:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Group_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif not self.IsNew and self.TargetType == CommonConst.GachaCharType then
    local CharInfo = DataMgr.Char[self.TargetId]
    if CharInfo and CharInfo.RegainCharItemId then
      local ResourceId = CharInfo.RegainCharItemId
      local Count = CharInfo.RegainCharItemNum
      local Obj = {}
      Obj.Id = ResourceId
      Obj.ItemType = "Resource"
      local TargetInfo = DataMgr.Resource[ResourceId]
      Obj.Icon = TargetInfo.Icon
      Obj.Rarity = TargetInfo.Rarity
      Obj.IsShowDetails = true
      Obj.UIName = "GachaMain"
      Obj.Count = Count
      self.Item:Init(Obj)
      self.Group_Converted:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Parent.CanFocusChangeItem = true
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Parent.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
      self.IsConvert = true
      self.HB_Star:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Group_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if 3 == Rarity then
    Quality = self.Img_Quality_Blue
    self:PlayAnimation(self.Blue)
  elseif 4 == Rarity then
    Quality = self.Img_Quality_Purple
    self:PlayAnimation(self.Purple)
  elseif 5 == Rarity then
    Quality = self.Img_Quality_Yellow
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_ten_times_show_gold", nil, nil)
    self:PlayAnimation(self.Yellow)
  end
  self.Img_Quality:SetBrushResourceObject(Quality)
end

function G:CheckCharGradeCanMax(CharId)
  if not CharId then
    return false
  end
  local OldGradeCount = self.Parent.Parent.OwnedCharGrade[CharId] or 0
  local MaxNum = DataMgr.GlobalConstant.CharMaxCardLevelNeedNum.ConstantValue or 7
  local AlreadyGetCount = self.Parent.ThisTimeGetChar[CharId]
  if MaxNum < OldGradeCount + AlreadyGetCount then
    return true
  end
  return false
end

function G:BP_GetDesiredFocusTarget()
  return self.Item
end

return G
