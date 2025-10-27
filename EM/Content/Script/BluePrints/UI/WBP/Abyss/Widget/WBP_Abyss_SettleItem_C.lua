require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  DebugPrint("thy       abyssItem   Construct")
  self.VX_Star:SetVisibility(ESlateVisibility.Visible)
  self.Root:SetRenderOpacity(0)
end

function M:OnListItemObjectSet(Content)
  DebugPrint("thy       abyssItem   OnListItemObjectSet")
  self.Text_Tier:SetText(string.format(GText("Abyss_NextDungeonShow"), GText("UI_Chardata_Data_Num_" .. Content.RoomIndex)))
  if Content.CountDown > 0 then
    self.Switcher_Star:SetActiveWidgetIndex(0)
  else
    self.VX_Star:SetVisibility(ESlateVisibility.Collapsed)
    self.Switcher_Star:SetActiveWidgetIndex(1)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
  if 5 == Content.ItemIndex then
    self.Img_Deco:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
