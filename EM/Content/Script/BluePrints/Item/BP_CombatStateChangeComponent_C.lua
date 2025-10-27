require("UnLua")
local M = Class("BluePrints.Common.TimerMgr")

function M:InitComponent_Lua()
  self.Owner = self:GetOwner()
  self:SetComponentTickEnabled(false)
  if not self.Owner then
    print(_G.LogTag, "LXZ InitComponent Failed")
  end
  if not self.Owner.Data.FirstStateId or not self.Owner.Data.StateIdList then
    return
  end
  self.FirstStateId = 0 ~= self.Owner.StateId and self.Owner.StateId or self.Owner.Data.FirstStateId
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:IsInRegion() then
    local StoredStateId = GameMode:GetRegionDataMgrSubSystem():GetStateIdByWorldRegionEid(self.Owner.RegionDataTableIndex)
    if StoredStateId > 0 then
      self.FirstStateId = StoredStateId
    end
  end
  self.StateIdListLua = self.Owner.Data.StateIdList
  self.EventCallbackNum = 0
  self.PlayerEid = 0
  self.FXTableLua = {}
  self.InteractiveEffectUsedLua = {}
  self:InitStateTable_Lua()
  self:InitFirstState_Lua()
end

function M:InitStateTable_Lua()
  self.StateTableLua = {}
  for i, StateId in pairs(self.StateIdListLua) do
    if self.StateTableLua[StateId] then
      assert(nil, "Error: Mechanism StateIdList \233\135\141\229\164\141")
    end
    self.StateTableLua[StateId] = {}
    local EventsCurrentState, NextStateIds, TypeNextStates, EventsNextStates = self:GetStateInfo_Lua(StateId)
    for i, v in pairs(NextStateIds) do
      if self.StateTableLua[StateId][v] then
        assert(nil, "Error: Mechanism NextStateId \233\135\141\229\164\141, NowStateId: " .. StateId)
      end
      self.StateTableLua[StateId][v] = {
        NextStateId = NextStateIds[i],
        TypeNextState = TypeNextStates[i],
        EventsNextState = EventsNextStates[i]
      }
    end
    self.StateTableLua[StateId].EventsCurrentState = EventsCurrentState
  end
end

function M:InitFirstState_Lua()
  self.Owner:OnEnterState(self.FirstStateId)
  self.NowState = self.FirstStateId
  self.Owner:UpdateRegionData("StateId", self.FirstStateId)
  self:UpdateStateIdCache_Lua()
  local EventsCurrentState = self.StateTableLua[self.FirstStateId].EventsCurrentState
  if EventsCurrentState then
    for i, Event in pairs(EventsCurrentState) do
      self["CurrentStateEvent_" .. Event.Function](self, Event)
    end
  end
  local GameMode = UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) and IsValid(self.Owner) then
    GameMode:OnMechanismStateChange_Cpp(self.Owner, self.NowState)
  end
  for i, StateInfo in pairs(self.StateTableLua[self.FirstStateId]) do
    local TypeNextState = StateInfo.TypeNextState
    if TypeNextState then
      self["TypeNextState_" .. TypeNextState.Type](self, TypeNextState, StateInfo.NextStateId)
    end
  end
end

function M:UpdateStateIdCache(ManualItemId, CreatorId, StateId)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if ManualItemId > 0 then
    GameState.ManualMechanismStateIdMap:Add(ManualItemId, StateId)
    if IsValid(GameState) and IsAuthority(self.Owner) then
      GameState:TriggerCondition("MechanismState", 0, ManualItemId, StateId)
    end
    EventManager:FireEvent(EventID.OnMechanismEnterState, ManualItemId, StateId)
  elseif CreatorId > 0 then
    GameState.MechanismStateIdMap:Add(CreatorId, StateId)
    if IsValid(GameState) and IsAuthority(self.Owner) then
      GameState:TriggerCondition("MechanismState", CreatorId, 0, StateId)
    end
    EventManager:FireEvent(EventID.OnMechanismEnterState, CreatorId, StateId)
  end
end

function M:UpdateStateIdCache_Lua()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if self.Owner.ManualItemId > 0 then
    GameState.ManualMechanismStateIdMap:Add(self.Owner.ManualItemId, self.Owner.StateId)
    if IsValid(GameState) and IsAuthority(self.Owner) then
      GameState:TriggerCondition("MechanismState", 0, self.Owner.ManualItemId, self.Owner.StateId)
    end
    EventManager:FireEvent(EventID.OnMechanismEnterState, self.Owner.ManualItemId, self.Owner.StateId)
  elseif self.Owner.CreatorId > 0 then
    GameState.MechanismStateIdMap:Add(self.Owner.CreatorId, self.Owner.StateId)
    if IsValid(GameState) and IsAuthority(self.Owner) then
      GameState:TriggerCondition("MechanismState", self.Owner.CreatorId, 0, self.Owner.StateId)
    end
    EventManager:FireEvent(EventID.OnMechanismEnterState, self.Owner.CreatorId, self.Owner.StateId)
  end
end

