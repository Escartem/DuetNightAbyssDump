local Component = {}

function Component:ManualLoadBank(Bank)
  if not Bank then
    UEPrint("LogFMOD: Cannot Load NULL as Bank.")
    return false
  end
  if self:IfSoundBankLoaded(Bank) then
    return true
  end
end

function Component:IfSoundBankLoaded(Bank)
  return true
end

function Component:AfterLoadBank()
end

return Component
