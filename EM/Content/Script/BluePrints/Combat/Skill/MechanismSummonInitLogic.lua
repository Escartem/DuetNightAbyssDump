local Component = {}

function Component:RegisterInfo(Info)
  if Info then
    self.InfoForInit = Info
  end
  self:TryInitActorInfo("InitInfo")
end

function Component:ReceiveBeginPlay()
  if self.BPBorn and IsAuthority(self) then
    self.InfoForInit = {}
    self:TryInitActorInfo("InitInfo")
  end
end

return Component
