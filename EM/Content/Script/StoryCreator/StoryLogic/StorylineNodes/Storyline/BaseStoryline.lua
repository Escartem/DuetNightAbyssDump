local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local BaseStoryline = Class("StoryCreator.StoryLogic.StorylineNodes.NodeObject")

function BaseStoryline:Init(...)
  self.Nodes = {}
end

function BaseStoryline:GetStartNode()
  return self._StartNode
end

function BaseStoryline:SetStartNode(Node)
  self._StartNode = Node
end

function BaseStoryline:GetEndNode()
  return self._EndNode
end

function BaseStoryline:SetEndNode(Node)
  self._EndNode = Node
end

function BaseStoryline:GetSuccessNode()
  return self._SuccessNode
end

function BaseStoryline:SetSuccessNode(Node)
  self._SuccessNode = Node
end

function BaseStoryline:GetFailNode()
  return self._FailNode
end

function BaseStoryline:SetFailNode(Node)
  self._FailNode = Node
end

function BaseStoryline:AddNode(Key, Value)
  self.Nodes[Key] = Value
end

function BaseStoryline:RemoveNode(Key)
  self.Nodes[Key] = nil
end

function BaseStoryline:GetNode(Key)
  return self.Nodes[Key]
end

function BaseStoryline:GetNodes()
  return self.Nodes
end

function BaseStoryline:RemoveUnreachableNode()
  local OpenList = {}
  local CanReachNodes = {}
  local StartNode = self:GetStartNode()
  CanReachNodes[StartNode.NodeId] = 1
  table.insert(OpenList, StartNode)
  while #OpenList > 0 do
    local Node = table.remove(OpenList)
    local PortNameToNodeInfoList = self:GetNextNodeInfoList(Node)
    if PortNameToNodeInfoList then
      for _, NextNodeInfoList in pairs(PortNameToNodeInfoList) do
        for _, NextNodeInfo in ipairs(NextNodeInfoList) do
          local NextNode = NextNodeInfo.Node
          if not CanReachNodes[NextNode.NodeId] then
            CanReachNodes[NextNode.NodeId] = 1
            table.insert(OpenList, NextNode)
          end
        end
      end
    end
  end
  local CanNotReachNodes = {}
  for NodeId, _ in pairs(self:GetNodes()) do
    if not CanReachNodes[NodeId] then
      CanNotReachNodes[NodeId] = 1
    end
  end
  for NodeId, _ in pairs(CanNotReachNodes) do
    self:RemoveNode(NodeId)
  end
end

function BaseStoryline:BuildAdjacencyMap(ALlLineData, StartNodeName, EndNodeName)
  self.AdjacencyMap = {}
  if _G.bEnableNewSTLDataFeature then
    for _, LineData in pairs(ALlLineData) do
      local StartNode = self:GetNode(LineData.startNodeKey)
      local EndNode = self:GetNode(LineData.endNodeKey)
      self:ConnectNode(StartNode, LineData.startNodePort, EndNode, LineData.endNodePort)
    end
  else
    for _, LineData in pairs(ALlLineData) do
      local StartNodeKey = LineData[StartNodeName]
      local StartNode = self:GetNode(StartNodeKey)
      local StartPortName = LineData.startPort
      local EndNodeKey = LineData[EndNodeName]
      local EndNode = self:GetNode(EndNodeKey)
      local EndPortName = LineData.endPort
      self:ConnectNode(StartNode, StartPortName, EndNode, EndPortName)
    end
  end
  self:RemoveUnreachableNode()
end

function BaseStoryline:ConnectNode(StartNode, StartPortName, EndNode, EndPortName)
  self.AdjacencyMap[StartNode] = self.AdjacencyMap[StartNode] or {}
  if not self.AdjacencyMap[StartNode][StartPortName] then
    self.AdjacencyMap[StartNode][StartPortName] = {}
  end
  table.insert(self.AdjacencyMap[StartNode][StartPortName], {Node = EndNode, InPortName = EndPortName})
end

function BaseStoryline:GetNextNodeInfoList(Node)
  return self.AdjacencyMap and self.AdjacencyMap[Node]
end

function BaseStoryline:GetLastNodeInfo(QuestNode)
  local AllLineData = self:GetAllLineData()
  if _G.bEnableNewSTLDataFeature then
    for _, LineData in pairs(ALlLineData) do
      local EndNode = self:GetNode(LineData.endNodeKey)
      if EndNode == QuestNode then
        local StartNode = self:GetNode(LineData.startNodeKey)
        return {
          Node = StartNode,
          OutPortName = LineData.startNodePort
        }
      end
    end
  else
    for _, LineData in pairs(AllLineData) do
      local EndNodeKey = LineData.endQuest
      local EndNode = self:GetNode(EndNodeKey)
      if EndNode == QuestNode then
        local StartNodeKey = LineData.startQuest
        local StartNode = self:GetNode(StartNodeKey)
        local StartPortName = LineData.startPort
        return {Node = StartNode, OutPortName = StartPortName}
      end
    end
  end
  return
end

function BaseStoryline:GetNextNodeInfoListByPortName(QuestNode, OutPortName)
  return self.AdjacencyMap and self.AdjacencyMap[QuestNode] and self.AdjacencyMap[QuestNode][OutPortName]
end

function BaseStoryline:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  for _, Node in pairs(self.RunningNodeList) do
    Node:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  end
end

function BaseStoryline:GetAllLineData()
  return {}
end

return BaseStoryline
