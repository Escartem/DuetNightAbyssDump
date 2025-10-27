local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local TaskUtils = {}
local QuestDataInStoryLine = {}
local QuestExtraInfo = {}
local QuestInterfaceJump = {}
local QuestInterfaceJumpId = {}
local NodeHaveExtraInfo = {KillMonsterNode = true, ResourceCollectNode = true}
TaskUtils.StoryLineData = QuestDataInStoryLine
TaskUtils.QuestExtraInfo = QuestExtraInfo
TaskUtils.TaskMainLastSelectId = nil
TaskUtils.IsInTaskRegion = false
TaskUtils.MissionNpcGuideMaps = {}
TaskUtils.TaskPathActor = nil
TaskUtils.IsCanMakeTaskPathActor = true
TaskUtils.TaskPathActor = nil
TaskUtils.TaskRegionMap = "Now"
TaskUtils.bShowLevelMap = false

function TaskUtils:CreateSubItemContent(Content)
  local ClassPath = "/Game/UI/WBP/Task/Widget/SubItemContent.SubItemContent"
  local Object = NewObject(UE4.LoadClass(ClassPath))
  Object.OwnerWidget = Content.OwnerWidget
  Object.MainWidget = Content.MainWidget
  Object.IsDoingQuest = Content.IsDoingQuest
  Object.State = Content.State
  Object.QuestId = Content.QuestId
  Object.QuestChainId = Content.QuestChainId
  Object.IsNew = Content.IsNew
  return Object
end

function TaskUtils:CreateListItemContent(Content)
  local ClassPath = "/Game/UI/WBP/Task/Widget/ListItemContent.ListItemContent"
  local Object = NewObject(UE4.LoadClass(ClassPath))
  Object.DoingQuestId = Content.DoingQuestId
  Object.QuestChainId = Content.QuestChainId
  Object.State = Content.State
  Object.OwnerWidget = Content.OwnerWidget
  Object.IsShowType = Content.IsShowType
  Object.IsTracking = Content.IsTracking
  Object.IsSelectDoingQuest = Content.IsSelectDoingQuest
  Object.IsEmpty = Content.IsEmpty
  Object.UI = Content.UI
  return Object
end

function TaskUtils:CreateRewardContent(Content)
  local Object = NewObject(UIUtils.GetCommonItemContentClass())
  Object.ParentWidget = Content.OwnerWidget
  Object.Id = Content.Id
  Object.Count = Content.Count
  Object.Icon = Content.Icon
  Object.Rarity = Content.Rarity
  Object.IsShowDetails = Content.IsShowDetails
  Object.ItemType = Content.ItemType
  Object.UIName = "TaskPanel"
  return Object
end

function TaskUtils:GetQuestDetail(QuestChainId, QuestId)
  QuestDataInStoryLine[QuestChainId] = QuestDataInStoryLine[QuestChainId] or {}
  if QuestDataInStoryLine[QuestChainId] and QuestDataInStoryLine[QuestChainId][QuestId] then
    return QuestDataInStoryLine[QuestChainId][QuestId]
  end
  local StoryLineDetails = StorylineUtils.CreateQuestDetails(QuestChainId)
  local NodeList = StoryLineDetails.QuestStoryNodeQuestInfos
  for _, Node in pairs(NodeList) do
    QuestDataInStoryLine[QuestChainId][Node.PropsData.QuestId] = Node.PropsData
    for Key, QuestNodeData in pairs(Node.QuestNodeQuestInfos) do
      self:CheckTypeAndCollectExtraInfo(QuestNodeData, QuestChainId, Node.PropsData.QuestId)
    end
  end
  return QuestDataInStoryLine[QuestChainId][QuestId]
end

function TaskUtils:GetTrackingQuestDetailInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local TrackingId = Avatar.TrackingQuestChainId
  local QuestData = Avatar.QuestChains[TrackingId]
  if not QuestData or 3 == QuestData.State then
    return nil
  end
  local DoingQuestId = Avatar.QuestChains[TrackingId].DoingQuestId
  return self:GetQuestDetail(TrackingId, DoingQuestId)
end

function TaskUtils:GetTrackingQuestMapInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local TrackingId = Avatar.TrackingQuestChainId
  if not Avatar.QuestChains[TrackingId] then
    return nil
  end
  return self:GetQuestMapInfo(TrackingId)
end

