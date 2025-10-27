require("UnLua")
local Str = require("BluePrints.Common.DataStructure")
local Heap = Str.Heap
local BP_KDTree_C = Class()

local function GetVectorComponent(vec, index)
  if 1 == index then
    return vec.X
  end
  if 2 == index then
    return vec.Y
  end
  if 3 == index then
    return vec.Z
  end
end

local function SetVectorComponent(vec, index, value)
  if 1 == index then
    vec.X = value
    return
  end
  if 2 == index then
    vec.Y = value
    return
  end
  if 3 == index then
    vec.Z = value
    return
  end
end

function BP_KDTree_C:ReceiveBeginPlay()
end

function BP_KDTree_C:SetData(table, func)
  self.data = {}
  for i, v in ipairs(table) do
    self.data[i] = table[i]
  end
  self.GetLocFunc = func
end

local function QuickSort(array, start, last, compareFunc)
  if start >= last - 1 then
    return
  end
  local l = start
  local r = last - 1
  local pivot = l
  while l < r do
    while l < r and compareFunc(array[r], array[pivot]) >= 0 do
      r = r - 1
    end
    while l < r and compareFunc(array[l], array[pivot]) <= 0 do
      l = l + 1
    end
    if r > l then
      local temp = array[l]
      array[l] = array[r]
      array[r] = temp
    end
  end
  local temp = array[r]
  array[r] = array[pivot]
  array[pivot] = temp
  pivot = r
  QuickSort(array, start, pivot, compareFunc)
  QuickSort(array, pivot + 1, last, compareFunc)
end

function BP_KDTree_C:CompareFunc(axisType)
  return function(t1, t2)
    local loc1 = self.GetLocFunc(t1)
    local loc2 = self.GetLocFunc(t2)
    assert(loc1 and loc2, "Cant get location")
    local component1 = GetVectorComponent(loc1, axisType)
    local component2 = GetVectorComponent(loc2, axisType)
    if component1 > component2 then
      return 1
    end
    if component1 == component2 then
      return 0
    end
    if component1 < component2 then
      return -1
    end
  end
end

function BP_KDTree_C:BuildKDTree()
  assert(self.axisNum >= 2 and self.axisNum <= 3)
  if 0 == #self.data then
    error("Build KDTree failed! null data")
    return
  end
  self.headNode = self:CreateNode(1, #self.data + 1, self:GetStartAxis(), nil)
end

function BP_KDTree_C:CreateNode(start, last, axisType, parent)
  if last - start > self.maxNodeNum then
    local node = {}
    QuickSort(self.data, start, last, self:CompareFunc(axisType))
    local median = math.floor((start + last) / 2)
    node.axisType = axisType
    node.parent = parent
    node.nodeNum = last - start
    node.dataIndex = median
    node.axisValue = GetVectorComponent(self.GetLocFunc(self.data[median]), axisType)
    self:DebugTreeNode(node, parent, start)
    node.left = self:CreateNode(start, median, axisType % self.axisNum + 1, node)
    node.right = self:CreateNode(median + 1, last, axisType % self.axisNum + 1, node)
    return node
  else
    local node = {}
    self:DebugTreeNode(node, parent, start)
    node.start = start
    node.last = last
    node.nodeNum = last - start
    node.parent = parent
    return node
  end
end

function BP_KDTree_C:GetStartAxis()
  return 1
end

local function SquaredDistance(v1, v2)
  return (v2.X - v1.X) ^ 2 + (v2.Y - v1.Y) ^ 2 + (v2.Z - v1.Z) ^ 2
end

local function PushHeap(heap, element, maxNum)
  if maxNum > #heap.data then
    heap:PushHeap(element)
    return
  end
  local topDis = heap:HeapTop().sqDis
  if topDis > element.sqDis then
    heap:PopHeap()
    heap:PushHeap(element)
  end
end

function BP_KDTree_C:GetClosestPoints(tacmapManager, searchPos, num)
  local closestPoints = Heap.New()
  closestPoints:SetData({}, function(t1, t2)
    if t1.sqDis < t2.sqDis then
      return -1
    end
    if t1.sqDis == t2.sqDis then
      return 0
    end
    if t1.sqDis > t2.sqDis then
      return 1
    end
  end)
  local visit = {}
  local currentNode = self.headNode
  while true do
    local leafNode = self:FindLeafNode(currentNode, searchPos)
    visit[leafNode] = true
    for i = leafNode.start, leafNode.last - 1 do
      PushHeap(closestPoints, {
        index = i,
        sqDis = SquaredDistance(self.GetLocFunc(self.data[i]), searchPos)
      }, num)
    end
    currentNode = leafNode
    while currentNode ~= self.headNode do
      currentNode = currentNode.parent
      if nil == visit[currentNode] or false == visit[currentNode] then
        visit[currentNode] = true
        local dataIndex = currentNode.dataIndex
        PushHeap(closestPoints, {
          index = dataIndex,
          sqDis = SquaredDistance(self.GetLocFunc(self.data[dataIndex]), searchPos)
        }, num)
        if num > #closestPoints.data or (GetVectorComponent(searchPos, currentNode.axisType) - currentNode.axisValue) ^ 2 < closestPoints:HeapTop().sqDis then
          currentNode = GetVectorComponent(searchPos, currentNode.axisType) <= currentNode.axisValue and currentNode.right or currentNode.left
          break
        end
      end
    end
    if currentNode == self.headNode then
      break
    end
  end
  QuickSort(closestPoints.data, 1, num + 1, function(a, b)
    if a.sqDis < b.sqDis then
      return -1
    end
    if a.sqDis == b.sqDis then
      return 0
    end
    if a.sqDis > b.sqDis then
      return 1
    end
  end)
  local ret_nodes = {}
  for i = 1, num do
    local dataIndex = closestPoints.data[i].index
    ret_nodes[#ret_nodes + 1] = self.data[dataIndex]
  end
  return ret_nodes
end

function BP_KDTree_C:FindLeafNode(node, searchPos)
  if node.nodeNum <= self.maxNodeNum then
    return node
  end
  local axisType = node.axisType
  if GetVectorComponent(searchPos, axisType) <= node.axisValue then
    return self:FindLeafNode(node.left, searchPos)
  else
    return self:FindLeafNode(node.right, searchPos)
  end
end

function BP_KDTree_C:DebugTreeNode(node, parent, start)
end

return BP_KDTree_C
