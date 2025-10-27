require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Update(Idx, Info)
  self.Info = Info
  self.Idx = Idx
  if self.Text_name_On then
    self.Text_name_On:SetText(Info.TextOn or Info.Text)
  end
  if self.Text_name_Off then
    self.Text_name_Off:SetText(Info.TextOff or Info.Text)
  end
  if self.Img_On then
    local ImgPath = Info.ImgOn or Info.Img
    if ImgPath then
      local Img = LoadObject(ImgPath)
      self.Img_On:SetBrushResourceObject(Img)
    end
  end
  if self.Img_Off then
    local ImgPath = Info.ImgOff or Info.Img
    if ImgPath then
      local Img = LoadObject(ImgPath)
      self.Img_Off:SetBrushResourceObject(Img)
    end
  end
  if self.IsOn then
    self.Switcher_Tab:SetActiveWidgetIndex(0)
  else
    self.Switcher_Tab:SetActiveWidgetIndex(1)
  end
  self:CheckAndShowHintIcon()
end

function M:CheckAndShowHintIcon()
  if not self.IsOn and self.Info and (self.Info.IsNew or self.Info.Upgradeable) then
    local Icon
    if self.Info.IsNew and self.Info.Upgradeable then
      Icon = LoadObject("Texture2D'/Game/UI/UI_PNG/03Image/Icon/Common_Reddot01.Common_Reddot01'")
    elseif self.Info.IsNew then
      Icon = LoadObject("Texture2D'/Game/UI/UI_PNG/03Image/Icon/Common_Reddot02.Common_Reddot02'")
    else
      Icon = LoadObject("Texture2D'/Game/UI/UI_PNG/03Image/Icon/Common_Reddot03.Common_Reddot03'")
    end
    self.Reddot:SetBrushResourceObject(Icon)
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:Btn_Click()
  UIUtils.PlayCommonBtnSe(self)
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:SetSwitchOn(IsOn)
  self.IsOn = IsOn
  if IsOn then
    self.Switcher_Tab:SetActiveWidgetIndex(0)
    self:PlayAnimation(self.Press)
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self.Switcher_Tab:SetActiveWidgetIndex(1)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
  end
  self:CheckAndShowHintIcon()
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
