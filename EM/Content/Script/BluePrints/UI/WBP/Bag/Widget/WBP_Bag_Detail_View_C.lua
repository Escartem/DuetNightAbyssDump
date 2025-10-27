require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local TimeUtils = require("Utils.TimeUtils")
local CommonUtils = require("Utils.CommonUtils")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local WBP_Bag_Detail_View_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Bag_Detail_View_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.SortIndexes = {Melee = 2, Ranged = 3}
  self.StuffType = nil
  self.StuffId = nil
  self.StuffUuid = nil
  self.StuffCount = nil
  self.IsCanLocked = false
  self.OwnerContent = nil
  self.CurSingleBtnRTNodeName = nil
  self.ParentWidget = nil
end

function WBP_Bag_Detail_View_C:Construct()
  self.Super.Construct(self)
  self.Key_Lock:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
  self.Key_Method:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
end

function WBP_Bag_Detail_View_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.OwnerContent, self.CloseCallback, self.ParentWidget = ...
  self:InitCommonInfo()
  self:RefreshInfoById()
end

function WBP_Bag_Detail_View_C:InitCommonInfo()
  self.Btn01:SetText(GText("UI_BAG_Gotoarmory"))
  self.Btn01:SetGamePadImg("Y")
  self.Text_WeaponLevel01:SetText(GText("UI_LEVEL_NAME"))
end

function WBP_Bag_Detail_View_C:RefreshInfoById()
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    print(_G.LogTag, "Avatar is nil, Not Connect to Server")
    return
  end
  self.StuffType = self.OwnerContent.Type or self.OwnerContent.StuffType
  self.StuffId = self.OwnerContent.StuffId
  self.StuffUuid = self.OwnerContent.Uuid
  self.StuffCount = self.OwnerContent.Count
  local PlayerStuffs, StuffServerData
  if self.StuffType == "Weapon" then
    PlayerStuffs = PlayerAvatar.Weapons
  elseif self.StuffType == "Mod" then
    PlayerStuffs = PlayerAvatar.Mods
  elseif self.StuffType == "Resource" then
    PlayerStuffs = PlayerAvatar.Resources
  else
    PlayerStuffs = PlayerAvatar.Resources
  end
  local StuffUnitId = self:GetStuffObjId(self.StuffUuid)
  StuffServerData = PlayerAvatar.Resources[StuffUnitId]
  if nil ~= StuffServerData then
    self:RefreshDetailInfo(StuffServerData, StuffServerData:Data())
  end
end

function WBP_Bag_Detail_View_C:RefreshInfoByData(StuffContent, StuffServerData, StuffConfigData, ParentWidget, Animation)
  self.IsCanLocked = false
  self.StuffType = StuffContent.Type or StuffContent.StuffType
  self.StuffId = StuffContent.StuffId
  self.StuffUuid = StuffContent.Uuid
  self.OwnerContent = StuffContent
  self.ParentWidget = ParentWidget
  self:RefreshDetailInfo(StuffServerData, StuffConfigData, Animation)
end

