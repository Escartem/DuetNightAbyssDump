local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local Draft = Class("Draft", CustomTypes.CustomAttr)
Draft.__Props__ = {
  DraftId = prop.prop("Int", "client save"),
  Name = prop.getter("Data", "Name"),
  DraftDoingNum = prop.prop("Int", "client save", 0),
  DraftCompleteNum = prop.prop("Int", "client save", 0),
  ProductType = prop.getter("Data", "ProductType"),
  ProductId = prop.getter("Data", "ProductId"),
  ProductNum = prop.getter("Data", "ProductNum"),
  Time = prop.getter("Data", "Time"),
  Resource = prop.getter("RedirectData", "Resource"),
  Weapon = prop.getter("RedirectData", "Weapon"),
  Mod = prop.getter("RedirectData", "Mod"),
  StartTime = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 0),
  Count = prop.prop("Int", "client save", 0),
  IsInfinity = prop.getter("Data", "IsInfinity"),
  FoundryCost = prop.getter("Data", "FoundryCost"),
  Rarity = prop.getter("Data", "Rarity"),
  Batch = prop.getter("Data", "Batch")
}

function Draft:Init(DraftId)
  self.DraftId = DraftId
end

function Draft:Data()
  return DataMgr.Draft[self.DraftId]
end

function Draft:RedirectData()
  local RedirectData = {}
  RedirectData.Resource = self:RedirectResourceData()
  RedirectData.Weapon = self:RedirectWeaponData()
  RedirectData.Mod = self:RedirectModData()
  return RedirectData
end

function Draft:RedirectResourceData()
  local DraftInfo = DataMgr.Draft[self.DraftId]
  local Resource = {}
  if not DraftInfo.Resource then
    return Resource
  end
  for _, ResourceInfo in ipairs(DraftInfo.Resource) do
    if ResourceInfo.Type == CommonConst.ResourceType.Resource then
      local TargetResourceInfo = {}
      TargetResourceInfo.Id = ResourceInfo.Id
      TargetResourceInfo.Num = ResourceInfo.Num
      table.insert(Resource, TargetResourceInfo)
    end
  end
  return Resource
end

function Draft:RedirectWeaponData()
  local DraftInfo = DataMgr.Draft[self.DraftId]
  local Weapon = {}
  if not DraftInfo.Resource then
    return Weapon
  end
  for _, ResourceInfo in ipairs(DraftInfo.Resource) do
    if ResourceInfo.Type and ResourceInfo.Type == CommonConst.ResourceType.Weapon then
      local WeaponInfo = {}
      WeaponInfo.Id = ResourceInfo.Id
      WeaponInfo.Num = ResourceInfo.Num
      table.insert(Weapon, WeaponInfo)
    end
  end
  return Weapon
end

function Draft:RedirectModData()
  local DraftInfo = DataMgr.Draft[self.DraftId]
  local Mod = {}
  if not DraftInfo.Resource then
    return Mod
  end
  for _, ResourceInfo in ipairs(DraftInfo.Resource) do
    if ResourceInfo.Type and ResourceInfo.Type == CommonConst.ResourceType.Mod then
      local ModInfo = {}
      ModInfo.Id = ResourceInfo.Id
      ModInfo.Num = ResourceInfo.Num
      table.insert(Mod, ModInfo)
    end
  end
  return Mod
end

function Draft:ReSetting()
  self:SetState(CommonConst.DraftState.ToBeProduced)
  self.StartTime = 0
  self.DraftDoingNum = 0
  self.DraftCompleteNum = 0
  self.DraftStageStartTime = 0
end

function Draft:AddCount(count)
  if type(count) == "number" and count > 0 and not self.IsInfinity then
    self.Count = self.Count + count
    return true
  end
  return false
end

function Draft:ReduceCount(count)
  if type(count) == "number" and count > 0 and count <= self.Count and not self.IsInfinity then
    self.Count = self.Count - count
    return true
  end
  return false
end

function Draft:GetCurrentState()
  return self.State
end

