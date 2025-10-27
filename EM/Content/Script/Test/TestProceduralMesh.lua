local M = Class()

function M:ReceiveBeginPlay()
  self.ProceduralMesh:SetBoundsScale(1000000.0)
end

function M:GenerateStripMesh(XCount, YCount, UnitSize)
  if not self.ProceduralMesh then
    DebugPrint("\231\188\186\229\176\145 ProceduralMesh \231\187\132\228\187\182")
    return
  end
  XCount = XCount or 10
  YCount = YCount or 10
  UnitSize = UnitSize or 100
  local Vertices, Triangles, Normals, UVs = {}, {}, {}, {}
  for y = 0, YCount do
    for x = 0, XCount do
      local posX = x * UnitSize
      local posY = y * UnitSize
      table.insert(Vertices, FVector(posX, posY, 0))
      table.insert(Normals, FVector(0, 0, 1))
      table.insert(UVs, FVector2D(x / XCount, y / YCount))
    end
  end
  for y = 0, YCount - 1 do
    for x = 0, XCount - 1 do
      local i = y * (XCount + 1) + x
      table.insert(Triangles, i)
      table.insert(Triangles, i + XCount + 1)
      table.insert(Triangles, i + 1)
      table.insert(Triangles, i + 1)
      table.insert(Triangles, i + XCount + 1)
      table.insert(Triangles, i + XCount + 2)
    end
  end
  self.ProceduralMesh:CreateMeshSection_LinearColor(0, Vertices, Triangles, Normals, UVs, nil, nil, false)
  local DebugMat = UE4.UMaterial.Load("/Engine/EngineDebugMaterials/WireframeMaterial")
  self.ProceduralMesh:SetMaterial(0, DebugMat)
  DebugPrint(string.format("\229\185\179\233\157\162\231\148\159\230\136\144\230\136\144\229\138\159\239\188\154%d \232\161\140 \195\151 %d \229\136\151\239\188\140\229\133\177 %d \233\157\162\239\188\136\228\184\137\232\167\146\230\149\176 %d\239\188\137", YCount, XCount, XCount * YCount, #Triangles / 3))
end

return M
