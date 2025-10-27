require("UnLua")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local MonsterUtils = require("Utils.MonsterUtils")
local CommonUtils = require("Utils.CommonUtils")
local EMCache = require("EMCache.EMCache")
local BloodBarUtils = require("BluePrints.UI.BloodBar.BloodBarUtils")
local Const = require("Const")
local WBP_MainBar_C = Class("BluePrints.UI.BP_UIState_C")
UE4.UMainBar.SetIsShowMonsterName(EMCache:Get("ShowMonsterName") or false)
UE4.UMainBar.SetIsForbidenShowBloodUI(false)

function WBP_MainBar_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_MainBar_C:InitConfig_Lua(IsMainPlayer, ActorOwner)
  rawset(self, "Owner", ActorOwner)
  self.IsDestroied = nil
  if IsMainPlayer then
    self:AddDispatcher(EventID.OnCharGradeLevelUp, self, self.OnCharGradeLevelUp)
    self:AddDispatcher(EventID.CharDie, self, self.CharDie)
    self:AddDispatcher(EventID.CharRecover, self, self.CharRecovery)
    self:AddDispatcher(EventID.RefreshMainPlayerBlood, self, self.Reinitialize)
    self:AddDispatcher(EventID.OnCharLevelUpInBattle, self, self.OnUpdateCharLevelAndExp)
    self:AddDispatcher(EventID.OnUpdateCharExp, self, self.OnUpdateCharLevelAndExp)
    self:AddDispatcher(EventID.OnShowMainPlayerHealEvent, self, self.OnShowMainPlayerHealEvent)
    self:AddDispatcher(EventID.ChangeRole, self, self.CheckChangeRole)
    self:AddTimer(1.0, self.CheckMaxHpAndShieldChange, true, 0, "CheckMaxHpAndShieldChange")
    self:AddTimer(1.0, function()
      self:AddDispatcher(EventID.OnMainCharacterInitReady, self, self.CharRecovery)
    end, false, 0, "DelayDispatcherMainCharacterInitReady")
    self.IsPlayingReturning = false
  else
    self:RegisterEventsNormal()
  end
  self:UpdateCharBuffUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self.SceneMgrComponent = GameInstance:GetSceneManager()
  self:SetName()
end

function WBP_MainBar_C:Reinit_Lua(ActorOwner)
  rawset(self, "Owner", ActorOwner)
  self:RegisterEventsNormal()
end

function WBP_MainBar_C:Construct()
  WBP_MainBar_C.Super.Construct(self)
  if self.Icon_Agree then
    self.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_MainBar_C:SetInTeam()
  self.Group_FrontSpace:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Lv:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_MainBar_C:SetLevelText_Lua()
  self.Lv:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.Lv:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_MainBar_C:WhileInvisibleMonsterBeAttack(Eid, NowTimeSeconds)
  if IsValid(self.SceneMgrComponent) then
    self.SceneMgrComponent.SpecialMonsterInfo[Eid] = {NowTimeSeconds}
  end
end

function WBP_MainBar_C:RegisterEventsNormal()
  if (self.Owner:IsMonster() or self.Owner:IsCombatItemBase() or self.Owner:IsNPC() or self.Owner:IsMechanismSummon()) and self.bIsDangerEnemy then
    self:AddDispatcher(EventID.MainPlayerLevelUp, self, self.OnMainPlayerLevelUp)
  end
end

function WBP_MainBar_C:OnMainPlayerLevelUp(MainPlayerNowLevel)
  if not IsValid(self.Owner) then
    return
  end
  if self.bIsDangerEnemy then
    local NowLevel = self.Owner:GetAttr("Level")
    if NowLevel - MainPlayerNowLevel < 10 then
      self:SetLevelText(NowLevel)
      self:RemoveDispatcher(EventID.MainPlayerLevelUp)
    end
  end
end

function WBP_MainBar_C:CheckIsReduceDelay(DamageEvent)
  local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if DamageEvent.SkillId then
    local SkillInfo = DataMgr.Skill[DamageEvent.SkillId]
    if SkillInfo and SkillInfo[1] then
      local SkillGradeInfo = SkillInfo[1][0]
      if SkillGradeInfo then
        local SkillType = SkillGradeInfo.SkillType
        if "Attack" == SkillType then
          self.LastAttackTime = NowTime
        end
      end
    end
  end
end

function WBP_MainBar_C:Reinitialize()
  self:InitValue(self.Owner)
  self:OnUpdateCharLevelAndExp()
  self.HpBar:ReInit()
  if self.ShieldBar then
    self.ShieldBar:ReInit()
  elseif self.MaxShield > 0 then
    self:CheckAndLoadShieldBar()
  end
  if self.MaxShield > 0 and self.ShieldBar then
    local CurOverShiledPercent = self.CurOverShield / self.MaxShield
    self.ShieldBar:SetOverShieldPercent(CurOverShiledPercent)
    self:CheckAndPlayOvershield()
    self:SetOverShieldNum_Player()
  end
  local CurBloodPercent = math.clamp(self.CurHp / self.MaxHp, 0, 1)
  local CurShieldPercent = 0 == self.MaxShield and 0 or math.clamp(self.CurShield / self.MaxShield, 0, 1)
  self.HpBar:SetBarPercent(CurBloodPercent)
  if self.ShieldBar then
    self.ShieldBar:SetBarPercent(CurShieldPercent)
    if self.MaxShield <= 0 then
      self.ShieldBar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.ShieldBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self:SetBloodNum_Player()
  self:SetShieldNum_Player()
  
  local function SetColor()
    self:CheckAndPlayLowHealth()
    self.HpBar:SetBarColor(false)
  end
  
  SetColor()
  self:InitLastingEffect()
