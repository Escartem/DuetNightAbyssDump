local BP_RougeLikeManager_C = Class("BluePrints.Common.TimerMgr")
BP_RougeLikeManager_C._components = {
  "BluePrints.GameMode.RougeLikeComponents.RougeLikeAward",
  "BluePrints.GameMode.RougeLikeComponents.RougeLikeDataUpdate",
  "BluePrints.GameMode.RougeLikeComponents.RougeLikeContractComp"
}
BP_RougeLikeManager_C.AwardRandomType = {Random = 1, Choose = 2}

function BP_RougeLikeManager_C:ReceiveBeginPlay()
  print(_G.LogTag, "BP_RougeLikeManager_C ReceiveBeginPlay")
  self.Avatar = GWorld:GetAvatar()
  if not self.Avatar then
    error("Avatar is nil, cannot get RougeLike info")
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance:SetRougeLikeManager(self)
  GWorld.RougeLikeManager = self
  self.IsLoading = true
  self:RefreshRougeInfo()
  local LevelLoaderClass = LoadClass("/Game/BluePrints/Common/Level/BP_Rougelike_LevelLoader.BP_Rougelike_LevelLoader_C")
  self:GetWorld():SpawnActor(LevelLoaderClass, self:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self, self)
  EventManager:FireEvent(EventID.OnEnterRougeLike)
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnRougeCloseLoading)
  EventManager:AddEvent(EventID.OnGetAwardUIClose, self, self.OnGetAwardUIClose)
  self:OnEnterRoom()
  EventManager:AddEvent(EventID.OnMainCharacterInitReady, self, self.OnMainCharacterInitReady)
  self.StaticCreatorIdToShopId = {}
  self.BackUpAwardList = {}
  self.NeedActivateList = {}
  self.bHandleEventTime = false
end

function BP_RougeLikeManager_C:OnRougeCloseLoading()
  self.IsLoading = false
  if self.UpdateInfo then
    self:OnUpdateAward(self.UpdateInfo)
    self.UpdateInfo = nil
  end
  self:UpdateRougeToken()
  self:ShowEnterRoomToast()
  self:ShowFirstEnterRougeStory()
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local RecoveryCount = Player:GetRecoveryCount()
  local MaxRecoveryCount = Player:GetRecoveryMaxCount()
  if RecoveryCount > MaxRecoveryCount then
    Player:AddTimer(0.1, function()
      local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
      local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
      GameMode:DungeonFinish_OnPlayerRealDead({
        PlayerController.AvatarEidStr
      })
    end)
  end
end

function BP_RougeLikeManager_C:ShowEnterRoomToast()
  UIManager(self):LoadUINew("RougeLikeEnterToastUI", UIConst.ZORDER_FOR_DESKTOP_TEMP):InitEnterToast(self.RoomIndex, self.RoomId, self.SeasonId)
end

function BP_RougeLikeManager_C:UpdateRougeToken()
  local Avatar = GWorld:GetAvatar()
  local RougeToken = Avatar:GetCurrentRougeLikeToken()
  DebugPrint("@zyh \232\191\155\229\133\165\232\130\137\233\184\189\230\151\182\232\180\167\229\184\129\230\149\176\233\135\143", RougeToken)
  self.RougeToken = RougeToken
end

function BP_RougeLikeManager_C:ShowFirstEnterRougeStory()
  if 0 ~= self.StoryId and 1 == self.RoomIndex and 0 == self.PassRooms:Num() then
    self:ShowRougeStoryEvent()
  end
end

function BP_RougeLikeManager_C:OnMainCharacterInitReady()
  self:InitRougeMods()
  self:UpdateContractEffect()
end

function BP_RougeLikeManager_C:OnEnterRoom()
  EventManager:FireEvent(EventID.OnRougeLikeEnterRoom, self.RoomId, self.RandomRooms)
end

