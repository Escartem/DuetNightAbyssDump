local BP_DanmakuTemplate_C = Class("BluePrints.Common.TimerMgr")

function BP_DanmakuTemplate_C:ReceiveBeginPlay()
  if self.BpBorn or not IsAuthority(Battle(self)) then
    self.Overridden.ReceiveBeginPlay(self)
  end
end

function BP_DanmakuTemplate_C:InitDanmakuInfo()
  self.Overridden.ReceiveBeginPlay(self)
end

function BP_DanmakuTemplate_C:InitVars()
  local CreatureInfo = DataMgr.DanmakuTemplate[self.DanmakuTemplateId]
  if CreatureInfo and CreatureInfo.Vars then
    for VarName, Value in pairs(CreatureInfo.Vars) do
      self[VarName] = Value
    end
  end
end

function BP_DanmakuTemplate_C:RemoveDanmakuCreature_Lua(Eid)
  Battle(self):RemoveDanmakuCreature(Eid)
end

return BP_DanmakuTemplate_C
