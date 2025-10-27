require("UnLua")
local Common_BlackScreen_C = Class("BluePrints.UI.BP_UIState_C")

function Common_BlackScreen_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local Params = (...)
  self.BlackScreenHandle = Params.BlackScreenHandle
  self.ScreenColor = Params.ScreenColor
  self.BlackScreenText = Params.BlackScreenText
  self.InAnimationObj = Params.InAnimationObj
  self.InAnimationCallback = Params.InAnimationCallback
  self.InAnimationPlayTime = Params.InAnimationPlayTime
  self.OutAnimationObj = Params.OutAnimationObj
  self.OutAnimationCallback = Params.OutAnimationCallback
  self.OutAnimationPlayTime = Params.OutAnimationPlayTime
  self.OutAnimationBPSetting = Params.OutAnimationBPSetting
  self.IsPlayOutWhenLoaded = Params.IsPlayOutWhenLoaded
  self:BindToAnimationFinished(self.In, function()
    if self.InAnimationObj and self.InAnimationCallback then
      self.InAnimationCallback(self.InAnimationObj)
    end
  end)
  self:BindToAnimationFinished(self.Out, function()
    AudioManager(self):StopSound(self, "CommonBlackScreen_" .. self.BlackScreenHandle)
    UIManager(self):OnCommonBlackScreenClosed(self.BlackScreenHandle)
    if self.OutAnimationObj and self.OutAnimationCallback then
      self.OutAnimationCallback(self.OutAnimationObj)
    end
    self:Close()
  end)
  UIManager(self):RegisterBlackScreenInstance(self.BlackScreenHandle, self)
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_fade_ui", "CommonBlackScreen_" .. self.BlackScreenHandle, nil)
  self:InitScreenColor()
  self:InitBlackScreenText()
  if self.IsPlayOutWhenLoaded then
    self:PlayOutAnimationWhenLoaded()
  else
    self:PlayInAnimationWhenLoaded()
  end
end

function Common_BlackScreen_C:InitScreenColor()
  if self.ScreenColor and self.ScreenColor == "White" then
    self.BlackScreen:SetColorAndOpacity(self.Color_White)
  else
    self.BlackScreen:SetColorAndOpacity(self.Color_Black)
  end
end

function Common_BlackScreen_C:InitBlackScreenText()
  if self.BlackScreenText then
    self.Text_BlackScreen:SetText(self.BlackScreenText)
    self.Text_BlackScreen:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_BlackScreen:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Common_BlackScreen_C:PlayInAnimationWhenLoaded()
  if self.InAnimationPlayTime and 0 ~= self.InAnimationPlayTime then
    self:RealPlayInAnimation()
  else
    self:DirectSetIn()
  end
end

function Common_BlackScreen_C:RealPlayInAnimation()
  local PlaySpeed = 1 / self.InAnimationPlayTime
  DebugPrint("Common_BlackScreen_C:PlayInAnimation  PlayTime:", string.format("%.2f", 1 / PlaySpeed))
  self:PlayAnimation(self.In, 0, 1, EUMGSequencePlayMode.Forward, PlaySpeed)
end

function Common_BlackScreen_C:DirectSetIn()
  self.BlackScreen:SetRenderOpacity(1)
  if self.InAnimationObj and self.InAnimationCallback then
    self.InAnimationCallback(self.InAnimationObj)
  end
  DebugPrint("Common_BlackScreen_C:DirectSetIn")
end

function Common_BlackScreen_C:PlayOutAnimationWhenLoaded()
  DebugPrint("Common_BlackScreen_C:PlayOutAnimationWhenLoaded")
  self:DirectSetIn()
  self:HideCommonBlackScreen()
end

function Common_BlackScreen_C:HideCommonBlackScreen()
  if self.OutAnimationBPSetting then
    local SettingTime = self[self.OutAnimationBPSetting]
    if SettingTime and 0 ~= SettingTime then
      local PlaySpeed = 1 / SettingTime
      self:RealPlayOutAnimation(PlaySpeed)
      return
    end
  end
  if self.OutAnimationPlayTime and 0 ~= self.OutAnimationPlayTime then
    local PlaySpeed = 1 / self.OutAnimationPlayTime
    self:RealPlayOutAnimation(PlaySpeed)
    return
  end
  self:DirectSetOut()
end

function Common_BlackScreen_C:RealPlayOutAnimation(PlaySpeed)
  DebugPrint("Common_BlackScreen_C:PlayOutAnimation  PlayTime:", string.format("%.2f", 1 / PlaySpeed))
  self:PlayAnimation(self.Out, 0, 1, EUMGSequencePlayMode.Forward, PlaySpeed)
end

function Common_BlackScreen_C:DirectSetOut()
  self.BlackScreen:SetRenderOpacity(0)
  DebugPrint("Common_BlackScreen_C:DirectSetOut")
  AudioManager(self):StopSound(self, "CommonBlackScreen_" .. self.BlackScreenHandle)
  UIManager(self):OnCommonBlackScreenClosed(self.BlackScreenHandle)
  if self.OutAnimationObj and self.OutAnimationCallback then
    self.OutAnimationCallback(self.OutAnimationObj)
  end
  self:Close()
end

return Common_BlackScreen_C
