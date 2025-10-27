local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local Region = require("BluePrints.Client.CustomTypes.Region")
local SpecialQuestData = Class("SpecialQuestData", CustomTypes.CustomAttr)
SpecialQuestData.__Props__ = {
  SpecialQuestId = prop.prop("Int", "client save"),
  SpecialQuestState = prop.prop("Int", "client save"),
  StartTime = prop.prop("Int", "client save")
}

function SpecialQuestData:Init(SpecialQuestId)
  self.SpecialQuestId = SpecialQuestId
  self.SpecialQuestState = CommonConst.SpecialQuestState.NoneStart
end

function SpecialQuestData:SetState(SpecialQuestState)
  self.SpecialQuestState = SpecialQuestState
end

function SpecialQuestData:GetState()
  return self.SpecialQuestState
end

function SpecialQuestData:IsInActive()
  return self.SpecialQuestState == CommonConst.SpecialQuestState.NoneStart
end

function SpecialQuestData:IsDoing()
  return self.SpecialQuestState == CommonConst.SpecialQuestState.Doing
end

function SpecialQuestData:IsSuccess()
  return self.SpecialQuestState == CommonConst.SpecialQuestState.Success
end

function SpecialQuestData:IsFailer()
  return self.SpecialQuestState == CommonConst.SpecialQuestState.Failer
end

function SpecialQuestData:ResetState()
  self.StartTime = 0
  self.SpecialQuestState = CommonConst.SpecialQuestState.NoneStart
end

FormatProperties(SpecialQuestData)
local SpecialQuestDataDict = Class("SpecialQuestDataDict", CustomTypes.CustomDict)
SpecialQuestDataDict.KeyType = BaseTypes.Int
SpecialQuestDataDict.ValueType = SpecialQuestData

function SpecialQuestDataDict:NewSpecialQuestData(SpecialQuestId)
  return SpecialQuestData(SpecialQuestId)
end

function SpecialQuestDataDict:GetNewSpecialQuestData(SpecialQuestId)
  if not self[SpecialQuestId] then
    self[SpecialQuestId] = self:NewSpecialQuestData(SpecialQuestId)
  end
  return self[SpecialQuestId]
end

function SpecialQuestDataDict:GetSpecialQuestData(SpecialQuestId)
  return self[SpecialQuestId]
end

local QuestData = Class("QuestData", CustomTypes.CustomAttr)
QuestData.__Props__ = {
  TargetId = prop.prop("Int", "client save"),
  CurrentProgress = prop.prop("Int", "client save"),
  TargetProgress = prop.prop("Int", "client save")
}

function QuestData:Init(TargetId)
  if not TargetId then
    return
  end
  self:ResetQuestData(TargetId)
end

function QuestData:ResetQuestData(TargetId)
  self.TargetId = TargetId
  self.CurrentProgress = 0
  self.TargetProgress = 0
end

function QuestData:SetTargetId(TargetId)
  if TargetId and self.TargetId == TargetId then
    return
  end
  self.TargetId = TargetId
end

function QuestData:GetTargetId()
  return self.TargetId
end

function QuestData:SetCurrentProgress(Count)
  if not Count or Count <= 0 then
    return
  end
  self.CurrentProgress = self.CurrentProgress + Count
end

function QuestData:GetCurrentProgress()
  return self.CurrentProgress
end

function QuestData:SetTargetProgress(TargetCount)
  if not TargetCount or TargetCount <= 0 then
    return
  end
  self.TargetProgress = TargetCount
end

function QuestData:GetTargetProgress()
  return self.TargetProgress
end

function QuestData:IsComplete()
  return 0 ~= self.CurrentProgress and 0 ~= self.TargetProgress and self.TargetProgress == self.CurrentProgress
end

FormatProperties(QuestData)
local QuestPickAttr = Class("QuestPickAttr", CustomTypes.CustomAttr)
QuestPickAttr.__Props__ = {
  QuestPickId = prop.prop("Int", "client save"),
  CurrentPickCount = prop.prop("Int", "client save"),
  TargetPickCount = prop.getter("Data", "PickupCount"),
  QuestChainId = prop.getter("Data", "QuestChainId")
}

function QuestPickAttr:Init(QuestPickId)
  self.QuestPickId = QuestPickId
end

function QuestPickAttr:Data()
  return DataMgr.QuestPickup[self.QuestPickId]
end

function QuestPickAttr:ResetPickCount()
  self.CurrentPickCount = 0
end

function QuestPickAttr:AddPickCount(PickupCount)
  if PickupCount <= 0 then
    return
  end
  self.CurrentPickCount = self.CurrentPickCount + PickupCount
