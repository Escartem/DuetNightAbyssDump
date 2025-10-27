local BattleUtils = {}

function BattleUtils.GetExtraCreateInfo(UnitType, UnitId, RoleId)
  local ExtraCreateInfo = {}
  if "Phantom" == UnitType then
    local PhantomInfo = DataMgr.Phantom[RoleId]
    if PhantomInfo then
      ExtraCreateInfo.IsHostage = PhantomInfo.IsHostage
      ExtraCreateInfo.IsNPCPhantom = PhantomInfo.IsNPCPhantom
      ExtraCreateInfo.BTIndex = 1
    end
    return ExtraCreateInfo
  end
  return ExtraCreateInfo
end

return BattleUtils
