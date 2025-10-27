require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_More:Init({
    ClickCallback = self.OnBtn_MoreClicked,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
    end,
    SoundFuncReceiver = self,
    OwnerWidget = self
  })
end

function M:OnBtn_MoreClicked()
  if not self.CharId then
    return
  end
  local Params = {
    CharId = self.CharId
  }
  UIManager(self):ShowCommonPopupUI(100215, Params, self)
end

function M:Init(Params)
  Params = Params or {}
  self.Owner = Params.Owner
  self.CharId = Params.CharId
  UIUtils.AddPositioningTagToPanel(self.HB_Tag, self.CharId)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_More)
end

return M
