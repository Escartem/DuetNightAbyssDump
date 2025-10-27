require("UnLua")
local WBP_Abyss_MenuBtn_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Abyss_MenuBtn_C:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
end

function WBP_Abyss_MenuBtn_C:OnCellClicked()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_MenuBtn_C:OnCellHovered()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_MenuBtn_C:OnCellUnhovered()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_MenuBtn_C:OnCellPressed()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_MenuBtn_C:OnCellReleased()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

return WBP_Abyss_MenuBtn_C
