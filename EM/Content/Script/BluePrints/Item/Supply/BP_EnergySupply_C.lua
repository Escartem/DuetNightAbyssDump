require("UnLua")
local BP_EnergySupply_C = Class({
  "BluePrints.Item.Supply.BP_SupplyBase_C",
  "BluePrints.Combat.Components.EffectSourceInterface"
})
local bIsToastShowed = false
local WaitToShowToastTime = DataMgr.GlobalConstant.SurvivalProToastTime.ConstantValue
local ToastTime = 15
local ShowToastDistance = DataMgr.GlobalConstant.SurvivalProRadius.ConstantValue
local ToastTimerName = "RealShowToast"
local AlreadyDeleteToast = false
BP_EnergySupply_C._components = {
  "BluePrints.Item.Components.RecoverEnergy"
}

function BP_EnergySupply_C:AuthorityInitInfo(Info)
  BP_EnergySupply_C.Super.AuthorityInitInfo(self, Info)
  if 0 == self.NowEnergy then
    self.NowEnergy = self.UnitParams.InitialEnergy or 0
  end
  self.NormalEnergy = self.UnitParams.NormalEnergy
  self.EliteEnergy = self.UnitParams.EliteEnergy
  self.RecoverEnergy = self.UnitParams.RecoverEnergy
  self.BuffId = self.UnitParams.BuffId
  self.StageTime = self.UnitParams.StageTime
  self.MaxEnergyChange = self.UnitParams.MaxEnergyChange
  self.LeaveBuffTime = DataMgr.GlobalConstant.LeaveBuffTime.ConstantValue
  self.MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  self.RecoverHandle = nil
  self.SurvivalTime = 0
  self.HasPlayTalk = false
  self.InteractiveFXObjext = nil
  self.HasFindPlayer = false
  self.HasAllEnergyGuideCloseLua = {}
  self:SetCamp(Info.Camp or self.Data.Camp)
  self:AddBuffManager()
end

function BP_EnergySupply_C:CommonInitInfo(Info)
  BP_EnergySupply_C.Super.CommonInitInfo(self, Info)
  self.InteractiveType = Const.PressInteractive
  self.EnergyLimit = self.UnitParams.EnergyLimit
  self.MaxEnergy = self.EnergyLimit
  self.BuffBase = self.UnitParams.BuffBase
  self.LiquidFXNum = 0
  self.BuffNum = 0
  self.BuffFXNum = 0
  self.BuffFXIds = {
    900016,
    900019,
    900017,
    900018
  }
  self.BuffFX = {}
  self.Radius = DataMgr.GlobalConstant.SurvivalProRadius.ConstantValue or 1000
  self.GuideRadius = DataMgr.GlobalConstant.SurvivalProGuideRadius.ConstantValue or 500
  self.SurvivalValueChange = DataMgr.GlobalConstant.SurvivalValueChange.ConstantValue
  self.ChestInteractiveComponent.DisPlayInteractiveName = GText(self.ChestInteractiveComponent.InteractiveName)
  self.EnergySupplyBarComponent:Init(self.UnitId)
  self.Target = {}
  self.InToastDisPlayer = {}
  self.BuffId = self.UnitParams.BuffId
  self.bActiveMontage = false
  self.NowPlayerEid = 0
  self.HasEnergyGuideCloseLua = {}
end

function BP_EnergySupply_C:ClientInitInfo(Info)
  BP_EnergySupply_C.Super.ClientInitInfo(self, Info)
  EventManager:FireEvent(EventID.OnCreatedEnergySupplyWidget, self.EnergySupplyBarComponent:GetWidget())
  EventManager:AddEvent(EventID.OnStartSkillFeature, self, self.OnStartSkillFeature)
  EventManager:AddEvent(EventID.OnEndSkillFeature, self, self.OnEndSkillFeature)
  EventManager:AddEvent(EventID.OnDungeonVoteBegin, self, self.ResetToastInfo)
  DebugPrint("ADD TIMER FindTarget_Client", self:GetName())
  self:StartFindTarget_Client()
end

function BP_EnergySupply_C:OnActorReady(Info)
  BP_EnergySupply_C.Super.OnActorReady(self, Info)
  self:DeactiveGuide()
  if IsAuthority(self) then
    self:StartRecover()
    self:OnBuffNumChange()
  end
  self:OnFxObjectFinished()
end

function BP_EnergySupply_C:ReceiveEndPlay(Reason)
  self.Overridden.ReceiveEndPlay(self, Reason)
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, self)
  EventManager:RemoveEvent(EventID.OnEndSkillFeature, self)
  self:ResetToastInfo()
