local Component = {}

function Component:ReceiveBeginPlay()
  rawset(self, "EMLuaTickManager", USubsystemBlueprintLibrary.GetWorldSubsystem(self, UEMLuaTickManagerSubsystem))
end

function Component:AddDelayFrameFunc(Func, DelayFrame, Key, ...)
  if not rawget(self, "EMLuaTickManager") then
    rawset(self, "EMLuaTickManager", USubsystemBlueprintLibrary.GetWorldSubsystem(self, UEMLuaTickManagerSubsystem))
  end
  if not IsValid(self.EMLuaTickManager) then
    return
  end
  self.EMLuaTickManager:AddDelayFrameFunc(self, Func, DelayFrame, Key, ...)
end

return Component
