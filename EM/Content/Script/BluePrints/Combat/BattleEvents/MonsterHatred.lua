local Component = Class("BluePrints.Combat.BattleEvents.BaseEvent")

function Component:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
end

return Component