function M:GetStateInfo_Lua(StateId)
  local Info = DataMgr.MechanismState[StateId]
  assert(Info, "Error: Can't find State Info, StateId: " .. StateId .. self.Owner:GetName())
  local NextStateId = {}
  local TypeNextState = {}
  local EventsNextState = {}
  if Info.StateEvent then
    for i, v in pairs(Info.StateEvent) do
      NextStateId[i] = v.NextStateId
      TypeNextState[i] = v.TypeNextState
      EventsNextState[i] = v.EventsNextState
    end
  end
  return Info.EventsCurrentState or {}, NextStateId, TypeNextState, EventsNextState
end

function M:ChangeToState_Lua(StateId)
  assert(StateId, "Error: StateId is nil, CombatItem: " .. self.Owner.UnitId)
  assert(self.StateTableLua[StateId], "Error: Can't find State Info, NowStateId: " .. StateId)
  self:LeaveState_Lua(self.NowState, StateId, self.EnterState_Lua)
end

function M:ClientChangeToState_Lua(StateId)
  if StateId == self.NowState then
    return
  end
  self:ClientLeaveState_Lua(self.NowState, StateId, self.ClientEnterState_Lua)
end

function M:EnterState_Lua(StateId)
  self.Owner:OnEnterState(StateId)
  self.NowState = StateId
  self.Owner:UpdateRegionData("StateId", StateId)
  self:UpdateStateIdCache_Lua()
  local EventsCurrentState = self.StateTableLua[StateId].EventsCurrentState
  if EventsCurrentState then
    for i, Event in pairs(EventsCurrentState) do
      self["CurrentStateEvent_" .. Event.Function](self, Event)
    end
  end
  local GameMode = UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) and IsValid(self.Owner) then
    GameMode:OnMechanismStateChange_Cpp(self.Owner, StateId)
  end
  local Avatar = GWorld:GetAvatar()
  if IsStandAlone(self) and Avatar then
    Avatar:CombatItemTargetFinish(CommonConst.TargetTypeMechanismId, self.Owner.UnitId, 1, self.Owner.UnitId, StateId)
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity and self.PlayerEid > 0 then
    local AvatarEid = Battle(self):GetEntity(self.PlayerEid):GetOwner().AvatarId
    DSEntity:CombatItemTargetFinish(AvatarEid, CommonConst.TargetTypeMechanismId, self.Owner.UnitId, 1, self.Owner.UnitId, StateId)
  end
  for i, StateInfo in pairs(self.StateTableLua[StateId]) do
    local TypeNextState = StateInfo.TypeNextState
    if TypeNextState then
      self["TypeNextState_" .. TypeNextState.Type](self, TypeNextState, StateInfo.NextStateId)
    end
  end
end

function M:ClientEnterState_Lua(StateId, NextStateId, Callback)
  self.Owner:OnEnterState(StateId)
  self.NowState = StateId
  local EventsCurrentState = self.StateTableLua[StateId].EventsCurrentState
  if EventsCurrentState then
    for i, Event in pairs(EventsCurrentState) do
      self["CurrentStateEvent_" .. Event.Function](self, Event)
    end
  end
  for i, StateInfo in pairs(self.StateTableLua[StateId]) do
    local TypeNextState = StateInfo.TypeNextState
    if TypeNextState then
      self["TypeNextState_" .. TypeNextState.Type](self, TypeNextState, StateInfo.NextStateId)
    end
  end
end

function M:LeaveState_Lua(StateId, NextStateId, Callback)
  self.Owner:OnLeaveState(StateId, NextStateId)
  self.Owner:RemoveTimer("DistanceActiveTimer")
  self.Owner:RemoveTimer("DistanceDeActiveTimer")
  self:RemoveTimer("MechanismChangeState")
  if self.Owner.InteractiveComponents then
    for i, Comp in pairs(self.Owner.InteractiveComponents) do
      if Comp ~= self.Owner.DefaultInteractiveComponent then
        self.Owner.InteractiveComponents:RemoveItem(Comp)
        Comp:K2_DestroyComponent(self.Owner)
      elseif self.Owner.InteractiveType ~= Const.PressInteractive then
        Comp.bCanUsed = false
      end
    end
  end
  self:CleanMutexEvent()
  self.EventCallbackNum = 0
  local EventsNextState = self.StateTableLua[StateId][NextStateId].EventsNextState
  if EventsNextState then
    self.EventCallbackNum = #EventsNextState
  end
  if 0 == self.EventCallbackNum then
    Callback(self, NextStateId)
    return
  else
    for i, Event in pairs(EventsNextState) do
      self["EventsNextState_" .. Event.Function](self, Event, NextStateId, Callback)
    end
  end
end

function M:ClientLeaveState_Lua(StateId, NextStateId, Callback)
  self.Owner:OnLeaveState(StateId, NextStateId)
  self.Owner:RemoveTimer("DistanceActiveTimer")
  self.Owner:RemoveTimer("DistanceDeActiveTimer")
  if self.Owner.InteractiveComponents then
    for i, Comp in pairs(self.Owner.InteractiveComponents) do
      if Comp ~= self.Owner.DefaultInteractiveComponent then
        self.Owner.InteractiveComponents:RemoveItem(Comp)
        Comp:K2_DestroyComponent(self.Owner)
      elseif self.Owner.InteractiveType ~= Const.PressInteractive then
        Comp.bCanUsed = false
      end
    end
  end
  self:CleanMutexEvent()
  self.EventCallbackNum = 0
  local EventsNextState = self.StateTableLua[StateId][NextStateId].EventsNextState
  if EventsNextState then
    self.EventCallbackNum = #EventsNextState
  end
  if 0 == self.EventCallbackNum then
    Callback(self, NextStateId)
    return
  else
    for i, Event in pairs(EventsNextState) do
      self["EventsNextState_" .. Event.Function](self, Event, NextStateId, Callback)
    end
  end
