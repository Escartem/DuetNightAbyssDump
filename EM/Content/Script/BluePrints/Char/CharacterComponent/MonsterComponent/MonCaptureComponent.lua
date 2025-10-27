local MiscUtils = require("Utils.MiscUtils")
local Component = {}

function Component:InitInteractiveComponentImpl()
  self.bIsInCapture = false
  if self:HasAnyTags_Table(self, {
    "Mon.Capture"
  }, false) then
    self:AddInteractive()
    EventManager:AddEvent(EventID.OnGameStateTimerAdded, self, self.OnTimerBegin)
    EventManager:AddEvent(EventID.OnGameStateTimerEnded, self, self.OnTimerEnded)
    self.CanOpen = false
    self.OpenState = false
    self.InteractiveType = Const.PressInteractive
    local CaptureParam = DataMgr.Monster[self.UnitId].CaptureParam
    self.InteractiveComponent:InitInteractiveComponent(CaptureParam.ParamId)
    self.InteractiveComponent.InteractiveTime = CaptureParam.InteractiveTime or 3
    self.InteractiveComponent.InterruptPlayer = not not CaptureParam.Interrupt or true
    self.PlayerFXParam = {
      Id = DataMgr.VFX_CommonSet[1].EffectId[3],
      Param = DataMgr.VFX_CommonSet[1].EffectParam[3]
    }
    self.MonsterFXParam = {
      Id = DataMgr.VFX_CommonSet[1].EffectId[1],
      Param = DataMgr.VFX_CommonSet[1].EffectParam[1]
    }
    self.FinishFXParam = {
      Id = DataMgr.VFX_CommonSet[1].EffectId[2],
      Param = DataMgr.VFX_CommonSet[1].EffectParam[2]
    }
    self.bTimerStart = false
    self.bTimerEnded = false
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local IsMonsterWaitForCapture = GameState.IsMonsterWaitForCapture
    if IsMonsterWaitForCapture or self:IsMonWaitForCaught() then
      self:SetMonWaitForCaughtTag()
      self:SetMonWaitForCaught(true)
    else
      Battle(self):CaptureMonsterStandUp(self.Eid)
    end
    if IsAuthority(self) then
      self:InitFirstSeenLogic()
    end
  end
end

function Component:OnTimerBegin(TimerHandleName)
  if "CaptureLimitTimer" ~= TimerHandleName then
    return
  end
  self.bTimerStart = true
  self.bTimerEnded = false
end

function Component:OnTimerEnded(TimerHandleName)
  if "CaptureLimitTimer" ~= TimerHandleName then
    return
  end
  self.bTimerEnded = true
end

function Component:OpenMechanism(PlayerId)
  if not self:IsCaptureMonster() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.bIsInCapture = true
  self:PlayAnimOnInteractive(PlayerId, 0)
  self:MonsterCaptureStart(PlayerId)
  GameMode:PauseTimer("CaptureLimitTimer", true)
  GameMode:TriggerDungeonComponentFun("PauseCaptureRecoveryTimer")
  if self.InteractiveComponent.InteractiveParam.AutoRotate then
    local Player = Battle(self):GetEntity(PlayerId)
    Player:RotateToInteractiveTarget(self.Eid)
  end
end

function Component:CloseMechanism(PlayerId, IsSuccess)
  if not self:IsCaptureMonster() or self.CapturePlayer == nil then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.bIsInCapture = false
  if IsSuccess then
    self:PlayAnimOnInteractive(PlayerId, 1)
  else
    self:PlayAnimOnInteractive(PlayerId, 2)
  end
  GameMode:UnPauseTimer("CaptureLimitTimer")
  GameMode:TriggerDungeonComponentFun("UnPauseCaptureRecoveryTimer")
  if IsSuccess then
    print(_G.LogTag, "Lxz  Success Catch the Monster ", self:GetName())
    self:CaptureSuccess(PlayerId)
  else
    print(_G.LogTag, "Lxz  Fail Catch the Monster ", self:GetName())
    self:CaptureFail(PlayerId)
    self:MonsterCaptureFailed(PlayerId)
  end
end

function Component:ForceCloseMechanism(PlayerId, IsSuccess)
  self:CloseMechanism(PlayerId, false)
end

