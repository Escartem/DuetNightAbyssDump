local EMCache = require("EMCache.EMCache")
local Component = {}

function Component:ReadSeGlobalParameters()
  Component.GlobalParams = {}
  Component.GlobalParams.VoHitHeavyDmg = DataMgr.SeGlobalParameter.VoHitHeavyDmg.SeGlobalValue
  Component.GlobalParams.VoHitHeavySeId = DataMgr.SeGlobalParameter.VoHitHeavySeId.SeGlobalValue
  Component.GlobalParams.VoHitLightSeId = DataMgr.SeGlobalParameter.VoHitLightSeId.SeGlobalValue
end

function Component:GetGlobalParamsTable(ParamKey)
  return Component.GlobalParams[ParamKey]
end

function Component:RecoverVolumeData()
  DebugPrint("Recover Volume")
  local RecordedVolume = EMCache:Get("FMODVolume")
  if not RecordedVolume then
    return
  end
  for Bus, VolumeValue in pairs(RecordedVolume) do
    DebugPrint("Recover Volume", Bus, VolumeValue)
    self:SetBusVolume(Bus, VolumeValue)
  end
end

function Component:SaveVolumeData(Bus, VolumeValue)
  local RecordedVolume = EMCache:Get("FMODVolume")
  RecordedVolume = RecordedVolume or {}
  RecordedVolume[Bus] = VolumeValue
  DebugPrint("Current Volume Setting")
  PrintTable(RecordedVolume, 2)
end

return Component
