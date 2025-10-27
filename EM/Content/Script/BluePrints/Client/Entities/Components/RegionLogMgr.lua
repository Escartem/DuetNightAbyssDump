local Component = {}

function Component:PrintRegionCache()
  self:PrintCurrentQuestDataCache()
  self:PrintCurrentRarelyDataCache()
  self:PrintCurrentCommonDataCache()
  self:PrintCurrentMistakeDataCache()
  self:PrintCurrentStaticCreatorCache()
  self:PrintCurrentManualItemCache()
  self:PrintCurrentSpawnActorCache()
  self:PrintCurrentWorldRegionActorCache()
  self:PrintCurrentSerializeCreator()
  self:PrintCurrentExplore()
end

function Component:PrintCurrentQuestDataCache()
  if not self.QuestDatas then
    DebugPrint("ZJT_ \229\189\147\229\137\141\228\184\141\229\173\152\229\156\168\229\190\133\230\143\144\228\186\164\230\156\141\229\138\161\231\171\175\228\187\187\229\138\161\231\188\147\229\173\152\230\149\176\230\141\174 ")
    return
  end
  DebugPrint("ZJT_ -------------------------- Start PrintCurrentQuestDataCache --------------------------")
  for QuestId, WorldRegionEids in pairs(self.QuestDatas) do
    for WorldRegionEid, RegionBaseData in pairs(WorldRegionEids) do
      DebugPrint("ZJT_ PrintCurrentQuestDataCache Incomplete Quest", WorldRegionEid, QuestId, self:CheckQuestIdIsDoing(RegionBaseData.QuestId), RegionBaseData.CreatorId)
    end
  end
  for QuestId, WorldRegionEids in pairs(self.QuestUpdateDatas) do
    for WorldRegionEid, RegionBaseData in pairs(WorldRegionEids) do
      DebugPrint("ZJT_ PrintCurrentQuestUpdateDatasCache Incomplete Quest", WorldRegionEid, QuestId, self:CheckQuestIdIsDoing(RegionBaseData.QuestId), RegionBaseData.CreatorId)
    end
  end
  DebugPrint("ZJT_ -------------------------- End PrintCurrentQuestDataCache --------------------------")
end

function Component:PrintCurrentRarelyDataCache()
  if not self.RarelyDatas then
    DebugPrint("ZJT_ \229\189\147\229\137\141\228\184\141\229\173\152\229\156\168\229\190\133\230\143\144\228\186\164\230\156\141\229\138\161\231\171\175\230\142\162\231\180\162\231\188\147\229\173\152\230\149\176\230\141\174 ")
    return
  end
  DebugPrint("ZJT_ -------------------------- ***** Start ***** PrintCurrentRarelyDataCache --------------------------")
  for RarelyId, WorldRegionEids in pairs(self.RarelyDatas) do
    for WorldRegionEid, RegionBaseData in pairs(WorldRegionEids) do
      DebugPrint("ZJT_ PrintCurrentRarelyDataCache ", WorldRegionEid, RarelyId, self:UpdateRarelyDataToServer(RegionBaseData), RegionBaseData.CreatorId)
    end
  end
  DebugPrint("ZJT_ -------------------------- ***** End ***** PrintCurrentRarelyDataCache --------------------------")
end

function Component:PrintCurrentCommonDataCache()
  if not self.CommonDatas then
    DebugPrint("ZJT_ \229\189\147\229\137\141\228\184\141\229\173\152\229\156\168\229\190\133\230\143\144\228\186\164\230\156\141\229\138\161\231\171\175\229\184\184\232\167\132\231\188\147\229\173\152\230\149\176\230\141\174 ")
    return
  end
  DebugPrint("ZJT_ -------------------- Start PrintCurrentCommonDataCache -------------------- ")
  for RegionId, RegionLevelDatas in pairs(self.CommonDatas) do
    for LevelName, WorldRegionEids in pairs(RegionLevelDatas) do
      for WorldRegionEid, RegionBaseData in pairs(WorldRegionEids) do
        PrintTable({RegionBaseData = RegionBaseData}, 10)
      end
    end
  end
  DebugPrint("ZJT_ -------------------- End PrintCurrentCommonDataCache -------------------- ")
