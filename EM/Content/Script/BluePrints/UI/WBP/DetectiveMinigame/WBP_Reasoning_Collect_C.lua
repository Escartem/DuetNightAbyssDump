require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")

function M:OnLoaded(...)
  self.QuestionId = (...)
  self.Super:OnLoaded(...)
  self.Reasoning_Entrance.Text:SetText(GText("Minigame_Textmap_100304"))
  local DetectiveQuestionData = DataMgr.DetectiveQuestion[self.QuestionId]
  self.Text_Title:SetText(GText(DetectiveQuestionData.Tips))
  local currentClueCount, totalClueCount = ReasoningUtils:GetQuestionClueCount(self.QuestionId)
  self.Text_Progress:SetText(GText("Minigame_Textmap_100305") .. string.format("%d/%d", currentClueCount, totalClueCount))
  self.Reasoning_Entrance.Btn_Click.OnClicked:Add(self, self.OnReasoningEntranceClicked)
  self.Reasoning_Entrance:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnReasoningEntranceClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  UIManager(GWorld.GameInstance):LoadUINew("DetectiveMinigame", nil, self.QuestionId, true)
end

return M
