require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(Info)
  self.Info = Info
  self.BackCallback = Info.BackCallback
  self.ParentWidget = Info.OwnerPanel
  self.Title_Tab:SetText(Info.TitleName)
  self.TabBack.Btn_Back.OnClicked:Clear()
  self.TabBack.Btn_Back.OnClicked:Add(self, self.OnReturnClick)
end

function M:OnReturnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if type(self.BackCallback) == "function" then
    self.BackCallback(self.ParentWidget)
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = true
  if InKeyName == UE4.EKeys.Escape.KeyName then
    self:OnReturnClick()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName then
    self:OnReturnClick()
    IsEventHandled = true
  end
  return IsEventHandled
end

return M
