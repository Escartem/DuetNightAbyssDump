require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.IsActive = false
  self.SoundFunc = self.PlayClickSound
  self.SoundFuncReceiver = self
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.ClickCallback = ConfigData.ClickCallback
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.IsActive = ConfigData.IsActive
  self.TargetWidget = ConfigData.TargetWidget
  self.OwnerWidget = ConfigData.OwnerWidget
  self:InitListenEvent()
  self:UpdateView()
end

function M:UpdateView()
  if self.IsActive then
    self:PlayAnimationForward(self.ON)
    self.TargetWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self:PlayAnimationForward(self.OFF)
    self.TargetWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnBtnClick(IsChecked)
  if type(self.SoundFunc) == "function" then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if IsValid(self.TargetWidget) then
    self.IsActive = IsChecked
    self:UpdateView()
  end
  if "function" == type(self.ClickCallback) then
    self.ClickCallback(self.OwnerWidget, IsChecked)
  end
end

function M:InitListenEvent()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClick)
end

function M:ClearListenEvent()
  self.Btn_Click.OnClicked:Clear()
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

return M
