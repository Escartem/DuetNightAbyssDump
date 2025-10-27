local BP_DanmakuCreature_C = Class()

function BP_DanmakuCreature_C:ReceiveBeginPlay()
end

function BP_DanmakuCreature_C:Destroy()
  self:K2_DestroyComponent(self)
end

return BP_DanmakuCreature_C
