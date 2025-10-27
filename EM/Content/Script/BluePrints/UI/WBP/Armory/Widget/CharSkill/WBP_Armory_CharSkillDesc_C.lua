require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  local Decorator = self:GetRichTextDecorator()
  if Decorator then
    Decorator.BP_OnClicked:Clear()
    Decorator.BP_OnClicked:Add(self, self.OnRichTextHyperLinkClicked)
  end
end

function M:Init(Params)
  self.Owner = Params.Owner
  self.OnHyperLinkClicked = Params.OnHyperLinkClicked
  if not Params.Title or Params.Title == "" then
    self.HB_Title:SetVisibility(UIConst.VisibilityOp.Hidden)
    self.Text_Detail:SetJustification(ETextJustify.Center)
  else
    self.HB_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Detail:SetJustification(ETextJustify.Left)
  end
  self.Text_SkillName:SetText(Params.Title)
  self.Text_Detail:SetText(Params.Desc)
end

function M:OnRichTextHyperLinkClicked(Url)
  if self.OnHyperLinkClicked then
    self.OnHyperLinkClicked(self.Owner, Url)
  end
end

return M
