require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Obj)
  self.DialogueType = Obj.DialogueType
  self.SpeakerName = Obj.SpeakerName
  self.DialogueContent = Obj.DialogueContent
  self:SetShowContent()
end

function M:SetShowContent()
  self.Group_VB:SetActiveWidgetIndex(self.DialogueType)
  if 0 == self.DialogueType then
    self.Text_LeftPlayerName:SetText(self.SpeakerName)
    self.Text_LeftDialog:SetText(self.DialogueContent)
  elseif 1 == self.DialogueType then
    self.Text_RightPlayerName:SetText(self.SpeakerName)
    self.Text_RightDialog:SetText(self.DialogueContent)
  elseif 2 == self.DialogueType then
    self.Text_ChoiceName:SetText(self.SpeakerName)
    self.Text_ChoiceDialog:SetText(self.DialogueContent)
  elseif 3 == self.DialogueType then
    self.Text_Aside:SetText(self.DialogueContent)
  end
end

return M