end

function QuestPickAttr:SelfAddPickCount()
  self.CurrentPickCount = self.CurrentPickCount + 1
end

function QuestPickAttr:GetCurrentPickCount()
  return self.CurrentPickCount
end

function QuestPickAttr:IsComplete()
  return self.CurrentPickCount >= self.TargetPickCount and self.TargetPickCount > 0
end

FormatProperties(QuestPickAttr)
local QuestPickDict = Class("QuestPickDict", CustomTypes.CustomDict)
QuestPickDict.KeyType = BaseTypes.Int
QuestPickDict.ValueType = QuestPickAttr

function QuestPickDict:NewQuestPickAttr(QuestPickId)
  return QuestPickAttr(QuestPickId)
end

function QuestPickDict:GetQuestPickAttr(QuestPickId)
  return self[QuestPickId]
end

function QuestPickDict:GetNewQuestPickAttr(QuestPickId)
  if not self[QuestPickId] then
    self[QuestPickId] = self:NewQuestPickAttr(QuestPickId)
  end
  return self[QuestPickId]
end

local QuestDataDict = Class("QuestDataDict", CustomTypes.CustomDict)
QuestDataDict.KeyType = BaseTypes.Int
QuestDataDict.ValueType = QuestData

function QuestDataDict:NewQuestData(TargetId)
  return QuestData(TargetId)
end

function QuestDataDict:GetQuestData(QuestId)
  return self[QuestId]
end

function QuestDataDict:GetNewQuestData(QuestId, TargetId)
  if not self[QuestId] then
    self[QuestId] = self:NewQuestData(TargetId)
  end
  return self[QuestId]
end

local Coordinate = Class("Coordinate", CustomTypes.CustomAttr)
Coordinate.__Props__ = {
  SubRegionId = prop.prop("Int", "client save", 0),
  Location = prop.prop("FloatList", "client save"),
  Rotation = prop.prop("FloatList", "client save"),
  StartIndex = prop.prop("Int", "client save", 0)
}

function Coordinate:GetLocation()
  local Location = {}
  Location.X = self.Location[1]
  Location.Y = self.Location[2]
  Location.Z = self.Location[3]
  return Location
end

function Coordinate:GetRotation()
  local Rotation = {}
  Rotation.Pitch = self.Rotation[1]
  Rotation.Yaw = self.Rotation[2]
  Rotation.Roll = self.Rotation[3]
  return Rotation
end

function Coordinate:SetLocation(Location)
  if not Location then
    return
  end
  self.Location[1] = Location.X
  self.Location[2] = Location.Y
  self.Location[3] = Location.Z
end

function Coordinate:SetRotation(Rotation)
  if not Rotation then
    return
  end
  self.Rotation[1] = Rotation.Pitch
  self.Rotation[2] = Rotation.Yaw
  self.Rotation[3] = Rotation.Roll
end

function Coordinate:SetDeliverInfo(LastRegionId, StartIndex)
  self:ClearLocation()
  self.StartIndex = StartIndex
  self.SubRegionId = LastRegionId
end

function Coordinate:SetLocationAndRotation(Location, Rotation, LastRegionId)
  self:ClearStartIndex()
  self:SetLocation(Location)
  self:SetRotation(Rotation)
  self:SetLastRegionId(LastRegionId)
end

function Coordinate:ClearLocation()
  self.Location:Clear()
  self.Rotation:Clear()
end

function Coordinate:SetLastRegionId(LastRegionId)
  self.SubRegionId = LastRegionId
end

function Coordinate:ClearStartIndex()
  self.StartIndex = 0
end

function Coordinate:GetLastRegioId()
  return self.SubRegionId
end

function Coordinate:GetStartIndex()
  return self.StartIndex
end

FormatProperties(Coordinate)
local QuestChain = Class("QuestChain", CustomTypes.CustomAttr)
QuestChain.__Props__ = {
  QuestChainId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 0),
  DoingQuestId = prop.prop("Int", "client save"),
  CompleteQuestId = prop.prop("IntList", "client save"),
  CanShow = prop.prop("Bool", "client save", false),
  QuestPicks = prop.prop("QuestPickDict", "client save"),
  QuestCoordinate = prop.prop("Coordinate", "client save"),
  QuestSaveDatas = prop.prop("QuestDataDict", "client save"),
  QuestChainType = prop.getter("Data", "QuestChainType"),
  QuestChainName = prop.getter("Data", "QuestChainName"),
  QuestChainDescription = prop.getter("Data", "QuestChainDescription"),
  RegionId = prop.getter("Data", "RegionId"),
  QuestChainReward = prop.getter("Data", "QuestChainReward"),
  StoryPath = prop.getter("Data", "StoryPath"),
  StoryPathPhone = prop.getter("Data", "StoryPathPhone"),
  ShowCondition = prop.getter("Data", "ShowCondition"),
  UnlockCondition = prop.getter("Data", "UnlockCondition"),
  IfAutoStart = prop.getter("Data", "IfAutoStart"),
  IsDefaultTrack = prop.getter("Data", "IsDefaultTrack"),
  LoginPlayerTransform = prop.getter("Data", "LoginPlayerTransform"),
  QuestReward = prop.getter("Data", "QuestReward"),
  PreStoryPath = prop.getter("Data", "PreStoryPath"),
  IsShowWindow = prop.getter("Data", "IsShowWindow"),
  ActivelyAccept = prop.getter("Data", "ActivelyAccept")
}