end

function Component:PrintCurrentMistakeDataCache()
  if not self.MistakeDatas then
    DebugPrint("ZJT_ \229\189\147\229\137\141\228\184\141\229\173\152\229\156\168\233\157\158\229\173\152\229\130\168\231\188\147\229\173\152\230\149\176\230\141\174 ")
    return
  end
  DebugPrint("ZJT_ -------------------- Start PrintCurrentMistakeDataCache -------------------- ")
  for RegionId, RegionLevelDatas in pairs(self.MistakeDatas) do
    for LevelName, WorldRegionEids in pairs(RegionLevelDatas) do
      for WorldRegionEid, RegionBaseData in pairs(WorldRegionEids) do
        PrintTable({RegionBaseData = RegionBaseData}, 10)
      end
    end
  end
  DebugPrint("ZJT_ -------------------- End PrintCurrentMistakeDataCache -------------------- ")
end

function Component:PrintCurrentStaticCreatorCache()
  if not self.StaticIdControlCache then
    DebugPrint("ZJT_ \229\189\147\229\137\141\228\184\141\229\173\152\229\156\168\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185\231\188\147\229\173\152\230\149\176\230\141\174 ")
    return
  end
  DebugPrint("ZJT_ -------------------- Start PrintCurrentStaticCreatorCache -------------------- ")
  for CreatorId, WorldRegionEids in pairs(self.StaticIdControlCache) do
    for WorldRegionEid, SubRegionId in pairs(WorldRegionEids) do
      DebugPrint("ZJT_ PrintCurrentStaticCreatorCache ", CreatorId, WorldRegionEid, SubRegionId)
    end
  end
  DebugPrint("ZJT_ -------------------- End PrintCurrentStaticCreatorCache -------------------- ")
end

function Component:PrintCurrentManualItemCache()
  for ManualItemId, WorldRegionEid in pairs(self.ManualDatas) do
    DebugPrint("ZJT_ PrintCurrentManualItemCache ", ManualItemId, WorldRegionEid)
  end
end

function Component:PrintCurrentWorldRegionActorCache()
  for RegionId, LevelActors in pairs(self.WorldRegionEid2Actor) do
    for WorldRegionEid, TargetActor in pairs(LevelActors) do
      if IsValid(TargetActor) then
        DebugPrint("ZJT_ PrintCurrentWorldRegionActorCache ", RegionId, WorldRegionEid, TargetActor.RegionDataType, TargetActor.QuestId, TargetActor.CreatorId, TargetActor.Eid, TargetActor:GetName(), TargetActor.RarelyId)
      else
        DebugPrint("ZJT_ PrintCurrentWorldRegionActorCache TargetActor Not Exist", RegionId, WorldRegionEid)
      end
    end
  end
end

function Component:PrintCurrentSerializeCreator()
  for SubRegionId, StaticCreatorId in pairs(self.SerializeStaticCretor) do
    local TempEid = self.SerializeStaticCretor[SubRegionId][StaticCreatorId]
    DebugPrint("ZJT_ PrintCurrentSerializeCreator ", SubRegionId, StaticCreatorId, TempEid)
  end
end

function Component:PrintInfoByWorldRegionEid(WorldRegionEid)
end

function Component:PrintCurrentExplore()
  for RarelyId, Explore in pairs(self.Explores) do
    self.logger.debug("ZJT_  PrintCurrentExplore RarelyId, Blue ", RarelyId, Explore.RarelyId, Explore.ExploreState)
    if Explore:IsDoing() then
      self.logger.debug("ZJT_ PrintExplore \230\173\163\229\156\168\230\137\167\232\161\140 ", RarelyId, Explore.RarelyId, Explore.ExploreState)
    end
    if Explore:IsComplete() then
      self.logger.debug("ZJT_ PrintExplore \230\137\167\232\161\140\229\174\140\230\136\144 ", RarelyId, Explore.RarelyId, Explore.ExploreState)
    end
  end
end

return Component