end

function BP_EnergySupply_C:OnEMActorDestroy(...)
  BP_EnergySupply_C.Super.OnEMActorDestroy(self, ...)
  print(_G.LogTag, "LXZ OnEMActorDestroy", self:GetName(), self._RegisterOnCharacterDead)
  if self._RegisterOnCharacterDead then
    Battle(self):UnregisterBattleEvent(BattleEventName.OnAfterDead, self, "_OnCharacterDead")
  end
end

function BP_EnergySupply_C:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    print(_G.LogTag, "GameState is nil")
    return
  end
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_EnergySupply_C:OpenMechanism(PlayerActorEid)
  if IsClient(self) then
    return
  end
  if nil == PlayerActorEid or nil == self or not self.CanOpen then
    return
  end
  if self.IsEnergyInteractive then
    return
  end
  print(_G.LogTag, "LXZ Energy OpenMechanism", PlayerActorEid)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    self.NowPlayerEid = PlayerActorEid
    GameMode:TriggerDungeonComponentFun("TryToPostFinishTutorial")
    self:ClientPlayAnim(PlayerActorEid, 0, self.Eid)
  end
  self.IsEnergyInteractive = true
  if nil == self.EToSHandle then
    self.FXNum = 0
    self.EToSHandle = self:AddTimer(0.1, self.EnergyToSurvival, true)
  end
  self:AddTimer(0.5, self.ShowInteractedToast, false, 0, "EnergySupplyInteractedToast", false, PlayerActorEid)
  self:OnOpenMechanism()
end

function BP_EnergySupply_C:CloseMechanism(Eid, IsSuccess)
  print(_G.LogTag, "LXZ Energy CloseMechanism", Eid, self.NowPlayerEid)
  if IsAuthority(self) and Eid == self.NowPlayerEid then
    local Player = Battle(self):GetEntity(self.NowPlayerEid)
    print(_G.LogTag, "LXZ Energy CloseMechanism111", Player:GetName())
    self:ClientPlayAnim(Eid, 2, self.Eid)
    if Player:IsDead() or Player:IsPhantom() then
      self:ChangeToNormalState(Player)
    else
      Player.OnInteractiveDelegate:Add(self, self.ChangeToNormalState)
    end
    self:RemoveTimer(self.EToSHandle)
    self:RemoveTimer("EnergySupplyInteractedToast")
    self.EToSHandle = nil
    self.NowPlayerEid = 0
    self.IsEnergyInteractive = false
    self:OnCloseMechanism()
  end
  AudioManager(self):SetEventSoundParam(self, "EnergySupplyOpen", {ToEnd = 1})
end

function BP_EnergySupply_C:ForceCloseMechanism(Eid, IsSuccess)
  print(_G.LogTag, "LXZ Energy ForceCloseMechanism", Eid, self.NowPlayerEid)
  if IsAuthority(self) and Eid == self.NowPlayerEid then
    local Player = Battle(self):GetEntity(self.NowPlayerEid)
    self:ClientPlayAnim(Eid, 2, self.Eid)
    print(_G.LogTag, "LXZ Energy ForceCloseMechanism111", Player:GetName())
    if Player:IsDead() or Player:IsPhantom() then
      self:ChangeToNormalState(Player)
    else
      Player.OnInteractiveDelegate:Add(self, self.ChangeToNormalState)
    end
    self:RemoveTimer(self.EToSHandle)
    self:RemoveTimer("EnergySupplyInteractedToast")
    self.EToSHandle = nil
    self.NowPlayerEid = 0
    self.IsEnergyInteractive = false
  end
  AudioManager(self):SetEventSoundParam(self, "EnergySupplyOpen", {ToEnd = 1})
end

function BP_EnergySupply_C:ChangeToNormalState(Player)
  print(_G.LogTag, "LXZ Energy ChangeToNormalState", Player:GetName())
  if IsAuthority(self) then
    self.DefaultInteractiveComponent.bCanUsed = false
    self:ChangeState("InteractDone", Player.Eid)
    Player.OnInteractiveDelegate:Remove(self, self.ChangeToNormalState)
  end
end

function BP_EnergySupply_C:SetInteractiveCanUsed(value)
end

