require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Content)
  self.RealItem:Init(Content)
end

function M:OnListItemObjectSet(Content)
  self.CanvasPanel_81:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.OwningList = UE4.UUserListEntryLibrary.GetOwningListView(self)
  if self.OwningList then
    self.OwningList.BP_OnItemClicked:Remove(self, self.OnOwningListItemClicked)
    self.OwningList.BP_OnItemClicked:Add(self, self.OnOwningListItemClicked)
  end
  self.RealItem:OnListItemObjectSet(Content)
end

function M:OnOwningListItemClicked(Content)
  self.RealItem:OnOwningListItemClicked(Content)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  AudioManager(self):PlayItemSound(self, self.RealItem.Id, "Click", self.RealItem.ItemType)
  return UWidgetBlueprintLibrary.Unhandled()
end

return M