end

function M:CleanMutexEvent(StateId, NextStateId, Callback)
  self.InteractiveEffectUsedLua = {}
end

function M:FireEvent(EventName, ...)
  if not self[EventName] then
    return
  end
  self[EventName]:Broadcast(...)
end

function M:StateChangeCountDownLua(TotalTime, NextStateId)
  self.CurrentCountDownLua = self.CurrentCountDownLua + 0.1
  if TotalTime < self.CurrentCountDownLua then
    self:RemoveTimer(self.StateChangeCountDownHandle, false)
    self.StateChangeCountDownHandle = nil
    self.CurrentCountDownLua = 0
    return
  end
  self:FireEvent("OnStateChangeCountDownDelegate", NextStateId, self.CurrentCountDownLua / TotalTime, self.CurrentCountDownLua)
end

function M:CurrentStateEvent_Test(ParamentsTable)
  print(_G.LogTag, "TestTest")
end

function M:CurrentStateEvent_OpenMechanism(ParamentsTable)
  local PlayerEid = 0
  if self.PlayerEid and 0 ~= self.PlayerEid then
    PlayerEid = self.PlayerEid
  end
  if self.Owner.OpenMechanism then
    self.Owner:OpenMechanism(PlayerEid)
  end
end

function M:CurrentStateEvent_CloseMechanism(ParamentsTable)
  local PlayerEid
  if self.PlayerEid and 0 ~= self.PlayerEid then
    PlayerEid = self.PlayerEid
  end
  if self.Owner.CloseMechanism then
    self.Owner:CloseMechanism(PlayerEid)
  end
end

function M:CurrentStateEvent_CombatPropActive(ParamentsTable)
  self.Owner:ActiveCombat()
end

function M:CurrentStateEvent_CombatPropDeActive(ParamentsTable)
  self.Owner:DeActiveCombat()
end

function M:CurrentStateEvent_SetParam(ParamentsTable)
  if self.Owner[ParamentsTable.Param] == nil then
    return
  end
  self.Owner[ParamentsTable.Param] = ParamentsTable.Value
  if ParamentsTable.Param == "IsActive" then
    if ParamentsTable.Value then
      self.Owner:ActiveCombat()
    else
      self.Owner:DeActiveCombat()
    end
  end
end

function M:CurrentStateEvent_ActiveGuide(ParamentsTable)
  self.Owner:CreateGuideHandle(false)
end

function M:CurrentStateEvent_DeactiveGuide(ParamentsTable)
  self.Owner:DeactiveGuide()
end

function M:CurrentStateEvent_AfterInteractiveEffect(ParamentsTable)
  if self.InteractiveEffectUsedLua.InteractiveEffect then
    return
  end
  self.InteractiveEffectUsedLua.InteractiveEffect = true
  self.Owner.CombatClientEffectComponent:AfterInteractiveEffect()
end

function M:CurrentStateEvent_PlayFX(ParamentsTable)
  local EffectId = ParamentsTable.EffectId
  local FXTag = ParamentsTable.Tag
  local NiagaraCompName = ParamentsTable.CompName
  if FXTag then
    self.Owner.FXComponent:SpawnFXById_Level(EffectId, FXTag, false)
  elseif NiagaraCompName then
    self.Owner.FXComponent:SpawnFXById_Level(EffectId, NiagaraCompName, false)
  else
    self.Owner.FXComponent:SpawnFXById_Level(EffectId, nil, false)
  end
end

function M:CurrentStateEvent_StopFX(ParamentsTable)
  local FXTag = ParamentsTable.Tag
  local NiagaraCompName = ParamentsTable.CompName
  if FXTag then
    self.Owner.FXComponent:StopFX_Level(FXTag)
  elseif NiagaraCompName then
    self.Owner.FXComponent:StopFX_Level(NiagaraCompName)
  end
end

function M:CurrentStateEvent_ChangeFX(ParamentsTable)
  local FXTag = ParamentsTable.Tag
  local NiagaraCompName = ParamentsTable.CompName
  local ParamTable = {}
  for i, v in pairs(ParamentsTable) do
    if "Color" ~= i and "Name" ~= i and "Tag" ~= i and "Function" ~= i then
      ParamTable[i] = v
    end
  end
  if FXTag then
    if ParamentsTable.Color then
      local LinearColor = UE4.UUIFunctionLibrary.StringToLinearColor(ParamentsTable.Color)
      self.Owner.FXComponent:SetFXVectorParam_Level(FXTag, "Color", LinearColor)
    end
    for Name, Value in pairs(ParamTable) do
      if type(Value) == "number" then
        self.Owner.FXComponent:SetFXFloatParam_Level(FXTag, Name, Value)
      elseif type(Value) == "boolean" then
        self.Owner.FXComponent:SetFXBoolParam_Level(FXTag, Name, Value)
      end
    end
  elseif NiagaraCompName then
    if ParamentsTable.Color then
      local LinearColor = UE4.UUIFunctionLibrary.StringToLinearColor(ParamentsTable.Color)
      self.Owner.FXComponent:SetFXVectorParam_Level(NiagaraCompName, "Color", LinearColor)
    end
    for Name, Value in pairs(ParamTable) do
      if type(Value) == "number" then
        self.Owner.FXComponent:SetFXFloatParam_Level(NiagaraCompName, Name, Value)
      elseif type(Value) == "boolean" then
        self.Owner.FXComponent:SetFXBoolParam_Level(NiagaraCompName, Name, Value)
      end
    end
  end
