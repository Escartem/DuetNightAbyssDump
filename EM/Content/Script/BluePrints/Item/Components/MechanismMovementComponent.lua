local MiscUtils = require("Utils.MiscUtils")
local Component = {}

function Component:InitComponent()
end

function Component:PlayMontage(Mesh, MontagePath, SectionName, Callback, ExcuteFnishOnlyWhenCompelete)
  self.MontToPlay = LoadObject(MontagePath)
  if not self.MontToPlay then
    return
  end
  local AnimInstance = Mesh:GetAnimInstance()
  local Montage = AnimInstance:GetCurrentActiveMontage()
  Callback = Callback or {}
  local MontParam = {
    OnCompleted = Callback.OnCompleted,
    OnBlendOut = Callback.OnBlendOut,
    OnInterrupted = Callback.OnInterrupted,
    OnNotifyBegin = Callback.OnNotifyBegin,
    OnNotifyEnd = Callback.OnNotifyEnd,
    ExcuteFnishOnlyWhenCompelete = ExcuteFnishOnlyWhenCompelete,
    StartSec = SectionName
  }
  if self.MontageProxyInst then
    AnimInstance:Montage_JumpToSection(SectionName, Montage)
    self:UpdateMontageProxy(MontParam)
  else
    MiscUtils.PlayMontageBySkeletaMesh(self, Mesh, self.MontToPlay, MontParam)
  end
end

function Component:UpdateMontageProxy(PlayParam)
  self:CleanMontPorxy()
  local MontCallbackProxy = self.MontageProxyInst
  local OnCompleted = PlayParam.OnCompleted
  MontCallbackProxy.OnCompleted:Add(self, PlayParam.OnCompleted)
  if PlayParam.ExcuteFnishOnlyWhenCompelete then
    OnCompleted = nil
  end
  local BlendOutFunc = PlayParam.OnBlendOut
  if not PlayParam.OnBlendOut then
    BlendOutFunc = OnCompleted
  end
  MontCallbackProxy.OnBlendOut:Add(self, BlendOutFunc)
  local InterruptedFunc = PlayParam.OnInterrupted
  if not PlayParam.OnInterrupted then
    InterruptedFunc = OnCompleted
  end
  MontCallbackProxy.OnInterrupted:Add(self, InterruptedFunc)
  if PlayParam.OnNotifyBegin then
    MontCallbackProxy.OnNotifyBegin:Add(self, PlayParam.OnNotifyBegin)
  end
  local EndFunc = PlayParam.OnNotifyEnd
  if not PlayParam.OnNotifyEnd then
    EndFunc = OnCompleted
  end
  MontCallbackProxy.OnNotifyEnd:Add(self, EndFunc)
end

return Component
