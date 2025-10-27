local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Dispatch = Class("Dispatch", CustomTypes.CustomAttr)
Dispatch.__Props__ = {
  DispatchId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 0),
  IsAutoCompete = prop.prop("Bool", "client save", false),
  RegionId = prop.getter("Data", "RegionId", -1),
  ListIndex = prop.prop("Int", "client save", -1),
  RegionDispCondition = prop.getter("RegionData", "RegionDispCondition"),
  RegisterTime = prop.prop("Int", "client save", 0),
  StartTime = prop.prop("Int", "client save", 0),
  CompleteTime = prop.prop("Int", "client save", 0),
  CoolingTime = prop.prop("Int", "client save", 0),
  DispatchCharsList = prop.prop("ObjectIdList", "client save"),
  Reward = prop.getter("Data", "RewardId"),
  DispatchCD = prop.getter("Data", "DispatchCD"),
  DispatchPerson = prop.getter("Data", "DispatchPerson"),
  Weight = prop.getter("Data", "Weight"),
  PlayerLevel = prop.getter("Data", "PlayerLevel"),
  ExcIds = prop.getter("Data", "ExcId"),
  Rarity = prop.getter("Data", "Rarity"),
  Ttk = prop.getter("Data", "Ttk"),
  DispatchDemand = prop.getter("Data", "DispatchDemand"),
  DispatchCondition = prop.getter("Data", "DispatchCondition"),
  DispatchType = prop.getter("Data", "DispatchType")
}

function Dispatch:GetDispatchState()
  return self.State
end

function Dispatch:IsUnlock()
  return self.State == CommonConst.DispatchState.Unlock
end

function Dispatch:SetCanDispatch()
  self.State = CommonConst.DispatchState.CanDispatch
end

function Dispatch:SetIsAutoCompete(IsAutoCompete)
  self.IsAutoCompete = IsAutoCompete
end

function Dispatch:GetIsAutoComplete()
  return self.IsAutoCompete
end

function Dispatch:SetCompleteTime(CompleteTime)
  self.CompleteTime = CompleteTime
  self.StartTime = 0
end

function Dispatch:GetCompleteTime()
  return self.CompleteTime
end

function Dispatch:RegionData()
  return DataMgr.Region[self.RegionId]
end

function Dispatch:SetDispatchState2Unlock()
  self.State = CommonConst.DispatchState.Unlock
  self.IsAutoCompete = false
  self.CompleteTime = 0
  self.CoolingTime = 0
  self.StartTime = 0
  self.RegisterTime = 0
  self.ListIndex = -1
end

function Dispatch:SetDispatchState2CanDispatch()
  self.State = CommonConst.DispatchState.CanDispatch
  self.IsAutoCompete = false
  self.CompleteTime = 0
  self.CoolingTime = 0
  self.StartTime = 0
  self.RegisterTime = 0
  self.ListIndex = -1
end

function Dispatch:Init(DispatchId)
  self.DispatchId = DispatchId
end

function Dispatch:Data()
  return DataMgr.Dispatch[self.DispatchId]
end

function Dispatch:GetTotalDispatchTagNum()
  local TotalNum = 0
  for Name, Num in pairs(self.DispatchDemand) do
    TotalNum = TotalNum + Num
  end
  return TotalNum
end

function Dispatch:CalcMatchNum(CurrentUnlockDispatch)
  local TotalNum = 0
  for Name, Num in pairs(self.DispatchDemand) do
    if CurrentUnlockDispatch[Name] then
      TotalNum = TotalNum + math.min(Num, CurrentUnlockDispatch[Name])
    end
  end
  return TotalNum
end

function Dispatch:CheckPlayerLevel(CurrentLevel)
  local minLevel = self.PlayerLevel[1]
  local maxLevel = self.PlayerLevel[2]
  if CurrentLevel < minLevel or CurrentLevel > maxLevel then
    return false
  end
  return true
end

function Dispatch:IsCanRemoveDispatch_Level(CurrentLevel)
  local maxLevel = self.PlayerLevel[2]
  if CurrentLevel > maxLevel then
    return true
  end
  return false
end

function Dispatch:GetDispatchTime()
  if 1 == self.Rarity then
    return DataMgr.GlobalConstant.DispatchNormalTime.ConstantValue
  elseif 2 == self.Rarity then
    return DataMgr.GlobalConstant.DispatchEliteTime.ConstantValue
  else
    return DataMgr.GlobalConstant.DispatchEpicTime.ConstantValue
  end
end

function Dispatch:SetRegisterTime(RegisterTime)
  self.RegisterTime = RegisterTime
end

function Dispatch:GetRegisterTime()
  return self.RegisterTime
end

function Dispatch:SetRegisterInfo(RegisterTime, ListIndex)
  self:SetRegisterTime(RegisterTime)
  self:SetListIndex(ListIndex)
end

function Dispatch:SetListIndex(ListIndex)
  self.ListIndex = ListIndex
end

function Dispatch:GetListIndex()
  return self.ListIndex
end

function Dispatch:IsComplete()
  return self:IsSuccess() or self:IsFailer() or self:IsPerfect() or self:IsDisqualified() or self:IsQualified()
end

function Dispatch:IsCooling()
  return self.State == CommonConst.DispatchState.Cooling