end

function M:CurrentStateEvent_SetConditionDoorState(ParamentsTable)
  local DoorType = ParamentsTable.DoorType
  local MiniGame = Battle(self):GetEntity(self.Owner.MiniGameEid)
  if self.Owner.EMNavModifierComponent == nil then
    self.Owner:AddNavModifier()
  end
  if 1 == DoorType and MiniGame and MiniGame.StateId ~= MiniGame.DeActiveStateId then
    MiniGame:ChangeState("Manual", 0, MiniGame.DeActiveStateId)
  elseif 2 == DoorType then
    if MiniGame and MiniGame.StateId ~= MiniGame.FiniStateId then
      MiniGame:ChangeState("Manual", 0, MiniGame.FiniStateId)
    end
    self.Owner:EndWait(self.PlayerEid)
  elseif 3 == DoorType then
    self.Owner:StartWait(self.PlayerEid)
  elseif 0 == DoorType then
    if MiniGame and MiniGame.StateId ~= MiniGame.FiniStateId then
      MiniGame:ChangeState("Manual", 0, MiniGame.FiniStateId)
    end
    self.Owner.EMNavModifierComponent:K2_DestroyComponent(self.Owner)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerOnGateChange(self.Owner.DoorId, DoorType)
  end
end

function M:CurrentStateEvent_DestroySelf(ParamentsTable)
  self.Owner:EMActorDestroy(EDestroyReason.CombatStateChange)
end

function M:CurrentStateEvent_ChangeColor(ParamentsTable)
  local ColorType = ParamentsTable.ColorId or 0
  self.Owner.CombatClientEffectComponent:ChangeColor(ColorType)
end

function M:CurrentStateEvent_PlayTalk(ParamentsTable)
  local TalkId = ParamentsTable.TalkId
  if not TalkId then
    print(_G.LogTag, "Error: PlayTalk need TalkId in Mechanism: ", self.Owner:GetName(), ", UnitId: ", self.Owner.UnitId)
    return
  end
  local Player
  if 0 ~= self.PlayerEid then
    Player = Battle(self.Owner):GetEntity(self.PlayerEid)
  end
  Player = Player or UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  UE4.UPlayTalkAsyncAction.PlayTalk(self.Owner, TalkId, nil)
end

function M:CurrentStateEvent_ChangeTrapSkillOpen(ParamentsTable)
  local bUseful = ParamentsTable.Open
  if not self.Owner.SetSkillUseful then
    return
  end
  self.Owner:SetSkillUseful(bUseful)
end

function M:CurrentStateEvent_SetBubbleWidget(ParamentsTable)
  local bShow = ParamentsTable.Show
  if not self.Owner.SetBubbleWidgetShowOrHide then
    return
  end
  self.Owner:SetBubbleWidgetShowOrHide(bShow)
end

function M:EventsNextState_Test(ParamentsTable, NextStateId, Callback)
  self:EventsNextStateCallback()
  if self:CheckCallback(Index) then
    Callback(self, NextStateId)
  end
end

function M:EventsNextState_PlayFX(ParamentsTable, NextStateId, Callback)
  local EffectId = ParamentsTable.EffectId
  local FXTag = ParamentsTable.Tag
  local NiagaraCompName = ParamentsTable.CompName
  local NeedFinish = ParamentsTable.NeedFinish or false
  
  local function PlayFXCallback()
    self:EventsNextStateCallback(Callback, NextStateId)
  end
  
  if FXTag then
    self.Owner.FXComponent:SpawnFXById_Level(EffectId, FXTag, false)
    if NeedFinish then
      local FXObject = self.Owner.FXComponent:GetFXByName_LevelInner(FXTag, {self, PlayFXCallback})
    end
  elseif NiagaraCompName then
    self.Owner.FXComponent:SpawnFXById_Level(EffectId, NiagaraCompName, false)
    if NeedFinish then
      local FXObject = self.Owner.FXComponent:GetFXByName_LevelInner(NiagaraCompName, {self, PlayFXCallback})
    end
  end
  if not NeedFinish then
    PlayFXCallback()
  end
end

function M:EventsNextState_StopFX(ParamentsTable, NextStateId, Callback)
  local FXTag = ParamentsTable.Tag
  local NiagaraCompName = ParamentsTable.CompName
  if FXTag then
    self.Owner.FXComponent:StopFX_Level(FXTag)
  elseif NiagaraCompName then
    self.Owner.FXComponent:StopFX_Level(NiagaraCompName)
  end
  self:EventsNextStateCallback(Callback, NextStateId)