function BP_EnergySupply_C:PlayAnim(PlayerId, InteractiveState, MechanismEid)
  local PlayerCharacter = Battle(self):GetEntity(PlayerId)
  if 0 == InteractiveState then
    if PlayerCharacter:IsPlayer() then
      self.ChestInteractiveComponent:OnStartInteractive(PlayerCharacter, self.ChestInteractiveComponent.MontageName, MechanismEid)
    else
      PlayerCharacter.WaitCallBack = true
      PlayerCharacter:SetEnterInteractive(true, self.ChestInteractiveComponent.MontageName, self.InteractiveTag)
    end
    if IsClient(self) then
      PlayerCharacter:SetCharacterTag("Interactive")
    end
    if not IsValid(self.InteractiveFXObjext) or not self.InteractiveFXObjext:IsActive() then
      self.InteractiveFXObjext = self.FXComponent:PlayEffectByID(900012)
    end
    self:OnInteracrive(PlayerId)
  end
  if 2 == InteractiveState then
    self.DefaultInteractiveComponent.bCanUsed = false
    if PlayerCharacter:IsPlayer() then
      self.ChestInteractiveComponent:OnEndInteractive(PlayerCharacter, self.ChestInteractiveComponent.MontageName, MechanismEid)
    else
      PlayerCharacter:SetEnterInteractive(false, self.ChestInteractiveComponent.MontageName)
    end
    if IsValid(self.InteractiveFXObjext) then
      self.InteractiveFXObjext:Deactivate()
      self.InteractiveFXObjext = nil
    end
  end
end

function BP_EnergySupply_C:OnBuffNumChange()
  if not self.BuffId then
    return
  end
  local NewBuffNum = self.NowEnergy // self.BuffBase
  local Sub = math.floor(NewBuffNum - self.BuffNum)
  if Sub < 0 then
    DebugPrint("\232\191\153\233\135\140\230\152\175BuffNumChangelxh1: " .. Sub)
    Battle(self):ReduceBuffLayerFromTarget(self, self, self.BuffId, -Sub, false)
  elseif Sub > 0 then
    DebugPrint("\232\191\153\233\135\140\230\152\175BuffNumChangelxh2: " .. Sub)
    Battle(self):AddBuffToTarget(self, self, self.BuffId, -1, nil, nil, Sub)
  end
  self.BuffNum = NewBuffNum
end

function BP_EnergySupply_C:FindTarget()
  print(_G.LogTag, "LXZ FindTarget")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local FindPlayer = false
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    local Dis = self:CalDistance(Player)
    if Dis <= self.Radius and self:CheckInSameLevel(Player) then
      FindPlayer = true
      if not self.HasAllEnergyGuideCloseLua[Player.Eid] then
        local IgnoreSelf = TArray(0)
        if Dis >= self.GuideRadius then
          IgnoreSelf:Add(self.Eid)
        end
        self:DeactiveAllGuide(IgnoreSelf, Player.Eid)
        self.HasAllEnergyGuideCloseLua[Player.Eid] = true
      elseif Dis >= self.GuideRadius and (self.HasEnergyGuideCloseLua[Player.Eid] or self.HasEnergyGuideCloseLua[Player.Eid] == nil) then
        self:ActiveGuide("Add", Player.Eid)
        self.HasEnergyGuideCloseLua[Player.Eid] = false
      elseif Dis < self.GuideRadius and not self.HasEnergyGuideCloseLua[Player.Eid] then
        self:DeactiveGuide(Player.Eid)
        self.HasEnergyGuideCloseLua[Player.Eid] = true
      end
    elseif self.HasAllEnergyGuideCloseLua[Player.Eid] then
      self:ActiveAllGuide(nil, Player.Eid)
      self.HasAllEnergyGuideCloseLua[Player.Eid] = false
    end
    self:CheckPlayerInShowToastDis(Dis, Player.Eid)
  end
  if FindPlayer then
    self:LiquidStart()
  else
    self:LiquidStop()
  end
  if self.HasFindPlayer ~= FindPlayer then
    if FindPlayer then
      self:OnSupplyRun()
    else
      self:OnSupplyStop()
    end
    self.HasFindPlayer = FindPlayer
  end
end

function BP_EnergySupply_C:StartRecover()
  self.RecoverHandle = self:AddTimer(1, BP_EnergySupply_C.AutoRecover, true)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    local AllGuideClose = self.HasAllEnergyGuideCloseLua[Player.Eid]
    if false ~= AllGuideClose then
      self:ActiveAllGuide(nil, Player.Eid)
      self.HasAllEnergyGuideCloseLua[Player.Eid] = false
    end
  end
  self:StartFindTarget()
end

