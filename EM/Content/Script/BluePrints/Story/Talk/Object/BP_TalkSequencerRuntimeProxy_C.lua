local M = Class()

function M:SetUpLua(TalkTask)
  assert(nil ~= TalkTask, "TalkSequencerProxy: TalkSequencerRuntimeProxy Setup Failed, TalkTask is nil")
  self.TalkTask = TalkTask
  self:InitAfterSetupLua()
end

function M:RealShowMediaUI_Lua(bShow)
  DebugPrint("TalkSequencerProxy:RealShowMediaUI_Lua", bShow)
  local TalkTask = self.TalkTask
  if TalkTask and TalkTask.OnSequenceShowVideoUI then
    TalkTask:OnSequenceShowVideoUI(bShow)
  end
end

function M:SendGameModeMessage_Lua(Content)
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
  if not IsValid(GameMode) then
    return
  end
  GameMode:PostCustomEvent(Content)
end

function M:SendBehaviorMessage_Lua(UnitId, Content)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not IsValid(GameState) then
    return
  end
  for _, Monster in pairs(GameState.MonsterMap) do
    self:QuestEventMonsterOrNpc(Monster, UnitId, Content)
  end
  for _, Npc in pairs(GameState.NpcMap) do
    self:QuestEventMonsterOrNpc(Npc, UnitId, Content)
  end
end

function M:QuestEventMonsterOrNpc(AI, UnitId, Content)
  if IsValid(AI) and tonumber(UnitId) == tonumber(AI.UnitId) then
    local BB = AI:GetOwnBlackBoardComponent()
    if BB then
      BB:SetValueAsString("QuestEvent", Content)
    else
      DebugPrint("ERROR:AI.UnitId:" .. AI.UnitId .. ", AI:GetName " .. AI:GetName() .. " BehaviorTree Is nil")
    end
  end
end

return M
