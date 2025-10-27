local FQuestDetails = require("StoryCreator.StoryLogic.QuestDetails")
local StorylineUtils = {}
StorylineUtils.QuestNodePath = "StoryCreator.StoryLogic.StorylineNodes.QuestNodes"
StorylineUtils.StoryNodePath = "StoryCreator.StoryLogic.StorylineNodes.StoryNodes"
StorylineUtils.StorylinePath = "StoryCreator.StoryLogic.StorylineNodes.Storyline"
StorylineUtils.QuestlinePath = "StoryCreator.StoryLogic.StorylineNodes.Questline"
StorylineUtils.ImpressionlinePath = "StoryCreator.StoryLogic.StorylineNodes.Impressionline"

function StorylineUtils.GMCreateQuestNode(NodeType, Args)
  local Node = StorylineUtils.CreateQuestNode(NodeType, CommonUtils.EmptyProxy)
  Node:BuildNode(nil, {propsData = Args}, {})
  return Node
end

StorylineUtils.ETalkNodeFinishType = {
  Stop = 1,
  Out = 2,
  Option = 3,
  Fail = 4
}
StorylineUtils.EMonitorNodeFinishType = {Changed = 1, Unchanged = 2}
StorylineUtils.EActorEventType = {
  OnCreated = "OnCreated",
  OnTriggerAOIBase = "OnTriggerAOIBase",
  OnActorDestroyed = "OnActorDestroyed"
}
StorylineUtils.EssentialStoryNode = {
  StoryStartNode = "StoryStartNode",
  StoryEndNode = "StoryEndNode"
}
StorylineUtils.EssentialQuestNode = {
  QuestStartNode = "QuestStartNode",
  QuestSuccessNode = "QuestSuccessNode",
  QuestFailNode = "QuestFailNode"
}
local NodeClassList = {}

function StorylineUtils._CreateNode(Path, NodeType, Context)
  if not NodeClassList[NodeType] then
    if string.sub(NodeType, -4) ~= "Node" then
      local Message = "\230\137\128\229\136\155\229\187\186\232\138\130\231\130\185\231\154\132\231\177\187\229\158\139\229\144\141\230\178\161\230\156\137\228\187\165Node\231\187\147\229\176\190" .. [[

NodeType:]] .. NodeType
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\230\137\128\229\136\155\229\187\186\232\138\130\231\130\185\231\154\132\231\177\187\229\158\139\229\144\141\230\178\161\230\156\137\228\187\165Node\231\187\147\229\176\190", Message)
      return
    end
    local QuestNodeFileName = string.format("%s.%s", Path, NodeType)
    local NodeClass = require(QuestNodeFileName)
    if NodeClass then
      NodeClassList[NodeType] = NodeClass
    end
  end
  local NodeClass = NodeClassList[NodeType]
  if NodeClass then
    return NodeClass(Context)
  else
    local Message = "\229\136\155\229\187\186\232\138\130\231\130\185\230\151\182\239\188\140\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\177\187\229\158\139\231\154\132\232\138\130\231\130\185" .. [[

NodeType:]] .. NodeType
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\188\128\229\167\139StoryNode\230\151\182\239\188\140\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159", Message)
    return nil
  end
end

function StorylineUtils.CreateStoryNode(NodeType, Context)
  local Path = StorylineUtils.StoryNodePath
  if StorylineUtils.EssentialStoryNode[NodeType] or "StoryNode" == NodeType or "PreStoryNode" == NodeType then
    Path = StorylineUtils.StorylinePath
  end
  return StorylineUtils._CreateNode(Path, NodeType, Context)
end

function StorylineUtils.CreateQuestNode(NodeType, Context)
  local Path = StorylineUtils.QuestNodePath
  if StorylineUtils.EssentialQuestNode[NodeType] then
    Path = StorylineUtils.QuestlinePath
  end
  return StorylineUtils._CreateNode(Path, NodeType, Context)
end

