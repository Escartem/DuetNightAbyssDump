require("UnLua")
local M = {}

function M:GetGroupLevel(GroupId, Count)
  local Level = 1
  if 0 == Count then
    return Level
  end
  local GroupData = DataMgr.BlessingGroup[GroupId]
  for _, v in pairs(GroupData.ActivateNeed) do
    if Count < v + GWorld.RougeLikeManager.BlessingGroupDiscount then
      break
    end
    Level = Level + 1
  end
  return Level
end

function M:GetGroupIsActive(GroupId, Count)
  local GroupData = DataMgr.BlessingGroup[GroupId]
  assert(GroupData, "\229\165\151\232\163\133\228\191\161\230\129\175\230\156\170\230\137\190\229\136\176\239\188\154" .. GroupId)
  local IsActive = false
  for _, v in pairs(GroupData.ActivateNeed) do
    if Count == v + GWorld.RougeLikeManager.BlessingGroupDiscount then
      IsActive = true
      break
    end
  end
  return IsActive
end

function M:GetIsCanLevelUp(BlessingId)
  local RougeLikeManager = GWorld.RougeLikeManager
  local BlessingsList = RougeLikeManager.Blessings
  for Id, _ in pairs(BlessingsList) do
    if Id == BlessingId then
      return true
    end
  end
  return false
end

function M:ShowRougeLikeError(Text)
  local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if bDistribution and not bEnableShippingLog then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SendToFeishuForRougeLike(Text, "\232\130\137\233\184\189\230\138\165\233\148\153")
    return
  end
end

function M:GenSuitDetail(SuitId, CurrentLV, IsPreAdd, IsUnlockFeedback)
  if not self.ActiveNeedMap then
    self.ActiveNeedMap = {}
    for _, v in pairs(DataMgr.BlessingGroup) do
      for _, ActiveNeed in ipairs(v.ActivateNeed) do
        if self.ActiveNeedMap[v.GroupId] == nil then
          self.ActiveNeedMap[v.GroupId] = {}
        end
        table.insert(self.ActiveNeedMap[v.GroupId], ActiveNeed)
      end
    end
  end
  local _TextCurrentNum = GWorld.RougeLikeManager.BlessingGroup:Find(SuitId) or 0
  local _TextUnlockNum = self.ActiveNeedMap[SuitId][CurrentLV] + GWorld.RougeLikeManager.BlessingGroupDiscount
  local _IsActive
  local _TextSuitDesc = DataMgr.BlessingGroup[SuitId].ActivateDesc[CurrentLV]
  local _ExplanationId
  if DataMgr.BlessingGroup[SuitId].ExplanationId then
    _ExplanationId = DataMgr.BlessingGroup[SuitId].ExplanationId[CurrentLV]
  end
  if IsPreAdd then
    _TextCurrentNum = _TextCurrentNum + 1
  else
  end
  if _TextUnlockNum <= _TextCurrentNum then
    if IsPreAdd and _TextCurrentNum == _TextUnlockNum then
      _IsActive = 2
    else
      _IsActive = 1
    end
  else
    _IsActive = 0
  end
  return {
    TextGroupLevel = CurrentLV,
    TextCurrentNum = _TextCurrentNum,
    TextUnlockNum = _TextUnlockNum,
    IsActive = _IsActive,
    TextSuitDesc = _TextSuitDesc,
    IsUnlockFeedback = IsUnlockFeedback,
    ExplanationId = _ExplanationId
  }
end

return M
