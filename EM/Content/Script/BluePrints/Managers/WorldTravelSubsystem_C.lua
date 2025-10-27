require("UnLua")
local WorldTravelSubsystem_C = Class()

function WorldTravelSubsystem_C:ReceiveInitialize()
  DebugPrint("WorldTravelSubsystem ReceiveInitialize")
  self.ChangeSceneUIPath = UIConst.COMMONCHANGESCENE
  DebugPrint("ChangeSceneUIPath", self.ChangeSceneUIPath)
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnCloseLoading)
end

function WorldTravelSubsystem_C:SetLevelLoadJsonName(DungeonId)
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  if not DungeonInfo or 1 ~= DungeonInfo.IsRandom then
    return
  end
  local DungeonJsonFile = DungeonInfo.DungeonJsonFile
  local File = URuntimeCommonFunctionLibrary.GetRandomFileNameInDic(DungeonJsonFile)
  local PathPart, FilenamePart = UBlueprintPathsLibrary.Split(File)
  local LeftS, RightS = UKismetStringLibrary.Split(PathPart, "Houdini_data/")
  local FileName = RightS .. "/" .. FilenamePart
  UE4.URuntimeCommonFunctionLibrary.SetLevelLoadJsonName(self, FileName)
  self.LevelLoadJsonName = FileName
  DebugPrint("LoadDungeonJson BP_EMGameInstance_C ", UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self))
end

function WorldTravelSubsystem_C:K2_PreChangeScene(WorldType, bQueryHotfix)
  LuaMemoryManager:FullGC(true)
  if 2 == WorldType then
    EventManager:FireEvent(EventID.EnterRegion)
  end
  if 0 == WorldType and GWorld.GameInstance then
    GWorld.GameInstance.IsInSettlementScene = nil
  end
  if bQueryHotfix then
    DebugPrint("WorldTravelSubsystem QueryHotfix")
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:QueryHotfix()
    end
  end
end

function WorldTravelSubsystem_C:OnCloseLoading()
  HeroUSDKSubsystem():UploadTrackLog_Lua("game_level_loading_time", {
    pve_id = self:GetSceneId(),
    loading_time = self:GetLoadingTime()
  })
  self:OnWorldTravelEnd()
end

function WorldTravelSubsystem_C:ReceiveDeinitialize()
  EventManager:RemoveEvent(EventID.CloseLoading, self)
end

return WorldTravelSubsystem_C