function BP_EnergySupply_C:StartFindTarget()
  self:AddTimer(0.1, self.FindTarget, true, 0.1, "FindTarget")
end

function BP_EnergySupply_C:EndFindTarget()
  self:RemoveTimer("FindTarget")
end

function BP_EnergySupply_C:AutoRecover()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local bFindPlayer = false
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    local Dis = self:CalDistance(Player)
    if Dis <= self.Radius then
      bFindPlayer = true
      if not self.bActiveMontage then
        self.bActiveMontage = true
        self:TriggerBluePrintEvent("PlayActiveMontage")
      end
      self:ChangeEnergy(self.RecoverEnergy, false)
      if not self.HasPlayTalk then
        self.HasPlayTalk = true
        local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
        if GameMode:GetDungeonComponent().HasInEnergySurvival then
          UE4.UPlayTalkAsyncAction.PlayTalk(GameInstance, 600308, nil)
          break
        end
        UE4.UPlayTalkAsyncAction.PlayTalk(GameInstance, 600303, nil)
        GameMode:PostCustomEvent("SurvivalProStart")
        GameMode:GetDungeonComponent().HasInEnergySurvival = true
      end
      break
    end
  end
  if not bFindPlayer and self.bActiveMontage then
    self.bActiveMontage = false
    self:TriggerBluePrintEvent("PlayStopMontage")
  end
  self:OnBuffNumChange()
end

function BP_EnergySupply_C:OutRecover_Lua(Monster)
  if not IsValid(Monster) or not Monster:IsMonster() then
    return
  end
  if Monster.EnergySupplyCheck == nil then
    Monster.EnergySupplyCheck = 1
  elseif Monster.EnergySupplyCheck ~= nil and -1 ~= Monster.EnergySupplyCheck then
    Monster.EnergySupplyCheck = Monster.EnergySupplyCheck + 1
  end
  local DisX = Monster:K2_GetActorLocation().X - self:K2_GetActorLocation().X
  local DisY = Monster:K2_GetActorLocation().Y - self:K2_GetActorLocation().Y
  local Dis = math.sqrt(DisX * DisX + DisY * DisY)
  if Dis < self.Radius then
    if IsAuthority(self) then
      local SeqFilterTag = {"Mon.Strong"}
      if Monster:HasAnyTags_Table(Monster, SeqFilterTag, false) then
        self:ChangeEnergy(self.EliteEnergy, true)
      else
        self:ChangeEnergy(self.NormalEnergy, true)
      end
    end
    if not IsAuthority(self) or IsStandAlone(self) then
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      local MonsterLoc = Monster.Mesh:K2_GetComponentLocation()
      local MonsterRot = Monster.Mesh:K2_GetComponentRotation()
      local FXID = DataMgr.VFX_CommonSet[2].EffectId[1]
      local FXObject = Player.FXComponent:PlayEffectByIDParams(FXID, {
        UseAbsoluteLocation = true,
        Location = {
          MonsterLoc.X,
          MonsterLoc.Y,
          MonsterLoc.Z + Monster.OriginHalfHeight
        },
        Rotation = {
          MonsterRot.Pitch,
          MonsterRot.Yaw,
          MonsterRot.Roll
        }
      })
      if FXObject then
        self:OnFxObjectCreated(FXObject)
        UE4.UNiagaraFunctionLibrary.OverrideSystemUserVariableSkeletalMeshComponent(FXObject, "Skeletal Mesh", Monster.Mesh)
        FXObject:SetNiagaraVariableVec3("AttarctionPosition", self.AttarctionPosition:K2_GetComponentLocation())
      end
    end
    Monster.EnergySupplyCheck = -1
  end
  if IsAuthority(self) and Monster.EnergySupplyCheck == UE4.UGameplayStatics.GetGameState(self).MechanismMap:FindRef("Supply").Array:Length() then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:TriggerDungeonComponentFun("OnMonsterDeadOut")
  end
end

function BP_EnergySupply_C:EnergyToSurvival()
  if not self.IsEnergyInteractive then
    return
  end
  local RealChangeVal = math.min(self.SurvivalValueChange / 10, self.NowEnergy)
  self:ChangeEnergy(-RealChangeVal, false)
  self:OnEnergyDown()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerDungeonComponentFun("AddSurvivalValue", RealChangeVal)
    if 0 == self.NowEnergy or GameMode.EMGameState.SurvivalValue >= self.MaxSurvivalValue then
      local Character = Battle(self):GetEntity(self.NowPlayerEid)
      if Character:IsPlayer() then
        self.ChestInteractiveComponent:EndPressInteractive(Battle(self):GetEntity(self.NowPlayerEid), true)
      else
        self:PhantomDeInteractive(self.NowPlayerEid)
      end
      self:OnForceEndInteractive(GameMode.EMGameState.SurvivalValue, self.MaxSurvivalValue)
      GameMode:TriggerDungeonComponentFun("TryToPostSurpossedLeave")
    end
  end
  self.FXNum = self.FXNum + 1
