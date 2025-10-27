require("UnLua")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local EMCache = require("EMCache.EMCache")
local BP_CharBillboard_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_CharBillboard_C:Initialize(Initializer)
  self.Owner = nil
end

function BP_CharBillboard_C:ShowBillboard(TalkGameInput)
  if TalkGameInput then
    return
  end
  self:SetVisibility(true)
end

function BP_CharBillboard_C:HideBillboard(TalkGameInput)
  if TalkGameInput then
    return
  end
  self:SetVisibility(false)
end

function BP_CharBillboard_C:GetCurrentWidget()
  if not self.CurrentWidget then
    self.CurrentWidget = self:GetUserWidgetObject()
  end
  return self.CurrentWidget
end

function BP_CharBillboard_C:RefreshDiffInfoByAction_Lua()
  if not self.Owner then
    self.Owner = self:GetOwner()
  end
  if self.TypeStr == "BossPlace" then
    self:RefreshBossPlaceBlood()
  elseif self.Owner and (self.bNeedUpdateBossUI or self.Owner:IsBossMonster()) then
    local BossBillboard = self.Owner.BossBloodUI
    if BossBillboard and BossBillboard.UpdateBossBlood then
      BossBillboard:UpdateBossBlood("Attack")
    end
  end
end

function BP_CharBillboard_C:RefreshBossPlaceBlood(ActionName)
  local CurrentWidget = self:GetUserWidgetObject()
  if nil == CurrentWidget then
    return
  end
  CurrentWidget:UpdateBossPlaceBlood()
end

function BP_CharBillboard_C:RefreshPlayerBillBoard(PlayerActor)
  local CurrentWidget = self:GetUserWidgetObject()
  if nil == CurrentWidget then
    return
  end
end

function BP_CharBillboard_C:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.StartTalk, self, self.HideBillboard)
  EventManager:AddEvent(EventID.EndTalk, self, self.ShowBillboard)
  self.IsDestroied = nil
end

function BP_CharBillboard_C:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.StartTalk, self)
  EventManager:RemoveEvent(EventID.EndTalk, self)
  self.IsDestroied = true
  if IsValid(self.Owner) then
    UIManager(self):RemoveWidgetComponentToList(self.Owner.Eid, "Billboard")
  end
end

function BP_CharBillboard_C:InitMonsterBillBoard_Lua(Owner)
  self.Owner = Owner
end

function BP_CharBillboard_C:AICharacter_AfterWidgetLoad_Lua()
  if self.Owner == nil then
    self.Owner = self:GetOwner()
  end
  if IsValid(self.Owner) then
    UIManager(self):AddWidgetComponentToList(self.Owner.Eid, "Billboard", self)
  end
  self:SetBuffPanelVisibilityByConfig()
end

function BP_CharBillboard_C:RefreshMonsterInfoByAction_Lua()
  if self.Owner:IsPhantom() and self.Owner.TeammateUI then
    self.Owner.TeammateUI:UpdateBar()
  end
end

function BP_CharBillboard_C:InitPlayerBillBoard(Owner, TypeStr)
  self.Owner = Owner
  self.TypeStr = TypeStr
  EventManager:RemoveEvent(EventID.StartTalk, self)
  EventManager:RemoveEvent(EventID.EndTalk, self)
end

