local BossBattleFinishNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function BossBattleFinishNode:Init()
  self.SendMessage = ""
  self.FinishCondition = ""
end

function BossBattleFinishNode:Execute(CallBack)
  self.IsWaitForCallback = self.FinishCondition ~= ""
  DebugPrint("----- Init BossBattleFinishNode   SendMessage:", self.SendMessage, "FinishCondition:", self.FinishCondition, " \230\152\175\229\144\166\231\173\137\229\190\133\229\155\158\232\176\131", self.IsWaitForCallback, "----")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.IsWaitForCallback then
    function BossBattleCallback(Owner, EventName, Channel)
      if EventName == self.FinishCondition then
        DebugPrint("BossBattleFinishNode: Callback EventName:", EventName)
        
        CallBack()
      end
    end
    
    self.BossBattleCallback = BossBattleCallback
    GameMode.OnCustomEventDelegates:Add(GameInstance, BossBattleCallback)
  end
  GameMode:PostCustomEvent(self.SendMessage)
  if not self.IsWaitForCallback then
    CallBack()
  end
end

function BossBattleFinishNode:Clear()
  if self.BossBattleCallback then
    DebugPrint("BossBattleFinishNode: Clear")
    local GameInstance = GWorld.GameInstance
    local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
    GameMode.OnCustomEventDelegates:Remove(GameInstance, self.BossBattleCallback)
    self.BossBattleCallback = nil
  end
end

function BossBattleFinishNode:FinishAction()
  self:Finish()
end

return BossBattleFinishNode