end

function BP_EnergySupply_C:OnForceEndInteractive_Lua(SurvivalValue, MaxSurvivalValue)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  if not IsAuthority(self) or IsStandAlone(self) then
    if MaxSurvivalValue <= SurvivalValue then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "DUNGEON_SURVIVALPRO_108")
    else
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "DUNGEON_SURVIVALPRO_109")
    end
  end
end

function BP_EnergySupply_C:ChangeEnergy_Lua(ChangeValue, bFromMonster)
  self.NowEnergy = self.NowEnergy + ChangeValue
  self.NowEnergy = math.min(self.NowEnergy, self.MaxEnergy)
  self.NowEnergy = math.max(self.NowEnergy, 0)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and self.NowEnergy >= self.MaxEnergy then
      GameMode:TriggerDungeonAchieve("EnergySupplyEnergyMax", -1, self.Eid, self.UnitId)
    end
  end
  self.EnergyChangeFromMonster = bFromMonster
  if IsStandAlone(self) or not IsAuthority(self) then
    self:OnEnergyChanged(self.NowEnergy, bFromMonster)
    if ChangeValue < 0 then
      self:OnEnergyDown()
    end
  end
end

function BP_EnergySupply_C:CalDistance(Player)
  local PlayerX = Player:K2_GetActorLocation().X
  local PlayerY = Player:K2_GetActorLocation().Y
  local SelfX = self:K2_GetActorLocation().X
  local SelfY = self:K2_GetActorLocation().Y
  local x = PlayerX - SelfX
  local y = PlayerY - SelfY
  return math.sqrt(x * x + y * y)
end

function BP_EnergySupply_C:OnRep_NowEnergy()
  if self.InitSuccess then
    self:OnFxObjectFinished()
  elseif not self.InitSuccess and not self:IsExistTimer("OnRep_NowEnergy") then
    local function Callback()
      if self.InitSuccess then
        self:OnFxObjectFinished()
        
        self:RemoveTimer("OnRep_NowEnergy")
      end
    end
    
    self:AddTimer(0.1, Callback, true, 0, "OnRep_NowEnergy", false)
  end
end

function BP_EnergySupply_C:CheckInSameLevel(Actor)
  local ActorLevelId = self:CheckActorLevel(Actor)
  local SupplyLevelId = self:CheckActorLevel(self)
  return -1 ~= ActorLevelId and ActorLevelId == SupplyLevelId
end

function BP_EnergySupply_C:CheckActorLevel(Actor)
  local LevelLoader = UE4.UGameplayStatics.GetGameInstance(self):GetSceneManager():GetLevelLoader()
  if not LevelLoader then
    return true
  end
  return LevelLoader:GetLevelId(Actor)
end

function BP_EnergySupply_C:OnEnergyChanged(NewEnergy, bFromMonster)
  self.EnergySupplyBarComponent:OnEnergyChanged(NewEnergy, bFromMonster)
end

function BP_EnergySupply_C:OnBuffAdded(PlayerEid, BuffID, OldLayer, NewLayer)
  self.EnergySupplyBarComponent:OnBuffAdded(PlayerEid, BuffID, OldLayer, NewLayer)
end

function BP_EnergySupply_C:OnPlayerIn(PlayerEid, BuffID)
  return self.EnergySupplyBarComponent:OnPlayerIn(PlayerEid, BuffID)
end

function BP_EnergySupply_C:OnPlayerLeft(PlayerEid)
  return self.EnergySupplyBarComponent:OnPlayerLeft(PlayerEid)
end

function BP_EnergySupply_C:OnFxObjectCreated(FxObject)
  self.EnergySupplyBarComponent:OnFxObjectCreated(FxObject)
  FxObject.OnSystemFinished:Add(self, self.OnFxObjectFinished)
end

