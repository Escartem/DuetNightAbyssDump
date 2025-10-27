require("UnLua")
local EMCache = require("EMCache.EMCache")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:OnListItemObjectSet(Content)
  self:PlayAnimation(self.In)
  self.Content = Content
  Content.SelfWidget = self
  self.Cache = Content.Cache
  if self.Cache == "Click" then
    self.Switcher_Option:SetActiveWidget(self.Click)
    self.Click:Init(self, nil, nil, Content)
  elseif self.Cache == "Empty" then
    self.Switcher_Option:SetActiveWidget(self[self.Cache])
    self.Empty:Init(self)
  else
    self.CacheInfo = DataMgr.Option[self.Cache]
    local ControlType = self.CacheInfo.ControlType
    self.Switcher_Option:SetActiveWidget(self[ControlType])
    self[ControlType]:Init(self, self.Cache, self.CacheInfo, Content)
  end
  self:PlayAnimation(self.In)
  self:SetNavigationRuleCustomBoundary(UE4.EUINavigation.Up, {
    self,
    self.OnNavigateUp
  })
  self:SetNavigationRuleCustomBoundary(UE4.EUINavigation.Down, {
    self,
    self.OnNavigateDown
  })
end

function S:OnNavigateUp()
  return self.Content:OnItemNavigateUp(Content, self)
end

function S:OnNavigateDown()
  return self.Content:OnItemNavigateDown(Content, self)
end

function S:GetFirstWidgetToNavigate()
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  return ActiveOptionWidget:GetFirstWidgetToNavigate()
end

function S:GetLastWidgetToNavigate()
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  return ActiveOptionWidget:GetLastWidgetToNavigate()
end

function S:Gamepad_SetHovered(bIsHovered)
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  ActiveOptionWidget:Gamepad_SetHovered(bIsHovered)
  if bIsHovered and self.Content.UpdateBottomKeyFunc then
    self.Content.UpdateBottomKeyFunc(ActiveOptionWidget:GetBottomKeyInfos())
  end
end

function S:Handle_KeyDownOnGamePad(InKeyName)
  local IsHandled = false
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  IsHandled = ActiveOptionWidget:Handle_KeyDownOnGamePad(InKeyName)
  return IsHandled
end

function S:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function S:Handle_KeyUpOnGamePad(InKeyName)
  local IsHandled = false
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  IsHandled = ActiveOptionWidget:Handle_KeyUpOnGamePad(InKeyName)
  return IsHandled
end

function S:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsHandled = self:Handle_KeyUpOnGamePad(InKeyName)
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function S:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.LeftAnalogX then
    local DeltaOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    if DeltaOffset <= -1 then
      self:Handle_KeyDownOnGamePad(UIConst.GamePadKey.LeftStickLeft)
    elseif DeltaOffset >= 1 then
      self:Handle_KeyDownOnGamePad(UIConst.GamePadKey.LeftStickRight)
    end
  end
  return UIUtils.Unhandled
end

function S:OnClickBlankArea()
  self.Content.ParentWidget.Parent:OnClickAllLeftMouseButton()
end

function S:ClearUnfoldState()
  if self.Cache == "Empty" then
    return
  end
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  if ActiveOptionWidget.ClearOpenListState then
    ActiveOptionWidget:ClearOpenListState()
  end
end

function S:OnClickLeftMouseButton()
  if self.Cache == "Empty" then
    return
  end
  local ActiveOptionWidget = self.Switcher_Option:GetActiveWidget()
  if ActiveOptionWidget.OnClickLeftMouseButton then
    ActiveOptionWidget:OnClickLeftMouseButton()
  end
end

function S:RestoreDefaultOptionSet()
  if self.Cache == "Empty" then
    return
  end
  local ControlType = self.CacheInfo.ControlType
  if "Scroll" == ControlType then
    self.Scroll:RestoreDefaultOptionSet()
  elseif "UnFold" == ControlType then
    self.UnFold:RestoreDefaultOptionSet()
  elseif "Switch" == ControlType then
    self.Switch:RestoreDefaultOptionSet()
  end
end

function S:RestoreOldValueOptionSet()
  if self.Cache == "Empty" then
    return
  end
  local ControlType = self.CacheInfo.ControlType
  if "Scroll" == ControlType then
    self.Scroll:RestoreOldValueOptionSet()
  end
end

function S:SaveOptionSetting()
  if self.Cache == "Empty" then
    return
  end
  local ControlType = self.CacheInfo.ControlType
  if "Scroll" == ControlType then
    self.Scroll:SaveOptionSetting()
  elseif "UnFold" == ControlType then
    self.UnFold:SaveOptionSetting()
  elseif "Switch" == ControlType then
    self.Switch:SaveOptionSetting()
  end
end

function S:OnParentTabSwitch()
  self:ClearUnfoldState()
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

return S
