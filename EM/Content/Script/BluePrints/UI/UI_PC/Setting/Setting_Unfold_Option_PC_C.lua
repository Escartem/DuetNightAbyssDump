require("UnLua")
local EMCache = require("EMCache.EMCache")
local SettingUtils = require("Utils.SettingUtils")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:Construct()
  self.WBP_Set_SuboptionUnfold.Button_Drag.OnClicked:Add(self, self.OnBtnDragClicked)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnClicked:Add(self, self.OnClickMiniOptionList)
  self.Button_Area.OnClicked:Add(self, self.OnClickSubOptionList)
  self.Button_Area.OnHovered:Add(self, self.OnBtnAreaHover)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnHovered:Add(self, self.OnSubBtnAreaHover)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnAreaUnHover)
  self.WBP_Set_SuboptionUnfold.Button_Area.OnUnhovered:Add(self, self.OnSubBtnAreaUnHover)
  self.Bg_Set.Button_Base.OnClicked:Add(self, self.OnMainBtnClicked)
  self.WBP_Set_SuboptionUnfold.Bg_Set.Button_Base.OnClicked:Add(self, self.OnSubBtnClicked)
  self.Bg_Set.Button_Base.OnHovered:Add(self, self.OnMainBtnHovered)
  self.WBP_Set_SuboptionUnfold.Bg_Set.Button_Base.OnHovered:Add(self, self.OnSubBtnHovered)
end

function S:Destruct()
  if self.bHavaChangeViewport ~= nil then
    EventManager:RemoveEvent(EventID.GameViewportSizeChanged, self)
    EventManager:RemoveEvent(EventID.RefreshVoiceName, self)
  end
end

function S:Init(Parent, CacheName, CacheInfo)
  rawset(self, "Parent", Parent.Content and Parent.Content.ParentWidget.Parent or Parent)
  rawset(self, "CacheName", CacheName)
  rawset(self, "CacheInfo", CacheInfo)
  rawset(self, "IsListOpen", false)
  rawset(self, "HaveMiniOption", false)
  rawset(self, "HasBeenForbidden", false)
  rawset(self, "UnFoldTextList", CacheInfo.UnFoldText)
  rawset(self, "DefaultValue", CacheInfo.DefaultValue)
  rawset(self, "SubListOffset", 15)
  rawset(self, "NowOptionId", 1)
  rawset(self, "OldOptionId", 1)
  self.EMCacheName = self.CacheInfo.EMCacheName
  self.EMCacheKey = self.CacheInfo.EMCacheKey
  self.Text_Option:SetText(GText(self.CacheInfo.CacheText))
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    if self.CacheInfo.UnFoldTextM then
      self.UnFoldTextList = self.CacheInfo.UnFoldTextM
    end
    if self.CacheInfo.DefaultValueM then
      self.DefaultValue = self.CacheInfo.DefaultValueM
    end
  end
  self:UpdateDefaultValue()
  self:InitOptionEMCache()
  self:SetHoverVisibility()
  self:InitMiniOptionList(true)
  local CurrText = GText(self.CacheInfo.UnFoldText[self.NowOptionId])
  if nil == CurrText then
    CurrText = self.UnFoldTextList[self.NowOptionId]
  end
  self.Text_Current:SetText(CurrText)
end

function S:UpdateDefaultValue()
  if not self.EMCacheName then
    return
  end
  if self["Update" .. self.EMCacheName .. "DefaultValue"] then
    self["Update" .. self.EMCacheName .. "DefaultValue"](self)
  end
end

function S:DynamicCalSubOptionText()
  if self.CacheInfo.SubOptionText[1] then
    local str = self.CacheInfo.SubOptionText[1]
    local startIndex = string.find(str, "_")
    if startIndex then
      local result = string.sub(str, startIndex + 1)
      if "Resolution" == result then
        self.FirstValidResolution = nil
        local OriginSubOptionText = CommonConst.ResolutionTable[self.NowOptionId - 2]
        local SubOptionText = {
          GText("UI_OPTION_Resolution_Cusrtom")
        }
        local SceneManager = GWorld.GameInstance:GetSceneManager()
        local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
        local MonitorResolution = GameUserSettings:GetDesktopResolution()
        ScreenPrint("Yklua CurrentWindowSize  by GameUserSettings:GetDesktopResolution():  " .. MonitorResolution.X .. "x" .. MonitorResolution.Y)
        MonitorResolution = SceneManager:GetMonitorResolution()
        ScreenPrint("Yklua CurrentWindowSize  by SceneManager:GetMonitorResolution(): " .. MonitorResolution.X .. "x" .. MonitorResolution.Y)
        if nil == OriginSubOptionText then
          OriginSubOptionText = {}
          OriginSubOptionText[1] = {
            MonitorResolution.X,
            MonitorResolution.Y
          }
          SubOptionText = {
            string.format("%dx%d", MonitorResolution.X, MonitorResolution.Y)
          }
          self.WBP_Set_SuboptionUnfold.Image_Unfold:SetVisibility(UE4.ESlateVisibility.Collapsed)
          self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
          self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
          self.NeedForceForbidden = true
        else
          self.NeedForceForbidden = false
          for index, value in ipairs(OriginSubOptionText) do
            if value[1] <= MonitorResolution.X and value[2] <= MonitorResolution.Y then
              if self.FirstValidResolution == nil then
                self.FirstValidResolution = value
              end
              table.insert(SubOptionText, GText(self.ResolutionStrTable[self.NowOptionId - 2][index]))
            end
          end
        end
        self.MiniOptionTextList = SubOptionText
        if 1 == #SubOptionText then
          local copy = {}
          for key, value in pairs(self.MiniOptionDefaultList) do
            copy[key] = value
          end
          self.MiniOptionDefaultList = copy
          self.MiniOptionDefaultList[self.NowOptionId] = 1
          self.bForceMaxResolution = true
        end
      end
    end
  end
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
  self.Parent:AddHoverContent(self)
end

function S:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent:RemoveHoverContent(self)
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