function WBP_Bag_Detail_View_C:RefreshDetailInfo(StuffServerData, StuffConfigData, Animation)
  local PlayerAvatar = GWorld:GetAvatar()
  if self.ParentWidget ~= nil then
    if self.StuffType == BagCommon.StuffType.Mod and nil ~= StuffServerData and StuffServerData.IsOriginal then
      self.Btn_Locked:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    elseif self.StuffType == BagCommon.StuffType.Resource and StuffConfigData.Type == "Read" then
      self.Btn_Locked:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    elseif nil ~= self.OwnerContent and -1 == self.OwnerContent.Price then
      self.Btn_Locked:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      local IsLocked = false
      if BagCommon:IsFishResource(StuffServerData.ResourceId) then
        IsLocked = BagCommon:IsFishResourceLocked(StuffServerData.ResourceId, StuffServerData.FishInfo.Size)
      else
        IsLocked = StuffServerData.IsLock and StuffServerData:IsLock()
      end
      self.Switcher_Lock:SetActiveWidgetIndex(IsLocked and 0 or 1)
      self.IsCanLocked = true
      if self.ParentWidget.BagCurState == BagCommon.AllBagState.ChooseSaleState or self.ParentWidget.BagCurState == BagCommon.AllBagState.WeaponResolveState then
        self.Btn_Locked:SetVisibility(UE4.ESlateVisibility.Collapsed)
        self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        self.Btn_Locked:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        if self.ParentWidget.GameInputModeSubsystem and self.ParentWidget.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
          self.Key_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        else
          self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
        end
      end
    end
  end
  local FontMaterial = self.Text_ItemName:GetDynamicFontMaterial()
  local StuffRarity = self.OwnerContent.Rarity
  if FontMaterial then
    if 6 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_6)
    elseif 5 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_5)
    elseif 4 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_4)
    elseif 3 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_3)
    elseif 2 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_2)
    elseif 1 == StuffRarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_1)
    else
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_0)
    end
  end
  local ItemObject = {
    UnitId = self.OwnerContent.UnitId,
    ItemType = self.OwnerContent.ItemType,
    Rarity = self.OwnerContent.Rarity,
    Icon = self.OwnerContent.Icon
  }
  self.Item:Init(ItemObject)
  self.Item:HideOrShowTimeLimitWidget(true)
  self.Item:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if self.StuffType == "Mod" and nil ~= self.OwnerContent then
    self:UpdateStarStyle(self.OwnerContent.Level)
    self.Star:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Star:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if type(self["RefreshInfoWith" .. self.StuffType]) == "function" then
    self["RefreshInfoWith" .. self.StuffType](self, PlayerAvatar, StuffServerData, StuffConfigData)
  else
    self:RefreshInfoWithOther(StuffConfigData)
  end
  self:RefreshAccessMethod(StuffConfigData)
  self:RefreshDesignView()
  if type(Animation) == "string" then
    Animation = self[Animation]
  else
    Animation = self.Refresh
  end
  self:PlayAnimationForward(Animation)
end

function WBP_Bag_Detail_View_C:RefreshDesignView()
  if self.Panel_Equipped:IsVisible() and self.Panel_Equipped:IsVisible() then
    self.Switch_Bg:SetActiveWidgetIndex(1)
  else
    self.Switch_Bg:SetActiveWidgetIndex(0)
  end
  if self.Panel_Button:IsVisible() then
    self.Switch_LineBg:SetActiveWidgetIndex(0)
  else
    self.Switch_LineBg:SetActiveWidgetIndex(1)
  end
end