function Draft:SetState(NewState)
  if self.State == NewState then
    return
  end
  self.State = NewState
end

function Draft:StartProduct(DoingNum)
  if DoingNum <= 0 then
    return false
  end
  if not self:IsToBeProduced() then
    return false
  end
  if not self.IsInfinity then
    self:ReduceCount(DoingNum)
  end
  self:SetDraftState_Doing(DoingNum)
  return true
end

function Draft:ReduceDraftDoingNumAndAddCompleteNum()
  if self.DraftDoingNum <= 0 then
    return false
  end
  self.DraftDoingNum = self.DraftDoingNum - 1
  self.DraftCompleteNum = self.DraftCompleteNum + 1
  return true
end

function Draft:SetDraftStageStartTime(StageStartTime)
  self.DraftStageStartTime = StageStartTime
end

function Draft:GetDraftStageRemaningTime()
  return self:NextDraftStageCompleteTime() - TimeUtils.NowTime()
end

function Draft:NextDraftStageCompleteTime()
  return self.DraftStageStartTime + self.Time * 60
end

function Draft:GetDraftDoingNum()
  return self.DraftDoingNum
end

function Draft:IsDraftDoingNum()
  return 0 == self.DraftDoingNum
end

function Draft:GetDraftStageStartTime()
  return self.DraftStageStartTime
end

function Draft:SetDraftState_Doing(DoingNum)
  self:SetState(CommonConst.DraftState.Doing)
  self.DraftDoingNum = DoingNum
  self.DraftCompleteNum = 0
  self:SetDraftCastingTime()
end

function Draft:SetDraftCompleteNum(CompleteNum)
  CompleteNum = math.max(CompleteNum, 0)
  self.DraftCompleteNum = self.DraftCompleteNum + CompleteNum
end

function Draft:GetDraftDoingNum()
  return self.DraftDoingNum
end

function Draft:SetDraftCastingTime()
  self.StartTime = TimeUtils.NowTime()
end

function Draft:GetRemaningTime()
  return self.StartTime + self.Time * 60 - TimeUtils.NowTime()
end

function Draft:IsComplete()
  return self.State == CommonConst.DraftState.Complete
end

function Draft:IsToBeProduced()
  return self.State == CommonConst.DraftState.ToBeProduced
end

function Draft:IsDoing()
  return self.State == CommonConst.DraftState.Doing
end

function Draft:CompleteProduct()
  self:SetState(CommonConst.DraftState.Complete)
end

FormatProperties(Draft)
local DraftMataAttr = Class("DraftMataAttr", CustomTypes.CustomAttr)
DraftMataAttr.__Props__ = {
  Meta = prop.prop("ObjectId2Int", "client save")
}
FormatProperties(DraftMataAttr)
local Draft2MataDict = Class("Draft2MataDict", CustomTypes.CustomDict)
Draft2MataDict.KeyType = BaseTypes.Int
Draft2MataDict.ValueType = DraftMataAttr

function Draft2MataDict:NewDraftMataAttr()
  return DraftMataAttr()
end

function Draft2MataDict:GetNewDraftMataAttr(DraftId)
  if not self[DraftId] then
    self[DraftId] = self:NewDraftMataAttr()
  end
  return self[DraftId]
end

function Draft2MataDict:GetDraftMataAttr(DraftId)
  return self[DraftId]
end

local DraftDict = Class("DraftDict", CustomTypes.CustomDict)
DraftDict.KeyType = BaseTypes.Int
DraftDict.ValueType = Draft

function DraftDict:NewDraftPrint(DraftId)
  local NewDraft = Draft(DraftId)
  return NewDraft
end

function DraftDict:GetNewDraft(DraftId)
  if not self[DraftId] then
    return self:NewDraftPrint(DraftId)
  end
  return self[DraftId]
end

function DraftDict:GetDraft(DraftId)
  return self[DraftId]
end

return {
  Draft = Draft,
  DraftDict = DraftDict,
  Draft2MataDict = Draft2MataDict,
  DraftMataAttr = DraftMataAttr
}
