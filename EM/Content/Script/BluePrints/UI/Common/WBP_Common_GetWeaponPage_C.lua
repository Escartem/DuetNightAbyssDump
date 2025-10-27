require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Btn_FullClose.OnClicked:Add(self, self.OnBtnFullCloseClicked)
  if not UIUtils.IsMobileInput() then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if IsValid(self.GameInputModeSubsystem) then
      self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
    end
  end
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local Params = (...)
  self:Init(Params)
end

function M:Init(Params)
  self:SetFocus()
  self.TextFonts = {
    [3] = self.Font_Blue,
    [4] = self.Font_Purple,
    [5] = self.Font_Gold,
    [6] = self.Font_Red
  }
  self.Params = Params
  self.TargetType = self.Params.TargetType
  self.bGacha = self.Params.bGacha
  self.Key_Tips:UpdateKeyInfo({
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
        }
      },
      Desc = GText("UI_CTL_Continue")
    }
  })
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_amb", "GachaAmb", nil)
  self.CurShowIndex = 0
  self.ShowTimes = #self.Params.TargetIdList
  self:RefreshCommonShowUI()
end

function M:IsWeaponSkin()
  return self.TargetType == CommonConst.DataType.WeaponSkin
end

function M:IsWeapon()
  return self.TargetType == CommonConst.DataType.Weapon
end

function M:RefreshCommonShowUI()
  self.CurShowIndex = self.CurShowIndex + 1
  if self.Params.TargetIdList[self.CurShowIndex] == nil then
    return
  end
  self.TargetId = self.Params.TargetIdList[self.CurShowIndex]
  self.Btn_FullClose:SetVisibility(UE4.ESlateVisibility.Visible)
  if self:IsWeaponSkin() then
    local SkinInfo = DataMgr.WeaponSkin[self.TargetId]
    if not SkinInfo then
      return
    end
    local ApplicationType = SkinInfo.ApplicationType
    if not ApplicationType or not DataMgr.WeaponTypeContrast[ApplicationType] then
      DebugPrint(ErrorTag, "---jzn---Weapon---ApplicationType---error---", self.TargetId, ApplicationType)
    end
    local ApplicationTypeInfo = DataMgr.WeaponTypeContrast[ApplicationType]
    self.Group_SkinInfo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Group_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_WeaponType:SetText(GText(ApplicationTypeInfo.WeaponTagTextmap) .. GText("UI_SkinDisplay_Suffix"))
    self.Text_SkinName:SetText(GText(SkinInfo.Name))
    local SkinRarity = SkinInfo.Rarity
    self.Com_QualityTag:Init(SkinRarity)
    self.Text_SkinName:SetFont(self.TextFonts[SkinRarity])
    local SpinePath = ApplicationTypeInfo.GachaSpine
    local IconPath = ApplicationTypeInfo.GachaIcon
    self:SetWeaponSkinImg(SkinInfo.DisplayPath, IconPath, SpinePath)
  else
    local WeaponInfo = DataMgr.Weapon[self.TargetId]
    if not WeaponInfo then
      return
    end
    self.Group_SkinInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Detail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_WeaponName:SetText(GText(WeaponInfo.WeaponName))
    self:SetWeaponImgRole()
  end
  self:SetTargetNew()
  self:PlayInAnim()
end

function M:SetWeaponSkinImg(IconPath, AttributeIconPath, SpinePath)
  if not IconPath then
    return
  end
  local Icon = LoadObject(IconPath)
  self.Image_Weapon:SetBrushResourceObject(Icon)
  local AttributeIcon = LoadObject(AttributeIconPath)
  if AttributeIcon then
    local RoleMaterial = self.Image_WeaponIcon:GetDynamicMaterial()
    RoleMaterial:SetTextureParameterValue("IconTex", AttributeIcon)
  end
  self.IsCampAnimation = false
  if SpinePath then
    self:GetWeaponCampUI(SpinePath)
  else
    self.Group_Camp:ClearChildren()
  end
end

