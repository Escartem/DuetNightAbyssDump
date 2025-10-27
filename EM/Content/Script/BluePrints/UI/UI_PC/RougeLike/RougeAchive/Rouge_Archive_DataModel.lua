require("UnLua")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local EMCache = require("EMCache.EMCache")
local DataModel = {}

function DataModel:InitData(InAvatar)
  self.Avatar = InAvatar
  self.LocalUnlockedManuals = EMCache:Get("UnlockedManuals", true) or {}
  self.Manuals = {}
  local TotalNum = 0
  local UnlockedNum = 0
  local HasNew = false
  self.Manuals[RougeConst.ArchiveType.Treasure] = {
    Data = {}
  }
  for _, TreasureData in pairs(DataMgr.RougeLikeTreasure) do
    local bIsUnlocked = self.Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Treasure, TreasureData.TreasureId)
    local bIsNew = bIsUnlocked and self:CheckArchiveItemIsNew(RougeConst.ArchiveType.Treasure, TreasureData.TreasureId)
    self.Manuals[RougeConst.ArchiveType.Treasure].Data[TreasureData.TreasureId] = {
      Data = TreasureData,
      IsUnlocked = bIsUnlocked,
      IsNew = bIsNew
    }
    TotalNum = TotalNum + 1
    UnlockedNum = UnlockedNum + (self.Manuals[RougeConst.ArchiveType.Treasure].Data[TreasureData.TreasureId].IsUnlocked and 1 or 0)
    HasNew = HasNew or bIsNew
  end
  self.Manuals[RougeConst.ArchiveType.Treasure].Type = RougeConst.ArchiveType.Treasure
  self.Manuals[RougeConst.ArchiveType.Treasure].Name = GText("UI_RLArchiveTitle_Treasure")
  self.Manuals[RougeConst.ArchiveType.Treasure].TotalNum = TotalNum
  self.Manuals[RougeConst.ArchiveType.Treasure].UnlockedNum = UnlockedNum
  self.Manuals[RougeConst.ArchiveType.Treasure].HasNew = HasNew
  if HasNew then
    self:IncreaseArchiveTypeReddot(RougeConst.ArchiveType.Treasure)
  end
  TotalNum = 0
  UnlockedNum = 0
  HasNew = false
  self.Manuals[RougeConst.ArchiveType.Blessing] = {
    Data = {}
  }
  for _, BlessingData in pairs(DataMgr.RougeLikeBlessing) do
    local bIsUnlocked = self.Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Blessing, BlessingData.BlessingId)
    local bIsNew = bIsUnlocked and self:CheckArchiveItemIsNew(RougeConst.ArchiveType.Blessing, BlessingData.BlessingId)
    self.Manuals[RougeConst.ArchiveType.Blessing].Data[BlessingData.BlessingId] = {
      Data = BlessingData,
      IsUnlocked = bIsUnlocked,
      IsNew = bIsNew
    }
    TotalNum = TotalNum + 1
    UnlockedNum = UnlockedNum + (self.Manuals[RougeConst.ArchiveType.Blessing].Data[BlessingData.BlessingId].IsUnlocked and 1 or 0)
    HasNew = HasNew or bIsNew
  end
  self.Manuals[RougeConst.ArchiveType.Blessing].Type = RougeConst.ArchiveType.Blessing
  self.Manuals[RougeConst.ArchiveType.Blessing].Name = GText("UI_RLArchiveTitle_Blessing")
  self.Manuals[RougeConst.ArchiveType.Blessing].TotalNum = TotalNum
  self.Manuals[RougeConst.ArchiveType.Blessing].UnlockedNum = UnlockedNum
  self.Manuals[RougeConst.ArchiveType.Blessing].HasNew = HasNew
  if HasNew then
    self:IncreaseArchiveTypeReddot(RougeConst.ArchiveType.Blessing)
  end
  TotalNum = 0
  UnlockedNum = 0
  HasNew = false
  self.Manuals[RougeConst.ArchiveType.Event] = {
    Data = {}
  }
  for _, RoomData in pairs(DataMgr.RLRoomStorySeries) do
    if RoomData.RLArchiveType == RougeConst.RLArchiveType.Event then
      local bIsUnlocked = self.Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Event, RoomData.RLArchiveSubId)
      local bIsNew = bIsUnlocked and self:CheckArchiveItemIsNew(RougeConst.ArchiveType.Event, RoomData.RLArchiveSubId)
      self.Manuals[RougeConst.ArchiveType.Event].Data[RoomData.RLArchiveSubId] = {
        Data = RoomData,
        IsUnlocked = bIsUnlocked,
        IsNew = bIsNew
      }
      TotalNum = TotalNum + 1
      UnlockedNum = UnlockedNum + (self.Manuals[RougeConst.ArchiveType.Event].Data[RoomData.RLArchiveSubId].IsUnlocked and 1 or 0)
      HasNew = HasNew or bIsNew
    end
  end
  self.Manuals[RougeConst.ArchiveType.Event].Type = RougeConst.ArchiveType.Event
  self.Manuals[RougeConst.ArchiveType.Event].Name = GText("UI_RLArchiveTitle_Event")
  self.Manuals[RougeConst.ArchiveType.Event].TotalNum = TotalNum
  self.Manuals[RougeConst.ArchiveType.Event].UnlockedNum = UnlockedNum
  self.Manuals[RougeConst.ArchiveType.Event].HasNew = HasNew
  if HasNew then
    self:IncreaseArchiveTypeReddot(RougeConst.ArchiveType.Event)
  end
  TotalNum = 0
  UnlockedNum = 0
  HasNew = false
  self.Manuals[RougeConst.ArchiveType.Story] = {
    Data = {}
  }
  for _, StoryData in pairs(DataMgr.RLRoomStorySeries) do
    if StoryData.RLArchiveType == RougeConst.RLArchiveType.Story then
      local bIsUnlocked = self.Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Story, StoryData.RLArchiveSubId)
      local bIsNew = bIsUnlocked and self:CheckArchiveItemIsNew(RougeConst.ArchiveType.Story, StoryData.RLArchiveSubId)
      self.Manuals[RougeConst.ArchiveType.Story].Data[StoryData.RLArchiveSubId] = {
        Data = StoryData,
        IsUnlocked = bIsUnlocked,
        IsNew = bIsNew
      }
      TotalNum = TotalNum + 1
      UnlockedNum = UnlockedNum + (self.Manuals[RougeConst.ArchiveType.Story].Data[StoryData.RLArchiveSubId].IsUnlocked and 1 or 0)
      HasNew = HasNew or bIsNew
    end
  end
  self.Manuals[RougeConst.ArchiveType.Story].Type = RougeConst.ArchiveType.Story
  self.Manuals[RougeConst.ArchiveType.Story].Name = GText("UI_RLArchiveTitle_Story")
  self.Manuals[RougeConst.ArchiveType.Story].TotalNum = TotalNum
  self.Manuals[RougeConst.ArchiveType.Story].UnlockedNum = UnlockedNum
  self.Manuals[RougeConst.ArchiveType.Story].HasNew = HasNew
  if HasNew then
    self:IncreaseArchiveTypeReddot(RougeConst.ArchiveType.Story)
  end