function WBP_Bag_Detail_View_C:RefreshInfoWithWeapon(PlayerAvatar, StuffServerData, StuffConfigData)
  self.Text_Mod:SetText(GText("UI_Bag_MODSapacity"))
  self.Text_WeaponCardLevel:SetText(GText("UI_WeaponStrength_Name"))
  local GradeLevel = StuffServerData.GradeLevel
  self.Text_WeaponCardLevel_Num:SetText(GradeLevel)
  local WeaponCardLevelData = DataMgr.WeaponCardLevel[StuffServerData.WeaponId]
  local MaxGradeLevel = WeaponCardLevelData and WeaponCardLevelData.CardLevelMax or GradeLevel + 1
  if GradeLevel >= MaxGradeLevel then
    self:SetMaxGradeLevelColor()
  else
    self:SetNormalGradeLevelColor()
  end
  self.Polarity_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local Cost = StuffServerData:GetModSuitCost()
  self.Text_Mod01:SetText(tostring(Cost))
  self.Text_Mod02:SetText(tostring(StuffServerData:LevelUpData().ModVolume))
  self.Swtich01:SetActiveWidgetIndex(0)
  self.Swtich01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local StuffLevel = StuffServerData.Level or 1
  self.Text_ItemName:SetText(GText(StuffConfigData.WeaponName))
  self.Text_WeaponLevel02:SetText(tostring(StuffLevel))
  self.Text_WeaponLevel03:SetText(tostring(StuffServerData:GetCurrentMaxLevel()))
  self.Swtich02:SetActiveWidgetIndex(0)
  local WeaponBattleData = StuffServerData:BattleData()
  local WeaponTypeName = self:GetWeaponTypeName(WeaponBattleData.WeaponId)
  self.Text_SubTitle:SetText(WeaponTypeName)
  self.Text_SubTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if StuffConfigData.WeaponDescribe ~= nil then
    self.Text_LongDescribe:SetText(GText(StuffConfigData.WeaponDescribe))
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local WeaponTag = StuffServerData:HasTag("Melee") and "Melee" or "Ranged"
  self:UpdateAttrInfo("Weapon", StuffServerData, WeaponTag, self.SortIndexes[WeaponTag])
  local PassiveSkillDesc = SkillUtils.CalcWeaponPassiveEffectsDesc(StuffServerData)
  if nil ~= PassiveSkillDesc and "" ~= PassiveSkillDesc then
    self.Text_SkillName:SetText(GText("UI_Bag_Passive"))
    self.Text_SkillEffect:SetText(PassiveSkillDesc)
    self.Panel_Skill:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Skill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Panel_Property:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Effect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Img_Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Aura:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local OwnerStuffUuid = self:GetStuffObjId(self.OwnerContent.Uuid)
  if OwnerStuffUuid == PlayerAvatar.MeleeWeapon or OwnerStuffUuid == PlayerAvatar.RangedWeapon then
    self.Text_Equipped:SetText(GText("UI_Bag_Equipped"))
    self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Bag_Detail_View_C:RefreshInfoWithMod(PlayerAvatar, StuffServerData, StuffConfigData)
  self.Text_ItemName:SetText(GText(StuffConfigData.TypeName) .. GText(StuffConfigData.Name))
  local StuffLevel = StuffServerData.Level or 1
  self.Text_Polarity01:SetText(GText(StuffConfigData.FunctionDes))
  self.Text_Polarity02:SetText(tostring(StuffServerData.Cost))
  if StuffServerData.Polarity ~= CommonConst.NonePolarity then
    local PolarityText = ModController:GetModel():GetPolarityText(StuffServerData.Polarity)
    self.Text_Polarity:SetText(PolarityText)
    self.Text_Polarity:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_Polarity:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Text_Level:SetText(tostring(StuffLevel))
  self.Text_MaxLevel:SetText(tostring(StuffServerData.MaxLevel))
  self.Swtich01:SetActiveWidgetIndex(1)
  self.Swtich01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local AppTypeTexts = {}
  for i, TagText in ipairs(DataMgr.ModTag[StuffServerData.ApplicationType].ModTagText) do
    table.insert(AppTypeTexts, GText(TagText))
  end
  if #AppTypeTexts > 0 then
    local AppTypeTexts = {}
    for i, TagText in ipairs(DataMgr.ModTag[StuffServerData.ApplicationType].ModTagText) do
      table.insert(AppTypeTexts, GText(TagText))
    end
    local AppTypeText = GText("UI_Tips_ModApplicationType") .. table.concat(AppTypeTexts, ", ")
    self.Text_Tag:SetText(AppTypeText)
    self.Panel_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local ApplySlot = StuffServerData.ApplySlot
  if ApplySlot and 1 == #ApplySlot and table.findValue(ApplySlot, 9) then
    self.Img_Aura:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Img_Aura:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.EffectDetails:ClearChildren()
  local ModAttrs = StuffConfigData.AddAttrs
  if ModAttrs then
    self:UpdateAttrInfo("Mod", StuffServerData, ModAttrs, StuffConfigData.Id)
    self.Panel_Effect:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if StuffConfigData.PassiveEffectsDesc then
    local PassiveEffectDesc = ArmoryUtils:GenModPassiveEffectDesc(StuffConfigData, StuffServerData.Level)
    local EffectDescribeObj = self:CreateEffectDescribeItem({IsAddAttr = false, ModAttrDescribe = PassiveEffectDesc}, "Effect")
    self.EffectDetails:AddChildToWrapBox(EffectDescribeObj)
  end
  if StuffConfigData.ModDescribe ~= nil then
    self.Text_LongDescribe:SetText(GText(StuffConfigData.ModDescribe))
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  self.Text_Hold02:SetText(Utils.FormatNumber(StuffServerData.Count, true))
  self.Swtich02:SetActiveWidgetIndex(1)
  self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_SubTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Skill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Property:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if StuffServerData.WeaponUuids:Length() > 0 or StuffServerData.CharUuids:Length() > 0 then
    self.Text_Equipped:SetText(GText("UI_Bag_Equipped"))
    self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Polarity_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if StuffServerData:HasCardLevel() then
    self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Visible)
    self.List_ModStar:ClearListItems()
    for i = 1, StuffServerData.ModCardLevelMax do
      local StarContent = NewObject(UIUtils.GetCommonItemContentClass())
      StarContent.Idx = i
      StarContent.bActivate = i <= StuffServerData.CurrentModCardLevel
      StarContent.bGolden = false
      self.List_ModStar:AddItem(StarContent)
    end
  end