function BP_EnergySupply_C:OnLiquidChange(Liquid)
  if IsAuthority(self) and not IsStandAlone(self) then
    return
  end
  local NewNum = math.ceil(Liquid // self.BuffBase)
  if NewNum < 0 then
    return
  end
  local Sub = NewNum - self.LiquidFXNum
  if Sub < 0 then
    self["BottleFull" .. self.LiquidFXNum](self, false)
    self.BuffFX[self.LiquidFXNum] = nil
  elseif Sub > 0 then
    self["BottleFull" .. NewNum](self, true)
  end
  if Liquid == self.MaxEnergy and not self.MaxEnergyFX then
    self.MaxEnergyFX = {}
    self.BottleAllFull(self, true)
  elseif Liquid < self.MaxEnergy and self.MaxEnergyFX then
    self.BottleAllFull(self, false)
    self.MaxEnergyFX = nil
  end
  self.LiquidFXNum = NewNum
end

function BP_EnergySupply_C:OnStartSkillFeature(IsHideAllUI)
  if IsHideAllUI then
    local Widget = self.EnergySupplyBarComponent:GetWidget()
    if Widget then
      Widget:Hide(Const.SkillFeatureHideTag)
    end
  end
end

function BP_EnergySupply_C:OnEndSkillFeature(IsHideAllUI)
  if IsHideAllUI then
    local Widget = self.EnergySupplyBarComponent:GetWidget()
    if Widget then
      Widget:Show(Const.SkillFeatureHideTag)
    end
  end
end

function BP_EnergySupply_C:CheckPlayerInShowToastDis(Dis, PlayerEid)
  if bIsToastShowed then
    return
  end
  if Dis < ShowToastDistance then
    if self.InToastDisPlayer[PlayerEid] == nil then
      self:AddTimer(WaitToShowToastTime, self.RealShowToast, false, 0, ToastTimerName, true)
      self.InToastDisPlayer[PlayerEid] = self.NowEnergy or 0
    end
  elseif self.InToastDisPlayer[PlayerEid] ~= nil then
    self:RemoveTimer(ToastTimerName)
    self.InToastDisPlayer[PlayerEid] = nil
  end
end

function BP_EnergySupply_C:RealShowToast()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    UResourceLibrary.LoadClassAsync(GameInstance, UIConst.GuideTextFloat, {
      GameInstance,
      function(_, ClassObject)
        UE4.UUIStateAsyncActionBase.ShowGuideToastWithUIClass(GameInstance, ClassObject, 100011, ToastTime)
      end
    })
    bIsToastShowed = true
  end
end

function BP_EnergySupply_C:OnInteracrive(PlayerId)
  if AlreadyDeleteToast then
    return
  end
  if self.NowEnergy > (self.InToastDisPlayer[PlayerId] or 0) and self:IsExistTimer(ToastTimerName) then
    self:RemoveTimer(ToastTimerName)
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local ToastUI = UIManager:GetUIObj("GuideTextFloat" .. 100011)
    if ToastUI then
      ToastUI:DeleteGuideMessage(100011)
      AlreadyDeleteToast = true
    end
  end
end

function BP_EnergySupply_C:ResetToastInfo()
  bIsToastShowed = false
  AlreadyDeleteToast = false
  self.InToastDisPlayer = {}
end

function BP_EnergySupply_C:GetDungeonSaveData()
  return {
    StateId = self.StateId,
    NowEnergy = self.NowEnergy,
    BuffNum = self.BuffNum
  }
end

function BP_EnergySupply_C:ActiveMaterialNotify()
end

function BP_EnergySupply_C:ShowInteractedToast(PlayerEid)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:ShowInteractedToast(PlayerEid)
end

function BP_EnergySupply_C:PhantomInteractive(PhantomEid)
  local Phantom = Battle(self):GetEntity(PhantomEid)
  if not Phantom:IsPhantom() or 0 ~= self.NowPlayerEid then
    return
  end
  local Player = Phantom.PhantomOwner
  local NextStateId = self.ChestInteractiveComponent.NextStateId
  local CommonUIConfirmID = self.ChestInteractiveComponent.CommonUIConfirmID
  Player:InteractiveMechanism(self.Eid, PhantomEid, NextStateId, CommonUIConfirmID, false)
end

function BP_EnergySupply_C:PhantomDeInteractive(PhantomEid)
  local Phantom = Battle(self):GetEntity(PhantomEid)
  if not Phantom:IsPhantom() or PhantomEid ~= self.NowPlayerEid then
    return
  end
  local Player = Phantom.PhantomOwner
  self:SetInteractiveCanUsed(false)
  Player:DeInteractiveMechanism(self.Eid, PhantomEid, nil, true, 0, false)
end

AssembleComponents(BP_EnergySupply_C)
return BP_EnergySupply_C
