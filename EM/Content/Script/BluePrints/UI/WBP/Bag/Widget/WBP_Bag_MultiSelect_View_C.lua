require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Destruct()
  self:ClearListenEvent()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.ColorName = ConfigData.ColorName
  self.Rarity = ConfigData.Rarity
  self.ClickCallback = ConfigData.ClickCallback
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.OwnerWidget = ConfigData.OwnerWidget
end

function M:InitListenEvent()
  self.Button_Area.OnCheckStateChanged:Add(self, self.OnSelectClick)
end

function M:ClearListenEvent()
  self.Button_Area.OnCheckStateChanged:Clear()
end

function M:Start()
  self:InitListenEvent()
end

function M:Reset()
  self:ClearListenEvent()
  self.Button_Area:SetChecked(false)
end

function M:OnSelectClick(IsChecked)
  if type(self.SoundFunc) == "function" then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if "function" == type(self.ClickCallback) then
    self.ClickCallback(self.OwnerWidget, IsChecked, self.Rarity)
  end
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

return M
