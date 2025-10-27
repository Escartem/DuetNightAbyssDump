require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.FadeTimer = 0
  self.bPaused = false
  self.bStartFadeIn = false
  DebugPrint("Construct")
  self.bStartFadeOut = false
  self.FadeInTime = 1
  self.FadeOutTime = 1
  self.FadeInCallback = nil
  self.FadeOutCallback = nil
  self:SetBlackScreenAlpha(0)
end

function M:FadeIn(FadeTime, Callback)
  DebugPrint("BP_BlackScreenBorder_C:StartFadeIn", "BlendInTime:", FadeTime, "FrameCount:", UKismetSystemLibrary.GetFrameCount())
  self.FadeTimer = 0
  self.FadeInTime = FadeTime
  self.FadeInCallback = Callback
  self.bPaused = false
  self.bStartFadeOut = false
  if FadeTime <= 0 then
    self.bStartFadeIn = false
    self:SetToBlack()
    self:OnFadeInFinished()
  else
    self.bStartFadeIn = true
  end
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_fade_ui", "BlackScreenBorder", nil)
end

function M:FadeOut(FadeTime, Callback)
  DebugPrint("BP_BlackScreenBorder_C:StartFadeOut, BlendOutTime:", FadeTime, "FrameCount:", UKismetSystemLibrary.GetFrameCount())
  self.FadeTimer = 0
  self.FadeOutTime = FadeTime
  self.bPaused = false
  self.bStartFadeIn = false
  self.FadeOutCallback = Callback
  if FadeTime <= 0 then
    self.bStartFadeOut = false
    self:SetToTransparent()
    self:OnFadeOutFinished()
  else
    self.bStartFadeOut = true
  end
  AudioManager(self):StopSound(self, "BlackScreenBorder")
end

function M:SetToBlack()
  self:SetBlackScreenAlpha(1)
end

function M:SetToTransparent()
  self:SetBlackScreenAlpha(0)
end

function M:OnFadeInFinished()
  DebugPrint("BP_BlackScreenBorder_C:FadeInFinished", "FrameCount:", UKismetSystemLibrary.GetFrameCount())
  if self.FadeInCallback then
    local Func = self.FadeInCallback.Func
    local Obj = self.FadeInCallback.Obj
    local Params = self.FadeInCallback.Params
    self.FadeInCallback = nil
    if 0 ~= self.FadeInTime then
      self:AddTimer(0.01, function()
        Func(Obj, table.unpack(Params))
      end)
    else
      Func(Obj, table.unpack(Params))
    end
  end
end

function M:OnFadeOutFinished()
  DebugPrint("BP_BlackScreenBorder_C:FadeOutFinished", "FrameCount:", UKismetSystemLibrary.GetFrameCount())
  if self.FadeOutCallback then
    local Func = self.FadeOutCallback.Func
    local Obj = self.FadeOutCallback.Obj
    local Params = self.FadeOutCallback.Params
    self.FadeOutCallback = nil
    Func(Obj, table.unpack(Params))
  end
end

function M:Pause(bPause)
  self.bPaused = bPause
end

return M
