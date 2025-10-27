require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Portrait:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.Default:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.Camera:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  self.TabWidgets = {
    self.Portrait,
    self.Default,
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
  if ConfigData.LeftKey then
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = ConfigData.LeftKey
        }
      }
    })
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if ConfigData.RightKey then
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = ConfigData.RightKey
        }
      }
    })
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Key_Controller_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_Controller_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
  self.CurrentTab = nil
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self.WS_L:SetActiveWidgetIndex(1)
    self.WS_R:SetActiveWidgetIndex(1)
  elseif CurInputType == ECommonInputType.MouseAndKeyboard then
    self.WS_L:SetActiveWidgetIndex(0)
    self.WS_R:SetActiveWidgetIndex(0)
  end
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
