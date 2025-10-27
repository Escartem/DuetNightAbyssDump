require("UnLua")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnAreaClicked)
  self.WBP_Set_SuboptionUnfold.Button_Drag.OnClicked:Add(self, self.OnBtnDragClicked)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnClicked:Add(self, self.OnClickMiniOptionList)
  self.Button_Area.OnHovered:Add(self, self.OnBtnAreaHover)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnHovered:Add(self, self.OnSubBtnAreaHover)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnAreaUnHover)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnUnhovered:Add(self, self.OnSubBtnAreaUnHover)
  self.Bg_Set.Button_Base.OnClicked:Add(self, self.OnMainBtnClicked)
  self.WBP_Set_SuboptionUnfold.Bg_Set.Button_Base.OnClicked:Add(self, self.OnSubBtnClicked)
  self.Bg_Set.Button_Base.OnHovered:Add(self, self.OnMainBtnHovered)
  self.WBP_Set_SuboptionUnfold.Bg_Set.Button_Base.OnHovered:Add(self, self.OnSubBtnHovered)
end

function S:Init(Parent, CacheName, CacheInfo)
  rawset(self, "Parent", Parent)
  rawset(self, "CacheName", CacheName)
  rawset(self, "CacheInfo", CacheInfo)
  rawset(self, "DefaultValue", CacheInfo.DefaultValue)
  rawset(self, "IsMiniListOpen", false)
  rawset(self, "HaveMiniOption", false)
  rawset(self, "HasBeenForbidden", false)
  rawset(self, "SubListOffset", 15)
  rawset(self, "NowValue", true)
  rawset(self, "OldValue", true)
  self.Text_Option:SetText(GText(self.CacheInfo.CacheText))
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and self.CacheInfo.DefaultValueM then
    self.DefaultValue = self.CacheInfo.DefaultValueM
  end
  self:SetOldValue()
  self:SetHoverVisibility()
  self:PlaySwitchAnimation(self.OldValue)
  self:InitMiniOptionList(true)
  self.Text_Close:SetText(GText(self.CacheInfo.SwitchText[1]))
  self.Text_Open:SetText(GText(self.CacheInfo.SwitchText[2]))
end

function S:InitMiniOptionList(IsInit)
  if self.CacheInfo.SubOptionName then
    self.HaveMiniOption = true
    self.MiniOptionTextList = self.CacheInfo.SubOptionText
    self.MiniOptionDefaultList = self.CacheInfo.SubOptionDefaultValue
    self.VB_Suboption:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Set_SuboptionUnfold.Text_Option:SetText(GText(self.CacheInfo.SubOptionName))
    if self.MiniOptionDefaultList and not self.NowValue then
      self.NowMiniOptionId = 0
      if not self.HasBeenForbidden then
        self.HasBeenForbidden = true
        self.WBP_Set_SuboptionUnfold:PlayAnimation(self.WBP_Set_SuboptionUnfold.Forbidden)
        self.WBP_Set_SuboptionUnfold.Text_Current:SetText("")
        self.WBP_Set_SuboptionUnfold:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      end
      if IsInit and self["Set" .. self.CacheName .. "MiniOptionId"] then
        self["Set" .. self.CacheName .. "MiniOptionId"](self)
      end
    else
      self:SetMiniOption(IsInit)
    end
  else
    self.HaveMiniOption = false
    self.VB_Suboption:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function S:SetMiniOption(IsInit)
  if IsInit and self["Set" .. self.CacheName .. "MiniOptionId"] then
    self["Set" .. self.CacheName .. "MiniOptionId"](self)
  else
    self.NowMiniOptionId = self.MiniOptionDefaultList[1]
  end
  self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.Forbidden)
  self.WBP_Set_SuboptionUnfold:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.HasBeenForbidden = false
  self.WBP_Set_SuboptionUnfold.Text_Current:SetText(GText(self.MiniOptionTextList[self.NowMiniOptionId]))
end

function S:SetHoverVisibility()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Bg_Set:PlayAnimation(self.Bg_Set.Normal)
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Set_SuboptionUnfold.Bg_Set:PlayAnimation(self.WBP_Set_SuboptionUnfold.Bg_Set.Normal)
    self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function S:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:AddHoverContent(self)
