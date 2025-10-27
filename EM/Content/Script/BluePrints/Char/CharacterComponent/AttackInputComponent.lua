local SkillUtils = require("Utils.SkillUtils")
local Component = {}
local CanCheckShootTag = {
  Idle = 1,
  Crouch = 1,
  Falling = 1
}

function Component:CheckHasHoldingShooting()
  local HeavyShootingSkill = self:GetSkillByType(UE.ESkillType.HeavyShooting)
  return self.bHoldingShooting and self.CurrentSkillId ~= HeavyShootingSkill
end

function Component:CheckHasHoldingShootingSkill()
  local HeavyShootingSkill = self:GetSkillByType(UE.ESkillType.HeavyShooting)
  return HeavyShootingSkill and self.bPressedFire
end

function Component:PressSkill3()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local UIUnlockRule = DataMgr.UIUnlockRule
    local UIUnlockRuleId = UIUnlockRule.PetSkill.UIUnlockRuleId
    local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
    if not bUnlocked then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, UIUnlockRule.PetSkill.UIUnlockDesc)
      return
    end
  end
  if self:CheckSkillIsBan(ESkillName.Skill3) then
    local _ = not self.CurrentMasterBan and UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_SKILL_FORBIDDEN"))
    return
  end
  if self:CheckForbidInput() or self:CheckSkillInActive(ESkillName.Skill3) then
    return
  end
  self:SupportSkill()
  if self.NeedSkill3Event then
    EventManager:FireEvent(EventID.OnSkill3Pressed)
  end
end

function Component:CheckChangeRoleInMainCityNotInCdTime()
  local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  if self.SupportUseTimeStamp == nil then
    self.SupportUseTimeStamp = NowTime
    return true
  end
  local IsCanUse = NowTime - self.SupportUseTimeStamp >= 1
  if IsCanUse then
    self.SupportUseTimeStamp = NowTime
  end
  return IsCanUse
end

function Component:SupportSkill()
  local SupportSKill = self:GetSkillByType(UE.ESkillType.Support)
  if nil == SupportSKill then
    return false
  end
  Battle(self):TriggerBattleEvent(BattleEventName.BeforeSupportSkill, self)
  local Success = self:UseSkill(SupportSKill, 0)
  if Success then
    self:RemoveInputCache("Support")
    local BattlePet = self:GetBattlePet()
    if BattlePet and 0 ~= BattlePet.BattlePetId then
      BattlePet:OnBattlePetUseSkill()
    end
    Battle(self):TriggerBattleEvent(BattleEventName.AfterSupportSkill, self)
  end
end

function Component:Reload()
  if self.NeedChargeBulletEvent then
    EventManager:FireEvent(EventID.OnChargeBulletPressed)
  end
  local ReloadSkillId = self:GetSkillByType(UE.ESkillType.Reload)
  if nil == ReloadSkillId then
    return false
  end
  if not self:CheckCanSkillCancel(ReloadSkillId) and self:CheckForbidInput() then
    return
  end
  if self:CheckSkillIsBan(ESkillName.Fire) then
    local _ = not self.CurrentMasterBan and UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    return
  end
  if not self:CheckCanShoot(true) or self:CheckSkillInActive(ESkillName.Fire) then
    return
  end
  local ReloadSkill = self:GetSkill(ReloadSkillId)
  if not ReloadSkill then
    return
  end
  local FireSkillId = self:GetSkillByType(UE.ESkillType.Shooting)
  local FireSkill = self:GetSkill(FireSkillId)
  if FireSkill and FireSkill.Weapon ~= ReloadSkill.Weapon then
    return
  end
  local IsInShoot = self.CurrentSkillId == FireSkillId
  local IsCrouchng = self.PlayerAnimInstance and not self.PlayerAnimInstance.IsCrouching
  if not IsInShoot and IsCrouchng then
    self.CanReloadWithoutShoot = true
  end
  local Success = self:UseSkill(ReloadSkillId, 0)
  self.CanReloadWithoutShoot = false
  if Success then
    self:RemoveInputCache("Reload")
  end
end

function Component:IsSkillDown()
  return self.bPressedAttack or self.bPressedFire or self.bPressedSkill1 or self.bPressedSkill2
