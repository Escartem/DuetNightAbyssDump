require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("BluePrints.UI.WBP.Armory.Armory_Main_Base_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_ReddotTree_Component",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_CharMainCompnent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PetMainCompnent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_WeaponMainCompnent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_BattleWheelMainComponent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_ExpandListComponent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:Construct()
  self.IsPC = false
  self.MainTabStyleName = "Armory"
  self.BoxWidget = self.Btn_Selective
  M.Super.Construct(self)
end

function M:InitSubUI(...)
  M.Super.InitSubUI(self, ...)
  self:InitPointerSetting()
end

function M:InitPointerSetting()
  local ConstCurSubTab = self:GetConstTab(self.CurMainTab.Name, self.CurSubTab.Name)
  if self.bFromArchive and (self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Melee or self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Ranged or self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Weapon) then
    self.EnableMouseWheel = false
  else
    self.EnableMouseWheel = ConstCurSubTab.EnableMouseWheel
  end
  self.EnableDrag = ConstCurSubTab.EnableDrag
  if not self.EnableDrag then
    self:ResetActorRotation()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  local IsRepeat = UKismetInputLibrary.InputEvent_IsRepeat(InputEvent)
  if IsRepeat then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:OnReturnKeyDown()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnReturnKeyDown()
  self:OnBackBtnClicked()
end

AssembleComponents(M)
return M
