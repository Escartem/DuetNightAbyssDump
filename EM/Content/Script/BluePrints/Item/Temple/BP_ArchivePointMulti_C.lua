local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.Box:SetCollisionProfileName("OnlyPlayer", true)
  local GameState = UGameplayStatics.GetGameState(self)
  GameState.ArchivePointMap:Add(self.ArchiveID, self)
end

function M:OnPlayerEnter(Player)
  print(_G.LogTag, "LXZ OnPlayerEnter", Player:GetName(), Player.Eid, self:CheckIsActive(Player.Eid))
  if self:CheckIsActive(Player.Eid) then
    return
  end
  if IsAuthority(self) or IsStandAlone(self) then
    self.CanToast = self:CheckShouldToast()
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    local GameModeComp = GameMode:GetDungeonComponent()
    if nil ~= GameModeComp then
      DebugPrint("==============TriggerGameModeEvent: OnStageStart====================")
      GameModeComp:OnPlayerTriggerArchivePointMulti(self.ArchiveID, Player.Eid)
    else
      self:AddTimer(0.1, function()
        local GameModeComp = GameMode:GetDungeonComponent()
        if nil ~= GameModeComp then
          DebugPrint("==============TriggerGameModeEvent: OnStageStart==Delay==================")
          GameModeComp:OnPlayerTriggerArchivePointMulti(self.ArchiveID, Player.Eid)
          self:RemoveTimer("OnPlayerTriggerArchivePointMulti")
        else
          DebugPrint("==============TriggerGameModeEvent: OnStageStart==Wait==================")
        end
      end, true, 0, "OnPlayerTriggerArchivePointMulti", true)
    end
  end
  if IsClient(self) or IsStandAlone(self) then
    local MainPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
    if MainPlayer.Eid == Player.Eid then
      self:OnFX(Player.Eid)
    end
  end
  self.EnterPlayerList:Add(Player.Eid, true)
end

function M:OnFX(PlayerEid)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:ArchiveMutiShowFX(self, PlayerEid)
  end
end

function M:CheckIsActive(PlayerEid)
  return self.EnterPlayerList:Find(PlayerEid)
end

function M:ResetInfo()
  self.EnterPlayerList:Clear()
end

function M:CheckShouldToast()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    if GameState.GameModeType ~= "Party" then
      return true
    end
    if not GameState.ArchivePointMap or GameState.ArchivePointMap:Length() < 1 then
      return true
    end
    local MinArchiveID = 99
    local MaxArchiveID = 1
    for i, v in pairs(GameState.ArchivePointMap) do
      if MaxArchiveID < v.ArchiveID then
        MaxArchiveID = v.ArchiveID
      end
      if MinArchiveID > v.ArchiveID then
        MinArchiveID = v.ArchiveID
      end
    end
    local First = GameState.ArchivePointMap:Find(MinArchiveID)
    local End = GameState.ArchivePointMap:Find(MaxArchiveID)
    if self.ArchiveID == First.ArchiveID or self.ArchiveID == End.ArchiveID then
      return false
    end
  end
  return true
end

return M