end

function WBP_MainBar_C:CharRecovery(Eid)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager and UIManager:GetArmoryUIObj() then
    return
  end
  self:Reinitialize()
  self:PlayAnimation(self.InAnimation)
end

function WBP_MainBar_C:OnUpdateCharLevelAndExp()
  if not IsValid(self.Owner) then
    return
  end
  local NowLevel = self.Owner:GetAttr("Level")
  self.Lv:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.Num_Lv_elite:SetText(NowLevel)
  if self.OldLevel and NowLevel > self.OldLevel and self.Owner:IsMainPlayer() then
    EventManager:FireEvent(EventID.MainPlayerLevelUp, NowLevel)
  end
  self.OldLevel = NowLevel
end

function WBP_MainBar_C:OnMainCharacterInitReady()
  if not IsValid(self.Owner) then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    self.Owner = Player
  end
  self:RealInit(self.Owner, self.OwnerType or "", self.StyleNodeName or "")
  self:AddTimer(1.0, self.CheckMaxHpAndShieldChange, true, 0, "CheckMaxHpAndShieldChange")
end

function WBP_MainBar_C:CheckMaxHpAndShieldChange()
  if self:IsVisible() == false or not IsValid(self.Owner) then
    return
  end
  local NowMaxHp = self.Owner:GetAttr("MaxHp")
  local NowMaxShield = self.Owner:GetAttr("MaxES")
  if self.MaxHp ~= NowMaxHp or self.MaxShield ~= NowMaxShield then
    self:Reinitialize()
  end
end

function WBP_MainBar_C:OnShowMainPlayerHealEvent(HealEvent)
  if self.IsCharInHotUI then
    self:UpdateCharHotUIState(true)
    return
  end
  local IsHaveHot = false
  if HealEvent.DamageTag then
    for key, value in pairs(HealEvent.DamageTag) do
      if "Hot" == value then
        IsHaveHot = true
      end
    end
  end
  if not IsHaveHot then
    EMUIAnimationSubsystem:EMPlayAnimation(self.PlayerBloodReturn, self.PlayerBloodReturn.Player_BloodReturn)
  end
end

function WBP_MainBar_C:UpdateCharHotUIState(HotUI)
  self.IsCharInHotUI = HotUI
  if HotUI then
    self:StartReturing()
  elseif self.IsPlayingReturning then
    self:StopReturning()
  end
end

function WBP_MainBar_C:StartReturing()
  if not self.PlayerBloodReturn or self.IsPlayingReturning then
    return
  end
  EMUIAnimationSubsystem:EMStopAnimation(self.PlayerBloodReturn, self.PlayerBloodReturn.Player_BloodReturnEnd)
  EMUIAnimationSubsystem:EMPlayAnimation(self.PlayerBloodReturn, self.PlayerBloodReturn.Player_BloodReturning)
  self.IsPlayingReturning = true
end

function WBP_MainBar_C:StopReturning()
  if not self.PlayerBloodReturn or not self.IsPlayingReturning then
    return
  end
  EMUIAnimationSubsystem:EMStopAnimation(self.PlayerBloodReturn, self.PlayerBloodReturn.Player_BloodReturning)
  EMUIAnimationSubsystem:EMPlayAnimation(self.PlayerBloodReturn, self.PlayerBloodReturn.Player_BloodReturnEnd)
  self.IsPlayingReturning = false
end

function WBP_MainBar_C:CheckChangeRole()
  if not self.Owner:IsPlayer() then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  local NewRoleId = Player.CurrentRoleId
  if self.RoleId ~= NewRoleId and 0 ~= NewRoleId then
    self.Owner = Player
    self.OwnerEid = Player.Eid
    self.RoleId = Player.CurrentRoleId
    self:Reinitialize()
    self:PlayAnimation(self.InAnimation)
  end
end

function WBP_MainBar_C:CheckIsEnemyToPlayer(Owner)
  if Owner then
    rawset(self, "Owner", Owner)
  end
  local OwnerCamp = self.Owner:GetCamp()
  if OwnerCamp == ECampName.None or not OwnerCamp then
    if self.Owner:IsPlayer() then
      return false
    end
    if DataMgr[self.Owner.UnitType] then
      OwnerCamp = DataMgr[self.Owner.UnitType][self.Owner.UnitId].Camp
    else
      return true
    end
  end
  return DataMgr.CampRule[OwnerCamp].Player == Const.Enemy
end

function WBP_MainBar_C:SetName()
  DebugPrint("WBP_MainBar_C:SetName 1", self.MonsterName, self.bIsShowName, self.Owner:GetName())
  if not self.MonsterName then
    return
  end
  self.MonsterName:SetVisibility(ESlateVisibility.Collapsed)
  if not self.bIsShowName then
    return
  end
  local Data = self.Owner.Data
  if not Data or not Data.UnitName then
    self.bIsShowName = false
    DebugPrint("WBP_MainBar_C:SetName return because not Data or Data.UnitName", Data)
    return
  end
  local Name
  if self.Owner:IsPhantom() then
    Name = DataMgr.BattleChar[self.RoleId].CharName
  else
    Name = Data.UnitName
  end
  if not Name then
    DebugPrint("WBP_MainBar_C:SetName return because not Name", self.Owner:GetName())
    self.bIsShowName = false
    return
  end
  DebugPrint("WBP_MainBar_C:SetName", Name, GText(Name))
  self.MonsterName:SetText(GText(Name))
  self.MonsterName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_MainBar_C:GetLastingEffectColorMap()
  return self.LastingEffectColorMap
end

function WBP_MainBar_C:Destruct()
  WBP_MainBar_C.Super.Destruct(self)
  self.IsDestroied = true
end

return WBP_MainBar_C