end

function DataModel:GetArchiveDataByArchiveType(ArchiveType)
  return self.Manuals[ArchiveType]
end

function DataModel:GetUnlockedItemNum(Type)
  local Avatar = GWorld:GetAvatar()
  local AvatarManuals = Avatar.RougeLike.Manual
  local UnlockedNum = 0
  if not Type then
    for TypeName, TypeId in pairs(RougeConst.ArchiveType) do
      local Manual = AvatarManuals:Get(TypeId)
      if Manual then
        UnlockedNum = UnlockedNum + Manual:Length()
      end
    end
  else
    local Manual = AvatarManuals:Get(Type)
    if Manual then
      UnlockedNum = Manual:Length()
    end
  end
  return UnlockedNum
end

function DataModel:GetTotalItemNum(Type)
  local TotalNum = 0
  if not Type then
    for _, ManualData in pairs(self.Manuals) do
      TotalNum = TotalNum + ManualData.TotalNum
    end
  else
    TotalNum = self.Manuals[Type].TotalNum
  end
  return TotalNum
end

function DataModel:CheckArchiveItemIsNew(ArchiveType, ArchiveId)
  local LocalUnlockedManuals = EMCache:Get("UnlockedManuals", true) or {}
  return not LocalUnlockedManuals[ArchiveType] or not LocalUnlockedManuals[ArchiveType][ArchiveId]