end

function WBP_Bag_Detail_View_C:RefreshInfoWithResource(PlayerAvatar, StuffServerData, StuffConfigData)
  self.Text_ItemName:SetText(GText(StuffConfigData.ResourceName))
  if StuffConfigData.MaterialClassify then
    self.Text_SubTitle:SetText(GText(StuffConfigData.FunctionDes))
    self.Text_SubTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  if StuffConfigData.Type == "Ordinary" and StuffConfigData.ResourceSType == "Fish" then
    self.Text_FishWeight:SetText(GText("UI_Bag_Fish_Weight"))
    local StuffUnitIdList = Split(self.StuffUuid, "_")
    local FishWeight = 1
    if StuffUnitIdList[2] then
      FishWeight = math.tointeger(StuffUnitIdList[2]) / CommonConst.FishSizeScale
    end
    self.Num_FishWeight:SetText(string.format("%.1f cm", FishWeight))
    self.Text_Hold02:SetText(Utils.FormatNumber(self.OwnerContent.Count, true))
    self.Panel_Fish:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_Hold02:SetText(Utils.FormatNumber(StuffServerData.Count, true))
    self.Panel_Fish:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Swtich02:SetActiveWidgetIndex(1)
  if StuffConfigData.DetailDes ~= nil then
    self.Text_Describe:SetText(GText(StuffConfigData.DetailDes))
    self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if StuffConfigData.IpDes and StuffConfigData.Type ~= "Read" then
    self.Text_LongDescribe:SetText(GText(StuffConfigData.IpDes))
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if DataMgr.LimitedTimeResource[StuffConfigData.ResourceId] then
    local LimitedData = ItemUtils.GetItemLimitedInfo(StuffConfigData.ResourceId)
    if LimitedData then
      local diff = os.difftime(LimitedData.EndTime, TimeUtils.NowTime())
      if diff < 86400 then
        self.BG_TimeLimit:SetColorAndOpacity(self.Color_Red)
      else
        self.BG_TimeLimit:SetColorAndOpacity(self.Color_Orange)
      end
      self.Panel_TimeLimit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(LimitedData.EndTime, TimeUtils.NowTime())
      self.Time_CountDown:SetTimeText(nil, RemainTimeDict)
      self.Text_Expiration:SetText(GText("UI_Date_End"))
      self.Time_Expiration:SetTimeText(LimitedData.EndTime, UIConst.EnumTimeStyleType.YMDAndHMS)
    else
      self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Swtich01:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Skill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Effect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Property:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Aura:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Polarity_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Bag_Detail_View_C:RefreshInfoWithOther(StuffConfigData)
  self.Text_ItemName:SetText(GText(StuffConfigData.ResourceName))
  self.Text_SubTitle:SetText(GText(DataMgr.BagTab[StuffConfigData.MaterialClassify].TabName))
  self.Text_SubTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  self.Text_Hold02:SetText(Utils.FormatNumber(self.OwnerContent.Count, true))
  self.Swtich02:SetActiveWidgetIndex(1)
  if StuffConfigData.Description ~= nil then
    self.Text_Describe:SetText(GText(StuffConfigData.Description))
    self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Describe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Swtich01:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Skill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_LongDescribe:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Effect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Equipped:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Property:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Aura:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Polarity_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Bag_Detail_View_C:RefreshAccessMethod(StuffConfigData)
  self.AllMethodSubWidgetList = {}
  if not StuffConfigData.AccessKey or self.ParentWidget and self.ParentWidget.BagCurState == BagCommon.AllBagState.ChooseSaleState then
    self.Panel_Method:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Method:ClearChildren()
    for _, Access in pairs(StuffConfigData.AccessKey) do
      PageJumpUtils:GetItemAccess(self, self.StuffId, self.StuffType, Access, BagCommon.MainUIName)
    end
    PageJumpUtils:SortAccessItem(self.Method)
    local AllMethodCount = self.Method:GetChildrenCount()
    for index = 1, AllMethodCount do
      local TestWidget = self.Method:GetChildAt(index - 1)
      if TestWidget and not TestWidget.IsText then
        table.insert(self.AllMethodSubWidgetList, TestWidget)
      end
    end
    local AllCanNavigateAccessCount = #self.AllMethodSubWidgetList
    for index, TargetWidget in ipairs(self.AllMethodSubWidgetList) do
      if TargetWidget then
        TargetWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        TargetWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        if 1 == AllCanNavigateAccessCount then
          TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
          TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        elseif 1 == index then
          TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Down, self.AllMethodSubWidgetList[index + 1])
        elseif index == AllCanNavigateAccessCount then
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Up, self.AllMethodSubWidgetList[index - 1])
          TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        else
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Up, self.AllMethodSubWidgetList[index - 1])
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Down, self.AllMethodSubWidgetList[index + 1])
        end
      end
    end
    if AllMethodCount <= 0 then
      self.Panel_Method:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Text_Method:SetText(GText("UI_Tips_Obtining"))
      self.Panel_Method:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function WBP_Bag_Detail_View_C:UpdateAttrInfo(StuffType, TargetServerData, ...)
  if StuffType == BagCommon.StuffType.Weapon then
    self.ItemAttrs = {}
    self.AttrCount = 0
    self.Index2AttrKey = {}
    local StuffTypeTag, SortIndex = ...
    self.PassiveSkillWeaponId = nil
    local data = DataMgr.BattleWeapon[TargetServerData.WeaponId]
    if data and data.PassiveEffectsDesc then
      self.PassiveSkillWeaponId = TargetServerData.WeaponId
    end
    local SortType = "SortIndex" .. SortIndex
    local Avatar = GWorld:GetAvatar()
    self.ItemAttrs = TargetServerData:DumpDefaultBattleAttr(Avatar).TotalValues
    local DisplayAttrs = {}
    self.ItemAttrs = self.ItemAttrs or {}
    local WeaponAttrData = DataMgr.BattleWeaponAttr
    for id, Data in pairs(WeaponAttrData) do
      local value = self.ItemAttrs[id] or Data.DefaultValue
      if CommonUtils:ShouldDisplayAttr(id, value, StuffType, StuffTypeTag, TargetServerData.WeaponId) then
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
  elseif StuffType == BagCommon.StuffType.Mod then
    local ModAttrs, ModId = ...
    local ModLevel = TargetServerData.Level
    for _, ModAttr in ipairs(ModAttrs) do
      local AttrConfig = DataMgr.AttrConfig[ModAttr.AttrName]
      if not AttrConfig then
      else
        local Value, ValueStr = ArmoryUtils:GenModAttrData(ModAttr, ModLevel, AttrConfig, ModId)
        local ModAttrText = GText(AttrConfig.Name) .. ValueStr
        local EffectDescribeObj = self:CreateEffectDescribeItem({
          IsAddAttr = Value >= 0,
          ModAttrDescribe = ModAttrText
        }, "AddValue")
        self.EffectDetails:AddChildToWrapBox(EffectDescribeObj)
      end
    end
  end
