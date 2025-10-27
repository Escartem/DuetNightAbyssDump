require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Update(Idx, Info)
  Info.UI = self
  self.Info = Info
  self.Idx = Idx
  if Info.NormalIconPath then
    local Icon = LoadObject(Info.NormalIconPath)
    self.Image_Normal:SetBrushResourceObject(Icon)
  end
  if Info.SelectIconPath then
    local Icon = LoadObject(Info.SelectIconPath)
    local Material = self.Image_Select:GetDynamicMaterial()
    Material:SetTextureParameterValue("Mask", Icon)
  end
  self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.Reddot then
    self:SetReddot(Info.IsNew, Info.ShowRedDot)
  end
end

function M:SetSwitchOn(IsOn)
  self.IsOn = IsOn
  if IsOn then
    self:PlayAnimation(self.Click)
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Select:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.Normal)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Group_Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
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

function M:Btn_Click()
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
  end
end

function M:Btn_Press()
  if self:IsAnimationPlaying(self.Pressed) then
    return
  end
  self:PlayAnimation(self.Pressed)
end

function M:Btn_Hover()
  self:PlayAnimation(self.Hover)
end

function M:Btn_UnHover()
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  if self:IsAnimationPlaying(self.Pressed) then
    self:StopAnimation(self.Pressed)
  end
  self:PlayAnimation(self.UnHover)
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
  if self.Reddot then
    if OhterReddot then
      self.Reddot:SetReddotStyle(1)
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif Upgradeable then
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

return M
