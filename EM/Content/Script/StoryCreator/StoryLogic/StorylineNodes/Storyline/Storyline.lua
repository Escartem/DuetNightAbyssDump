local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local Storyline = Class("StoryCreator.StoryLogic.StorylineNodes.Storyline.BaseStoryline")

function Storyline:Init(StorylineData, FileName, EndCallback, StopCallback, Payload)
  Storyline.Super.Init(self, StorylineData, FileName, EndCallback, StopCallback, Payload)
  self.Data = StorylineData
  self.FileName = FileName
  self.FilePath = FileName
  self.EndCallback = EndCallback
  self.StopCallback = StopCallback
  self.Payload = Payload
  self.UEWorldContext = GWorld.GameInstance
  self:TimerInit()
  self.WaitingRestartNodeList = {}
  self.RunningNodeList = {}
  self.bLockRunningNodeList = false
  self:BuildStoryline()
end

function Storyline:GetPayload(Key)
  return self.Payload and self.Payload[Key]
end

function Storyline:AddPayload(Key, Value)
  if not self.Payload then
    self.Payload = {}
  end
  self.Payload[Key] = Value
end

function Storyline:BuildStoryline()
  local NodeData
  if _G.bEnableNewSTLDataFeature then
    NodeData = self.Data.nodeData
  else
    NodeData = self.Data.storyNodeData
  end
  for NodeId, NodeData in pairs(NodeData) do
    local Node = StorylineUtils.CreateStoryNode(NodeData.type, self)
    if Node.IsStartNode then
      self:SetStartNode(Node)
    elseif Node.IsEndNode then
      self:SetEndNode(Node)
    elseif Node.IsSuccessNode then
      self:SetSuccessNode(Node)
    elseif Node.IsFailNode then
      self:SetFailNode(Node)
    end
    Node:BuildNode(NodeId, NodeData, nil)
    self:AddNode(NodeId, Node)
  end
  if not self:GetStartNode() then
    local Message = "\228\187\187\229\138\161\233\147\190\230\178\161\230\156\137StartStoryNode\232\191\158\231\186\191" .. [[

FileName:]] .. self.FileName
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\230\178\161\230\156\137StartStoryNode\232\191\158\231\186\191", Message)
    return
  end
  self.QuestChainId = self._StartNode.QuestChainId or 0
  DebugPrint("StorylineBuilder BuildStoryline QuestChainId", self.QuestChainId)
  self:BuildAdjacencyMap(self.Data.lineData, "startStory", "endStory")
  self.QuestIdNodeList = {}
  for _, Node in pairs(self:GetNodes()) do
    if Node.QuestId then
      self.QuestIdNodeList[Node.QuestId] = Node
    end
  end
end

function Storyline:StartStory(QuestId, NodeId)
  DebugPrint("Storyline StartStory QuestId:", QuestId, ",NodeId:", NodeId)
  if self.HasStarted then
    self.StartedNode = self.QuestIdNodeList[QuestId]
    self:StartNode(self.StartedNode, NodeId)
    return
  end
  if QuestId and 0 ~= QuestId then
    self.StartedNode = self.QuestIdNodeList[QuestId]
    if not self.StartedNode then
      local Message = "\228\187\187\229\138\161Id\228\184\141\229\173\152\229\156\168" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. QuestId
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161Id\228\184\141\229\173\152\229\156\168", Message)
      self:FinishStory()
      return
    end
    if self.QuestChainId and 0 ~= self.QuestChainId then
      local Avatar = GWorld:GetAvatar()
      if Avatar:IsQuestFinished(QuestId) then
        self.StartedNode:Finish("Success")
        return
      end
    end
  else
    self.StartedNode = self._StartNode
  end
  DebugPrint("Storyline Start", self.QuestChainId)
  self.RunningNodeList = {}
  self.HasStarted = true
  self.HasFinished = false
  self:StartNode(self.StartedNode, NodeId)
end

