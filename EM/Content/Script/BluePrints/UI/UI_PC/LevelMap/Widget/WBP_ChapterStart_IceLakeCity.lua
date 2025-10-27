require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Text_Title:SetText(GText("ChapterIntro_Icelake"))
  self:SetFontSize()
  self.Text_World:SetText(GText("ChapterIntroWd_Icelake"))
  self:PlayAnimation(self.In)
end

function M:SetFontSize()
  local Language = CommonConst.SystemLanguage
  if Language == CommonConst.SystemLanguages.CN or Language == CommonConst.SystemLanguages.TC then
    self.Text_Title.Font.Size = self.TextSize_ZH_CHS
  elseif Language == CommonConst.SystemLanguages.EN then
    self.Text_Title:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Title.Font.Size = self.TextSize_EN
  elseif Language == CommonConst.SystemLanguages.JP then
    self.Text_Title.Font.Size = self.TextSize_JA
  elseif Language == CommonConst.SystemLanguages.KR then
    self.Text_Title.Font.Size = self.TextSize_KR
  end
end

return M
