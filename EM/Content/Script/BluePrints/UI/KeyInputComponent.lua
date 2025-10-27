local M = {}

function M:Initialize()
  self:ClearAllKeyEvents()
end

function M:ClearAllKeyEvents()
  self.KeyDownEvents = {}
  self.KeyUpEvents = {}
  self.IsKeyDown = {}
  self.IsLongPressing = {}
  self.LongPressEvents = {}
end

function M:ClearKeyDownEvents()
  self.KeyDownEvents = {}
end

function M:AddKeyDownEvent(KeyName, Func)
  self.KeyDownEvents[KeyName] = Func
end

function M:RemoveKeyDownEvent(KeyName)
  self.KeyDownEvents[KeyName] = nil
end

function M:HasKeyDownEvent(KeyName)
  return self.KeyDownEvents[KeyName] ~= nil
end

function M:ClearKeyUpEvents()
  self.KeyUpEvents = {}
end

function M:AddKeyUpEvent(KeyName, Func)
  self.KeyUpEvents[KeyName] = Func
end

function M:RemoveKeyUpEvent(KeyName)
  self.KeyUpEvents[KeyName] = nil
end

function M:HasKeyUpEvent(KeyName)
  return self.KeyUpEvents[KeyName] ~= nil
end

function M:ClearLongPressEvents()
  self.IsLongPressing = {}
  self.LongPressEvents = {}
end

function M:AddLongPressEvent(KeyName, Duration, StartCB, CancelCB, EndCB)
  self.LongPressEvents[KeyName] = {
    Duration = Duration,
    StartCB = StartCB,
    CancelCB = CancelCB,
    EndCB = EndCB
  }
end

function M:RemoveLongPressEvent(KeyName)
  self.LongPressEvents[KeyName] = nil
end

function M:HasLongPressEvent(KeyName)
  return self.LongPressEvents[KeyName] ~= nil
end

function M:GetLongPressAnimationTime(KeyName)
  if self.LongPressEvents[KeyName] then
    return self.LongPressEvents[KeyName].Duration - Const.ShortPressThreshold * 2
  end
end

function M:ProcessOnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local LongPressEvent = self.LongPressEvents[InKeyName] or {}
  if not self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = true
    if LongPressEvent.Duration then
      local TimerKey = InKeyName .. "_LongPress"
      self:AddTimer(Const.ShortPressThreshold, function()
        if self.IsKeyDown[InKeyName] then
          self.IsLongPressing[InKeyName] = true
          self:AddTimer(LongPressEvent.Duration - Const.ShortPressThreshold, function()
            if self.IsLongPressing[InKeyName] and LongPressEvent.EndCB then
              LongPressEvent.EndCB(self)
            end
          end, false, 0, TimerKey .. "End")
          if LongPressEvent.StartCB then
            LongPressEvent.StartCB(self)
          end
        end
      end, false, 0, TimerKey)
    end
  end
  local KeyDownEvent = self.KeyDownEvents[InKeyName]
  if KeyDownEvent then
    return KeyDownEvent(self)
  end
end

function M:ProcessOnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = false
    local IsLongPresssing = self.IsLongPressing[InKeyName]
    self.IsLongPressing[InKeyName] = false
    local TimerKey = InKeyName .. "_LongPress"
    self:RemoveTimer(TimerKey)
    if IsLongPresssing then
      self:RemoveTimer(TimerKey .. "End")
      local LongPressEvent = self.LongPressEvents[InKeyName] or {}
      if LongPressEvent.CancelCB then
        LongPressEvent.CancelCB(self)
      end
      return UIUtils.Handled, true
    end
  end
  local KeyUpEvent = self.KeyUpEvents[InKeyName]
  if KeyUpEvent then
    return KeyUpEvent(self)
  end
end

return M
