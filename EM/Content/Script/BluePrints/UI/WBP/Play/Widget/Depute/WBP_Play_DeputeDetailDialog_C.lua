require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  M.Super.Construct(self)
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    self.Scroll_Drop:SetControlScrollbarInside(false)
  else
    self.Scroll_Drop:SetControlScrollbarInside(true)
  end
end

local DropTypeOrder = {
  "FirstReward",
  "DropType_Fixed",
  "DropTag_Prob"
}

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  if not Params.RewardList then
    return
  end
  self.Scroll_Drop:ClearChildren()
  local RewardList = Params.RewardList
  local DropTypeMap = {}
  for _, ItemData in ipairs(RewardList) do
    if not ItemData.DropType then
      ItemData.DropType = DropTypeOrder[1]
    end
    if not DropTypeMap[ItemData.DropType] then
      DropTypeMap[ItemData.DropType] = {}
    end
    local Data = {}
    Data.DropType = ItemData.DropType
    Data.Id = ItemData.Id
    Data.Icon = ItemUtils.GetItemIconPath(ItemData.Id, ItemData.Type)
    Data.ParentWidget = self
    Data.ItemType = ItemData.Type
    Data.Rarity = ItemData.Rarity or 1
    Data.IsShowDetails = true
    Data.UIName = "DeputeDetail"
    Data.Quantity = ItemData.Quantity
    Data.ItemCount = ItemData.ItemCount
    Data.FirstRewardFlag = ItemData.bFirst
    table.insert(DropTypeMap[ItemData.DropType], Data)
  end
  for Index, DropType in ipairs(DropTypeOrder) do
    local Rewards = DropTypeMap[DropType]
    if Rewards then
      local Content = {}
      Content.RewardList = Rewards
      Content.DropType = DropType
      Content.Index = Index
      Content.ParentWidget = self
      Content.Checked = Params.Checked
      local Item = self:CreateWidgetNew("DeputeDetailItem")
      self.Scroll_Drop:AddChild(Item)
      Item:Init(Content)
    end
  end
  self:AddTimer(0.01, function()
    if self.Scroll_Drop:GetChildAt(0) then
      self.Scroll_Drop:GetChildAt(0):SetFocus()
    end
    self:ShowGamepadABtn(true)
  end, false, 0, "__DeputeDetailDialog_List_Drop")
end

function M:ShowGamepadABtn(bIsShow)
  if bIsShow then
    self.GamepadCheckItemKeyInfo = self.GamepadCheckItemKeyInfo or self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  elseif self.GamepadCheckItemKeyInfo then
    self:HideGamepadShortcut(self.GamepadCheckItemKeyInfo)
    self.GamepadCheckItemKeyInfo = nil
  end
end

function M:OnContentFocusReceived(MyGeometry, InFocusEvent)
  if self.Scroll_Drop:GetChildAt(0) then
    self.Scroll_Drop:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.Scroll_Drop:GetChildAt(0) then
    self.Scroll_Drop:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
    local CurScrollOffset = self.Scroll_Drop:GetScrollOffset()
    self.Scroll_Drop:SetScrollOffset(CurScrollOffset + a)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

return M
