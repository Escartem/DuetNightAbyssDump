require("UnLua")
local BP_HijackComponent_C = Class()

function BP_HijackComponent_C:InitHijackComponent()
  self.GameMode = self:GetOwner()
  self.GameMode.EMGameState.NowPathId = 1
  self.GameMode.EMGameState.NextPathId = 1
  self.HijackInfo = DataMgr.Hijack[self.GameMode.DungeonId]
  if not self.HijackInfo then
    GameState(self):ShowDungeonError("HijackComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.Checkpoint = 0
  self.CurCheckpointMonNum = -1
  self.CurCheckpointEliteMonNum = -1
end

function BP_HijackComponent_C:InitHijackBaseInfo()
end

function BP_HijackComponent_C:GetNextPathInfos(NowPathId)
  local EMGameState = self.GameMode.EMGameState
  if EMGameState.NowPathId ~= NowPathId then
    return nil
  end
  if not EMGameState.HijackPathInfo then
    return nil
  end
  if not EMGameState.HijackPathInfo[NowPathId] then
    return nil
  end
  local NewNowPathId = EMGameState.RaplacePathMap:Find(EMGameState.NextPathId) or EMGameState.NextPathId
  if NewNowPathId and 0 ~= NewNowPathId and EMGameState.HijackPathInfo[NewNowPathId] then
    local NewPathInfos = EMGameState.HijackPathInfo[NewNowPathId]
    local NewNextPathId
    if NewPathInfos[#NewPathInfos] then
      NewNextPathId = NewPathInfos[#NewPathInfos].NextPathId
    end
    EMGameState.NowPathId = NewNowPathId
    EMGameState.NextPathId = NewNextPathId
    return EMGameState.HijackPathInfo[NewNowPathId]
  end
  return nil
end

function BP_HijackComponent_C:SetCheckpoint(Checkpoint)
  self.Checkpoint = Checkpoint
  self.CurCheckpointMonNum = self.HijackInfo.CheckpointMonsterNum[self.Checkpoint]
  self.CurCheckpointEliteMonNum = self.HijackInfo.CheckpointEilteMonsterNum[self.Checkpoint]
end

function BP_HijackComponent_C:CheckPointMonsterDead(Monster)
  if 0 == self.Checkpoint then
    return 0
  end
  if Monster:GetCamp() == ECampName.Monster then
    if -1 ~= self.CurCheckpointMonNum then
      self.CurCheckpointMonNum = self.CurCheckpointMonNum - 1
      if 0 == self.CurCheckpointMonNum then
        local Ret = self.Checkpoint
        self.Checkpoint = 0
        return Ret
      end
    end
    if -1 ~= self.CurCheckpointEliteMonNum and Monster:IsEliteMonster() then
      self.CurCheckpointEliteMonNum = self.CurCheckpointEliteMonNum - 1
      if 0 == self.CurCheckpointEliteMonNum then
        local Ret = self.Checkpoint
        self.Checkpoint = 0
        return Ret
      end
    end
  end
  return 0
end

function BP_HijackComponent_C:RemoveHijackTriggerBox(PathId, PathPointIndex)
  local EMGameState = self.GameMode.EMGameState
  if EMGameState.HijackPathInfo[PathId] == nil then
    GameState(self):ShowDungeonError("HijackComponent:\229\156\168\229\136\160\233\153\164\232\183\175\229\190\132\228\184\138\232\167\166\229\143\145\231\155\146\230\149\176\230\141\174\233\148\153\232\175\175\239\188\140PathId\228\184\141\229\173\152\229\156\168 PathId: " .. PathId .. "   PathPointIndex: " .. PathPointIndex)
    return
  end
  if EMGameState.HijackPathInfo[PathId][PathPointIndex] == nil then
    GameState(self):ShowDungeonError("HijackComponent:\229\156\168\229\136\160\233\153\164\232\183\175\229\190\132\228\184\138\232\167\166\229\143\145\231\155\146\230\149\176\230\141\174\233\148\153\232\175\175\239\188\140PathPointIndex\228\184\141\229\173\152\229\156\168 PathId: " .. PathId .. "   PathPointIndex: " .. PathPointIndex)
    return
  end
  local TargetPoint = EMGameState.HijackPathInfo[PathId][PathPointIndex]
  TargetPoint:DestroyTriggerBox(EDestroyReason.UnitLabel)
end

return BP_HijackComponent_C