function S:InitMiniOptionList(IsInit)
  if self.CacheInfo.SubOptionName then
    self.HaveMiniOption = true
    self.MiniOptionTextList = self.CacheInfo.SubOptionText
    self.MiniOptionDefaultList = self.CacheInfo.SubOptionDefaultValue
    if self.CacheInfo.SubOptionText and 0 ~= self.MiniOptionDefaultList[self.NowOptionId] and string.match(self.CacheInfo.SubOptionText[1], "^" .. "Dynamic") then
      self:DynamicCalSubOptionText()
    end
    self.VB_Suboption:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Set_SuboptionUnfold.Text_Option:SetText(GText(self.CacheInfo.SubOptionName))
    self.WBP_Set_SuboptionUnfold.Image_Unfold:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.MiniOptionDefaultList and 0 == self.MiniOptionDefaultList[self.NowOptionId] then
      self.NowMiniOptionId = 0
      if not self.HasBeenForbidden then
        self.HasBeenForbidden = true
        self.WBP_Set_SuboptionUnfold:PlayAnimation(self.WBP_Set_SuboptionUnfold.Forbidden)
        self.WBP_Set_SuboptionUnfold.Text_Current:SetText("")
        self.WBP_Set_SuboptionUnfold.Image_Unfold:SetVisibility(UE4.ESlateVisibility.Collapsed)
        self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
        self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      if IsInit and self["Set" .. self.CacheName .. "MiniOptionId"] then
        self["Set" .. self.CacheName .. "MiniOptionId"](self)
      end
    else
      self:SetMiniOption(IsInit)
    end
    if self.NeedForceForbidden then
      self.HasBeenForbidden = true
      self.WBP_Set_SuboptionUnfold:PlayAnimation(self.WBP_Set_SuboptionUnfold.Forbidden)
      self.WBP_Set_SuboptionUnfold:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      self.WBP_Set_SuboptionUnfold.Image_Unfold:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" and not self.HasBeenForbidden then
      self.WBP_Set_SuboptionUnfold:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.WBP_Set_SuboptionUnfold.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
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
    self.NowMiniOptionId = self.MiniOptionDefaultList[self.NowOptionId]
  end
  self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.Forbidden)
  self.HasBeenForbidden = false
  self.WBP_Set_SuboptionUnfold.Text_Current:SetText(GText(self.MiniOptionTextList[self.NowMiniOptionId]))
end

function S:OnBtnDragClicked()
  self.Parent:OnClickAllLeftMouseButton()
end

function S:InitOptionEMCache()
  if self["Set" .. self.CacheName .. "OldOptionId"] then
    self.IsOverallPerformanceCustom = GWorld.GameInstance:GetOverallScalabilityLevel() == CommonConst.OverallPerformanceCustom
    self["Set" .. self.CacheName .. "OldOptionId"](self)
  else
    self.OldOptionId = tonumber(self.DefaultValue)
  end
  self.NowOptionId = self.OldOptionId
  if self.EMCacheName == "GameUserSettings" or self.EMCacheName == "ConsoleVariable" or self.EMCacheName == "AntiAliasing" or self.EMCacheName == "ContentPerformance" or self.CacheName == "MobileResolution" then
    self["Save" .. self.CacheName .. "OptionSetting"](self)
  end
end

function S:SetOldOptionId(List, NowSet, IsTable)
  for Id, Value in pairs(List) do
    if IsTable then
      if Value[1] == NowSet[1] and Value[2] == NowSet[2] then
        return Id
      end
    elseif Value == NowSet then
      return Id
    end
  end
  return tonumber(self.DefaultValue)
end

function S:OnClickSubOptionList()
  if self:IsAnimationPlaying(self.Openlist) then
    return
  end
  UIUtils.PlayCommonBtnSe(self)
  if self.IsListOpen then
    self.IsListOpen = false
    self.Parent:SetSettingUnfoldListPC(false)
    self:PlayAnimationReverse(self.Openlist)
    if UIUtils.IsGamepadInput() then
      self.Bg_Set:SetFocus()
    end
  else
    self.Parent:ClearSettingListUnfoldState()
    self.IsListOpen = true
    if self.UnFoldTextList then
      self:InitSubOptionList()
    end
    self.Parent:SetSettingUnfoldListPC(true)
    if UIUtils.IsGamepadInput() then
      self.Parent:BindUnfoldListClosedCallback(function()
        self:OnClickLeftMouseButton()
        self.Bg_Set:SetFocus()
      end)
    end
    self:StopAnimation(self.Openlist)
    self:PlayAnimation(self.Openlist)
    local SelfGeometry = self.Button_Area:GetCachedGeometry()
    local ParentGeometry = self.Parent.Panel_Option:GetCachedGeometry()
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
    self.Parent:UpdateUnfoldListPosition(EndAbsolutePosition, IsUpper)
  end
end

function S:InitSubOptionList()
  local MainPanel = self.Parent
  MainPanel.WBP_Set_UnfoldList.SubOption_List:ClearListItems()
  for key, value in pairs(self.UnFoldTextList) do
    local OptionContent = NewObject(UIUtils.GetCommonItemContentClass())
    OptionContent.Id = key
    OptionContent.Text = GText(value)
    OptionContent.IsDownloadText = self.CacheName == "SystemVoice" and not self:GetVoiceResByIndex(key) and GText("UI_Option_Language_Unload")
    OptionContent.SelectedOptionId = self.NowOptionId
    OptionContent.ParentWidget = self
    OptionContent.ClickCallBack = "OnClickChangeSubOption"
    MainPanel.WBP_Set_UnfoldList.SubOption_List:AddItem(OptionContent)
  end
end

function S:RefreshOptionOnClick(SelectOptionId)
  local IsNeedSave = false
  if self.NowOptionId ~= SelectOptionId then
    self.Parent:ChangeUnfoldListSelection(SelectOptionId)
    IsNeedSave = true
  end
  self.NowOptionId = SelectOptionId
  self.Text_Current:SetText(GText(self.UnFoldTextList[self.NowOptionId]))
  self:OnClickSubOptionList()
  if IsNeedSave then
    self:SaveOptionSetting()
  end
  self:InitMiniOptionList()
  self:SaveMiniOptionSetting()
end

function S:OnClickChangeSubOption(SelectOptionId)
  local Res = self:CheckOnClickChangeSubOption(SelectOptionId)
  if not Res then
    return
  end
  self:RefreshOptionOnClick(SelectOptionId)
end

function S:CheckOnClickChangeSubOption(SelectOptionId)
  if self["Check" .. self.CacheName .. "OptionSetting"] then
    return self["Check" .. self.CacheName .. "OptionSetting"](self, SelectOptionId)
  end
  return true
end

