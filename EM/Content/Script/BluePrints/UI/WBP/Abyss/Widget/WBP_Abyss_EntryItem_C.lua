local WBP_Abyss_EntryItem_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_EntryItem_C:OnListItemObjectSet(Content)
  Content.UI = self
  self.Content = Content
  if Content.IconPath then
    self:SetIcon(Content.IconPath)
  else
    DebugPrint("lhr@WBP_Abyss_EntryItem_C:OnListItemObjectSet, Content IconPath \228\184\186 nil")
  end
end

function WBP_Abyss_EntryItem_C:SetIcon(IconPath)
  if self.Buff then
    self.Buff:SetBrushResourceObject(LoadObject(IconPath))
  end
end

function WBP_Abyss_EntryItem_C:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

return WBP_Abyss_EntryItem_C
