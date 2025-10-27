require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.WBP.Activity.Widget.JumpToOtherPage.ActivityJumpPageBase"
})
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityJumpPageView"
}

function M:Initialize(Initializer)
  self.OwnerPlayer = nil
  self.CurActivityId = nil
  self.ParentTabId = nil
end

function M:UpdatePage(OperateSrc)
  local IsReBindClickFunction = false
  if IsReBindClickFunction then
    self:BindAllClickFunction(self.ViewInfoBtnClick, self.GoToShopClick, self.GoToTargetPageClick)
  end
  self:ResetVariable()
  self:RefreshPageDynamicView()
end

function M:OnUpdateSubUIViewStyle()
end

function M:OnStuffDetailOpenChanged(bIsOpen, Stuff)
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad()
  return true
end

function M:Destruct()
  if self.CurActivityId then
    ActivityReddotHelper.RemoveReddotListenByEventId(self.CurActivityId, self)
  end
end

AssembleComponents(M)
return M
