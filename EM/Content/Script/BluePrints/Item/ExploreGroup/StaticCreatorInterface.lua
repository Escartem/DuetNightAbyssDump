local Component = {}
local BattleUtils = require("Utils.BattleUtils")
local MiscUtils = require("Utils.MiscUtils")

function Component:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self:InitParam()
  self:AddStaticCreatorInfo()
end

function Component:InitParam()
  self.ChildWorldEids = {}
end

function Component:SetCreatorQuestId_Lua(QuestId)
  self.QuestId = QuestId
end

function Component:AddStaticCreatorInfo()
  if 0 == self.StaticCreatorId then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self:RealAddAddStaticCreatorInfo(GameState)
  if 0 ~= self.FlexibleActiveInactive:Length() then
    EventManager:AddEvent(EventID.TriggerFlexibleActive, self, self.TriggerFlexibleActiveStaticCreator)
  end
end

function Component:RealAddAddStaticCreatorInfo(GameState)
  if self.PrivateEnable then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode:IsInDungeon() and GameMode:GetLevelLoader() then
      local LevelName = GameMode:GetActorLevelName(self)
      GameState:SetPrivateEnableStaticCreatorInfo(LevelName, self)
      return
    end
  end
  local FlexibleRet, IsActive = self:TryGetFlexibleActiveResult()
  GameState.StaticCreatorMap:Add(self.StaticCreatorId, self)
  GameState.StaticCreatorStringNameMap:Add(self.DisplayName, self)
  if false == FlexibleRet and self.AutoActive then
    GameState.AutoActiveStaticIds:AddUnique(self.StaticCreatorId)
  end
  if true == FlexibleRet then
    GameState.FlexibleActiveStaticIds:Add(self.StaticCreatorId, IsActive)
  end
end