function StorylineUtils.BuildStoryline(FileName, EndCallback, StopCallback, Payload)
  local FileData = StorylineUtils.GetFileData(FileName)
  if nil == FileData then
    DebugPrint("Warning: StorylineUtils.BuildStoryline: FileData is Empty")
    return nil
  end
  local Storyline = require("StoryCreator.StoryLogic.StorylineNodes.Storyline.Storyline")
  return Storyline(FileData, FileName, EndCallback, StopCallback, Payload)
end

function StorylineUtils.BuildStorylineByLongFileName(LongFileName, EndCallback, StopCallback, Payload)
  local FileData = require(StorylineUtils.GetBaseFileName(LongFileName))
  assert(FileData, string.format("Can't not found storyline file named %s", LongFileName))
  local Storyline = require("StoryCreator.StoryLogic.StorylineNodes.Storyline.Storyline")
  return Storyline(FileData, LongFileName, EndCallback, StopCallback, Payload)
end

function StorylineUtils.CreateQuestDetails(QuestChainId)
  local QuestChainInfo = DataMgr.QuestChain[QuestChainId]
  if nil == QuestChainInfo then
    DebugPrint("Warning: StorylineUtils.CreateQuestDetails: QuestChainInfo is Empty")
    return nil
  end
  local FileName = QuestChainInfo.StoryPath
  if nil == FileName then
    DebugPrint("Warning: StorylineUtils.CreateQuestDetails: FileName is Empty")
    return nil
  end
  local Storyline = GWorld.StoryMgr:GetStory(FileName)
  Storyline = Storyline or StorylineUtils.BuildStoryline(FileName)
  if nil == Storyline then
    DebugPrint("Warning: StorylineUtils.CreateQuestDetails: Storyline is Empty")
    return nil
  end
  return FQuestDetails:New(Storyline)
end

function StorylineUtils.GetFileData(FileName)
  local RequirePath = StorylineUtils.GetRequirePath(FileName)
  if nil == RequirePath then
    DebugPrint("Warning: StorylineUtils.GetFileData: RequirePath is Empty")
    return nil
  end
  return require(RequirePath)
end

function StorylineUtils.GetRequirePath(FileName)
  local BaseFileName = StorylineUtils.GetBaseFileName(FileName)
  if nil == BaseFileName then
    DebugPrint("Warning: StorylineUtils.GetRequirePath: BaseFileName is Empty")
    return nil
  end
  return "StoryCreator.StoryFiles." .. BaseFileName
end

function StorylineUtils.GetBaseFileName(FileName)
  if nil == FileName then
    DebugPrint("Warning: StorylineUtils.GetBaseFileName: FileName is Empty")
    return nil
  end
  if string.sub(FileName, -6) == ".story" then
    return string.sub(FileName, 1, string.len(FileName) - 6)
  end
  return FileName
end

function StorylineUtils.MarkGuideStoryError()
  StorylineUtils.IsGuideStoryError = true
end

function StorylineUtils.GetOnceGuideStoryError()
  local Error = StorylineUtils.IsGuideStoryError
  StorylineUtils.IsGuideStoryError = nil
  return Error
end

function StorylineUtils.IsGuideNodeRunning()
  if SystemGuideManager.IsGuideStoryRunning then
    return not StorylineUtils.IsGuideStoryError
  end
  for _, Storyline in pairs(GWorld.StoryMgr.Storylines) do
    if Storyline.HasFinished then
    else
      for _, StoryNode in pairs(Storyline.RunningNodeList or {}) do
        if StoryNode.Questline and not StoryNode.Questline.HasFinished then
          for _, QuestNode in pairs(StoryNode.Questline.RunningNodeList or {}) do
            if QuestNode.IsGuideNode and QuestNode:IsGuideNode() then
              return not StorylineUtils.IsGuideStoryError
            end
          end
        end
        if StoryNode.Impressionline and not StoryNode.Impressionline.HasFinished then
          for _, QuestNode in pairs(StoryNode.Impressionline.RunningNodeList or {}) do
            if QuestNode.IsGuideNode and QuestNode:IsGuideNode() then
              return not StorylineUtils.IsGuideStoryError
            end
          end
        end
      end
      if string.startswith(string.lower(Storyline.FilePath), "guide/") then
        return not StorylineUtils.IsGuideStoryError
      end
    end
  end
  return false
end

return StorylineUtils