function S:OnClickMiniOptionList()
  if self.HasBeenForbidden then
    return
  end
  if self:IsAnimationPlaying(self.OpenMinilist) then
    return
  end
  UIUtils.PlayCommonBtnSe(self)
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.Parent:SetSettingUnfoldListPC(false)
    self:PlayAnimationReverse(self.OpenMinilist)
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    if UIUtils.IsGamepadInput() then
      self.WBP_Set_SuboptionUnfold:SetFocus()
    end
  else
    self.Parent:ClearSettingListUnfoldState()
    self.IsMiniListOpen = true
    if self.MiniOptionTextList then
      self:InitMiniSubOptionList()
    end
    self.Parent:SetSettingUnfoldListPC(true)
    if UIUtils.IsGamepadInput() then
      self.Parent:BindUnfoldListClosedCallback(function()
        self:OnClickLeftMouseButton()
        self.WBP_Set_SuboptionUnfold:SetFocus()
      end)
    end
    self.WBP_Set_SuboptionUnfold:StopAnimation(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.WBP_Set_SuboptionUnfold:PlayAnimation(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    local SelfGeometry = self.WBP_Set_SuboptionUnfold.Button_Area:GetCachedGeometry()
    local ParentGeometry = self.Parent.Panel_Option:GetCachedGeometry()
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
    self.Parent:UpdateUnfoldListPosition(EndAbsolutePosition, IsUpper)
  end
end

function S:InitMiniSubOptionList()
  self.Parent.WBP_Set_UnfoldList.SubOption_List:ClearListItems()
  for key, value in pairs(self.MiniOptionTextList) do
    local OptionContent = NewObject(UIUtils.GetCommonItemContentClass())
    OptionContent.Id = key
    OptionContent.Text = GText(value)
    OptionContent.ParentWidget = self
    OptionContent.SelectedOptionId = self.NowMiniOptionId
    OptionContent.ClickCallBack = "OnClickChangeMiniOption"
    self.Parent.WBP_Set_UnfoldList.SubOption_List:AddItem(OptionContent)
  end
end

function S:OnClickChangeMiniOption(SelectOptionId)
  if not self.HaveMiniOption then
    return
  end
  if self.NowMiniOptionId ~= SelectOptionId then
    self.Parent:ChangeUnfoldListSelection(SelectOptionId)
  end
  self.NowMiniOptionId = SelectOptionId
  self.WBP_Set_SuboptionUnfold.Text_Current:SetText(GText(self.MiniOptionTextList[self.NowMiniOptionId]))
  self:OnClickMiniOptionList()
  self:SaveMiniOptionSetting()
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
    self.Parent:SetSettingUnfoldListPC(false)
    if UIUtils.IsGamepadInput() then
      self.Bg_Set:SetFocus()
    end
  end
  if self.IsMiniListOpen then
    self.IsMiniListOpen = false
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.Parent:SetSettingUnfoldListPC(false)
  end
end

function S:CheckSettingIsChange()
  return self.OldOptionId ~= self.NowOptionId
end

function S:RestoreDefaultOptionSet()
  self.NowOptionId = tonumber(self.DefaultValue)
  self.Text_Current:SetText(GText(self.UnFoldTextList[self.NowOptionId]))
  if self.IsListOpen then
    self.IsListOpen = false
    self.WBP_Set_SuboptionUnfold:PlayAnimationReverse(self.WBP_Set_SuboptionUnfold.OpenMinilist)
    self.Parent:SetSettingUnfoldListPC(false)
  end
  if self["RestoreDefault" .. self.CacheName] then
    self["RestoreDefault" .. self.CacheName](self)
  else
    self.OldOptionId = tonumber(self.DefaultValue)
  end
  self.OldOptionId = self.NowOptionId
  self:InitMiniOptionList()
  self:RestoreDefaultMiniOption()
end

function S:SaveOptionSetting()
  if self["Save" .. self.CacheName .. "OptionSetting"] then
    if self.EMCacheName == "GameUserSettings" or self.EMCacheName == "ConsoleVariable" or self.EMCacheName == "AntiAliasing" or self.EMCacheName == "ContentPerformance" or self.CacheName == "MobileResolution" then
      GWorld.GameInstance.SetOverallScalabilityLevelSimple(CommonConst.OverallPerformanceCustom)
      if self.Parent.OverallPreset then
        self.Parent.OverallPreset:RefreshOverallPreset()
      end
    end
    self["Save" .. self.CacheName .. "OptionSetting"](self)
  else
    self.OldOptionId = tonumber(self.DefaultValue)
  end
  self.OldOptionId = self.NowOptionId
end

function S:RestoreDefaultMiniOption()
  if not self.HasBeenForbidden and self["RestoreDefaultMiniOption" .. self.CacheName] then
    self["RestoreDefaultMiniOption" .. self.CacheName](self)
  end
end

function S:SaveMiniOptionSetting()
  if self["Save" .. self.CacheName .. "MiniOptionSetting"] then
    if self.EMCacheName == "GameUserSettings" or self.EMCacheName == "ConsoleVariable" or self.EMCacheName == "AntiAliasing" or self.EMCacheName == "ContentPerformance" then
      GWorld.GameInstance.SetOverallScalabilityLevelSimple(CommonConst.OverallPerformanceCustom)
      if self.Parent.OverallPreset then
        self.Parent.OverallPreset:RefreshOverallPreset()
      end
    end
    self["Save" .. self.CacheName .. "MiniOptionSetting"](self)
  end
end

function S:GetEMCache(CacheName, CacheKey, DefaultValue)
  local CacheData = EMCache:Get(CacheName)
  if type(CacheData) ~= "table" and type(CacheData) ~= type(DefaultValue) then
    self:SaveEMCache(CacheName, CacheKey, DefaultValue)
    return DefaultValue
  end
  if nil == CacheData then
    self:SaveEMCache(CacheName, CacheKey, DefaultValue)
    return DefaultValue
  elseif CacheKey then
    if CacheData[CacheKey] then
      return CacheData[CacheKey]
    end
    self:SaveEMCache(CacheName, CacheKey, DefaultValue)
    return DefaultValue
  else
    return CacheData
  end
  return DefaultValue
end

function S:SaveEMCache(CacheName, CacheKey, CacheValue)
  local CacheData = EMCache:Get(CacheName)
  if CacheKey then
    if CacheData then
      CacheData[CacheKey] = CacheValue
    else
      CacheData = {}
      CacheData[CacheKey] = CacheValue
    end
  else
    CacheData = CacheValue
  end
  EMCache:Set(CacheName, CacheData)
end

function S:SetSystemLanguageOldOptionId()
  self.SystemLanguageList = {
    [1] = "CN",
    [2] = "EN",
    [3] = "JP",
    [4] = "KR",
    [5] = "TC",
    [6] = "DE",
    [7] = "FR",
    [8] = "ES"
  }
  local NowSystemLanguage = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.SystemLanguageList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.SystemLanguageList, NowSystemLanguage)
end

function S:RestoreDefaultSystemLanguage()
  self:SaveSystemLanguageOptionSetting()
end

function S:SaveSystemLanguageOptionSetting()
  self.OptionCache = self.SystemLanguageList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  if self:CheckSettingIsChange() then
    local Params = {}
    
    function Params.RightCallbackFunction()
      self:OnClickConfirmReconnect()
    end
    
    UIManager(self):ShowCommonPopupUI(100075, Params, self.Parent)
  end
end

function S:OnClickConfirmReconnect()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance:InitGameSystemLanguage()
  GWorld.NetworkMgr:OnDisconnectAndLoginAgain()
end

function S:InitGameSystemLanguage()
  local ESCMenu = UIManager(self):GetUI("CommonSetup")
  if ESCMenu then
    ESCMenu:InitSetupList()
  end
  local BattleMain = UIManager(self):GetUI("BattleMain")
  if BattleMain then
    BattleMain:InitBtnList()
  end
  self.Parent:InitCommonTab(self.Parent.NewTabId, true)
end

function S:SetCameraBackOldOptionId()
  self.CameraBackList = {
    [1] = "Forbidden",
    [2] = "SkillOnly",
    [3] = "Enable"
  }
  local NowCameraBack = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.CameraBackList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.CameraBackList, NowCameraBack)