end

function M:EventsNextState_ShowToast(ParamentsTable, NextStateId, Callback)
  local ToastText = ParamentsTable.ToastText
  if ToastText then
    if self.Owner.ShowToast then
      self.Owner:ShowToast(ToastText)
    else
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(ToastText))
    end
  end
  self:EventsNextStateCallback(Callback, NextStateId)
end

function M:EventsNextState_InteractiveEffect(ParamentsTable, NextStateId, Callback)
  if self.InteractiveEffectUsedLua.InteractiveEffect then
    return
  end
  self.InteractiveEffectUsedLua.InteractiveEffect = true
  self.Owner.CombatClientEffectComponent:OnInteractiveEffect()
  self:EventsNextStateCallback(Callback, NextStateId)
end

function M:EventsNextState_ChangeColor(ParamentsTable, NextStateId, Callback)
  local ColorType = ParamentsTable.ColorId
  self.Owner.CombatClientEffectComponent:ChangeColor(ColorType)
  self:EventsNextStateCallback(Callback, NextStateId)
end

function M:EventsNextState_CreateSpecialMonster(ParamentsTable, NextStateId, Callback)
  local RuleId = ParamentsTable.RuleId
  if not RuleId then
    self:EventsNextStateCallback(Callback, NextStateId)
    return
  end
  self.Owner:CreateSpecialMonster(RuleId)
  self:EventsNextStateCallback(Callback, NextStateId)
end

function M:EventsNextStateCallback(Callback, NextStateId)
  self.EventCallbackNum = self.EventCallbackNum - 1
  if self.EventCallbackNum <= 0 then
    Callback(self, NextStateId)
  end
end

function M:TypeNextState_Time(ParamentsTable, NextStateId)
  local Time = ParamentsTable.Param
  local NeedCountDown = ParamentsTable.NeedCountDown or false
  self:AddTimer(Time, self.ChangeState_Time, false, nil, "MechanismChangeState", nil, 0, NextStateId)
  if NeedCountDown and 0 ~= Time then
    self.CurrentCountDownLua = 0
    self.StateChangeCountDownHandle = self:AddTimer(0.1, self.StateChangeCountDownLua, true, 0, nil, nil, Time, NextStateId)
  end
end

function M:TypeNextState_Interactive(ParamentsTable, NextStateId)
  local InteractiveId = ParamentsTable.InteractiveId
  local StateChangeParam = ParamentsTable.StateChangeParam
  if not self.Type_Interactive then
    self.Type_Interactive = {}
  end
  if not self.Type_Interactive[self.NowState] then
    self.Type_Interactive[self.NowState] = {}
  end
  if not UE4.UKismetMathLibrary.ClassIsChildOf(self.Owner:GetClass(), AMechanismBase:StaticClass()) then
    self.Owner.InteractiveComponents = self.Owner:K2_GetComponentsByClass(UChestInteractiveComponent:StaticClass())
    if 0 == self.Owner.InteractiveComponents:Length() then
      self.Owner:AddInteractiveComponent(NextStateId)
    end
    self.Owner.ChestInteractiveComponent = self.Owner.InteractiveComponents[1]
    self.Owner.InteractiveComponents[1].NextStateId = NextStateId
    if InteractiveId then
      self.Owner.InteractiveComponents[1]:InitInteractiveComponent(InteractiveId)
    elseif self.Owner.InteractiveComponents[1].InitInteractiveComponent then
      self.Owner.InteractiveComponents[1]:InitInteractiveComponent(self.Owner.Data.InteractiveId)
    end
    self.Type_Interactive[self.NowState][NextStateId] = {CompIndex = 1, StateChangeParam = StateChangeParam}
    return
  end
  local DefaultInteractiveComponent = self.Owner.InteractiveComponents:GetRef(1)
  if not InteractiveId then
    DefaultInteractiveComponent.NextStateId = NextStateId
    DefaultInteractiveComponent:InitInteractiveComponent(self.Owner.Data.InteractiveId)
    if IsClient(self) or IsStandAlone(self) then
      DefaultInteractiveComponent:UpdateInteractiveUIState()
    end
    self.Type_Interactive[self.NowState][NextStateId] = {CompIndex = 1, StateChangeParam = StateChangeParam}
  elseif not DefaultInteractiveComponent.bCanUsed then
    DefaultInteractiveComponent.NextStateId = NextStateId
    DefaultInteractiveComponent:InitInteractiveComponent(InteractiveId)
    if IsClient(self) or IsStandAlone(self) then
      DefaultInteractiveComponent:UpdateInteractiveUIState()
    end
    self.Type_Interactive[self.NowState][NextStateId] = {CompIndex = 1, StateChangeParam = StateChangeParam}
  else
    local CompIndex = self.Owner:AddInteractiveComponent(NextStateId)
    if InteractiveId then
      self.Owner.InteractiveComponents:GetRef(CompIndex):InitInteractiveComponent(InteractiveId)
    end
    self.Type_Interactive[self.NowState][NextStateId] = {CompIndex = CompIndex, StateChangeParam = StateChangeParam}
  end
end

