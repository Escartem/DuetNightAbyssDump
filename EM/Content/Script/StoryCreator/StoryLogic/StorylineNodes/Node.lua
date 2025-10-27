local Node = Class("StoryCreator.StoryLogic.StorylineNodes.NodeObject")

function Node:NodeInit(Context)
  self.Context = Context
  self:Init()
end

Node.InitFunction = Node.NodeInit

function Node:Init()
end

function Node:BuildNode(NodeId, Data, ExtraInfo)
  self.NodeId = NodeId
  self.Data = Data
  self.Key = Data.key
  self.Type = Data.type
  self.Name = Data.name
  self.PropsData = Data.propsData
  self.ConnectedNodeList = {}
  for k, v in pairs(self.PropsData) do
    self[k] = v
  end
  if ExtraInfo then
    for k, v in pairs(ExtraInfo) do
      self[k] = v
    end
  end
end

function Node:Start(Context, InportInfo)
end

function Node:NodeClear()
  self:Clear()
end

function Node:Clear()
end

function Node:Finish(OutPortNames, Result)
  if nil == OutPortNames then
    OutPortNames = {"Out"}
  elseif type(OutPortNames) == "string" then
    OutPortNames = {OutPortNames}
  end
  if nil == Result then
    Result = true
  end
  self:NodeClear()
  self.Context:FinishNode(self, OutPortNames, Result)
end

function Node:ConnectNode(OutPortName, NextNode)
  if not self.ConnectedNodeList[OutPortName] then
    self.ConnectedNodeList[OutPortName] = {}
  end
  table.insert(self.ConnectedNodeList[OutPortName], NextNode)
end

function Node:CanReach()
  self.Reachable = true
  for OutPortName, NextNodeList in pairs(self.ConnectedNodeList) do
    for _, NextNode in pairs(NextNodeList) do
      NextNode:CanReach()
    end
  end
end

function Node:ToString()
  local NameStr = self.Name or "invalid_name"
  local TypeStr = self.Type or "invalid_type"
  local QuestChainIdStr = self.Context and self.Context.QuestChainId or "invalid_questchainid"
  local KeyStr = self.Key or "invalid_key"
  return NameStr .. "  " .. TypeStr .. "  " .. QuestChainIdStr .. "  " .. KeyStr
end

function Node:GetNextNodeList(OutPortName)
  local NextNodeList = self.ConnectedNodeList[OutPortName]
  return NextNodeList
end

function Node:IsRunning()
  return self.HasStarted and not self.HasFinished
end

function Node:GetConnectedNodeMap()
  local ConnectedNodeMap = {}
  for _, ConnectedNodeList in pairs(self.ConnectedNodeList) do
    for _, ConnectedNode in pairs(ConnectedNodeList) do
      if ConnectedNodeMap[ConnectedNode.Key] == nil then
        ConnectedNodeMap[ConnectedNode.Key] = ConnectedNode
      end
    end
  end
  return ConnectedNodeMap
end

function Node:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  if self.Type == NodeType then
    table.insert(OutRunningNodeTable, self)
  end
end

return Node
