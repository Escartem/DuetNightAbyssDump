require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(TableName, ItemId, ItemCount)
  self.Text_Name:SetText(ItemUtils:GetDropName(ItemId, TableName))
  self.Text_Num:SetText("x" .. tostring(ItemCount))
  local Object = NewObject(UIUtils.GetCommonItemContentClass())
  Object.ParentWidget = self
  Object.ItemType = TableName
  Object.Id = ItemId
  Object.Count = nil
  Object.Icon = ItemUtils.GetItemIconPath(ItemId, TableName)
  Object.Rarity = DataMgr[TableName][ItemId].Rarity or DataMgr[TableName][ItemId][TableName .. "Rarity"] or 0
  Object.IsShowDetails = true
  Object.OnFocusReceivedEvent = {
    Obj = self,
    Callback = function()
      self.Parent.ScrollBox_Package:ScrollWidgetIntoView(self)
    end
  }
  Object.UIName = "ShopMain"
  self.Package_Item:Init(Object)
end

return M