end

function WBP_Bag_Detail_View_C:UpdataWeaponAttrListView()
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

function WBP_Bag_Detail_View_C:UpdateItemNumber()
  if self.OwnerContent then
    self.Text_Hold02:SetText(Utils.FormatNumber(self.OwnerContent.Count, true))
  end
end

function WBP_Bag_Detail_View_C:UpdateBottomSingleBtnInfo(FromStr, Callback, ParentWidget, ReddotTreeNode)
  if "WeaponAndMod" == FromStr then
    self.Btn01:UnBindEventOnClickedByObj(ParentWidget)
    self.Btn01:SetText(GText("UI_BAG_Gotoarmory"))
    self.Btn01:BindEventOnClicked(ParentWidget, Callback)
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif "Read" == FromStr then
    self.Btn01:UnBindEventOnClickedByObj(ParentWidget)
    self.Btn01:SetText(GText("UI_BAG_Read"))
    self.Btn01:BindEventOnClicked(ParentWidget, Callback)
    self.Img_Yes:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Static/Atlas/Common/T_Com_IconYes.T_Com_IconYes"))
    self.Img_Yes:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("E1B453FF"))
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif "Fish" == FromStr then
    self.Btn01:UnBindEventOnClickedByObj(ParentWidget)
    self.Btn01:SetText(GText("UI_Fishing_OpenFishBook"))
    self.Btn01:BindEventOnClicked(ParentWidget, Callback)
    if ReddotTreeNode then
      self:AddSingleBtnReddotListener(ReddotTreeNode)
    end
    self.Img_Yes:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Anglin.T_Entrance_Anglin"))
    self.Img_Yes:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("C6BDACFF"))
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif "ConsumableItem" == FromStr then
    self.Btn01:UnBindEventOnClickedByObj(ParentWidget)
    self.Btn01:SetText(GText("UI_Consumable_Open"))
    self.Btn01.AudioEventPath = "event:/ui/common/click_btn_confirm"
    self.Btn01:BindEventOnClicked(ParentWidget, Callback)
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Bag_Detail_View_C:AddSingleBtnReddotListener(ReddotTreeNode)
  if self.CurListenReddotTreeNodeName == ReddotTreeNode then
    return
  end
  self:RemoveSingleBtnReddotListener()
  self.CurListenReddotTreeNodeName = ReddotTreeNode
  ReddotManager.AddListener(ReddotTreeNode, self, self.OnSingleBtnReddotChange)
