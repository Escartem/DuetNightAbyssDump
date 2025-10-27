require("UnLua")
local M = Class()

function M:PreloadMonAccessory()
  local Paths = {}
  if self.Owner.Data.AccessoryIds and self.Owner.Data.AccessoryIds.Normal then
    for i = 1, #self.Owner.Data.AccessoryIds.Normal do
      local Path = DataMgr.BodyAccessory[self.Owner.Data.AccessoryIds.Normal[i]].ModelPath
      table.insert(Paths, Path)
    end
  end
  if self.Owner.Data.AccessoryIds and self.Owner.Data.AccessoryIds.Random then
    for i = 1, #self.Owner.Data.AccessoryIds.Random do
      local Path = DataMgr.BodyAccessory[self.Owner.Data.AccessoryIds.Random[i]].ModelPath
      table.insert(Paths, Path)
    end
  end
  table.insert(Paths, Const.CharResourcePaths.AccessoryBP)
  return Paths
end

function M:PreloadMonsterInitDependMontage()
  local ModelData = DataMgr.Model[self.Owner:GetCharModelComponent():GetCurrentModelId()]
  local Paths = {}
  local RotationMontagePath = self.Owner:GetCharModelComponent():GetRotationMontagePath()
  table.insert(Paths, RotationMontagePath)
  self:MultiAssetPreload(Paths, ERoleInitAssetType.InitDependMontage, false)
end

function M:RegisterMonsterCustomConfig()
  self.CustomAssetsConfig = {}
  
  local function Register(_getPathFunc)
    table.insert(self.CustomAssetsConfig, _getPathFunc)
  end
  
  Register(function()
    return self.Owner.Data.MiniMapIcon
  end)
  if 0 == #self.CustomAssetsConfig then
    return
  end
  local Paths = {}
  for _, Func in pairs(self.CustomAssetsConfig) do
    table.insert(Paths, Func())
  end
  self:MultiAssetPreload(Paths, ERoleInitAssetType.CustomAssets, false)
end

function M:PreloadDistructableBody()
  self.Owner.DistructableBodyId = self.Owner:GetDistructableBodyId()
  self:SingleAssetPreload(Const.CharResourcePaths.DistructableBodyBp, ERoleInitAssetType.DistructableBody, true)
end

return M