function Component:TryGetFlexibleActiveResult()
  if self.UnitType ~= "Npc" and self.RegionDataType ~= ERegionDataType.RDT_None then
    return false, nil
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false, nil
  end
  local TempFlexibleMap = {}
  local FNpcArrayNum = self.FlexibleActiveInactive:Num()
  for FNpcActiveArray, IsActive in pairs(self.FlexibleActiveInactive) do
    local NewFlexibleMapElement = {}
    NewFlexibleMapElement.NpcActiveArray = FNpcActiveArray
    NewFlexibleMapElement.IsActive = IsActive
    TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
    FNpcArrayNum = FNpcArrayNum - 1
  end
  if IsEmptyTable(TempFlexibleMap) then
    return false, nil
  end
  if self.FlexibleActiveInactive:Num() > 0 then
    DebugPrint("NPC_FlexibleActiveDestory ===Start===,StaticCreatorId:", self.StaticCreatorId, "NpcId:", self.UnitId)
  end
  for i = 1, self.FlexibleActiveInactive:Num() do
    local IsActive = TempFlexibleMap[i].IsActive
    local TargetQuestId = TempFlexibleMap[i].NpcActiveArray.Quest.QuestId
    local TargetQuestState = TempFlexibleMap[i].NpcActiveArray.Quest.MyQuestState
    local TargetTalkTriggerId = TempFlexibleMap[i].NpcActiveArray.ImpressionTalk.TalkTriggerId
    local TalkState = TempFlexibleMap[i].NpcActiveArray.ImpressionTalk.TalkQuestState
    local FlexibleQuestChainId = TempFlexibleMap[i].NpcActiveArray.QuestChain.QuestChainId
    local FlexibleQuestChainState = TempFlexibleMap[i].NpcActiveArray.QuestChain.QuestChainState
    if 0 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
      DebugPrint("Flexible Type: Quest")
      local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
      local QuestStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[QuestChainId] then
        DebugPrint("QuestChain is unexist:", QuestChainId)
      else
        local QuestChains = Avatar.QuestChains[QuestChainId]
        if TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
          DebugPrint("IsTrigger: true, QuestId:", QuestChainId, "TargetQuestState:", TargetQuestState, "QuestState: Doing, IsActive:", IsActive)
          return true, IsActive
        elseif TargetQuestState == QuestStateType.Success and QuestChains:CheckQuestIdComplete(TargetQuestId) then
          DebugPrint("IsTrigger: true QuestId:", QuestChainId, "TargetQuestState:", TargetQuestState, "QuestState: Success, IsActive:", IsActive)
          return true, IsActive
        else
          DebugPrint("IsTrigger: false QuestId:", QuestChainId, "TargetQuestState:", TargetQuestState, "QuestState: Error, IsActive:", IsActive)
        end
      end
    elseif 1 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
      DebugPrint("Flexible Type: ImpressionTalk")
      local TalkStateType = {
        Compelete = 0,
        UnCompelete = 1,
        CheckSuccess = 2,
        CheckFail = 3
      }
      if TalkState == TalkStateType.Compelete then
        if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
          DebugPrint("IsTrigger: true, TargetTalkTriggerId:", TargetTalkTriggerId, "TargetTalkState:", TalkState, "TalkState: Complete, IsActive:", IsActive)
          return true, IsActive
        end
      elseif TalkState == TalkStateType.UnCompelete then
        if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
          DebugPrint("IsTrigger: true, TargetTalkTriggerId:", TargetTalkTriggerId, "TargetTalkState:", TalkState, "TalkState: UnComplete, IsActive:", IsActive)
          return true, IsActive
        end
      elseif TalkState == TalkStateType.CheckSuccess then
        if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
          DebugPrint("IsTrigger: true, TargetTalkTriggerId:", TargetTalkTriggerId, "TargetTalkState:", TalkState, "TalkState: Success, IsActive:", IsActive)
          return true, IsActive
        end
      elseif TalkState == TalkStateType.CheckFail then
        if Avatar:IsStorylineFailure(TargetTalkTriggerId) then
          DebugPrint("IsTrigger: true, TargetTalkTriggerId:", TargetTalkTriggerId, "TargetTalkState:", TalkState, "TalkState: Failure, IsActive:", IsActive)
          return true, IsActive
        end
      else
        DebugPrint("IsTrigger: false, TargetTalkTriggerId:", TargetTalkTriggerId, "TargetTalkState:", TalkState, "TalkState: Error, IsActive:", IsActive)
      end
    elseif 2 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
      DebugPrint("Flexible Type: QuestChain")
      local QuestChainStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[FlexibleQuestChainId] then
        DebugPrint("QuestChain is unexist:", FlexibleQuestChainId)
      else
        local TargetQuestChain = Avatar.QuestChains[FlexibleQuestChainId]
        if FlexibleQuestChainState == QuestChainStateType.Doing and Avatar:IsQuestChainDoing(FlexibleQuestChainId) then
          DebugPrint("IsTrigger: true, QuestChainId:", FlexibleQuestChainId, "TargetQuestChainState:", FlexibleQuestChainState, "QuestChainState: Doing, IsActive:", IsActive)
          return true, IsActive
        elseif FlexibleQuestChainState == QuestChainStateType.Success and Avatar:IsQuestChainFinished(FlexibleQuestChainId) then
          DebugPrint("IsTrigger: true, QuestChainId:", FlexibleQuestChainId, "TargetQuestChainState:", FlexibleQuestChainState, "QuestChainState: Finished, IsActive:", IsActive)
          return true, IsActive
        else
          DebugPrint("IsTrigger: false, QuestChainId:", FlexibleQuestChainId, "TargetQuestChainState:", FlexibleQuestChainState, "QuestChainState: Error, IsActive:", IsActive)
        end
      end
    end
  end
  if self.FlexibleActiveInactive:Num() > 0 then
    DebugPrint("NPC_FlexibleActiveDestory ===End===")
  end
  return false, nil
end

function Component:OnRegionDataAllocated_Lua(LuaTableIndex)
  local GameMode = UGameplayStatics.GetGameMode(self)
  local RegionDataSubsys = GameMode:GetRegionDataMgrSubSystem()
  local Context = AEventMgr.CreateUnitContext()
  Context.Creator = self
  RegionDataSubsys:InitRegionDataTable(LuaTableIndex, Context)
end

function Component:ActiveStaticCreator_Lua(EventName)
  if nil ~= EventName and "" ~= EventName then
    self:RealActiveStaticCreator({EventName = EventName})
  else
    self:RealActiveStaticCreator({})
  end
end

