require("UnLua")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  local HighDialogueId = Content.HighDialogueId
  local ImpressionConfig = DataMgr.ImpressionConfig[Content.ImpressionConfigId]
  local DialogueContent = TalkUtils:DialogueIdToContent(Content.DialogueId)
  self.Text_Normal:SetText(DialogueContent)
  self.Text_NormalVerifieNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local IconTexture = LoadObject(ImpressionConfig.StatusCommonIcon)
  self.Img_Icon:SetBrushFromTexture(IconTexture)
  if HighDialogueId == Content.DialogueId then
    self:PlayAnimation(self.Normal)
    self.Text_NormalVerifieTitle:SetText(GText("Impression_UI_Check_" .. Content.ImpressionConfigId))
    self.Text_NormalVerifieNum:SetText("+" .. Content.PlayerValue)
  else
    self:PlayAnimation(self.Forbidden)
    self.Text_NormalVerifieTitle:SetText(GText("Impression_UI_Check_" .. Content.ImpressionConfigId))
    self.Text_NormalVerifieNum:SetText("+" .. Content.PlayerValue)
  end
end

return M