end

function S:RestoreDefaultCameraBack()
  self:SaveCameraBackOptionSetting()
end

function S:SaveCameraBackOptionSetting()
  self.OptionCache = self.CameraBackList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  Player:EnableAutoResetCameraPitch(self.OptionCache)
end

function S:SetInterfaceModeOldOptionId()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  self.InterfaceModeList = {
    [1] = EWindowMode.Fullscreen,
    [2] = EWindowMode.WindowedFullscreen,
    [3] = EWindowMode.Windowed,
    [4] = EWindowMode.Windowed,
    [5] = EWindowMode.Windowed,
    [6] = EWindowMode.Windowed
  }
  self.ResolutionStrTable = {}
  for key, subTable in pairs(CommonConst.ResolutionTable) do
    self.ResolutionStrTable[key] = {}
    for _, value in ipairs(subTable) do
      local str = string.format("%dx%d", value[1], value[2])
      table.insert(self.ResolutionStrTable[key], str)
    end
  end
  local NowInterfaceMode = GameUserSettings:GetFullscreenMode()
  self.OldOptionId = self:SetOldOptionId(self.InterfaceModeList, NowInterfaceMode)
  if self.OldOptionId >= 3 then
    local ScreenScaleList = {
      [12] = 3,
      [16] = 4,
      [21] = 5,
      [23] = 6
    }
    local Resolution = GameUserSettings:GetScreenResolution()
    local Index = Resolution.X * CommonConst.ScreenScale / Resolution.Y
    Index = math.floor(Index + 0.5)
    if nil == ScreenScaleList[Index] then
      Index = CommonConst.DefaultScreenScale
    end
    self.OldOptionId = ScreenScaleList[Index]
  end
end

function S:RestoreDefaultInterfaceMode()
  self:SaveInterfaceModeOptionSetting()
end

function S:SaveInterfaceModeOptionSetting()
  self.OptionCache = self.InterfaceModeList[self.NowOptionId]
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if nil == SceneManager then
    return
  end
  if self.bHavaChangeViewport ~= true then
    self.bHavaChangeViewport = true
  end
  if self.OptionCache == EWindowMode.Windowed then
  else
    SceneManager:ResizeWindow(self.OptionCache)
  end
end

function S:OnViewPortChanged()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowInterfaceMode = GameUserSettings:GetFullscreenMode()
  if NowInterfaceMode ~= EWindowMode.Windowed then
    return
  end
  if self.bHavaChangeViewport == true then
    self.bHavaChangeViewport = false
  else
    self.NowMiniOptionId = 1
    self.WBP_Set_SuboptionUnfold.Text_Current:SetText(GText(self.MiniOptionTextList[self.NowMiniOptionId]))
  end
end

function S:SetInterfaceModeMiniOptionId()
  EventManager:AddEvent(EventID.GameViewportSizeChanged, self, self.OnViewPortChanged)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local Resolution = GameUserSettings:GetScreenResolution()
  self.ScreenScaleList = {
    [12] = 4,
    [16] = 3,
    [21] = 2,
    [23] = 1
  }
  local Index = Resolution.X * CommonConst.ScreenScale / Resolution.Y
  Index = math.floor(Index + 0.5)
  if self.ScreenScaleList[Index] == nil then
    Index = CommonConst.DefaultScreenScale
  end
  local ResolutionStr = Resolution.X .. "x" .. Resolution.Y
  local SelectId
  for ID, value in ipairs(self.MiniOptionTextList) do
    if value == ResolutionStr then
      SelectId = ID
    end
  end
  if nil == SelectId then
    SelectId = 1
  end
  self.NowMiniOptionId = SelectId
  self.bHavaChangeViewport = false
end

function S:RestoreDefaultMiniOptionInterfaceMode()
  self:SaveInterfaceModeMiniOptionSetting()
end

function S:ForceCalMaxResolution()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local Resolution = GameUserSettings:GetDesktopResolution()
  local Ratios = {
    [3] = 12,
    [4] = 16,
    [5] = 21,
    [6] = 23
  }
  local maxWidth, maxHeight = self:AdjustResolutionToAspectRatio(Ratios[self.NowOptionId], 9, Resolution.X, Resolution.Y)
  return {X = maxWidth, Y = maxHeight}
end

function S:AdjustResolutionToAspectRatio(targetWidthRatio, targetHeightRatio, screenMaxWidth, screenMaxHeight)
  local targetAspectRatio = targetWidthRatio / targetHeightRatio
  local screenAspectRatio = screenMaxWidth / screenMaxHeight
  if targetAspectRatio > screenAspectRatio then
    local newHeight = math.floor(screenMaxWidth / targetAspectRatio)
    newHeight = math.max(newHeight, 1)
    return screenMaxWidth, newHeight
  else
    local newWidth = math.floor(screenMaxHeight * targetAspectRatio)
    newWidth = math.max(newWidth, 1)
    return newWidth, screenMaxHeight
  end
end

function S:SaveInterfaceModeMiniOptionSetting()
  if self.bHavaChangeViewport ~= true then
    self.bHavaChangeViewport = true
  end
  if self.NowOptionId <= 2 then
    return
  end
  local index = self.NowMiniOptionId
  if 1 == index and true ~= self.bForceMaxResolution then
    return
  end
  if true == self.bForceMaxResolution then
    self.bForceMaxResolution = false
    local NewResolution = self:ForceCalMaxResolution()
    local SceneManager = GWorld.GameInstance:GetSceneManager()
    SceneManager.RatioCache = FIntPoint(NewResolution.X, NewResolution.Y)
    SceneManager:ResizeWindow(EWindowMode.Windowed, NewResolution.X, NewResolution.Y)
    return
  end
  local MiniOptionCacheText = self.MiniOptionTextList[index]
  local num1, num2 = MiniOptionCacheText:match("(%d+)x(%d+)")
  num1 = tonumber(num1)
  num2 = tonumber(num2)
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if SceneManager then
    SceneManager.RatioCache = FIntPoint(num1, num2)
    SceneManager:ResizeWindow(EWindowMode.Windowed, num1, num2)
  end
end

function S:SetOverallPresetOldOptionId()
  self.OverallPresetList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
    [6] = -1
  }
  local NowOverallPreset = GWorld.GameInstance:GetOverallScalabilityLevel()
  self.Parent.OverallPreset = self
  self.OldOptionId = self:SetOldOptionId(self.OverallPresetList, NowOverallPreset)
end

function S:RestoreDefaultOverallPreset()
  self:SaveOverallPresetOptionSetting(true)
end

