require("UnLua")
local MaterialMgr = {}

function MaterialMgr:AddMaterial(MaterialId, Count)
  assert(Count >= 0)
  if self.Materials[MaterialId] == nil then
    self.Materials:NewMaterial(MaterialId)
  end
  if not self.Materials[MaterialId]:IsMaterial() then
    return
  end
  return self.Materials[MaterialId]:AddCount(Count)
end

function MaterialMgr:SubMaterial(MaterialId, Count)
  assert(Count >= 0)
  if self.Materials[MaterialId] == nil then
    return
  end
  if not self.Materials[MaterialId]:IsMaterial() then
    return
  end
  if Count > self.Materials[MaterialId]:GetCount() then
    return false
  end
  return self.Materials[MaterialId]:SubCount(Count)
end

return MaterialMgr