function TaskUtils:GetQuestMapInfo(InChainId)
  local Info = self:GetTrackingQuestDetailInfo()
  
  local function ContainWorldMapRegionId(Target, Datas)
    for _, Data in pairs(Datas) do
      if Target == Data then
        return true
      end
    end
    return false
  end
  
  if Info and Info.SubRegionId and Info.SubRegionId > 0 then
    local QuestSubRegionId = Info.SubRegionId
    local ParentRegionId = DataMgr.SubRegion[QuestSubRegionId].RegionId
    local RegionMapId
    if DataMgr.Region[ParentRegionId] and DataMgr.Region[ParentRegionId].RegionMapId then
      RegionMapId = DataMgr.Region[ParentRegionId].RegionMapId
    end
    local WorldMapId
    if nil ~= RegionMapId then
      for _, Data in pairs(DataMgr.WorldMap) do
        if ContainWorldMapRegionId(RegionMapId, Data.WorldMapRegion) then
          WorldMapId = Data.UIIndex
          break
        end
      end
    end
    return WorldMapId, RegionMapId
  else
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(InChainId, "Task")
    if IsEmptyTable(UIObjs) then
      do
        local TargetDoingQuestId = 0
        local Avatar = GWorld:GetAvatar()
        if Avatar then
          if Avatar.QuestChains[InChainId] then
            TargetDoingQuestId = Avatar.QuestChains[InChainId].DoingQuestId
          end
          local Message = "\232\175\183\230\163\128\230\159\165STL\228\187\187\229\138\161\232\138\130\231\130\185\230\152\175\229\144\166\233\133\141\231\189\174\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185" .. "\n\229\175\185\229\186\148\228\187\187\229\138\161\233\147\190:" .. InChainId .. "\n\229\175\185\229\186\148\228\187\187\229\138\161:" .. TargetDoingQuestId .. "\n\231\142\169\229\174\182\229\173\144\229\140\186\229\159\159:" .. Avatar.CurrentRegionId
          if Const.EnableTaskPrintError then
            ScreenPrint(string.format("%s", Message))
          end
        end
        return nil, nil
      end
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] then
        local TargetSubRegionId = GuidePointLocData[TargetKey].SubRegionId
        if not DataMgr.SubRegion[TargetSubRegionId] then
          do
            local TargetDoingQuestId = 0
            local Avatar = GWorld:GetAvatar()
            if Avatar then
              if Avatar.QuestChains[InChainId] then
                TargetDoingQuestId = Avatar.QuestChains[InChainId].DoingQuestId
              end
              local Message = "\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168\239\188\140\229\175\188\232\135\180\232\142\183\229\143\150\228\187\187\229\138\161\229\140\186\229\159\159\230\149\176\230\141\174\229\164\177\232\180\165\239\188\140\232\175\183\231\173\150\229\136\146\229\144\140\229\173\166\230\163\128\230\159\165" .. "\n\229\175\185\229\186\148\228\187\187\229\138\161\233\147\190:" .. InChainId .. "\n\229\175\185\229\186\148\228\187\187\229\138\161:" .. TargetDoingQuestId .. "\n\231\142\169\229\174\182\229\173\144\229\140\186\229\159\159:" .. Avatar.CurrentRegionId .. "\n\230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\136\228\184\139\229\136\146\231\186\191\229\144\142\231\188\128\228\184\186\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185Key\239\188\137:" .. v:GetName()
              if Const.EnableTaskPrintError then
                ScreenPrint(string.format("%s", Message))
              end
            end
          end
        else
          local ParentRegionId = DataMgr.SubRegion[TargetSubRegionId].RegionId
          local RegionMapId
          if DataMgr.Region[ParentRegionId] and DataMgr.Region[ParentRegionId].RegionMapId then
            RegionMapId = DataMgr.Region[ParentRegionId].RegionMapId
          end
          local WorldMapId
          if nil ~= RegionMapId then
            for _, Data in pairs(DataMgr.WorldMap) do
              if ContainWorldMapRegionId(RegionMapId, Data.WorldMapRegion) then
                WorldMapId = Data.UIIndex
                break
              end
            end
          end
          return WorldMapId, RegionMapId
        end
      else
        local TargetDoingQuestId = 0
        local Avatar = GWorld:GetAvatar()
        if Avatar then
          if Avatar.QuestChains[InChainId] then
            TargetDoingQuestId = Avatar.QuestChains[InChainId].DoingQuestId
          end
          local Message = "\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168\239\188\140\229\175\188\232\135\180\232\142\183\229\143\150\228\187\187\229\138\161\229\140\186\229\159\159\230\149\176\230\141\174\229\164\177\232\180\165\239\188\140\232\175\183\231\173\150\229\136\146\229\144\140\229\173\166\230\163\128\230\159\165" .. "\n\229\175\185\229\186\148\228\187\187\229\138\161\233\147\190:" .. InChainId .. "\n\229\175\185\229\186\148\228\187\187\229\138\161:" .. TargetDoingQuestId .. "\n\231\142\169\229\174\182\229\173\144\229\140\186\229\159\159:" .. Avatar.CurrentRegionId .. "\n\230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\136\228\184\139\229\136\146\231\186\191\229\144\142\231\188\128\228\184\186\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185Key\239\188\137:" .. v:GetName()
          if Const.EnableTaskPrintError then
            ScreenPrint(string.format("%s", Message))
          end
        end
        return
      end
    end
  end
end

function TaskUtils:CheckTypeAndCollectExtraInfo(QuestNodeData, QuestChainId, QuestId)
  if NodeHaveExtraInfo[QuestNodeData.Type] and QuestExtraInfo[QuestChainId] and QuestExtraInfo[QuestChainId][QuestId] then
    return
  end
end

function TaskUtils:SetQuestExtraInfo(QuestChainId, QuestId, Data)
  if not Data then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChainId = QuestChainId
  local DoingQuestId = QuestId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  QuestExtraInfo = QuestExtraInfo or {}
  QuestExtraInfo[ChainId] = QuestExtraInfo[ChainId] or {}
  QuestExtraInfo[ChainId][DoingQuestId] = QuestExtraInfo[ChainId][DoingQuestId] or {}
  if Data.NodeKey then
    QuestExtraInfo[ChainId][DoingQuestId][Data.NodeKey] = Data
  end
end

function TaskUtils:ClearQuestExtraInfo(QuestChainId, QuestId, InKey)
  if QuestExtraInfo and QuestExtraInfo[QuestChainId] and QuestExtraInfo[QuestChainId][QuestId] and QuestExtraInfo[QuestChainId][QuestId][InKey] then
    if QuestExtraInfo[QuestChainId][QuestId][InKey].Node then
      QuestExtraInfo[QuestChainId][QuestId][InKey].Node = nil
    end
    QuestExtraInfo[QuestChainId][QuestId][InKey] = nil
  end
