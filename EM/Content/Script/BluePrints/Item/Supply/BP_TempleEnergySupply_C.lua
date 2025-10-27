require("UnLua")
local BP_TempleEnergySupply_C = Class({
  "BluePrints.Item.Supply.BP_SupplyBase_C",
  "BluePrints.Combat.Components.EffectSourceInterface"
})
local bIsToastShowed = false
local WaitToShowToastTime = DataMgr.GlobalConstant.SurvivalProToastTime.ConstantValue
local ToastTime = 15
local ShowToastDistance = DataMgr.GlobalConstant.SurvivalProRadius.ConstantValue
local ToastTimerName = "RealShowToast"
local AlreadyDeleteToast = false
BP_TempleEnergySupply_C._components = {
  "BluePrints.Item.Components.RecoverEnergy"
}

function BP_TempleEnergySupply_C:AuthorityInitInfo(Info)
  BP_TempleEnergySupply_C.Super.AuthorityInitInfo(self, Info)
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
  self.HasAllEnergyGuideClose = {}
  self.HasEnergyGuideClose = {}
end

function BP_TempleEnergySupply_C:CommonInitInfo(Info)
  BP_TempleEnergySupply_C.Super.CommonInitInfo(self, Info)
  self.InteractiveType = Const.PressInteractive
  self.NowEnergy = self.EnergyLimit
  self.MaxEnergy = self.EnergyLimit
  self.LiquidFXNum = 0
  self.BuffNum = 0
  self.BuffFXNum = 0
  self.BuffFXIds = {
    900014,
    900015,
    900016,
    900019,
    900017,
    900018
  }
  self.BuffFX = {}
  self.GuideRadius = DataMgr.GlobalConstant.SurvivalProGuideRadius.ConstantValue or 500
  self.SurvivalValueChange = DataMgr.GlobalConstant.SurvivalValueChange.ConstantValue
  self.ChestInteractiveComponent.DisPlayInteractiveName = GText(self.ChestInteractiveComponent.InteractiveName)
  self.Target = {}
  self.InToastDisPlayer = {}
  self.BuffId = self.UnitParams.BuffId
  self.bActiveMontage = false
end

function BP_TempleEnergySupply_C:ClientInitInfo(Info)
  BP_TempleEnergySupply_C.Super.ClientInitInfo(self, Info)
  DebugPrint("ADD TIMER FindTarget_Client", self:GetName())
  self:AddTimer(0.1, BP_TempleEnergySupply_C.FindTarget_Client, true)
end

function BP_TempleEnergySupply_C:OnActorReady(Info)
  BP_TempleEnergySupply_C.Super.OnActorReady(self, Info)
  if IsAuthority(self) then
    self:StartRecover()
  end
  self:OnFxObjectFinished()
  for i, v in pairs(self.BuffFXIds) do
    self.FXComponent:PlayEffectByID(v)
  end
end

function BP_TempleEnergySupply_C:ReceiveEndPlay(Reason)
  self.Overridden.ReceiveEndPlay(self, Reason)
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, self)
  EventManager:RemoveEvent(EventID.OnEndSkillFeature, self)
  self:ResetToastInfo()
end

function BP_TempleEnergySupply_C:OnEMActorDestroy(...)
  BP_TempleEnergySupply_C.Super.OnEMActorDestroy(self, ...)
  print(_G.LogTag, "LXZ OnEMActorDestroy", self:GetName(), self._RegisterOnCharacterDead)
  if self._RegisterOnCharacterDead then
    Battle(self):UnregisterBattleEvent(BattleEventName.OnAfterDead, self, "_OnCharacterDead")
  end
end

function BP_TempleEnergySupply_C:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    print(_G.LogTag, "GameState is nil")
    return
  end
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_TempleEnergySupply_C:OpenMechanism(PlayerActorEid)
  if IsClient(self) then
    return
  end
  if nil == PlayerActorEid or nil == self or not self.CanOpen then
    return
  end
  if self.IsEnergyInteractive then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    self.NowPlayerEid = PlayerActorEid
    self:ClientPlayAnim(PlayerActorEid, 0, self.Eid)
  end
  self.IsEnergyInteractive = true
  if nil == self.EToSHandle then
    self.FXNum = 0
    self.EToSHandle = self:AddTimer(0.1, self.EnergyToSurvival, true)
  end
  self:OnOpenMechanism()
end

function BP_TempleEnergySupply_C:CloseMechanism(Eid, IsSuccess)
  if IsAuthority(self) and Eid == self.NowPlayerEid then
    local Player = Battle(self):GetEntity(self.NowPlayerEid)
    Player.OnInteractiveDelegate:Add(self, self.ChangeToNormalState)
    self:ClientPlayAnim(Eid, 2, self.Eid)
    self:RemoveTimer(self.EToSHandle)
    self:RemoveTimer("EnergySupplyInteractedToast")
    self.EToSHandle = nil
    self.NowPlayerEid = 0
    self.IsEnergyInteractive = false
    self:OnCloseMechanism()
  end
  AudioManager(self):SetEventSoundParam(self, "EnergySupplyOpen", {ToEnd = 1})