function BP_RougeLikeManager_C:AddDeliveryPointInfo(TargetPoint)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local RoomId = tonumber(GameMode.LevelLoader:GetDesignActorLevelName(TargetPoint))
  if self.DeliveryPointInfo == nil then
    self.DeliveryPointInfo = {}
  end
  if self.DeliveryPointInfo[RoomId] == nil then
    self.DeliveryPointInfo[RoomId] = {}
  end
  local PointTransform = TargetPoint:GetTransform()
  table.insert(self.DeliveryPointInfo[RoomId], PointTransform)
end

function BP_RougeLikeManager_C:RemoveDeliveryPointInfo(RoomId)
  self.DeliveryPointInfo[RoomId] = nil
end

function BP_RougeLikeManager_C:GetDeliveryPointInfo(RoomId)
  return self.DeliveryPointInfo[RoomId] or {}
end

function BP_RougeLikeManager_C:AddDeliveryInfo(Delivery, RoomId)
  if self.DeliveryInfo == nil then
    self.DeliveryInfo = {}
  end
  if self.DeliveryInfo[RoomId] == nil then
    self.DeliveryInfo[RoomId] = {}
  end
  table.insert(self.DeliveryInfo[RoomId], Delivery)
end

function BP_RougeLikeManager_C:RemoveDeliveryInfos(RoomId)
  for i, v in pairs(self.DeliveryInfo[RoomId]) do
    v:EMActorDestroy(EDestroyReason.RougeLevelUnloaded)
  end
  self.DeliveryInfo[RoomId] = nil
end

function BP_RougeLikeManager_C:RemoveDataManagerInfos(RoomId, IsLastRoom)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if IsLastRoom then
    local DataManager = GameState.RandomCreatorDataMap:Find(RoomId)
    if DataManager then
      DataManager:UnRegisterData(RoomId)
    end
  end
  GameState.RandomCreatorDataMap:Remove(RoomId)
end

function BP_RougeLikeManager_C:RegisterNextRoomData(NextRoomId)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local DataManager = GameState.RandomCreatorDataMap:Find(NextRoomId)
  if not DataManager then
    return
  end
  DataManager:RegisterData()
end