end

function WBP_Bag_Detail_View_C:RemoveSingleBtnReddotListener(ReddotTreeNode)
  if self.CurListenReddotTreeNodeName then
    ReddotManager.RemoveListener(ReddotTreeNode, self)
  end
end

function WBP_Bag_Detail_View_C:OnSingleBtnReddotChange(Count)
  if self.CurListenReddotTreeNodeName == "AnglingMap" then
    self.Btn01:SetReddot(Count > 0)
  end
end

function WBP_Bag_Detail_View_C:CreatePropertyDescribeItem(Content)
  if nil == Content then
    return
  end
  local PropertyDescribeObj = UIManager(self):_CreateWidgetNew("WeaponItemDetailItems")
  if nil == PropertyDescribeObj then
    DebugPrint("WBP_Bag_Detail_View_C: CreatePropertyDescribeItem create fail")
    return
  end
  PropertyDescribeObj.Text_Property:SetText(Content.AttrName)
  PropertyDescribeObj.Text_Num:SetText(Content.AttrNum)
  if 1 == Content.GridIndex % 2 then
    PropertyDescribeObj.Bg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    PropertyDescribeObj.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  return PropertyDescribeObj
end

function WBP_Bag_Detail_View_C:CreateEffectDescribeItem(Content, Style)
  if nil == Content then
    return
  end
  local EffectDescribeObj = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
  if nil == EffectDescribeObj then
    DebugPrint("WBP_Bag_Detail_View_C: CreateEffectDescribeItem create fail")
    return
  end
  if "Effect" == Style then
    EffectDescribeObj.Text_Effect01:SetText(GText("UI_MOD_Effect") .. Content.ModAttrDescribe)
    EffectDescribeObj.Text_Effect01.WrapTextAt = EffectDescribeObj.TipsWrappingValue
    EffectDescribeObj.Switch_Type:SetActiveWidgetIndex(1)
  else
    EffectDescribeObj.Text_Effect:SetText(Content.ModAttrDescribe)
    EffectDescribeObj.Text_Effect.WrapTextAt = EffectDescribeObj.TipsWrappingValue
    EffectDescribeObj.Switch_Type:SetActiveWidgetIndex(0)
  end
  return EffectDescribeObj