function QuestChain:Data()
  return DataMgr.QuestChain[self.QuestChainId]
end

function QuestChain:Init(QuestChainId)
  if not QuestChainId then
    return
  end
  self.QuestChainId = QuestChainId
end

function QuestChain:SetCanShow()
  self.CanShow = true
end

function QuestChain:AddCompleteQuestId(QuestId)
  if not QuestId or type(QuestId) ~= "number" then
    return
  end
  if tonumber(QuestId) <= 0 then
    return
  end
  self.CompleteQuestId:Append(QuestId)
end

function QuestChain:CheckQuestIdDoing(QuestId)
  if not self:IsFinish() and self.DoingQuestId == QuestId then
    return true
  end
  return false
end

function QuestChain:CheckQuestIdComplete(QuestId)
  if self.CompleteQuestId:HasValue(QuestId) then
    return true
  end
  return false
end

function QuestChain:IsLock()
  return self.State == CommonConst.QuestChainState.lock
end

function QuestChain:IsUnlock()
  return self.State == CommonConst.QuestChainState.unlock
end

function QuestChain:IsDoing()
  return self.State == CommonConst.QuestChainState.doing
end

function QuestChain:IsFinish()
  return self.State == CommonConst.QuestChainState.finish
end

function QuestChain:Lock()
  self.State = CommonConst.QuestChainState.lock
  self.DoingQuestId = 0
end

function QuestChain:Unlock()
  if self:IsLock() then
    self.State = CommonConst.QuestChainState.unlock
    return true
  end
  return false
end

function QuestChain:Doing()
  if self:IsUnlock() then
    self.State = CommonConst.QuestChainState.doing
    return true
  end
  return false
end

function QuestChain:Finish()
  if self:IsDoing() then
    self.State = CommonConst.QuestChainState.finish
    self.DoingQuestId = 0
    return true
  end
  return false
end

function QuestChain:ForceToLock()
  self.State = CommonConst.QuestChainState.lock
end

function QuestChain:ForceToUnlock()
  self.State = CommonConst.QuestChainState.unlock
end

function QuestChain:ForceToDoing()
  self.State = CommonConst.QuestChainState.doing
end

function QuestChain:ForceToFinish()
  self.DoingQuestId = 0
  self.State = CommonConst.QuestChainState.finish
end

FormatProperties(QuestChain)
local QuestChains = Class("QuestChains", CustomTypes.CustomDict)
QuestChains.KeyType = BaseTypes.Int
QuestChains.ValueType = QuestChain

function QuestChains:NewQuestChain(QuestChainId)
  return QuestChain(QuestChainId)
end

function QuestChains:GetQuestChain(QuestChainId)
  if not self[QuestChainId] then
    self[QuestChainId] = self:NewQuestChain(QuestChainId)
  end
  return self[QuestChainId]
end

local QuestTracking = Class("QuestTracking", CustomTypes.CustomAttr)
QuestTracking.__Props__ = {
  QuestChainId = prop.prop("Int", "client save")
}

function QuestTracking:SetCurrentQuestTracking(QuestChainId)
  if not QuestChainId then
    return false
  end
  self.QuestChainId = QuestChainId
end

function QuestTracking:ReSetting()
  self.QuestChainId = 0
end

function QuestTracking:GetCurrentQuestTracking()
  return self.QuestChainId
end

FormatProperties(QuestTracking)
return {
  QuestChain = QuestChain,
  QuestTracking = QuestTracking,
  QuestChains = QuestChains,
  QuestData = QuestData,
  QuestDataDict = QuestDataDict,
  SpecialQuestDataDict = SpecialQuestDataDict,
  SpecialQuestData = SpecialQuestData,
  QuestPickDict = QuestPickDict,
  QuestPickAttr = QuestPickAttr,
  Coordinate = Coordinate
}