end

function BP_TempleEnergySupply_C:ForceCloseMechanism(Eid, IsSuccess)
  print(_G.LogTag, "LXZ ForceCloseMechanism", Eid, self.NowPlayerEid)
  if IsAuthority(self) and Eid == self.NowPlayerEid then
    local Player = Battle(self):GetEntity(self.NowPlayerEid)
    Player.OnInteractiveDelegate:Add(self, self.ChangeToNormalState)
    self:ClientPlayAnim(Eid, 2, self.Eid)
    self:RemoveTimer(self.EToSHandle)
    self:RemoveTimer("EnergySupplyInteractedToast")
    self.EToSHandle = nil
    self.NowPlayerEid = 0
    self.IsEnergyInteractive = false
  end
  AudioManager(self):SetEventSoundParam(self, "EnergySupplyOpen", {ToEnd = 1})
end

function BP_TempleEnergySupply_C:ChangeToNormalState(Player)
  if IsAuthority(self) then
    self.DefaultInteractiveComponent.bCanUsed = false
    self:ChangeState("InteractDone", Player.Eid)
    Player.OnInteractiveDelegate:Remove(self, self.ChangeToNormalState)
  end
end

function BP_TempleEnergySupply_C:SetInteractiveCanUsed(value)
end

function BP_TempleEnergySupply_C:PlayAnim(PlayerId, InteractiveState, MechanismEid)
  local PlayerCharacter = Battle(self):GetEntity(PlayerId)
  if 0 == InteractiveState then
    self.ChestInteractiveComponent:OnStartInteractive(PlayerCharacter, self.ChestInteractiveComponent.MontageName, MechanismEid)
    if IsClient(self) then
      PlayerCharacter:SetCharacterTag("Interactive")
    end
    if not IsValid(self.InteractiveFXObjext) or not self.InteractiveFXObjext:IsActive() then
      self.InteractiveFXObjext = self.FXComponent:PlayEffectByID(900012)
    end
    self:OnInteracrive(PlayerId)
  end
  if 1 == InteractiveState then
  end
  if 2 == InteractiveState then
    self.DefaultInteractiveComponent.bCanUsed = false
    self.ChestInteractiveComponent:OnEndInteractive(PlayerCharacter, self.ChestInteractiveComponent.MontageName, MechanismEid)
    if IsValid(self.InteractiveFXObjext) then
      self.InteractiveFXObjext:Deactivate()
      self.InteractiveFXObjext = nil
    end
  end
end

function BP_TempleEnergySupply_C:OnBuffNumChange()
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

function BP_TempleEnergySupply_C:FindTarget()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local FindPlayer = false
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    local Dis = self:CalDistance(Player)
    if Dis <= self.Radius and self:CheckInSameLevel(Player) then
      FindPlayer = true
      if not self.HasAllEnergyGuideClose[Player.Eid] then
        local IgnoreSelf = TArray(0)
        if Dis >= self.GuideRadius then
          IgnoreSelf:Add(self.Eid)
        end
        self:DeactiveAllGuide(IgnoreSelf, Player.Eid)
        self.HasAllEnergyGuideClose[Player.Eid] = true
      elseif Dis >= self.GuideRadius and (self.HasEnergyGuideClose[Player.Eid] or self.HasEnergyGuideClose[Player.Eid] == nil) then
        self:ActiveGuide("Add", Player.Eid)
        self.HasEnergyGuideClose[Player.Eid] = false
      elseif Dis < self.GuideRadius and not self.HasEnergyGuideClose[Player.Eid] then
        self:DeactiveGuide(Player.Eid)
        self.HasEnergyGuideClose[Player.Eid] = true
      end
    elseif self.HasAllEnergyGuideClose[Player.Eid] then
      self:ActiveAllGuide(nil, Player.Eid)
      self.HasAllEnergyGuideClose[Player.Eid] = false
    end
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

function BP_TempleEnergySupply_C:StartRecover()
  self.RecoverHandle = self:AddTimer(1, BP_TempleEnergySupply_C.AutoRecover, true)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    if self.HasAllEnergyGuideClose[Player.Eid] or self.HasAllEnergyGuideClose[Player.Eid] == nil then
      self:ActiveAllGuide(nil, Player.Eid)
      self.HasAllEnergyGuideClose[Player.Eid] = false
    end
  end
  self.BuffHandle = self:AddTimer(0.1, BP_TempleEnergySupply_C.FindTarget, true)
end

function BP_TempleEnergySupply_C:AutoRecover()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local bFindPlayer = false
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    local Dis = self:CalDistance(Player)
    if Dis <= self.Radius and self:CheckInSameLevel(Player) then
      bFindPlayer = true
      if not self.bActiveMontage then
        self.bActiveMontage = true
        self:TriggerBluePrintEvent("PlayActiveMontage")
      end
      self:ChangeEnergy(self.RecoverEnergy, false)
      break
    end
  end
  if not bFindPlayer and self.bActiveMontage then
    self.bActiveMontage = false
    self:TriggerBluePrintEvent("PlayStopMontage")
  end
