local Component = {}

function Component:ReceiveBeginPlay()
  rawset(self, "BattleEvent", self.BattleEvent)
end

return Component
