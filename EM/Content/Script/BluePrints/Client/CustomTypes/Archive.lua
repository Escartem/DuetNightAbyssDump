local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local TimeUtils
if GWorld:IsSkynetServer() then
  TimeUtils = require("src.utils.TimeUtils")
else
  TimeUtils = require("Utils.TimeUtils")
end
local Archive = Class("Archive", CustomTypes.CustomAttr)
Archive.__Props__ = {
  ArchiveId = prop.prop("Int", "client save"),
  ArchiveList = prop.prop("Int2IntDict", "client save"),
  ArchiveRewardGot = prop.prop("Int2IntDict", "client save"),
  ArchiveInfo = prop.prop("Int2IntListDict", "client save"),
  ArchiveStep = prop.getter("Data", "ArchiveStep"),
  RewardId = prop.getter("Data", "RewardId")
}

function Archive:Data()
  return DataMgr.ArchiveInfo[self.ArchiveId]
end

function Archive:Init(ArchiveId)
  if not ArchiveId then
    return
  end
  if not DataMgr.ArchiveInfo[ArchiveId] then
    return
  end
  self.ArchiveId = ArchiveId
end

function Archive:UpdateArchiveList(TargetId)
  if self.ArchiveList[TargetId] then
    return
  end
  self.ArchiveList[TargetId] = TimeUtils.NowTime()
end

function Archive:GetArchiveCount()
  return CommonUtils.Size(self.ArchiveList)
end

function Archive:GetArchiveInfoValue(TargetId, Key)
  local TargetInfo = self.ArchiveInfo[TargetId]
  if not TargetInfo or not TargetInfo[Key] then
    return 0
  end
  return TargetInfo[Key]
end

function Archive:InitArchiveInfo(TargetType)
  if TargetType == CommonConst.ArchiveType.Weapon then
    return {0, 0}
  end
end

function Archive:UpdateArchiveInfoValue(TargetId, TargetType, Key, Value)
  if not self.ArchiveInfo[TargetId] then
    self.ArchiveInfo[TargetId] = self:InitArchiveInfo(TargetType)
  end
  if not self.ArchiveInfo[TargetId] then
    return
  end
  self.ArchiveInfo[TargetId][Key] = Value
end

function Archive:AddArchiveRewardGot(Count)
  if self.ArchiveRewardGot[Count] then
    return
  end
  self.ArchiveRewardGot[Count] = TimeUtils.NowTime()
end

FormatProperties(Archive)
local ArchiveDict = Class("ArchiveDict", CustomTypes.CustomDict)
ArchiveDict.KeyType = BaseTypes.Int
ArchiveDict.ValueType = Archive

function ArchiveDict:NewArchive(ArchiveId)
  return Archive(ArchiveId)
end

function ArchiveDict:GetArchive(ArchiveId)
  if not self[ArchiveId] then
    return self:NewArchive(ArchiveId)
  end
  return self[ArchiveId]
end

return {Archive = Archive, ArchiveDict = ArchiveDict}
