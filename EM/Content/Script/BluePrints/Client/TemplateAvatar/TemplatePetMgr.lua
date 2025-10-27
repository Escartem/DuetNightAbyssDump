local Component = {}

function Component:GMAddPet(PetId)
  local Pet = self.Pets:NewPet(PetId, 1)
  self.PetUniqueID = self.PetUniqueID + 1
  return Pet
end

return Component