function BP_CharBillboard_C:InitItemsBillBoard(Owner, TypeStr, StyleNodeName, IsSync)
  self:UnregisterListenerOnBuffsChanged()
  self.Owner = Owner
  self:K2_SetBuffsOwner(Owner)
  self:RegisterListenerOnBuffsChanged()
  self.TypeStr = TypeStr
  self.StyleNodeName = self:GetOwnerStyleNodeName() or "Blood_Shield"
  local Path = self:GetPathByStyleNodeName(self.StyleNodeName)
  
  local function AfterLoad()
    if not IsSync then
      if self:GetUserWidgetObject() ~= nil then
        return
      end
      local WorldContext = GWorld.GameInstance
      self:SetWidgetAfterAsyncLoad(WorldContext, Path)
    end
    local CurrentWidget = self:GetUserWidgetObject()
    local BloodUIParmas = self.Owner.Data.BloodUIParmas
    if not IsValid(self.Owner) or nil == CurrentWidget then
      return
    end
    self.IsInit = true
    local Height = 150
    if self.Owner.Box then
      Height = self.Owner.Box:GetScaledBoxExtent().Z * 1.15
    end
    if self.Owner.CapsuleComponent then
      Height = self.Owner.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 1.15
    end
    if self.Owner.HitedCollision and self.Owner.HitedCollision.GetUnscaledCapsuleHalfHeight then
      Height = self.Owner.HitedCollision:GetUnscaledCapsuleHalfHeight()
    end
    CurrentWidget:InitConfig(self.Owner, "BreakableItems", self.StyleNodeName)
    self:SetItemBillboardLocation(Height, self.Owner.Data.UnitId or 0)
    if BloodUIParmas and BloodUIParmas.ShowLevel == false and CurrentWidget.bIsShowLevel and CurrentWidget.SetLevelText then
      CurrentWidget.bIsShowLevel = false
      CurrentWidget:SetLevelText(0)
    end
    self:AutoFitShieldAndBloodSize(false)
    if IsValid(self.Owner) then
      UIManager(self):AddWidgetComponentToList(self.Owner.Eid, "Billboard", self)
    end
  end
  
  if IsSync then
    self:SetWidgetClassByBpPath(Path)
    AfterLoad()
  else
    local WorldContext = GWorld.GameInstance
    self:SetWidgetClassByPathAsync(WorldContext, Path, {self, AfterLoad})
  end
end

function BP_CharBillboard_C:RefreshItemsInfoByAction(ActionName)
  if not IsValid(self.Owner) then
    return
  end
  local CurrentWidget = self:GetUserWidgetObject()
  if nil == CurrentWidget then
    return
  end
  self.LastAttackTimeStamp = UE4.UGameplayStatics.GetTimeSeconds(self)
  self:ResetForceShowState()
  self:AutoFitShieldAndBloodSize()
  if not self:IsExistTimer("UpdateCharBillboardInfo") then
    self:AddTimer(1.0, self.UpdateCharBillboardInfo, true, 0, "UpdateCharBillboardInfo")
  end
end

function BP_CharBillboard_C:InitBossPlaceBillBoard(Owner, TypeStr, IsSync)
  self.Owner = Owner
  self.TypeStr = TypeStr
  local Path = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/WBP_Battle_BossPlaceBar.WBP_Battle_BossPlaceBar_C'"
  
  local function AfterLoad()
    if not IsSync then
      if self:GetUserWidgetObject() ~= nil then
        return
      end
      local WorldContext = GWorld.GameInstance
      self:SetWidgetAfterAsyncLoad(WorldContext, Path)
    end
    local CurrentWidget = self:GetUserWidgetObject()
    if nil == CurrentWidget then
      return
    end
    self.IsInit = true
    local Location = self.Owner.JumpWordLocSocket:GetRelativeTransform().Translation
    self:K2_SetRelativeLocation(Location, false, nil, false)
    CurrentWidget:InitBossPlaceBlood(self.Owner)
    if IsValid(self.Owner) then
      UIManager(self):AddWidgetComponentToList(self.Owner.Eid, "Billboard", self)
    end
  end
  
  if IsSync then
    self:SetWidgetClassByBpPath(Path)
    AfterLoad()
  else
    local WorldContext = GWorld.GameInstance
    self:SetWidgetClassByPathAsync(WorldContext, Path, {self, AfterLoad})
  end
end

function BP_CharBillboard_C:CharOnRecovery()
  if self:IsPhantom() then
  end
