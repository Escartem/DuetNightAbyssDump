require("UnLua")
local BP_PartyComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_PartyComponent_C:InitPartyBaseInfo()
  DebugPrint("BP_PartyComponent_C:InitPartyBaseInfo")
  self.GameMode = self:GetOwner().LevelGameMode
  self.RatingRange = DataMgr.Party[self.GameMode.DungeonId].RatingRange or {}
  self:InitPartyStagePoints()
  self:InitArchivePointMulti()
  self:WaitPlayerEnter()
  self:InitPartyMainTimer()
end

function BP_PartyComponent_C:CustomFinishInfo(AvatarStr)
  local PlayerStar = self:GetPlayerStar(AvatarStr)
  self.GameMode:UpdateClientPartyInfo(AvatarStr, PlayerStar)
  return {
    Star = PlayerStar,
    PlayerNum = self:GetPartyPlayerNum()
  }
end

function BP_PartyComponent_C:PartySuccess()
  self.GameMode:TriggerDungeonWin()
end

function BP_PartyComponent_C:TriggerPartyExitMechanismOverlap(PlayerCharacter)
  if not self.PlayerRemainTime then
    return
  end
  local Eid = PlayerCharacter.Eid
  if not self.PlayerRemainTime[Eid] then
    local Time = self:GetPartyRemainTime()
    self.PlayerRemainTime[Eid] = Time
    DebugPrint("BP_PartyComponent_C:\230\156\137\231\142\169\229\174\182\229\136\176\232\190\190\231\187\136\231\130\185\239\188\140Eid", Eid, "\229\137\169\228\189\153\230\151\182\233\151\180", Time)
    self.GameMode:OnPlayerComplete(Eid, self:GetPartyTime())
    self.GameMode:TriggerGameModeEvent("OnPlayerReachPartyExit", Eid, Time)
  end
end

function BP_PartyComponent_C:TriggerPartyWin()
  self:PartySuccess()
end

function BP_PartyComponent_C:GetPartyPlayerNum()
  return self.GameMode.EMGameState.PartyPlayerDisPercentValues:Num()
end

function BP_PartyComponent_C:GetPlayerStar(AvatarStr)
  local Eid = 0
  if nil == AvatarStr then
    Eid = UE4.UGameplayStatics.GetPlayerCharacter(self, 0).Eid
  else
    Eid = self.GameMode:GetPlayerEidByAvatarEidStr(AvatarStr)
  end
  if not Eid or 0 == Eid then
    ScreenPrint("BP_PartyComponent_C:AvatarStr\232\142\183\229\143\150Eid\229\164\177\232\180\165! AvatarStr" .. AvatarStr)
    return 0
  end
  local RemainTime = self.PlayerRemainTime[Eid] or -1
  local Star = 0
  for i, Rate in ipairs(self.RatingRange) do
    if Rate <= RemainTime then
      Star = i
    else
      break
    end
  end
  DebugPrint("BP_PartyComponent_C:\231\142\169\229\174\182\231\187\147\231\174\151\230\152\159\231\186\167 AvatrStr", AvatarStr, "Eid", Eid, "\230\152\159\231\186\167", Star)
  return Star
end

function BP_PartyComponent_C:TriggerPartyOnEnd()
end

function BP_PartyComponent_C:InitArchivePointMulti()
  print(_G.LogTag, "LXZ InitArchivePointMulti")
  self.ArchivePointMultiInfo = {}
  self.PlayerToArchivePointMultiInfo = {}
end

