local M = Class({
  "BluePrints.Common.StageTimerMgr"
})

function M:Initialize(Initializer)
  rawset(self, "ListenEvent", {})
end

function M:EMPreConstruct()
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
end

function M:AddDispatcher(EventName, Obj, Func)
  if type(Func) ~= "function" then
    return
  end
  if EventID[EventName] == nil then
    return
  end
  if not self.ListenEvent then
    self.ListenEvent = {}
  end
  EventManager:AddEvent(EventName, Obj, Func)
  self.ListenEvent[EventName] = Obj
end

function M:RemoveDispatcher(EventName)
  if not self.ListenEvent or self.ListenEvent[EventName] == nil then
    return
  end
  EventManager:RemoveEvent(EventName, self.ListenEvent[EventName])
  self.ListenEvent[EventName] = nil
end

function M:RemoveAllDispatcher()
  if rawget(self, "ListenEvent") then
    for k, v in pairs(self.ListenEvent) do
      EventManager:RemoveEvent(k, v)
    end
  end
  if self.RemoveInputMethodChangedListen and type(self.RemoveInputMethodChangedListen) == "function" then
    self:RemoveInputMethodChangedListen()
  end
  self.ListenEvent = {}
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    if self.CheckNeedAutoFocusWithInputType and self:CheckNeedAutoFocusWithInputType() then
      DebugPrint("BP_EMUserWidgetUtils_C RefreshOpInfoByInputDevice, Change to Gamepad Input And Auto Focus, UIName is", self.WidgetName or self:GetName())
      if type(self.SetFocus_Lua) == "function" then
        self:SetFocus_Lua()
      else
        self:SetFocus()
      end
    end
  elseif CurInputDevice == ECommonInputType.Touch then
  end
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
end

function M:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:CheckNeedAutoFocusWithInputType()
  local TopUIWidget = UIManager(self):GetWidgetObjInTopStack()
  local LastestCreateWidget = UIManager(self):GetLastestAndFocusableUIWidgetObj()
  if self == TopUIWidget and self == LastestCreateWidget then
    return true
  else
    return false
  end
end

function M:AddTimer(Interval, Func, IsLoop, Delay, Key, IsRealTime, ...)
  if nil == IsRealTime then
    IsRealTime = true
  end
  return M.Super.AddTimer(self, Interval, Func, IsLoop, Delay, Key, IsRealTime, UE4.ETickingGroup.TG_EndPhysics, ...)
end

function M:GetPosition(Widget)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
  if nil ~= CanvasSlot then
    return CanvasSlot:GetPosition()
  end
end

function M:SetPosition(Widget, Pos)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
  if nil ~= CanvasSlot then
    return CanvasSlot:SetPosition(Pos)
  end
end

function M:GetPreciseDecimal(nNum, n)
  if type(nNum) ~= "number" then
    return nNum
  end
  n = n or 0
  n = math.floor(n)
  if n < 0 then
    n = 0
  end
  local nDecimal = 10 ^ n
  local nTemp = math.floor(nNum * nDecimal)
  local nRet = nTemp / nDecimal
  return nRet
end

function M:GetTimeStr(DeltaTime)
  local TimeStr = ""
  local h = math.modf(DeltaTime / 3600)
  local m = math.modf((DeltaTime - h * 3600) / 60)
  local s = math.modf(DeltaTime - h * 3600 - m * 60)
  if 0 == h then
    TimeStr = ""
  elseif h < 10 then
    TimeStr = TimeStr .. "0" .. tostring(h) .. ":"
  else
    TimeStr = TimeStr .. tostring(h) .. ":"
  end
  if m < 10 then
    TimeStr = TimeStr .. "0" .. tostring(m)
  else
    TimeStr = TimeStr .. tostring(m)
  end
  TimeStr = TimeStr .. ":"
  if s < 10 then
    TimeStr = TimeStr .. "0" .. tostring(s)
  else
    TimeStr = TimeStr .. tostring(s)
  end
  return TimeStr
end

function M:UpdateListViewScrollMultiplier(ListViewObj, NewWheelScrollMultiplier)
  if nil == ListViewObj then
    return
  end
  ListViewObj:SetWheelScrollMultiplier(NewWheelScrollMultiplier)
end

function M:Destruct()
  self:CleanTimer()
  self:RemoveAllDispatcher()
end

return M
