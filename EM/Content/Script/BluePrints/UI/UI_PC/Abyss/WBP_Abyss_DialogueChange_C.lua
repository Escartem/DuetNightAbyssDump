require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.Owner:SetFocus()
  if Params and Params.Text then
    self.Text_Title:SetText(Params.Text)
  end
  if Params and Params.ItemList then
    for _, Data in ipairs(Params.ItemList) do
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Id = Data.Id
      Obj.ItemType = Data.ItemType
      Obj.Rarity = Data.Rarity
      Obj.Icon = Data.Icon
      Obj.IsShowDetails = true
      self.List_Item:AddItem(Obj)
    end
  end
  self:AddTimer(0.01, function()
    if UIUtils.GetMaxScrollOffsetOfListView(self.List_Item) > 0 then
      self:ShowGamepadScrollBtn(true)
    else
      self:ShowGamepadScrollBtn(false)
    end
  end)
  self.GamepadScrollBtnIndex1 = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("B", self.CurGamepadName)
      }
    },
    Desc = GText("UI_BACK")
  })
  self.GamepadScrollBtnIndex2 = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("LS", self.CurGamepadName)
      }
    },
    Desc = GText("FeeRefund_Detail_MonthlyCard")
  })
  self:HideGamepadShortcut(self.GamepadScrollBtnIndex1)
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftThumbstick then
    self.List_Item:SetFocus()
    self:HideGamepadShortcut(self.GamepadScrollBtnIndex2)
    self:ShowGamepadShortcut(self.GamepadScrollBtnIndex1)
    return true
  elseif InKeyName == Const.GamepadFaceButtonRight and self.List_Item:HasFocusedDescendants() then
    self.Owner:SetFocus()
    self:HideGamepadShortcut(self.GamepadScrollBtnIndex1)
    self:ShowGamepadShortcut(self.GamepadScrollBtnIndex2)
    return true
  end
  return false
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.List_Item:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, UIUtils.GetMaxScrollOffsetOfListView(self.List_Item))
    self.List_Item:SetScrollOffset(ScrollOffset)
  end
end

return M
