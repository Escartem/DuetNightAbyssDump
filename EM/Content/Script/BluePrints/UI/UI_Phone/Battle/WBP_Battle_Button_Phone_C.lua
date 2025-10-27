require("Unlua")
local WBP_Battle_Button_Phone = Class("BluePrints.UI.BP_UIState_C")
WBP_Battle_Button_Phone._components = {
  "BluePrints.UI.UIComponent.TouchComponent"
}

function WBP_Battle_Button_Phone:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
end

function WBP_Battle_Button_Phone:Construct()
  self.Super.Construct(self)
  self:InitListenEvent()
end

function WBP_Battle_Button_Phone:Tick(MyGeometry, InDeltaTime)
  self.IsUpdatedSkillInThisTick = false
  self.IsUpdatedOtherInfoInThisTick = false
end

function WBP_Battle_Button_Phone:ForceInit()
  self:OnLoaded()
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self:InitUnlockInfo()
  self:PlayAnim("In")
  self:InitTouchLayer(self.OwnerPlayer, 0, 0)
  self:InitVariable()
  self:GetSkillActiveInfo()
  self.DelayAddTouchLayerTimer = self:AddTimer(0.1, self.DelayAddTouchLayer, true)
end

function WBP_Battle_Button_Phone:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function WBP_Battle_Button_Phone:InitListenEvent()
  self:AddDispatcher(EventID.UpdateMainPlayerSp, self, self.OnUpdateCharSp)
  self:AddDispatcher(EventID.UpdateMainPlayerMaxSp, self, self.OnUpdateMaxSp)
  self:AddDispatcher(EventID.UpdateSkillEfficiency, self, self.OnUpdateSkillEfficiency)
  self:AddDispatcher(EventID.OnSwitchRole, self, self.OnSwitchRole)
  self:AddDispatcher(EventID.OnSwitchPet, self, self.OnSwitchPet)
  self:AddDispatcher(EventID.OnBattlePetInitReady, self, self.OnBattlePetInitReady)
  self:AddDispatcher(EventID.ReloadStart, self, self.TryToEnterReloadState)
  self:AddDispatcher(EventID.OnSelectWeapon, self, self.RefreshWeaponInfo)
  self:AddDispatcher(EventID.OnSwitchWeapon, self, self.RefreshWeaponInfo)
  self:AddDispatcher(EventID.OnMainCharacterInitReady, self, self.RefreshWeaponInfo)
  self:AddDispatcher(EventID.OnRefreshBattleWheelEnableState, self, self.ChangeBattleWheelState)
  self:AddDispatcher(EventID.OnSkillActive, self.Jump, self.Jump.OnSkillActive)
  self:AddDispatcher(EventID.OnSkillInActive, self.Jump, self.Jump.OnSkillInActive)
  self:AddDispatcher(EventID.OnBuffSpModify, self, self.OnUpdateBuffSpModify)
  self:InitTouchListenEvent()
end

function WBP_Battle_Button_Phone:CloseWithoutAnim()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnim("Out")
end

function WBP_Battle_Button_Phone:InitSkillAfterCharInitReady()
  if not IsValid(self) or IsDedicatedServer(self) then
    return
  end
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  self:ForceInit()
  self.SupportSkill:InitSupportSkill()
  self:OnBattlePetInitReady()
  self.Jump:InitSkillInfos()
end

