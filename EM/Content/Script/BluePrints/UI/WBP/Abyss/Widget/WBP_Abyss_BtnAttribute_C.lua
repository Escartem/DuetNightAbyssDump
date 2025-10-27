local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Text_Attribute:SetText(GText("UI_SuggestAttribute"))
  self.Btn_Attribute:Init({OwnerWidget = self, PopupId = 100241})
  self:BindButtonPerformances()
  self:InitGamepadKeys()
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

function M:InitGamepadKeys()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Key_Attribute:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Down"}
    }
  })
end

function M:Init(AbyssLevelId, DungeonIndex)
  self.List_Attribute:ClearListItems()
  local FoldPath = "/Game/UI/Texture/Dynamic/Atlas/Armory/"
  local Prefix = "T_Armory_"
  local AttributeType = DataMgr.AbyssLevel[AbyssLevelId]["AttributeType" .. DungeonIndex]
  local Attributes = {}
  if AttributeType then
    Attributes = string.split(AttributeType, ",")
    self.Panel_Attribute:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for _, Attribute in pairs(Attributes) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    local AttributeName = Prefix .. Attribute
    Obj.IconPath = FoldPath .. AttributeName .. "." .. AttributeName
    self.List_Attribute:AddItem(Obj)
  end
end

function M:OnClicked()
  self.Btn_Attribute:OnViewInfoClick()
end

function M:SwitchUIType(IsGamePad)
  if IsGamePad then
    self.WS_Attribute:SetActiveWidgetIndex(1)
  else
    self.WS_Attribute:SetActiveWidgetIndex(0)
  end
end

function M:BindButtonPerformances()
  self.Btn_Attribute_Cover.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Attribute_Cover.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Attribute_Cover.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Attribute_Cover.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Attribute_Cover.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  self.Btn_Attribute_Cover.OnClicked:Clear()
  self.Btn_Attribute_Cover.OnPressed:Clear()
  self.Btn_Attribute_Cover.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Attribute_Cover.OnHovered:Clear()
    self.Btn_Attribute_Cover.OnUnhovered:Clear()
  end
end

function M:SwitchNormalAnimation()
  self.Btn_Attribute:StopAllAnimations()
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Normal)
end

function M:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function M:PlayButtonClickAnimation()
  self.Btn_Attribute:StopAllAnimations()
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Normal)
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Click)
end

function M:OnBtnClicked()
  self:PlayButtonClickSound()
  self:PlayButtonClickAnimation()
  self:OnClicked()
end

function M:PlayButtonPressAnim()
  self.Btn_Attribute:StopAllAnimations()
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Normal)
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Press)
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function M:PlayButtonHoverAnim()
  self.Btn_Attribute:StopAllAnimations()
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Normal)
  self.Btn_Attribute:PlayAnimation(self.Btn_Attribute.Hover)
end

function M:OnBtnHovered()
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
  self.Btn_Attribute:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function M:PlayButtonReleaseAndUnHoverAnim()
  self.Btn_Attribute:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function M:PlayButtonUnHoverAnim()
  self.Btn_Attribute:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

return M
