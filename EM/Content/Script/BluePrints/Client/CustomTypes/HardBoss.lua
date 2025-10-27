local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local HardBoss = Class("HardBoss", CustomTypes.CustomAttr)
HardBoss.__Props__ = {
  HardBossRewardTimesLeft = prop.prop("Int", "client save", 0),
  PassCount = prop.prop("Int2IntDict", "client save")
}

function HardBoss:SetPass(DifficultyId)
  local bFirst = false
  local PreCount = self.PassCount[DifficultyId]
  if not PreCount then
    bFirst = true
    PreCount = 0
  end
  self.PassCount[DifficultyId] = PreCount + 1
  return bFirst
end

function HardBoss:GetPassCount(DifficultyId)
  return self.PassCount[DifficultyId] or 0
end

FormatProperties(HardBoss)
return {HardBoss = HardBoss}
