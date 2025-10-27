require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  self.Owner = Owner
  self.FirstTab = 1
  self.SecondTab = 2
  self.CurrentTab = self.FirstTab
  self.Tab01:InitBtn(Params.FirstTabText, true, self, self.OnTabFirstClicked)
  self.Tab02:InitBtn(Params.SecondTabText, false, self, self.OnTabSecondClicked)
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Q" == InKeyName and self.CurrentTab ~= self.FirstTab then
    self:OnTabFirstClicked()
  elseif "E" == InKeyName and self.CurrentTab ~= self.SecondTab then
    self:OnTabSecondClicked()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTabFirstClicked()
  if self.CurrentTab == self.FirstTab then
  else
    self.CurrentTab = self.FirstTab
    self.Tab01:SetIsSelected(true)
    self.Tab02:SetIsSelected(false)
    self:BroadcastDialogEvent("OnCommonDialogTabChange", self.CurrentTab)
  end
end

function M:OnTabSecondClicked()
  if self.CurrentTab == self.FirstTab then
    self.CurrentTab = self.SecondTab
    self.Tab01:SetIsSelected(false)
    self.Tab02:SetIsSelected(true)
    self:BroadcastDialogEvent("OnCommonDialogTabChange", self.CurrentTab)
  else
  end
end

return M