function BP_PartyComponent_C:OnPlayerTriggerArchivePointMulti(ArchivePointMultiId, PlayerEid)
  DebugPrint("PartyComponent:OnPlayerTriggerArchivePointMulti", ArchivePointMultiId, PlayerEid)
  self.PlayerToArchivePointMultiInfo[PlayerEid] = ArchivePointMultiId
  if self.ArchivePointMultiInfo[ArchivePointMultiId] and self.ArchivePointMultiInfo[ArchivePointMultiId][PlayerEid] then
    DebugPrint("PartyComponent: \229\183\178\232\167\166\229\143\145\232\191\135", ArchivePointMultiId, PlayerEid)
    return
  end
  if self.ArchivePointMultiInfo[ArchivePointMultiId] == nil then
    self.ArchivePointMultiInfo[ArchivePointMultiId] = {}
    self.ArchivePointMultiInfo[ArchivePointMultiId].count = 0
  end
  self.ArchivePointMultiInfo[ArchivePointMultiId][PlayerEid] = true
  self.ArchivePointMultiInfo[ArchivePointMultiId].count = self.ArchivePointMultiInfo[ArchivePointMultiId].count + 1
  DebugPrint("PartyComponent: \232\167\166\229\143\145GameMode\232\147\157\229\155\190", ArchivePointMultiId, self.ArchivePointMultiInfo[ArchivePointMultiId].count)
  self.GameMode:TriggerGameModeEvent("OnArchivePointMultiTriggered", ArchivePointMultiId, self.ArchivePointMultiInfo[ArchivePointMultiId].count)
end

function BP_PartyComponent_C:WaitPlayerEnter()
  self.IsAllPlayerReadyEventTriggered = false
  if 1 == self.GameMode:GetTargetPlayerNum() then
    DebugPrint("PartyComponent: \229\141\149\228\186\186\232\191\155\229\133\165\239\188\140\228\184\141\228\188\154\232\181\176\229\128\146\232\174\161\230\151\182\239\188\129")
    self.GameMode:TriggerGameModeEvent("OnAllPlayersReady")
    self:AddTimer(0.1, function()
      self:BpOnTimerEnd_PartyWaitPlayerEnter()
    end)
    return
  end
  local TotalTime = DataMgr.GlobalConstant.PartyPreStartCountDownTotal.ConstantValue
  self.GameMode:BpAddTimer("PartyWaitPlayerEnter", TotalTime, true, Const.GameModeEventServerClient)
  self:OnPlayerEnter()
end

function BP_PartyComponent_C:OnPlayerEnter(Eid)
  DebugPrint("BP_PartyComponent_C:OnPlayerEnter", Eid)
  if not self:CheckIsAllPlayersReady() then
    return
  end
  DebugPrint("BP_PartyComponent_C: AllPlayerEntered!")
  self.GameMode:TriggerGameModeEvent("OnAllPlayersReady")
  local WaitTimerRemainTime = CommonUtils.GetClientTimerStructRemainTime("PartyWaitPlayerEnter")
  local Threshold = DataMgr.GlobalConstant.PartyPreStartCountDownShort.ConstantValue
  if WaitTimerRemainTime > Threshold then
    self.GameMode:BpResetTimer("PartyWaitPlayerEnter", Threshold, true, Const.GameModeEventServerClient)
  end
end

function BP_PartyComponent_C:BpOnTimerEnd_PartyWaitPlayerEnter()
  if self.IsAllPlayerReadyEventTriggered then
    return
  end
  self.IsAllPlayerReadyEventTriggered = true
  DebugPrint("BP_PartyComponent_C: \232\167\166\229\143\145GameMode\232\147\157\229\155\190 OnEnterCountDownEnd")
  self.GameMode:TriggerGameModeEvent("OnEnterCountDownEnd")
  self:InitPlayerOrdinal()
  self:AddTimer(1, self.UpdatePlayerOrdinal, true, 0, "UpdatePlayerOrdinal")
end

function BP_PartyComponent_C:SetPlayersToPartyStagePoints(Index)
  DebugPrint("BP_PartyComponent_C: SetPlayersToPartyStagePoints index", Index)
  local TargetStagePoint = self.PartyStagePoints[Index]
  assert(IsValid(TargetStagePoint), "BP_PartyComponent_C: \229\156\186\228\184\138\228\184\141\229\173\152\229\156\168StageId\228\184\186" .. Index .. "\231\154\132PartyStagePoint\239\188\129\228\184\141\228\188\154\230\137\167\232\161\140\231\167\187\229\138\168\231\142\169\229\174\182\228\189\141\231\189\174\231\154\132\233\128\187\232\190\145")
  for Index, Player in pairs(self.GameMode:GetAllPlayer()) do
    if IsValid(Player) then
      local TargetTransform = TargetStagePoint:GetTransformByIndex(Index)
      local NewTranslation = TargetTransform.Translation
      NewTranslation.Z = NewTranslation.Z + Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
      Player:K2_SetActorLocation(NewTranslation, false, nil, true)
      Player:MulticastSetPlayerRotation(TargetTransform.Rotation:ToRotator())
      Player:ResetIdle()
      DebugPrint("BP_PartyComponent_C SetLocation index", Index, "PlayerNewLoc", Player:K2_GetActorLocation())
      Player:GetMovementComponent():ForceClientUpdate()
    end
  end
  self.GameMode:NotifyClientShowBlackScreenFade()