end

function TaskUtils:GetQuestCountExtraInfoString(QuestChainId, QuestId, NodeKey)
  if not QuestExtraInfo[QuestChainId] or not QuestExtraInfo[QuestChainId][QuestId] then
    return ""
  end
  local Info = QuestExtraInfo[QuestChainId][QuestId]
  if nil ~= NodeKey and Info[NodeKey] then
    if Info and Info[NodeKey] and Info[NodeKey].Count and Info[NodeKey].RetCount then
      return "(" .. Info[NodeKey].Count .. "/" .. Info[NodeKey].RetCount .. ")"
    end
  else
    local UpdateCountInfo = ""
    local IsUpdateMainBar = false
    for _, Data in pairs(Info) do
      if Data.Node and Data.Node.Type == "BranchQuestStartNode" and Data.IsUpdateCountInfo then
        UpdateCountInfo = "(" .. "0" .. "/" .. Data.NeedFinishCount .. ")"
        IsUpdateMainBar = Data.IsUpdateCountInfo and Data.NeedFinishCount > 0
      end
    end
    if IsUpdateMainBar then
      do
        local IsValid = true
        for _, Data in pairs(Info) do
          if Data.Node and Data.Node.Type == "CheckBranchQuestFinishedNode" then
            UpdateCountInfo = "(" .. Data.CurrentFinishedCount .. "/" .. Data.NeedFinishCount .. ")"
            IsValid = Data.CurrentFinishedCount <= Data.NeedFinishCount and Data.NeedFinishCount > 0
          end
        end
        if IsValid then
          return UpdateCountInfo
        end
      end
    end
    for _, v in pairs(Info) do
      if v.Count and v.RetCount then
        return "(" .. v.Count .. "/" .. v.RetCount .. ")"
      end
    end
  end
  return ""
end

function TaskUtils:GetQuestExtraInfo(QuestChainId, QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ChainId = QuestChainId
  local DoingQuestId = QuestId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    ChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
    DoingQuestId = Avatar.QuestChains[ChainId].DoingQuestId
  end
  if QuestExtraInfo and QuestExtraInfo[ChainId] and QuestExtraInfo[ChainId][DoingQuestId] then
    return QuestExtraInfo[ChainId][DoingQuestId]
  end
  return nil
end

function TaskUtils:CheckTaskIsInEXRegion()
  local Info = self:GetTrackingQuestDetailInfo()
  local QuestRegionMapId
  if Info and Info.SubRegionId and Info.SubRegionId > 0 then
    QuestRegionMapId = Info.SubRegionId
  else
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return false
    end
    local CurTrackingQuestChainId = Avatar.TrackingQuestChainId
    if nil == CurTrackingQuestChainId or 0 == CurTrackingQuestChainId then
      return false
    end
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(CurTrackingQuestChainId, "Task")
    if IsEmptyTable(UIObjs) then
      return false
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] and GuidePointLocData[TargetKey].SubRegionId > 0 then
        QuestRegionMapId = GuidePointLocData[TargetKey].SubRegionId
        break
      end
      do
        local CurTrackingQuestId = 0
        if Avatar.QuestChains[CurTrackingQuestChainId] then
          CurTrackingQuestId = Avatar.QuestChains[CurTrackingQuestChainId].DoingQuestId
        end
        local Message = "\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168\239\188\140\229\175\188\232\135\180\232\142\183\229\143\150\228\187\187\229\138\161\229\140\186\229\159\159\230\149\176\230\141\174\229\164\177\232\180\165\239\188\140\232\175\183\231\173\150\229\136\146\229\144\140\229\173\166\230\163\128\230\159\165" .. "\n\229\189\147\229\137\141\232\191\189\232\184\170\228\187\187\229\138\161\233\147\190:" .. CurTrackingQuestChainId .. "\n\229\189\147\229\137\141\232\191\189\232\184\170\228\187\187\229\138\161:" .. CurTrackingQuestId .. "\n\231\142\169\229\174\182\229\173\144\229\140\186\229\159\159:" .. Avatar.CurrentRegionId .. "\n\230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\136\228\184\139\229\136\146\231\186\191\229\144\142\231\188\128\228\184\186\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185Key\239\188\137:" .. v:GetName()
        if Const.EnableTaskPrintError then
          ScreenPrint(string.format("%s", Message))
        end
      end
      break
    end
  end
  if not (QuestRegionMapId and DataMgr.SubRegion[QuestRegionMapId] and DataMgr.SubRegion[QuestRegionMapId].RegionId and DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId]) or not DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId].RegionMapId then
    return false
  end
  local IsInEXRegion = false
  local TaskRegionMapId = DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId].RegionMapId
  for _, Data in pairs(DataMgr.WorldMap) do
    for _, WorldMapRegion in pairs(Data.WorldMapRegion) do
      if WorldMapRegion == TaskRegionMapId then
        if Data.UIRegionType == "EX" then
          IsInEXRegion = true
        end
        break
      end
    end
  end
  return IsInEXRegion
end