function M:SetWeaponImgRole()
  local IconPath = DataMgr.Weapon[self.TargetId].BigIcon
  local Icon = LoadObject(IconPath)
  self.Image_Weapon:SetBrushResourceObject(Icon)
  local WeaponInfo = DataMgr.BattleWeapon[self.TargetId]
  if not WeaponInfo then
    return
  end
  self.IsCampAnimation = false
  for _, Tag in pairs(WeaponInfo.WeaponTag) do
    local TagInfo = DataMgr.WeaponTag[Tag]
    if TagInfo and TagInfo.WeaponTagfilter then
      local AttributeIcon = LoadObject(TagInfo.GachaIcon)
      if AttributeIcon then
        local RoleMaterial = self.Image_WeaponIcon:GetDynamicMaterial()
        RoleMaterial:SetTextureParameterValue("IconTex", AttributeIcon)
      end
      if TagInfo.GachaSpine then
        self:GetWeaponCampUI(TagInfo.GachaSpine)
        break
      end
      self.Group_Camp:ClearChildren()
      break
    end
  end
end

function M:GetWeaponCampUI(BpPath)
  self.IsCampAnimation = true
  self.Group_Camp:ClearChildren()
  local WeaponCampUI = UIManager(self):CreateWidget(BpPath, false)
  if not WeaponCampUI then
    self.IsCampAnimation = false
    DebugPrint(ErrorTag, "---jzn---Weapon---Camp---error---", BpPath)
    return
  end
  self.Group_Camp:AddChild(WeaponCampUI)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(WeaponCampUI)
  OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.WeaponCampUI = WeaponCampUI
  return self.WeaponCampUI
end

function M:SetTargetNew()
  local Avatar = GWorld:GetAvatar()
  self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.New_Skin:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not Avatar then
    return
  end
  if self:IsWeaponSkin() then
    if 1 == AvatarUtils:GetTargetDataStatistics(Avatar, "WeaponSkin", self.TargetId) then
      self.New_Skin:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif 1 == AvatarUtils:GetTargetDataStatistics(Avatar, "Weapon", self.TargetId) then
    self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:PlayInAnim()
  self.CantClick = true
  local AnimTime
  
  local function SetClick()
    self.CantClick = false
  end
  
  local function IconInFinish()
    if self:IsWeaponSkin() then
      self:PlayAnimation(self.Skin_In)
      AnimTime = self.Skin_In:GetEndTime()
    else
      self:PlayAnimation(self.In)
      AnimTime = self.In:GetEndTime()
    end
    if AnimTime then
      self:AddTimer(AnimTime, SetClick, false, 0, "SetClick")
    end
  end
  
  if self:IsWeaponSkin() then
    self:UnbindAllFromAnimationFinished(self.Icon_In)
    self:PlayAnimation(self.Skin_Icon_In)
    DebugPrint("----jzn---PlayGet_skin---Weapon--")
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_get_skin", nil, nil)
    self:BindToAnimationFinished(self.Skin_Icon_In, {self, IconInFinish})
  else
    self:UnbindAllFromAnimationFinished(self.Icon_In)
    self:PlayAnimation(self.Icon_In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_get_weapon", nil, nil)
    self:BindToAnimationFinished(self.Icon_In, {self, IconInFinish})
  end
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:PlayCampIn()
  if self.IsCampAnimation and self.WeaponCampUI then
    self.WeaponCampUI:PlayAnimation(self.WeaponCampUI.In)
  end
end

function M:RefreshInfoByInputTypeChange(CurInputType, CurGamepadName)
  if UIUtils.IsMobileInput() then
    return
  end
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  self:SetFocus()
  self.Key_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:InitKeyboardView()
  if UIUtils.IsMobileInput() then
    return
  end
  self.Key_Tips:SetVisibility(ESlateVisibility.Collapsed)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.CantClick then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName and not self.bSpaceBarSkip then
    self:OnBtnFullCloseClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self:OnBtnFullCloseClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnBtnFullCloseClicked()
  if self.CantClick then
    return
  end
  if self.CurShowIndex < self.ShowTimes then
    self:RefreshCommonShowUI()
  else
    self:PlayOutAnim()
  end
end

function M:PlayOutAnim()
  self.CantClick = true
  self:UnbindAllFromAnimationFinished(self.Out)
  self:PlayAnimation(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnCloseCallback
  })
end

function M:OnCloseCallback()
  self.CantClick = false
  AudioManager(self):SetEventSoundParam(self, "GachaAmb", {ToEnd = 1})
  self:Close()
  if self.Params.CallbackFunc then
    self.Params.CallbackFunc(self.Params.CallbackObj)
  end
end

return M
