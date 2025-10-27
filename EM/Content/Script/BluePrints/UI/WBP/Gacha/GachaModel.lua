local TimeUtils = require("Utils.TimeUtils")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  self._Avatar = nil
  self.IsDestroied = nil
  self:GetAvatar()
end

function M:Destory()
  self._Avatar = nil
  self.IsDestroied = true
end

function M:GetAvatar()
  if self._Avatar == nil then
    self._Avatar = GWorld:GetAvatar()
  end
  if not self._Avatar then
    DebugPrint(ErrorTag, LXYTag, "Model:GetAvatar() Avatar is nil")
  end
  return self._Avatar
end

function M:GetGachaAvatarInfo(GachaId)
  assert(GachaId, "GetGachaAvatarInfo\228\188\160\229\133\165\228\186\134\231\169\186\231\154\132GachaId")
  local Avatar = self:GetAvatar()
  local GachaLst = Avatar.SkinGachaPool
  if not GachaLst[GachaId] or not GachaLst[GachaId].Usable then
    return nil
  end
  return GachaLst[GachaId]
end

function M:GetEffectiveGachaInfo()
  local Avatar = self:GetAvatar()
  local GachaType2Gacha = {}
  local GachaLst = Avatar.SkinGachaPool
  for _, GachaData in pairs(GachaLst) do
    if GachaData.Usable and self:CheckGachaEffective(GachaData.GachaId) then
      local GachaId = GachaData.GachaId
      local GachaData = DataMgr.SkinGacha[GachaId]
      if not GachaType2Gacha[GachaData.TabId] then
        GachaType2Gacha[GachaData.TabId] = {}
      end
      table.insert(GachaType2Gacha[GachaData.TabId], GachaData.GachaId)
    end
  end
  for _, Data in pairs(GachaLst) do
    table.sort(Data, function(A, B)
      local SequenceA = A.Sequence
      local SequenceB = B.Sequence
      return SequenceA < SequenceB
    end)
  end
  return GachaType2Gacha
end

function M:GetGachaTabInfo()
  local SkinGachaTabData = DataMgr.SkinGachaTab
  local Res = {}
  for _, Data in pairs(SkinGachaTabData) do
    local Content = {}
    Content.TabId = Data.TabId
    Content.TabName = Data.TabName
    Content.Icon = Data.Icon
    Content.Sequence = Data.Sequence
    Content.GachaIdLst = Data.GachaId
    table.insert(Res, Content)
  end
  table.sort(Res, function(A, B)
    local SequenceA = A.Sequence or 0
    local SequenceB = B.Sequence or 0
    return SequenceA < SequenceB
  end)
  return Res
end

