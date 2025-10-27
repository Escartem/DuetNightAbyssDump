require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClick)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
end

function M:Destruct()
  self.Btn_Click.OnClicked:Remove(self, self.OnBtnClick)
  self.Btn_Click.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Remove(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Remove(self, self.OnBtnReleased)
end

function M:SetSelected(bSelected)
  self.Content.bSelected = bSelected
  if bSelected then
    self:StopAllBtnAnim()
    self:PlayAnimation(self.Click)
    self.Owner:OnListTabSelected(self.Content)
  else
    self:StopAllBtnAnim()
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnClick()
  if self.Content.bSelected then
    return
  end
  self:SetSelected(true)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function M:OnBtnHovered()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.UnHover)
end

function M:OnBtnPressed()
  if self.Content.bSelected then
    return
  end
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Press)
end

function M:StopAllBtnAnim()
  self:ReverseAnimation(self.Click)
  self:ReverseAnimation(self.UnHover)
  self:ReverseAnimation(self.Hover)
  self:ReverseAnimation(self.Press)
end

function M:OnBtnReleased()
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.UnHover then
    self:PlayAnimation(self.Normal)
  end
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Content = Content
  self.Owner = Content.Owner
  self:StopAllBtnAnim()
  self:PlayAnimation(self.Normal)
  local Data = Content.Data
  local Img = Data.Icon and LoadObject(Data.Icon) or nil
  if IsValid(Img) then
    self.Image_FaceTabIcon:SetBrushResourceObject(Img)
  end
  if self.Content.bSelected then
    self:SetSelected(true)
  end
end

return M
