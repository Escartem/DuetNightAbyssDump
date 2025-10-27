local M = Class()
local bUseRawSetOpt = true

function M:EMAfterInitialize()
  if not bUseRawSetOpt then
    return
  end
  self.ScrollBoxies = {}
  if not self.NamedWidgetMap then
    return
  end
  for Key, Value in pairs(self.NamedWidgetMap) do
    rawset(self, Key, Value)
    if Value:IsA(UScrollBox) and Value.SetControlScrollbarInside then
      table.insert(self.ScrollBoxies, Value)
    end
  end
  if not self.UIAnimationsMap then
    return
  end
  for Key, Value in pairs(self.UIAnimationsMap) do
    rawset(self, Key, Value)
  end
  self:ProcessAndroidSafeZoneRule()
end

function M:PreConstruct(IsDesignTime)
  self.Overridden.PreConstruct(self, IsDesignTime)
  if IsDesignTime then
    return
  end
  local bPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  if self.ScrollBoxies and bPC then
    for _, ScrollBox in ipairs(self.ScrollBoxies) do
      self:_SetUpScrollBox(ScrollBox)
    end
  end
  self:EMPreConstruct()
end

function M:EMPreConstruct()
end

function M:_SetUpScrollBox(Value)
  local bMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if bMobile then
    Value:SetControlScrollbarInside(false)
  else
    Value:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
    Value:SetControlScrollbarInside(true)
  end
end

function M:_SetUpScrollBoxRStickInput(ScrollView, ScrollSpeed, bIsReserve)
  self.TargetScrollBoxWithRStickInput = ScrollView
  self.ScrollOffsetOfEndOfSBox = ScrollView:GetScrollOffsetOfEnd()
  self.ScrollSpeedRStickOfSBox = ScrollSpeed or 10.0
  self.bReserveSBoxScrollDir = bIsReserve and 1 or -1
end

function M:_SetUpListViewRStickInput(ListView, ScrollSpeed, bIsReserve)
  self.TargetListViewWithRStickInput = ListView
  self.ScrollOffsetOfEndOfList = ListView:GetScrollOffsetOfEnd()
  self.ScrollSpeedRStickOfList = ScrollSpeed or 1.0
  self.bReserveListScrollDir = bIsReserve and 1 or -1
end

function M:HandleOnEMGameViewportChange()
  self:ProcessAndroidSafeZoneRule()
end

function M:ProcessAndroidSafeZoneRule()
  local PlatformName = UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName then
    if not self.MainSafeZone then
      return
    end
    local DeviceMake = ULowEntryExtendedStandardLibrary.GetAndroidDeviceMake()
    if not DataMgr.AndroidSafeZoneRule[DeviceMake] then
      return
    end
    local DeviceModel = ULowEntryExtendedStandardLibrary.GetAndroidDeviceModel()
    if not DataMgr.AndroidSafeZoneRule[DeviceMake][DeviceModel] then
      return
    end
    local VSize = UWidgetLayoutLibrary.GetViewportSize(self)
    local SpecialSafeZoneRule = DataMgr.AndroidSafeZoneRule[DeviceMake][DeviceModel][VSize.X][VSize.Y]
    if SpecialSafeZoneRule then
      if not SpecialSafeZoneRule.UDPadding or 0 == SpecialSafeZoneRule.UDPadding then
        self.MainSafeZone.PadTop = false
        self.MainSafeZone.PadBottom = false
      else
        self.MainSafeZone.PadTop = true
        self.MainSafeZone.PadBottom = true
      end
      if not SpecialSafeZoneRule.LRPadding or 0 == SpecialSafeZoneRule.LRPadding then
        self.MainSafeZone.PadLeft = false
        self.MainSafeZone.PadRight = false
      else
        self.MainSafeZone.PadLeft = true
        self.MainSafeZone.PadRight = true
      end
      for _, Child in pairs(self.MainSafeZone:GetAllChildren()) do
        local Slot = UWidgetLayoutLibrary.SlotAsSafeBoxSlot(Child)
        Slot.Padding.Top = SpecialSafeZoneRule.UDPadding
        Slot.Padding.Bottom = SpecialSafeZoneRule.UDPadding
        Slot.Padding.Left = SpecialSafeZoneRule.LRPadding
        Slot.Padding.Right = SpecialSafeZoneRule.LRPadding
        if self.MainSafeZone.ForceSetSafeMargin then
          self.MainSafeZone:ForceSetSafeMargin(Slot.Padding.Left, Slot.Padding.Right, Slot.Padding.Top, Slot.Padding.Bottom)
        end
      end
    else
      self.MainSafeZone.PadTop = false
      self.MainSafeZone.PadBottom = false
      self.MainSafeZone.PadLeft = true
      self.MainSafeZone.PadRight = true
    end
    local bPadLeft = self.MainSafeZone.PadLeft
    local bPadRight = self.MainSafeZone.PadRight
    local bPadTop = self.MainSafeZone.PadTop
    local bPadBottom = self.MainSafeZone.PadBottom
    self.MainSafeZone:SetSidesToPad(bPadLeft, bPadRight, bPadTop, bPadBottom)
  end
end

return M