function Storyline:StartNode(Node, NodeId)
  if self.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Storyline \229\183\178\231\187\147\230\157\159\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.bLockRunningNodeList then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\229\183\178\233\148\129\229\174\154\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if Node.HasStarted then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\138\130\231\130\185\229\183\178\229\188\128\229\167\139\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if Node.QuestId then
    GWorld.StoryMgr:TryRemoveStoryBlackScreenOnSucc(self.QuestChainId, Node.QuestId)
  end
  Node.HasStarted = true
  Node.HasFinished = false
  self.RunningNodeList[Node.Key] = Node
  DebugPrint("----------------------------------------------------------StartNode ", Node:ToString())
  Node:Start(self, NodeId)
end

function Storyline:FinishNode(Node, OutPortNames, Result)
  if self.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Storyline \229\183\178\231\187\147\230\157\159\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.bLockRunningNodeList then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\229\183\178\233\148\129\229\174\154\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if Node.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\138\130\231\130\185\229\183\178\229\174\140\230\136\144\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  Node.HasFinished = true
  Node.HasStarted = false
  self.RunningNodeList[Node.Key] = nil
  DebugPrint("----------------------------------------------------------FinishNode", Result, Node:ToString())
  if Node == self._EndNode then
    self:FinishStory()
    return
  end
  if not self.QuestChainId or 0 == self.QuestChainId then
    local HaveFailOutPort = self:CheckHaveOutPort(OutPortNames, "Fail")
    local HaveNextNode = self:CheckHaveNextNode(Node, OutPortNames)
    if false == Result and false == HaveNextNode and HaveFailOutPort then
      self:StartNode(self._EndNode)
    else
      for _, OutPortName in pairs(OutPortNames) do
        local NodeInfoList = self:GetNextNodeInfoListByPortName(Node, OutPortName)
        if NodeInfoList then
          for _, NextNodeInfo in pairs(NodeInfoList) do
            local NextNode = NextNodeInfo.Node
            self:StartNode(NextNode)
          end
        end
      end
    end
  elseif not Result then
    self:AddToWaitingRestartNodeList(Node)
    GWorld.StoryMgr:AddToWaitingRestartList(self)
    if Node.bIsPlayBlackScreenOnFail then
      GWorld.StoryMgr:AddStoryBlackScreenOnFail()
    end
  elseif Node.bIsPlayBlackScreenOnComplete then
    local WaitingQuest = {}
    local QuestChainInfo = DataMgr.STLExportQuestChain[self.QuestChainId]
    if Node.QuestId == QuestChainInfo.EndQuestId then
      local QuestChainCInfo = DataMgr.ConditionId2QuestChainId[self.QuestChainId]
      if QuestChainCInfo then
        for QuestChainId, value in pairs(QuestChainCInfo) do
          local Avatar = GWorld:GetAvatar()
          local QuestChain = Avatar.QuestChains:GetQuestChain(QuestChainId)
          if QuestChain.IfAutoStart then
            table.insert(WaitingQuest, QuestChainId)
          end
        end
      end
    else
      local nextQuestInfo = QuestChainInfo.Quests[Node.QuestId]
      local nextQuestId = nextQuestInfo.nextQuestId
      table.insert(WaitingQuest, nextQuestId)
    end
    GWorld.StoryMgr:AddStoryBlackScreenOnSucc(WaitingQuest)
  end
end

function Storyline:FinishStory()
  if self.HasFinished then
    local Message = "\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159", Message)
    return
  end
  self:ClearStory()
  self.HasFinished = true
  self.HasStarted = false
  DebugPrint("Storyline Finish", self.QuestChainId)
  if self.EndCallback then
    self:EndCallback()
  end
  GWorld.StoryMgr:FinishStory(self.FilePath)
end

function Storyline:ClearStory(IgnoreFinishClear)
  self.bLockRunningNodeList = true
  local RunningNodes = {}
  for _, Node in pairs(self.RunningNodeList) do
    table.insert(RunningNodes, Node)
  end
  for _, Node in pairs(RunningNodes) do
    if Node.StopQuest then
      Node:StopQuest(IgnoreFinishClear)
    end
  end
  self.bLockRunningNodeList = false
  self.RunningNodeList = {}
  self.WaitingRestartNodeList = {}
end

function Storyline:Stop(IgnoreFinishClear)
  self:ClearStory(IgnoreFinishClear)
  self.HasFinished = true
  self.HasStarted = false
  if self.StopCallback then
    self:StopCallback()
  end