end

function Component:InputCacheUseHoldAttackSkill()
  local HoldAttackSkill = self:GetSkillByType(UE.ESkillType.HeavyAttack)
  if nil == HoldAttackSkill then
    self:RemoveInputCache("AttackHold")
    return
  end
  local Success = self:UseSkill(HoldAttackSkill, 0)
  if Success then
    self:RemoveInputCache("AttackHold")
  end
end

function Component:CheckCanUseFallAttack()
  if not self:CharacterInTag("Falling") and not self.IsInAir then
    return false
  end
  if self:CharacterInTag("Slide") and not self.SlideInAir then
    return false
  end
  if self:GetMovementComponent() and self:GetMovementComponent().bCheatFlying then
    return false
  end
  if self.PlayerAnimInstance.CurrentJumpState == Const.BulletJump then
    PrintTable({
      "\229\173\144\229\188\185\232\183\179\229\191\133\228\184\139\232\144\189\230\148\187\229\135\187"
    })
    return true
  end
  local StartPos = self:K2_GetActorLocation()
  local HalfHeight = self.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  StartPos = FVector(StartPos.X, StartPos.Y, StartPos.Z - HalfHeight)
  local TraceLength = 100
  local EndPos = FVector(StartPos.X, StartPos.Y, StartPos.Z - TraceLength)
  local HitResult = FHitResult()
  local bHit = UE4.UKismetSystemLibrary.SphereTraceSingle(self, StartPos, EndPos, self.CapsuleComponent:GetUnscaledCapsuleRadius(), ETraceTypeQuery.TraceScene, false, TArray(AActor), 0, HitResult, true)
  return not bHit
end

function Component:PressSkill1()
  local NormalSKill = self:GetSkillByType(UE.ESkillType.Skill1)
  if not NormalSKill then
    self:RemoveInputCache("Skill1")
    return
  end
  if self:CheckSkillIsBan(ESkillName.Skill1) then
    local _ = not self.CurrentMasterBan and UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_SKILL_FORBIDDEN"))
    self:RemoveInputCache("Skill1")
    return
  end
  if not self:CheckCanSkillCancel(NormalSKill) and self:CheckForbidInput() or self:CheckSkillInActive(ESkillName.Skill1) then
    self:RemoveInputCache("Skill1")
    return
  end
  self:PressSkill(NormalSKill, "Skill1")
  if self.NeedSkill1Event then
    EventManager:FireEvent(EventID.OnSkill1Pressed)
  end
end

function Component:PressSkill2()
  local UltraSKill = self:GetSkillByType(UE.ESkillType.Skill2)
  if not UltraSKill then
    self:RemoveInputCache("Skill2")
    return
  end
  if self:CheckSkillIsBan(ESkillName.Skill2) and not self.CurrentMasterBan then
    local _ = not self.CurrentMasterBan and UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_SKILL_FORBIDDEN"))
    self:RemoveInputCache("Skill2")
    return
  end
  if not self:CheckCanSkillCancel(UltraSKill) and self:CheckForbidInput() or self:CheckSkillInActive(ESkillName.Skill2) then
    self:RemoveInputCache("Skill2")
    return
  end
  self:PressSkill(UltraSKill, "Skill2")
  if self.NeedSkill2Event then
    EventManager:FireEvent(EventID.OnSkill2Pressed)
  end
end

function Component:InputCacheUseHoldSkill(SkillId, SkillName)
  if not SkillId then
    self:RemoveInputCache(SkillName .. "Hold")
    return
  end
  local Skill = self:GetSkill(SkillId)
  if not Skill or 0 == Skill.LongPressSkill then
    self:RemoveInputCache(SkillName .. "Hold")
    return
  end
  local Success = self:UseSkill(Skill.LongPressSkill, 0)
  if Success then
    self:RemoveInputCache(SkillName .. "Hold")
  end
end