end

function WBP_Bag_Detail_View_C:UpdateStarStyle(NowStarLevel)
  for i = 1, 6 do
    local StarWidget = self["Switcher_Star_" .. tostring(i)]
    if nil ~= StarWidget then
      if i <= NowStarLevel then
        StarWidget:SetActiveWidgetIndex(0)
      else
        StarWidget:SetActiveWidgetIndex(1)
      end
    end
  end
end

function WBP_Bag_Detail_View_C:GetWeaponType(WeaponId)
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

function WBP_Bag_Detail_View_C:GetStuffObjId(StuffUuid)
  local FinalObjId = StuffUuid
  if type(FinalObjId) == "string" and CommonUtils.IsObjIdStr(FinalObjId) then
    FinalObjId = CommonUtils.Str2ObjId(FinalObjId)
  end
  return FinalObjId
end

function WBP_Bag_Detail_View_C:GetWeaponTypeName(WeaponId)
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

function WBP_Bag_Detail_View_C:UpdateUIStyleInPlatform(IsUseGamePad)
  if IsUseGamePad then
    self.Key_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Method:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Method:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Bag_Detail_View_C:IsHaveAccessKeyCanFocus()
  return self.AllMethodSubWidgetList and #self.AllMethodSubWidgetList > 0
end

function WBP_Bag_Detail_View_C:IsInGamePadViewAccessKey()
  local PlayerController = self:GetOwningPlayer()
  if self.AllMethodSubWidgetList then
    for _, TargetWidget in ipairs(self.AllMethodSubWidgetList) do
      if TargetWidget and (TargetWidget:HasUserFocus(PlayerController) or TargetWidget:HasUserFocusedDescendants(PlayerController)) then
        return true
      end
    end
  end
  return false
end

function WBP_Bag_Detail_View_C:OnViewStuffAccessKey()
  local TargetNavigateWidget
  if self.AllMethodSubWidgetList and #self.AllMethodSubWidgetList > 0 then
    TargetNavigateWidget = self.AllMethodSubWidgetList[1]
  end
  if TargetNavigateWidget then
    TargetNavigateWidget:SetFocus()
  end
end

function WBP_Bag_Detail_View_C:OnBtnDownWithVirsualClick(BtnName)
  if not self.Panel_Button:IsVisible() then
    return
  end
  self:AddTimer(0.1, function()
    local BtnWidget = self[BtnName]
    if BtnWidget then
      BtnWidget:OnBtnClicked()
    end
  end)
end

function WBP_Bag_Detail_View_C:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  return IsEventHandled
end

return WBP_Bag_Detail_View_C