end

function S:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:RemoveHoverContent(self)
end

function S:OnBtnAreaHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.UnHover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.Hover)
end

function S:OnBtnAreaUnHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.Hover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.UnHover)
end

function S:OnSubBtnAreaHover()
  self.WBP_Set_SuboptionUnfold.Bg_Set:StopAnimation(self.WBP_Set_SuboptionUnfold.Bg_Set.UnHover)
  self.WBP_Set_SuboptionUnfold.Bg_Set:PlayAnimation(self.WBP_Set_SuboptionUnfold.Bg_Set.Hover)
end

function S:OnSubBtnAreaUnHover()
  self.WBP_Set_SuboptionUnfold.Bg_Set:StopAnimation(self.WBP_Set_SuboptionUnfold.Bg_Set.Hover)
  self.WBP_Set_SuboptionUnfold.Bg_Set:PlayAnimation(self.WBP_Set_SuboptionUnfold.Bg_Set.UnHover)
end

function S:OnClickLeftMouseButton()
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
  end
end

function S:OnBtnDragClicked()
  self.Parent:OnClickBlankArea()
end

function S:PlaySwitchAnimation(IsOpen)
  if IsOpen then
    self:PlayAnimation(self.Open)
  else
    self:PlayAnimation(self.Close)
  end
end

function S:SetOldValue()
  self.EMCacheName = self.CacheInfo.EMCacheName
  self.EMCacheKey = self.CacheInfo.EMCacheKey
  if self.DefaultValue == "True" then
    self.DefaultValue = true
  else
    self.DefaultValue = false
  end
  if self["Set" .. self.CacheName .. "OldValue"] then
    self["Set" .. self.CacheName .. "OldValue"](self)
  else
    self.OldValue = self.DefaultValue
  end
  self.NowValue = self.OldValue
  if self.EMCacheName == "GameUserSettings" or self.EMCacheName == "ConsoleVariable" then
    self["Save" .. self.CacheName .. "OptionSetting"](self)
  end
end

function S:GetOldValue(List, NowSet)
  if List[1] == NowSet then
    return false
  elseif List[2] == NowSet then
    return true
  else
    return self.DefaultValue
  end
end

function S:GetNowValue(List)
  if self.NowValue then
    return List[2]
  else
    return List[1]
  end
end

function S:GetOldMiniOptionId(List, NowSet, IsTable)
  for Id, Value in pairs(List) do
    if IsTable then
      if Value[1] == NowSet[1] and Value[2] == NowSet[2] then
        return Id
      end
    elseif Value == NowSet then
      return Id
    end
  end
  return tonumber(self.MiniOptionDefaultList[1])
end

function S:OnBtnAreaClicked()
  local CurrentValue = self.NowValue or false
  self:SetSwitcher(not self.NowValue)
end

function S:SetSwitcher(bValue)
  if bValue == self.NowValue then
    return
  end
  self.Parent.Content.ParentWidget.Parent:ClearSettingListUnfoldState()
  self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
  UIUtils.PlayCommonBtnSe(self)
  if bValue then
    self:StopAnimation(self.Close)
    self:PlayAnimation(self.Open)
  else
    self:StopAnimation(self.Open)
    self:PlayAnimation(self.Close)
  end
  self.NowValue = bValue
  self:SaveOptionSetting()
end