function Component:RealActiveStaticCreator(ExtraInfo, bForceSync)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Avatar = GWorld:GetAvatar()
  if not IsValid(GameMode) then
    return
  end
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = self.UnitType
  Context.UnitId = self.UnitId
  Context.Loc = self:K2_GetActorLocation()
  Context.Rotation = self:K2_GetActorRotation()
  Context.Creator = self
  Context.BoolParams:Add("IsFullRegionStore", self.IsFullRegionStore)
  Context.NameParams:Add("WorldRegionEid", self.LastWorldRegionEid)
  if nil ~= ExtraInfo then
    if ExtraInfo.EventName then
      Context.StrParams:Add("EventName", ExtraInfo.EventName)
    end
    if ExtraInfo.DungeonState then
      Context:AddLuaTable("DungeonState", ExtraInfo.DungeonState)
    end
    Context:AddLuaTable("ExtraInfo", ExtraInfo)
  end
  if not self.IsFullRegionStore and self:IsActorNeedFullRegionStore(self.UnitType, self.UnitId) then
    GWorld.logger.error("\233\156\128\232\166\129\229\139\190\233\128\137\229\133\168\229\140\186\229\159\159\229\173\152\229\130\168\231\154\132Actor\230\178\161\230\156\137\229\139\190\233\128\137 " .. "UnitType = " .. Context.UnitType .. "; UnitId = " .. Context.UnitId .. "; StaticCreatorId = " .. self.StaticCreatorId .. "; Map = " .. self:GetWorld():GetName())
  end
  self:FillCreateUnitContext(Context, ExtraInfo)
  DebugPrint("RealActiveStaticCreator UnitType", self.UnitType, "UnitId", self.UnitId, "CreatorId", self.StaticCreatorId)
  if self.bSyncCreateMonsterOnActive and Context.UnitType == "Monster" then
    GameMode.EMGameState.EventMgr:CreateUnitNew(Context, true)
  elseif Context.UnitType == "Mechanism" then
    local Data = DataMgr.Mechanism[self.UnitId]
    if Data and (Data.UnitRealType == "AOITriggerBox" or Data.UnitRealType == "AOITriggerSphere") then
      GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
    else
      GameMode.EMGameState.EventMgr:CreateUnitNew(Context, bForceSync)
    end
  else
    GameMode.EMGameState.EventMgr:CreateUnitNew(Context, bForceSync)
  end
end

function Component:FillCreateUnitContext(Context, ExtraInfo)
  Context.IntParams:Add("Level", self:GetUnitLevel())
  Context:AddObjectParams("BTObject", self.BornChangeBT)
  if self.UnitType == "Phantom" then
    if ExtraInfo then
      if ExtraInfo.Camp then
        Context.NameParams:Add("Camp", ExtraInfo.Camp)
      end
      if ExtraInfo.PhantomOwnerEid then
        Context.IntParams:Add("PhantomOwnerEid", ExtraInfo.PhantomOwnerEid)
      end
      if ExtraInfo.FixLocation then
        Context.BoolParams:Add("FixLocation", ExtraInfo.FixLocation)
      end
      if ExtraInfo.FixLocationZ then
        Context.IntParams:Add("FixLocationZ", ExtraInfo.FixLocationZ)
      end
    else
      ExtraInfo = BattleUtils.GetExtraCreateInfo("Phantom", self.UnitId, self.UnitId)
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      Context.NameParams:Add("Camp", "Player")
      Context.IntParams:Add("PhantomOwnerEid", Player.Eid)
      Context.BoolParams:Add("FixLocation", true)
      Context.IntParams:Add("FixLocationZ", 0)
    end
    Context.IntParams:Add("AvatarQuestRoleID", -1)
    if ExtraInfo.IsHostage then
      Context.BoolParams:Add("IsHostage", ExtraInfo.IsHostage)
    end
    if ExtraInfo.BTIndex then
      Context.IntParams:Add("BTIndex", ExtraInfo.BTIndex - 1)
    end
  end
end

function Component:IsActorNeedFullRegionStore(UnitType, UnitId)
  if DataMgr[UnitType] and DataMgr[UnitType][UnitId] then
    local UnitRealType = DataMgr[UnitType][UnitId].UnitRealType
    return "TeleportMechanism" == UnitRealType
  end
end

function Component:DestoryOneStaticActor(DeathReason, DestroyReason)
  return self:DestoryOneStaticActor_Lua(DeathReason, DestroyReason)
end

