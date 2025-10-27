require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn.OnHovered:Clear()
  self.Btn.OnUnhovered:Clear()
  self.Btn.OnPressed:Clear()
  self.Btn.OnClicked:Clear()
  self.Btn.OnPressed:Add(self, self.Btn_Press)
  self.Btn.OnClicked:Add(self, self.Btn_Click)
  self:FlushAnimations()
  self:PlayAnimation(self.Normal_UnSelect)
  self.IsOn = false
end

function M:BindEventOnSwitchOn(Obj, Event)
  self.ObjSwitchOn = Obj
  self.EventSwitchOn = Event
end

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:SetText(Text)
  self.Text_Off:SetText(Text)
  self.Text_On:SetText(Text)
end

function M:Btn_Click()
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:SetSwitchOn(IsOn)
  self.IsOn = IsOn
  self:FlushAnimations()
  if self.IsOn then
    self:PlayAnimation(self.Normal_Select)
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self:PlayAnimation(self.Normal_UnSelect)
  end
end

function M:Btn_Press()
  if self.IsOn then
    return
  end
  self:FlushAnimations()
  self:PlayAnimation(self.Press)
end

function M:Btn_Hover()
  if self.IsOn then
    return
  end
  self:FlushAnimations()
  self:PlayAnimation(self.Hover)
end

function M:Btn_UnHover()
  if self.IsOn then
    return
  end
  self:FlushAnimations()
  self:PlayAnimation(self.UnHover)
end

return M
