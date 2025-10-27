require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_Appearance_Base_C")

function M:Construct()
  M.Super.Construct(self)
  self.IsPC = true
end

function M:Init(Params)
  M.Super.Init(self, Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
end

function M:OnTabLeftKeyDown()
end

function M:OnTabRightKeyDown()
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadRightThumbstick and self.Panel_Mode:IsVisible() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Mode_Plan), true
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if 0 == self.WidgetSwitcher_State:GetActiveWidgetIndex() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentFocusedWidget or self.Skin_Char)
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentFocusedWidget or self.Skin_Weapon)
  end
end

function M:OnAccessoryItemContentCreated(Content)
  function Content.OnAddedToFocusPath(_self, Content)
    self.CurrentFocusedWidget = Content.Entry
  end
end

function M:OnSkinItemContentCreated(Content)
  function Content.OnAddedToFocusPath(_self, Content)
    self.CurrentFocusedWidget = Content.Widget
  end
end

return M