end

function BP_CharBillboard_C:PhantomOnDead()
  if self.Owner and self.Owner:IsPhantom() then
    if self.Owner.TeammateUI then
      self.Owner.TeammateUI:OnDead()
    end
    self:RealCharOnDead()
  end
end

function BP_CharBillboard_C:GetCharOwner()
  return self.Owner
end

function BP_CharBillboard_C:IsBillboardShow()
  local CurrentWidget = self:GetUserWidgetObject()
  if nil == CurrentWidget or nil == self.StyleNodeName then
    return false
  end
  return CurrentWidget:CheckIsShowByType(self.StyleNodeName)
end

function BP_CharBillboard_C:TryToShowOrHideBillBoardByShoot_Lua(IsShow)
  local CurrentWidget = self:GetUserWidgetObject()
  if not (nil ~= CurrentWidget and IsValid(self.Owner)) or nil == self.StyleNodeName or self.TypeStr == "BossPlace" then
    return
  end
  if self.Owner.IsDead and self.Owner:IsDead() or not GMVariable.EnableShowBillboard then
    return
  end
  self.IsNotForceShow = not IsShow
  if IsShow then
    local Animation = CurrentWidget.ShowProgressBar or CurrentWidget.InAnimation
    if not CurrentWidget:CheckIsShowByType(self.StyleNodeName) and not CurrentWidget:IsAnimationPlaying(Animation) then
      CurrentWidget:PlayAnimationForward(Animation)
      CurrentWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if self.IsExistTimer("ResetForceShowState") then
      self:RemoveTimer("ResetForceShowState")
    end
    if self.Owner.BlockTickLod_MoveComp then
      self.Owner:BlockTickLod_MoveComp(true, Const.BlockTickLodTag.CharBillboard)
    end
    self:AddTimer(0.3, self.ResetForceShowState, false, 0, "ResetForceShowState")
  else
    local Animation = CurrentWidget.out or CurrentWidget.OutAnimation
    if CurrentWidget:CheckIsShowByType(self.StyleNodeName) and not CurrentWidget:IsAnimationPlaying(Animation) then
      CurrentWidget:PlayAnimationForward(Animation)
    end
  end
end

function BP_CharBillboard_C:GetOwnerType()
  return self.TypeStr
end

function BP_CharBillboard_C:RefreshInvincibleState(Invincible)
  if not IsValid(self.Owner) then
    return
  end
  local CurrentWidget = self:GetCurrentWidget()
  if nil ~= CurrentWidget and CurrentWidget.RefreshInvincibleState then
    CurrentWidget:RefreshInvincibleState()
  end
end

function BP_CharBillboard_C:SetBuffPanelVisibilityByConfig()
  local CurrentWidget = self:GetUserWidgetObject()
  if not CurrentWidget then
    return
  end
  local Config_ShowBuffEnemy = EMCache:Get("ShowBuffEnemy")
  local Config_ShowBuffFriend = EMCache:Get("ShowBuffFriend")
  if nil == Config_ShowBuffEnemy then
    Config_ShowBuffEnemy = true
  end
  if nil == Config_ShowBuffFriend then
    Config_ShowBuffFriend = true
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not self.Owner or not PlayerCharacter then
    return
  end
  local IsEnemy = self.Owner:IsEnemy(PlayerCharacter)
  local IsFriend = self.Owner:IsFriend(PlayerCharacter)
  if not Config_ShowBuffEnemy and IsEnemy or not Config_ShowBuffFriend and IsFriend then
    CurrentWidget:SetCharBuffUIVisibility(false)
  else
    CurrentWidget:SetCharBuffUIVisibility(true)
  end
end