function WBP_Battle_Button_Phone:InitVariable()
  self.Skill.OwnerPanel = self
  self.Skill.CharSkill_1.OwnerPanel = self
  self.Skill.CharSkill_2.OwnerPanel = self
  self.SkillItems = {
    self.Skill.CharSkill_1,
    self.Skill.CharSkill_2
  }
  self.SupportSkill.OwnerPanel = self
  self.Bullet.OwnerPanel = self
  self.Jump.OwnerPanel = self
  self.AtkRanged.OwnerPanel = self
  self.Dodge.OwnerPanel = self
  self.AtkMelee.OwnerPanel = self
  self.Squat.OwnerPanel = self
  self.Squat.OwnerPlayer = self.OwnerPlayer
  self.Battle_Menu.OwnerPanel = self
  self.Dodge.OwnerPanel = self
  self.AimLocked.OwnerPanel = self
  self.SkillButtons = {}
  self.SkillButtons[ESkillName.Attack] = self.AtkMelee
  self.SkillButtons[ESkillName.Jump] = self.Jump
  self.SkillButtons[ESkillName.Slide] = self.Squat
  self.SkillButtons[ESkillName.Skill1] = self.Skill.CharSkill_1
  self.SkillButtons[ESkillName.Skill2] = self.Skill.CharSkill_2
  self.SkillButtons[ESkillName.Skill3] = self.SupportSkill
  self.SkillButtons[ESkillName.Fire] = self.AtkRanged
  self.SkillButtons[ESkillName.ChargeBullet] = self.Bullet
  self.SkillButtons[ESkillName.Avoid] = self.Dodge
  self:AddTimer(0.1, self.UpdateSkillInfoInTimer, true, 0, "UpdateSkillInfoInTimer", false)
  self:AddTimer(0.1, self.UpdateOtherInfoInTimer, true, 0.05, "UpdateOtherInfoInTimer", false)
end

function WBP_Battle_Button_Phone:OnBattlePetInitReady()
  local BattlePet = self.OwnerPlayer:GetBattlePet()
  if not BattlePet or 0 == BattlePet.BattlePetId then
    self:ChangeSkillButtonState(ESkillName.Skill3, "Empty")
    return
  end
  self:ChangeSkillButtonState(ESkillName.Skill3, "UnEmpty")
  self.SupportSkill:RefreshSupportSkillIcon()
end

function WBP_Battle_Button_Phone:DelayAddTouchLayer()
  if self.Jump.Image_Hotspot and not self.IsInitJumpTouch then
    self.IsInitJumpTouch = true
    self:AddStaticSubTouchItem("Jump", self.Jump.Image_Hotspot, {
      Down = self.Jump.ButtonJumpDown,
      Move = self.Jump.ButtonJumpMove,
      Up = self.Jump.ButtonJumpUp
    })
  end
  if self.AtkRanged.Joystick and not self.IsInitAtkTouch then
    self.IsInitAtkTouch = true
    self:AddMovedSubTouchItem("RangedAttack", self.AtkRanged.Joystick, nil, {
      Down = self.AtkRanged.ButtonFireDown,
      Move = self.AtkRanged.ButtonFireMove,
      Up = self.AtkRanged.ButtonFireUp
    }, {
      Type = "Circle",
      Param = {
        Radius = self.AtkRanged.CircleLimitArea,
        NeedReset = false
      },
      TouchTimes = -1,
      NeedResetPos = true
    })
  end
  local BattleMenu = self.Battle_Menu
  if BattleMenu.Bg and not self.IsInitMenuTouch then
    self.IsInitMenuTouch = true
    self:AddStaticSubTouchItem("BattleMenu", BattleMenu.Bg, {
      Down = BattleMenu.BattleMenuDown,
      Move = BattleMenu.BattleMenuMove,
      Up = BattleMenu.BattleMenuUp
    })
  end
  if self.IsInitAtkTouch and self.IsInitJumpTouch and self.IsInitMenuTouch then
    self:RemoveTimer(self.DelayAddTouchLayerTimer)
  end
end

