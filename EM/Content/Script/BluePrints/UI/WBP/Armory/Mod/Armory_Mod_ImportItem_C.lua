local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Checked = false
  self:BindButtonPerformances()
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

local ModModel = ModController:GetModel()

function M:Init(Index, ImportPanel)
  self.Checked = false
  self.Index = Index
  self.ImportPanel = ImportPanel
  local SuitName = ModModel:GetSuitName(Index)
  self.Text_Plan:SetText(SuitName)
  self:SwitchNormalAnimation()
end

function M:OnClicked()
  if self.ImportPanel then
    self.ImportPanel:ImportItemChanged(self.Index)
  else
    DebugPrint("lhr@Armory_Mod_ImportItem:OnClicked\239\188\140\230\150\185\230\161\136\229\175\188\229\133\165\233\157\162\230\157\191\229\164\177\230\149\136")
  end
end

function M:BindButtonPerformances()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
    self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  if not self.Button_Area then
    return
  end
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Button_Area.OnHovered:Clear()
    self.Button_Area.OnUnhovered:Clear()
  end
end

function M:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:PlayButtonClickSound()
  UIUtils.PlayCommonBtnSe(self)
end

function M:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnBtnClicked()
  if self.Checked == false then
    self:PlayCheckSound(true)
    self:OnClicked()
  end
end

function M:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnPressed()
  if self.Checked == true then
    return
  end
  self:PlayButtonClickSound()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function M:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function M:OnBtnHovered()
  if self.Checked == true then
    return
  end
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function M:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function M:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function M:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnReleased()
  self.IsPressing = false
  if self.Checked == true then
    return
  end
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function M:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if self.Checked == true then
    return
  end
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function M:SetIsChecked(IsChecked, IsPlaySound)
  if self.Checked == false and true == IsChecked then
    self.Checked = true
    if IsPlaySound then
      self:PlayCheckSound(true)
    end
    self:PlayButtonClickAnimation()
  elseif self.Checked == true and false == IsChecked then
    self.Checked = false
    if IsPlaySound then
      self:PlayCheckSound(false)
    end
    self:SwitchNormalAnimation()
  end
end

function M:PlayCheckSound(IsChecked)
  if IsChecked then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  else
  end
end

return M
