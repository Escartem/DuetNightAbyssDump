local M = Class({
  "BluePrints.UI.WBP.Story.Common.WBP_BlackScreenTalk_Common_C"
})

function M:InitializedToolbar()
  M.Super.InitializedToolbar(self)
  self.Story_PlayBtn:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Story_PlayBtn.bAutoPlay = GWorld.GameInstance.bGlobalAutoPlay
  self.Story_PlayBtn:InitPlayKey()
end

function M:ChangeAutoPlay()
  self.Story_PlayBtn.bAutoPlay = not self.Story_PlayBtn.bAutoPlay
  self:SwitchAutoPlay()
end

function M:ChangeAutoPlayUI()
  self.Story_PlayBtn:ChangeAutoPlayUI()
end

function M:OnSkipButtonClicked()
  self:ShowSkipPopup()
end

function M:ShowSkipPopup()
  local Params = {}
  Params.LeftCallbackFunction = self.OnSkipCancelled
  Params.LeftCallbackObj = self
  Params.RightCallbackFunction = self.OnSkipConfirmed
  Params.RightCallbackObj = self
  Params.CloseBtnCallbackFunction = self.OnSkipCancelled
  Params.CloseBtnCallbackObj = self
  Params.DontPlayOutAnimation = true
  UIManager(self):ShowCommonPopupUI(100070, Params)
end

function M:OnSkipCancelled()
end

function M:OnSkipConfirmed()
  self:SwitchEnableSkipButton(false)
  self.SkipButtonClicked_Delegate:Fire()
end

return M
