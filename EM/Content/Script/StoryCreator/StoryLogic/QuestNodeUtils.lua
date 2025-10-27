local QuestNodeUtils = {}

function QuestNodeUtils.STLTriggerActiveStaticCreator(QuestNode, StaticCreatorIds)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GWorld.Node = QuestNode
  local SpecialQuestId = QuestNode:GetPayload("SpecialQuestId")
  if SpecialQuestId then
    GameMode:TriggerActiveStaticCreator_SpecialQuestId(StaticCreatorIds, SpecialQuestId)
    return
  end
  local DynQuestId = QuestNode:GetPayload("DynQuestId")
  if DynQuestId then
    GameMode:TriggerActiveStaticCreator_DynQuestId(StaticCreatorIds, DynQuestId)
    return
  end
  if QuestNode.QuestChainId and QuestNode.QuestChainId > 0 then
    GameMode:TriggerActiveStaticCreator_QuestChainId(StaticCreatorIds, QuestNode.QuestChainId)
  else
    GameMode:TriggerActiveStaticCreator_NormalSTL(StaticCreatorIds)
  end
end

return QuestNodeUtils
