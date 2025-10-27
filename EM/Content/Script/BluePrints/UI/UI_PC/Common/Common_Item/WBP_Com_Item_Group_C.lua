require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
local ComItemPriority = {
  ComItemLock = 1,
  ComItemCardLevel = 2,
  ComItemMoney = 3,
  ComItemStartLevel = 4
}

function M:Construct()
  self.WidgetsMap = {}
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:CreateAndAddWidgetAsyc(WidgetName, CoroutineObj)
  local AddedWidget = self.WidgetsMap[WidgetName]
  if AddedWidget then
    AddedWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    AddedWidget = UIManager(self):CreateWidgetAsync(WidgetName, CoroutineObj)
    local RowIndex = ComItemPriority[WidgetName]
    if AddedWidget and RowIndex and RowIndex >= 0 then
      local GridSlot = self.GP_ItemGroup:AddChildToGrid(AddedWidget, RowIndex, 0)
      GridSlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Right)
      self.WidgetsMap[WidgetName] = AddedWidget
    end
  end
  return AddedWidget
end

function M:RemoveWidget(WidgetName, bFroce)
  local ChildWidget = self.WidgetsMap[WidgetName]
  if not ChildWidget then
    return
  end
  if bFroce then
    self.GP_ItemGroup:RemoveChild(ChildWidget)
    self.WidgetsMap[WidgetName] = nil
  else
    ChildWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ClearWidgets()
  self.GP_ItemGroup:ClearChildren()
  self.WidgetsMap = {}
end

function M:GetWidget(WidgetName)
  if type(WidgetName) == "string" then
    return self.WidgetsMap[WidgetName]
  end
end

function M:GetAllWidgets()
  local AllWidgets = {}
  for _, Widget in pairs(self.WidgetsMap) do
    table.insert(AllWidgets, Widget)
  end
  return AllWidgets
end

function M:GetWidgetCount()
  return self.GP_ItemGroup:GetChildrenCount()
end

return M
