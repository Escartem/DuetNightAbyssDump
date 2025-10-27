require("UnLua")
local Component = {}

function Component:EnterWorld()
  self.SendPlayerInfoHandle = nil
end

function Component:RemovePlayerInfoHandle()
  if self.SendPlayerInfoHandle ~= nil then
    URuntimeCommonFunctionLibrary.K2_ClearAndInvalidateTimerHandle(GWorld.GameInstance, self.SendPlayerInfoHandle)
    self.SendPlayerInfoHandle = nil
  end
end

function Component:AddPlayerInfoHandle()
  self:RemovePlayerInfoHandle()
  
  local function Callback()
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:UpdateAndSavePlayerInfo(nil)
    else
      URuntimeCommonFunctionLibrary.K2_ClearAndInvalidateTimerHandle(GWorld.GameInstance, self.SendPlayerInfoHandle)
    end
  end
  
  self.SendPlayerInfoHandle = URuntimeCommonFunctionLibrary.K2_SetTimerDelegate({
    GWorld.GameInstance,
    Callback
  }, CommonConst.NET_Player_UPDATE_INFO, true)
end

function Component:GetLocalPlayerInfo(EnterLocation)
  local PlayerInfo = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):GetSafeRegionLocation(EnterLocation)
  return PlayerInfo
end

function Component:PlayerEnterBigWorld()
  self.IsOpenPlayerPositionSync = true
  self.SyncReason = CommonConst.SyncReason.Normal
  self:AddPlayerInfoHandle()
  local EnterLocation = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):K2_GetActorLocation()
  DebugPrint("ZJT_ PlayerEnterBigWorld ", self.IsOpenPlayerPositionSync, EnterLocation)
  self:UpdateAndSavePlayerInfo(EnterLocation)
end

function Component:CheckMarkingTime(LastSubRegionId, LastLocation, TargetLocation)
  if next(LastLocation) == nil then
    return false
  end
  return self.LastRegionData.RegionId == LastSubRegionId and self:CheckLocationEqual(LastLocation, TargetLocation)
end

function Component:CheckLocationEqual(SourceLocation, TargetLocation)
  return math.abs((SourceLocation.X or 0) - (TargetLocation.X or 0)) <= 5 and math.abs((SourceLocation.Y or 0) - (TargetLocation.Y or 0)) <= 5 and math.abs((SourceLocation.Z or 0) - (TargetLocation.Z or 0)) <= 5
end

function Component:UpdateAndSavePlayerInfo(EnterLocation)
  local Avatar = GWorld:GetAvatar()
  if not Avatar:CheckSyncState_Normal() or Avatar:IsInHardBoss() then
    return
  end
  if not self:CheckSubRegionType_NotEqual(nil, CommonConst.SubRegionType.Home) or not self.IsOpenPlayerPositionSync then
    return
  end
  local PlayerInfo = self:GetLocalPlayerInfo(EnterLocation)
  local LastSubRegionId = self.LastRegionData.RegionId
  local LastLocation = self.LastRegionData:GetLocation()
  if self.IsInRegionOnline then
    self.logger.debug("ZJT_ \228\189\141\231\189\174\229\144\140\230\173\165\229\143\150\230\182\136 \229\189\147\229\137\141\229\164\132\228\186\142\229\140\186\229\159\159\232\129\148\230\156\186 ", self.IsInRegionOnline)
    return
  end
  if self:CheckMarkingTime(LastSubRegionId, LastLocation, PlayerInfo.Location) then
    self.logger.debug("ZJT_ \229\189\147\229\137\141\231\142\169\229\174\182\230\173\163\229\156\168\232\191\155\232\161\140\229\142\159\229\156\176\229\144\140\230\173\165 \229\143\150\230\182\136\230\156\172\230\172\161\229\144\140\230\173\165 ")
    return
  end
  self.LastRegionData:UpdatePlayerInfo(PlayerInfo)
  local CurrentSubRegionId = self:GetCurrentPlayerSubRegionId()
  
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self.logger.debug("ZJT_ UpdateAndSavePlayerInfo ServerCallback Failed ", Ret, LastLocation)
    else
      self.logger.debug("ZJT_ UpdateAndSavePlayerInfo ServerCallback Success ", Ret)
      PrintTable({
        IsInRegionOnline = self.IsInRegionOnline,
        CurrentSubRegionId = CurrentSubRegionId,
        RegionId = self.LastRegionData.RegionId,
        LastRegionData = self.LastRegionData:GetLocation()
      }, 10)
    end
  end
  
  self.logger.debug("ZJT_ UpdateAndSavePlayerInfo CallSever ", CurrentSubRegionId, self.LastRegionData.RegionId, self.LastRegionData:GetLocation(), debug.traceback())
  self:CallServer("UpdateAndSavePlayerInfo", Callback, CurrentSubRegionId, self.LastRegionData.RegionId, self.LastRegionData:GetLocation(), self.LastRegionData:GetRotation())