function BP_RougeLikeManager_C:ClearLastLevelActors(SubLevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local MonsterMap = GameMode.EMGameState.MonsterMap:ToTable()
  for _, Monster in pairs(MonsterMap) do
    if not IsValid(Monster) then
    elseif Monster:IsRealDead() then
    elseif Monster:CheckIsAttachedSummon() then
    elseif GameMode:GetActorLevelName(Monster) ~= SubLevelName then
    else
      Monster:EMActorDestroy(EDestroyReason.RougeLevelUnloaded)
    end
  end
  local CombatItemMap = GameMode.EMGameState.CombatItemMap:ToTable()
  for _, CombatItem in pairs(CombatItemMap) do
    if not IsValid(CombatItem) then
    elseif GameMode:GetActorLevelName(CombatItem) ~= SubLevelName then
    else
      CombatItem:EMActorDestroy(EDestroyReason.RougeLevelUnloaded)
    end
  end
  local NpcMap = GameMode.EMGameState.NpcMap:ToTable()
  for _, Npc in pairs(NpcMap) do
    if not IsValid(Npc) then
    elseif Npc:IsRealDead() then
    elseif GameMode:GetActorLevelName(Npc) ~= SubLevelName then
    else
      Npc:EMActorDestroy(EDestroyReason.RougeLevelUnloaded)
    end
  end
  local MechanismSummonMap = GameMode.EMGameState.MechanismSummonMap:ToTable()
  for _, MechanismSummon in pairs(MechanismSummonMap) do
    if not IsValid(MechanismSummon) then
    elseif MechanismSummon:CheckIsAttachedSummon() then
    elseif GameMode:GetActorLevelName(MechanismSummon) ~= SubLevelName then
    else
      MechanismSummon:EMActorDestroy(EDestroyReason.RougeLevelUnloaded)
    end
  end
end

function BP_RougeLikeManager_C:OnUnLoadLastLevel(LastRoomId, NextRoomId)
  self:RemoveDeliveryInfos(LastRoomId)
  self:RemoveDeliveryPointInfo(LastRoomId)
  self:ClearLastLevelActors(tostring(LastRoomId))
end

function BP_RougeLikeManager_C:OnUnLoadOtherLevel(RoomId)
  self:RemoveDataManagerInfos(RoomId, false)
  self:RemoveDeliveryPointInfo(RoomId)
end

function BP_RougeLikeManager_C:OnPassRoom_Toast()
  local RoomInfo = DataMgr.RougeLikeRoom[self.RoomId]
  local TypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
  if TypeInfo.SuccessText == nil or TypeInfo.SuccessText == "" then
    return
  end
  local LastTime = 1.5
  UIManager(self):LoadUINew("ExploreToastSuccess", GText(TypeInfo.SuccessText), LastTime)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_goal_complete_toast", nil, nil)
end

function BP_RougeLikeManager_C:OnPassRoom_DeliveryPoint()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local DeliveryPoints = self:GetDeliveryPointInfo(self.RoomId)
  if #DeliveryPoints <= 0 then
    return
  end
  local idx = 1
  for i = 1, self.RandomRooms:Length() do
    local Id = self.RandomRooms[i]
    local RoomType = DataMgr.RougeLikeRoom[Id].RoomType
    local DeliveryId = DataMgr.RougeLikeRoomType[RoomType].DeliveryUnitId
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitType = "Mechanism"
    Context.UnitId = DeliveryId
    Context.Loc = DeliveryPoints[idx].Translation
    Context.Rotation = DeliveryPoints[idx].Rotation:ToRotator()
    Context.IntParams:Add("RoomId", Id)
    Context.IntParams:Add("CurrentRoomId", self.RoomId)
    GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
    idx = idx + 1
    if idx > #DeliveryPoints then
      break
    end
  end
end

function BP_RougeLikeManager_C:OnPassRoom(RecoveryFlag)
  if not RecoveryFlag then
    self:OnPassRoom_Toast()
  end
  local LastTime = 1.5
  local RoomInfo = DataMgr.RougeLikeRoom[self.RoomId]
  local TypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
  if TypeInfo.EnableAwardDelay then
    self:AddTimer(1.7, self.OnPassRoom_DeliveryPoint)
  else
    self:OnPassRoom_DeliveryPoint()
  end
  if self.OnPassRoomDelegates and self.OnPassRoomDelegates:IsBound() then
    self.OnPassRoomDelegates:Broadcast()
  end
end

function BP_RougeLikeManager_C:EnterRougeLikeBulletTime(Dilation, Time, Callback)
  UE4.UGameplayStatics.SetGlobalTimeDilation(self, Dilation)
  
  local function _Callback()
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1)
    if Callback then
      Callback()
    end
  end
  
  self:AddTimer(Time, _Callback, false, nil, nil, true)
end

function BP_RougeLikeManager_C:ShowRougeStoryEvent()
  UIManager(self):LoadUINew("Rouge_Event_Main", {
    self.RoomId,
    self.StoryId
  })
end

function BP_RougeLikeManager_C:TriggerRecordProgressData(PassRoomExtraInfo)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player then
    Battle(self):TriggerBattleEvent(BattleEventName.RougeParamSave, Player, self)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:RougeRecordProgressData(PassRoomExtraInfo or {})
end

function BP_RougeLikeManager_C:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, self)
  self.Treasures:Clear()
  self.Blessings:Clear()
  GWorld.RougeLikeManager = nil
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance:SetRougeLikeManager(nil)
end

