local FDisableInteractiveComponent = {}

function FDisableInteractiveComponent:New(Player)
  local Obj = setmetatable({}, {__index = FDisableInteractiveComponent})
  Obj.Player = Player
  return Obj
end

function FDisableInteractiveComponent:Execute()
  if self.Player then
    self.Player:SetCanInteractiveTrigger(false, "Talk")
  end
end

function FDisableInteractiveComponent:Resume()
  if self.Player then
    self.Player:SetCanInteractiveTrigger(true, "Talk")
  end
end

return FDisableInteractiveComponent
