require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct(ChildBtn)
  rawset(self, "Btn", ChildBtn)
  rawset(self, "ClickLogics", {})
  rawset(self, "ForbidLogics", {})
  rawset(self, "PressLogics", {})
  rawset(self, "ReleaseLogics", {})
  rawset(self, "SoundFunc", self.PlayButtonClickSound)
  rawset(self, "ForbidSoundFunc", self.PlayForbiddenButtonPressSound)
  rawset(self, "IsForbidden", false)
  rawset(self, "IsPressing", false)
  rawset(self, "IsHovering", false)
  rawset(self, "TestNum", 0)
  rawset(self, "CurrentClickIsForbid", false)
  rawset(self, "IsDestroied", false)
  rawset(self, "LongPressDuration", 0.5)
  rawset(self, "IsLongPressButton", false)
  rawset(self, "PressTime", nil)
  rawset(self, "LongPressClickFunc", nil)
  self:BindButtonPerformances()
  self:PlayAnimation(self.Normal)
end

function M:TryOverrideSoundFunc(NewSoundFunc)
  if NewSoundFunc then
    self.SoundFunc = NewSoundFunc
  end
end

function M:ResetSoundFunc()
  self.SoundFunc = self.PlayButtonClickSound
end

function M:TryOverrideLongPressClickFunc(NewLongPressClickFunc)
  if NewLongPressClickFunc then
    self.LongPressClickFunc = NewLongPressClickFunc
  end
end

function M:ResetLongPressClickFunc()
  self.LongPressClickFunc = nil
end

function M:Destruct()
  self:UnBindButtonPerformances()
  self.ClickLogics = {}
  self.ForbidLogics = {}
  self.PressLogics = {}
  self.ReleaseLogics = {}
  self.IsDestroied = true
end

function M:BindEventOnClicked(Obj, Event, ...)
  if not Obj or not Event then
    return
  end
  if not self.ClickLogics[Obj] then
    self.ClickLogics[Obj] = {}
  end
  table.insert(self.ClickLogics[Obj], {
    Event = Event,
    Params = {
      ...
    }
  })
end

function M:BindSingleEventOnClicked(Obj, Event, ...)
  if not Obj or not Event then
    return
  end
  self.ClickLogics[Obj] = {
    {
      Event = Event,
      Params = {
        ...
      }
    }
  }
end

function M:BindForbidStateExecuteEvent(Obj, Event, ...)
  if not Obj or not Event then
    return
  end
  if not self.ForbidLogics[Obj] then
    self.ForbidLogics[Obj] = {}
  end
  table.insert(self.ForbidLogics[Obj], {
    Event = Event,
    Params = {
      ...
    }
  })
end

function M:BindEventOnPressed(Obj, Event, ...)
  if not Obj or not Event then
    return
  end
  if not self.PressLogics[Obj] then
    self.PressLogics[Obj] = {}
  end
  table.insert(self.PressLogics[Obj], {
    Event = Event,
    Params = {
      ...
    }
  })
end

function M:BindEventOnReleased(Obj, Event, ...)
  if not Obj or not Event then
    return
  end
  if not self.ReleaseLogics[Obj] then
    self.ReleaseLogics[Obj] = {}
  end
  table.insert(self.ReleaseLogics[Obj], {
    Event = Event,
    Params = {
      ...
    }
  })
end

function M:UnBindEventOnClicked(Obj, Event)
  if not Obj or not Event then
    return
  end
  if self.ClickLogics[Obj] then
    local temp_table = {}
    for i, v in pairs(self.ClickLogics[Obj]) do
      if v.Event ~= Event then
        table.insert(temp_table, v)
      end
    end
    self.ClickLogics[Obj] = temp_table
  end
  if self.ForbidLogics[Obj] then
    local temp_table = {}
    for i, v in pairs(self.ForbidLogics[Obj]) do
      if v.Event ~= Event then
        table.insert(temp_table, v)
      end
    end
    self.ForbidLogics[Obj] = temp_table
  end
end

function M:UnBindEventOnPressed(Obj, Event)
  if not Obj or not Event then
    return
  end
  if self.PressLogics[Obj] then
    local temp_table = {}
    for i, v in pairs(self.PressLogics[Obj]) do
      if v.Event ~= Event then
        table.insert(temp_table, v)
      end
    end
    self.PressLogics[Obj] = temp_table
  end
end

function M:UnBindEventOnReleased(Obj, Event)
  if not Obj or not Event then
    return
  end
  if self.ReleaseLogics[Obj] then
    local temp_table = {}
    for i, v in pairs(self.ReleaseLogics[Obj]) do
      if v.Event ~= Event then
        table.insert(temp_table, v)
      end
    end
    self.ReleaseLogics[Obj] = temp_table
  end
end

function M:UnBindEventOnClickedByObj(Obj)
  if not Obj then
    return
  end
  if self.ClickLogics[Obj] then
    self.ClickLogics[Obj] = nil
  end
  if self.ForbidLogics[Obj] then
    self.ForbidLogics[Obj] = nil
  end
end

function M:BindButtonPerformances()
  local Btn = self.Btn
  Btn.OnClicked:Add(self, self.OnBtnClicked)
  Btn.OnPressed:Add(self, self.OnBtnPressed)
  Btn.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    Btn.OnHovered:Add(self, self.OnBtnHovered)
    Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  local Btn = self.Btn
  if not Btn then
    return
  end
  Btn.OnClicked:Clear()
  Btn.OnPressed:Clear()
  Btn.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    Btn.OnHovered:Clear()
    Btn.OnUnhovered:Clear()
  end