end

function Component:GetCurrentPlayerSubRegionId()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  return PlayerCharacter:GetRegionId()
end

function Component:GetCurrentSafeAndSaveLocation(EnterLocation)
  local CurrentSaveRegionInfo = self:GetLocalPlayerInfo(EnterLocation)
  self.LastRegionData:UpdatePlayerInfo(CurrentSaveRegionInfo)
  return CurrentSaveRegionInfo
end

function Component:CheckSyncState_Normal()
  return self.SyncReason == CommonConst.SyncReason.Normal
end

function Component:ServerNotifyClientClose()
  self:ClosePlayerPositionSync()
end

function Component:ClientNotifyServerCloseSync(SyncReason)
  if not CommonConst.SyncReason[SyncReason] then
    return
  end
  print(_G.LogTag, "LXZ ClientNotifyServerCloseSync", SyncReason)
  
  local function callback(Ret)
    self.logger.debug("ZJT_ ClientNotifyServerCloseSync ServerCallClient ", self.SyncReason, self.IsOpenPlayerPositionSync, Ret, SyncReason)
  end
  
  self:CallServer("ClientNotifyServerCloseSync", callback, SyncReason)
end

function Component:ClientNotifyServerOpenSync()
  local function callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self.logger.error("ZJT_ \230\142\146\230\159\165\228\189\141\231\189\174\229\144\140\230\173\165\233\151\174\233\162\152 \232\175\183\228\184\138\230\138\165\229\136\176QA ", Ret)
    else
      self.logger.debug("ZJT_ ClientNotifyServerOpenSync ServerCallClient ", self.SyncReason, self.IsOpenPlayerPositionSync, Ret, SyncReason)
      self:PlayerEnterBigWorld()
    end
  end
  
  self:CallServer("ClientNotifyServerOpenSync", callback)
end

function Component:ServerNotifyClientOpen()
  self:PlayerEnterBigWorld()
end

function Component:ClosePlayerPositionSync()
  self.IsOpenPlayerPositionSync = false
  self:RemovePlayerInfoHandle()
end

function Component:CheckFirstMonster(UnitId, bUpdate)
  local IsFirstMonster = not self.FirstMonsters:HasValue(UnitId)
  if bUpdate then
    self:CallServerMethod("UpdateFirstMonster", UnitId)
  end
  return IsFirstMonster
end

function Component:CheckStrongGuideFirstMonster(UnitId, bUpdate)
  local IsStrongGuideFirstMonster = not self.FirstStrongMonsters:HasValue(UnitId)
  if bUpdate then
    self:CallServerMethod("UpdateStrongGuideFirstMonster", UnitId)
  end
  return IsStrongGuideFirstMonster
end

function Component:CheckIsFirstEnterDungeonType(DungeonId)
  if not DungeonId or not DataMgr.Dungeon[DungeonId] then
    return
  end
  local Type = DataMgr.Dungeon[DungeonId].DungeonType
  if not Type then
    return false
  end
  for Id, Inf in pairs(self.Dungeons) do
    if Id ~= DungeonId then
      if DataMgr.Dungeon[Id].DungeonType == Type then
        return false
      end
    elseif Inf.EnterCount > 1 then
      return false
    end
  end
  return true
end

function Component:CheckFirstMechanism(FirstSeenTag, bUpdate)
  local IsFirstMonster = false
  if not self.FirstMechanismTags[FirstSeenTag] then
    IsFirstMonster = true
  end
  if bUpdate then
    self:CallServerMethod("UpdateFirstMechanismTags", FirstSeenTag)
  end
  return IsFirstMonster
end

return Component
