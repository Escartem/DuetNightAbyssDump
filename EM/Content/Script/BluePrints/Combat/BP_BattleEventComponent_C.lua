require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_BattleEventComponent_C = Class()

function BP_BattleEventComponent_C:ReceiveBeginPlay()
  self.Battle = self:GetOwner()
  if not IsAuthority(self.Battle) then
    self.RegisterBattleEvent = MiscUtils.EmptyFunction
    self.UnregisterBattleEvent = MiscUtils.EmptyFunction
    self.TriggerBattleEvent = MiscUtils.EmptyFunction
    return
  end
end

return BP_BattleEventComponent_C