function Component:GetCanCapture(PlayerId)
  if not self:IsCaptureMonster() then
    return false
  end
  if self.CapturePlayer and self.CapturePlayer.Eid ~= PlayerId then
    return false
  end
  if self.bTimerStart and self.bTimerEnded then
    return false
  end
  if self.AutoSyncProp.CharacterTag == "WaitForCaught" or self:IsMonWaitForCaught() then
    return true
  else
    return false
  end
end

function Component:CaptureSuccess(PlayerId)
  self:MonsterCaptureEnd(PlayerId)
  Battle(self):CaptureMonsterSuccess(self.Eid, self.Eid, 0, EDeathReason.Capture)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:RemoveDungeonEvent("CaptureMonsterRecovery")
  end
  if 2 == self:GetLocalRole() then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    if nil == UIManger then
      return
    end
    local DungeonCaptureFloat = UIManger:GetUIObj("DungeonCaptureFloat")
    if nil == DungeonCaptureFloat then
      return
    end
    DungeonCaptureFloat:AddMessageTimer()
  end
end

function Component:CaptureFail()
end

function Component:SetMonWaitForCaughtTag()
  self:SetCharacterTag("WaitForCaught")
  local MontageFolder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if MontageFolder then
    local Path = MontageFolder .. "Combat/Hit/" .. MontagePrefix .. "WaitForCaught_Montage"
    self:PlayMontageByPath(Path)
  end
end

function Component:WaitForCapture()
  self:SetMonWaitForCaughtTag()
  self:SetMonWaitForCaught(true)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerDungeonComponentFun("OnMonsterWaitForCapture", self)
    GameMode:TriggerGameModeEvent("OnCaptureTargetDead", self)
  end
  if IsClient(self) or IsStandAlone(self) then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local SceneMgrComponent = GameInstance:GetSceneManager()
    if IsValid(SceneMgrComponent) then
      SceneMgrComponent:ReplaceGuideIcon(self.Eid, self, "GuidePointMechLevel2", nil)
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      if not UIManager then
        return
      end
      local DungeonCapture = UIManager:GetUIObj("DungeonCaptureFloat")
      if DungeonCapture then
        DungeonCapture:AfterGuideIconReplaced(self.Eid)
      end
    end
  end
end

function Component:CaptureMonsterSuccess(KillMineRoleEid, KillMineSkillId, DeathReason)
  self:SetMonWaitForCaught(false)
  self:SetCharacterTag("CaptureSuccess")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:RemoveGuideEid(self.Eid)
    GameMode:TriggerGameModeEvent("OnCaptureTargetCatched", self)
    GameMode:TriggerDungeonComponentFun("OnCaptureSuccess")
  end
  local CaptureParam = self.Data.CaptureParam
  local DeathDelayTime = CaptureParam and (CaptureParam.DeathDelayTime or 0) or 0
  self:AddTimer_Combat(DeathDelayTime, self.OnDead, false, 0, "HideCaptureMonster", KillMineRoleEid, KillMineSkillId, DeathReason)
end

function Component:MonsterWaitForCapture(KillMineRoleEid, KillMineSkillId, DeathReason)
  self:WaitForCapture()
  self:StopSkill()
  self:HandleDestroyCreature()
  self:HandleRemoveBuff()
  self:ClearSummons(false)
  local KillMineRole = Battle(self):GetEntity(KillMineRoleEid)
  local DamageCauserLocation = KillMineRole and KillMineRole:K2_GetActorLocation()
  self:SetVector("DamageCauserLocation", DamageCauserLocation)
  self.Overridden.MonsterWaitForCapture(self, KillMineRoleEid, KillMineSkillId, DeathReason)
end

function Component:ForceDestroyAccessories()
  local Accessories = self:GetAccessories()
  if not Accessories then
    return
  end
  for _, Accessory in ipairs(MiscUtils.Values(Accessories)) do
    if Accessory then
      Accessory:K2_DestroyActor()
    end
  end
  Accessories:Clear()
end

