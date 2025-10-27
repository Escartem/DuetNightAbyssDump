require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.IsShowDyeBtn = false
  self.HB_Text:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Dye:SetText(GText("UI_Skin_Gotodye"))
  self.Key_GotoDye:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_GotoDye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PlayAnimation(self.Stain_Out, 0, 1, 0, 1000)
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  self:UpdateGampPadKey()
end

function M:SetGamePadKeyVisibility(Visibility)
  self.GamePadKeyVisibility = Visibility
  self:UpdateGampPadKey()
end

function M:UpdateGampPadKey()
  if self.IsGamepadInput then
    if self.GamePadKeyVisibility then
      self.Key_GotoDye:SetVisibility(self.GamePadKeyVisibility)
    else
      self.Key_GotoDye:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.Key_GotoDye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self.Content.Widget = self
  self.IsPreviewMode = Content.IsPreviewMode
  self.bFormPersonalPage = Content.bFormPersonalPage
  self.IsCharacterTrialMode = Content.IsCharacterTrialMode
  self.IsTargetUnowned = Content.IsTargetUnowned
  self.IsCurrentUse = Content.IsCurrentUse
  self.bDyeable = Content.bDyeable
  self.Type = Content.Type
  self.DyeInfos = Content.DyeInfos
  self.DyePlanIndex = Content.DyePlanIndex
  self.SpecialColor = Content.SpecialColor
  self.ItemId = Content.ItemId
  self.TipType = Content.TipType
  self.IsNoAnimation = Content.IsNoAnimation
  self.LockType = Content.LockType
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  self:SetIcon(Content.IconPath)
  self:SetDyeable(Content.bDyeable)
  self:InitPreviewView()
  self:InitButton()
  self:InitTextStyle()
  self:SetIsNew(Content.IsNew)
end

function M:SetReddot(IsNew)
  self:SetIsNew(IsNew)
end

function M:SetIsNew(IsNew)
  if IsNew then
    self.New:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIsCurrentUse(IsCurrentUse)
  self.IsCurrentUse = IsCurrentUse
  self:InitTextStyle()
end

function M:InitTextStyle()
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetScalarParameterValue("HasTextBG", 0)
    IconDynaMaterial:SetScalarParameterValue("IsTry", 0)
    IconDynaMaterial:SetScalarParameterValue("IsDressed", 0)
    IconDynaMaterial:SetScalarParameterValue("ShapeOutlineOpacity", 0.2)
  end
  if self.IsCurrentUse then
    self.WidgetSwitcher_Text:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if self.IsCharacterTrialMode then
      self.WidgetSwitcher_Text:SetActiveWidgetIndex(1)
      self.Text_TryOut:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
      if IconDynaMaterial then
        IconDynaMaterial:SetScalarParameterValue("HasTextBG", 1)
        IconDynaMaterial:SetVectorParameterValue("TextBGColor1", FLinearColor(0.928, 0.22, 0.869, 1))
      end
    elseif self.IsTargetUnowned then
      self.WidgetSwitcher_Text:SetActiveWidgetIndex(0)
      self.Text_Dressed:SetText()
      if IconDynaMaterial then
        IconDynaMaterial:SetScalarParameterValue("HasTextBG", 0)
        IconDynaMaterial:SetScalarParameterValue("IsDressed", 1)
        IconDynaMaterial:SetScalarParameterValue("ShapeOutlineOpacity", 0.7)
      end
    else
      self.WidgetSwitcher_Text:SetActiveWidgetIndex(0)
      self.Text_Dressed:SetText(GText("UI_Accessory_Equipped"))
      if IconDynaMaterial then
        IconDynaMaterial:SetScalarParameterValue("HasTextBG", 1)
        IconDynaMaterial:SetScalarParameterValue("IsDressed", 1)
        IconDynaMaterial:SetScalarParameterValue("ShapeOutlineOpacity", 0.7)
        IconDynaMaterial:SetVectorParameterValue("TextBGColor1", FLinearColor(1, 1, 1, 1))
      end
    end
    self.VX_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif self.LockType then
    self.WidgetSwitcher_Text:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WidgetSwitcher_Text:SetActiveWidgetIndex(2)
    self.Text_Unlock:SetText(GText("UI_Aaccessory_Locked"))
    if IconDynaMaterial then
      IconDynaMaterial:SetScalarParameterValue("HasTextBG", 1)
      IconDynaMaterial:SetScalarParameterValue("ShapeOutlineOpacity", 0.7)
      IconDynaMaterial:SetVectorParameterValue("TextBGColor1", FLinearColor(0, 0, 0, 1))
      self:PlayAnimation(self.Lock)
    end
    self.VX_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WidgetSwitcher_Text:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.VX_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:OnClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
  if self.Content and self.Content.OnClicked then
    if self.bFormPersonalPage then
      local Content = {
        ItemType = self.TipType,
        ItemId = self.ItemId,
        bCustomStype = true
      }
      if self.ItemId ~= nil and -1 ~= self.ItemId then
        self.ItemDetails_MenuAnchor.ParentWidget = self
        self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
        self:SetSelect()
      end
    else
      self.Content.OnClicked(self.Content.Owner, self.Content)
      self:SetSelect()
    end
  end
