require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self:InitUI()
end

function M:Update(Content)
  self.Content = Content
  self.Content.Widget = self
  self:InitUI()
end

function M:InitUI()
  self.Text_ScoreInfo:SetText(self.Content.Text)
  if self.Content.IsFinish then
    if self.VX_Finish then
      self.VX_Finish:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    if self.WS_Type then
      self.WS_Type:SetActiveWidgetIndex(1)
    end
    if self.Text_ScoreInfo then
      self.Text_ScoreInfo:SetRenderOpacity(1)
    end
  else
    if self.VX_Finish then
      self.VX_Finish:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.WS_Type then
      self.WS_Type:SetActiveWidgetIndex(0)
    end
    if self.Text_ScoreInfo then
      self.Text_ScoreInfo:SetRenderOpacity(0.6)
    end
  end
  local FontInfo = self.Text_ScoreInfo.Font
  if self.Content.IsMobile then
    FontInfo.Size = self.FontSize_M
  else
    FontInfo.Size = self.FontSize_P
  end
  if 0 == FontInfo.Size then
    FontInfo.Size = 16
  end
  self.Text_ScoreInfo:SetFont(FontInfo)
end

return M
