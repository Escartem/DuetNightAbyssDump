require("UnLua")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.StuffInfoList = Params.StuffInfoList
  self.RewardList = Params.RewardList
  self:InitBaseInfo(Params.LeftText, Params.RightText, Params.IsShowEmptyText)
  self:InitAllWeaponInfo()
  self:InitAllRewardInfo()
end

function M:InitBaseInfo(LeftText, RightText, bIsShowEmptyText)
  self.Text_ForSale:SetText(LeftText)
  self.Text_Gain:SetText(RightText)
  if bIsShowEmptyText then
    self.Text_SellLimit:SetText(GText("UI_Bag_ModExtract_NotGet"))
    self.WidgetSwitcher_Empty:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Empty:SetActiveWidgetIndex(0)
  end
end

function M:InitAllWeaponInfo()
  local AllStuffCount = #self.StuffInfoList
  if AllStuffCount < 3 then
    self.WB_ForSale:ClearChildren()
    for Index, StuffInfo in ipairs(self.StuffInfoList) do
      local ItemObject = StuffIconObject:CreateBagItemContent(StuffInfo)
      ItemObject.IsShowDetails = true
      local Item = UIManager(self):CreateWidget("/Game/UI/WBP/Bag/Widget/WBP_Bag_Item.WBP_Bag_Item")
      self.WB_ForSale:AddChildToWrapBox(Item)
      Item:Init(ItemObject)
    end
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.List_ForSale:ClearListItems()
    for Index, StuffInfo in ipairs(self.StuffInfoList) do
      local ItemObject = StuffIconObject:CreateBagItemContent(StuffInfo)
      ItemObject.IsShowDetails = true
      self.List_ForSale:AddItem(ItemObject)
    end
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:AddTimer(0.1, function()
      if UIUtils.GetMaxScrollOffsetOfListView(self.List_ForSale) > 0 then
        self:ShowGamepadScrollBtn(true)
      else
        self:ShowGamepadScrollBtn(false)
      end
    end)
  end
end

function M:InitAllRewardInfo()
  self.WB_Gain:ClearChildren()
  for Index, RewardInfo in ipairs(self.RewardList) do
    RewardInfo.StuffCount = RewardInfo.Count
    local ItemObject = StuffIconObject:CreateBagItemContent(RewardInfo)
    ItemObject.IsShowDetails = true
    local Item = self:CreateWidgetNew("ComItemUniversalL")
    self.WB_Gain:AddChildToWrapBox(Item)
    Item:Init(ItemObject)
  end
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.1
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local CurScrollOffset = self.List_ForSale:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, UIUtils.GetMaxScrollOffsetOfListView(self.List_ForSale))
    self.List_ForSale:SetScrollOffset(ScrollOffset)
  end
end

return M