end

function M:SetIcon(IconPath)
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if IconDynaMaterial and IconPath then
    IconDynaMaterial:SetTextureParameterValue("MainTex", LoadObject(IconPath))
  end
end

function M:SetDyeable(bDyeable)
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if not IconDynaMaterial then
    return
  end
  if bDyeable then
    IconDynaMaterial:SetScalarParameterValue("NonDye", 0)
    self:SetCornerColorAlpha(1)
  else
    IconDynaMaterial:SetScalarParameterValue("NonDye", 1)
    self:SetCornerColorAlpha(0)
  end
end

function M:ShowDyeBtn(IsShow)
  if self.IsPreviewMode or self.IsCharacterTrialMode or self.IsTargetUnowned then
    return
  end
  if IsShow then
    self.HB_Text:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Tab_Hover:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if not self.IsShowDyeBtn then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Select_Click)
      self:StopAnimation(self.Stain_Out)
      self:PlayAnimation(self.Stain_In)
    end
  else
    self.HB_Text:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Tab_Hover:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.IsShowDyeBtn then
      self:StopAnimation(self.Stain_In)
      self:PlayAnimation(self.Stain_Out)
    end
  end
  self.IsShowDyeBtn = IsShow
end

function M:SetCornerColorAlpha(alphaValue)
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if not IconDynaMaterial then
    return
  end
  local defaultColor = UE4.FLinearColor(0.0, 0.0, 0.0, alphaValue)
  IconDynaMaterial:SetVectorParameterValue("CornerColor", defaultColor)
end

function M:HideNonDyeableHint()
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if not IsValid(IconDynaMaterial) then
    DebugPrint("WYX HideNonDyeableHint \232\142\183\229\143\150DynaMaterial\229\164\177\232\180\165")
    return
  end
  IconDynaMaterial:SetScalarParameterValue("IconScale", 0)
  IconDynaMaterial:SetVectorParameterValue("CornerColor", UE4.FLinearColor(0.0, 0.0, 0.0, 0.0))
end

function M:InitPreviewView()
  if not self.bFormPersonalPage then
    return
  end
  self:HideNonDyeableHint()
  if self.bDyeable then
    self.DefaultColorId = DataMgr.GlobalConstant[self.Type .. "DefaultColor"].ConstantValue
    if self.SpecialColor ~= nil and DataMgr.SpecialSwatch[self.SpecialColor] then
      local MaterialInstance = LoadObject(DataMgr.SpecialSwatch[self.SpecialColor].MaterialPath)
      self.Image_SPDye:SetBrushResourceObject(MaterialInstance)
      self.List_Color:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Image_SPDye:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.List_Color:ClearListItems()
      local DyeDetialInfo
      if nil == self.DyeInfos or 0 == self.DyeInfos:Length() or nil == self.DyeInfos[self.DyePlanIndex] or 0 == self.DyeInfos[self.DyePlanIndex]:Length() then
        DyeDetialInfo = self:CreateDefaultSkin().Colors
      else
        DyeDetialInfo = self.DyeInfos[self.DyePlanIndex]
      end
      for index, ColorIndex in ipairs(DyeDetialInfo) do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        Content.ColorId = ColorIndex
        self.List_Color:AddItem(Content)
      end
      self.List_Color:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Image_SPDye:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.List_Color:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:InitButton()
  if not self.IsPreviewMode or self.IsCharacterTrialMode or self.IsTargetUnowned then
    return
  end
  if self.ItemId == nil or -1 == self.ItemId then
    self.Button_Area:SetIsEnabled(false)
  else
    self.Button_Area:SetIsEnabled(true)
  end
end

function M:CreateDefaultSkin()
  local ColorPartCount = DataMgr.GlobalConstant[self.Type .. "ColorPart"].ConstantValue
  local Skin = {
    Colors = {},
    SpecialColor = self.DefaultColorId
  }
  for i = 1, ColorPartCount do
    Skin.Colors[i] = self.DefaultColorId
  end
  return Skin
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:SetSelect()
  if self.IsPreviewMode then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Select_Click)
  end
end

function M:SetUnSelect()
  self.Content.IsSelect = false
  if self.IsNoAnimation then
    return
  end
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Click)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
end

function M:OnBtnHovered()
  if not self.Content or self.Content.IsSelect then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetSelect()
  else
    if self.IsNoAnimation then
      return
    end
    AudioManager(self):PlayUISound(nil, "event:/ui/common/hover_btn_large", nil, nil)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Hover)
  end
end

function M:OnBtnUnhovered()
  if self.Content.IsSelect or self.IsNoAnimation then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.UnHover)
end

function M:OnBtnPressed()
  if self.Content.IsSelect or self.IsNoAnimation then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

AssembleComponents(M)
return M