end

function Storyline:Success()
  for _, StoryNode in pairs(self.RunningNodeList) do
    if StoryNode.SuccessQuest then
      StoryNode:SuccessQuest()
    end
  end
end

function Storyline:PrintInfo()
  DebugPrint("---------------------------StorylineInfo---------------------------")
  DebugPrint("QuestchainId: ", self.QuestChainId)
  for _, StoryNode in pairs(self.RunningNodeList) do
    if StoryNode.PrintInfo then
      StoryNode:PrintInfo()
    end
  end
  DebugPrint("---------------------------StorylineInfo---------------------------")
end

function Storyline:TimerInit()
  if self.TimerHandles == nil then
    self.TimerHandles = {}
    self.TimerKeyIdx = 0
  end
end

function Storyline:AddCallback(Owner, Interval, func, IsLoop, NodeKey, HandleName, IsRealTime, ...)
  if nil == self then
    return
  end
  if nil == func then
    return
  end
  local Params = {
    ...
  }
  local CurNode = Owner
  if nil == Interval or Interval <= 0 then
    func(Owner, ...)
    return
  end
  if nil == HandleName then
    self.TimerKeyIdx = self.TimerKeyIdx + 1
    HandleName = "AutoMade_" .. self.TimerKeyIdx
  end
  self:RemoveCallback(NodeKey, HandleName)
  
  local function f(WorldContext)
    if not WorldContext then
      return
    end
    if not IsLoop then
      self:RemoveCallback(NodeKey, HandleName)
    end
    func(CurNode, table.unpack(Params))
  end
  
  local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
  if not self.TimerHandles[NodeKey] then
    self.TimerHandles[NodeKey] = {}
  end
  self.TimerHandles[NodeKey][HandleName] = Source.K2_SetTimerDelegate({
    self.UEWorldContext,
    f
  }, Interval, IsLoop, 0)
  return self.TimerHandles[NodeKey][HandleName]
end

function Storyline:RemoveCallback(NodeKey, HandleName, IsRealTime)
  if nil == HandleName then
    return
  end
  local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
  if nil ~= self.TimerHandles[NodeKey] and nil ~= self.TimerHandles[NodeKey][HandleName] then
    Source.K2_ClearAndInvalidateTimerHandle(self.UEWorldContext, self.TimerHandles[NodeKey][HandleName])
  elseif type(HandleName) == "userdata" then
    Source.K2_ClearAndInvalidateTimerHandle(self.UEWorldContext, HandleName)
  end
  if nil ~= NodeKey and self.TimerHandles[NodeKey] then
    self.TimerHandles[NodeKey][HandleName] = nil
  end
end

function Storyline:GetTimerSource(IsRealTime)
  if IsRealTime then
    return URuntimeCommonFunctionLibrary
  else
    return UE4.UKismetSystemLibrary
  end
end

function Storyline:StopStory()
  GWorld.StoryMgr:StopStoryline(self.FilePath)
end

function Storyline:CheckHaveNextNode(Node, OutPortNames)
  for _, OutPortName in pairs(OutPortNames) do
    local NodeInfoList = self:GetNextNodeInfoListByPortName(Node, OutPortName)
    if NodeInfoList then
      return true
    end
  end
  return false
end

function Storyline:CheckHaveOutPort(OutPortNames, TargetOutPortName)
  for _, OutPortName in pairs(OutPortNames) do
    if OutPortName == TargetOutPortName then
      return true
    end
  end
  return false
end

function Storyline:AddToWaitingRestartNodeList(Node)
  self.WaitingRestartNodeList[Node.Key] = Node
end

function Storyline:RestartNodes()
  local WaitingRestartNodes = {}
  for _, Node in pairs(self.WaitingRestartNodeList) do
    table.insert(WaitingRestartNodes, Node)
  end
  for _, Node in pairs(WaitingRestartNodes) do
    DebugPrint("Storyline RestartNode")
    Node.HasFinished = false
    self:StartNode(Node, nil)
  end
  self.WaitingRestartNodeList = {}
end

return Storyline
