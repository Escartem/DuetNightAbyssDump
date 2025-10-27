require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Perk.MonthCard.View.MonthCardPopupView"
}

function M:Construct()
  M.Super.Construct(self)
  self:AddInputMethodChangedListen()
  self.Btn_FullClose.OnClicked:Add(self, self.NextAction)
end

function M:OnLoaded(Reward, ...)
  M.Super.OnLoaded(self)
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self:PlayInAnim()
  self:SetDailyReward(Reward)
end

function M:Close()
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  M.Super.Close(self)
end

function M:InitListenEvent()
end

function M:RefreshBaseInfo()
  self:InitBaseView()
end

function M:OnReturnKeyDown()
  if not self:CheckIsCanCloseSelf() then
    return
  end
  self:PlayOutAnim()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if not self:HasAnyUserFocus() and not self:HasFocusedDescendants() then
      IsEventHandled = self:OnGamePadDown(InKeyName)
    end
  elseif "Escape" == InKeyName then
    self:NextAction()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:NextAction()
  if self.bAfterLoaded then
    self:OnReturnKeyDown()
  end
end

function M:OnGamePadDown(InKeyName)
  if InKeyName == Const.GamepadFaceButtonDown then
    self:NextAction()
    return true
  end
  return false
end

function M:Handle_KeyDownOnGamePad()
  return true
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  self:SwitchInputType(CurInputDevice, CurGamepadName)
end

AssembleComponents(M)
return M
