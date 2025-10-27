require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Portrait:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.Default:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.Camera:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.TabWidgets = {
    self.Default,
    self.Portrait,
    self.Camera
  }
end

function M:Init(ConfigData)
  self.Tabs = ConfigData.Tabs
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  for index, Widget in ipairs(self.TabWidgets) do
    Widget.Idx = index
    Widget:SetText(self.Tabs[index].Text)
  end
  self.CurrentTab = nil
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.TabWidgets[TabWidget.Idx] then
    if self.TabWidgets[self.CurrentTab] then
      self.TabWidgets[self.CurrentTab]:SetSwitchOn(false)
    end
    self.CurrentTab = TabWidget.Idx
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget, self.Tabs[TabWidget.Idx])
  end
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:SelectTab(Idx)
  if self.TabWidgets[Idx] then
    self.TabWidgets[Idx]:SetSwitchOn(true)
  end
end

function M:TabToLeft()
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    self.TabWidgets[self.CurrentTab - 1]:SetSwitchOn(true)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab - 1)
  end
end

function M:TabToRight()
  if self.CurrentTab and self.CurrentTab + 1 <= #self.TabWidgets then
    self.TabWidgets[self.CurrentTab + 1]:SetSwitchOn(true)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab + 1)
  end
end

function M:PlayClickSound()
  UIUtils.PlayCommonBtnSe(self)
end

return M