function Component:DestoryOneStaticActor_Lua(DeathReason, DestroyReason)
  local Avatar = GWorld:GetAvatar()
  DeathReason = DeathReason or EDeathReason.Disable
  local NeedUpdateRegionData = false
  local Eids = self.ChildEids:ToTable()
  for _, Eid in pairs(Eids) do
    local Info = Battle(self):GetEntity(Eid)
    if IsValid(Info) then
      DebugPrint("DestoryOneStaticActor ", Info:GetName(), Info.Eid, Info.UnitType, EDestroyReason:GetNameByValue(DestroyReason), EDeathReason:GetNameByValue(DeathReason))
      if Info.IsAIControlled and Info:IsAIControlled() then
        if DeathReason ~= EDeathReason.Disable then
          Battle(self):BattleOnDead(Info.Eid, Info.Eid, 0, DeathReason)
        else
          Info:EMActorDestroy(DestroyReason)
        end
      else
        Info:EMActorDestroy(DestroyReason)
      end
      return
    else
      NeedUpdateRegionData = true
    end
  end
  if (NeedUpdateRegionData or 0 == #Eids and self.CreatedWorldRegionEid) and URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    local RegionDataMgr = UE4.UGameplayStatics.GetGameMode(self):GetRegionDataMgrSubSystem()
    RegionDataMgr:DestroyRegionEntity(self.CreatedWorldRegionEid, DestroyReason)
  end
end

function Component:DestoryOneStaticActorAll(DeathReason, DestroyReason)
  return self:DestoryOneStaticActor_Lua(DeathReason, DestroyReason)
end

function Component:DestoryOneStaticActorAll_Lua(DeathReason, DestroyReason)
  local Avatar = GWorld:GetAvatar()
  DeathReason = DeathReason or EDeathReason.Disable
  local Eids = self.ChildEids:ToTable()
  for _, Eid in pairs(Eids) do
    local Info = Battle(self):GetEntity(Eid)
    if IsValid(Info) then
      DebugPrint("DestoryOneStaticActorAll ", Info:GetName(), Info.Eid, Info.UnitType, EDestroyReason:GetNameByValue(DestroyReason), EDeathReason:GetNameByValue(DeathReason))
      if Info.IsAIControlled and Info:IsAIControlled() then
        if DeathReason ~= EDeathReason.Disable then
          Battle(self):BattleOnDead(Info.Eid, Info.Eid, 0, DeathReason)
        else
          Info:EMActorDestroy(DestroyReason)
        end
      else
        Info:EMActorDestroy(DestroyReason)
      end
    end
  end
end

function Component:DestoryOneStaticActorWithData_Lua(LevelName, DeathReason, DestroyReason)
  DeathReason = DeathReason or EDeathReason.Disable
  local Eids = self.ChildEids:ToTable()
  for _, Eid in pairs(Eids) do
    local Info = Battle(self):GetEntity(Eid)
    if IsValid(Info) then
      DebugPrint("DestoryOneStaticActorWithData  CreatorId", self.StaticCreatorId, " By Actor", Info:GetName(), Info.Eid, Info.UnitType, EDestroyReason:GetNameByValue(DestroyReason), EDeathReason:GetNameByValue(DeathReason))
      if DeathReason ~= EDeathReason.Disable then
        Battle(self):BattleOnDead(Info.Eid, Info.Eid, 0, DeathReason)
      else
        Info:EMActorDestroy(DestroyReason)
      end
    else
      DebugPrint("DestoryOneStaticActorWithData  CreatorId", self.StaticCreatorId, " By SnapShotData", LevelName, Eid)
      MiscUtils.GameMode(self):RemoveSnapShot(LevelName, Eid)
    end
  end
end

function Component:RegionDestroyAllExploreGroupData(bNormalDead, DeathReason, DestroyReason, DeleteClientRegionData)
  local Eids = self.ChildEids:ToTable()
  for _, Eid in pairs(Eids) do
    local Info = Battle(self):GetEntity(Eid)
    if IsValid(Info) then
      if Info.IsAIControlled and Info:IsAIControlled() then
        if bNormalDead then
          Battle(self):BattleOnDead(Info.Eid, Info.Eid, 0, DeathReason)
        else
          Info:EMActorDestroy(DestroyReason)
        end
      else
        Info:EMActorDestroy(DestroyReason)
      end
    end
  end
  if DeleteClientRegionData then
    self:ResetRarelyStaticCreatorClient()
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetRegionDataMgrSubSystem():DestroyRegionEntity(self.CreatedWorldRegionEid, DestroyReason)
  GameMode:GetRegionDataMgrSubSystem():RemoveCretorIdContollerByCacheNew(self.StaticCreatorId)
  GameMode.EMGameState.EventMgr:RemoveUnitInQueue(self.CreatedWorldRegionEid, DestroyReason)
end

function Component:IsAOITriggerBox()
  if not DataMgr[self.UnitType] or not DataMgr[self.UnitType][self.UnitId] then
    return false
  end
  local RealUnitType = DataMgr[self.UnitType][self.UnitId].UnitRealType
  return "AOITriggerBox" == RealUnitType or "AOITriggerSphere" == RealUnitType or "AOITriggerSpecialQuest" == RealUnitType or "AOITriggerCapsule" == RealUnitType
end

function Component:GetUnitLevel()
  return self:GetUnitLevel_Lua()
end

function Component:GetUnitLevel_Lua()
  if self.LevelAdaptDisable and UE4.UGameplayStatics.GetGameMode(self):IsInRegion() then
    return math.max(1, self.Level)
  else
    local MonsterCurLevel = self.Level + UE4.UGameplayStatics.GetGameMode(self):GetFixedGamemodeLevel()
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and GameMode:IsEndlessDungeon() then
      local MonsterMaxLevel = DataMgr.GlobalConstant.MonsterLevelUpperLimit.ConstantValue
      return math.min(MonsterMaxLevel, MonsterCurLevel)
    else
      return MonsterCurLevel
    end
  end
end

function Component:SetNpcShowHide(QuestId)
  return self:SetNpcShowHide_Lua(QuestId)
end

function Component:SetNpcShowHideByFlexible_Lua(Unit)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TempFlexibleMap = {}
  local FNpcArrayNum = self.FlexibleShowHide:Num()
  for FNpcArray, IsHide in pairs(self.FlexibleShowHide) do
    local NewFlexibleMapElement = {
      NpcArray = {Quest = nil, ImpressionTalk = nil},
      IsHide = false
    }
    NewFlexibleMapElement.NpcArray = FNpcArray
    NewFlexibleMapElement.IsHide = IsHide
    TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
    FNpcArrayNum = FNpcArrayNum - 1
  end
  
  local function SetNpcShowOrHide(IsShow)
    if IsShow then
      Unit:SetActorHideTag("Flexible", false)
      Unit:SetActorNoCollisionTag(false, "Flexible")
      Unit:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR, false)
    else
      Unit:SetActorHideTag("Flexible", true)
      Unit:SetActorNoCollisionTag(true, "Flexible")
      Unit:RemoveTickEnabledSet(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR)
    end
  end
  
  for i = 1, self.FlexibleShowHide:Num() do
    local TargetQuestId = TempFlexibleMap[i].NpcArray.Quest.QuestId
    local TargetQuestState = TempFlexibleMap[i].NpcArray.Quest.MyQuestState
    local TargetTalkTriggerId = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkTriggerId
    local TalkState = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkQuestState
    local FlexibleQuestChainId = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainId
    local FlexibleQuestChainState = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainState
    if 0 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
      local QuestStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[QuestChainId] then
        DebugPrint("QuestChain is unexist:", QuestChainId)
      else
        local QuestChains = Avatar.QuestChains[QuestChainId]
        if TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        elseif TargetQuestState == QuestStateType.Success then
          if QuestChains:CheckQuestIdComplete(TargetQuestId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          end
        else
          DebugPrint("QuestChain state is error:", QuestChainId)
        end
      end
    elseif 1 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local TalkStateType = {
        Compelete = 0,
        UnCompelete = 1,
        CheckSuccess = 2,
        CheckFail = 3
      }
      if TalkState == TalkStateType.Compelete then
        if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      elseif TalkState == TalkStateType.UnCompelete then
        if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      elseif TalkState == TalkStateType.CheckSuccess then
        if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      else
        if TalkState == TalkStateType.CheckFail and Avatar:IsStorylineFailure(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        else
        end
      end
    elseif 2 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[FlexibleQuestChainId] then
        DebugPrint("QuestChain is unexist:", FlexibleQuestChainId)
      else
        local TargetQuestChain = Avatar.QuestChains[FlexibleQuestChainId]
        if FlexibleQuestChainState == QuestChainStateType.Doing and TargetQuestChain:IsDoing() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        elseif FlexibleQuestChainState == QuestChainStateType.Success and TargetQuestChain:IsFinish() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        else
          DebugPrint("QuestChain state is error:", FlexibleQuestChainId)
        end
      end
    end
  end
end

function Component:SetNpcFlexibShowOrHideDynamic_Lua(FlexibType, TargetId)
  if self.UnitType ~= "Npc" then
    return
  end
  
  local function ShowHideByFlexibleByQuestDynamic(Unit)
    local TempFlexibleMap = {}
    local FNpcArrayNum = self.FlexibleShowHide:Num()
    for FNpcArray, IsHide in pairs(self.FlexibleShowHide) do
      local NewFlexibleMapElement = {
        NpcArray = {Quest = nil, ImpressionTalk = nil},
        IsHide = false
      }
      NewFlexibleMapElement.NpcArray = FNpcArray
      NewFlexibleMapElement.IsHide = IsHide
      TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
      FNpcArrayNum = FNpcArrayNum - 1
    end
    
    local function SetNpcShowOrHide(IsShow)
      if IsShow then
        Unit:SetActorHideTag("Flexible", false)
        Unit:SetActorNoCollisionTag(false, "Flexible")
        Unit:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR, false)
      else
        Unit:SetActorHideTag("Flexible", true)
        Unit:SetActorNoCollisionTag(true, "Flexible")
        Unit:RemoveTickEnabledSet(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR)
      end
    end
    
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    for i = 1, self.FlexibleShowHide:Num() do
      local TargetQuestId = TempFlexibleMap[i].NpcArray.Quest.QuestId
      local TargetQuestState = TempFlexibleMap[i].NpcArray.Quest.MyQuestState
      if 0 == TempFlexibleMap[i].NpcArray.EditableStructType then
        local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
        local QuestStateType = {Doing = 1, Success = 2}
        if not Avatar.QuestChains[QuestChainId] then
          DebugPrint("QuestChain is unexist:", QuestChainId)
        else
          local QuestChains = Avatar.QuestChains[QuestChainId]
          local IsQuestSucc = false
          if QuestChains:CheckQuestIdComplete(TargetId) then
            IsQuestSucc = true
          end
          if TargetQuestState == QuestStateType.Success and TargetId == TargetQuestId and IsQuestSucc then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          elseif TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          else
            DebugPrint("QuestChain state is error:", QuestChainId)
          end
        end
      end
    end
  end
  
  local function ShowHideByFlexibleByImpressionDynamic(Unit)
    local TempFlexibleMap = {}
    local FNpcArrayNum = self.FlexibleShowHide:Num()
    for FNpcArray, IsHide in pairs(self.FlexibleShowHide) do
      local NewFlexibleMapElement = {
        NpcArray = {Quest = nil, ImpressionTalk = nil},
        IsHide = false
      }
      NewFlexibleMapElement.NpcArray = FNpcArray
      NewFlexibleMapElement.IsHide = IsHide
      TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
      FNpcArrayNum = FNpcArrayNum - 1
    end
    
    local function SetNpcShowOrHide(IsShow)
      if IsShow then
        Unit:SetActorHideTag("Flexible", false)
        Unit:SetActorNoCollisionTag(false, "Flexible")
        Unit:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR, false)
      else
        Unit:SetActorHideTag("Flexible", true)
        Unit:SetActorNoCollisionTag(true, "Flexible")
        Unit:RemoveTickEnabledSet(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR)
      end
    end
    
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    for i = 1, self.FlexibleShowHide:Num() do
      local TargetTalkTriggerId = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkTriggerId
      local TalkState = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkQuestState
      if 1 == TempFlexibleMap[i].NpcArray.EditableStructType then
        local TalkStateType = {
          Compelete = 0,
          UnCompelete = 1,
          CheckSuccess = 2,
          CheckFail = 3
        }
        if TalkState == TalkStateType.Compelete then
          if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          end
        elseif TalkState == TalkStateType.UnCompelete then
          if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          end
        elseif TalkState == TalkStateType.CheckSuccess then
          if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          end
        else
          if TalkState == TalkStateType.CheckFail and Avatar:IsStorylineFailure(TargetTalkTriggerId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          else
          end
        end
      end
    end
  end
  
  local function ShowHideByFlexibleByQuestChainDynamic(Unit)
    local TempFlexibleMap = {}
    local FNpcArrayNum = self.FlexibleShowHide:Num()
    for FNpcArray, IsHide in pairs(self.FlexibleShowHide) do
      local NewFlexibleMapElement = {
        NpcArray = {
          Quest = nil,
          ImpressionTalk = nil,
          QuestChain = nil
        },
        IsHide = false
      }
      NewFlexibleMapElement.NpcArray = FNpcArray
      NewFlexibleMapElement.IsHide = IsHide
      TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
      FNpcArrayNum = FNpcArrayNum - 1
    end
    
    local function SetNpcShowOrHide(IsShow)
      if IsShow then
        Unit:SetActorHideTag("Flexible", false)
        Unit:SetActorNoCollisionTag(false, "Flexible")
        Unit:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR, false)
      else
        Unit:SetActorHideTag("Flexible", true)
        Unit:SetActorNoCollisionTag(true, "Flexible")
        Unit:RemoveTickEnabledSet(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR)
      end
    end
    
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    for i = 1, self.FlexibleShowHide:Num() do
      local FlexibleQuestChainId = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainId
      local FlexibleQuestChainState = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainState
      local QuestChainStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[FlexibleQuestChainId] then
        DebugPrint("QuestChain is unexist:", FlexibleQuestChainId)
      else
        local TargetQuestChain = Avatar.QuestChains[FlexibleQuestChainId]
        if FlexibleQuestChainState == QuestChainStateType.Doing and TargetQuestChain:IsDoing() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        elseif FlexibleQuestChainState == QuestChainStateType.Success and TargetQuestChain:IsFinish() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        else
          DebugPrint("QuestChain state is error:", FlexibleQuestChainId)
        end
      end
    end
  end
  
  if "Quest" == FlexibType then
    for k, _ in pairs(self.FlexibleShowHide) do
      if k.Quest.QuestId == TargetId then
        for i = 1, self.ChildEids:Length() do
          local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
          if IsValid(Info) then
            ShowHideByFlexibleByQuestDynamic(Info)
          end
        end
      end
    end
  elseif "Impression" == FlexibType then
    for k, _ in pairs(self.FlexibleShowHide) do
      local id = k.ImpressionTalk.TalkTriggerId
      if k.ImpressionTalk.TalkTriggerId == TargetId then
        for i = 1, self.ChildEids:Length() do
          local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
          if IsValid(Info) then
            ShowHideByFlexibleByImpressionDynamic(Info)
          end
        end
      end
    end
  elseif "QuestChain" == FlexibType then
    for k, _ in pairs(self.FlexibleShowHide) do
      local id = k.QuestChain.QuestChainId
      if k.QuestChain.QuestChainId == TargetId then
        for i = 1, self.ChildEids:Length() do
          local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
          if IsValid(Info) then
            ShowHideByFlexibleByQuestChainDynamic(Info)
          end
        end
      end
    end
  end
