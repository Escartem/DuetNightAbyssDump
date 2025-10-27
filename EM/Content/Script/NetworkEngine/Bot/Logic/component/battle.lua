local battle = {}

function battle:EnterRegion(TargetRegionId, StartIndex, EnterRegionType, ForLogin)
  local function callback()
    self:log("EnterRegion callback")
  end
  
  self:EntityRpcWithCb("EnterRegion", callback, TargetRegionId, StartIndex, EnterRegionType, ForLogin)
end

function battle:PrepareToBattleRegion()
  self:EntityRpc("AvatarStatusEnterSuccess")
end

function battle:SingleGame(DungeonId)
  self:EnterDungeon(DungeonId, 1, false)
end

function battle:EnterDungeon(DungeonId, DungeonNetMode, bCreateNewMatch)
  local function callback()
    self:log("EnterDungeon callback")
  end
  
  self:EntityRpcWithCb("EnterDungeon", callback, DungeonId, DungeonNetMode, bCreateNewMatch)
end

function battle:PrepareToBattle()
  self:EntityRpc("AvatarStatusEnterSuccess")
end

return battle
