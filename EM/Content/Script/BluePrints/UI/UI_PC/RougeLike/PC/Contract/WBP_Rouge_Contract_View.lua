local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local WBP_Rouge_Contract_View = Class("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_ViewBase")

function WBP_Rouge_Contract_View:Construct()
  self.Super.Construct(self)
end

function WBP_Rouge_Contract_View:InitView()
  self.Super.InitView(self)
  local ContractItemObjs = self.ContractModel:GetContractItemList()
  self.List_Heat:ClearListItems()
  for _, ItemObj in ipairs(ContractItemObjs) do
    ItemObj.Owner = self
    ItemObj.OnDecreaseLevel = self.OnContractLevelChanged
    ItemObj.OnIncreaseLevel = self.OnContractLevelChanged
    ItemObj.OnNavigateUp = self.OnContractItemNavigateUp
    ItemObj.OnNavigateDown = self.OnContractItemNavigateDown
    ItemObj.OnNavigated = self.OnContractItemNavigated
    self.List_Heat:AddItem(ItemObj)
  end
  self.List_Heat:RequestPlayEntriesAnim()
  self.Text_BonusTitle:SetText(GText("UI_Rougelike_Contract_ScoreBonus"))
  self.Text_HeatTitle:SetText(GText("UI_Rougelike_Contract_TotalHeat"))
  self.Text_Confirm:SetText(GText("UI_Rougelike_Contract_Confirm"))
  self.Btn_Confirm.OnClicked:Add(self, self.OnBtnConfirmClicked)
  self.Btn_Confirm.OnHovered:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
  end)
  self.Btn_Reset.OnClicked:Add(self, self.OnBtnResetClicked)
  self.Btn_Reset.OnHovered:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
  end)
  self.Btn_Qa.Btn_Click.OnClicked:Add(self, self.OnBtnQaClicked)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/depth_panel_open", "ContractView", nil)
end

function WBP_Rouge_Contract_View:OnBtnConfirmClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  self.ContractModel:ConfirmSelectedContract()
  self.RougeMainUI:RefreshHeatValue()
  self:Close()
end

function WBP_Rouge_Contract_View:UpdateContractHeat()
  self.Super.UpdateContractHeat(self)
  local TotalHeatValue = self.ContractModel:GetCurrentHeatValue()
  self.Text_Heat:SetText(TotalHeatValue)
end

function WBP_Rouge_Contract_View:InitKeyboardView()
  self.Super.InitKeyboardView(self)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Controller_illustrate:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Controller_Reset:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Controller_Confirm:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Btn_Confirm:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Btn_Reset:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Btn_Qa:SetVisibility(UE4.ESlateVisibility.Visible)
end

function WBP_Rouge_Contract_View:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnBtnCloseClicked()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadSpecialLeft then
      self:OnBtnQaClicked()
    elseif InKeyName == Const.GamepadFaceButtonUp then
      self:OnBtnResetClicked()
    elseif InKeyName == Const.GamepadFaceButtonDown then
      self:OnBtnConfirmClicked()
    elseif InKeyName == Const.GamepadFaceButtonRight then
      self:OnClose()
    elseif InKeyName == Const.GamepadSpecialRight then
      UIManager(self):ShowCommonPopupUI(100142, {}, self)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Rouge_Contract_View:OnBtnResetClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_small_click", nil, nil)
  self.ContractModel:ResetContractLevel()
  self:UpdateView()
end

function WBP_Rouge_Contract_View:OnBtnQaClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  UIManager(self):ShowCommonPopupUI(100142, {}, self)
end

function WBP_Rouge_Contract_View:OnClose()
  AudioManager(self):SetEventSoundParam(self, "ContractView", {ToEnd = 1})
  self.Super.OnClose(self)
end

return WBP_Rouge_Contract_View