end

function Component:SetNpcShowHide_Lua(QuestId)
  if self.UnitType ~= "Npc" then
    return
  end
  local QuestId = QuestId
  local ExistQuest = false
  local OldState
  local Avatar = GWorld:GetAvatar()
  local Quest = Avatar:GetQuestById(QuestId)
  local IsDoing = Quest:IsDoing()
  for key, value in pairs(self.FlexibleShowHide) do
    if key.QuestId == QuestId and 1 == key.MyQuestState and IsDoing then
      ExistQuest = true
      local state = value
      for i = 1, self.ChildEids:Length() do
        local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
        if IsValid(Info) then
          if true == state then
            Info:K2_GetRootComponent():SetVisibility(true, true)
            Info.NpcTalkInteractiveComponent:GetNpcFlexibleShowHide("Show")
            return
          else
            Info:K2_GetRootComponent():SetVisibility(false, true)
            Info.NpcTalkInteractiveComponent:GetNpcFlexibleShowHide("Hide")
            return
          end
        end
      end
    end
  end
  if false == ExistQuest then
    for key, value in pairs(self.FlexibleShowHide) do
      local Quest = Avatar:GetQuestById(key.QuestId)
      local IsSuccess = Quest:IsSuccess()
      if 2 == key.MyQuestState and IsSuccess then
        OldState = value
      end
    end
    if nil == OldState then
      OldState = self.DefaultShowEnable
    else
      for i = 1, self.ChildEids:Length() do
        local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
        if IsValid(Info) then
          if OldState then
            Info:K2_GetRootComponent():SetVisibility(true, true)
            Info.NpcTalkInteractiveComponent:GetNpcFlexibleShowHide("Show")
            return
          else
            Info:K2_GetRootComponent():SetVisibility(false, true)
            Info.NpcTalkInteractiveComponent:GetNpcFlexibleShowHide("Hide")
            return
          end
        end
      end
    end
  end