function S:SaveOverallPresetOptionSetting(IsRestore)
  self.OptionCache = self.OverallPresetList[self.NowOptionId]
  if self.OptionCache == CommonConst.OverallPerformanceCustom then
    self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  else
    self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
    GWorld.GameInstance.SetOverallScalabilityLevel(self.OptionCache)
    SettingUtils.InitAntiAliasingCache(self.OptionCache)
    SettingUtils.InitMobileResolution(self.OptionCache)
    if not IsRestore then
      self.Parent:OnTabSelected(self.Parent.CurrentWidget, true)
    end
  end
end

function S:RefreshOverallPreset()
  local NowOverallPreset = GWorld.GameInstance:GetOverallScalabilityLevel()
  self.NowOptionId = self:SetOldOptionId(self.OverallPresetList, NowOverallPreset)
  local CurrText = GText(self.UnFoldTextList[self.NowOptionId])
  if nil == CurrText then
    CurrText = self.UnFoldTextList[self.NowOptionId]
  end
  self.Text_Current:SetText(CurrText)
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, NowOverallPreset)
end

function S:SetContentPerformanceOldOptionId()
  self.ContentPerformanceList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  local CacheIndex = EMCache:Get(self.CacheName)
  if self.IsOverallPerformanceCustom and nil ~= CacheIndex then
    self.OldOptionId = CacheIndex
  else
    local NowContentPerformance = GWorld.GameInstance:GetGameplayScalabilityLevel()
    self.OldOptionId = self:SetOldOptionId(self.ContentPerformanceList, NowContentPerformance)
  end
end

function S:RestoreDefaultContentPerformance()
  self:SaveContentPerformanceOptionSetting()
end

function S:SaveContentPerformanceOptionSetting()
  self.OptionCache = self.ContentPerformanceList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  self:SaveEMCache(self.CacheName, nil, self.NowOptionId)
  GWorld.GameInstance.SetGameplayScalabilityLevel(self.OptionCache)
end

function S:SetDLSSOldOptionId()
  self.DLSSScaleList = {
    [1] = 0,
    [2] = 1,
    [3] = 4,
    [4] = 5,
    [5] = 6,
    [6] = 7,
    [7] = 2
  }
  local NowDLSS = 1
  if UDLSSLibrary then
    NowDLSS = UDLSSLibrary.GetDLSSMode()
  end
  local NowOptionId = NowDLSS
  self.OldOptionId = self:SetOldOptionId(self.DLSSScaleList, NowOptionId)
end

function S:RestoreDefaultDLSS()
  self:SaveDLSSOptionSetting()
end

function S:SaveDLSSOptionSetting()
  self.OptionCache = self.DLSSScaleList[self.NowOptionId]
  EMCache:Set("DLSS", self.OptionCache)
  if UDLSSLibrary then
    local OptionCache = self.OptionCache
    if 3 == OptionCache then
      OptionCache = 1
    end
    UDLSSLibrary.SetDLSSMode(OptionCache)
  end
end

function S:SetDLSSMiniOptionId()
  self.DLSSFGList = {
    [1] = 0,
    [2] = 251,
    [3] = 17,
    [4] = 23,
    [5] = 31
  }
  local NowDLSSFG = 1
  if UStreamlineLibraryDLSSG then
    NowDLSSFG = UStreamlineLibraryDLSSG.GetDLSSGMode()
  end
  local NowOptionId = NowDLSSFG
  self.NowMiniOptionId = self:SetOldOptionId(self.DLSSFGList, NowOptionId)
end

function S:RestoreDefaultMiniOptionDLSS()
  self:SaveDLSSMiniOptionSetting()
end

function S:SaveDLSSMiniOptionSetting()
  local MiniOptionCache = self.DLSSFGList[self.NowMiniOptionId]
  EMCache:Set("DLSSFG", MiniOptionCache)
  if UStreamlineLibraryDLSSG then
    UStreamlineLibraryDLSSG.SetDLSSGMode(MiniOptionCache)
  end
end

function S:SetTeammateEffectsOldOptionId()
  self.TeammateEffectsList = {
    [1] = 0,
    [2] = 1,
    [3] = 2
  }
  local NowTeammateEffect = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.TeammateEffectsList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.TeammateEffectsList, NowTeammateEffect)
end

function S:RestoreDefaultTeammateEffects()
  self:SaveTeammateEffectsOptionSetting()
end

function S:SaveTeammateEffectsOptionSetting()
  self.OptionCache = self.TeammateEffectsList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  UEMGameInstance.SetFriendFXQuality(self.OptionCache)
end

function S:UpdateTeammateEffectsDefaultValue()
  local NowContentPerformance = GWorld.GameInstance:GetGameplayScalabilityLevel()
  if NowContentPerformance <= 1 then
    self.DefaultValue = "1"
  end
end

function S:SetEffectQualityOldOptionId()
  self.EffectQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowEffectQuality = GameUserSettings:GetVisualEffectQuality()
  self.OldOptionId = self:SetOldOptionId(self.EffectQualityList, NowEffectQuality)
end

function S:RestoreDefaultEffectQuality()
  self:SaveEffectQualityOptionSetting()
end

function S:SaveEffectQualityOptionSetting()
  self.OptionCache = self.EffectQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "VisualEffectQuality", self.OptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetVisualEffectQuality(self.OptionCache)
  GameUserSettings:ApplySettings(true)
end

function S:SetAntiAliasingOldOptionId()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and self.CacheInfo.UnFoldTextM then
    self.AntiAliasingList = {
      [1] = 0,
      [2] = 2
    }
  else
    self.AntiAliasingList = {
      [1] = 0,
      [2] = 2,
      [3] = 4
    }
  end
  local NowAntiAliasing = URuntimeCommonFunctionLibrary.GetAntiAliasingMethodType()
  self.OldOptionId = self:SetOldOptionId(self.AntiAliasingList, NowAntiAliasing)
end

function S:RestoreDefaultAntiAliasing()
  self:SaveAntiAliasingOptionSetting()
end

function S:SaveAntiAliasingOptionSetting()
  self.OptionCache = self.AntiAliasingList[self.NowOptionId]
  URuntimeCommonFunctionLibrary.SetAntiAliasingMethodType(self.OptionCache)
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
end

function S:SetAntiAliasingMiniOptionId()
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowAntiAliasingQuality = GameUserSettings:GetAntiAliasingQuality()
  self.AntiAliasingQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  self.NowMiniOptionId = self:SetOldOptionId(self.AntiAliasingQualityList, NowAntiAliasingQuality, false)
end

function S:RestoreDefaultMiniOptionAntiAliasing()
  self:SaveAntiAliasingMiniOptionSetting()
end

