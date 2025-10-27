require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self:UpdateLanguageBasedUI()
end

function M:SetEnable(IsOn)
  local Visibility = IsOn and ESlateVisibility.HitTestInvisible or ESlateVisibility.Collapsed
  self:SetVisibility(Visibility)
end

function M:UpdateLanguageBasedUI()
  local Language = self:GetCurrentLanguage()
  local IconPath
  if Language == CommonConst.SystemLanguages.CN then
    IconPath = "/Game/UI/Texture/Static/Atlas/Common/T_Com_New_CN"
  else
    IconPath = "/Game/UI/Texture/Static/Atlas/Common/T_Com_New_EN"
  end
  self.Text_New:SetText(GText("UI_NEW"))
  local Icon = LoadObject(IconPath)
  if IsValid(Icon) then
    self.Bg:SetBrushResourceObject(Icon)
  end
end

function M:GetCurrentLanguage()
  return CommonConst.SystemLanguage
end

return M