function BP_RougeLikeManager_C:SpawnRoomShops()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local LevelId = GameMode:GetActorLevelName(Player)
  local Creators = TMap(0, UObject)
  GameMode.EMGameState:GetSubStaticCreatorInfo(LevelId, Creators)
  local ShopCreators = {}
  for _, Creator in pairs(Creators) do
    if Creator.UnitType == "Npc" then
      table.insert(ShopCreators, Creator)
    end
  end
  if #ShopCreators <= 0 then
    return
  end
  table.sort(ShopCreators, function(CreatorA, CreatorB)
    return CreatorA.StaticCreatorId < CreatorB.StaticCreatorId
  end)
  local ShopIds = {}
  for Key, _ in pairs(self.Shop) do
    table.insert(ShopIds, Key)
  end
  if #ShopIds <= 0 then
    return
  end
  table.sort(ShopIds)
  local Val, Res = nil, {}
  local Iter, Tab, Key = ipairs(ShopIds)
  for _, Creator in ipairs(ShopCreators) do
    Key, Val = Iter(Tab, Key)
    if nil == Key then
      break
    end
    table.insert(Res, Creator.StaticCreatorId)
    self.StaticCreatorIdToShopId[Creator.StaticCreatorId] = Val
  end
  local SubGameMode = GameMode.SubGameModeInfo:Find(LevelId)
  if nil ~= SubGameMode then
    SubGameMode:TriggerActiveStaticCreator(Res, "RougeShop", true)
  end
end

function BP_RougeLikeManager_C:HalfWayOut()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExitDungeon()
  end
end

function BP_RougeLikeManager_C:ShowRougeLikeError(Text)
  local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if bDistribution and not bEnableShippingLog then
    return
  end
  local Space = "=========================================================\n"
  Text = Space .. Text .. "\n" .. Space
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SendToFeishuForRougeLike(Text, "\232\130\137\233\184\189\230\138\165\233\148\153")
    return
  end
end

function BP_RougeLikeManager_C:RegisterEventTime()
  self.bHandleEventTime = true
end

function BP_RougeLikeManager_C:UnRegisterEventTime()
  self.bHandleEventTime = false
end

function BP_RougeLikeManager_C:SaveRougeData_Int(Key, Value)
  local Avatar = GWorld:GetAvatar()
  Avatar:SavePlayerSlice({
    Type = Const.RougeSliceInfoType.BlueprintValue,
    Value = {
      Key = Key,
      DataType = "SetInt",
      DataValue = Value
    }
  })
end

function BP_RougeLikeManager_C:SaveRougeData_Float(Key, Value)
  local Avatar = GWorld:GetAvatar()
  Avatar:SavePlayerSlice({
    Type = Const.RougeSliceInfoType.BlueprintValue,
    Value = {
      Key = Key,
      DataType = "SetFloat",
      DataValue = Value
    }
  })
end

function BP_RougeLikeManager_C:FillErrorLog(MsgTable)
  local IsCurRoomClear = self:IsCurRougeLikeRoomClear()
  table.insert(MsgTable, "\229\189\147\229\137\141\230\136\191\233\151\180\230\152\175\229\144\166\233\128\154\229\133\179\239\188\154" .. tostring(IsCurRoomClear) .. "\n")
  table.insert(MsgTable, "\230\152\175\229\144\166\230\173\163\229\156\168\231\173\137\229\190\133DealRewardEvent\239\188\154" .. tostring(self.IsListeningDealRewardEvent) .. "\n")
  table.insert(MsgTable, "EventId: " .. tostring(self.EventId) .. "\n")
  local RandomBlessingsTb = self.RandomBlessings:ToTable()
  table.insert(MsgTable, "\229\190\133\233\128\137\228\184\137\233\128\137\228\184\128\233\154\143\230\156\186\231\165\157\231\166\143\239\188\154" .. table.concat(RandomBlessingsTb, ",") .. "\n")
  local RandomTreasuresTb = self.RandomTreasures:ToTable()
  table.insert(MsgTable, "\229\190\133\233\128\137\228\184\137\233\128\137\228\184\128\233\154\143\230\156\186\229\174\157\231\137\169\239\188\154" .. table.concat(RandomTreasuresTb, ",") .. "\n")
end

AssembleComponents(BP_RougeLikeManager_C)
return BP_RougeLikeManager_C