function S:SaveAntiAliasingMiniOptionSetting()
  local MiniOptionCache = self.AntiAliasingQualityList[self.NowMiniOptionId]
  self:SaveEMCache("GameUserSettings", "AntiAliasingQuality", MiniOptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetAntiAliasingQuality(MiniOptionCache)
  GameUserSettings:ApplySettings(true)
end

function S:SetMaterialQualityOldOptionId()
  self.MaterialQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowMaterialQuality = GameUserSettings:GetShadingQuality()
  self.OldOptionId = self:SetOldOptionId(self.MaterialQualityList, NowMaterialQuality)
end

function S:RestoreDefaultMaterialQuality()
  self:SaveMaterialQualityOptionSetting()
end

function S:SaveMaterialQualityOptionSetting()
  self.OptionCache = self.MaterialQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "ShadingQuality", self.OptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetShadingQuality(self.OptionCache)
  GameUserSettings:ApplySettings(true)
end

function S:SetShadowQualityOldOptionId()
  self.ShadowQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowShadowQuality = GameUserSettings:GetShadowQuality()
  self.OldOptionId = self:SetOldOptionId(self.ShadowQualityList, NowShadowQuality)
end

function S:RestoreDefaultShadowQuality()
  self:SaveShadowQualityOptionSetting()
end

function S:SaveShadowQualityOptionSetting()
  self.OptionCache = self.ShadowQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "ShadowQuality", self.OptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetShadowQuality(self.OptionCache)
  GameUserSettings:ApplySettings(true)
end

function S:SetDetailDistanceOldOptionId()
  self.DetailDistanceList = {
    [1] = 0,
    [2] = 1,
    [3] = 2
  }
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local NowDetailDistance = GameUserSettings:GetViewDistanceQuality()
  self.OldOptionId = self:SetOldOptionId(self.DetailDistanceList, NowDetailDistance)
end

function S:RestoreDefaultDetailDistance()
  self:SaveDetailDistanceOptionSetting()
end

function S:SaveDetailDistanceOptionSetting()
  self.OptionCache = self.DetailDistanceList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "ViewDistanceQuality", self.OptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  GameUserSettings:SetViewDistanceQuality(self.OptionCache)
  GameUserSettings:ApplySettings(true)
end

function S:SetHUDSizeOldOptionId()
  self.HUDSizeList = {}
  for _, ValStr in ipairs(self.UnFoldTextList) do
    table.insert(self.HUDSizeList, tonumber(table.pack(string.gsub(ValStr, "%%", ""))[1]) * 0.01)
  end
  local NowHUDSize = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.HUDSizeList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.HUDSizeList, NowHUDSize)
end

function S:RestoreDefaultHUDSize()
  self:SaveHUDSizeOptionSetting()
end

function S:SaveHUDSizeOptionSetting()
  self.OptionCache = self.HUDSizeList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  UE.UUIFunctionLibrary.SetGameDPI(self.OptionCache)
end

function S:SetMaterialFilterOldOptionId()
  self.MaterialFilterList = {
    [1] = 1,
    [2] = 2,
    [3] = 4,
    [4] = 8,
    [5] = 16
  }
  local NowMaterialFilter = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.MaxAnisotropy")
  self.OldOptionId = self:SetOldOptionId(self.MaterialFilterList, NowMaterialFilter)
end

function S:RestoreDefaultMaterialFilter()
  self:SaveMaterialFilterOptionSetting()
end

function S:SaveMaterialFilterOptionSetting()
  self.OptionCache = self.MaterialFilterList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "r.MaxAnisotropy", self.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.MaxAnisotropy", self.OptionCache)
end

function S:SetModelDetailsOldOptionId()
  self.ModelDetailsList = {
    [1] = 1,
    [2] = 1,
    [3] = 0
  }
  local NowModelDetails = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.SkeletalMeshLODBias")
  self.OldOptionId = self:SetOldOptionId(self.ModelDetailsList, NowModelDetails)
end

function S:RestoreDefaultModelDetails()
  self:SaveModelDetailsOptionSetting()
end

function S:SaveModelDetailsOptionSetting()
  self.OptionCache = self.ModelDetailsList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "r.SkeletalMeshLODBias", self.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.SkeletalMeshLODBias", self.OptionCache)
end

function S:SetLocalAtomizationOldOptionId()
  self.LocalAtomizationList = {
    [1] = {
      [1] = 0,
      [2] = 1,
      [3] = 1,
      [4] = 1
    },
    [2] = {
      [2] = 32,
      [3] = 16,
      [4] = 16
    },
    [3] = {
      [2] = 16,
      [3] = 32,
      [4] = 64
    }
  }
  local NowLocalAtomization = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.VolumetricFog")
  if NowLocalAtomization == self.LocalAtomizationList[1][1] then
    self.OldOptionId = 1
  else
    NowLocalAtomization = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.VolumetricFog.GridSizeZ")
    self.OldOptionId = self:SetOldOptionId(self.LocalAtomizationList[3], NowLocalAtomization)
  end
end

function S:RestoreDefaultLocalAtomization()
  self:SaveLocalAtomizationOptionSetting()
end

function S:SaveLocalAtomizationOptionSetting()
  self.OptionCache = self.LocalAtomizationList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "r.VolumetricFog", self.LocalAtomizationList[1][self.NowOptionId])
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog", self.LocalAtomizationList[1][self.NowOptionId])
  if 1 ~= self.NowOptionId then
    self:SaveEMCache(self.EMCacheName, "r.VolumetricFog.GridPixelSize", self.LocalAtomizationList[2][self.NowOptionId])
    self:SaveEMCache(self.EMCacheName, "r.VolumetricFog.GridSizeZ", self.LocalAtomizationList[3][self.NowOptionId])
    GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog.GridPixelSize", self.LocalAtomizationList[2][self.NowOptionId])
    GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog.GridSizeZ", self.LocalAtomizationList[3][self.NowOptionId])
  end
end

function S:SetDepthQualityOldOptionId()
  self.DepthQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4
  }
  local NowDepthQuality = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.DepthOfFieldQuality")
  self.OldOptionId = self:SetOldOptionId(self.DepthQualityList, NowDepthQuality)
end

function S:RestoreDefaultDepthQuality()
  self:SaveDepthQualityOptionSetting()
end

function S:SaveDepthQualityOptionSetting()
  self.OptionCache = self.DepthQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "r.DepthOfFieldQuality", self.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.DepthOfFieldQuality", self.OptionCache)
end

function S:SetRefractiveQualityOldOptionId()
  self.RefractiveQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3
  }
  local NowRefractiveQuality = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.RefractionQuality")
  self.OldOptionId = self:SetOldOptionId(self.RefractiveQualityList, NowRefractiveQuality)
end

function S:RestoreDefaultRefractiveQuality()
  self:SaveRefractiveQualityOptionSetting()
end

function S:SaveRefractiveQualityOptionSetting()
  self.OptionCache = self.RefractiveQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, "r.RefractionQuality", self.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.RefractionQuality", self.OptionCache)
end

function S:SetScreenQualityOldOptionId()
  self.ScreenQualityList = {
    [1] = 1,
    [2] = 2,
    [3] = 4
  }
  local NowScreenQuality = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.ScreenQualityList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.ScreenQualityList, NowScreenQuality)
end

