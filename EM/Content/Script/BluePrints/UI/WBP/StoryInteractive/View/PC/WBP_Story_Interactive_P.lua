local M = Class("Blueprints.UI.WBP.StoryInteractive.View.StoryInteractiveView")
local Common = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveCommon")

function M:InitUIInfo(Name, IsInUIMode, EventList, NpcId, EndCallback)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, NpcId, EndCallback)
  self:InitBaseView(NpcId, EndCallback)
  self:SetFocus()
end

function M:UpdateKeyImg(IsGamePad, GamepadName)
  self.Super.UpdateKeyImg(self, IsGamePad, GamepadName)
  if not IsGamePad then
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = GText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("StoryInteractiveClose")))
        }
      },
      Desc = GText(Common.TextMap_Btn_Close)
    })
  else
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("StoryInteractiveClose", true)),
          Type = "Img"
        }
      },
      Desc = GText(Common.TextMap_Btn_Close)
    })
  end
  self.Img_Mouse:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:BindCloseDelegate(bBind)
  M.Super.BindCloseDelegate(self, bBind)
  self:StopListeningForInputAction("StoryInteractiveClose", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("StoryInteractiveClose", EInputEvent.IE_Released)
  if bBind then
    self.Key_Close:AddExecuteLogic(self, self.OnNormalExit)
    self:ListenForInputAction("StoryInteractiveClose", EInputEvent.IE_Pressed, false, {
      self,
      self.OnTalkExitPressed
    })
    self:ListenForInputAction("StoryInteractiveClose", EInputEvent.IE_Released, false, {
      self,
      self.OnTalkExitReleased
    })
  else
    self.Key_Close:RemoveExecuteLogic()
  end
end

function M:OnTalkExitPressed()
  self.TalkExitPress = true
end

function M:OnTalkExitReleased()
  if self.TalkExitPress then
    self:OnNormalExit()
  end
  self.TalkExitPress = false
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    self.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    self.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  local InKeyName
  if self.MoveDeltaY and 0 ~= self.MoveDeltaY then
    if self.MoveDeltaY > 0.5 then
      InKeyName = "Gamepad_LeftStick_Up"
    elseif self.MoveDeltaY < -0.5 then
      InKeyName = "Gamepad_LeftStick_Down"
    end
  end
  if "Gamepad_LeftStick_Up" == InKeyName then
    self:UpSelectAction()
    return UIUtils.Handled
  elseif "Gamepad_LeftStick_Down" == InKeyName then
    self:DownSelectAction()
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.DPadUp then
    self:UpSelectAction()
    return UIUtils.Handled
  elseif InKeyName == UIConst.GamePadKey.DPadDown then
    self:DownSelectAction()
    return UIUtils.Handled
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnUpdateUIStyleByInputTypeChange(...)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, ...)
  self:SetFocus()
end

function M:RefreshInteractiveItem(...)
  M.Super.RefreshInteractiveItem(self, ...)
  self:TrySelectItemAt(0)
end

return M
