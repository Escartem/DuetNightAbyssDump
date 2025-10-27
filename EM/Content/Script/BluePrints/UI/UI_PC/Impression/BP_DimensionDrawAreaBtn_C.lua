local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(RegionId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    GWorld.logger.error("BP_DimensionDrawAreaBtn_C\239\188\154Init()\239\188\140Avatar\228\184\141\229\173\152\229\156\168")
    return
  end
  local RegionId = RegionId or DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  local ImpressionAreaId = Avatar:GetImpressionAreaIdFromRegionId(RegionId)
  local Impression = Avatar:GetRegionImpression(ImpressionAreaId)
  local ImpressionMaxValue = DataMgr.GlobalConstant.ImressionMax.ConstantValue
  for Index, ImpressionType in pairs(ImpressionTypes) do
    local PlayerValue = Impression:GetImpressionValueByType(ImpressionType)
    local CorrectionValue = (PlayerValue + 10) * 0.91
    local NormalizedValue = math.min(1, CorrectionValue / ImpressionMaxValue)
    self.RegularPolygonImage:SetPointRatio(Index - 1, NormalizedValue)
  end
  local RegionInfo = DataMgr.ImpressionRegion[ImpressionAreaId]
  if RegionInfo then
    local Icon = LoadObject(RegionInfo.Icon)
    if Icon then
      local IconMaterial = self.Image_Area:GetDynamicMaterial()
      IconMaterial:SetTextureParameterValue("MainTex", Icon)
    end
  end
end

function M:Construct()
  self.Checked = false
  self.ClickLogics = {}
  self:BindButtonPerformances()
  self.Normal = self["BtnDimension_" .. "Normal"]
  self.Hover = self["BtnDimension_" .. "Hover"]
  self.UnHover = self["BtnDimension_" .. "UnHover"]
  self.Press = self["BtnDimension_" .. "Press"]
  self.Click = self["BtnDimension_" .. "Click"]
  self.Btn_Dimension:SetRenderOpacity(0)
  self.Text_Dimension:SetText(GText("UIGuide_Title_ImpressionSystem_1"))
end

function M:Destruct()
  self.ClickLogics = {}
  self:UnBindButtonPerformances()
end

function M:BindEventOnClicked(Obj, Func)
  if not Obj or not Func then
    return
  end
  if not self.ClickLogics[Obj] then
    self.ClickLogics[Obj] = {}
  end
  table.insert(self.ClickLogics[Obj], Func)
end

function M:UnBindEventOnClicked(Obj, Func)
  if not Obj or not Func then
    return
  end
  if self.ClickLogics[Obj] then
    local temp_table = {}
    for _, Callback in pairs(self.ClickLogics[Obj]) do
      if Callback ~= Func then
        table.insert(temp_table, Callback)
      end
    end
    self.ClickLogics[Obj] = temp_table
  end
end

function M:BindButtonPerformances()
  self.Btn_Dimension.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Dimension.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Dimension.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Dimension.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Dimension.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  if not self.Btn_Dimension then
    return
  end
  self.Btn_Dimension.OnClicked:Clear()
  self.Btn_Dimension.OnPressed:Clear()
  self.Btn_Dimension.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Dimension.OnHovered:Clear()
    self.Btn_Dimension.OnUnhovered:Clear()
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
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function M:OnBtnClicked()
  if self.Checked == false then
    self:SetIsChecked(true, true)
  elseif self.Checked == true then
    self:SetIsChecked(false, true)
  end
  if next(self.ClickLogics) ~= nil then
    for Obj, Callbacks in pairs(self.ClickLogics) do
      for _, Callback in pairs(Callbacks) do
        Callback(Obj)
      end
    end
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
  self:PlayAnimation(self.Hover)
end

function M:OnBtnHovered()
  if self.Checked == true then
    return
  end
  self.IsHovering = true
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_five_dimension_btn_hover", nil, nil)
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
  self:PlayAnimation(self.UnHover)
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

function M:SetIsChecked(IsChecked)
  if self.Checked == false and true == IsChecked then
    self.Checked = true
    self:PlayButtonClickAnimation()
  elseif self.Checked == true and false == IsChecked then
    self.Checked = false
    self:SwitchNormalAnimation()
  end
end

function M:Activate()
  self:OnBtnClicked()
end

return M
