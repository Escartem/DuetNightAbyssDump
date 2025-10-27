local MiscUtils = require("Utils.MiscUtils")
local Component = Class()

function Component:InitEntertainmentSequence()
  local DefaultTrans = UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(0, 0, 0), UE4.FRotator(0, 0, 0), UE4.FVector(1, 1, 1))
  self.SequenceActor = self:GetWorld():SpawnActor(UE4.ALevelSequenceActor:StaticClass(), DefaultTrans, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  self.SequenceActor:SetSequence(LoadObject(tostring(self.EntertainmentSequence)))
  self.SequenceActor.SequencePlayer:Play()
  self.SequenceActor.SequencePlayer:Pause()
end

function Component:Destruct()
  if MiscUtils.IsActorValid(self.SequenceActor) then
    self.SequenceActor:K2_DestroyActor()
  end
end

function Component:GetCineCameraActor(Tag)
  if not MiscUtils.IsActorValid(self.SequenceActor) then
    return
  end
  local Binding = self.SequenceActor:FindNamedBinding(Tag)
  local BoundObjects = self.SequenceActor.SequencePlayer:GetBoundObjects(Binding)
  if BoundObjects:Length() > 0 then
    return BoundObjects[1]
  end
end

return Component
