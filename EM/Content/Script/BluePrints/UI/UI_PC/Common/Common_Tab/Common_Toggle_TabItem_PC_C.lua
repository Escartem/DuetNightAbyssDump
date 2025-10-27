require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Update(Idx, Info)
  self.Info = Info
  Info.UI = self
  self.Idx = Idx
  self.Text_TabNormal:SetText(Info.Text)
  self.Text_TabSelect:SetText(Info.Text)
end

function M:Btn_Clicked()
  UIUtils.PlayCommonBtnSe(self)
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:Btn_Press()
  if self.IsOn then
    return
  end
  if self:IsAnimationPlaying(self.Press) then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:Btn_Hover()
  if self.IsOn then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimation(self.Hover)
end

function M:Btn_UnHover()
  if self.IsOn then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimationReverse(self.Hover)
end

function M:SetSwitchOn(IsOn)
  self.IsOn = IsOn
  if IsOn then
    self.WS_Tab:SetActiveWidgetIndex(1)
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self.WS_Tab:SetActiveWidgetIndex(0)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
    local Color = FSlateColor()
    Color.SpecifiedColor.R = 1.0
    Color.SpecifiedColor.G = 1.0
    Color.SpecifiedColor.B = 1.0
    Color.SpecifiedColor.A = 0.4
    self.Text_TabNormal:SetColorAndOpacity(Color)
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

function M:SetReddot(IsNew, Upgradeable)
  self.Info = self.Info or {UI = self}
  self.Info.IsNew = IsNew
  self.Info.Upgradeable = Upgradeable
  if IsNew then
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if Upgradeable then
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
