require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("Blueprints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.UIComponent.StarsUIComponent"
}

function M:Construct()
end

function M:Init(Content)
  Content.SelfWidget = self
  self.Content = Content
  self.Owner = Content.Owner
  self.Id = Content.Id
  local SkillId = Content.SkillId
  local SkillData = DataMgr.Skill[SkillId]
  if SkillData and SkillData[1] and SkillData[1][0] then
    local Data = SkillData[1][0]
    self.SkillData = Data
    local IconName = Data.SkillBtnIcon
    local Icon
    if IconName then
      Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName)
    end
    Icon = Icon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_Skill_Heitao_Skill01.T_Skill_Heitao_Skill01")
    self.Icon_Skill:SetBrushResourceObject(Icon)
    self.Text_ItemName:SetText(GText(Data.SkillName))
    if Data.SkillType == "Passive" then
      self.Text_Type:SetText(GText("UI_Armory_Passive"))
    else
      self.Text_Type:SetText(GText(Data.SkillBtnDesc))
    end
    self.Text_Describe:SetText((GText(Data.SkillDesc) or "") .. GText("\n"))
  end
  self:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
    self,
    self.OnNavigateUp
  })
  self:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
    self,
    self.OnNavigateDown
  })
end

function M:OnListItemObjectSet(Content)
  self:Init(Content)
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateHotKeyInfo(CurGamepadName)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == Const.GamepadFaceButtonRight then
    self.Owner:CloseSelf()
  end
end

function M:OnNavigateUp()
  self.Owner:OnNavigateUp(self.Content)
end

function M:OnNavigateDown()
  self.Owner:OnNavigateDown(self.Content)
end

return M
