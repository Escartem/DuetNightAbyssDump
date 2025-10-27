require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Initialize(Initializer)
  self.IsChecked = false
  self.SoundFunc = self.PlayCheckedSound
end

function M:PlayCheckedSound()
  if not self.IsChecked then
    AudioManager(self):PlayUISound(self, "event:/ui/common/switch_on", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/switch_off", nil, nil)
  end
end

function M:Construct()
  self:AddAllBtnEvents()
  self.Listeners = {}
end

function M:AddAllBtnEvents()
  self.ButtonArea.OnClicked:Add(self, self.OnBtnClicked)
  self.ButtonArea.OnPressed:Add(self, self.OnBtnPressed)
  self.ButtonArea.OnHovered:Add(self, self.OnBtnHovered)
  self.ButtonArea.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.ButtonArea.OnReleased:Add(self, self.OnBtnReleased)
end

function M:RemoveAllBtnEvents()
  self.ButtonArea.OnClicked:Clear()
  self.ButtonArea.OnPressed:Clear()
  self.ButtonArea.OnHovered:Clear()
  self.ButtonArea.OnUnhovered:Clear()
  self.ButtonArea.OnReleased:Clear()
end

function M:AddBtnEvent(EventName, Obj, Func)
  if not self.ButtonArea[EventName] then
    return
  end
  if nil == Func then
    return
  end
  if nil == Obj then
    Obj = self
  end
  self.ButtonArea[EventName]:Add(Obj, Func)
end

function M:RemoveBtnEvent(EventName, Func)
  if not self.ButtonArea[EventName] then
    return
  end
  self.ButtonArea[EventName]:Remove(self, Func)
end

function M:OnBtnClicked()
  self:StopAnimation(self:GetBtnNormalAnim())
  self:PlayAnimation(self:GetBtnClickAnim())
  self:PlayCheckedSound()
  self.IsChecked = not self.IsChecked
  self:NotifyCheckStateChanged()
end

function M:OnBtnPressed()
  self:PlayAnimation(self:GetBtnPressAnim())
end

function M:OnBtnHovered()
  self:PlayAnimation(self:GetBtnHoverAnim())
end

function M:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.Open_Hover) then
    self:StopAnimation(self.Open_Hover)
  elseif self:IsAnimationPlaying(self.Close_Hover) then
    self:StopAnimation(self.Close_Hover)
  end
  self:PlayAnimation(self:GetBtnUnHoverAnim())
end

function M:OnBtnReleased()
  self:PlayAnimation(self:GetBtnNormalAnim())
end

function M:AddEventOnCheckStateChanged(Obj, Func)
  self.Listeners[Obj] = Func
end

function M:RemoveEventOnCheckStateChanged(Obj)
  if self.Listeners and self.Listeners[Obj] then
    self.Listeners[Obj] = nil
  end
end

function M:NotifyCheckStateChanged()
  if self.Listeners then
    for Obj, Func in pairs(self.Listeners) do
      Func(Obj, self.IsChecked)
    end
  end
end

function M:SetChecked(IsChecked, bNotifyChanged)
  if self.IsChecked ~= IsChecked then
    self.IsChecked = IsChecked
    if bNotifyChanged then
      self:NotifyCheckStateChanged()
    end
    if IsChecked then
      self:PlayAnimation(self.Close_Click)
    else
      self:PlayAnimation(self.Open_Click)
    end
  end
end

function M:GetChecked()
  return self.IsChecked
end

function M:GetBtnClickAnim()
  if self.IsChecked then
    return self.Open_Click
  else
    return self.Close_Click
  end
end

function M:GetBtnPressAnim()
  if self.IsChecked then
    return self.Open_Press
  else
    return self.Close_Press
  end
end

function M:GetBtnHoverAnim()
  if self.IsChecked then
    return self.Open_Hover
  else
    return self.Close_Hover
  end
end

function M:GetBtnUnHoverAnim()
  if self.IsChecked then
    return self.Open_Unhover
  else
    return self.Close_Unhover
  end
end

function M:GetBtnNormalAnim()
  if self.IsChecked then
    return self.Open_Normal
  else
    return self.Close_Normal
  end
end

return M
