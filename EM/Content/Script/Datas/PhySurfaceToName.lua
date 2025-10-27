local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PhySurfaceToName", {
  [1] = {PhysicalSurfaceEnum = 1, PhysicalSurfaceName = "Concrete"},
  [2] = {PhysicalSurfaceEnum = 2, PhysicalSurfaceName = "Flesh"},
  [3] = {PhysicalSurfaceEnum = 3, PhysicalSurfaceName = "Grass"},
  [4] = {PhysicalSurfaceEnum = 4, PhysicalSurfaceName = "Glass"},
  [5] = {PhysicalSurfaceEnum = 5, PhysicalSurfaceName = "Metal"},
  [6] = {PhysicalSurfaceEnum = 6, PhysicalSurfaceName = "Mud"},
  [7] = {PhysicalSurfaceEnum = 7, PhysicalSurfaceName = "Sand"},
  [8] = {PhysicalSurfaceEnum = 8, PhysicalSurfaceName = "Snow"},
  [9] = {PhysicalSurfaceEnum = 9, PhysicalSurfaceName = "Water"},
  [10] = {PhysicalSurfaceEnum = 10, PhysicalSurfaceName = "Wood"}
})