function Component:ClientPlayAnimOnInteractive(PlayerEid, InteractiveState)
  if 0 == InteractiveState then
    self.CapturePlayer = Battle(self):GetEntity(PlayerEid)
    if not IsAuthority(self) or IsStandAlone(self) then
      if self.PlayerFXParam and self.PlayerFXParam.Id then
        if self.PlayerFXParam.Param and self.PlayerFXParam.Param.IsAttached == false then
          self.PlayerFXObject = self.CapturePlayer.FXComponent:PlayEffectByIDParams(self.PlayerFXParam.Id, {NotAttached = true})
        else
          self.PlayerFXObject = self.CapturePlayer.FXComponent:PlayEffectByIDParams(self.PlayerFXParam.Id)
        end
      end
      if self.MonsterFXParam and self.MonsterFXParam.Id then
        if self.MonsterFXParam.Param and false == self.MonsterFXParam.Param.IsAttached then
          self.MonsterFXObject = self.FXComponent:PlayEffectByIDParams(self.MonsterFXParam.Id, {NotAttached = true})
        else
          self.MonsterFXObject = self.FXComponent:PlayEffectByIDParams(self.MonsterFXParam.Id)
        end
      end
    end
    self.InteractiveComponent:OnStartInteractive(Battle(self):GetEntity(PlayerEid), self.InteractiveComponent.MontageName)
  end
  if 1 == InteractiveState then
    self.CapturePlayer = nil
    if not IsAuthority(self) or IsStandAlone(self) then
      if self.PlayerFXObject and self.PlayerFXParam.Param.IsAttached ~= false then
        self.PlayerFXObject:SetVisibility(false, false)
      end
      if self.FinishFXParam and self.FinishFXParam.Id then
        if self.FinishFXParam.Param and false == self.FinishFXParam.Param.IsAttached then
          self.FXComponent:PlayEffectByIDParams(self.FinishFXParam.Id, {NotAttached = true})
        else
          self.FXComponent:PlayEffectByIDParams(self.FinishFXParam.Id)
        end
      end
    end
    self.InteractiveComponent:OnEndInteractive(Battle(self):GetEntity(PlayerEid), self.InteractiveComponent.MontageName)
  end
  if 2 == InteractiveState then
    self.CapturePlayer = nil
    if not IsAuthority(self) or IsStandAlone(self) then
      if self.PlayerFXObject and self.PlayerFXParam.Param.IsAttached ~= false then
        self.PlayerFXObject:SetVisibility(false, false)
      end
      if self.MonsterFXObject then
        self.MonsterFXObject:SetVisibility(false, false)
        self.MonsterFXObject:K2_DestroyComponent(self.MonsterFXObject)
      end
      if self.FinishFXParam and self.FinishFXParam.Id then
        if self.FinishFXParam.Param and false == self.FinishFXParam.Param.IsAttached then
          self.FXComponent:PlayEffectByIDParams(self.FinishFXParam.Id, {NotAttached = true})
        else
          self.FXComponent:PlayEffectByIDParams(self.FinishFXParam.Id)
        end
      end
    end
    self.InteractiveComponent:OnEndInteractive(Battle(self):GetEntity(PlayerEid), self.InteractiveComponent.MontageName)
  end
end

function Component:IsInCapture()
  return self.bIsInCapture
end

function Component:CaptureMonsterRecover()
  if IsAuthority(self) then
    self:SetAttr("Hp", self:GetAttr("MaxHp"))
    self:CalcHpPercent()
    self:SetAttr("ES", self:GetAttr("MaxES"))
    self:SetAttr("Sp", self:GetAttr("InitSp"))
  end
  self:SetDead(false, nil, nil, nil)
end

function Component:InitFirstSeenLogic()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:GetDungeonComponent() then
    return
  end
  if GameMode:GetDungeonComponent().IsFirstSeen == nil then
    return
  end
  if GameMode:GetDungeonComponent().IsFirstSeen then
    return
  end
  self:AddTimer(1, self.CheckFirstSeen, true, 0, "CheckCaptureMonFirstSeen")
end

function Component:CheckFirstSeen()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Distance = 999999
  local threshold = GameMode:GetDungeonComponent().CaptureTargetFirstSeenDistance or 0
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    if IsValid(Player) then
      Distance = self:GetDistanceTo(Player)
      if threshold > Distance then
        GameMode:TriggerGameModeEvent("OnCaptureTargetFirstSeen")
        GameMode:GetDungeonComponent().IsFirstSeen = true
        self:RemoveTimer("CheckCaptureMonFirstSeen")
        return
      end
    end
  end
end

return Component