end

function BP_TempleEnergySupply_C:OutRecover_Lua(Monster)
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
  if Dis < self.Radius and self:CheckInSameLevel(Monster) then
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
end

function BP_TempleEnergySupply_C:EnergyToSurvival()
  if not self.IsEnergyInteractive then
    return
  end
  local RealChangeVal = math.min(self.SurvivalValueChange / 10, self.NowEnergy)
  self:ChangeEnergy(-RealChangeVal, false)
  self:OnEnergyDown()
  self.FXNum = self.FXNum + 1
end

function BP_TempleEnergySupply_C:OnForceEndInteractive_Lua(SurvivalValue, MaxSurvivalValue)
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

function BP_TempleEnergySupply_C:ChangeEnergy_Lua(ChangeValue, bFromMonster)
  self.NowEnergy = self.NowEnergy + ChangeValue
  self.NowEnergy = math.min(self.NowEnergy, self.MaxEnergy)
  self.NowEnergy = math.max(self.NowEnergy, 0)
  self.EnergyChangeFromMonster = bFromMonster
  if (IsStandAlone(self) or not IsAuthority(self)) and ChangeValue < 0 then
    self:OnEnergyDown()
  end
end

function BP_TempleEnergySupply_C:PlayActiveMontage()
  local AnimInstance = self.Mesh:GetAnimInstance()
  local Montage = AnimInstance:GetCurrentActiveMontage()
  if Montage and AnimInstance:Montage_GetCurrentSection(Montage) == "StopIdle" then
    AnimInstance:Montage_JumpToSection("Start", Montage)
    self.ActiveFX = self.FXComponent:PlayEffectByID(900013)
  elseif not Montage then
    self:PlayMontage(self.Mesh, self.MontagePath, "Start", nil, true)
    self.ActiveFX = self.FXComponent:PlayEffectByID(900013)
  end
end

function BP_TempleEnergySupply_C:PlayStopMontage()
  local AnimInstance = self.Mesh:GetAnimInstance()
  local Montage = AnimInstance:GetCurrentActiveMontage()
  local SectionName = AnimInstance:Montage_GetCurrentSection(Montage)
  if Montage and "Stop" ~= SectionName and "StopIdle" ~= SectionName then
    AnimInstance:Montage_JumpToSection("Stop", Montage)
  end
end

function BP_TempleEnergySupply_C:CalDistance(Player)
  local PlayerX = Player:K2_GetActorLocation().X
  local PlayerY = Player:K2_GetActorLocation().Y
  local SelfX = self:K2_GetActorLocation().X
  local SelfY = self:K2_GetActorLocation().Y
  local x = PlayerX - SelfX
  local y = PlayerY - SelfY
  return math.sqrt(x * x + y * y)
end

function BP_TempleEnergySupply_C:OnRep_NowEnergy()
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

function BP_TempleEnergySupply_C:CheckInSameLevel(Actor)
  local ActorLevelId = self:CheckActorLevel(Actor)
  local SupplyLevelId = self:CheckActorLevel(self)
  return -1 ~= ActorLevelId and ActorLevelId == SupplyLevelId
end

function BP_TempleEnergySupply_C:CheckActorLevel(Actor)
  local LevelLoader = UE4.UGameplayStatics.GetGameInstance(self):GetSceneManager():GetLevelLoader()
  if not LevelLoader then
    return true
  end
  return LevelLoader:GetLevelId(Actor)
end

function BP_TempleEnergySupply_C:OnFxObjectCreated(FxObject)
  FxObject.OnSystemFinished:Add(self, self.OnFxObjectFinished)
end

function BP_TempleEnergySupply_C:OnStartSkillFeature(IsHideAllUI)
end

function BP_TempleEnergySupply_C:OnEndSkillFeature(IsHideAllUI)
end

function BP_TempleEnergySupply_C:CheckPlayerInShowToastDis(Dis, PlayerEid)
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

function BP_TempleEnergySupply_C:RealShowToast()
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

function BP_TempleEnergySupply_C:OnInteracrive(PlayerId)
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

function BP_TempleEnergySupply_C:ResetToastInfo()
  bIsToastShowed = false
  AlreadyDeleteToast = false
  self.InToastDisPlayer = {}
end

function BP_TempleEnergySupply_C:GetDungeonSaveData()
  return {
    StateId = self.StateId,
    NowEnergy = self.NowEnergy,
    BuffNum = self.BuffNum
  }
end

function BP_TempleEnergySupply_C:ActiveMaterialNotify()
end

function BP_TempleEnergySupply_C:ShowInteractedToast(PlayerEid)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:ShowInteractedToast(PlayerEid)
end

AssembleComponents(BP_TempleEnergySupply_C)
return BP_TempleEnergySupply_C
