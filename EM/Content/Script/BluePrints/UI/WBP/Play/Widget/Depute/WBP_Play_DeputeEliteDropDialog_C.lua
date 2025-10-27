require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  M.Super.Construct(self)
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    self.List_Drop:SetControlScrollbarInside(false)
  else
    self.List_Drop:SetControlScrollbarInside(true)
  end
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local DungeonId = Params.DungeonId
  local Parent = Params.Parent
  local MonIds = DataMgr.ModDungeon2Monster[DungeonId]
  for _, MonId in pairs(MonIds) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.MonId = MonId
    Content.Parent = Parent
    Content.ParentWidget = self
    self.List_Drop:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    local RewardItemUIs = self.List_Drop:GetDisplayedEntryWidgets()
    if RewardItemUIs then
      local Item = RewardItemUIs[self.List_Drop:GetNumItems()]
      if Item then
        Item:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      end
    end
    local RestCount = self:GetRestCount()
    for i = 1, RestCount do
      self:CreateAndAddEmptyItem()
    end
  end, false, 0, "___DeputeEliteDropDialog_List_Drop1")
  self:AddTimer(0.02, function()
    self.List_Drop:NavigateToIndex(0)
    self:ShowGamepadLSBtn(true)
  end, false, 0, "___DeputeEliteDropDialog_List_Drop2")
end

function M:GetRestCount()
  local ItemUIs = self.List_Drop:GetDisplayedEntryWidgets()
  return UIUtils.GetListViewContentMaxCount(self.List_Drop, ItemUIs, false) - self.List_Drop:GetNumItems()
end

function M:CreateAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.MonId = 0
  self.List_Drop:AddItem(Content)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.5
    local CurScrollOffset = self.List_Drop:GetScrollOffset()
    self.List_Drop:SetScrollOffset(CurScrollOffset + a)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:ShowGamepadLSBtn(bIsShow)
  if bIsShow then
    self.GamepadCheckItemKeyInfo = self.GamepadCheckItemKeyInfo or self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.LeftThumb
        }
      },
      Desc = GText("UI_Controller_CheckReward")
    })
  elseif self.GamepadCheckItemKeyInfo then
    self:HideGamepadShortcut(self.GamepadCheckItemKeyInfo)
    self.GamepadCheckItemKeyInfo = nil
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.List_Drop:SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