function M:TypeNextState_DistanceActive(ParamentsTable, NextStateId)
  if not self.Type_DistanceActive then
    self.Type_DistanceActive = {}
  end
  if ParamentsTable.ActiveRange then
    self.Owner:AddDistanceActiveTimer(ParamentsTable.ActiveRange)
  end
  self.Type_DistanceActive[self.NowState] = NextStateId
end

function M:TypeNextState_DistanceDeActive(ParamentsTable, NextStateId)
  if not self.Type_DistanceDeActive then
    self.Type_DistanceDeActive = {}
  end
  if ParamentsTable.DeActiveRange then
    self.Owner:AddDistanceDeActiveTimer(ParamentsTable.DeActiveRange)
  end
  self.Type_DistanceDeActive[self.NowState] = NextStateId
end

function M:TypeNextState_TriggerBox(ParamentsTable, NextStateId)
  if not self.Type_TriggerBox then
    self.Type_TriggerBox = {}
  end
  self.Type_TriggerBox[self.NowState] = NextStateId
end

function M:TypeNextState_Manual(ParamentsTable, NextStateId)
  if not self.Type_Manual then
    self.Type_Manual = {}
  end
  if not self.Type_Manual[self.NowState] then
    self.Type_Manual[self.NowState] = {}
  end
  table.insert(self.Type_Manual[self.NowState], NextStateId)
end

function M:TypeNextState_InteractDone(ParamentsTable, NextStateId)
  if not self.Type_Press then
    self.Type_Press = {}
  end
  if not self.Type_Press[self.NowState] then
    self.Type_Press[self.NowState] = {}
  end
  self.Type_Press[self.NowState].Success = NextStateId
end

function M:TypeNextState_InteractBreak(ParamentsTable, NextStateId)
  if not self.Type_Press then
    self.Type_Press = {}
  end
  if not self.Type_Press[self.NowState] then
    self.Type_Press[self.NowState] = {}
  end
  self.Type_Press[self.NowState].Fail = NextStateId
end

function M:TypeNextState_Hit(ParamentsTable, NextStateId)
  if not self.Type_Hit then
    self.Type_Hit = {}
  end
  if not self.Type_Hit[self.NowState] then
    self.Type_Hit[self.NowState] = {}
  end
  self.Type_Hit[self.NowState] = NextStateId
end

function M:ChangeState_Interactive(PlayerEid, NextStateId)
  local CompIndex = self.Type_Interactive[self.NowState][NextStateId].CompIndex
  local StateChangeParam = self.Type_Interactive[self.NowState][NextStateId].StateChangeParam
  if nil == StateChangeParam then
    StateChangeParam = true
  end
  if UE4.UKismetMathLibrary.ClassIsChildOf(self.Owner:GetClass(), AMechanismBase:StaticClass()) then
    self.Owner.ChestInteractiveComponent = self.Owner.InteractiveComponents:GetRef(CompIndex)
  else
    local CompArray = self.Owner:K2_GetComponentsByClass(UChestInteractiveComponent:StaticClass())
    self.Owner.ChestInteractiveComponent = CompArray[1]
  end
  local InteractiveSucc = not self.Owner.ChestInteractiveComponent:IsForbidden(Battle(self):GetEntity(PlayerEid))
  if nil ~= StateChangeParam and StateChangeParam == InteractiveSucc then
    self.PlayerEid = PlayerEid
    self:ChangeToState_Lua(NextStateId)
    if InteractiveSucc then
      local InteractiveTag = self.Owner.ChestInteractiveComponent.InteractiveTag
      if InteractiveTag then
        local Player = Battle(self):GetEntity(PlayerEid)
        local InteractiveId = self.Owner.ChestInteractiveComponent.CommonUIConfirmID
        if DataMgr.CommonUIConfirm[InteractiveId] and DataMgr.CommonUIConfirm[InteractiveId].AutoRotate then
          Player:RotateToInteractiveTarget(self.Owner.Eid)
        end
        Player:SetCharacterTag("Idle")
        Player:SetCharacterTag(InteractiveTag)
      end
    end
  end
end

function M:ChangeState_DistanceActive(PlayerEid, NextStateId)
  local ActiveNextState = self.Type_DistanceActive[self.NowState]
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(ActiveNextState)
end

function M:ChangeState_DistanceDeActive(PlayerEid, NextStateId)
  local DeActiveNextState = self.Type_DistanceDeActive[self.NowState]
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(DeActiveNextState)
end

function M:ChangeState_TriggerBox(PlayerEid, NextStateId)
  if not self.Type_TriggerBox or not self.Type_TriggerBox[self.NowState] then
    return
  end
  local TriggerBoxNextState = self.Type_TriggerBox[self.NowState]
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(TriggerBoxNextState)
end

function M:ChangeState_Time(PlayerEid, NextStateId)
  self:ChangeToState_Lua(NextStateId)
end

function M:ChangeState_Manual(PlayerEid, NextStateId)
  if not self.Type_Manual[self.NowState] then
    return
  end
  for i, StateId in pairs(self.Type_Manual[self.NowState]) do
    if NextStateId == StateId then
      self.PlayerEid = PlayerEid
      self:ChangeToState_Lua(NextStateId)
      break
    end
  end
end

