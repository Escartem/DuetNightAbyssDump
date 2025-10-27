require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:SetToTransparent()
end

function M:Destruct()
  self:Clear()
end

function M:PlayFadeAnim(bInAnim, ...)
  self.bInAnim = bInAnim
  self.AnimArgs = {
    ...
  }
  if self.ShowPicTimer then
    return
  end
  self.ShowPicTimer = self:AddTimer(0.01, function()
    DebugPrint("WBP_Story_ImgItem:PlayFadeAnim", self.bInAnim)
    if self.bInAnim then
      self:FadeIn(table.unpack(self.AnimArgs))
    else
      self:ForceFadeOut()
    end
    self.ShowPicTimer = nil
  end, nil, nil, nil, true)
end

function M:FadeIn(Picture, fadeInTime, fadeOutTime, duration)
  if not Picture then
    DebugPrint("WBP_Story_ImgItem:FadeIn@ Picture is nil!", Picture, fadeInTime, fadeOutTime, duration)
    return
  end
  DebugPrint("WBP_Story_ImgItem:FadeIn", Picture, fadeInTime, fadeOutTime, duration)
  self.Img_Item:SetBrushFromTexture(Picture)
  self:StopAnimation(self.Item_Out)
  local AnimationInTime = self.Item_In:GetEndTime()
  if not fadeInTime then
    self:PlayAnimation(self.Item_In)
  elseif fadeInTime > 0 then
    self:PlayAnimation(self.Item_In, 0, 1, EUMGSequencePlayMode.Forward, AnimationInTime / fadeInTime)
  else
    self:PlayAnimation(self.Item_In, AnimationInTime)
  end
  self.Displaying = true
  if self.FadeOutTimer then
    self:RemoveTimer(self.FadeOutTimer)
    self.FadeOutTimer = nil
  end
  local AnimationOutTime = self.Item_Out:GetEndTime()
  if duration and fadeOutTime then
    self.FadeOutTimer = self:AddTimer(fadeInTime + duration, function()
      DebugPrint("WBP_Story_ImgItem:FadeOut", Picture, fadeInTime, fadeOutTime, duration)
      self:StopAnimation(self.Item_In)
      if fadeOutTime > 0 then
        self:PlayAnimation(self.Item_Out, 0, 1, EUMGSequencePlayMode.Forward, AnimationOutTime / fadeOutTime)
      else
        self:PlayAnimation(self.Item_Out, AnimationOutTime)
      end
      self:RemoveTimer(self.FadeOutTimer)
      self.FadeOutTimer = nil
      self.Displaying = false
    end)
  end
end

function M:ForceFadeOut()
  DebugPrint("WBP_Story_ImgItem:ForceFadeOut", self.Displaying)
  if not self.Displaying then
    return
  end
  self.Displaying = false
  self:StopAnimation(self.Item_In)
  self:PlayAnimation(self.Item_Out)
  if self.FadeOutTimer ~= nil then
    self:RemoveTimer(self.FadeOutTimer)
    self.FadeOutTimer = nil
  end
end

function M:SetToBlack()
  self:SetImgAlpha(1)
end

function M:SetToTransparent()
  self:SetImgAlpha(0)
end

function M:Clear()
  if self.FadeOutTimer then
    self:RemoveTimer(self.FadeOutTimer)
    self.FadeOutTimer = nil
  end
  if self.ShowPicTimer then
    self:RemoveTimer(self.ShowPicTimer)
    self.ShowPicTimer = nil
  end
end

function M:Close()
  DebugPrint("WBP_Story_ImgItem:Close")
  self:SetToTransparent()
  self:RemoveFromParent()
  self:Clear()
end

return M