function TaskUtils:ResumQuestTaskBarOnTrack(ServerQuestChainId, ClientQuestChainId, QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  if ServerQuestChainId and ClientQuestChainId and QuestId then
    if Avatar.QuestChains[ServerQuestChainId] and Avatar.QuestChains[ServerQuestChainId].DoingQuestId and 0 ~= Avatar.QuestChains[ServerQuestChainId].DoingQuestId then
      local TargetServerQuestId = Avatar.QuestChains[ServerQuestChainId].DoingQuestId
      if QuestExtraInfo and QuestExtraInfo[ServerQuestChainId] and QuestExtraInfo[ServerQuestChainId][TargetServerQuestId] then
        local ServerInfo = QuestExtraInfo[ServerQuestChainId][Avatar.QuestChains[ServerQuestChainId].DoingQuestId]
        if not IsEmptyTable(ServerInfo) then
          for _, Data in pairs(ServerInfo) do
            if Data.Node then
              Data.Node:OnCancelTrack()
            end
          end
        end
      end
    end
  elseif Avatar.QuestChains[ServerQuestChainId] and Avatar.QuestChains[ServerQuestChainId].DoingQuestId and 0 ~= Avatar.QuestChains[ServerQuestChainId].DoingQuestId then
    local TargetServerQuestChainId = Avatar.QuestChains[ServerQuestChainId].DoingQuestId
    if QuestExtraInfo and QuestExtraInfo[ServerQuestChainId] and QuestExtraInfo[ServerQuestChainId][TargetServerQuestChainId] then
      local ServerInfo = QuestExtraInfo[ServerQuestChainId][Avatar.QuestChains[ServerQuestChainId].DoingQuestId]
      if not IsEmptyTable(ServerInfo) then
        for _, Data in pairs(ServerInfo) do
          if Data.Node then
            Data.Node:OnCancelTrack()
          end
        end
      end
    end
  end
end

function TaskUtils:ShowQuestChainFinishCommonHudReward(QuestChainId, RewardBox)
  if DataMgr.QuestChain[QuestChainId] == nil or nil == DataMgr.QuestChain[QuestChainId].QuestChainReward then
    DebugPrint("TaskUtils:ShowQuestChainFinishCommonHudReward QuestChainId is error or QuestChainReward is nil")
    return
  end
  if nil == RewardBox then
    return
  end
  local AllRewardType = DataMgr.RewardType
  local TempRewardList = {}
  for Type, _ in pairs(AllRewardType) do
    local CurRewards = RewardBox[Type .. "s"]
    if not IsEmptyTable(CurRewards) then
      for Id, Count in pairs(CurRewards) do
        local ItemId = Id
        local ItemCount = Count
        local ItemRarity = ItemUtils.GetItemRarity(ItemId, Type)
        local ItemType = Type
        local RewardContent = {
          ItemType = ItemType,
          ItemId = ItemId,
          Count = ItemCount,
          Rarity = ItemRarity
        }
        table.insert(TempRewardList, RewardContent)
      end
    end
  end
  
  local function SortByRarity(a, b)
    return a.Rarity > b.Rarity
  end
  
  table.sort(TempRewardList, SortByRarity)
  UIUtils.ShowHudReward("UI_QUEST_REWARDS", TempRewardList)
end

function TaskUtils:RemoveAllQuestExtraInfo()
  if nil ~= QuestExtraInfo then
    for ChainId, Data in pairs(QuestExtraInfo) do
      for QuestId, _ in pairs(Data) do
        QuestExtraInfo[ChainId][QuestId] = nil
      end
    end
  end
end

function TaskUtils:UpdateAllMissionNpcGuideMaps(IsAdd, Name, NpcUnitId)
  if IsAdd then
    if self.MissionNpcGuideMaps[Name] == nil and nil ~= NpcUnitId then
      self.MissionNpcGuideMaps[Name] = NpcUnitId
    end
  else
    self.MissionNpcGuideMaps[Name] = nil
  end
end

function TaskUtils:CreateAndMoveFollowingPath(Class)
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local BPClass = LoadClass("/Game/BluePrints/Combat/EffectCreature/Others/BP_CreatPathEffectTrail.BP_CreatPathEffectTrail")
  if not IsValid(self.TaskPathActor) and self.IsCanMakeTaskPathActor == true then
    self.TaskPathActor = Class:GetWorld():SpawnActor(BPClass, nil, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, nil, nil)
    self.TaskPathActor:K2_SetActorLocation(PlayerCharacter:K2_GetActorLocation(), false, nil, false)
  end
end

function TaskUtils:UpdatePlayerSubRegionIdInfo(NewPlayerSubRegionId)
  DebugPrint("LHQ_UpdatePlayerSubRegionIdInfo, NewPlayerSubRegionId:", NewPlayerSubRegionId, "start===")
  local Avatar = GWorld:GetAvatar()
  if not Avatar or nil == NewPlayerSubRegionId or 0 == NewPlayerSubRegionId then
    return
  end
  EventManager:FireEvent(EventID.OnChangeTaskSubRegion)
  DebugPrint("LHQ_UpdatePlayerSubRegionIdInfo, NewPlayerSubRegionId:", NewPlayerSubRegionId, "end===")
end

function TaskUtils:GetSpcialPreQuestChainIdByConfig(StoryPath)
  local SpcialQuestCfgDatas = DataMgr.SpecialQuestConfig
  for _, Data in pairs(SpcialQuestCfgDatas) do
    if Data.StoryPath and Data.StoryPath == StoryPath then
      return Data.QuestChainId
    end
  end
  return 0
end

function TaskUtils:GetTaskBarWidget()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local TaskUIObj
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if nil ~= BattleMainUI and BattleMainUI.Pos_TaskBar:GetChildAt(0) then
    TaskUIObj = BattleMainUI.Pos_TaskBar:GetChildAt(0)
  end
  if nil ~= TaskUIObj then
    return TaskUIObj
  end
  return nil
end

function TaskUtils:UpdateSpecialTaskInfo(OpType, TaskInfo)
  local TaskBar = self:GetTaskBarWidget()
  if TaskBar then
    TaskBar:UpdateSpecialTaskInfo(OpType, TaskInfo)
  end
end

function TaskUtils:CheckSpecialTaskDoing()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Avatar.SpecialQuestData then
    PrintTable({
      SpecialQuestData = Avatar.SpecialQuestData:all_dump(Avatar.SpecialQuestData)
    }, 10)
    for _, QuestData in pairs(Avatar.SpecialQuestData) do
      if QuestData and 1 == QuestData.SpecialQuestState then
        return true
      end
    end
  else
    DebugPrint("Avatar.SpecialQuestData Is nil")
  end
  return false
end

function TaskUtils:QuestOpenMainMapByQuestTrack()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackingQuestData = TaskUtils:GetTrackingQuestDetailInfo()
  local IsFairyLand = false
  if TrackingQuestData and TrackingQuestData.IsFairyLand then
    IsFairyLand = TrackingQuestData.IsFairyLand
  end
  if not TrackingQuestData then
    return
  end
  local TargetSubRegionId = MissionIndicatorManager:GetTargetTaskSubRegionId(Avatar.TrackingQuestChainId, Avatar.QuestChains[Avatar.TrackingQuestChainId].DoingQuestId)
  if DataMgr.SubRegion[Avatar.CurrentRegionId] == nil or DataMgr.SubRegion[TargetSubRegionId] == nil then
    local CurTrackingQuestChainId = Avatar.TrackingQuestChainId
    local CurTrackingQuestId = 0
    if Avatar.QuestChains[CurTrackingQuestChainId] then
      CurTrackingQuestId = Avatar.QuestChains[CurTrackingQuestChainId].DoingQuestId
    end
    local Message = "\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\231\173\150\229\136\146\229\144\140\229\173\166\233\133\141" .. "\n\229\189\147\229\137\141\232\191\189\232\184\170\228\187\187\229\138\161\233\147\190:" .. CurTrackingQuestChainId .. "\n\229\189\147\229\137\141\232\191\189\232\184\170\228\187\187\229\138\161:" .. CurTrackingQuestId .. "\n\231\142\169\229\174\182\229\173\144\229\140\186\229\159\159:" .. Avatar.CurrentRegionId .. "\n\228\187\187\229\138\161\229\173\144\229\140\186\229\159\159Id:" .. TargetSubRegionId
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("%s", Message))
    end
    return
  end
  local CurrentRegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  local TaskRegionId = DataMgr.SubRegion[TargetSubRegionId].RegionId
  if Avatar.CurrentRegionId == TargetSubRegionId then
    local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
    if "Mobile" == Platform then
      local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
      if not IsEmptyTable(Objs) then
        for Name, UIObj in pairs(Objs) do
          UIObj:RePlayAppearAnim()
        end
      end
    end
    return
  end
  if CurrentRegionId ~= TaskRegionId and false == IsFairyLand then
    local MainMap = UIManager(GWorld.GameInstance):GetUIObj("LevelMapMain")
    if nil == MainMap then
      MainMap = UIManager(GWorld.GameInstance):LoadUINew("LevelMapMain", true)
    end
    if TargetSubRegionId ~= Const.HomeBaseSubRegionId then
      MainMap.RealWildMap:ChangeRegionForSmartIndicator(TargetSubRegionId, Avatar.TrackingQuestChainId)
    else
      MainMap.RealWildMap:ChangeRegionForSmartIndicator(TargetSubRegionId, Avatar.TrackingQuestChainId)
    end
  elseif CurrentRegionId ~= TaskRegionId or true == IsFairyLand then
    local function CancelDeliverTo()
    end
    
    local function DoDeliverTo()
      local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
      if IsValid(GameMode) then
        GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, TargetSubRegionId, 1, true)
      end
    end
    
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if not DataMgr.QuestChain[Avatar.TrackingQuestChainId] then
      return
    end
    local TaskName = DataMgr.QuestChain[Avatar.TrackingQuestChainId].QuestChainName
    local Params = {
      ShortText = string.format("%s <H>%s</>", GText("UI_Prompt_QuestTrans"), GText(TaskName)),
      LeftCallbackObj = self,
      LeftCallbackFunction = CancelDeliverTo,
      RightCallbackObj = self,
      RightCallbackFunction = DoDeliverTo,
      CloseBtnCallbackObj = self,
      CloseBtnCallbackFunction = CancelDeliverTo
    }
    UIManager:ShowCommonPopupUI(100160, Params)
  end
