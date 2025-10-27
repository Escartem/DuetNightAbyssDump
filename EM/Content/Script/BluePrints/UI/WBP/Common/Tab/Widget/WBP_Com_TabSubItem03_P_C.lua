require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Update(Idx, Info, PlatformDeviceName)
  self.Info = Info
  Info.UI = self
  self.Idx = Idx
  self.IsLocked = Info.IsLocked
  self.PlatformDeviceName = PlatformDeviceName
  if self.IsLocked then
    self:PlayAnimation(self.Lock)
  end
  if self.Text_SubTab then
    self.Text_SubTab:SetText(Info.Text)
  end
  if self.Reddot then
    self:SetReddot(Info.IsNew, Info.ShowRedDot)
  end
  if self.Reddot_Num then
    self:SetReddotNum(Info.ShowRedDotNum)
  end
  if Info.IconPath then
    local Icon = LoadObject(Info.IconPath)
    local Material = self.Icon_Tab:GetDynamicMaterial()
    if nil ~= Material then
      Material:SetTextureParameterValue("IconTex", Icon)
    else
      self.Icon_Tab:SetBrushResourceObject(Icon)
    end
  end
end

function M:GetTabId()
  return self.Info.TabId
end

function M:GetTabIndex()
  return self.Idx
end

function M:Btn_Clicked()
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:Btn_Press()
  if self.IsOn or self.IsLocked then
    return
  end
  if self:IsAnimationPlaying(self.Press) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Press)
  self:PlayAnimation(self.Press)
end

function M:Btn_Hover()
  if self.PlatformDeviceName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsOn or self.IsLocked then
    return
  end
  local CurInputMode = UIUtils.UtilsGetCurrentInputType()
  if CurInputMode == ECommonInputType.Gamepad and not UIUtils.HasAnyFocus(self:GetParent()) then
    return
  end
  if self.HoverSoundFunc then
    self.HoverSoundFunc(self.SoundFuncReceiver, self.Idx)
  end
  if CurInputMode == ECommonInputType.Gamepad then
    if self.SoundFunc then
      self.SoundFunc(self.SoundFuncReceiver)
    end
    self:SetSwitchOn(true)
  else
    self:PlayAnimation(self.Hover)
  end
end

function M:Btn_UnHover()
  if self.PlatformDeviceName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsOn or self.IsLocked then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimation(self.UnHover)
end

function M:Btn_Release()
  if self.IsOn or self.IsLocked then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:SetSwitchOn(IsOn, IsNeedPressAnim)
  if self.IsLocked then
    local ShowTextContent = self.Info.LockReasonText or "Not Define!!!!"
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, ShowTextContent)
    return
  end
  self.IsOn = IsOn
  if IsOn then
    if self:IsAnimationPlaying(self.UnHover) then
      self:StopAnimation(self.UnHover)
    end
    if IsNeedPressAnim then
      local function PlayPressAnimFinished()
        self:PlayAnimation(self.Click)
      end
      
      self:UnbindAllFromAnimationFinished(self.Press)
      self:BindToAnimationFinished(self.Press, {self, PlayPressAnimFinished})
      self:PlayAnimation(self.Press)
    else
      self:PlayAnimation(self.Click)
    end
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
  end
end

function M:BindEventOnSwitchOn(Obj, Event)
  self.ObjSwitchOn = Obj
  self.EventSwitchOn = Event
end

function M:UnbindEventOnSwitchOn()
  self.ObjSwitchOn = nil
  self.EventSwitchOn = nil
end

function M:BindEventOnSwitchOff(Obj, Event)
  self.ObjSwitchOff = Obj
  self.EventSwitchOff = Event
end

function M:UnbindEventOnSwitchOff()
  self.ObjSwitchOff = nil
  self.EventSwitchOff = nil
end

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:BindHoverSoundFunc(func, Receiver)
  self.HoverSoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:SetLockInfo(bUnLock)
  self.IsLocked = bUnLock
  if bUnLock then
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Lock)
  end
end

function M:SetReddot(IsNew, Upgradeable, OtherReddot)
  self.IsNew = IsNew
  self.Upgradeable = Upgradeable
  self.OtherReddot = OtherReddot
  if IsNew then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Reddot then
    if OtherReddot then
      self.Reddot:SetReddotStyle(1)
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif Upgradeable then
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:SetReddotNum(RedNum)
  if nil ~= RedNum and RedNum > 0 then
    self.Reddot_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Reddot_Num:SetNum(RedNum)
  else
    self.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:Destruct()
  if self.Info then
    self.Info.UI = nil
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Click)
end

return M
