require("UnLua")
local WBP_ImpressionItem_Mobile = Class("BluePrints.Story.Talk.UI.Common.WBP_ImpressionItem_Common")

function WBP_ImpressionItem_Mobile:AdaptPlatform()
end

function WBP_ImpressionItem_Mobile:OnSelectedByPlatform(bIsSelect)
  self:PlayAnimationByEnabled(self.Normal, self.Forbidden_Normal)
end

function WBP_ImpressionItem_Mobile:ClearByPlatform()
end

function WBP_ImpressionItem_Mobile:OnReleasedByPlatform()
  self:PlayAnimationByEnabled(self.Normal, self.Forbidden_Normal)
end

function WBP_ImpressionItem_Mobile:SetOnHovered(Delegate)
end

function WBP_ImpressionItem_Mobile:SetOnUnhovered(Delegate)
end

function WBP_ImpressionItem_Mobile:OnHoveredByPlatform()
end

function WBP_ImpressionItem_Mobile:OnUnhoveredByPlatform()
end

return WBP_ImpressionItem_Mobile
