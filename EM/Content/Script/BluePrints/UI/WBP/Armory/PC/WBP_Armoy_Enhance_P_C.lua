require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_GoEnhance.Button_Area.OnClicked:Add(self, self.OnClickGoEnhance)
end

function M:Destruct()
  self.Btn_GoEnhance.Button_Area.OnClicked:Remove(self, self.OnClickGoEnhance)
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.TargetWeapon = Params.Target
  self.TargetWeaponData = self.TargetWeapon.Props
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.Char = Params.Char
  self.IsPreviewMode = Params.IsPreviewMode
  if not self.IsPreviewMode then
    local Avatar = GWorld:GetAvatar()
    if Avatar.Weapons[self.TargetWeapon.Uuid] == nil then
      self.IsPreviewMode = true
    end
  end
  self.AllWeapons = {}
  self.ConsumedContentsMap = {}
  self.ConsumedContentsArray = {}
  self:UpdateAllWeaponData()
  self:InitUIInfo()
end

function M:UpdateAllWeaponData()
  local Avatar = GWorld:GetAvatar()
  self.CurrentPlayerWeapon = Avatar.Weapons[Avatar[self.Tag .. self.Type]]
  for Uuid, Weapon in pairs(Avatar.Weapons) do
    if Weapon.WeaponId == self.TargetWeapon.WeaponId and Uuid ~= self.TargetWeapon.Uuid then
      self.AllWeapons[Uuid] = Weapon
    end
  end
end

function M:InitUIInfo()
  self.Text_EnhanceLevel:SetText(GText("UI_WeaponStrength_Level"))
  self.Num_EnhanceLevel:SetText(self.TargetWeaponData.GradeLevel)
  self.Text_Max:SetText(GText("Max_Level_Achieved"))
  self.Btn_GoEnhance.Text_Button:SetText(GText("UI_Armory_Strengthen"))
  local SkillDesc = SkillUtils.CalcWeaponPassiveEffectsDesc(self.TargetWeapon, self.TargetWeaponData.GradeLevel)
  self.Text_Detail:SetText(SkillDesc)
  self.CardLevelData = DataMgr.WeaponCardLevel[self.TargetWeaponData.WeaponId]
  self.CardLevelMax = nil
  if not self.CardLevelData then
    print(_G.ErrorTag, "WeaponCardLevel\232\161\168\230\178\161\230\156\137\232\175\165\230\173\166\229\153\168")
    self.CardLevelMax = 5
  else
    self.CardLevelMax = self.CardLevelData.CardLevelMax
  end
  self:EnhanceItem(self.TargetWeaponData.GradeLevel)
  if self.TargetWeaponData.GradeLevel < self.CardLevelMax then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:SetMaxLevelBg(false)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:SetMaxLevelBg(true)
  end
  if self.IsPreviewMode then
    self.Btn_GoEnhance:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_GoEnhance:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:EnhanceItem(Level)
  local WeaponRarityMap = {
    [1] = "Gray",
    [2] = "Green",
    [3] = "Blue",
    [4] = "Purple",
    [5] = "Yellow"
  }
  local VX_Group = {
    "VX_Glow7",
    "VX_Eye6",
    "VX_ReCircle8",
    "VX_Enhance9"
  }
  local WeaponRarity = DataMgr.Weapon[self.TargetWeaponData.WeaponId].WeaponRarity
  for i = 1, self.CardLevelMax do
    local enhanceItem = self["EnhanceItem_" .. i]
    local Material = enhanceItem.Icon_Enhance:GetDynamicMaterial()
    if enhanceItem and enhanceItem.Icon_Lock then
      if i <= Level then
        enhanceItem:PlayAnimation(enhanceItem.Unlock)
        local Color = WeaponRarityMap[WeaponRarity]
        if Material then
          Material:SetVectorParameterValue("BaseColor", enhanceItem[Color])
        end
        enhanceItem.VX:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        for _, VX_Item in pairs(VX_Group) do
          enhanceItem[VX_Item]:SetColorAndOpacity(enhanceItem[Color .. "_VX"])
        end
      else
        enhanceItem:PlayAnimation(enhanceItem.Lock)
        enhanceItem.VX:SetVisibility(UIConst.VisibilityOp.Collapsed)
        if Material then
          Material:SetVectorParameterValue("BaseColor", enhanceItem[WeaponRarityMap[1]])
        end
      end
    end
  end
end

function M:OnClickGoEnhance()
  DebugPrint("OnClickGoEnhance")
  local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
  local Params = {BehaviourType = "Enhance"}
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Weapon, self.TargetWeapon, self, Params)
end

function M:BindEvents(EventReceiver, Events)
  self.EventReceiver = EventReceiver
  Events = Events or {}
  self.Event_OnConsumedItemChanged = Events.OnConsumedItemChanged
  self.Event_OnWeaponGradeLevelUp = Events.OnWeaponGradeLevelUp
end

function M:PlayInAnim()
  self:StopAnimation(self.Auto_Out)
  self:PlayAnimation(self.Auto_In)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:PlayOutAnim()
  self:StopAnimation(self.Auto_In)
  self:PlayAnimation(self.Auto_Out)
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self:OnClickGoEnhance()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled(), false
end

function M:OnParentFaceButtonBottomKeyDown()
  self:OnClickGoEnhance()
  return UE4.UWidgetBlueprintLibrary.Handled(), true
end

return M