function S:OnClickMiniOptionList()
  if self.HasBeenForbidden then
    return
  end
  UIUtils.PlayCommonBtnSe(self)
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
    self:PlayAnimationReverse(self.OpenMinilist)
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    if UIUtils.IsGamepadInput() then
      self.WBP_Set_SuboptionUnfold:SetFocus()
    end
  else
    self.Parent.Content.ParentWidget.Parent:ClearSettingListUnfoldState()
    self.IsMiniListOpen = true
    if self.MiniOptionTextList then
      self:InitMiniSubOptionList()
    end
    self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(true)
    if UIUtils.IsGamepadInput() then
      self.Parent.Content.ParentWidget.Parent:BindUnfoldListClosedCallback(function()
        self:OnClickLeftMouseButton()
        self.WBP_Set_SuboptionUnfold:SetFocus()
      end)
    end
    self.WBP_Set_SuboptionUnfold:StopAnimation(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.WBP_Set_SuboptionUnfold:PlayAnimation(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    local SelfGeometry = self.WBP_Set_SuboptionUnfold.Button_Area:GetCachedGeometry()
    local ParentGeometry = self.Parent.Content.ParentWidget.Parent.Panel_Option:GetCachedGeometry()
    local SelfAbsoluteLocation = USlateBlueprintLibrary.LocalToAbsolute(SelfGeometry, FVector2D(0, 0))
    local ParentAbsoluteLocation = USlateBlueprintLibrary.LocalToAbsolute(ParentGeometry, FVector2D(0, 0))
    local SelfAbsoluteSize = USlateBlueprintLibrary.GetAbsoluteSize(SelfGeometry)
    local ParentAbsoluteSize = USlateBlueprintLibrary.GetAbsoluteSize(ParentGeometry)
    local SelfAbsolutePosition, IsUpper
    if SelfAbsoluteLocation.Y - ParentAbsoluteLocation.Y > ParentAbsoluteSize.Y / 2 then
      IsUpper = true
      SelfAbsolutePosition = FVector2D(SelfAbsoluteLocation.X + SelfAbsoluteSize.X / 2, SelfAbsoluteLocation.Y - self.SubListOffset)
    else
      IsUpper = false
      SelfAbsolutePosition = FVector2D(SelfAbsoluteLocation.X + SelfAbsoluteSize.X / 2, SelfAbsoluteLocation.Y + SelfAbsoluteSize.Y + self.SubListOffset)
    end
    local EndAbsolutePosition = USlateBlueprintLibrary.AbsoluteToLocal(ParentGeometry, SelfAbsolutePosition)
    self.Parent.Content.ParentWidget.Parent:UpdateUnfoldListPosition(EndAbsolutePosition, IsUpper)
  end
end

function S:InitMiniSubOptionList()
  self.Parent.Content.ParentWidget.Parent.WBP_Set_UnfoldList.SubOption_List:ClearListItems()
  for key, value in pairs(self.MiniOptionTextList) do
    local OptionContent = NewObject(UIUtils.GetCommonItemContentClass())
    OptionContent.Id = key
    OptionContent.Text = GText(value)
    OptionContent.ParentWidget = self
    OptionContent.SelectedOptionId = self.NowMiniOptionId
    OptionContent.ClickCallBack = "OnClickChangeMiniOption"
    self.Parent.Content.ParentWidget.Parent.WBP_Set_UnfoldList.SubOption_List:AddItem(OptionContent)
  end
end

function S:OnClickChangeMiniOption(SelectOptionId)
  if not self.HaveMiniOption then
    return
  end
  if self.NowMiniOptionId ~= SelectOptionId then
    self.Parent.Content.ParentWidget.Parent:ChangeUnfoldListSelection(SelectOptionId)
  end
  self.NowMiniOptionId = SelectOptionId
  self.WBP_Set_SuboptionUnfold.Text_Current:SetText(GText(self.MiniOptionTextList[self.NowMiniOptionId]))
  self:OnClickMiniOptionList()
  self:SaveMiniOptionSetting()
end

function S:RestoreDefaultOptionSet()
  self.OldValue = self.DefaultValue
  self.NowValue = self.OldValue
  if self["RestoreDefault" .. self.CacheName .. "OptionSet"] then
    self["RestoreDefault" .. self.CacheName .. "OptionSet"](self)
  end
  self:PlaySwitchAnimation(self.OldValue)
  self:InitMiniOptionList()
  self:RestoreDefaultMiniOption()
end

function S:RestoreDefaultMiniOption()
  if not self.HasBeenForbidden and self["RestoreDefaultMiniOption" .. self.CacheName] then
    self["RestoreDefaultMiniOption" .. self.CacheName](self)
  end
end

function S:SaveOptionSetting()
  if self["Save" .. self.CacheName .. "OptionSetting"] then
    self["Save" .. self.CacheName .. "OptionSetting"](self)
    if self.EMCacheName == "GameUserSettings" or self.EMCacheName == "ConsoleVariable" then
      GWorld.GameInstance.SetOverallScalabilityLevelSimple(CommonConst.OverallPerformanceCustom)
      if self.Parent.Content.ParentWidget.Parent.OverallPreset then
        self.Parent.Content.ParentWidget.Parent.OverallPreset:RefreshOverallPreset()
      end
    end
    self.OldValue = self.NowValue
    self:InitMiniOptionList()
    self:SaveMiniOptionSetting()
  else
    self.OldValue = self.DefaultValue
  end
end

function S:SaveMiniOptionSetting()
  if self["Save" .. self.CacheName .. "MiniOptionSetting"] then
    self["Save" .. self.CacheName .. "MiniOptionSetting"](self)
  end
end

function S:ClearOpenListState()
  if self.IsListOpen then
    self.IsListOpen = false
    self:PlayAnimationReverse(self.Openlist)
  end
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
  end
end

function S:OnClickLeftMouseButton()
  if self.IsListOpen then
    self.IsListOpen = false
    self:PlayAnimationReverse(self.Openlist)
    self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
  end
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.Parent.Content.ParentWidget.Parent:SetSettingUnfoldListPC(false)
  end
end

function S:SetAimAssistOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultAimAssistOptionSet()
  self:SaveAimAssistOptionSetting()
end

function S:SaveAimAssistOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:UpdateOpenHelperAim(self.NowValue)
end

function S:SetUpdateOpenLockAimOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultUpdateOpenLockAimOptionSet()
  self:SaveUpdateOpenLockAimOptionSetting()
end

function S:SaveUpdateOpenLockAimOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:UpdateOpenLockAim(self.NowValue)
end

function S:SetFallAttackDirectionOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultFallAttackDirectionOptionSet()
  self:SaveFallAttackDirectionOptionSetting()
end

function S:SaveFallAttackDirectionOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:UpdateEnableFallAtkDir(self.NowValue)
  self.OldValue = self.NowValue
end

function S:SetMuteBackstageOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultMuteBackstageOptionSet()
  self:SaveMuteBackstageOptionSetting()
end

function S:SaveMuteBackstageOptionSetting()
  if self.NowValue then
    AudioManager(self):BindLogicToWindowActivatedDeactivated()
  else
    AudioManager(self):UnBindLogicToWindowActivatedDeactivated()
  end
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetCameraYawFollowOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultCameraYawFollowOptionSet()
  self:SaveCameraYawFollowOptionSetting()
end

function S:SaveCameraYawFollowOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:SwitchCameraYawFollow(self.NowValue)
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetShowMonsterNameOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultShowMonsterNameOptionSet()
  self:SaveShowMonsterNameOptionSetting()
end

function S:SaveShowMonsterNameOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
  UE4.UMainBar.SetIsShowMonsterName(self.NowValue)
end

function S:SetDynamicReflectionOldValue()
  self.DynamicReflectionList = {
    [1] = 0,
    [2] = 3
  }
  local NowDynamicReflection = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.SSR.Quality")
  self.OldValue = self:GetOldValue(self.DynamicReflectionList, NowDynamicReflection)
end

function S:RestoreDefaultDynamicReflectionOptionSet()
  self:SaveDynamicReflectionOptionSetting()
end

function S:SaveDynamicReflectionOptionSetting()
  local NowDynamicReflection = self:GetNowValue(self.DynamicReflectionList)
  self.Parent:SaveEMCache(self.EMCacheName, "r.SSR.Quality", NowDynamicReflection)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.SSR.Quality", NowDynamicReflection)
end

function S:SetProjectionEdgeStainingOldValue()
  self.ProjectionEdgeStainingList = {
    [1] = 0,
    [2] = 1
  }
  local NowProjectionEdgeStaining = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.PostProcessing.ShadowRim")
  self.OldValue = self:GetOldValue(self.ProjectionEdgeStainingList, NowProjectionEdgeStaining)
end

function S:RestoreDefaultProjectionEdgeStainingOptionSet()
  self:SaveProjectionEdgeStainingOptionSetting()
end

function S:SaveProjectionEdgeStainingOptionSetting()
  local NowProjectionEdgeStaining = self:GetNowValue(self.ProjectionEdgeStainingList)
  self.Parent:SaveEMCache(self.EMCacheName, "r.PostProcessing.ShadowRim", NowProjectionEdgeStaining)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.PostProcessing.ShadowRim", NowProjectionEdgeStaining)
end

function S:SetVerticalSyncOldValue()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  self.OldValue = GameUserSettings:IsVSyncEnabled()
end

function S:RestoreDefaultVerticalSyncOptionSet()
  self:SaveVerticalSyncOptionSetting()
end

function S:SaveVerticalSyncOptionSetting()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetVSyncEnabled(self.NowValue)
  GameUserSettings:ApplySettings(true)
end

function S:SetAmbientOcclusionOldValue()
  self.AmbientOcclusionList = {
    [1] = 0,
    [2] = 2
  }
  local NowAmbientOcclusion = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.AmbientOcclusionLevels")
  self.OldValue = self:GetOldValue(self.AmbientOcclusionList, NowAmbientOcclusion)
end

function S:RestoreDefaultAmbientOcclusionOptionSet()
  self:SaveAmbientOcclusionOptionSetting()
end

function S:SaveAmbientOcclusionOptionSetting()
  local NowAmbientOcclusion = self:GetNowValue(self.AmbientOcclusionList)
  self.Parent:SaveEMCache(self.EMCacheName, "r.AmbientOcclusionLevels", NowAmbientOcclusion)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.AmbientOcclusionLevels", NowAmbientOcclusion)
end

function S:SetPostEffectOldValue()
  self.PostEffectList = {
    [1] = {
      [1] = 2,
      [2] = 5
    },
    [2] = {
      [1] = 0,
      [2] = 2
    }
  }
  local NowPostEffect = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.BloomQuality")
  self.OldValue = self:GetOldValue(self.PostEffectList[1], NowPostEffect)
end

function S:RestoreDefaultPostEffectOptionSet()
  self:SavePostEffectOptionSetting()
end

function S:SavePostEffectOptionSetting()
  local NowBloomQuality = self:GetNowValue(self.PostEffectList[1])
  local NowLensFlareQuality = self:GetNowValue(self.PostEffectList[2])
  self.Parent:SaveEMCache(self.EMCacheName, "r.BloomQuality", NowBloomQuality)
  self.Parent:SaveEMCache(self.EMCacheName, "r.LensFlareQuality", NowLensFlareQuality)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.BloomQuality", NowBloomQuality)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.LensFlareQuality", NowLensFlareQuality)
end

function S:SetForceFeedbackOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultForceFeedbackOptionSet()
  self:SaveForceFeedbackOptionSetting()
end

function S:SaveForceFeedbackOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(Player, 0)
  PlayerController:SwitchForceFeedback(self.NowValue)
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetForceFeedbackMiniOptionId()
  self.ForceFeedbackScaleList = {
    [1] = 1,
    [2] = 2,
    [3] = 3
  }
  local NowForceFeedback = self.Parent:GetEMCache("ForceFeedbackScale", nil, self.ForceFeedbackScaleList[tonumber(self.MiniOptionDefaultList[1])])
  self.NowMiniOptionId = self:GetOldMiniOptionId(self.ForceFeedbackScaleList, NowForceFeedback)
end

function S:RestoreDefaultMiniOptionForceFeedback()
  self:SaveForceFeedbackMiniOptionSetting()
end

function S:SaveForceFeedbackMiniOptionSetting()
  local MiniOptionCache = self.ForceFeedbackScaleList[self.NowMiniOptionId]
  if not self.NowValue then
    return
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  PlayerController = PlayerController:Cast(UE4.ASinglePlayerController)
  if IsValid(PlayerController) then
    PlayerController:SwitchForceFeedbackScale(MiniOptionCache)
  end
end

function S:SetSkillFaceToOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultSkillFaceToOptionSet()
  self:SaveSkillFaceToOptionSetting()
end

function S:SaveSkillFaceToOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:SetLockOrientpreference(self.NowValue)
  self.OldValue = self.NowValue
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetEnableMobileRotationOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultEnableMobileRotationOptionSet()
  self:SaveEnableMobileRotationOptionSetting()
end

function S:SaveEnableMobileRotationOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:SwitchEnableMobileRotation(self.NowValue)
  self.OldValue = self.NowValue
end

function S:SetFSROldValue()
  self.OldValue = URuntimeCommonFunctionLibrary.GetFSREnabled()
end

function S:RestoreDefaultFSROptionSet()
  self:SaveFSROptionSetting()
end

function S:SaveFSROptionSetting()
  URuntimeCommonFunctionLibrary.SetFSREnabled(self.NowValue)
  self.OldValue = self.NowValue
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetImmersionModelOldValue()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.OldValue = self.DefaultValue
  if not IsValid(Player) then
    return
  end
  self.OldValue = Player.IsImmersionModel
end

function S:RestoreDefaultImmersionModelOptionSet()
  self:SaveImmersionModelOptionSetting()
end

function S:SaveImmersionModelOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  if self.NowValue == false then
    if Player.IsImmersionModel ~= self.NowValue then
      local MenuWorld = UIManager(self):GetUIObj("MenuWorld")
      if MenuWorld then
        MenuWorld.bRecoverImmersionMode = true
      else
        Player:ImmersionModel()
      end
    end
    EventManager:RemoveEvent(EventID.UnLoadUI, self)
  else
    local MenuWorld = UIManager(self):GetUIObj("MenuWorld")
    if MenuWorld then
      MenuWorld.bRecoverImmersionMode = false
      EventManager:RemoveEvent(EventID.UnLoadUI, self)
      EventManager:AddEvent(EventID.UnLoadUI, self, function(self, UIName)
        if "MenuWorld" == UIName then
          if Player.IsImmersionModel ~= self.NowValue then
            Player:ImmersionModel()
          end
          EventManager:RemoveEvent(EventID.UnLoadUI, self)
        end
      end)
    else
      local MenuLevel = UIManager(self):GetUIObj("MenuLevel")
      if MenuWorld then
        EventManager:RemoveEvent(EventID.UnLoadUI, self)
        EventManager:AddEvent(EventID.UnLoadUI, self, function(self, UIName)
          if "MenuLevel" == UIName then
            if Player.IsImmersionModel ~= self.NowValue then
              Player:ImmersionModel()
            end
            EventManager:RemoveEvent(EventID.UnLoadUI, self)
          end
        end)
      end
    end
  end
  self.OldValue = self.NowValue
  self.Parent:SaveEMCache("ImmersionModel", self.EMCacheKey, self.NowValue)
end

function S:Handle_KeyDownOnGamePad(InKeyName)
  if InKeyName == UIConst.GamePadKey.LeftStickRight then
    self:SetSwitcher(true)
    return true
  elseif InKeyName == UIConst.GamePadKey.LeftStickLeft then
    self:SetSwitcher(false)
    return true
  end
  return false
end

function S:Handle_KeyUpOnGamePad(InKeyName)
end

function S:Gamepad_SetHovered(bIsHovered)
end

function S:OnMainBtnClicked()
  if UIUtils.IsGamepadInput() then
    self:OnBtnAreaClicked()
  end
end

function S:OnSubBtnClicked()
  if UIUtils.IsGamepadInput() then
    self:OnClickMiniOptionList()
  end
end

function S:OnMainBtnHovered()
  self.BottomKeyInfos = {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Controller_Switch")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
  local UpdateBottomKeyFunc = self.Parent.Content.UpdateBottomKeyFunc
  UpdateBottomKeyFunc(self.BottomKeyInfos)
end

function S:OnSubBtnHovered()
  self.BottomKeyInfos = {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
  local UpdateBottomKeyFunc = self.Parent.Content.UpdateBottomKeyFunc
  UpdateBottomKeyFunc(self.BottomKeyInfos)
end

function S:GetFirstWidgetToNavigate()
  return self.Bg_Set
end

function S:GetLastWidgetToNavigate()
  if self.VB_Suboption:GetVisibility() ~= UE4.ESlateVisibility.Collapsed and not self.HasBeenForbidden then
    return self.WBP_Set_SuboptionUnfold
  else
    return self.Bg_Set
  end
end

function S:GetBottomKeyInfos()
  return self.BottomKeyInfos or {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Controller_Switch")
    }
  }
end

function S:SetShowBuffEnemyOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultShowBuffEnemyOptionSet()
  self:SaveShowBuffEnemyOptionSetting()
end

function S:SaveShowBuffEnemyOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
  self:UpdateAllBillboardsByConfig()
end

function S:SetShowBuffFriendOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultShowBuffFriendOptionSet()
  self:SaveShowBuffFriendOptionSetting()
end

function S:SaveShowBuffFriendOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
  self:UpdateAllBillboardsByConfig()
end

function S:UpdateAllBillboardsByConfig()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  for Index, Character in pairs(GameState.MonsterMap) do
    if Character and Character.BillboardComponent then
      Character.BillboardComponent:SetBuffPanelVisibilityByConfig()
    end
  end
  for Index, Mechanism in pairs(GameState.MechanismMap) do
    if Mechanism and Mechanism.BillboardComponent then
      Mechanism.BillboardComponent:SetBuffPanelVisibilityByConfig()
    end
  end
end

function S:SetLongPressLockShootingOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultLongPressLockShootingOptionSet()
  self:SaveShowBuffFriendOptionSetting()
end

function S:SaveLongPressLockShootingOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

function S:SetVolumetricLightOldValue()
  self.VolumetricLightList = {
    [1] = 0,
    [2] = 1
  }
  local NowVolumetricLight = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.LightShaftQuality")
  self.OldValue = self:GetOldValue(self.VolumetricLightList, NowVolumetricLight)
end

function S:RestoreDefaultVolumetricLightOptionSet()
  self:SaveVolumetricLightOptionSetting()
end

function S:SaveVolumetricLightOptionSetting()
  local NowVolumetricLight = self:GetNowValue(self.VolumetricLightList)
  self.Parent:SaveEMCache(self.EMCacheName, "r.LightShaftQuality", NowVolumetricLight)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.LightShaftQuality", NowVolumetricLight)
end

function S:SetLocalWindDetailOldValue()
  self.LocalWindDetailList = {
    [1] = 0,
    [2] = 1
  }
  local NowLocalWindDetail = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("foliage.WindEnable")
  self.OldValue = self:GetOldValue(self.LocalWindDetailList, NowLocalWindDetail)
end

function S:RestoreDefaultLocalWindDetailOptionSet()
  self:SaveLocalWindDetailOptionSetting()
end

function S:SaveLocalWindDetailOptionSetting()
  local NowLocalWindDetail = self:GetNowValue(self.LocalWindDetailList)
  self.Parent:SaveEMCache(self.EMCacheName, "foliage.WindEnable", NowLocalWindDetail)
  GWorld.GameInstance:SetGameScalabilityLevelByName("foliage.WindEnable", NowLocalWindDetail)
end

function S:SetAutoJoinOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultAutoJoinOptionSet()
  self:SaveAutoJoinOptionSetting()
end

function S:SaveAutoJoinOptionSetting()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:UpdateRegionOnlineState(self.NowValue)
end

function S:SetHidePlayerOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
  UE4.URegionPlayerManagerSubsystem.SetOnlyShowTeammate(self.OldValue)
end

function S:RestoreDefaultHidePlayerOptionSet()
  self:SaveHideNotTeammatePlayerOptionSetting()
end

function S:SaveHidePlayerOptionSetting()
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
  UE4.URegionPlayerManagerSubsystem.SetOnlyShowTeammate(self.NowValue)
end

function S:SetHideBackWeaponsOldValue()
  self.OldValue = self.Parent:GetEMCache(self.EMCacheName, self.EMCacheKey, self.DefaultValue)
end

function S:RestoreDefaultHideBackWeaponsOptionSet()
  self:SaveHideBackWeaponsOptionSetting()
end

function S:SaveHideBackWeaponsOptionSetting()
  if not AWeaponBase or not AWeaponBase.SetWeaponBackTimerEnabled then
    return
  end
  AWeaponBase.SetWeaponBackTimerEnabled(self, self.NowValue)
  self.Parent:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.NowValue)
end

return S