end

function Component:TriggerFlexibleActiveStaticCreator()
  local FlexibleRet, IsActive = self:TryGetFlexibleActiveResult()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState and true == FlexibleRet then
    if GameState.FlexibleActiveStaticIds:Find(self.StaticCreatorId) and IsActive then
      return
    end
    if GameState.FlexibleActiveStaticIds:Find(self.StaticCreatorId) then
      GameState.FlexibleActiveStaticIds:Remove(self.StaticCreatorId)
      GameState.FlexibleActiveStaticIds:Add(self.StaticCreatorId, IsActive)
    else
      GameState.FlexibleActiveStaticIds:Add(self.StaticCreatorId, IsActive)
    end
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and FlexibleRet and IsActive then
    local TempArray = TArray(0)
    TempArray:Add(self.StaticCreatorId)
    GameMode:TriggerActiveStaticCreator(TempArray, "FlexibleActiveInactive")
  elseif GameMode and FlexibleRet and not IsActive then
    for _, NpcChar in pairs(GameState.NpcMap) do
      if NpcChar.UnitId == self.UnitId and NpcChar.CreatorId and NpcChar.CreatorId == self.StaticCreatorId then
        NpcChar:EMActorDestroy(EDestroyReason.Flexible)
      end
    end
  end
end

function Component:SetStaticActorsLoc(Loc, bSweep, SweepHitResult, bTeleport)
  return self:SetStaticActorsLoc_Lua(Loc, bSweep, SweepHitResult, bTeleport)
