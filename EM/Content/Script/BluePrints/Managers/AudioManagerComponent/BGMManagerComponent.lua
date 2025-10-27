local Component = {}

function Component:StoreLevelBGMInfoToAvatar(SoundType, EventName, Key, Value)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    DebugPrint("HYY_ Store BGM Info", SoundType, EventName, Key, Value)
    Avatar:UpdateSuitKey2Table(CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, SoundType, EventName, Key, Value)
  end
end

function Component:RemoveLevelBGMInfoFromAvatar()
end

return Component
