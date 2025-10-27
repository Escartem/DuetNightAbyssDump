local SendMessageNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SendMessageNode:Init()
  self.MessageType = ""
  self.MessageContent = {}
  self.UnitId = -1
end

function SendMessageNode:Start(Context)
  self.Context = Context
  self:SendMessageContent()
end

function SendMessageNode:SendMessageContent()
  DebugPrint("------------ SendMessageContent ------------------")
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
  if self.MessageType == "GameMode" then
    if not IsValid(GameMode) then
      return
    end
    GameMode:PostCustomEvent(self.MessageContent)
  elseif self.MessageType == "BehaviorTree" then
    local GameState = UE4.UGameplayStatics.GetGameState(GameMode)
    for _, Monster in pairs(GameState.MonsterMap) do
      self:QuestEventMonsterOrNpc(Monster)
    end
    for _, Npc in pairs(GameState.NpcMap) do
      self:QuestEventMonsterOrNpc(Npc)
    end
  end
  self:FinishAction()
end

function SendMessageNode:QuestEventMonsterOrNpc(AI)
  if IsValid(AI) and tonumber(self.UnitId) == tonumber(AI.UnitId) then
    local BB = AI:GetOwnBlackBoardComponent()
    if BB then
      BB:SetValueAsString("QuestEvent", self.MessageContent)
    else
      DebugPrint("ERROR:AI.UnitId:" .. AI.UnitId .. ", AI:GetName " .. AI:GetName() .. " BehaviorTree Is nil")
    end
  end
end

function SendMessageNode:FinishAction()
  self:Finish()
end

return SendMessageNode