end

function Component:SetStaticActorsLoc_Lua(Loc, bSweep, SweepHitResult, bTeleport)
  for i = 1, self.ChildEids:Length() do
    local Info = Battle(self):GetEntity(self.ChildEids:GetRef(i))
    if IsValid(Info) then
      Info:K2_SetActorLocation(Loc, bSweep, SweepHitResult, bTeleport)
    end
  end
end

function Component:GetActorToChildEids()
  return self.ChildEids
end

function Component:AddSerializedEid(Eid)
  self:AddSerializedEid_Lua(Eid)
end

function Component:AddSerializedEid_Lua(Eid)
  self.ChildEids:AddUnique(Eid)
end

function Component:RemoveActorToChildEids(Eid)
  return self:RemoveActorToChildEids_Lua(Eid)
end

function Component:RemoveActorToChildEids_Lua(Eid)
  self.ChildEids:RemoveItem(Eid)
end

function Component:SetUpParameters(Unit)
  if 0 ~= self.FlexibleShowHide:Length() then
    EventManager:AddEvent(EventID.SetNpcShowHide, self, self.SetNpcShowHide)
    EventManager:AddEvent(EventID.SetNpcFlexibShowOrHideDynamic, self, self.SetNpcFlexibShowOrHideDynamic_Lua)
  end
  if Const.IsOpenNpcInitOpt == false and false == self.DefaultShowEnable and IsValid(Unit) then
    Unit:SetActorHideTag("Flexible", true)
    Unit:SetActorNoCollisionTag(true, "Flexible")
    Unit:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_ACTOR, false)
  end
  self:SetNpcShowHideByFlexible_Lua(Unit)
