require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:Update(Idx, Info)
  Info.UI = self
  self.Info = Info
  self.Idx = Idx
  if self.Text_Name_Off_1 then
    self.Text_Name_Off_1:SetText(Info.TextOn or Info.Text)
  end
  if self.Text_Name_Off_2 then
    self.Text_Name_Off_2:SetText(Info.TextOff or Info.Text)
  end
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
  self.bClickEnable = true
  self:PlayAnimation(self.Normal)
end

function M:SetClickEnable(bEnable)
  self.bClickEnable = bEnable
end

function M:Btn_Click()
  if not self.bClickEnable then
    return
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
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

function M:SetSwitchOn(IsOn, IsNeedPressAnim)
  self.IsOn = IsOn
  if IsOn then
    self:StopAllAnimations()
    if self:IsAnimationPlaying(self.Pressed) then
      local function PlayPressAnimFinished()
        self:PlayAnimation(self.Click)
      end
      
      self:UnbindAllFromAnimationFinished(self.Pressed)
      self:BindToAnimationFinished(self.Pressed, {self, PlayPressAnimFinished})
    else
      self:PlayAnimation(self.Selected)
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

function M:HideReddot()
  self.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
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

return M