function WBP_Battle_Button_Phone:TryToPlayTargetCommand(KeyName, IsAddInputCache)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  if self.OwnerPlayer:CheckForbidTags(KeyName) then
    return
  end
  if IsAddInputCache then
    self.OwnerPlayer:SetInputCache(KeyName)
  end
  if not self.OwnerPlayer.InitSuccess then
    return
  end
  if "Skill1" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill1", EInputEvent.IE_Pressed)
  elseif "Skill2" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill2", EInputEvent.IE_Pressed)
  elseif "Skill3" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill3", EInputEvent.IE_Pressed)
  elseif "Reload" == KeyName then
    self.OwnerPlayer:ActionCallback("ChargeBullet", EInputEvent.IE_Pressed)
  elseif "Avoid" == KeyName then
    self.OwnerPlayer:ActionCallback("Avoid", EInputEvent.IE_Pressed)
  elseif "Slide" == KeyName then
    self.OwnerPlayer:ActionCallback("Slide", EInputEvent.IE_Pressed)
  elseif "Attack" == KeyName then
    self.OwnerPlayer:ActionCallback("Attack", EInputEvent.IE_Pressed)
  elseif "Fire" == KeyName then
    self.OwnerPlayer:ActionCallback("Fire", EInputEvent.IE_Pressed)
  elseif "Jump" == KeyName then
    self.OwnerPlayer:ActionCallback("Jump", EInputEvent.IE_Pressed)
  end
end

function WBP_Battle_Button_Phone:TryToStopTargetCommand(KeyName, IsClearInputCache)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  if IsClearInputCache then
    self.OwnerPlayer:RemoveInputCache(KeyName)
  end
  if self.OwnerPlayer:CheckForbidTags(KeyName) then
    self.OwnerPlayer:ResetAttackProperty(KeyName)
    return
  end
  if not self.OwnerPlayer.InitSuccess then
    return
  end
  if "Skill1" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill1", EInputEvent.IE_Released)
  elseif "Skill2" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill2", EInputEvent.IE_Released)
  elseif "Skill3" == KeyName then
    self.OwnerPlayer:ActionCallback("Skill3", EInputEvent.IE_Released)
  elseif "Slide" == KeyName then
    self.OwnerPlayer:ActionCallback("Slide", EInputEvent.IE_Released)
  elseif "Attack" == KeyName then
    self.OwnerPlayer:ActionCallback("Attack", EInputEvent.IE_Released)
  elseif "Fire" == KeyName then
    self.OwnerPlayer:ActionCallback("Fire", EInputEvent.IE_Released)
  elseif "Jump" == KeyName then
    self.OwnerPlayer:ActionCallback("Jump", EInputEvent.IE_Released)
  elseif "SwitchCrouch" == KeyName then
    self.OwnerPlayer:ActionCallback("SwitchCrouch", EInputEvent.IE_Released)
  end
end

function WBP_Battle_Button_Phone:GetSkillActiveInfo()
  local PlayerController
  if self.OwnerPlayer and self.OwnerPlayer.GetController then
    PlayerController = self.OwnerPlayer:GetController()
  end
  if PlayerController then
    local len = PlayerController.CurrentInActiveSkills:Length()
    local TempButtons = self.SkillButtons
    for i = 1, len do
      self:ChangeSkillButtonState(PlayerController.CurrentInActiveSkills[i], "Lock")
      TempButtons[PlayerController.CurrentInActiveSkills[i]] = nil
    end
    for Id, _ in pairs(TempButtons) do
      self:ChangeSkillButtonState(Id, "UnLock")
    end
    self:ChangeBattleWheelState(PlayerController.bEnableBattleWheel, PlayerController.bShowBattleWheel)
  end
end