end

function Component:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.SetNpcShowHide, self)
  EventManager:RemoveEvent(EventID.SetNpcFlexibShowOrHideDynamic, self)
  EventManager:RemoveEvent(EventID.TriggerFlexibleActive, self)
  self:RemoveStaticCreatorInfo()
end

function Component:RemoveStaticCreatorInfo()
  if 0 == self.StaticCreatorId then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if self.PrivateEnable then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode:IsInDungeon() and GameMode:GetLevelLoader() then
      local LevelName = GameMode:GetActorLevelName(self)
      GameState:RemovePrivateEnableStaticCreatorInfo(LevelName, self)
      return
    end
  end
  GameState.StaticCreatorMap:Remove(self.StaticCreatorId)
  GameState.StaticCreatorStringNameMap:Remove(self.DisplayName)
  if self.AutoActive then
    GameState.AutoActiveStaticIds:Remove(self.StaticCreatorId)
  end
end

function Component:ResetRarelyStaticCreator(PrivateEnable, EventName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetRegionDataMgrSubSystem():ResetRarelyStaticCreator(self.StaticCreatorId, PrivateEnable, EventName)
end

function Component:ResetRarelyStaticCreatorClient()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetRegionDataMgrSubSystem():ResetRarelyStaticCreatorClient(self.CreatedWorldRegionEid)
end

function Component:PrintActorDebugInfo_Lua()
  local Eids = self.ChildEids:ToTable()
  local Battle = Battle(self)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not Battle or not GameMode then
    return
  end
  GWorld.logger.debug("------ Print Creator Active Actor Debug Info --------")
  local WorldRegionEids = self.ChildSerializedWorldRegionEids:ToTable()
  for _, WorldRegionEid in ipairs(WorldRegionEids) do
    local SSData = GameMode:GetRegionDataMgrSubSystem().DataLibrary.WorldRegionEid2SSData[WorldRegionEid]
    if SSData then
      PrintTable(SSData)
    end
  end
  GWorld.logger.debug("------ Print Creator Active Actor Debug Info END--------")
end

function Component:GetDropNameByUnitType()
  if self.UnitType ~= "Drop" then
    error("UnitType is not Drop")
  end
  local Drop = DataMgr.Drop[self.UnitId]
  return GText(Drop.DropName)
end

function Component:CheckUnitIsDeadInRegion()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode:IsInRegion() then
    return false
  end
  local WorldRegionEid = self.CreatedWorldRegionEid == "None" and self.ChildSerializedWorldRegionEids:Get(1) or self.CreatedWorldRegionEid
  if not WorldRegionEid or "None" == WorldRegionEid then
    return false
  end
  return GameMode:GetRegionDataMgrSubSystem():CheckUnitIsDeadByWorldRegionEid(WorldRegionEid)
end

return Component