end

function DataModel:MarkArchiveItemSeened(ArchiveType, ArchiveId)
  self.LocalUnlockedManuals[ArchiveType] = self.LocalUnlockedManuals[ArchiveType] or {}
  if ArchiveId then
    self.LocalUnlockedManuals[ArchiveType][ArchiveId] = true
  else
    for Id, ManualData in pairs(self.Manuals[ArchiveType].Data) do
      if ManualData.IsUnlocked then
        self.LocalUnlockedManuals[ArchiveType][Id] = true
      end
    end
  end
  self.Manuals[ArchiveType].Data[ArchiveId].IsNew = false
  EMCache:Set("UnlockedManuals", self.LocalUnlockedManuals, true)
end

function DataModel:IncreaseArchiveTypeReddot(ArchiveType)
  local TreeNodeName = RougeConst.RougeReddotTreeNode[ArchiveType]
  local TreeNode = ReddotManager.GetTreeNode(TreeNodeName)
  if not ReddotManager.GetTreeNode(TreeNodeName) then
    TreeNode = ReddotManager.AddNode(TreeNodeName)
  end
  if TreeNode and TreeNode.Count >= 1 then
    return
  end
  ReddotManager.IncreaseLeafNodeCount(TreeNodeName, 1)
end

function DataModel:GetArchiveRewardNumByArchiveType(ArchiveType)
  local ArchiveStep = DataMgr.RLArchiveInfo[ArchiveType].RLArchiveStep
  local TotalNum = self:GetUnlockedItemNum(ArchiveType)
  return TotalNum // ArchiveStep
end

function DataModel:GetCanReceiveArchiveRewardNumByArchiveType(ArchiveType)
  local Num = 0
  local Avatar = GWorld:GetAvatar()
  local ManualRewardGot = Avatar.RougeLike.ManualRewardGot:Get(ArchiveType)
  local TotalRewardNum = self:GetArchiveRewardNumByArchiveType(ArchiveType)
  for i = 1, TotalRewardNum do
    if ManualRewardGot then
      if not ManualRewardGot:HasElement(i) then
        Num = Num + 1
      end
    else
      Num = Num + 1
    end
  end
  return Num
end

function DataModel:GetArchiveRewardByArchiveType(ArchiveType)
  local Avatar = GWorld:GetAvatar()
  local ManualRewardGot = Avatar.RougeLike.ManualRewardGot:Get(ArchiveType)
  local TotalRewardNum = self:GetArchiveRewardNumByArchiveType(ArchiveType)
  local RewardList = {}
  for i = 1, TotalRewardNum do
    if ManualRewardGot then
      if not ManualRewardGot:HasElement(i) then
        table.insert(RewardList, i)
      end
    else
      table.insert(RewardList, i)
    end
  end
  return RewardList
end

function DataModel:UpdateArchiveRewardReddot()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Info in pairs(DataMgr.RLArchiveInfo) do
    local Count = self:GetUnlockedItemNum(Info.RLArchiveType)
    for i = Info.RLArchiveStep, Count, Info.RLArchiveStep do
      local RewardIdx = i // Info.RLArchiveStep
      if not Avatar.RougeLike:IsManualRewardGot(Info.RLArchiveType, RewardIdx) then
        local Node = ReddotManager.GetTreeNode("RougeArchiveReward")
        if not Node then
          ReddotManager.AddNode("RougeArchiveReward")
        end
        local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
        if not CacheDetail[Info.RLArchiveType] then
          CacheDetail[Info.RLArchiveType] = {}
        end
        if not CacheDetail[Info.RLArchiveType][RewardIdx] then
          CacheDetail[Info.RLArchiveType][RewardIdx] = 1
          ReddotManager.IncreaseLeafNodeCount("RougeArchiveReward")
        end
      end
    end
  end
end

function DataModel:UpdateArchiveReddot(ArchiveType)
  for Id, ManualData in pairs(self.Manuals[ArchiveType].Data) do
    local IsNew = self:CheckArchiveItemIsNew(ArchiveType, Id)
    if ManualData.IsUnlocked and IsNew then
      return
    end
  end
  ReddotManager.ClearLeafNodeCount(RougeConst.RougeReddotTreeNode[ArchiveType])
end

return DataModel