function WBP_Battle_Button_Phone:ChangeBattleWheelState(bEnable, bShow)
  DebugPrint("gmy@WBP_Battle_Button_Phone:ChangeBattleWheelState", bEnable)
  self.Battle_Menu.IsBan = not bEnable
  if not bEnable then
    self.Battle_Menu:PlayAnimationForward(self.Battle_Menu.Ban)
  else
    self.Battle_Menu:PlayAnimationForward(self.Battle_Menu.Normal)
  end
  if self.BattleMenuUnlocked and bShow then
    self.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Button_Phone:ChangeSkillButtonState(SkillName, StateName)
  if "Empty" == StateName then
    if SkillName == ESkillName.Skill1 then
      self.SkillItems[1].CurButtonState = "Empty"
      self.SkillItems[1].Switcher:SetActiveWidgetIndex(1)
      self.SkillItems[1].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif SkillName == ESkillName.Skill2 then
      self.SkillItems[2].CurButtonState = "Empty"
      self.SkillItems[2].Switcher:SetActiveWidgetIndex(1)
      self.SkillItems[2].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill.CurButtonState = "Empty"
      self.SupportSkill.Switcher:SetActiveWidgetIndex(1)
      self.SupportSkill.Bg:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged.CurButtonState = "Empty"
      self.Bullet.CurButtonState = "Empty"
      self.AtkRanged.ImageMat:SetTextureParameterValue("IconState", 0)
      self.Bullet:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif "UnEmpty" == StateName then
    if SkillName == ESkillName.Skill1 then
      self.SkillItems[1].CurButtonState = "Normal"
      self.SkillItems[1].Switcher:SetActiveWidgetIndex(0)
      self.SkillItems[1].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
    elseif SkillName == ESkillName.Skill2 then
      self.SkillItems[2].CurButtonState = "Normal"
      self.SkillItems[2].Switcher:SetActiveWidgetIndex(0)
      self.SkillItems[2].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill.CurButtonState = "Normal"
      self.SupportSkill.Switcher:SetActiveWidgetIndex(0)
      self.SupportSkill.Bg:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.4))
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged.CurButtonState = "Normal"
      self.Bullet.CurButtonState = "Normal"
      self.AtkRanged:UpdateRangeWeaponButton()
      self.Bullet:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  if "UnLock" == StateName then
    if SkillName == ESkillName.Attack then
      self.AtkMelee:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif SkillName == ESkillName.Jump then
      self.Jump:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Jump.CurButtonState = "Active"
    elseif SkillName == ESkillName.Slide then
      self.Squat:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif SkillName == ESkillName.Skill1 then
      self.Skill:PlayAnimationForward(self.Skill.In)
      if self.SkillItems[1].CurButtonState == "Lock_In" then
        self.SkillItems[1].SkillInfo.NeedUnlock = true
      end
    elseif SkillName == ESkillName.Skill2 then
      if self.SkillItems[2].CurButtonState == "Lock_In" then
        self.SkillItems[2].SkillInfo.NeedUnlock = true
      end
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.SupportSkill:PlayAnimationForward(self.SupportSkill.In)
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Bullet:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif SkillName == ESkillName.Avoid then
      self.Dodge:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif "Lock" == StateName then
    if SkillName == ESkillName.Attack then
      self.AtkMelee:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif SkillName == ESkillName.Jump then
      self.Jump:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Jump.CurButtonState = "InActive"
    elseif SkillName == ESkillName.Slide then
      self.Squat:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif SkillName == ESkillName.Skill1 then
      self.SkillItems[1].CurButtonState = "Lock_In"
      self.SkillItems[1]:PlayButtonStateAnimation()
    elseif SkillName == ESkillName.Skill2 then
      self.SkillItems[2].CurButtonState = "Lock_In"
      self.SkillItems[2]:PlayButtonStateAnimation()
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif SkillName == ESkillName.Avoid then
      self.Dodge:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif "Ban" == StateName then
    if SkillName == ESkillName.Attack then
      self.AtkMelee.IsBan = true
      self.AtkMelee:PlayAnimationForward(self.AtkMelee.Ban)
    elseif SkillName == ESkillName.Jump then
      self.Jump:PlayAnimationForward(self.Jump.Ban)
      self.Jump.CurButtonState = "InActive"
    elseif SkillName == ESkillName.Slide then
      self.Squat:PlayAnimationForward(self.Squat.Ban)
    elseif SkillName == ESkillName.Skill1 then
      self.SkillItems[1].CurButtonState = "Ban"
      self.SkillItems[1]:PlayButtonStateAnimation()
    elseif SkillName == ESkillName.Skill2 then
      self.SkillItems[2].CurButtonState = "Ban"
      self.SkillItems[2]:PlayButtonStateAnimation()
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill.CurButtonState = "Ban"
      self.SupportSkill:PlayAnimationForward(self.SupportSkill.Ban)
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged.CurButtonState = "Ban"
      self.AtkRanged:PlayAnimationForward(self.AtkRanged.Ban)
      self.Bullet.CurButtonState = "Ban"
      self.Bullet:PlayButtonStateAnimation()
    elseif SkillName == ESkillName.Avoid then
      self.Dodge:PlayAnimationForward(self.Dodge.Ban)
    end
  elseif "UnBan" == StateName then
    if SkillName == ESkillName.Attack then
      self.AtkMelee.IsBan = false
      self.AtkMelee:PlayAnimationForward(self.AtkMelee.Normal)
    elseif SkillName == ESkillName.Jump then
      self.Jump:PlayAnimationForward(self.Jump.Normal)
      self.Jump.CurButtonState = "Active"
    elseif SkillName == ESkillName.Slide then
      self.Squat:PlayAnimationForward(self.Squat.Normal)
    elseif SkillName == ESkillName.Skill1 then
      self.SkillItems[1].CurButtonState = "Normal"
    elseif SkillName == ESkillName.Skill2 then
      self.SkillItems[2].CurButtonState = "Normal"
    elseif SkillName == ESkillName.Skill3 then
      self.SupportSkill.CurButtonState = "Normal"
      self.SupportSkill:PlayAnimationForward(self.SupportSkill.Normal)
    elseif SkillName == ESkillName.Fire then
      self.AtkRanged:PlayAnimationForward(self.AtkRanged.Normal)
      self.Bullet:PlayAnimationForward(self.Bullet.Normal)
    elseif SkillName == ESkillName.Avoid then
      self.Dodge:PlayAnimationForward(self.Dodge.Normal)
    end
  elseif "Hooking" == StateName or "RegionBan" == StateName then
    if self.SkillButtons[SkillName] then
      self.SkillButtons[SkillName]:SetRenderOpacity(0.5)
    end
  elseif ("EndHooking" == StateName or "RegionUnBan" == StateName) and self.SkillButtons[SkillName] then
    self.SkillButtons[SkillName]:SetRenderOpacity(1)
  end
