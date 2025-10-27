require("UnLua")
require("DataMgr")
local WBP_PickUpTips_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_PickUpTips_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.WaitingItemList = {}
end

function WBP_PickUpTips_C:Tick(MyGeometry, DeltaTime)
  if 0 == #self.WaitingItemList then
    return
  end
  local TipsItem = self:GetValidTips()
  if TipsItem then
    TipsItem:UpdateTips(self.WaitingItemList[1][1], self.WaitingItemList[1][2], self.WaitingItemList[1][3], self.WaitingItemList[1][4])
    table.remove(self.WaitingItemList, 1)
  end
end

function WBP_PickUpTips_C:OnUpdateTips(ItemId, ItemCount, TableName)
  self:DoShowPickUpTips(ItemId, ItemCount, TableName)
end

function WBP_PickUpTips_C:DoShowPickUpTips(ItemId, ItemCount, TableName)
  local TipsItem = self:GetValidTips()
  if TipsItem then
    TipsItem:UpdateTips(ItemId, ItemCount, nil, TableName)
  else
    table.insert(self.WaitingItemList, {
      ItemId,
      ItemCount,
      nil,
      TableName
    })
  end
end

function WBP_PickUpTips_C:OnlyShowTips(TextString)
  self.TextBlock_IsFull:SetText(TextString)
  self.TextBlock_IsFull:SetVisibility(UE4.ESlateVisibility.Visible)
end

function WBP_PickUpTips_C:DeepCopy(object)
  local lookup_table = {}
  
  local function _copy(object)
    if type(object) ~= "table" then
      return object
    elseif lookup_table[object] then
      return lookup_table[object]
    end
    local new_table = {}
    lookup_table[object] = new_table
    for key, value in pairs(object) do
      new_table[_copy(key)] = _copy(value)
    end
    return setmetatable(new_table, getmetatable(object))
  end
  
  return _copy(object)
end

function WBP_PickUpTips_C:OnShowPickUpItems(Player)
  self.OwnerPlayer = Player
  local AllItems = self.OwnerPlayer:GetManualPickups()
end

function WBP_PickUpTips_C:GetValidTips()
  for i = 0, self.VerticalBox_PickUpTips:GetChildrenCount() - 1 do
    local TipsItem = self.VerticalBox_PickUpTips:GetChildAt(i)
    if TipsItem.IsTipsCanUse and TipsItem:IsTipsCanUse() then
      return TipsItem
    end
  end
  return nil
end

function WBP_PickUpTips_C:OnTipsItemClose(TipsItem)
  local bCloseSelf = true
  for i = 0, self.VerticalBox_PickUpTips:GetChildrenCount() - 1 do
    local TipsItem = self.VerticalBox_PickUpTips:GetChildAt(i)
    if TipsItem.IsTipsCanUse and not TipsItem:IsTipsCanUse() then
      bCloseSelf = false
      break
    end
  end
  if bCloseSelf then
    self:Close()
  end
end

return WBP_PickUpTips_C