function M:ChangeState_InteractBreak(PlayerEid, NextStateId)
  if not self.Type_Press[self.NowState] then
    return
  end
  local PressFailNextState = self.Type_Press[self.NowState].Fail
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(PressFailNextState)
end

function M:ChangeState_InteractDone(PlayerEid, NextStateId)
  if not self.Type_Press[self.NowState] then
    return
  end
  local PressSuccessNextState = self.Type_Press[self.NowState].Success
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(PressSuccessNextState)
end

function M:ChangeState_Hit(PlayerEid, NextStateId)
  if not self.Type_Hit or not self.Type_Hit[self.NowState] then
    return
  end
  local RealNextStateId = self.Type_Hit[self.NowState]
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(RealNextStateId)
end

function M:ChangeState_GM(PlayerEid, NextStateId)
  self.PlayerEid = PlayerEid
  self:ChangeToState_Lua(NextStateId)
end

function M:RemoveTimerLua(bIsServer)
  self.Owner:RemoveTimer("DistanceActiveTimer")
  self.Owner:RemoveTimer("DistanceDeActiveTimer")
  if bIsServer then
    self:RemoveTimer("MechanismChangeState")
  end
end

function M:RemoveTimerCountDown()
  self:RemoveTimer(self.StateChangeCountDownHandle, false)
end

function M:AddTimerLua(Time, NextStateId, NeedCountDown)
  self:AddTimer(Time, self.ChangeState_Time, false, nil, "MechanismChangeState", nil, 0, NextStateId)
  if NeedCountDown and 0 ~= Time then
    self.CurrentCountDownLua = 0
    self.StateChangeCountDownHandle = self:AddTimer(0.1, self.StateChangeCountDown, true, 0, nil, nil, Time, NextStateId)
  end
end

function M:TriggerAchievement(StateId)
  local Avatar = GWorld:GetAvatar()
  if IsStandAlone(self) and Avatar then
    Avatar:CombatItemTargetFinish(CommonConst.TargetTypeMechanismId, self.Owner.UnitId, 1, self.Owner.UnitId, StateId)
    Avatar:CombatItemTargetFinish(CommonConst.TargetTypeCreatorIdAndStateId, self.Owner.CreatorId, 1, self.Owner.CreatorId, StateId)
  end
  local DSEntity = GWorld:GetDSEntity()
  if DSEntity and self.PlayerEid > 0 then
    local AvatarEid = Battle(self):GetEntity(self.PlayerEid):GetOwner().AvatarId
    DSEntity:CombatItemTargetFinish(AvatarEid, CommonConst.TargetTypeMechanismId, self.Owner.UnitId, 1, self.Owner.UnitId, StateId)
    DSEntity:CombatItemTargetFinish(AvatarEid, CommonConst.TargetTypeCreatorIdAndStateId, self.Owner.CreatorId, 1, self.Owner.CreatorId, StateId)
  end
end

function M:CurrentStateEvent_SetConditionDoorState_CPP(DoorType)
  if -1 == DoorType then
    return
  end
  local MiniGame = Battle(self):GetEntity(self.Owner.MiniGameEid)
  if self.Owner.EMNavModifierComponent == nil then
    self.Owner:AddNavModifier()
  end
  self.Owner:OnDoorTypeChange(DoorType)
  if 1 == DoorType and MiniGame and MiniGame.StateId ~= MiniGame.DeActiveStateId then
    MiniGame:ChangeState("Manual", 0, MiniGame.DeActiveStateId)
  elseif 2 == DoorType then
    if MiniGame and MiniGame.StateId ~= MiniGame.FiniStateId then
      MiniGame:ChangeState("Manual", 0, MiniGame.FiniStateId)
    end
    self.Owner:EndWait(self.PlayerEid)
  elseif 3 == DoorType then
    self.Owner:StartWait(self.PlayerEid)
  elseif 0 == DoorType then
    if MiniGame and MiniGame.StateId ~= MiniGame.FiniStateId then
      MiniGame:ChangeState("Manual", 0, MiniGame.FiniStateId)
    end
    self.Owner.EMNavModifierComponent:K2_DestroyComponent(self.Owner)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerOnGateChange(self.Owner.DoorId, DoorType)
  end
  EventManager:FireEvent("OnDoorStateChange", DoorType, self.Owner.ManualItemId)
end

function M:CurrentStateEvent_PlayMontage_CPP(MontagePath, MeshName, SectionName)
  local Mesh = self.Owner[MeshName]
  assert(Mesh, "Error: Can't find Mesh:  ", self.Owner.UnitId, MeshName)
  local RealSectionName = SectionName
  if "None" == SectionName then
    RealSectionName = nil
  end
  local UseMaterialAnim = self.Owner.UseMaterialAnim
  if not UseMaterialAnim then
    local function OnNotifyBegin()
      self.Owner:OnMontageNotifyBegin(RealSectionName)
    end
    
    local function OnNotifyEnd()
      self.Owner:OnMontageNotifyEnd(RealSectionName)
    end
    
    local function OnBlendOut()
      self.Owner:OnMontageBlendOut(RealSectionName)
    end
    
    local function OnInterrupted()
      self.Owner:OnMontageInterrupted(RealSectionName)
    end
    
    local function OnCompleted()
      self.Owner:OnMontageEnd(RealSectionName)
    end
    
    local MontageCallback = {
      OnNotifyBegin = OnNotifyBegin,
      OnNotifyEnd = OnNotifyEnd,
      OnBlendOut = OnBlendOut,
      OnInterrupted = OnInterrupted,
      OnCompleted = OnCompleted
    }
    self.Owner:PlayMontage(Mesh, MontagePath, RealSectionName, MontageCallback)
  else
    self.Owner:PlayMontage_Mechanism(MeshName, SectionName, "", 0)
  end