end

function WBP_Battle_Button_Phone:RefreshWeaponInfo()
  self.Bullet:UpdateBulletType()
  self.Bullet:UpdatePlayerWeaponInfo()
  self.AtkRanged:UpdateWeaponIcon()
end

function WBP_Battle_Button_Phone:RefreshRoleTargetSkill(SkillName)
  if "Skill1" == SkillName then
    self.SkillItems[1]:RefreshButtonStyle()
  elseif "Skill2" == SkillName then
    self.SkillItems[2]:RefreshButtonStyle()
  elseif "Support" == SkillName then
    self.SupportSkill:RefreshButtonStyle()
  end
end

function WBP_Battle_Button_Phone:RefreshRoleSkillButton()
  self.SkillItems[1]:RefreshButtonStyle()
  self.SkillItems[2]:RefreshButtonStyle()
  self.SupportSkill:RefreshButtonStyle()
end

function WBP_Battle_Button_Phone:UpdateSkillInfoInTimer()
  if not self.IsUpdatedSkillInThisTick then
    if IsValid(self.OwnerPlayer) then
      self.Skill:UpdateSkillInTimer()
      self.Squat:UpdateButtonInTimer()
      self.Dodge:UpdateButtonInTimer()
      self.AimLocked:UpdateButtonInTimer()
      self.IsCharacterInFalling = self.OwnerPlayer:CharacterInTag("Falling")
    end
    self.IsUpdatedSkillInThisTick = true
  end
end

