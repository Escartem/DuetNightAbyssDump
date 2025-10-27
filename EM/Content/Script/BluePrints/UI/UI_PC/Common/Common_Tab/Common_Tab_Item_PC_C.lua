require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:Update(Idx, Info)
  self.Info = Info
  Info.UI = self
  self.Idx = Idx
  self.IsLocked = Info.IsLocked
  if self.Text_name_On then
    self.Text_name_On:SetText(Info.TextOn or Info.Text)
  end
  if self.Text_name_Off then
    self.Text_name_Off:SetText(Info.TextOff or Info.Text)
  end
  if self.Img_On then
    local ImgPath = Info.ImgOn or Info.Img or Info.IconPath
    if ImgPath then
      local Img = LoadObject(ImgPath)
      self.Img_On:SetBrushResourceObject(Img)
    end
  end
  if self.Img_Off then
    local ImgPath = Info.ImgOff or Info.Img or Info.IconPath
    if ImgPath then
      local Img = LoadObject(ImgPath)
      self.Img_Off:SetBrushResourceObject(Img)
    end
  end
  if self.Image_Lock then
    if self.IsLocked then
      self.Image_Lock:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Image_Lock:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if self.Reddot then
    self:SetReddot(Info.IsNew, Info.ShowRedDot)
  end
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Main)
  self.ItemSize = CanvasSlot:GetSize()
  self.ItemPosition = CanvasSlot:GetPosition()
  self.bClickEnable = true
end

function M:SetReddot(IsNew, Upgradeable, OhterReddot)
  self.IsNew = IsNew
  self.Upgradeable = Upgradeable
  self.OhterReddot = OhterReddot
  if IsNew then
    self.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if OhterReddot then
    self.Reddot:SetReddotStyle(1)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif Upgradeable then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Btn_Click()
  if not self.bClickEnable then
    return
  end
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:SetClickEnable(bEnable)
  self.bClickEnable = bEnable
end

function M:Btn_Press()
  if self.IsOn or self.IsLocked or not self.bClickEnable then
    return
  end
  if self:IsAnimationPlaying(self.Pressed) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Pressed)
  self:PlayAnimation(self.Pressed)
end

function M:Btn_Hover()
  if self.IsOn or self.IsLocked then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:Btn_UnHover()
  if self.IsOn or self.IsLocked then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  if self:IsAnimationPlaying(self.Pressed) then
    self:StopAnimation(self.Pressed)
  end
  self:PlayAnimation(self.UnHover)
end

function M:Update_LineEffect(InGeometry, MouseEvent)
  if self.IsOn or self.IsLocked then
    return
  end
  local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
  local Scale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
  local thisPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(InGeometry, ScreenSpacePosition) * Scale
  local halfSizeX, MatFactor = self.ItemSize.X * Scale * 0.5, 0
  if thisPos.X < self.ItemSize.X * Scale then
    MatFactor = 0.4 - thisPos.X / halfSizeX * 0.4
  else
    MatFactor = -thisPos.X / halfSizeX * 0.4
  end
  local VXLineMat = self.VX_Line_Copy:GetDynamicMaterial()
  VXLineMat:SetScalarParameterValue("Mask_U_offset", MatFactor)
end

function M:SetSwitchOn(IsOn, IsNeedPressAnim)
  if self.IsLocked then
    local ShowTextContent = self.Info.LockReasonText or string.format(GText("UI_HardBoss_Unlocklevel"), 30)
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, ShowTextContent)
    return
  end
  self.IsOn = IsOn
  if IsOn then
    self:StopAllAnimations()
    
    local function PlayPressAnimFinished()
      self:PlayAnimation(self.Click)
    end
    
    if self:IsAnimationPlaying(self.Pressed) then
      self:UnbindAllFromAnimationFinished(self.Pressed)
      self:BindToAnimationFinished(self.Pressed, {self, PlayPressAnimFinished})
    elseif IsNeedPressAnim then
      self:UnbindAllFromAnimationFinished(self.Pressed)
      self:BindToAnimationFinished(self.Pressed, {self, PlayPressAnimFinished})
      self:PlayAnimation(self.Pressed)
    else
      self:PlayAnimation(self.Click)
    end
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self:StopAllAnimations()
    self:UnbindAllFromAnimationFinished(self.Pressed)
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

return M
