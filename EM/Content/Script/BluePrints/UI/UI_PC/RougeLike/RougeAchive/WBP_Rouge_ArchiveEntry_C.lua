local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local WBP_Rouge_ArchiveEntry_C = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_ArchiveEntry_C:InitView(ArchiveType, ArchiveData)
  self.ArchiveType = ArchiveType
  self.ArchiveData = ArchiveData
  self.Owner = self.ArchiveData.ParentWidget
  self.Text_EventItemTitle:SetText(ArchiveData.Name)
  self.Text_Num:SetText(string.format("%d/%d", ArchiveData.UnlockedNum, ArchiveData.TotalNum))
  self.Btn_Click.OnClicked:Add(self, function()
    self.ArchiveData.OnEntryClicked(self.Owner, self.ArchiveType)
  end)
  self.Btn_Click.OnHovered:Add(self, function()
    self.ArchiveData.OnEntryHovered(self.Owner, self.ArchiveType)
  end)
  self:OnReddotChange(self.ArchiveData.HasNew)
end

function WBP_Rouge_ArchiveEntry_C:OnReddotChange(IsShow)
  if IsShow then
    self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Rouge_ArchiveEntry_C
