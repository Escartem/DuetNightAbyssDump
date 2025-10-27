require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
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
  self.PopupId = ConfigData.PopupId
  self.OwnerWidget = ConfigData.OwnerWidget
  self:InitListenEvent()
end

function M:InitListenEvent()
  self.Btn_Click.OnClicked:Add(self, self.OnViewInfoClick)
end

function M:ClearListenEvent()
  self.Btn_Click.OnClicked:Clear()
end

function M:OnViewInfoClick()
  if self.PopupId ~= nil then
    local Params = {
      RightCallbackFunction = function()
        if type(self.ConfirmCallback) == "function" then
          self.ConfirmCallback(self.OwnerWidget, "Confirm")
        end
      end
    }
    UIManager(self):ShowCommonPopupUI(self.PopupId, Params)
  end
  if type(self.SoundFunc) == "function" then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if "function" == type(self.ClickCallback) then
    self.ClickCallback(self.OwnerWidget)
  end
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

return M
