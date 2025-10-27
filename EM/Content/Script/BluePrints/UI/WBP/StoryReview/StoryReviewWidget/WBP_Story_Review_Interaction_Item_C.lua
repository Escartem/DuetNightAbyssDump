require("UnLua")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  local HighDialogueId = Content.HighDialogueId
  local DialogueContent = TalkUtils:DialogueIdToContent(Content.DialogueId)
  if HighDialogueId == Content.DialogueId then
    self.Switcher:SetActiveWidgetIndex(0)
    self.Text_Interactive:SetText(DialogueContent)
  else
    self.Switcher:SetActiveWidgetIndex(1)
    self.Text_Interactive02:SetText(DialogueContent)
    self.Img_Item_2:SetVisibility(Content.IsSelected and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
end

return M
