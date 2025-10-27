local M = Class("BluePrints.Common.BP_LevelLoader_C")

function M:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  local levelTable = DataMgr.GetLevelLoaderJsonData(self.JsonName)
  self.points = levelTable.points
  self:LevelLoaderReady()
end

function M:LoadArtLevel(ID, bMakeVisibleAfterLoad, bShouldBlockOnLoad)
end

function M:UnloadArtLevel(ID)
end

function M:SetLevelDoor(door)
end

function M:SetInitTrans(PlayerController)
end

return M
