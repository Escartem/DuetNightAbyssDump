require("UnLua")
require("DataMgr")
local BP_TestMonsterAnimInstance_C = Class()

function BP_TestMonsterAnimInstance_C:LuaAnimBeginPlay()
  self.Pawn = self:TryGetPawnOwner()
end

function BP_TestMonsterAnimInstance_C:AnimNotify_BossLinen_StartMove()
  if self.IsOnServer or not self.Pawn then
    return
  end
  AudioManager(self.Pawn):PlaySeById(self.Pawn, 851233, self.Pawn, false, true, "", "BossLineMove")
end

function BP_TestMonsterAnimInstance_C:AnimNotify_BossLinen_EndMove()
  if self.IsOnServer or not self.Pawn then
    return
  end
  AudioManager(self):StopSound(self.Pawn, "BossLineMove")
end

return BP_TestMonsterAnimInstance_C
