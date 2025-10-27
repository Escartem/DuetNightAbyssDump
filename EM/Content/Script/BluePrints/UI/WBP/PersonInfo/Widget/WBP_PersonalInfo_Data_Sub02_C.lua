require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(TabInfo)
  self.Text_DataDetailTitle:SetText(GText(TabInfo.Name))
  local Contents = TabInfo.Contents
  for i = 1, #Contents do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Des = Contents[i].Des or ""
    Obj.Count = Contents[i].Count
    Obj.Index = i
    self.List_Data:AddItem(Obj)
  end
end

return M
