require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Overridden.Construct(self)
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.UsingItemList = {}
  self.WaitingList = {}
  self.TickWaitingList = {}
  self.LastUpdateTime = 0
  self.UpdateInterval = 0.2
  self.DropItemMaxNum = 5
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
    self.DropItemMaxNum = 3
  end
end

function M:Destruct()
  self:StopAllAnimations()
  self:CleanTimer()
end

function M:Tick(MyGeometry, InDeltaTime)
  local CurrentTime = os.clock()
  if CurrentTime - self.LastUpdateTime >= self.UpdateInterval and #self.TickWaitingList > 0 then
    local Data = self.TickWaitingList[1]
    self:ShowDropItem(Data.ItemId, Data.ItemCount, Data.TableName)
    self.LastUpdateTime = CurrentTime
    table.remove(self.TickWaitingList, 1)
  end
end

function M:ShowDropItem(ItemId, ItemCount, TableName)
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if not self:OnUpdateTips(ItemId, ItemCount, TableName) then
    if not self.WaitingList[TableName] then
      self.WaitingList[TableName] = {}
    end
    table.insert(self.WaitingList[TableName], {ItemId, ItemCount})
  end
end

function M:OnUpdateTips(ItemId, ItemCount, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  assert(ItemData, "\230\142\137\232\144\189\231\137\169\228\184\141\229\173\152\229\156\168:" .. TableName .. ItemId)
  local ListItems = self.ListView_Box:GetListItems()
  if ListItems:Length() > 0 then
    for _, Content in pairs(ListItems) do
      if Content and Content.SelfWidget and Content.ItemId == ItemId and Content.TableName == TableName then
        if Content.SelfWidget:IsAnimationPlaying(Content.SelfWidget.out) then
          return false
        end
        Content.SelfWidget:AddItemCount(ItemCount)
        return true
      end
    end
  end
  if ListItems:Length() >= self.DropItemMaxNum then
    return false
  end
  for _, Content in pairs(self.ContentList) do
    if not Content.ItemId then
      Content.ItemId = ItemId
      Content.ItemCount = ItemCount
      Content.TableName = TableName
      Content.Parent = self
      self.ListView_Box:AddItem(Content)
      self.ListView_Box:RequestRefresh()
      break
    end
  end
  return true
end

function M:OnTipsItemClose(InItem)
  if not InItem then
    return
  end
  self.ListView_Box:RequestRefresh()
  InItem.ItemId = nil
  self.UsingItemList[InItem] = nil
  self:AddDelayFrameFunc(function()
    for TableName, TipsInfoList in pairs(self.WaitingList) do
      repeat
        if 0 == #TipsInfoList then
          break
        end
        local TipsInfo = TipsInfoList[1]
        table.insert(self.TickWaitingList, {
          ItemId = TipsInfo[1],
          ItemCount = TipsInfo[2],
          TableName = TableName
        })
        table.remove(TipsInfoList, 1)
      until false
    end
    if 0 == CommonUtils.TableLength(self.UsingItemList) and 0 == CommonUtils.TableLength(self.TickWaitingList) then
      self:SetVisibility(ESlateVisibility.Collapsed)
    end
  end, 5, "ShowDropItem")
end

return M
