require("UnLua")
local BP_PaotaiComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_PaotaiComponent_C:InitPaotaiBaseInfo()
  self.MonsterUnitId2Point = {}
  local MonsterPointInfo = DataMgr.PaotaiGamePoint
  for _, Info in pairs(MonsterPointInfo) do
    self.MonsterUnitId2Point[Info.Monster] = Info.Point
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  self.CanonScore = 0
  self.Star = 0
  self.GameMode = self:GetOwner().LevelGameMode
  self:SetMonsterNum()
  EventManager:AddEvent(EventID.EndCanonMiniGame, self, self.RealEndCanonMiniGame)
  EventManager:AddEvent(EventID.CanonBegionCountFinish, self, self.CanonBegionCountFinish)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local PaotaiBuffs = Avatar.PaotaiBuffs or {}
  for _, BuffId in pairs(PaotaiBuffs) do
    Battle(self):AddBuffToTarget(Player, Player, BuffId, -1, nil, nil)
  end
end

function BP_PaotaiComponent_C:TriggerPaotaiOnEnd()
  EventManager:RemoveEvent(EventID.EndCanonMiniGame, self)
  EventManager:RemoveEvent(EventID.CanonBegionCountFinish, self)
end

function BP_PaotaiComponent_C:StartCanonMiniGame()
  self.GameMode:TriggerGameModeEvent("OnCanonBegionCountDownStart")
  EventManager:FireEvent(EventID.StartCanonMiniGame)
end

function BP_PaotaiComponent_C:CanonBegionCountFinish()
  self.GameMode:TriggerGameModeEvent("OnCanonBegionCountDownFinish")
  self.GameMode:PostCustomEvent("RealStartCanonGame")
end

function BP_PaotaiComponent_C:RealEndCanonMiniGame()
  EventManager:RemoveEvent(EventID.EndCanonMiniGame, self)
  self.GameMode:TriggerGameModeEvent("OnCanonMiniGameEnd")
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitBattle(true)
end

function BP_PaotaiComponent_C:EndCanonMiniGame()
  EventManager:FireEvent(EventID.EndCanonMiniGame)
end

function BP_PaotaiComponent_C:SetMonsterNum()
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local Info = DataMgr.PaotaiMiniGame[DungeonId]
  self.GameMode.MonsterNum = Info.MonsterNum or -1
end

function BP_PaotaiComponent_C:CanonMonsterDead(Monster)
  if not IsValid(Monster) then
    return
  end
  local DeathReason = Monster.MonsterDeathReason
  DebugPrint("PaotaiComponent:OnCanonMonsterDead UnitId", Monster.UnitId, "DeathReason", EDeathReason:GetNameByValue(DeathReason))
  if DeathReason == EDeathReason.KillSelf then
    return
  end
  local AddScore = self.MonsterUnitId2Point[Monster.UnitId]
  if AddScore then
    self:AddCanonScore(AddScore)
  end
end

function BP_PaotaiComponent_C:AddCanonScore(Score)
  self.CanonScore = (self.CanonScore or 0) + Score
  self:RefreshSatr()
  EventManager:FireEvent(EventID.OnCanonScoreAdd, self.CanonScore, Score)
  DebugPrint("PaotaiComponent:AddCanonScore Score", Score, "CurrentScore:", self.CanonScore)
end

function BP_PaotaiComponent_C:RefreshSatr()
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local Info = DataMgr.PaotaiMiniGame[DungeonId]
  if Info and Info.Level then
    for Index, TargetScore in pairs(Info.Level) do
      if Index > self.Star and TargetScore <= self.CanonScore then
        self.Star = Index
      end
    end
  end
end

function BP_PaotaiComponent_C:GetScore()
  return self.CanonScore
end

function BP_PaotaiComponent_C:GetStar()
  return self.Star
end

function BP_PaotaiComponent_C:CustomFinishInfo()
  return {
    Score = self.CanonScore,
    Star = self.Star
  }
end

return BP_PaotaiComponent_C