function BP_CharBillboard_C:BuffChange_SpecialEffect(HotUI, Invisible, InvincibleUI)
  if not IsValid(self.Owner) then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if self.Owner:IsMainPlayer() and UIManager then
    local BattleMainUI = UIManager:GetUI("BattleMain")
    if BattleMainUI and BattleMainUI.PlayerBloodBar then
      BattleMainUI.PlayerBloodBar:UpdateCharHotUIState(HotUI)
      BattleMainUI.PlayerBloodBar:BuffSpecialEffect_InvincibleUI(InvincibleUI)
    end
  end
  if self.Owner.IsHostage and UIManager:GetUIObj("DungeonRescueFloat") then
    UIManager:GetUIObj("DungeonRescueFloat"):SetInvincibility(InvincibleUI)
  end
  local CurrentWidget = self:GetCurrentWidget()
  if not CurrentWidget then
    return
  end
  if CurrentWidget.RefreshInvisibleState then
    CurrentWidget:RefreshInvisibleState(Invisible)
  end
  if CurrentWidget.BuffSpecialEffect_InvincibleUI then
    CurrentWidget:BuffSpecialEffect_InvincibleUI(InvincibleUI)
  end
  if self.Owner.TeammateUI then
    self.Owner.TeammateUI:BuffSpecialEffect_InvincibleUI(CurrentWidget.bIsInvincibleNow)
    self.Owner.TeammateUI:UpdateCharHotUIState(HotUI)
  end
end

function BP_CharBillboard_C:BuffSpecialEffect_InvincibleUI(IsShow)
  if not IsValid(self.Owner) then
    return
  end
  if not self.Owner:IsPhantom() and not self.Owner:IsPlayer() then
    return
  end
  local UIManager = UIManager(self)
  if not UIManager then
    return
  end
  local CurrentWidget = self:GetUserWidgetObject()
  if CurrentWidget and CurrentWidget.BuffSpecialEffect_InvincibleUI then
    CurrentWidget:BuffSpecialEffect_InvincibleUI(IsShow)
  end
  if self.Owner:IsMainPlayer() then
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if BattleMain and BattleMain.PlayerBloodBar then
      BattleMain.PlayerBloodBar:BuffSpecialEffect_InvincibleUI(IsShow)
    end
  end
  if self.Owner.TeammateUI then
    self.Owner.TeammateUI:BuffSpecialEffect_InvincibleUI(IsShow)
  end
end

function BP_CharBillboard_C:OnBuffChange_Weakness()
  local CurrentWidget = self:GetCurrentWidget()
  if CurrentWidget and CurrentWidget.RefreshWeaknessIcons then
    CurrentWidget:RefreshWeaknessIcons()
  end
end

function BP_CharBillboard_C:OnBuffChange_LockHp(bIsLock, Value, Percent)
  if not self.Owner then
    return
  end
  local UIManager = UIManager(self)
  if not UIManager then
    return
  end
  if self.Owner:IsBossMonster() then
    local BossBloodUI = self.Owner.BossBloodUI
    if BossBloodUI then
      BossBloodUI:SetBossLockHpState(bIsLock, Value, Percent)
    end
    return
  end
  local CurrentWidget = self:GetCurrentWidget()
  if self.Owner:IsMainPlayer() then
    CurrentWidget = UIManager:GetUIObj("BattleMain").PlayerBloodBar
  end
  if not CurrentWidget then
    return
  end
  if CurrentWidget.SetLockHpBuff then
    CurrentWidget:SetLockHpBuff(bIsLock, Value, Percent)
  end
  if self.Owner.TeammateUI then
    self.Owner.TeammateUI:SetInvincible(CurrentWidget.bIsInvincibleNow)
  end
end

function BP_CharBillboard_C:GetOwnerStyleNodeName()
  if not IsValid(self.Owner) then
    return
  end
  if self.Owner.Data and self.Owner.Data.BloodUIParmas and self.Owner.Data.BloodUIParmas.UIStyleNodeName then
    return self.Owner.Data.BloodUIParmas.UIStyleNodeName
  end
end

return BP_CharBillboard_C