function Component:ReleaseSkill1()
  local NormalSKill = self:GetSkillByType(UE.ESkillType.Skill1)
  if not NormalSKill then
    self:ResetAttackProperty("Skill1")
    return
  end
  if not self:CheckCanSkillCancel(NormalSKill) and self:CheckForbidInput() or self:CheckSkillInActive(ESkillName.Skill1) then
    self:ResetAttackProperty("Skill1")
    return
  end
  local Skill = self:GetSkill(NormalSKill)
  self:ReleaseSkill(NormalSKill, "Skill1")
end

function Component:ReleaseSkill2()
  local UltraSKill = self:GetSkillByType(UE.ESkillType.Skill2)
  if not UltraSKill then
    self:ResetAttackProperty("Skill2")
    return
  end
  if not self:CheckCanSkillCancel(UltraSKill) and self:CheckForbidInput() or self:CheckSkillInActive(ESkillName.Skill2) then
    self:ResetAttackProperty("Skill2")
    return
  end
  local Skill = self:GetSkill(UltraSKill)
  self:ReleaseSkill(UltraSKill, "Skill2")
end

function Component:InputCacheUseSkill(SkillId, SkillName)
  if not SkillId or not self:CheckCanSkillCancel(SkillId) and self:CheckForbidInput() or self:CheckSkillInActive(ESkillName[SkillName]) then
    self:RemoveInputCache(SkillName)
    return
  end
  local Success = self:UseSkill(SkillId, 0)
  if Success then
    self:RemoveInputCache(SkillName)
  end
end

function Component:UsePenalizeSkill(Eid)
  self.CondemnMonsterEid = Eid
  local Success = self:UseSkill(self:GetSkillByType(UE.ESkillType.Condemn), 0)
  return Success
end

local InputInfoTemplate = {
  ReMappingActionName = "",
  OriginKeyState = EInputEvent.IE_Released,
  Init = function(self, ReMappingActionName, OriginKeyState, MappedKeyState)
    self.ReMappingActionName = ReMappingActionName
    self.OriginKeyState = OriginKeyState or EInputEvent.IE_Released
  end
}

function Component:AttackToFire()
  self:CombindTwoKeyToOneCommand("Attack", "Fire")
end

function Component:AttackToNormal()
  self:SeparateTwoKeyToOneCommand("Attack", "Fire")
  self:ReleaseFire()
end

function Component:InitReplaceGamepadSet(KeySet)
  self.BattleMapping:Clear()
  self.SystemMapping:Clear()
  self.BattleInputMappingKey:Clear()
  self.SystemInputMappingKey:Clear()
  self.StopListenWhenPressUseSkill:Clear()
  self.StopListenWhenReleaseUseSkill:Clear()
  self.InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionMappings = self.InputSetting.ActionMappings:ToTable()
  local GamepadSet = DataMgr.GamepadMap
  for _, UserData in ipairs(ActionMappings) do
    if UserData.ActionName == "GamepadUseSkill" then
      self.GamepadUseSkillKey = UserData.Key
    end
    if UserData.ActionName == "GamepadOpenSystem" then
      self.GamepadOpenSystemKey = UserData.Key
    end
    if string.find(UserData.Key.KeyName, "Gamepad") then
      DebugPrint("@zyh222", UserData.ActionName, UserData.Key.KeyName)
    end
  end
  for ActionName, ActionData in pairs(GamepadSet) do
    if ActionData.BattleInput and ActionData.BattleInput[KeySet] then
      self.BattleMapping:Add(ActionData.BattleInput[KeySet], ActionName)
      for _, UserData in ipairs(ActionMappings) do
        local Res = string.find(UserData.Key.KeyName, "Gamepad")
        if (UserData.ActionName == ActionData.BattleInput[KeySet] or UserData.ActionName == ActionData.ActionName) and Res then
          DebugPrint("@zyh ReplaceUseSkill", UserData.ActionName, UserData.Key.KeyName)
          self.BattleInputMappingKey:Add(ActionData.BattleInput[KeySet], UserData)
        end
      end
    end
  end
  for ActionName, ActionData in pairs(GamepadSet) do
    if ActionData.SystemInput and ActionData.SystemInput[KeySet] then
      self.SystemMapping:Add(ActionData.SystemInput[KeySet], ActionName)
      for _, UserData in ipairs(ActionMappings) do
        local Res = string.find(UserData.Key.KeyName, "Gamepad")
        if UserData.ActionName == ActionData.SystemInput[KeySet] and Res then
          DebugPrint("@zyh ReplaceOpenSystem", UserData.ActionName, UserData.Key.KeyName)
          self.SystemInputMappingKey:Add(ActionData.SystemInput[KeySet], UserData)
        end
      end
    end
  end
