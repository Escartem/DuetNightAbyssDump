require("UnLua")
local Menu_Btn_Cell_C = Class({
  "Blueprints.UI.BP_UIState_C"
})

function Menu_Btn_Cell_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function Menu_Btn_Cell_C:OnLoaded(...)
end

function Menu_Btn_Cell_C:Construct()
  self:InitButton()
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
end

function Menu_Btn_Cell_C:OnMouseEnter(MyGeometry, MouseEvent)
  if self.Mobile then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  if self.CurBtnContent.Id then
    if self.CurBtnContent.Id - 1 ~= self.Owner.BtnIdx then
      self.Owner.BtnIdx = self.CurBtnContent.Id - 1
      self:StopAnimation(self.UnHover)
      self:PlayAnimation(self.Hover)
    end
  else
    self:StopAnimation(self.UnHover)
    self:PlayAnimation(self.Hover)
  end
end

function Menu_Btn_Cell_C:OnMouseLeave(MyGeometry, MouseEvent)
  self.IsEnter = false
  if self.Mobile then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function Menu_Btn_Cell_C:InitButton(Owner)
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
end

function Menu_Btn_Cell_C:LoadImage(IconPath)
  local ImageResource = LoadObject(IconPath)
  if nil ~= ImageResource then
    local Material = self.Icon_Option:GetDynamicMaterial()
    if Material then
      Material:SetTextureParameterValue("IconTex", ImageResource)
    end
  end
  self:PlayAnimation(self.Normal)
end

function Menu_Btn_Cell_C:OnListItemObjectSet(Content)
  self.CurBtnContent = Content
  self.CurBtnContent.SelfWidget = self
  self.Owner = Content.ParentWidget
  if Content.BtnIconPath then
    self:LoadImage(Content.BtnIconPath)
  end
  self.Text_Option:SetText(Content.BtnName)
end

function Menu_Btn_Cell_C:SetStyle(Hover)
  if Hover then
    self:PlayAnimation(self.Hover)
  else
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function Menu_Btn_Cell_C:PlayButtonClickSound()
  UIConst.PlayCommonBtnSe(self)
end

function Menu_Btn_Cell_C:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function Menu_Btn_Cell_C:OnBtnClicked()
  self:PlayButtonClickAnimation()
  self.Owner:OnListBtnClicked(self.CurBtnContent)
end

function Menu_Btn_Cell_C:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function Menu_Btn_Cell_C:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function Menu_Btn_Cell_C:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function Menu_Btn_Cell_C:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function Menu_Btn_Cell_C:OnBtnReleased()
  self.IsPressing = false
  self:PlayButtonReleaseButHoverAnim()
end

function Menu_Btn_Cell_C:SwitchNormalAnimation()
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Normal)
end

function Menu_Btn_Cell_C:PlayButtonHoverAnim()
  self:PlayAnimation(self.Hover)
end

return Menu_Btn_Cell_C
