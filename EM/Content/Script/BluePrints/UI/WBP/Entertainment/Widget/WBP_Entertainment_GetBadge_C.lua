require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:BindOnClose(Obj, Func)
  self.ExecuteOnCloseObj = Obj
  self.ExecuteOnCloseFunc = Func
end

function M:OpenPanel()
  if self:IsPanelOpened() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:GetDesiredFocusTarget():SetFocus()
end

function M:ClosePanel()
  if not self:IsPanelOpened() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:IsPanelOpened()
  return self:GetVisibility() ~= ESlateVisibility.Collapsed
end

function M:SetMemory(MemoryName, MemoryDescription, MemoryIconPath)
  self.Text_Name:SetText(MemoryName)
  self.Text_Describe:SetText(MemoryDescription)
  self.Icon_Badge:SetBrushFromTexture(LoadObject(MemoryIconPath))
end

function M:Initialize(Initializer)
  self.OpenSound = "event:/ui/common/tip_show_lp"
  self.OpenSoundKey = "GetBadgeOpen"
end

function M:Construct()
  self.Btn_Close.OnClicked:Add(self, self.HandleOnButtonClicked)
  self:BindToAnimationStarted(self.In, {
    self,
    self.HandleOnInAnimationStarted
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.HandleOnOutAnimationFinished
  })
  self.Text_Tips:SetText(GText("UI_Controller_Close"))
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
end

function M:Destruct()
  self.Btn_Close.OnClicked:Remove(self, self.HandleOnButtonClicked)
  self:UnbindFromAnimationStarted(self.In, {
    self,
    self.HandleOnInAnimationStarted
  })
  self:UnbindFromAnimationFinished(self.Out, {
    self,
    self.HandleOnOutAnimationFinished
  })
end

function M:HandleOnButtonClicked()
  self:ClosePanel()
end

function M:HandleOnInAnimationStarted()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  AudioManager(self):PlayUISound(self, self.OpenSound, self.OpenSoundKey, nil)
end

function M:HandleOnOutAnimationFinished()
  self:SetVisibility(ESlateVisibility.Collapsed)
  AudioManager(self):SetEventSoundParam(self, self.OpenSoundKey, {ToEnd = 1})
  if self.ExecuteOnCloseFunc then
    self.ExecuteOnCloseFunc(self.ExecuteOnCloseObj)
  end
end

function M:BP_GetDesiredFocusTarget()
  return self
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.WS_Controller:SetActiveWidgetIndex(1)
  else
    self.WS_Controller:SetActiveWidgetIndex(0)
  end
end

function M:OnGamePadKeyDown(MyGeometry, InKeyEvent)
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonDown then
    self.Btn_Close.OnClicked:Broadcast()
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return M
