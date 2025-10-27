require("UnLua")
require("Utils")
require("DataMgr")
require("Const")
local PickupUseComponent = require("BluePrints.Item.Pickups.PickupUseComponent")
local PickupComponent = {}

function PickupComponent:Initialize(Initializer)
  self.EffectsInProcess = {}
  self.DropPlaying = false
end

return PickupComponent
