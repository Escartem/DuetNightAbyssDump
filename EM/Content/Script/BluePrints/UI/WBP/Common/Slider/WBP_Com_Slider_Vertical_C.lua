require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Common.Slider.WBP_Com_Slider_C"
})

function M:Construct()
  self.SliderType = "Vertical"
  M.Super.Construct(self)
end

function M:InitWidgetInfoInGamePad()
  self.GamepadLTPressed = false
  self.GamepadRTPressed = false
  if self.bUseDefaultKeyInit then
    self.Key_Min:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Up"}
      }
    })
    self.Key_Add:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Down"}
      }
    })
  end
end

function M:MiniMaxUseGamePadStyle(UseGamePadStyle)
end

function M:ForbidMinOperation(Forbidden)
  self.ForbidMin = Forbidden
  self.Btn_Min:ForbidBtn(Forbidden)
  self.Key_Min:SetForbidKey(Forbidden)
end

function M:ForbidAddOperation(Forbidden)
  self.ForbidAdd = Forbidden
  self.Btn_Add:ForbidBtn(Forbidden)
  self.Key_Add:SetForbidKey(Forbidden)
end

function M:UpdateMouseGamePadImage(CurGamepadName)
  if self.CurGamepadNameName == CurGamepadName then
    return
  end
  local ResourceIconPath = UIUtils.UtilsGetKeyIconPathInGamepad("RVH", CurGamepadName)
  local Img = LoadObject(ResourceIconPath)
  if not IsValid(Img) then
    return
  end
  self.Slider_Controller.WidgetStyle.NormalThumbImage.ResourceObject = Img
end

return M
