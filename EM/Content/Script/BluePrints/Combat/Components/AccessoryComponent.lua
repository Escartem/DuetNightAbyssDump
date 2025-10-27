local Component = {}

function Component:GetSkeletalMeshAccessoryBPPath()
  return Const.CharResourcePaths.AccessoryBP
end

function Component:GetStaticMeshAccessoryBPPath()
  return Const.CharResourcePaths.StaticAccessoryBP
end

function Component:GetAllAccessoryMeshes()
  local Meshes = TArray(UE4.UMeshComponent)
  if not self.Accessories then
    return Meshes
  end
  for _, Accessory in pairs(self.Accessories) do
    if Accessory.Mesh then
      Meshes:Add(Accessory.Mesh)
    end
  end
  return Meshes
end

function Component:HasBodyAccessories()
  return self.Accessories:Num() > 0
end

return Component
