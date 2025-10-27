require("UnLua")
local BattleAchievementObject = Class()

function BattleAchievementObject:GetIndividualValues()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Current = TMap(0, 0)
    for TargetId, _Info in pairs(Avatar.AchvTargets) do
      local CurrentValue = _Info.CurrentValue
      if CurrentValue and CurrentValue > 0 then
        Current:Add(TargetId, CurrentValue)
      end
    end
    return Current
  end
  return TMap(0, 0)
end

function BattleAchievementObject:UploadTargetValue(Key, Value)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local PlayerController = self.OwnerCharacter:GetController()
  if not PlayerController then
    return
  end
  local AvatarId = PlayerController.AvatarId
  GameMode:UploadTargetValues({
    [Key] = Value
  }, AvatarId)
end

function BattleAchievementObject:UploadTargetValues(TargetValues)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  TargetValues = TargetValues:ToTable()
  local PlayerController = self.OwnerCharacter:GetController()
  if not PlayerController then
    return
  end
  local AvatarId = PlayerController.AvatarId
  GameMode:UploadTargetValues(TargetValues, AvatarId)
end

return BattleAchievementObject