end

function BP_PartyComponent_C:CheckIsAllPlayersReady()
  local CurReadyPlayerNum = 0
  for _, IsReady in pairs(self.GameMode.ClientReadyMap) do
    if IsReady then
      CurReadyPlayerNum = CurReadyPlayerNum + 1
    end
  end
  local TotalPlayerNum = self.GameMode:GetTargetPlayerNum()
  DebugPrint("BP_PartyComponent_C:CheckIsAllPlayersReady CurReadyPlayerNum", CurReadyPlayerNum, "TotalPlayerNum", TotalPlayerNum, "IsAllReady", CurReadyPlayerNum == TotalPlayerNum)
  return CurReadyPlayerNum == TotalPlayerNum
end

function BP_PartyComponent_C:InitPartyStagePoints()
  self.PartyStagePoints = {}
  local Points = UGameplayStatics.GetAllActorsOfClass(self, LoadClass("/Game/BluePrints/Common/Level/BP_PartyStagePoint.BP_PartyStagePoint_C"))
  for _, Point in pairs(Points) do
    local StageId = Point:GetStageId()
    self.PartyStagePoints[StageId] = Point
  end
end

function BP_PartyComponent_C:InitPlayerOrdinal()
  for Index, Player in pairs(self.GameMode:GetAllPlayer()) do
    self.GameMode.EMGameState:InitPlayerOrdinal(Player)
  end
  if DataMgr.Party[self.GameMode.DungeonId].SucRule == "Parkour" then
    self.GameMode.EMGameState:InitArchivePointProgress()
  end
end

function BP_PartyComponent_C:UpdatePlayerOrdinal()
  for Index, Player in pairs(self.GameMode:GetAllPlayer()) do
    if IsValid(Player) and self.PlayerToArchivePointMultiInfo[Player.Eid] then
      self.GameMode.EMGameState:UpdatePartyPlayerDis(Player, self.PlayerToArchivePointMultiInfo[Player.Eid] or 0, self.ArchivePointList)
    end
  end
  self.GameMode.EMGameState:UpdatePatryPlayerOrdinal()
end

function BP_PartyComponent_C:InitPartyMainTimer()
  self.PlayerRemainTime = {}
  self:SetPartyTimeThreshold(0)
  self:SetPartyTime(0)
end

function BP_PartyComponent_C:StartPartyTimer()
  self:SetPartyTime()
  self:AddTimer(1, self.PartyTiming, true, 0, "PartyTimer")
end

function BP_PartyComponent_C:PartyTiming()
  if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
    self:StopPartyTimer()
    return
  end
  self:AddPartyTime(1)
end

function BP_PartyComponent_C:StopPartyTimer()
  self:RemoveTimer("PartyTimer")
end

function BP_PartyComponent_C:SetPartyTimeThreshold(Threshold)
  self.GameMode.EMGameState:SetPartyTimerThreshold(Threshold)
end

function BP_PartyComponent_C:SetPartyTime(Value)
  self.GameMode.EMGameState:SetPartyTime(Value)
end

function BP_PartyComponent_C:AddPartyTime(Value)
  self.GameMode.EMGameState:SetPartyTime(self.GameMode.EMGameState.PartyTime + Value)
  if self.GameMode.EMGameState.PartyTime >= self.GameMode.EMGameState.PartyTimerThreshold then
    DebugPrint("BP_PartyComponent_C: PartyTimerReachThreshold!")
    self:StopPartyTimer()
    self.GameMode:TriggerGameModeEvent("OnPartyTimerReachThreshold")
  end
end

function BP_PartyComponent_C:GetPartyTime()
  return self.GameMode.EMGameState.PartyTime
end

function BP_PartyComponent_C:GetPartyRemainTime()
  return self.GameMode.EMGameState.PartyTimerThreshold - self.GameMode.EMGameState.PartyTime
end

return BP_PartyComponent_C