end

function Dispatch:SetDispatchState(NewDispatchState)
  self.State = NewDispatchState
end

function Dispatch:SetDispatchState2Complete(CompeteState, CompleteTime)
  self.State = CompeteState
  self:SetCompleteTime(CompleteTime)
end

function Dispatch:SetDispatchState2Cooling(CoolingTime)
  CoolingTime = CoolingTime or TimeUtils.NowTime()
  self.State = CommonConst.DispatchState.Cooling
  self.ListIndex = -1
  self:SetCoolingTime(CoolingTime)
end

function Dispatch:SetCoolingTime(CoolingTime)
  self.CoolingTime = CoolingTime
end

function Dispatch:GetCoolingTime()
  return self.CoolingTime
end

function Dispatch:SetState2Doing(StartTime)
  StartTime = StartTime or TimeUtils.NowTime()
  self.State = CommonConst.DispatchState.Doing
  self:SetStartTime(StartTime)
end

function Dispatch:SetStartTime(NewTime)
  self.StartTime = NewTime
end

function Dispatch:GetStartTime()
  return self.StartTime
end

function Dispatch:IsCanDispatch()
  return self.State == CommonConst.DispatchState.CanDispatch
end

function Dispatch:IsDoing()
  return self.State == CommonConst.DispatchState.Doing
end

function Dispatch:IsSuccess()
  return self.State == CommonConst.DispatchState.Success
end

function Dispatch:IsPerfect()
  return self.State == CommonConst.DispatchState.Perfect
end

function Dispatch:IsDisqualified()
  return self.State == CommonConst.DispatchState.Disqualified
end

function Dispatch:IsQualified()
  return self.State == CommonConst.DispatchState.Qualified
end

function Dispatch:IsFailer()
  return self.State == CommonConst.DispatchState.Failer
end

FormatProperties(Dispatch)
local DispatchDict = Class("DispatchDict", CustomTypes.CustomDict)
DispatchDict.KeyType = BaseTypes.Int
DispatchDict.ValueType = Dispatch

function DispatchDict:GetDispatch(DispatchId)
  return self[DispatchId]
end

function DispatchDict:NewDispatch(DispatchId)
  return Dispatch(DispatchId)
end

function DispatchDict:GetNewDispatch(DispatchId)
  if not self[DispatchId] then
    self[DispatchId] = self:NewDispatch(DispatchId)
  end
  return self[DispatchId]
end

local DispatchListProp = Class("DispatchListProp", CustomTypes.CustomAttr)
DispatchListProp.__Props__ = {
  DispatchId = prop.prop("Int", "client save", 0),
  State = prop.prop("Int", "client save"),
  CoolingTime = prop.prop("Int", "client save", 0),
  ListIndex = prop.prop("Int", "client save", 0)
}

function DispatchListProp:Init(ListIndex)
  self.DispatchId = -1
  self.State = CommonConst.DispatchState.Unlock
  self.CoolingTime = 0
  self.ListIndex = ListIndex
end

function DispatchListProp:GetListIndex()
  return self.ListIndex
end

function DispatchListProp:SetState_Doing()
  self.State = CommonConst.DispatchState.Doing
  self.CoolingTime = 0
end

function DispatchListProp:SetState_Cooling(CoolingTime)
  self.State = CommonConst.DispatchState.Cooling
  self.CoolingTime = CoolingTime
  self.DispatchId = -1
end

function DispatchListProp:SetState_Unlock()
  self.DispatchId = -1
  self.State = CommonConst.DispatchState.Unlock
  self.CoolingTime = 0
end

function DispatchListProp:GetDispatchId()
  return self.DispatchId
end

function DispatchListProp:SetState_CanDispatch(DispatchId)
  self.DispatchId = DispatchId
  self.State = CommonConst.DispatchState.CanDispatch
  self.CoolingTime = TimeUtils.NowTime()
end

function DispatchListProp:SetDispatchId(DispatchId)
  self.DispatchId = DispatchId
end

function DispatchListProp:IsDoing()
  return self.State == CommonConst.DispatchState.Doing
end

function DispatchListProp:SetCoolingTime(CoolingTime)
  self.CoolingTime = CoolingTime
end

function DispatchListProp:IsCanDispatch()
  return self.State == CommonConst.DispatchState.CanDispatch
end

function DispatchListProp:IsCooling()
  return self.State == CommonConst.DispatchState.Cooling
end

function DispatchListProp:GetCoolingTime()
  return self.CoolingTime
end

function DispatchListProp:IsUnlock()
  return self.State == CommonConst.DispatchState.Unlock
end

FormatProperties(DispatchListProp)
local DispatchGameListDict = Class("DispatchGameList", CustomTypes.CustomList)
DispatchGameListDict.ValueType = DispatchListProp

function DispatchGameListDict:NewDispatchListProp(Index)
  return DispatchListProp(Index)
end

function DispatchGameListDict:HasValue(DispatchId)
  for _, item in ipairs(self._inner) do
    if item.DispatchId == DispatchId then
      return true
    end
  end
  return false
end

return {
  DispatchDict = DispatchDict,
  Dispatch = Dispatch,
  DispatchListProp = DispatchListProp,
  DispatchGameListDict = DispatchGameListDict
}