end

function TaskUtils:CheckIsNeedLoadLevelMap(InTaskSubRegionId, InCurrentSubRegionid)
  local bAnyTeleporPointUnlock = self:CheckIsAnyTeleporPointUnlock(InTaskSubRegionId, true)
  local TaskRegionId = 0
  local CurrentRegionId = 0
  if DataMgr.SubRegion[InTaskSubRegionId] and DataMgr.SubRegion[InTaskSubRegionId].RegionId then
    TaskRegionId = DataMgr.SubRegion[InTaskSubRegionId].RegionId
  end
  if DataMgr.SubRegion[InCurrentSubRegionid] and DataMgr.SubRegion[InCurrentSubRegionid].RegionId then
    CurrentRegionId = DataMgr.SubRegion[InCurrentSubRegionid].RegionId
  end
  if TaskRegionId ~= CurrentRegionId and bAnyTeleporPointUnlock then
    return true
  elseif TaskRegionId == CurrentRegionId then
    return false
  else
    return true
  end
end

function TaskUtils:GetIconTextureByTrackQuestChainType(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local TrackQuestChainId
  if not QuestChainId then
    TrackQuestChainId = Avatar.TrackingQuestChainId
  else
    TrackQuestChainId = QuestChainId
  end
  local ConstQuestChainTypeTable = {
    [Const.MainQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission",
    [Const.SideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission.T_Gp_SideMission",
    [Const.MainActivityQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_EventMainMission.T_Gp_EventMainMission",
    [Const.LimTimeQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LTMission.T_Gp_LTMission",
    [Const.SpecialSideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission.T_Gp_SpSideMission"
  }
  if DataMgr.QuestChain[TrackQuestChainId] then
    local CurQuestChainType = DataMgr.QuestChain[TrackQuestChainId].QuestChainType
    if ConstQuestChainTypeTable[CurQuestChainType] then
      return LoadObject(ConstQuestChainTypeTable[CurQuestChainType])
    end
  end
  return nil
end

function TaskUtils:GetIconTextureByQuestChainType(InChainId)
  local ConstQuestChainTypeTable = {
    [Const.MainQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission",
    [Const.SideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission.T_Gp_SideMission",
    [Const.MainActivityQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_EventMainMission.T_Gp_EventMainMission",
    [Const.LimTimeQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LTMission.T_Gp_LTMission",
    [Const.SpecialSideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission.T_Gp_SpSideMission"
  }
  if DataMgr.QuestChain[InChainId] then
    local CurQuestChainType = DataMgr.QuestChain[InChainId].QuestChainType
    if ConstQuestChainTypeTable[CurQuestChainType] then
      return LoadObject(ConstQuestChainTypeTable[CurQuestChainType])
    end
  end
  return nil
end

function TaskUtils:GetGrayIconTextureByQuestChainType(InChainId)
  local ConstQuestChainTypeTable = {
    [Const.MainQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskMainLine.T_Tab_TaskMainLine",
    [Const.SideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskSider.T_Tab_TaskSider",
    [Const.MainActivityQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskActivityMainLine.T_Tab_TaskActivityMainLine",
    [Const.LimTimeQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskLimitedtimeActivity.T_Tab_TaskLimitedtimeActivity",
    [Const.SpecialSideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskSpecialSider.T_Tab_TaskSpecialSider"
  }
  if DataMgr.QuestChain[InChainId] then
    local CurQuestChainType = DataMgr.QuestChain[InChainId].QuestChainType
    if ConstQuestChainTypeTable[CurQuestChainType] then
      return LoadObject(ConstQuestChainTypeTable[CurQuestChainType])
    end
  end
  return nil
end

function TaskUtils:GetOptinalIconTextureByQuestChainType(InChainId)
  local ConstQuestChainTypeTable = {
    [Const.MainQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission_Optional.T_Gp_MainMission_Optional",
    [Const.SideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission_Optional.T_Gp_SideMission_Optional",
    [Const.SpecialSideQuestChainType] = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Optional.T_Gp_SpSideMission_Optional"
  }
  if DataMgr.QuestChain[InChainId] then
    local CurQuestChainType = DataMgr.QuestChain[InChainId].QuestChainType
    if ConstQuestChainTypeTable[CurQuestChainType] then
      return LoadObject(ConstQuestChainTypeTable[CurQuestChainType])
    end
  else
    return LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DynQuest_Optional.T_Gp_DynQuest_Optional")
  end
  return nil
end

function TaskUtils:GetUnlockMainStory()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AllQuestData = Avatar.QuestChains or {}
  for QuestChainId, Data in pairs(AllQuestData) do
    if DataMgr.QuestChain[QuestChainId] and DataMgr.QuestChain[QuestChainId].QuestChainType then
      local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
      if 1 == QuestChainType and 0 == Data.State and Data.CanShow then
        return QuestChainId
      end
    end
  end
  return nil
end

function TaskUtils:TryGetSmartPointDataForRegionMap(CurSubRegionId, TargetSubRegionId)
  local function ContainsElement(table, element)
    for _, value in pairs(table) do
      if value[1] == element then
        return value
      end
    end
    return nil
  end
  
  local function ContainsSubRegion(table, element)
    for _, value in pairs(table) do
      if value == element then
        return value
      end
    end
    return nil
  end
  
  local function CreateQueue()
    local queue = {}
    queue.first = 0
    queue.last = -1
    queue.QueueValue = {}
    queue.Path = {}
    return queue
  end
  
  local function Enqueue(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue.QueueValue[last] = value
    table.insert(queue.Path, value[1])
  end
  
  local function ContainsPath(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
  
  local function Dequeue(queue)
    local first = queue.first
    if first > queue.last then
      return nil
    end
    local value = queue.QueueValue[first]
    queue.QueueValue[first] = nil
    queue.first = first + 1
    return value
  end
  
  local function IsEmptyQueue(queue)
    return queue.first > queue.last
  end
  
  if not DataMgr.RegionGraph[TargetSubRegionId] or not DataMgr.SubRegion[TargetSubRegionId].RegionId then
    return nil
  end
  local TargetRegionId = DataMgr.SubRegion[TargetSubRegionId].RegionId
  if not (DataMgr.RegionGraph[CurSubRegionId] and DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget.RegionTarget then
    return nil
  end
  local RegionTargetDatas = DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget.RegionTarget
  
  local function TryFindTargetPointByBFS(RootTargetData)
    local RootSubRegionId = RootTargetData[1]
    if not (DataMgr.RegionGraph[RootSubRegionId] and DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget.RegionTarget then
      return -1
    end
    local RootRegionQueue = CreateQueue()
    local RootRegionDatas = DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget.RegionTarget
    for _, v in pairs(RootRegionDatas) do
      Enqueue(RootRegionQueue, v)
    end
    local QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
    local Weight = 1
    local QueueIndex = 0
    while not IsEmptyQueue(RootRegionQueue) do
      if ContainsElement(RootRegionQueue.QueueValue, TargetSubRegionId) == nil then
        local frontData = RootRegionQueue.QueueValue[RootRegionQueue.first]
        local frontDataSubRegionId = frontData[1]
        QueueIndex = QueueIndex + 1
        if QueueCount < QueueIndex then
          Weight = Weight + 1
          QueueIndex = 0
          QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
        end
        Dequeue(RootRegionQueue)
        if not (DataMgr.RegionGraph[frontDataSubRegionId] and DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget then
        elseif DataMgr.RegionGraph[frontDataSubRegionId].RegionStart == DataMgr.RegionGraph[TargetSubRegionId].RegionStart then
          local NewRegionDatas = DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget
          for _, NewRegionData in pairs(NewRegionDatas) do
            local SubRegionId = NewRegionData[1]
            if DataMgr.RegionGraph[SubRegionId] and DataMgr.RegionGraph[TargetSubRegionId].RegionStart == DataMgr.RegionGraph[SubRegionId].RegionStart and not ContainsPath(RootRegionQueue.Path, SubRegionId) then
              Enqueue(RootRegionQueue, NewRegionData)
              if ContainsElement(RootRegionQueue.QueueValue, TargetSubRegionId) then
                return Weight + 1
              end
            end
          end
        end
      else
        return Weight + 1
      end
    end
    if IsEmptyQueue(RootRegionQueue) then
      return -1
    end
  end
  
  local RetWeight = math.maxinteger
  local RetData
  local MinDistance = math.maxinteger
  local RetDataTable = {}
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local PlayerChar = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not ContainsElement(RegionTargetDatas, TargetSubRegionId) then
    for _, IteraData in pairs(RegionTargetDatas) do
      local IterWeight = TryFindTargetPointByBFS(IteraData)
      if IterWeight >= 0 and RetWeight >= IterWeight then
        RetWeight = IterWeight
        table.insert(RetDataTable, IteraData)
      end
    end
    for _, Data in pairs(RetDataTable) do
      local NewTargetPoint = GameState:GetTargetPoint(Data[2])
      if NewTargetPoint and TaskUtils:CheckIsAnyTeleporPointUnlock(Data[1], true) then
        local PointLocation = NewTargetPoint:K2_GetActorLocation()
        local Distance = UKismetMathLibrary.Vector_Distance(PlayerChar.CurrentLocation, PointLocation)
        if MinDistance > Distance then
          MinDistance = Distance
          RetData = Data
        end
      end
    end
  else
    RetWeight = 1
    for _, IteraData in pairs(RegionTargetDatas) do
      if DataMgr.RegionGraph[IteraData[1]].RegionStart and ContainsSubRegion(DataMgr.RegionGraph[IteraData[1]].RegionStart, TargetSubRegionId) then
        table.insert(RetDataTable, IteraData)
      end
    end
    local TempRetData = {}
    RetData = RetData or {}
    for _, Data in pairs(RetDataTable) do
      if Data and Data[1] and Data[2] and DataMgr.SubRegion[Data[1]] then
        local NewTargetPoint = GameState:GetTargetPoint(Data[2])
        local IsConditionUnlock = true
        local Avatar = GWorld:GetAvatar()
        if Avatar and Data[4] then
          IsConditionUnlock = ConditionUtils.CheckCondition(Avatar, Data[4])
        end
        if NewTargetPoint and IsConditionUnlock then
          local PointLocation = NewTargetPoint:K2_GetActorLocation()
          local Distance = UKismetMathLibrary.Vector_Distance(PlayerChar.CurrentLocation, PointLocation)
          if MinDistance > Distance then
            MinDistance = Distance
            TempRetData = Data
          end
        end
      end
    end
    RetData[1] = CurSubRegionId
    RetData[2] = TempRetData[2]
    RetData[3] = TempRetData[3]
  end
  if IsEmptyTable(RetDataTable) and DataMgr.RegionGraph[TargetSubRegionId] and DataMgr.RegionGraph[TargetSubRegionId].SubRegionTarget and DataMgr.RegionGraph[TargetSubRegionId].SubRegionTarget.RegionTarget then
    local TargetRegionTargets = DataMgr.RegionGraph[TargetSubRegionId].SubRegionTarget.RegionTarget
    for _, Data in pairs(TargetRegionTargets) do
      local RetRegionId, RetTargetData = self:TryFindUnlockTeleporPointByBFS(Data[1], TargetSubRegionId)
      if RetRegionId and RetTargetData then
        RetData = RetTargetData
        return RetRegionId, RetData
      end
    end
  end
  return nil, RetData
end

function TaskUtils:TryFindUnlockTeleporPointByBFS(InSubRegionId, TargetSubRegionId)
  local function TryGetAnyRegionDataUnlock(table)
    if table then
      for _, value in pairs(table) do
        if self:CheckIsAnyTeleporPointUnlock(value, true) then
          return value
        end
      end
    end
    return nil
  end
  
  local function CreateQueue()
    local queue = {}
    queue.first = 0
    queue.last = -1
    queue.QueueValue = {}
    queue.Path = {}
    return queue
  end
  
  local function Enqueue(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue.QueueValue[last] = value
    table.insert(queue.Path, value[1])
  end
  
  local function ContainsPath(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
  
  local function Dequeue(queue)
    local first = queue.first
    if first > queue.last then
      return nil
    end
    local value = queue.QueueValue[first]
    queue.QueueValue[first] = nil
    queue.first = first + 1
    return value
  end
  
  local function IsEmptyQueue(queue)
    return queue.first > queue.last
  end
  
  local function CheckTargetSubRegionIdFromStart(StartTable, TargetSubRegionId)
    if StartTable then
      for _, value in pairs(StartTable) do
        if value == TargetSubRegionId then
          return true
        end
      end
    end
    return false
  end
  
  if not DataMgr.RegionGraph[InSubRegionId] or not DataMgr.SubRegion[InSubRegionId].RegionId then
    return nil, nil
  end
  local RegionStartDatas = DataMgr.RegionGraph[InSubRegionId].RegionStart
  local TargetRegionStartDatas = DataMgr.RegionGraph[TargetSubRegionId].RegionStart
  
  local function TryFindTargetPointByBFS(RootSubRegionId)
    local RootRegionQueue = CreateQueue()
    local RootRegionDatas = DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget.RegionTarget
    for _, v in pairs(RootRegionDatas) do
      Enqueue(RootRegionQueue, v)
    end
    local QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
    local Weight = 1
    local QueueIndex = 0
    while not IsEmptyQueue(RootRegionQueue) do
      if nil == TryGetAnyRegionDataUnlock(RegionStartDatas) then
        local frontData = RootRegionQueue.QueueValue[RootRegionQueue.first]
        local frontDataSubRegionId = frontData[1]
        QueueIndex = QueueIndex + 1
        if QueueCount < QueueIndex then
          Weight = Weight + 1
          QueueIndex = 0
          QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
        end
        Dequeue(RootRegionQueue)
        if not (DataMgr.RegionGraph[frontDataSubRegionId] and DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget then
        elseif DataMgr.RegionGraph[frontDataSubRegionId].RegionStart and not ContainsPath(RootRegionQueue.Path, frontDataSubRegionId) then
          local NewRegionDatas = DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget
          for _, NewRegionData in pairs(NewRegionDatas) do
            local SubRegionId = NewRegionData[1]
            Enqueue(RootRegionQueue, NewRegionData)
            if TryGetAnyRegionDataUnlock(NewRegionDatas) then
              local RetRegionId = DataMgr.SubRegion[SubRegionId].RegionId
              return RetRegionId, NewRegionData[1]
            end
          end
        end
      else
        for _, Data in pairs(RootRegionDatas) do
          if Data and Data[1] and CheckTargetSubRegionIdFromStart(TargetRegionStartDatas, Data[1]) then
            return DataMgr.SubRegion[RootSubRegionId].RegionId, Data
          end
        end
        return nil, nil
      end
    end
    if IsEmptyQueue(RootRegionQueue) then
      return nil, nil
    end
  end
  
  return TryFindTargetPointByBFS(InSubRegionId)
end

function TaskUtils:CheckIsAnyTeleporPointUnlock(InSubRegionId, IsInAllSubRegion)
  if DataMgr.SubRegion[InSubRegionId] == nil then
    return false
  end
  local RegionId = DataMgr.SubRegion[InSubRegionId].RegionId
  local RegionData = DataMgr.Region[RegionId]
  if not RegionData then
    return false
  end
  local TempTransferDatas = {}
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, TransferData in pairs(DataMgr.TeleportPoint) do
    if IsInAllSubRegion then
      if CommonUtils.HasValue(RegionData.IsRandom, TransferData.TeleportPointSubRegion) and TransferData.StaticId then
        TempTransferDatas[TransferData.StaticId] = TransferData
      end
    elseif TransferData.TeleportPointSubRegion == InSubRegionId and TransferData.StaticId then
      TempTransferDatas[TransferData.StaticId] = TransferData
    end
  end
  local TmpFullRegionStoreDatas = GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
  if nil ~= TmpFullRegionStoreDatas then
    for _, RegionBaseData in pairs(TmpFullRegionStoreDatas) do
      local Data = TempTransferDatas[RegionBaseData.CreatorId]
      if Data then
        local State = false
        if RegionBaseData.State then
          State = RegionBaseData.State.OpenState
        end
        if State then
          return true
        end
      end
    end
  end
  return false
end

function TaskUtils:SetQuestInterfaceJump(QuestId, IsJump, IsShowGuide, JumpId)
  QuestInterfaceJump = QuestInterfaceJump or {}
  QuestInterfaceJump[QuestId] = QuestInterfaceJump[QuestId] or {}
  QuestInterfaceJump[QuestId] = {IsJump, IsShowGuide}
  QuestInterfaceJumpId = QuestInterfaceJumpId or {}
  QuestInterfaceJumpId[QuestId] = JumpId
end

function TaskUtils:GetQuestInterfaceJump(QuestId)
  if not QuestId then
    return nil
  end
  if QuestInterfaceJump[QuestId] then
    return QuestInterfaceJump[QuestId][1]
  end
end

function TaskUtils:GetQuestIsShowGuide(QuestId)
  if not QuestId then
    return nil
  end
  if QuestInterfaceJump[QuestId] then
    return QuestInterfaceJump[QuestId][2]
  end
end

function TaskUtils:GetQuestInterfaceJumpId(QuestId)
  if not QuestId then
    return nil
  end
  return QuestInterfaceJumpId[QuestId]
end

function TaskUtils:RemoveQuestInterfaceJump(QuestId)
  QuestInterfaceJump[QuestId] = nil
  QuestInterfaceJumpId[QuestId] = nil
end

function TaskUtils:JudgeCanTrack()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState and GameState:IsInRegion() and not Avatar:IsInHardBoss() then
    return true
  end
  return false
end

return TaskUtils
