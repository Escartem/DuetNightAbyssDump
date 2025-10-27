require("UnLua")
local BP_SynthesisComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_SynthesisComponent_C:InitSynthesisComponent()
  self.GameMode = self:GetOwner()
  self.IconPathYellow = "MainMission"
  self.IconPathRed = "DefeatMission"
  self.IconPathSpecialEnemy = "SpecialEnemy"
  self.TextTitle = "DUNGEON_SYNTHESIS_100"
  local SynthesisInfo = DataMgr.Synthesis[self.GameMode.DungeonId]
  if not SynthesisInfo then
    GameState(self):ShowDungeonError("SynthesisComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonAddRage = SynthesisInfo.MonAddRage or 1
  self.BreakableAddRage = SynthesisInfo.BreakableAddRage or 0.1
  self.MechanismAddRageMap = SynthesisInfo.MechanismAddRageMap or {}
  self.RageValueStages = SynthesisInfo.RageValueStages or {100}
  self.MaxRageValue = self.RageValueStages[#self.RageValueStages]
  self.SupervisorCreatorIds = SynthesisInfo.SupervisorCreatorIds or {}
  self.OccupationTargetNum = SynthesisInfo.OccupationTargetNum or 7
  self.BlastMonInterval = SynthesisInfo.BlastMonInterval or 60
  self.KeyNeedNum = SynthesisInfo.KeyNeedNum or 6
  self.CurMission = ""
  DebugPrint("SynthesisComponent: InitSynthesisComponent")
end

function BP_SynthesisComponent_C:InitSynthesisBaseInfo()
  self.GameMode:AddDungeonEvent("SynthesisBuffList")
end

function BP_SynthesisComponent_C:TriggerSynthesisOnEnd()
  self.GameMode:RemoveDungeonEvent("SynthesisBuffList")
end

function BP_SynthesisComponent_C:OnUnitDeadEvent(MonsterCharacter)
  local OnDeadfuncName = "OnUnitDeadEvent_" .. self.CurMission
  if self[OnDeadfuncName] then
    self[OnDeadfuncName](self, MonsterCharacter)
  end
end

function BP_SynthesisComponent_C:OnCombatPropDeadEvent(CombatProp)
  local OnSpawnfuncName = "OnCombatPropDeadEvent_" .. self.CurMission
  if self[OnSpawnfuncName] then
    self[OnSpawnfuncName](self, CombatProp)
  end
end

function BP_SynthesisComponent_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  local OnStaticCreatorfuncName = "OnStaticCreatorEvent_" .. self.CurMission
  if self[OnStaticCreatorfuncName] then
    self[OnStaticCreatorfuncName](self, EventName, Eid, UnitId, UnitType)
  end
end

function BP_SynthesisComponent_C:OnMonsterGuideAdded(Eid)
  local OnGuidefuncName = "OnMonsterGuideAdded_" .. self.CurMission
  if self[OnGuidefuncName] then
    self[OnGuidefuncName](self, Eid)
  end
end

function BP_SynthesisComponent_C:OnDefenceCoreActive(DefenceCore)
  local OnDefenceCoreActivefuncName = "OnDefenceCoreActive_" .. self.CurMission
  if self[OnDefenceCoreActivefuncName] then
    self[OnDefenceCoreActivefuncName](self, DefenceCore)
  end
end

function BP_SynthesisComponent_C:SetMission(NewMission)
  local InitfuncName = "Init" .. NewMission .. "Mission"
  if not self[InitfuncName] then
    GameState(self):ShowDungeonError("SynthesisComponent:SetMission \228\188\160\229\133\165\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\229\144\141\239\188\129\232\175\183\230\163\128\230\159\165 " .. self.GameMode.DungeonId .. " \228\188\160\229\133\165\228\187\187\229\138\161\229\144\141: ", NewMission)
    return
  end
  self.CurMission = NewMission
  self[InitfuncName](self)
  DebugPrint("SynthesisComponent: SetMission", self.CurMission)
end

function BP_SynthesisComponent_C:GetDungeonJsonAttr()
  local LevelLoader = self.GameMode:GetLevelLoader()
  if not LevelLoader then
    return {}
  end
  return LevelLoader.attr or {}
end

function BP_SynthesisComponent_C:InitDestructionMission()
  self:SetRageValue(0)
  self.CurRageStage = 0
  self.SupervisorInfo = {}
  self.SupervisorDeadCount = 0
  self.SupervisorGuideNum = 0
  self:InitCreatorIdToLevelNameMap()
  for _, CreatorId in pairs(self.SupervisorCreatorIds) do
    local LevelName = self.CreatorIdToLevelName[CreatorId]
    local SubGameMode = self.GameMode.SubGameModeInfo:FindRef(LevelName)
    if IsValid(SubGameMode) then
      local CreatorIdArray = TArray(0)
      CreatorIdArray:Add(CreatorId)
      SubGameMode:TriggerActiveStaticCreator(CreatorIdArray, "DestructionSupervisor", true)
    else
      GameState(self):ShowDungeonError("SynthesisComponent:\229\136\183\230\150\176\228\184\187\231\174\161\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174  CreatorId: " .. tostring(CreatorId) .. "LevelName: " .. tostring(LevelName))
    end
  end
  self.GameMode:NotifyClientShowDungeonTaskNew("", self.TextTitle, "DUNGEON_SYNTHESIS_113")
  self.GameMode:AddDungeonEvent("SynthesisDestruction")
end

function BP_SynthesisComponent_C:InitCreatorIdToLevelNameMap()
  local DungeonJsonAttr = self:GetDungeonJsonAttr()
  self.CreatorIdToLevelName = {}
  for _, Info in pairs(DungeonJsonAttr) do
    for k, _ in pairs(Info) do
      local CreatorIdStr = string.split(k, "_")[1]
      self.CreatorIdToLevelName[tonumber(CreatorIdStr)] = tostring(Info[CreatorIdStr .. "_id"])
      break
    end
  end
end

function BP_SynthesisComponent_C:OnUnitDeadEvent_Destruction(MonsterCharacter)
  if not IsValid(MonsterCharacter) then
    return
  end
  DebugPrint("SynthesisComponent: MonsterDeadAddRage", self.MonAddRage)
  self:AddRageValue(self.MonAddRage)
  if self.SupervisorInfo[MonsterCharacter.Eid] and self.SupervisorInfo[MonsterCharacter.Eid].IsAlive then
    DebugPrint("SynthesisComponent: SupervisorDead", MonsterCharacter.Eid)
    self.SupervisorInfo[MonsterCharacter.Eid].IsAlive = false
    self.SupervisorDeadCount = self.SupervisorDeadCount + 1
    self.GameMode.EMGameState.DeadSupervisorEids:Add(MonsterCharacter.Eid)
    self.GameMode.EMGameState:MarkDeadSupervisorEidsAsDirtyData()
    if self.SupervisorDeadCount >= #self.SupervisorCreatorIds then
      DebugPrint("SynthesisComponent: \230\137\128\230\156\137\228\184\187\231\174\161\230\173\187\228\186\161")
      self.GameMode:RemoveDungeonEvent("SynthesisDestruction")
      self.GameMode:TriggerGameModeEvent("Event_OnAllSupervisorDead")
      self.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_103", 2, EToastType.Success)
    end
  end
end

function BP_SynthesisComponent_C:OnCombatPropDeadEvent_Destruction(CombatProp)
  if not IsValid(CombatProp) then
    return
  end
  local AddValue = 0
  if CombatProp:Cast(ABreakableItem) then
    AddValue = self.BreakableAddRage
  elseif self.MechanismAddRageMap[CombatProp.UnitId] then
    AddValue = self.MechanismAddRageMap[CombatProp.UnitId]
  end
  if 0 == AddValue then
    return
  end
  DebugPrint("SynthesisComponent: CombatPropDeadAddRage", AddValue)
  self:AddRageValue(AddValue)
end

function BP_SynthesisComponent_C:OnStaticCreatorEvent_Destruction(EventName, Eid, UnitId, UnitType)
  if "DestructionSupervisor" == EventName then
    self.SupervisorInfo[Eid] = {}
    self.SupervisorInfo[Eid].IsAlive = true
  end
end

function BP_SynthesisComponent_C:OnMonsterGuideAdded_Destruction(Eid)
  if self.SupervisorInfo[Eid] == nil then
    return
  end
  if self.SupervisorInfo[Eid].IsGuide then
    return
  end
  self.CurRageStage = self.CurRageStage + 1
  local RageValuePerStage = math.ceil(self.MaxRageValue / #self.RageValueStages)
  self:AddRageValue(RageValuePerStage)
  self.GameMode.EMGameState:MulticastShowDiscoverSupervisorToast(math.floor(100 / #self.RageValueStages))
  self:OnSupervisorGuideAdded(Eid)
end

function BP_SynthesisComponent_C:OnSupervisorGuideAdded(Eid)
  DebugPrint("SynthesisComponent: \228\184\187\231\174\161\230\183\187\229\138\160\230\140\135\229\188\149", Eid)
  self.GameMode.EMGameState.GuideSupervisorEids:Add(Eid)
  self.GameMode.EMGameState:MarkGuideSupervisorEidsAsDirtyData()
  self.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_102", 2, EToastType.Warning)
  self.SupervisorInfo[Eid].IsGuide = true
  self.SupervisorGuideNum = self.SupervisorGuideNum + 1
  if self.SupervisorGuideNum == #self.SupervisorCreatorIds then
    DebugPrint("SynthesisComponent: \230\137\128\230\156\137\228\184\187\231\174\161\230\183\187\229\138\160\230\140\135\229\188\149\229\174\140\230\136\144")
    self.GameMode:NotifyClientShowDungeonTaskNew(self.IconPathSpecialEnemy, self.TextTitle, "DUNGEON_SYNTHESIS_114")
  end
end

function BP_SynthesisComponent_C:SetRageValue(RageValue)
  if RageValue > self.MaxRageValue then
    RageValue = self.MaxRageValue
  end
  self.GameMode.EMGameState:SetRageValue(RageValue)
end

function BP_SynthesisComponent_C:GetRageValue()
  return self.GameMode.EMGameState.RageValue
end

function BP_SynthesisComponent_C:AddRageValue(AddValue)
  self.GameMode.EMGameState:SetRageValue(self.GameMode.EMGameState.RageValue + AddValue)
  if self.CurRageStage >= #self.RageValueStages then
    return
  end
  if self.GameMode.EMGameState.RageValue >= self.RageValueStages[self.CurRageStage + 1] then
    self.CurRageStage = self.CurRageStage + 1
    DebugPrint("SynthesisComponent: OnRageStage", self.CurRageStage)
    if self.SupervisorGuideNum < #self.SupervisorCreatorIds then
      self.GameMode:TriggerGameModeEvent("Event_OnRageStage", self.CurRageStage)
    end
    self:TryAddGuideForSupervisor()
  end
end

function BP_SynthesisComponent_C:TryAddGuideForSupervisor()
  for _, CreatorId in pairs(self.SupervisorCreatorIds) do
    local LevelName = self.CreatorIdToLevelName[CreatorId]
    local Creator = self.GameMode.EMGameState:GetStaticCreatorInfo(CreatorId, true, LevelName)
    if IsValid(Creator) and Creator.ChildEids:Length() > 0 then
      for i = 1, Creator.ChildEids:Length() do
        local Eid = Creator.ChildEids:GetRef(i)
        if self.SupervisorInfo[Eid] and not self.SupervisorInfo[Eid].IsGuide then
          self:OnSupervisorGuideAdded(Eid)
          DebugPrint("SynthesisComponent: TryAddGuideForSupervisor", Eid)
          self.GameMode.EMGameState:AddGuideEid(Eid)
          return
        end
      end
    end
  end
  DebugPrint("SynthesisComponent: TryAddGuideForSupervisor \228\184\141\229\173\152\229\156\168\230\180\187\231\157\128\231\154\132\228\184\187\231\174\161")
end

function BP_SynthesisComponent_C:InitOccupationMission()
  self:SetOccupationFinishNum(0)
  self.GameMode:NotifyClientShowDungeonTaskNew(self.IconPathYellow, self.TextTitle, "DUNGEON_SYNTHESIS_115")
  self.GameMode:AddDungeonEvent("SynthesisOccupation")
end

function BP_SynthesisComponent_C:OnOneOccupationSucceed(OccupationMechanism)
  self:SetOccupationFinishNum(self:GetOccupationFinishNum() + 1)
  DebugPrint("SynthesisComponent: OnOneOccupationSucceed ", self:GetOccupationFinishNum())
  self.GameMode:TriggerGameModeEvent("Event_OnOneOccupationSucceed")
  if self:GetOccupationFinishNum() >= self.OccupationTargetNum then
    DebugPrint("SynthesisComponent: OnOccupationFinished")
    self.GameMode:RemoveDungeonEvent("SynthesisOccupation")
    self.GameMode:TriggerGameModeEvent("Event_OnOccupationFinished")
    self.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_111", 2, EToastType.Success)
  end
end

function BP_SynthesisComponent_C:SetOccupationFinishNum(Num)
  self.GameMode.EMGameState:SetOccupationFinishNum(Num)
end

function BP_SynthesisComponent_C:GetOccupationFinishNum()
  return self.GameMode.EMGameState.OccupationFinishNum
end

function BP_SynthesisComponent_C:InitCrackMission()
  self:SetKeySubmitNum(0)
  self.GameMode:NotifyClientShowDungeonTaskNew(self.IconPathYellow, self.TextTitle, "DUNGEON_SYNTHESIS_116")
end

function BP_SynthesisComponent_C:OnExplosionMonTimer()
  if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
    DebugPrint("SynthesisComponent: ExplosionMonTimerEnd DungeonEndEnd")
    self:RemoveTimer("ExplosionMonTimer")
    return
  end
  DebugPrint("SynthesisComponent: OnExplosionMonTimer")
  self.GameMode:TriggerGameModeEvent("Event_OnExplosionMonsterTimerCountdown")
end

function BP_SynthesisComponent_C:OnKeyDelivered(CrackMechanism)
  self:SetKeySubmitNum(self:GetKeySubmitNum() + 1)
  DebugPrint("SynthesisComponent: OnKeyDelivered", self:GetKeySubmitNum())
  self.GameMode:TriggerGameModeEvent("Event_OnKeyDelivered", self:GetKeySubmitNum())
  if self:GetKeySubmitNum() >= self.KeyNeedNum then
    DebugPrint("SynthesisComponent: CrackMissionFinish")
    self.GameMode:RemoveDungeonEvent("SynthesisCrack")
    self.GameMode:TriggerGameModeEvent("Event_OnCrackFinished")
    self.GameMode:NotifyClientShowDungeonTaskNew("", self.TextTitle, "DUNGEON_SYNTHESIS_118")
    self.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_110", 2, EToastType.Success)
    self:RemoveTimer("ExplosionMonTimer")
  end
end

function BP_SynthesisComponent_C:OnDefenceCoreActive_Crack(DefenceCore)
  self:AddTimer(self.BlastMonInterval, self.OnExplosionMonTimer, true, 0, "ExplosionMonTimer")
  self.GameMode:AddDungeonEvent("SynthesisCrack")
  self.GameMode:NotifyClientShowDungeonTaskNew(self.IconPathYellow, self.TextTitle, "DUNGEON_SYNTHESIS_117")
  self.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end

function BP_SynthesisComponent_C:SetKeySubmitNum(Num)
  self.GameMode.EMGameState:SetKeySubmitNum(Num)
end

function BP_SynthesisComponent_C:GetKeySubmitNum()
  return self.GameMode.EMGameState.KeySubmitNum
end

return BP_SynthesisComponent_C
