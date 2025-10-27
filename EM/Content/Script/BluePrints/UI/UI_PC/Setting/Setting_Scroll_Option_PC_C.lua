require("UnLua")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")
local EMCache = require("EMCache.EMCache")

function S:Construct()
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
end

function S:Init(Parent, CacheName, CacheInfo)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  rawset(self, "Parent", Parent)
  rawset(self, "CacheName", CacheName)
  rawset(self, "CacheInfo", CacheInfo)
  rawset(self, "SlideMinValue", CacheInfo.ScrollNum[1])
  rawset(self, "SlideMaxValue", CacheInfo.ScrollNum[2])
  rawset(self, "ScrollMappingScale", CacheInfo.ScrollMappingScale)
  rawset(self, "SlideDefaultValue", tonumber(self.CacheInfo.DefaultValue))
  rawset(self, "DefaultValue", CacheInfo.DefaultValue)
  rawset(self, "NowValue", 1)
  rawset(self, "OldValue", 1)
  rawset(self, "LastValue", 1)
  self.Text_Option:SetText(GText(self.CacheInfo.CacheText))
  self.SlideMinValue = self.CacheInfo.ScrollNum[1]
  self.SlideMaxValue = self.CacheInfo.ScrollNum[2]
  self.ScrollMappingScale = self.CacheInfo.ScrollMappingScale
  self.SlideDefaultValue = tonumber(self.CacheInfo.DefaultValue)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and self.CacheInfo.DefaultValueM then
    self.SlideDefaultValue = tonumber(self.CacheInfo.DefaultValueM)
  end
  self:SetHoverVisibility()
  self:SetOldValue()
  self.NowValue = self.OldValue
  self.LastValue = self.NowValue
  self:InitSliderConfig()
  self:UpdateSlide(self.NowValue)
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName())
  self:UpdateUIStyleInPlatform(false)
end

function S:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIStyleInPlatform(false)
end

function S:UpdateUIStyleInPlatform(IsGamepad)
  local CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self.Com_Slider:UpdateUIStyleInPlatform(IsGamepad, CurGamepadName)
end

function S:InitSliderConfig(...)
  local Config = {
    InitValue = self.NowValue,
    MinValue = self.SlideMinValue,
    MaxValue = self.SlideMaxValue,
    ClickInterval = 1,
    MinusBtnCallback = self.OnBtnMinusClicked,
    AddBtnCallback = self.OnBtnAddClicked,
    SliderChangeCallback = self.UpdateSlide,
    OwnerPanel = self,
    bDisableAutoHandleInputDeviceChange = true,
    bForbidPressAccelerate = true
  }
  self.Com_Slider:Init(Config)
end

function S:Handle_KeyDownOnGamePad(InKeyName)
  local IsHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  return IsHandled
end

function S:Handle_KeyUpOnGamePad(InKeyName)
  local IsHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  return IsHandled
end

function S:Gamepad_SetHovered(bIsHovered)
  self:UpdateUIStyleInPlatform(bIsHovered)
  if not bIsHovered then
    self.Com_Slider:TriggerKeyUpEvent()
  end
end

function S:GetBottomKeyInfos()
  return {
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
end

function S:GetFirstWidgetToNavigate()
  return self
end

function S:GetLastWidgetToNavigate()
  return self
end

function S:SetHoverVisibility()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Bg_Set:PlayAnimation(self.Bg_Set.Normal)
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function S:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:AddHoverContent(self)
  self:OnBtnAreaHover()
end

function S:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:RemoveHoverContent(self)
  self:OnBtnAreaUnHover()
end

function S:OnBtnAreaHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.UnHover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.Hover)
end

function S:OnBtnAreaUnHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.Hover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.UnHover)
end