end

function Component:InitGamepadSet(KeySet)
  local NameMapping = {}
  local CurrentKeyMapping = {}
  self.ActionToGamepadIcon = {}
  self.InputSetting = UE4.UInputSettings.GetInputSettings()
  if not self.InputSetting then
    DebugPrint("@@zyh \232\142\183\229\143\150InputSetting\229\164\177\232\180\165")
    return
  end
  local ActionMappings = self.InputSetting.ActionMappings:ToTable()
  local GamepadSet = DataMgr.GamepadMap
  for _, UserData in ipairs(ActionMappings) do
    local ActionName = UserData.ActionName
    if GamepadSet[ActionName] and GamepadSet[ActionName].GamepadKey and GamepadSet[ActionName].GamepadKey[KeySet] then
      local KeyName = "Gamepad_" .. GamepadSet[ActionName].GamepadKey[KeySet]
      if string.find(UserData.Key.KeyName, "Gamepad") and UserData.Key.KeyName ~= KeyName then
        self.InputSetting:RemoveActionMapping(UserData)
      end
      local NewKey = UE4.EKeys[KeyName]
      UserData.Key = NewKey
      self.InputSetting:AddActionMapping(UserData)
    elseif GamepadSet[ActionName] and (not GamepadSet[ActionName].GamepadKey or not GamepadSet[ActionName].GamepadKey[KeySet]) and string.find(UserData.Key.KeyName, "Gamepad") then
      self.InputSetting:RemoveActionMapping(UserData)
    end
  end
  ActionMappings = self.InputSetting.ActionMappings:ToTable()
  for ActionName, ActionData in pairs(GamepadSet) do
    if ActionData.GamepadKey and ActionData.GamepadKey[KeySet] then
      NameMapping[ActionName] = "Gamepad_" .. ActionData.GamepadKey[KeySet]
      for _, UserData in ipairs(ActionMappings) do
        local Res = string.find(UserData.Key.KeyName, "Gamepad")
        if UserData.ActionName == ActionName and Res then
          if not CurrentKeyMapping[ActionName] then
            CurrentKeyMapping[ActionName] = {UserData}
          else
            table.insert(CurrentKeyMapping[ActionName], UserData)
          end
        end
      end
    end
  end
  for ActionName, KeyName in pairs(NameMapping) do
    if CurrentKeyMapping[ActionName] then
      for _, UserData in ipairs(CurrentKeyMapping[ActionName]) do
        DebugPrint("@zyh \232\162\171\229\136\160\230\142\137\231\154\132\230\152\160\229\176\132", UserData.ActionName, UserData.Key.KeyName)
        self.InputSetting:RemoveActionMapping(UserData)
      end
    end
  end
  for ActionName, ActionData in pairs(GamepadSet) do
    if ActionData.GamepadKey and ActionData.GamepadKey[KeySet] then
      local KeyName = "Gamepad_" .. ActionData.GamepadKey[KeySet]
      DebugPrint("@zyh \230\183\187\229\138\160\231\154\132\230\152\160\229\176\132\229\133\179\231\179\187", ActionName, KeyName)
      local FInputActionKeyMapping = UE4.FInputActionKeyMapping()
      FInputActionKeyMapping.ActionName = ActionName
      FInputActionKeyMapping.Key = UE4.EKeys[KeyName]
      self.InputSetting:AddActionMapping(FInputActionKeyMapping)
    end
  end
  self.InputSetting:SaveKeyMappings()
  ActionMappings = self.InputSetting.ActionMappings:ToTable()
  for _, UserData in ipairs(ActionMappings) do
    if string.find(UserData.Key.KeyName, "Gamepad") then
      DebugPrint("@zyh111", UserData.ActionName, UserData.Key.KeyName)
    end
  end
end

return Component
