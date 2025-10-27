require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:BindHoverSoundFunc(func, Receiver)
  self.HoverSoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:Update(Idx, Info)
  self.Info = Info
  Info.UI = self
  self.Idx = Idx
  self.Text_Name:SetText(Info.Text)
  if Info.IconPath then
    local Icon = LoadObject(Info.IconPath)
    local Material = self.Img_Avatar_Off:GetDynamicMaterial()
    Material:SetTextureParameterValue("IconMap", Icon)
    self.AvatarSwitch:SetActiveWidgetIndex(0)
  elseif Info.NpcId == nil then
    self.AvatarSwitch:SetActiveWidgetIndex(1)
  else
    local ShowNpc = DataMgr.Npc[Info.NpcId]
    local Icon = DataMgr.Char[ShowNpc.CharId].Icon
    local NpcIcon = LoadObject(Icon)
    local Material = self.Img_Avatar_Off:GetDynamicMaterial()
    Material:SetTextureParameterValue("IconMap", NpcIcon)
    self.AvatarSwitch:SetActiveWidgetIndex(0)
  end
  if self.Reddot then
    self:SetReddot(Info.IsNew, Info.ShowRedDot)
  end
  if self.Reddot_Num then
    self:SetReddotNum(Info.ShowRedDotNum)
  end
  self.bClickEnable = true
  self:PlayAnimation(self.Normal)
end

function M:SetClickEnable(bEnable)
  self.bClickEnable = bEnable
end

function M:IsTabLocked()
  return self.IsLocked
end

function M:GetIsCanSelect()
  return self.bClickEnable
end

function M:HideTextName(bHide)
  if bHide then
    self.Panel_Name:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Name:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:PlayAnimation(self.Panel_Name_In)
  end
end

function M:GetTabId()
  return self.Info.TabId
end

function M:GetTabIndex()
  return self.Idx
end

function M:Btn_Click()
  if not self.bClickEnable then
    return
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver, self.Idx)
  end
end

function M:Btn_Press()
  if self.IsOn or not self.bClickEnable then
    return
  end
  if self:IsAnimationPlaying(self.Pressed) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Pressed)
  self:PlayAnimation(self.Pressed)
end

function M:Btn_Hover()
  if self.IsOn or not self.bClickEnable then
    return
  end
  if self.HoverSoundFunc then
    self.HoverSoundFunc(self.SoundFuncReceiver, self.Idx)
  end
  self:PlayAnimation(self.Hover)
  self:HideTextName(false)
  if self.EventHoverOnOrOff then
    self.EventHoverOnOrOff(self.ObjHoverOnOrOff, self, true)
  end
end

function M:Btn_UnHover()
  if self.IsOn or not self.bClickEnable then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimation(self.UnHover)
  self:HideTextName(true)
  if self.EventHoverOnOrOff then
    self.EventHoverOnOrOff(self.ObjHoverOnOrOff, self, false)
  end
end

function M:SetSwitchOn(IsOn, IsNeedPressAnim)
  self.IsOn = IsOn
  if IsOn then
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
    self:UnbindAllFromAnimationFinished(self.Pressed)
    self:PlayAnimation(self.Normal)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
  end
end

function M:BindEventOnHoverOnOrOff(Obj, Event)
  self.ObjHoverOnOrOff = Obj
  self.EventHoverOnOrOff = Event
end

function M:UnbindEventOnHoverOnOrOff()
  self.ObjHoverOnOrOff = nil
  self.EventHoverOnOrOff = nil
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

function M:HideReddot()
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SetReddot(IsNew, Upgradeable, OhterReddot)
  self.IsNew = IsNew
  self.Upgradeable = Upgradeable
  self.OhterReddot = OhterReddot
  if IsNew then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if OhterReddot then
    self.Reddot:SetReddotStyle(1)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif Upgradeable then
    self.Reddot:SetReddotStyle(1)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
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

return M
