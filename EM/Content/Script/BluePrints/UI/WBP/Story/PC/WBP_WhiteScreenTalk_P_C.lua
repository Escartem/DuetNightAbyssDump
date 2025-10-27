local M = Class({
  "BluePrints.UI.WBP.Story.Common.WBP_WhiteScreenTalk_Common_C"
})

function M:Construct()
  M.Super.Construct(self)
  self:RefreshBaseInfo()
end

function M:InitializedToolbar()
  M.Super.InitializedToolbar(self)
  self.WBP_Story_PlayKey_P:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.WBP_Story_PlayKey_P:Init(self.IsGamePad)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  if self.IsGamePadIsGamePad then
    self:SetFocus()
  end
  self.WBP_Story_PlayKey_P:UpdateKeyImg(self.IsGamePad)
end

return M