function M:CheckGachaEffective(GachaId)
  local GachaData = DataMgr.SkinGacha[GachaId]
  assert(GachaData, "\230\138\189\229\141\161\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. GachaId)
  if GachaData.GachaStartTime < TimeUtils.NowTime() and GachaData.GachaEndTime > TimeUtils.NowTime() then
    return true
  end
  return false
end

function M:GetSkinGachaItemLst(SkinGachaItemId)
  local SkinGachaItemData = DataMgr.SkinGachaItem[SkinGachaItemId]
  local Res = {}
  assert(SkinGachaItemData, "\230\138\189\229\141\161\229\165\150\229\138\177\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. SkinGachaItemId)
  for i = 1, #SkinGachaItemData.Type do
    local Content = {}
    Content.Type = SkinGachaItemData.Type[i]
    Content.Id = SkinGachaItemData.Id[i]
    Content.Count = SkinGachaItemData.Count[i]
    Content.Probability = SkinGachaItemData.Probability[i]
    table.insert(Res, Content)
  end
  return Res
end

function M:GetSkinGachaUpInfo(GachaId)
  local GachaInfo = DataMgr.SkinGacha[GachaId]
  assert(GachaInfo, "\230\138\189\229\141\161\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. GachaId)
  local UpItemId, UpItemType, Probaility
  if GachaInfo.RewardUpId then
    UpItemType = GachaCommon.GachaItemTypeMap[GachaInfo.RewardUpType]
    for Id, Data in pairs(GachaInfo.RewardUpId) do
      UpItemId = Id
      Probaility = Data
      break
    end
  end
  return UpItemId, UpItemType, Probaility
end

function M:GetSkinGachaCumulativeInfo(GahcaId)
  local GachaCumulativeData = DataMgr.SkinGachaCumulative[GahcaId]
  assert(GachaCumulativeData, "\230\138\189\229\141\161\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. GahcaId)
  local Res = {}
  for i = 1, #GachaCumulativeData.RewardTarget do
    local Content = {}
    Content.RewardTarget = GachaCumulativeData.RewardTarget[i]
    Content.RewardId = GachaCumulativeData.RewardId[i]
    table.insert(Res, Content)
  end
  return Res
end

function M:GetSkinGachaCurrentCumulativeInfo(GachaId)
  local GachaData = self:GetGachaAvatarInfo(GachaId)
  assert(GachaData, "GetSkinGachaCurrentCumulativeInfo\229\189\147\229\137\141\229\141\161\230\177\160\230\151\160\230\149\136\239\188\154" .. GachaId)
  local GachaCumulativeData = DataMgr.SkinGachaCumulative[GachaData.GachaId]
  local Res, NeedCount = nil, 0
  local LastReward
  if not GachaCumulativeData then
    return Res, NeedCount
  end
  for i = 1, #GachaCumulativeData.RewardTarget do
    if GachaData.DrawCounts >= GachaCumulativeData.RewardTarget[i] and not GachaData.CumulativeRewardGot:HasElement(i) then
      Res = GachaCumulativeData.RewardId[i]
      return Res, NeedCount
    end
    if GachaData.DrawCounts < GachaCumulativeData.RewardTarget[i] then
      Res = GachaCumulativeData.RewardId[i]
      NeedCount = GachaCumulativeData.RewardTarget[i] - GachaData.DrawCounts
      return Res, NeedCount
    end
    if i == #GachaCumulativeData.RewardTarget then
      LastReward = GachaCumulativeData.RewardId[i]
    end
  end
  return Res, NeedCount, LastReward
end

function M:GetALlSkinGachaCurrentCumulativeInfo()
  local GachaTabInfo = self:GetGachaTabInfo()
  if GachaTabInfo then
    for _, GachaTabData in ipairs(GachaTabInfo) do
      for _, GachaId in ipairs(GachaTabData.GachaIdLst) do
        local RewardId, Count = self:GetSkinGachaCurrentCumulativeInfo(GachaId)
        if RewardId then
          return true
        end
      end
    end
  end
  return false
end

function M:GetSkinGachaAlreadyTimes(GachaType)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  if not Avatar.GuaranteedDict.Guaranteed5StarDict then
    return 0
  end
  local GuaranteedCount = Avatar.GuaranteedDict.Guaranteed5StarDict[GachaType]
  return GuaranteedCount or 0
end

function M:CheckCanGacha(GachaId, GachaCounts, bShowError)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return -1
  end
  local GachaInfo = DataMgr.SkinGacha[GachaId]
  assert(GachaInfo, "CheckCanGacha\228\188\160\229\133\165\228\186\134\230\151\160\230\149\136\231\154\132GachaId\239\188\154" .. GachaId)
  if not ConditionUtils.CheckCondition(Avatar, GachaInfo.ConditionId, false) then
    return 2
  end
  local ResourceCount = 0
  for _, ResourceId in ipairs(GachaInfo.GachaCostRes) do
    ResourceCount = ResourceCount + Avatar:GetResourceNum(ResourceId)
  end
  local res = GachaCounts <= ResourceCount
  if not res then
    if bShowError then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_SkinGacha_CostRes_Lack"), 1.5)
    end
    return 1
  end
  return 0
end

function M:CheckReddot()
  local GachaTabInfoLst = self:GetGachaTabInfo()
  local GachaInfo = self:GetEffectiveGachaInfo()
  for _, GachaData in ipairs(GachaTabInfoLst) do
    if GachaInfo[GachaData.TabId] then
      local GacahTabData = DataMgr.SkinGachaTab[GachaData.TabId]
      local NodeName = GacahTabData.ReddotNode
      if NodeName then
        local Node = ReddotManager.GetTreeNode(NodeName)
        if Node then
          local RewardId, NeedCount = self:GetSkinGachaCurrentCumulativeInfo(GachaData.GachaIdLst[1])
          ReddotManager.ClearLeafNodeCount(NodeName, true)
          if RewardId and NeedCount <= 0 then
            ReddotManager.IncreaseLeafNodeCount(NodeName, 1)
          else
            ReddotManager.DecreaseLeafNodeCount(NodeName, 0)
          end
        end
      end
    end
  end
end

return M
