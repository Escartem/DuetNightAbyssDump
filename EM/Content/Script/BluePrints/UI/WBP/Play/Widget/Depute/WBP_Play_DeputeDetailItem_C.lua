require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Init(Obj)
  local RewardList = Obj.RewardList
  if not RewardList then
    return
  end
  self.List_Item:DisableScroll(true)
  self.List_Item:ClearListItems()
  self.DropType = Obj.DropType
  local Index = Obj.Index
  self.ParentWidget = Obj.ParentWidget
  local DropTypeText
  if self.DropType == "FirstReward" then
    DropTypeText = "UI_Dungeon_First_Reward"
  else
    DropTypeText = DataMgr.DropProbType[self.DropType].DropTypeText
  end
  self.Text_Title:SetText(GText(DropTypeText))
  for _, ItemData in pairs(RewardList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ItemData.Id
    Content.Icon = ItemData.Icon
    Content.ParentWidget = self
    Content.ItemType = ItemData.ItemType
    Content.Rarity = ItemData.Rarity or 1
    Content.IsShowDetails = true
    Content.UIName = "StyleOfPlay"
    Content.Count = ItemData.ItemCount
    Content.OnAddedToFocusPathEvent = {
      Obj = self,
      Callback = function()
        self.ParentWidget.Scroll_Drop:ScrollWidgetIntoView(Content.SelfWidget, true, EDescendantScrollDestination.IntoView)
      end
    }
    local BaseCount = ItemData.ItemCount or nil
    if ItemData.FirstRewardFlag then
      Content.BonusType = 2
    end
    if ItemData.Quantity then
      if #ItemData.Quantity > 1 then
        Content.MaxCount = ItemData.Quantity[2]
      end
      BaseCount = ItemData.Quantity[1] or nil
    end
    if BaseCount then
      if Obj.Checked and not ItemData.FirstRewardFlag then
        Content.Count = BaseCount * 2
      else
        Content.Count = BaseCount
      end
    end
    self.List_Item:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    if 1 == Index then
      self.List_Item:NavigateToIndex(0)
    end
    local len = self.List_Item:GetNumItems()
    for i = 1, len do
      local entryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, i - 1)
      if entryWidget then
        entryWidget:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      end
    end
  end, false, 0, "_DeputeDetailItem_List_Item")
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self.ParentWidget:ShowGamepadABtn(false)
    self.ParentWidget:ShowGamepadCloseBtn(false)
  else
    self.ParentWidget:ShowGamepadABtn(true)
    self.ParentWidget:ShowGamepadCloseBtn(true)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.List_Item:NavigateToIndex(0)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:ShowGamepadABtn(bIsShow)
  self.ParentWidget:HideAllGamepadShortcut()
  if bIsShow then
    self.GamepadCheckItemKeyInfo = self.GamepadCheckItemKeyInfo or self.ParentWidget:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  elseif self.GamepadCheckItemKeyInfo then
    self.ParentWidget:HideGamepadShortcut(self.GamepadCheckItemKeyInfo)
    self.GamepadCheckItemKeyInfo = nil
  end
end

return M