function S:RestoreDefaultScreenQuality()
  self:SaveScreenQualityOptionSetting()
end

function S:SaveScreenQualityOptionSetting()
  self.OptionCache = self.ScreenQualityList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
end

function S:SetScreenFilterOldOptionId()
  self.ScreenFilterList = {
    [1] = 1,
    [2] = 2,
    [3] = 0
  }
  local NowScreenFilter = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.ScreenFilterList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.ScreenFilterList, NowScreenFilter)
end

function S:RestoreDefaultScreenFilter()
  self:SaveScreenFilterOptionSetting()
end

function S:SaveScreenFilterOptionSetting()
  self.OptionCache = self.ScreenFilterList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  local EnvironmentManager = UE4.UGameplayStatics.GetActorOfClass(self, UE4.AEnvironmentManager:StaticClass())
  EnvironmentManager = EnvironmentManager or self:GetWorld():SpawnActor(LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C"))
  EnvironmentManager:SetPosLUT(self.OptionCache)
end

function S:SetGamepadPresetOldOptionId()
  self.OldOptionId = self:GetEMCache(self.EMCacheName, self.EMCacheKey, tonumber(self.DefaultValue))
end

function S:RestoreDefaultGamepadPreset()
end

function S:SaveGamepadPresetOptionSetting()
  local RealOptionId = self:GetEMCache(self.EMCacheName, self.EMCacheKey, tonumber(self.DefaultValue))
  self.Parent.HasBeenChanged = RealOptionId ~= self.NowOptionId and "GamepadPresetSave" or false
  self.Parent:UpdateKeyboardBottonKey()
  self.Parent:RefreshAllGamePadOperator(self.NowOptionId)
end

function S:SaveGamepadPresetOptionSettingInLocal()
  self:SaveGamepadPreset()
end

function S:RestoreDefaultGamepadPresetInLocal()
  self.NowOptionId = 1
  self:SaveGamepadPreset()
end

function S:SaveGamepadPreset()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, tonumber(self.NowOptionId))
  if IsValid(Player) then
    Player:SwitchGamepadSet(tonumber(self.NowOptionId))
  end
  self.Text_Current:SetText(GText(self.UnFoldTextList[self.NowOptionId]))
  self.Parent:RefreshAllGamePadOperator(tonumber(self.NowOptionId))
end

function S:GetGamepadPresetOptionContentText()
  return GText("UI_OPTION_Gamepad_Preset" .. self.NowOptionId)
end

function S:RestoreOldGamepadPresetInLocal()
  self.NowOptionId = self:GetEMCache(self.EMCacheName, self.EMCacheKey, tonumber(self.DefaultValue))
  self:SaveGamepadPreset()
end

function S:SetFpsOldOptionId()
  self.FpsList = {
    [1] = 30,
    [2] = 45,
    [3] = 60,
    [4] = 90,
    [5] = 120,
    [6] = CommonConst.MaxFPS
  }
  local NowFps = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.FpsList[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.FpsList, NowFps)
end

function S:RestoreDefaultFps()
  self:SaveFpsOptionSetting()
end

function S:SaveFpsOptionSetting()
  self.OptionCache = self.FpsList[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  local FramePace = self.OptionCache
  if 45 == self.OptionCache then
    FramePace = 60
  end
  if self.OptionCache == CommonConst.MaxFPS then
    GWorld.GameInstance:SetUnfixedFrameRate()
  else
    GameUserSettings:SetFrameRateLimit(self.OptionCache)
    GameUserSettings:ApplySettings(true)
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "r.SetFramePace " .. FramePace, nil)
  end
  DebugPrint("---jzn---SaveFpsOptionSetting----", self.OptionCache)
end

function S:Handle_KeyDownOnGamePad(InKeyName)
  return false
end

function S:Handle_KeyUpOnGamePad(InKeyName)
end

function S:Gamepad_SetHovered(bIsHovered)
end

function S:OnMainBtnClicked()
  if UIUtils.IsGamepadInput() then
    self:OnClickSubOptionList()
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
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
  self.Parent:UpdateBottomKey(self.BottomKeyInfos)
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
  self.Parent:UpdateBottomKey(self.BottomKeyInfos)
end

function S:GetBottomKeyInfos()
  return self.BottomKeyInfos or {}
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

function S:SetSystemVoiceOldOptionId()
  self:RefreshVoiceTextInfo()
  local CacheName = self:GetEMCache(self.EMCacheName, self.EMCacheKey, self.VoiceTextMap[tonumber(self.DefaultValue)])
  self.OldOptionId = self:SetOldOptionId(self.VoiceTextMap, CacheName)
  EventManager:RemoveEvent(EventID.RefreshVoiceName, self)
  EventManager:AddEvent(EventID.RefreshVoiceName, self, self.SaveSystemVoiceCallBack)
end