function WBP_Battle_Button_Phone:UpdateOtherInfoInTimer()
  if not self.IsUpdatedOtherInfoInThisTick then
    if IsValid(self.OwnerPlayer) then
      self.SupportSkill:UpdateSkillInTimer()
      self.Bullet:UpdateButtonInTimer()
      self.AtkRanged:UpdateButtonInTimer()
    end
    self.IsUpdatedOtherInfoInThisTick = true
  end
end

function WBP_Battle_Button_Phone:OnUpdateCharSp(NowSp, OldSp, Owner)
  self.Skill:OnUpdateCharSp(NowSp, OldSp, Owner)
end

function WBP_Battle_Button_Phone:OnUpdateMaxSp(NewMaxSp)
  self.Skill:OnUpdateMaxSp(NewMaxSp)
end

function WBP_Battle_Button_Phone:OnUpdateSkillEfficiency(Owner)
  for i = 1, 2 do
    self.SkillItems[i]:OnRefreshSkillSpCost(Owner)
  end
end

function WBP_Battle_Button_Phone:OnUpdateBuffSpModify()
  for i = 1, 2 do
    self.SkillItems[i]:OnUpdateBuffSpModify()
  end
end

function WBP_Battle_Button_Phone:OnSwitchRole()
  if self.OwnerPlayer then
    self:OnUpdateCharSp(nil, nil, self.OwnerPlayer)
    self:RefreshRoleSkillButton()
    self:RefreshWeaponInfo()
  end
end

function WBP_Battle_Button_Phone:OnSwitchPet()
  self.SupportSkill:RefreshSupportSkillIcon()
end

function WBP_Battle_Button_Phone:TryToEnterReloadState()
  self.Bullet:TryToEnterReloadState()
end

function WBP_Battle_Button_Phone:ExecuteCheckIsSkillInUsing(Skill)
  if Skill.CombatConditionID then
    local TraceInfo = "From WBP_Battle_Button_Phone:ExecuteCheckIsSkillInUsing"
    return Battle(self):CheckConditionNew(Skill.CombatConditionID, self.OwnerPlayer, nil, TraceInfo)
  end
  return false
end

function WBP_Battle_Button_Phone:InitUnlockInfo()
  local UIUnlockRule = DataMgr.UIUnlockRule
  self:InitButtonUnlockState(UIUnlockRule.BattleWheel.UIUnlockRuleId, function()
    self.BattleMenuUnlocked = true
    self.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  end, function()
    self.BattleMenuUnlocked = false
    self.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end, function()
    self.BattleMenuUnlocked = true
    self.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  end)
  self.Execute:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Battle_Button_Phone:InitButtonUnlockState(UIUnlockRuleId, UnlockingCallback, LockingCallback, FirstTimeUnlockCallback)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if FirstTimeUnlockCallback then
    self.UnlockEvents = self.UnlockEvents or {}
    self.UnlockEvents[UIUnlockRuleId] = Avatar:BindOnUIFirstTimeUnlock(UIUnlockRuleId, FirstTimeUnlockCallback)
  end
  local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
  DebugPrint("gmy@InitButtonUnlockState Unlocked", bUnlocked)
  if bUnlocked then
    if UnlockingCallback then
      UnlockingCallback()
    end
  elseif LockingCallback then
    LockingCallback()
  end
end

function WBP_Battle_Button_Phone:Destruct()
  self.Super.Destruct(self)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if self.UnlockEvents then
    for UIUnlockRuleId, UnlockEventKey in pairs(self.UnlockEvents) do
      Avatar:UnBindOnUIFirstTimeUnlock(UIUnlockRuleId, UnlockEventKey)
    end
  end
  self:RemoveTouchListenEvent()
end

function WBP_Battle_Button_Phone:ShowAtkMeleeForbidTips()
  UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_MELEE_FORBIDDEN"))
end

AssembleComponents(WBP_Battle_Button_Phone)
return WBP_Battle_Button_Phone
