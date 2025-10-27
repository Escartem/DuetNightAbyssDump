require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(ConfigData)
  self.ParentWidget = ConfigData.ParentWidget
  self.ConfigData = ConfigData
  self.Slider_Zoom:SetValue(ConfigData.DefaultValue or 0.5)
  self.Slider_Zoom.OnValueChanged:Add(self, self.OnSliderValueChanged)
  self.Btn_ZoomUp.OnClicked:Add(self, self.AddSliderValue)
  self.Btn_ZoomUp.OnPressed:Add(self, self.OnUpBtnPress)
  self.Btn_ZoomUp.OnHovered:Add(self, self.OnUpBtnHover)
  self.Btn_ZoomUp.OnUnHovered:Add(self, self.OnUpBtnUnhover)
  self.Btn_ZoomDown.OnClicked:Add(self, self.SubSliderValue)
  self.Btn_ZoomDown.OnPressed:Add(self, self.OnDownBtnPress)
  self.Btn_ZoomDown.OnHovered:Add(self, self.OnDownBtnHover)
  self.Btn_ZoomDown.OnUnHovered:Add(self, self.OnDownBtnUnhover)
end

function M:OnSliderValueChanged(Percent)
  self.Slider_Zoom:SetValue(Percent)
  if self.ConfigData.OnPlayerChangeSlider then
    self.ConfigData.OnPlayerChangeSlider(self.ParentWidget, Percent)
  end
  AudioManager(self):PlayUISound(nil, "event:/ui/common/map_process_bar_drag", nil, nil)
end

function M:AddSliderValue()
  local OldPercent = self.Slider_Zoom:GetValue()
  self:OnSliderValueChanged(math.min(OldPercent + 0.1, 1))
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  self:PlayAnimation(self.Normal_Up)
  self:PlayAnimation(self.Click_Up)
end

function M:SubSliderValue()
  local OldPercent = self.Slider_Zoom:GetValue()
  self:OnSliderValueChanged(math.max(OldPercent - 0.1, 0))
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  self:PlayAnimation(self.Normal_Down)
  self:PlayAnimation(self.Click_Down)
end

function M:OnUpBtnHover()
  self:PlayAnimation(self.Normal_Up)
  self:PlayAnimation(self.Hover_Up)
end

function M:OnDownBtnHover()
  self:PlayAnimation(self.Normal_Down)
  self:PlayAnimation(self.Hover_Down)
end

function M:OnUpBtnUnhover()
  self:PlayAnimation(self.Normal_Up)
  self:PlayAnimation(self.UnHover_Up)
end

function M:OnDownBtnUnhover()
  self:PlayAnimation(self.Normal_Down)
  self:PlayAnimation(self.UnHover_Down)
end

function M:OnUpBtnPress()
  self:PlayAnimation(self.Normal_Up)
  self:PlayAnimation(self.Press_Up)
end

function M:OnDownBtnPress()
  self:PlayAnimation(self.Normal_Down)
  self:PlayAnimation(self.Press_Down)
end

return M