end

function M:CurrentStateEvent_ChangeTrapSkillOpen_CPP(bUseful)
  if not self.Owner.SetSkillUseful then
    return
  end
  self.Owner:SetSkillUseful(bUseful)
end

function M:CurrentStateEvent_SetBubbleWidget_CPP(bShow)
  if not self.Owner.SetBubbleWidgetShowOrHide then
    return
  end
  self.Owner:SetBubbleWidgetShowOrHide(bShow)
end

function M:EventsNextState_PlayFX_CPP(EffectId, NeedFinish, NextStateId)
  local FXObject
  if self.Owner.FXComponent then
    FXObject = self.Owner.FXComponent:PlayEffectByIDParams(EffectId)
  else
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    FXObject = Player.FXComponent:PlayEffectByIDParams(EffectId)
  end
  
  local function PlayFXCallback()
    self:TriggerOnEventEnd(NextStateId)
  end
  
  if FXObject and NeedFinish then
    FXObject.OnSystemFinished:Add(self, PlayFXCallback)
  else
    self:TriggerOnEventEnd(NextStateId)
  end
end

function M:EventsNextState_StopFX_CPP(FXTag, NiagaraCompName, NextStateId)
  if "None" ~= FXTag and self.FXTable[FXTag] then
    for i, FX in pairs(self.FXTable[FXTag]) do
      if FX then
        FX:K2_DestroyComponent(self.Owner)
      end
    end
    self.FXTable[FXTag] = {}
  elseif "None" ~= NiagaraCompName and self.Owner[NiagaraCompName] then
    self.Owner[NiagaraCompName]:SetActive(false, false)
  end
  self:TriggerOnEventEnd(NextStateId)
end

function M:EventsNextState_PlayMontage_CPP(MontagePath, MeshName, SectionName, CallBackName, NextStateId)
  local Mesh = self.Owner[MeshName]
  assert(Mesh, "Error: Can't find Mesh:  ", self.Owner.UnitId, MeshName)
  local UseMaterialAnim = self.Owner.UseMaterialAnim
  if not UseMaterialAnim then
    local function OnNotifyBegin()
      self.Owner:OnMontageNotifyBegin(SectionName)
      
      if "OnNotifyBegin" == CallBackName then
        self:TriggerOnEventEnd(NextStateId)
      end
    end
    
    local function OnNotifyEnd()
      self.Owner:OnMontageNotifyEnd(SectionName)
      if "OnNotifyEnd" == CallBackName then
        self:TriggerOnEventEnd(NextStateId)
      end
    end
    
    local function OnBlendOut()
      self.Owner:OnMontageBlendOut(SectionName)
      if "OnBlendOut" == CallBackName then
        self:TriggerOnEventEnd(NextStateId)
      end
    end
    
    local function OnInterrupted()
      self.Owner:OnMontageInterrupted(SectionName)
      if "OnInterrupted" == CallBackName then
        self:TriggerOnEventEnd(NextStateId)
      end
    end
    
    local function OnCompleted()
      self.Owner:OnMontageEnd(SectionName)
      if "OnCompleted" == CallBackName then
        self:TriggerOnEventEnd(NextStateId)
      end
    end
    
    local MontageCallback = {
      OnNotifyBegin = OnNotifyBegin,
      OnNotifyEnd = OnNotifyEnd,
      OnBlendOut = OnBlendOut,
      OnInterrupted = OnInterrupted,
      OnCompleted = OnCompleted
    }
    self.Owner:PlayMontage(Mesh, MontagePath, SectionName, MontageCallback)
    if "OnStart" == CallBackName then
      self.Owner:OnMontageStart(SectionName)
      self:TriggerOnEventEnd(NextStateId)
    end
  else
    self.Owner:PlayMontage_Mechanism(MeshName, SectionName, CallBackName, NextStateId)
  end
end

function M:EventsNextState_ShowToast_CPP(ToastText, NextStateId)
  if "None" ~= ToastText then
    if self.Owner.ShowToast then
      self.Owner:ShowToast(ToastText)
    else
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(ToastText))
    end
  end
  self:EventsNextStateCallback(nil, NextStateId)
end

function M:AddConditionCallBackLua(ConditionId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Res = ConditionUtils.CheckCondition(Avatar, ConditionId)
    if Res then
      self:ChangeState_Condition_CPP(ConditionId)
      return
    end
  end
  if self.ConditionNextStateIds:Num() <= 1 then
    EventManager:AddEvent(EventID.ConditionComplete, self, self.ChangeState_Condition_CPP)
  end
end

function M:RemoveConditionCallBackLua()
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

function M:ReceiveEndPlay(EndPlayReason)
  self.Overridden.ReceiveEndPlay(self, EndPlayReason)
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

return M
