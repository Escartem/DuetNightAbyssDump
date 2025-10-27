require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.IsActive = false
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.OwnerWidget = ConfigData.OwnerWidget
  self.Com_BtnQa:Init(ConfigData)
  self.Tex_Explanation:SetText(GText(ConfigData.Desc))
  self:BindButtonPerformances()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.WidgetSwitcher_0:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
  end
end

function M:BindButtonPerformances()
  self.Btn_Area.OnClicked:Add(self, self.OnBtnClick)
  self.Btn_Area.OnPressed:Add(self, self.OnPressed)
  self.Btn_Area.OnHovered:Add(self, self.OnHovered)
  self.Btn_Area.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:UnBindButtonPerformances()
  self.Btn_Area.OnClicked:Clear()
  self.Btn_Area.OnPressed:Clear()
  self.Btn_Area.OnHovered:Clear()
  self.Btn_Area.OnUnhovered:Clear()
end

function M:OnBtnClick()
  self:PlayAnimation(self.Click)
  self.Com_BtnQa:OnViewInfoClick()
end

function M:OnPressed()
  self:PlayAnimation(self.Press)
end

function M:OnHovered()
  if self.bBtnClickHovered then
    return
  end
  self.bBtnClickHovered = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if not self.bBtnClickHovered then
    return
  end
  self.bBtnClickHovered = false
  self:StopAllAnimations()
  self:BindToAnimationFinished(self.UnHover, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.UnHover)
      self:StopAllAnimations()
      self:PlayAnimation(self.Normal)
    end
  })
  self:PlayAnimation(self.UnHover)
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
  if IsUseGamePad then
    self.WidgetSwitcher_0:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
  end
end

return M
