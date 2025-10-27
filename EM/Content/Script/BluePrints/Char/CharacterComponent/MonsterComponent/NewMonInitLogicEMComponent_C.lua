require("UnLua")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:GetDataInfo()
  self.Owner.BattleCharInfo = nil
  local RoleId = self.Owner.CurrentRoleId
  if not RoleId or 0 == RoleId then
    return
  end
  self.Owner.BattleCharInfo = DataMgr.BattleMonster[RoleId]
end

function M:AddEvent_TalkEnableMonsterSpawn()
  EventManager:AddEvent(EventID.TalkEnableMonsterSpawn, self, self.OnTalkEnableMonsterSpawn)
end

function M:OnTalkEnableMonsterSpawn()
  self:SetWaitInitTag(false, Const.CharWaitInitTag.HideInTalk)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
end

function M:TriggerSTLPostStaticCreatorEvent(Mode, Actor)
  Mode:TriggerSTLEvent("STLPostStaticCreatorEvent", Actor)
end

function M:GetData(UnitType, UnitId)
  self.Owner.Data = DataMgr[UnitType][UnitId]
end

function M:HardBossBTRunning(GameMode)
  return GameMode.BossBattleInfo.HardBossBTRunning
end

function M:SyncServerBornInfo()
  self.Owner.ServerBornInfo = self.Owner.BornInfo:ToEffectStruct()
end

function M:CallBPReceiveBeginPlay()
  self.Owner.Overridden.ReceiveBeginPlay(self.Owner)
end

function M:TriggerDungeonComponentFun(GameMode, Name)
  return GameMode:TriggerDungeonComponentFun(Name)
end

function M:AddGMBuff(GameMode, Value)
  for _, BuffId in pairs(GameMode.GMMonsterBuff) do
    Battle(self):AddBuffToTarget(self.Owner, self.Owner, BuffId, -1, Value, nil)
  end
end

function M:CacheBornInfo()
  if not self.Owner.BornInfo then
    self.Owner.BornInfo = EffectResults.Result()
  end
end

function M:GetAirWallStaticId()
  local GameMode = UE4.UGameplayStatics.GetGameMode(Owner)
  return GameMode.BossBattleInfo.AirWallStaticId
end

function M:AddRoleSkillByContext(Context)
  local SkillInfos = Context:GetLuaTable("SkillInfos")
  local SkillInitInfo = TArray(FSkillInitInfo)
  if SkillInfos and next(SkillInfos) then
    for _, SkillInfo in ipairs(SkillInfos) do
      local SkillInitItem = FSkillInitInfo()
      SkillInitItem.SkillId = SkillInfo.SkillId
      SkillInitItem.SkillLevel = SkillInfo.SkillInfo.Level or 1
      SkillInitItem.SkillGrade = SkillInfo.SkillInfo.Grade or 0
      SkillInitInfo:Add(SkillInitItem)
    end
  end
  self.Owner:AddRoleSkill(self.Owner.CurrentRoleId, SkillInitInfo)
end

function M:TryPlayBirthMontage_Lua(BirthMontagePath)
  local MontageTime = self.Owner:PlayMontageByPath(BirthMontagePath)
  self.Owner:AddDelayFrameFunc(function()
    self.Owner:SetMeshVisibilityBasedAnimTickOption(EVisibilityBasedAnimTickOption.AlwaysTickPose)
    self.Owner:SetActorHideTag("Birth", false)
  end, 5)
  return MontageTime
end

function M:InitBossBillBoard(IsBossInPart, BossUIType)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self.Owner)
  local UIManager = GameInstance:GetGameUIManager()
  if BossUIType == EBossUIType.None then
    if UIManager:GetUIObj("BossBlood") then
      UIManager:UnLoadUI("BossBlood")
    end
    self.Owner.BossBloodUI = UIManager:LoadUINew("BossBlood", self.Owner, IsBossInPart, BossUIType)
  else
    local DoubleBossUI = UIManager:GetUIObj("DoubleBossBlood") or UIManager:LoadUINew("DoubleBossBlood")
    if DoubleBossUI then
      if BossUIType == EBossUIType.Left then
        self.Owner.BossBloodUI = DoubleBossUI.Boss_1
      else
        self.Owner.BossBloodUI = DoubleBossUI.Boss_2
      end
      DoubleBossUI:ActiveBossUI()
      self.Owner.BossBloodUI:InitBossUI(self.Owner, IsBossInPart, BossUIType)
    end
  end
  self.Owner.BillboardComponent.IsInit = true
  self.Owner.BillboardComponent.Owner = self.Owner
end

function M:OnCharacterReady_SpecialTakeRecord()
  self.Owner:AddInteractiveTrigger()
  self.Owner:SetInteractiveTriggerDistance(self.Owner:GetAttr("DropDistance"))
  local Controller = self.Owner:GetController()
  Controller:ForbidWeapon()
end

function M:EnterPoolSetDataInfo()
  local Owner = self.Owner
  Owner.Data = DataMgr.Monster[Owner.UnitId]
  Owner.BattleCharInfo = nil
  local RoleId = Owner.CurrentRoleId
  if not RoleId or 0 == RoleId then
    return
  end
  Owner.BattleCharInfo = DataMgr.BattleMonster[RoleId]
end

return M