function S:RefreshVoiceTextInfo()
  self.VoiceTextMap = {}
  local CacheName = TArray("")
  for Index, Text in ipairs(self.UnFoldTextList) do
    local EndVoiceName = string.split(Text, "_")
    self.VoiceTextMap[Index] = EndVoiceName[#EndVoiceName]
    CacheName:Add(self.VoiceTextMap[Index])
  end
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  self.VoiceDownloadedRes = HotUpdateSubsystem:IsVoicesDownloaded(CacheName):ToTable()
end

function S:SetVoiceResByIndex(Index, Res)
  if not self.VoiceTextMap then
    return
  end
  if not self.VoiceTextMap[Index] then
    return
  end
  self.VoiceDownloadedRes[self.VoiceTextMap[Index]] = Res
end

function S:GetVoiceResByIndex(Index)
  if not Index then
    return
  end
  if not self.VoiceTextMap then
    return
  end
  if not self.VoiceTextMap[Index] then
    return
  end
  return self.VoiceDownloadedRes[self.VoiceTextMap[Index]]
end

function S:RestoreDefaultSystemVoice()
  self:SaveSystemVoiceOptionSetting()
end

function S:CheckSystemVoiceOptionSetting(SelectOptionId)
  self.CheckSelectOptionId = SelectOptionId
  if self:GetVoiceResByIndex(SelectOptionId) then
    return true
  else
    self:ShowVoiceResourcePopup(self.CheckSelectOptionId)
    return false
  end
end

function S:SaveSystemVoiceOptionSetting()
  self.OptionCache = self.VoiceTextMap[self.NowOptionId]
  self:SaveEMCache(self.EMCacheName, self.EMCacheKey, self.OptionCache)
  self.Text_Current:SetText(GText(self.UnFoldTextList[self.NowOptionId]))
  CommonConst.SystemVoice = self.OptionCache
  AudioManager(self):SetVoiceLanguage(CommonConst.SystemVoice)
end

function S:SaveSystemVoiceCallBack()
  self:RefreshVoiceTextInfo()
  if self.CheckSelectOptionId then
    if self:GetVoiceResByIndex(self.CheckSelectOptionId) then
      self:RefreshOptionOnClick(self.CheckSelectOptionId)
    elseif self:GetVoiceResByIndex(self.NowOptionId) then
      self:RefreshOptionOnClick(self.NowOptionId)
    else
      self:RefreshOptionOnClick(1)
    end
    self.CheckSelectOptionId = nil
  elseif not self:GetVoiceResByIndex(self.NowOptionId) then
    self:RestoreDefaultOptionSet()
  end
end

function S:ShowVoiceResourcePopup(InSelectOptionId)
  local SelectOptionId = InSelectOptionId
  local UsedLanguageIndex
  if not self.VoiceTextMap then
    self.VoiceTextMap = {}
    for Index, Text in ipairs(self.UnFoldTextList) do
      local EndVoiceName = string.split(Text, "_")
      self.VoiceTextMap[Index] = EndVoiceName[#EndVoiceName]
    end
  end
  for k, v in pairs(self.VoiceTextMap) do
    if v == CommonConst.SystemVoice then
      UsedLanguageIndex = k
      if not SelectOptionId then
        SelectOptionId = k
      end
      break
    end
  end
  local PopUPUI
  
  local function ClickFunction(_, PakckageData)
    local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
    if not HotUpdateSubsystem then
      return
    end
    if not PakckageData then
      return
    end
    local Data = PakckageData.Content_1
    if not Data then
      return
    end
    PopUPUI.DontCloseWhenRightBtnClicked = false
    local OptionalPatchAssetState = Data.OptionalPatchAssetState
    if OptionalPatchAssetState == EOptionalPatchAssetState.Downloading then
      PopUPUI.DontCloseWhenRightBtnClicked = true
      local bPaused = HotUpdateSubsystem:IsPatchOptionSignPaused(Data.OptionalPatchAssetSign)
      if bPaused then
        HotUpdateSubsystem:TryStartUpdate(Data.OptionalPatchAssetSign, {
          Data.OptionalPatchAssetSign
        }, true)
      else
        if not HotUpdateSubsystem:PauseDownloadOptionalPatchAssets(Data.OptionalPatchAssetSign, Data.OptionalPatchAssetSign) then
          UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Pause_Unable"))
        end
        PopUPUI.Contents[1]:RefreshDownloadedVoiceState(false)
      end
    elseif OptionalPatchAssetState == EOptionalPatchAssetState.Downloaded then
      self:ShowUninstallPopup(Data.OptionalPatchAssetSign, Data.CurrentIndex, PopUPUI)
    elseif Data.BytesSoFar > 0 then
      HotUpdateSubsystem:TryStartUpdate(Data.OptionalPatchAssetSign, {
        Data.OptionalPatchAssetSign
      }, true)
    else
      self:ShowDownloadPopup(Data.OptionalPatchAssetSign, Data.OptionalPatchAssetSign, Data.CurrentIndex, Data.TotalBytes)
    end
  end
  
  local Params = {
    OptionText = self.UnFoldTextList,
    Options = self.VoiceTextMap,
    CurrentLanguageIndex = SelectOptionId or 1,
    CurrentUseLanguageIndex = UsedLanguageIndex or 1,
    RightCallbackFunction = ClickFunction,
    ForbiddenRightCallbackFunction = ClickFunction,
    OnCloseCallbackFunction = function()
      self:RefreshVoiceTextInfo()
    end
  }
  PopUPUI = UIManager(self):ShowCommonPopupUI(100254, Params)
end

function S:ShowDownloadPopup(DownloadTag, PatchSign, InCurrentIndex, TotalBytes)
  local TotalMB = TotalBytes / 1024 / 1024
  if TotalMB < 1 then
    TotalMB = 1
  end
  TotalMB = math.ceil(TotalMB)
  local Params = {
    ShortText = string.format(GText("UI_OPTION_Language_Download_Confirm"), GText(self.UnFoldTextList[InCurrentIndex]), TotalMB),
    DontPlayOutAnimation = true,
    RightCallbackFunction = function()
      local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
      if not HotUpdateSubsystem then
        return
      end
      HotUpdateSubsystem:TryStartUpdate(DownloadTag, {PatchSign}, true)
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end,
    LeftCallbackFunction = function()
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end,
    CloseBtnCallbackFunction = function()
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end
  }
  UIManager(self):ShowCommonPopupUI(100255, Params)
end

function S:ShowUninstallPopup(PatchSign, InCurrentIndex, PopUI)
  local CurrentSelectOptionId = self.CheckSelectOptionId or 1
  for k, v in pairs(self.VoiceTextMap) do
    if v == CommonConst.SystemVoice then
      CurrentSelectOptionId = k
      break
    end
  end
  if CurrentSelectOptionId == InCurrentIndex then
    PopUI.DontCloseWhenRightBtnClicked = true
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Using"))
    return
  end
  local Params = {
    ShortText = string.format(GText("UI_OPTION_Language_Unload_Confirm"), GText(self.UnFoldTextList[InCurrentIndex])),
    DontPlayOutAnimation = true,
    RightCallbackFunction = function()
      local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
      if not HotUpdateSubsystem then
        return
      end
      if not HotUpdateSubsystem:UninstallOptionalPatchAssets(PatchSign) then
        UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Fail"))
      else
        UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Success"))
      end
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end,
    LeftCallbackFunction = function()
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end,
    CloseBtnCallbackFunction = function()
      self:ShowVoiceResourcePopup(InCurrentIndex)
    end
  }
  UIManager(self):ShowCommonPopupUI(100256, Params)
end

function S:SetMobileResolutionOldOptionId()
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName then
    self.MobileResolutionList = {
      [1] = {
        80,
        60,
        576
      },
      [2] = {
        90,
        70,
        648
      },
      [3] = {
        115,
        80,
        900
      }
    }
  elseif "IOS" == PlatformName then
    self.MobileResolutionList = {
      [1] = {
        75,
        75,
        0
      },
      [2] = {
        80,
        80,
        0
      },
      [3] = {
        115,
        115,
        0
      }
    }
  else
    DebugPrint(ErrorTag, "----jzn---\231\167\187\229\138\168\231\171\175\229\136\134\232\190\168\231\142\135 \229\189\147\229\137\141\229\185\179\229\143\176\228\184\141\230\152\175Anroid\230\136\150IOS----", PlatformName)
  end
  self.OldOptionId = self:GetEMCache(self.CacheName, self.EMCacheKey, tonumber(self.DefaultValue))
end

function S:RestoreDefaultMobileResolution()
  self:SaveMobileResolutionOptionSetting()
end

function S:SaveMobileResolutionOptionSetting()
  self.OptionCache = self.MobileResolutionList[self.NowOptionId]
  if not self.OptionCache then
    return
  end
  GWorld.GameInstance.SetScreenPercentageLevel(self.OptionCache[1], self.OptionCache[2], self.OptionCache[3])
  self:SaveEMCache(self.CacheName, self.EMCacheKey, self.NowOptionId)
end

return S