end

function M:PlayButtonClickSound()
  UIUtils.PlayCommonBtnSe(self)
end

function M:PlayButtonClickAnimation()
  self:PlayAnimation(self.Click)
end

function M:OnBtnClicked()
  local ExecuteLogics
  if self.CurrentClickIsForbid ~= self.IsForbidden then
    return
  end
  if self.IsForbidden == true then
    ExecuteLogics = self.ForbidLogics
  else
    ExecuteLogics = self.ClickLogics
    self:PlayButtonClickAnimation()
  end
  if not self:CouldExecuteClickLogic() then
    if self.LongPressClickFunc then
      self.LongPressClickFunc(self)
    end
    return
  end
  for obj, funcs in pairs(ExecuteLogics) do
    for i, v in pairs(funcs) do
      v.Event(obj, table.unpack(v.Params))
    end
  end
end

function M:PlayForbiddenButtonPressSound()
  UIUtils.PlayCommonForbiddenBtnSe(self)
end

function M:PlayButtonPressAnim()
  if self.IsLongPressButton then
    self:PlayLongPressAnimation()
  else
    self:PlayAnimation(self.Press)
  end
end

function M:OnBtnPressed()
  if self.IsForbidden == true then
    self.CurrentClickIsForbid = true
    self.ForbidSoundFunc(self)
    return
  end
  self.PressTime = os.clock()
  if self.AudioEventPath == "" then
    self.SoundFunc(self)
  elseif self.AudioPlayCase == EUIAudioPlayCase.OnMouseDown then
    AudioManager(self):PlayUISound(self, self.AudioEventPath, nil, nil)
  end
  self.CurrentClickIsForbid = false
  self.IsPressing = true
  self:PlayButtonPressAnim()
  for obj, funcs in pairs(self.PressLogics) do
    for i, v in pairs(funcs) do
      v.Event(obj, table.unpack(v.Params))
    end
  end
end

function M:PlayButtonHoverAnim()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnHovered()
  if self.IsForbidden == true then
    return
  end
  self.IsHovering = true
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
  if self.IsLongPressButton then
    self:StopLongPressAnimation()
  end
  self:PlayButtonHoverAnim()
end

function M:PlayButtonReleaseAndUnHoverAnim()
  if self.IsLongPressButton then
    self:StopLongPressAnimation()
  end
  self:PlayButtonUnHoverAnim()
end

function M:OnBtnReleased()
  self.IsPressing = false
  if self.IsForbidden ~= true and not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  elseif self.IsForbidden ~= true then
    self:PlayButtonReleaseButHoverAnim()
  end
  if self.AudioPlayCase == EUIAudioPlayCase.OnMouseUp then
    AudioManager(self):PlayUISound(self, self.AudioEventPath, nil, nil)
  end
  for obj, funcs in pairs(self.ReleaseLogics) do
    for i, v in pairs(funcs) do
      v.Event(obj, table.unpack(v.Params), self.IsForbidden)
    end
  end
end

function M:PlayButtonUnHoverAnim()
  if self.UnHover then
    self:BindToAnimationFinished(self.UnHover, {
      self,
      function()
        self:UnbindAllFromAnimationFinished(self.UnHover)
        self:StopAllAnimations()
        self:PlayAnimation(self.Normal)
      end
    })
    self:PlayAnimation(self.UnHover)
  else
    self:SwitchNormalAnimation()
  end
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if self.IsForbidden ~= true and not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function M:PlayButtonForbidAnim()
  self:StopAllAnimations()
  self:DestroyAllAnmations()
  self:PlayAnimation(self.Forbidden)
end

function M:PlayButtonUnForbidAnim()
  if self.IsHovering then
    self:PlayButtonHoverAnim()
  else
    self:SwitchNormalAnimation()
  end
end

function M:IsBtnForbidden()
  return self.IsForbidden
end

function M:ForbidBtn(IsForbid)
  if IsForbid == self.IsForbidden then
    return
  end
  self:UnbindAllFromAnimationFinished(self.UnHover)
  if self.IsForbidden == false and true == IsForbid then
    self.IsForbidden = true
    self:PlayButtonForbidAnim()
  elseif self.IsForbidden == true and false == IsForbid then
    self.IsForbidden = false
    self:PlayButtonUnForbidAnim()
  end
end

function M:SetButtonIsLongPress(NewLongPress)
  self.IsLongPressButton = NewLongPress
end

function M:SetLongPressDuration(NewDuration)
  if NewDuration > 0 then
    self.LongPressDuration = NewDuration
  end
end

function M:PlayLongPressAnimation()
end

function M:StopLongPressAnimation()
end

function M:CouldExecuteClickLogic()
  if self.IsForbidden then
    return true
  end
  if not self.IsLongPressButton then
    return true
  end
  if self.PressTime ~= nil then
    local CurTime = os.clock()
    if CurTime - self.PressTime > self.LongPressDuration then
      self.PressTime = nil
      return true
    else
      self.PressTime = nil
      return false
    end
  end
  return false
end

function M:GetIsLongPressButton()
  return self.IsLongPressButton
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn)
end

return M
