local FQuestNodeQuestInfo = {}

function FQuestNodeQuestInfo:New(QuestNode)
  if nil == QuestNode then
    DebugPrint("Warning: FQuestNodeQuestInfo.New: QuestNode is Empty")
    return nil
  end
  local QuestNodeQuestInfo = setmetatable({}, {__index = FQuestNodeQuestInfo})
  QuestNodeQuestInfo.Type = QuestNode.Type
  QuestNodeQuestInfo.PropsData = QuestNode.PropsData
  return QuestNodeQuestInfo
end

local FStoryNodeQuestInfo = {}

function FStoryNodeQuestInfo:New(StoryNode)
  if nil == StoryNode then
    DebugPrint("Warning: FStoryNodeQuestInfo.New: StoryNode is Empty")
    return nil
  end
  local StoryNodeQuestInfo = setmetatable({}, {__index = FStoryNodeQuestInfo})
  StoryNodeQuestInfo.Type = StoryNode.Type
  StoryNodeQuestInfo.PropsData = StoryNode.PropsData
  StoryNodeQuestInfo.QuestNodeQuestInfos = {}
  if StoryNode.GetValidQuestNodeMap then
    local ChildNodes = StoryNode:GetChildNodes()
    for _, QuestNode in pairs(ChildNodes) do
      StoryNodeQuestInfo.QuestNodeQuestInfos[QuestNode.Key] = FQuestNodeQuestInfo:New(QuestNode)
    end
  end
  return StoryNodeQuestInfo
end

local FQuestDetails = {}

function FQuestDetails:New(Storyline)
  local QuestDetails = setmetatable({}, {__index = FQuestDetails})
  QuestDetails.QuestStoryNodeQuestInfos = {}
  local Nodes = Storyline:GetNodes()
  for _, StoryNode in pairs(Nodes) do
    if StoryNode.PropsData.QuestId then
      QuestDetails.QuestStoryNodeQuestInfos[StoryNode.PropsData.QuestId] = FStoryNodeQuestInfo:New(StoryNode)
    end
  end
  return QuestDetails
end

return FQuestDetails