function S:UpdateSlide(NewNum)
  self.Parent.Content.ParentWidget.Parent:ClearSettingListUnfoldState()
  self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
  self.LastValue = self.NowValue
  local SlideValue = math.floor(math.max(self.SlideMinValue, math.min(NewNum, self.SlideMaxValue)))
  self.NowValue = SlideValue
  self.Text_Num:SetText(SlideValue / self.ScrollMappingScale)
  self:SaveOptionSetting()
end

function S:OnBtnDragClicked()
  self.Parent:OnClickBlankArea()
end

function S:OnBtnMinusClicked()
  self:UpdateSlide(self.NowValue - 1.0)
end

function S:OnBtnAddClicked()
  self:UpdateSlide(self.NowValue + 1.0)
end

function S:SetOldValue()
  self.EMCacheName = self.CacheInfo.EMCacheName
  if self.EMCacheName == nil then
    self.OldValue = math.floor(self.SlideDefaultValue)
    return
  end
  self.EMCacheKey = self.CacheInfo.EMCacheKey
  if self["Set" .. self.CacheName .. "OldValue"] then
    self["Set" .. self.CacheName .. "OldValue"](self)
  else
    self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, math.floor(self.SlideDefaultValue))
  end
end

function S:RestoreDefaultOptionSet()
  self.OldValue = math.floor(self.SlideDefaultValue)
  self.NowValue = self.OldValue
  self:InitSliderConfig()
  self:UpdateSlide(self.NowValue)
  self:SaveOptionSetting()
end

function S:SaveOptionSetting()
  if self.EMCacheName == nil then
    return
  end
  self.OldValue = self.NowValue
  if self["Save" .. self.CacheName .. "OptionSetting"] then
    self["Save" .. self.CacheName .. "OptionSetting"](self)
  end
end

function S:SetTotalVolumeOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveTotalVolumeOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SetMusicVolumeOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SetMusicVolumeSetting()
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SaveMusicVolumeOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SetVoiceVolumeOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SetVoiceVolumeSetting()
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SaveVoiceVolumeOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SetSoundVolumeOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SetSoundVolumeSetting()
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SaveSoundVolumeOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  AudioManager(self):SetBusVolume(self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
end

function S:SetHorizontalSensitivityOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveHorizontalSensitivityOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
end

function S:SetHorizontalSensitivityOnShootingOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveHorizontalSensitivityOnShootingOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
end

function S:SetVerticalSensitivityOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveVerticalSensitivityOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
end

function S:SetVerticalSensitivityOnShootingOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveVerticalSensitivityOnShootingOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity(true)
end

function S:UpdateSensitivity()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:UpdateCameraSensitivityFromCache()
  Player:SetPlayerCameraSensitivityByType("Normal")
end

function S:SetSpringArmRateOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveSpringArmRateOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(Player) then
    Player:SetDefaultSpringArmRate(self.NowValue / self.ScrollMappingScale)
  end
end

function S:SetGamePadHorizontalSensitivityOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveGamePadHorizontalSensitivityOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
end

function S:SetGamePadVerticalSensitivityOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveGamePadVerticalSensitivityOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
end

function S:SetGamePadHorizontalSensitivityOnShootingOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveGamePadHorizontalSensitivityOnShootingOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
end

function S:SetGamePadVerticalSensitivityOnShootingOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveGamePadVerticalSensitivityOnShootingOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  self:UpdateSensitivity()
end

function S:SetDamageTextAmountOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveDamageTextAmountOptionSetting()
  local JumpWordManager = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UJumpWordManager)
  if JumpWordManager then
    JumpWordManager:SetMaxJumpWordCountRatio(self.NowValue / self.ScrollMappingScale)
    self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  end
end

function S:SetDamageTextScaleOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SlideDefaultValue / self.ScrollMappingScale) * self.ScrollMappingScale
end

function S:SaveDamageTextScaleOptionSetting()
  local JumpWordManager = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UJumpWordManager)
  if JumpWordManager then
    JumpWordManager:SetJumpWordSize(self.NowValue / self.ScrollMappingScale)
    self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue / self.ScrollMappingScale)
  end
end

return S
