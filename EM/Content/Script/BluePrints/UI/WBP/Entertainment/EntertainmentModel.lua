local M = Class("BluePrints.Common.MVC.Model")
local Deque = require("BluePrints.Common.DataStructure").Deque
local EntertainmentUtil = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local WaitProcess = {}
WaitProcess.__metatable = {__index = WaitProcess}

function WaitProcess.New(...)
  local Obj = {}
  setmetatable(Obj, WaitProcess.__metatable)
  Obj:Init(...)
  return Obj
end

function WaitProcess:Init(...)
  self.Queue = Deque.New()
end

function WaitProcess:AddProcess(Task)
  self.Queue:PushBack(Task)
end

function WaitProcess:NextTask()
  if not self.bIsApply then
    return
  end
  local Task = self.Queue:PopFront()
  Task(function()
    if self.Queue:IsEmpty() then
      self.bIsApply = false
      return
    end
    self:NextTask()
  end)
end

function WaitProcess:ApplyTask()
  if self.Queue:IsEmpty() or self.bIsApply then
    return
  end
  self.bIsApply = true
  self:NextTask()
end

function WaitProcess:Stop()
  self.bIsApply = false
end

function M:Init()
  M.Super.Init(self)
  self:RefreshRedState()
  EventManager:AddEvent(EventID.OnNewCharObtained, self, self.OnNewCharObtained)
  EventManager:AddEvent(EventID.OnCharDeleted, self, self.OnCharDeleted)
  self:TryListenEvent()
end

function M:TryListenEvent()
  local Avatar = self:GetAvatar()
  if Avatar and Avatar:CheckSubRegionType(Avatar:GetCurrentRegionId(), CommonConst.SubRegionType.Home) then
    EventManager:AddEvent(EventID.OnResourcesChanged, self, self.RefreshRedState)
    EventManager:AddEvent(EventID.QuestChainFinished, self, self.RefreshRedState)
    EventManager:AddEvent(EventID.OnPropSetResources, self, self.RefreshRedState)
  end
end

function M:Destory()
  M.Super.Destory(self)
  EventManager:RemoveEvent(EventID.OnNewCharObtained, self)
  EventManager:RemoveEvent(EventID.OnCharDeleted, self)
  EventManager:RemoveEvent(EventID.OnResourcesChanged, self)
  EventManager:RemoveEvent(EventID.QuestChainFinished, self)
  EventManager:RemoveEvent(EventID.OnPropSetResources, self)
  if self.WaitQueue then
    self.WaitQueue:Stop()
    self.WaitQueue = nil
  end
end

function M:OnNewCharObtained(CharUuid)
  self:RefreshCharReddot(CharUuid)
end

function M:OnCharDeleted(CharUuid)
  self:RefreshCharReddot(CharUuid)
end

function M:GetCharNodeName()
  if not self._NodeName then
    self._NodeName = DataMgr.ReddotNode.Entertainment_Char.Name
  end
  return self._NodeName
end

function M:RefreshCharReddot(Uuid)
  local NodeName = self:GetCharNodeName()
  if not ReddotManager.GetTreeNode(NodeName) then
    ReddotManager.AddNodeEx(NodeName)
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
  if not EntertainmentUtil:IsCharacterShowRedDot(Uuid) then
    if CacheDetail[Uuid] then
      ReddotManager.DecreaseLeafNodeCount(NodeName, 1)
    end
    CacheDetail[Uuid] = nil
  else
    if not CacheDetail[Uuid] then
      ReddotManager.IncreaseLeafNodeCount(NodeName, 1)
    end
    CacheDetail[Uuid] = true
  end
end

function M:RefreshRedState()
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  local AllChars = Avatar.PartyNpcs
  for Uuid, Char in pairs(AllChars) do
    self:RefreshCharReddot(Uuid)
  end
end

function M:TryGetWaitQueue()
  if not self.WaitQueue then
    self.WaitQueue = WaitProcess.New()
  end
  return self.WaitQueue
end

return M
