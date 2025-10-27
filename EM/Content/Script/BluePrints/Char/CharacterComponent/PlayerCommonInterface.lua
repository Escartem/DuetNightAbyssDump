local EMCache = require("EMCache.EMCache")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local MiscUtils = require("Utils.MiscUtils")
local PlayerCommonInterface = {}

function PlayerCommonInterface:PlayerCharacterInitialize()
  self.bWeaponByHand = false
  self.WeaponPos = Const.Shoulder
  self.bGotControllerPitchInput = false
  self.bGotControllerYawInput = false
  self.fNoControlRotationInputTime = 0.0
  self:InitActionLogicParamas()
  self.LookAtTag = self:AddOneSwitchTag(self.OnSetLookAtTag)
  self.bForbidInteractiveTrigger = false
  self:UpdateCameraSensitivityFromCache()
  self:SetPlayerCameraSensitivityByType("Normal")
end

function PlayerCommonInterface:PrintCameraSensitivity(self)
  DebugPrint("Tianyi@ Current Pitch Sensivity: " .. tostring(self.CameraPitchSensitivity) .. " Current Yaw Sensivity: " .. tostring(self.CameraYawSensitivity))
  DebugPrint("Tianyi@ CameraPitchSensitivity_Normal: " .. tostring(self.CameraPitchSensitivity_Normal) .. " CameraYawSensitivity_Normal: " .. tostring(self.CameraYawSensitivity_Normal))
  DebugPrint("Tianyi@ CameraPitchSensitivity_Shoot: " .. tostring(self.CameraPitchSensitivity_Shoot) .. " CameraYawSensitivity_Shoot: " .. tostring(self.CameraYawSensitivity_Shoot))
  DebugPrint("Tianyi@ GamepadCameraPitchSensitivity_Normal: " .. tostring(self.GamepadCameraPitchSensitivity_Normal) .. " GamepadCameraYawSensitivity_Normal: " .. tostring(self.GamepadCameraYawSensitivity_Normal))
  DebugPrint("Tianyi@ GamepadCameraPitchSensitivity_Shoot: " .. tostring(self.GamepadCameraPitchSensitivity_Shoot) .. " GamepadCameraYawSensitivity_Shoot: " .. tostring(self.GamepadCameraYawSensitivity_Shoot))
  DebugPrint("Tianyi@ TurnSpeedPitch: " .. tostring(self.TurnSpeedPitch))
  DebugPrint("Tianyi@ TurnSpeedYaw: " .. tostring(self.TurnSpeedYaw))
end

function PlayerCommonInterface:SetPlayerCameraSensitivityByType(Type, bController)
  if "Normal" == Type then
    if UIUtils.IsGamepadInput() then
      self.CameraPitchSensitivity = self.GamepadCameraPitchSensitivity_Normal
      self.CameraYawSensitivity = self.GamepadCameraYawSensitivity_Normal
    else
      self.CameraPitchSensitivity = self.CameraPitchSensitivity_Normal
      self.CameraYawSensitivity = self.CameraYawSensitivity_Normal
    end
  elseif "Shooting" == Type then
    if UIUtils.IsGamepadInput() then
      self.CameraPitchSensitivity = self.GamepadCameraPitchSensitivity_Shoot
      self.CameraYawSensitivity = self.GamepadCameraYawSensitivity_Shoot
    else
      self.CameraPitchSensitivity = self.CameraPitchSensitivity_Shoot
      self.CameraYawSensitivity = self.CameraYawSensitivity_Shoot
    end
  end
end

function PlayerCommonInterface:SetPlayerCameraSensitivityCannon()
  self.CameraPitchSensitivity_Normal = self.CameraPitchSensitivity_Shoot
  self.CameraYawSensitivity_Normal = self.CameraYawSensitivity_Shoot
  self.GamepadCameraPitchSensitivity_Normal = self.GamepadCameraPitchSensitivity_Shoot
  self.GamepadCameraYawSensitivity_Normal = self.GamepadCameraYawSensitivity_Shoot
end

function PlayerCommonInterface:UpdateGamePadCameraSensitivityFromCache()
  local CachedCameraPitch = EMCache:Get("GamepadCameraPitch")
  if not CachedCameraPitch then
    local DefaultValue = tonumber(DataMgr.Option.GamePadVerticalSensitivity.DefaultValue or 1.0) / (DataMgr.Option.GamePadVerticalSensitivity.ScrollMappingScale or 1.0)
    EMCache:Set("GamepadCameraPitch", DefaultValue)
    CachedCameraPitch = DefaultValue
  end
  self.GamepadCameraPitchSensitivity_Normal = CachedCameraPitch
  local CachedCameraPitchOnShoot = EMCache:Get("GamepadCameraPitchOnShoot")
  if not CachedCameraPitchOnShoot then
    local DefaultValue = tonumber(DataMgr.Option.GamePadVerticalSensitivityOnShooting.DefaultValue or 1.0) / (DataMgr.Option.GamePadVerticalSensitivityOnShooting.ScrollMappingScale or 1.0)
    EMCache:Set("GamepadCameraPitchOnShoot", DefaultValue)
    CachedCameraPitchOnShoot = DefaultValue
  end
  self.GamepadCameraPitchSensitivity_Shoot = CachedCameraPitchOnShoot
  local CachedCameraYaw = EMCache:Get("GamepadCameraYaw")
  if not CachedCameraYaw then
    local DefaultValue = tonumber(DataMgr.Option.GamePadHorizontalSensitivity.DefaultValue or 1.0) / (DataMgr.Option.GamePadHorizontalSensitivity.ScrollMappingScale or 1.0)
    EMCache:Set("GamepadCameraYaw", DefaultValue)
    CachedCameraYaw = DefaultValue
  end
  self.GamepadCameraYawSensitivity_Normal = CachedCameraYaw
  local CachedCameraYawOnShoot = EMCache:Get("GamepadCameraYawOnShoot")
  if not CachedCameraYawOnShoot then
    local DefaultValue = tonumber(DataMgr.Option.GamePadHorizontalSensitivityOnShooting.DefaultValue or 1.0) / (DataMgr.Option.GamePadHorizontalSensitivityOnShooting.ScrollMappingScale or 1.0)
    EMCache:Set("GamepadCameraYawOnShoot", DefaultValue)
    CachedCameraYawOnShoot = DefaultValue
  end
  self.GamepadCameraYawSensitivity_Shoot = CachedCameraYawOnShoot
end

function PlayerCommonInterface:UpdateKeyBoardCameraSensitivityFromCache()
  local CachedCameraPitch = EMCache:Get("CameraPitch")
  if not CachedCameraPitch then
    local DefaultValue = tonumber(DataMgr.Option.VerticalSensitivity.DefaultValue or 1.0) / (DataMgr.Option.VerticalSensitivity.ScrollMappingScale or 1.0)
    EMCache:Set("CameraPitch", DefaultValue)
    CachedCameraPitch = DefaultValue
  end
  self.CameraPitchSensitivity_Normal = CachedCameraPitch
  local CachedCameraPitchOnShoot = EMCache:Get("CameraPitchOnShoot")
  if not CachedCameraPitchOnShoot then
    local DefaultValue = tonumber(DataMgr.Option.VerticalSensitivityOnShooting.DefaultValue or 1.0) / (DataMgr.Option.VerticalSensitivityOnShooting.ScrollMappingScale or 1.0)
    EMCache:Set("CameraPitchOnShoot", DefaultValue)
    CachedCameraPitchOnShoot = DefaultValue
  end
  self.CameraPitchSensitivity_Shoot = CachedCameraPitchOnShoot
  local CachedCameraYaw = EMCache:Get("CameraYaw")
  if not CachedCameraYaw then
    local DefaultValue = tonumber(DataMgr.Option.HorizontalSensitivity.DefaultValue or 1.0) / (DataMgr.Option.HorizontalSensitivity.ScrollMappingScale or 1.0)
    EMCache:Set("CameraYaw", DefaultValue)
    CachedCameraYaw = DefaultValue
  end
  self.CameraYawSensitivity_Normal = CachedCameraYaw
  local CachedCameraYawOnShoot = EMCache:Get("CameraYawOnShoot")
  if not CachedCameraYawOnShoot then
    local DefaultValue = tonumber(DataMgr.Option.HorizontalSensitivityOnShooting.DefaultValue or 1.0) / (DataMgr.Option.HorizontalSensitivityOnShooting.ScrollMappingScale or 1.0)
    EMCache:Set("CameraYawOnShoot", DefaultValue)
    CachedCameraYawOnShoot = DefaultValue
  end
  self.CameraYawSensitivity_Shoot = CachedCameraYawOnShoot
end

function PlayerCommonInterface:UpdateCameraSensitivityFromCache(Type, bController)
  self:UpdateGamePadCameraSensitivityFromCache()
  self:UpdateKeyBoardCameraSensitivityFromCache()
end

function PlayerCommonInterface:BeforeBeginPlay()
  self.CheckAnimNotifyOnZeroFrame = false
  self.MaxSafeLocations = 10
end

function PlayerCommonInterface:AfterBeginPlay()
  self.WeaponPos = Const.Shoulder
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.WeaponPos = self.WeaponPos
  end
  self:SetupActionGroups()
  self:InitPostProcessSettings()
end

function PlayerCommonInterface:SetupActionGroups()
  self:AddToActionGroups("Battle", "Attack")
  self:AddToActionGroups("Battle", "Jump")
  self:AddToActionGroups("Battle", "Slide")
  self:AddToActionGroups("Battle", "BulletJump")
  self:AddToActionGroups("Battle", "Skill1")
  self:AddToActionGroups("Battle", "Skill2")
  self:AddToActionGroups("Battle", "Skill3")
  self:AddToActionGroups("Battle", "Fire")
  self:AddToActionGroups("Battle", "Reload")
  self:AddToActionGroups("Battle", "ChargeBullet")
  self:AddToActionGroups("Battle", "Avoid")
  self:AddToActionGroups("Battle", "SwitchCrouch")
  self:AddToActionGroups("Battle", "Locomotion")
  self:AddToActionGroups("Region", "SwitchMaster")
  self:AddToActionGroups("Flying", "BulletJump")
  self:InitBattleWheelForbidGroup()
end

function PlayerCommonInterface:LoadFinished()
  print("LoadFinished")
end

function PlayerCommonInterface:LatenTick(DeltaSeconds)
end

function PlayerCommonInterface:ProcessItemsOnTouchTick()
  self:ProcessItemsOnTouch()
end

function PlayerCommonInterface:ReturnIdle(FromNoAsset)
  self:SetCharacterTagIdle()
  self.KeepWeaponOnHand = false
  self:ServerSetCharacterTag("Idle")
end

function PlayerCommonInterface:SetLogMask(MaskName)
  print("LogInfo", MaskName)
  _G.LogTag = MaskName
end

function PlayerCommonInterface:SetEmoIdleEnabled(IsEnable, IsChangeRefreshNow)
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance:SetEmoIdleEnabled(IsEnable, IsChangeRefreshNow)
  end
end

function PlayerCommonInterface:KawaiiSwitch(Enabled)
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance:EnableKawaiiSettings(Enabled)
  end
end

function PlayerCommonInterface:StopArmoryIdle()
  self:ShouldEnableHandIk()
  self.PlayerAnimInstance:Montage_StopSlotByName(0, "ArmoryIdle")
end

function PlayerCommonInterface:SetArmoryIdleTag()
  if not self.PlayerAnimInstance then
    return
  end
  self:ShouldEnableHandIk()
  self.PlayerAnimInstance:SetArmoryIdleTag()
end

function PlayerCommonInterface:CancelSkill(JumpStage, bStillHoldFire)
end

function PlayerCommonInterface:CalcVectorAngle(Vector1, Vector2)
  Vector1:Normalize()
  Vector2:Normalize()
  local DotResult = Vector1:Dot(Vector2)
  local CosToAngle = UE4.UKismetMathLibrary.DegAcos(DotResult)
  return CosToAngle
end

function PlayerCommonInterface:IsLocalPlayer()
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(self:GetController(), APlayerController) and (IsStandAlone(self) or MiscUtils.IsAutonomousProxy(self)) then
    return true
  end
  return false
end

function PlayerCommonInterface:UpdatePlayerTaskInfo()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local SceneComponentMgr = GameInstance:GetSceneManager()
  if nil == SceneComponentMgr or nil == UIManager then
    return
  end
  local TaskBarWidget
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_TaskBar and 0 == BattleMainUI.Pos_TaskBar:GetChildrenCount() then
    TaskBarWidget = BattleMainUI:CreateWidgetNew("TaskBar")
    if nil ~= TaskBarWidget then
      BattleMainUI.Pos_TaskBar:AddChildToOverlay(TaskBarWidget)
    end
  elseif nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_TaskBar then
    TaskBarWidget = BattleMainUI.Pos_TaskBar:GetChildAt(0)
  end
  local UnlockMainStoryChain = TaskUtils:GetUnlockMainStory()
  if UnlockMainStoryChain then
    TaskBarWidget:UpdateUnlockMainStory(UnlockMainStoryChain)
  else
    TaskBarWidget.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
  if IconTexture then
    TaskBarWidget.Icon_GuidePoint:SetBrushResourceObject(IconTexture)
  end
end

function PlayerCommonInterface:InitSceneStartUI()
end

function PlayerCommonInterface:UpdatePlayerBloodEffectInfo()
end

function PlayerCommonInterface:Landed()
  if not self:PlayerLanded() then
    return
  end
  self.Super.Landed(self)
  if self:CharacterInTag("LandHeavy") then
    return
  end
end

function PlayerCommonInterface:Impending()
  if not self:PlayerImpending() then
    return
  end
end

function PlayerCommonInterface:StartSlide()
end

function PlayerCommonInterface:EnterHitFlyTag()
  if self.PlayerAnimInstance then
    self:SetCurrentJumpState(Const.NormalState)
    self:SetRotationRate("OnGround")
  end
end

function PlayerCommonInterface:GetDamageInstigatorCurrentAngle(Attacker)
end

function PlayerCommonInterface:TryToUpdateScreenEffect(DamageFrom, EnergyShieldReduce)
end

function PlayerCommonInterface:SkillEnd(Owner, SkillId)
end

function PlayerCommonInterface:PressFire()
end

function PlayerCommonInterface:ResetJumpState(KeepJumpCount)
  self:SetCurrentJumpState(Const.NormalState)
  if not KeepJumpCount then
    self.JumpCount = 0
    self.BulletJumpCount = 0
  end
  self.AutoSyncProp.IsBulletJumping = false
  self.StartBulletJumpTime = -1
  self.ForbidSlide = false
  local Movement = self:GetMovementComponent()
  self.ForbidOrient = false
  self:ChangeOrientControll()
  self:ResetCapRot()
end

function PlayerCommonInterface:ResetJumpState_Lua()
  if self.LuaTimerHandles.BulletJump then
    self:RemoveTimer(self.LuaTimerHandles.BulletJump)
    self.LuaTimerHandles.BulletJump = nil
  end
  if self.BulletJumpDirectionInfo then
    self.BulletJumpDirectionInfo = nil
  end
  self.AutoSyncProp.IsBulletJumping = false
end

function PlayerCommonInterface:ReleaseFire()
end

function PlayerCommonInterface:StopFire(bStillHoldFire)
end

function PlayerCommonInterface:EnterIdleTag()
  self:SetRotationRate("OnGround")
  self:ChangeOrientControll()
  if not self:IsAnimCrouch() then
  end
end

function PlayerCommonInterface:EnterWalkingTag()
  self:SetRotationRate("OnGround")
  if not self:IsAnimCrouch() then
  end
end

function PlayerCommonInterface:CheckKeepBoneHit()
end

function PlayerCommonInterface:ApplyEffectBoneHit(DamageCauser, EffectParamentTable)
end

function PlayerCommonInterface:EndBoneHit()
  self.PlayerAnimInstance.InBoneHit = false
end

function PlayerCommonInterface:ChangeToNewWeapon(WeaponId)
  local WeaponData = DataMgr.BattleWeapon[WeaponId]
  if not WeaponData then
    ScreenPrint("\232\175\183\232\190\147\229\133\165\230\173\163\231\161\174\231\154\132\230\173\166\229\153\168\231\188\150\229\143\183:" .. tostring(WeaponId))
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ScreenPrint("\232\191\158\230\142\165\230\156\141\229\138\161\229\153\168\230\131\133\229\134\181\228\184\139\239\188\140\232\175\183\229\156\168\229\134\155\230\162\176\229\186\147\230\155\180\230\141\162\230\173\166\229\153\168")
    return
  end
  if not IsAuthority(self) then
    ScreenPrint("\229\164\154\228\186\186\232\129\148\230\156\186\230\168\161\229\188\143\228\184\141\232\131\189\230\141\162\230\173\166\229\153\168")
    return
  end
  
  local function HasTag(WeaponData, Tag)
    local WeaponTag = WeaponData.WeaponTag
    if not WeaponTag then
      return false
    end
    for _, _Tag in pairs(WeaponTag) do
      if Tag == _Tag then
        return true
      end
    end
    return false
  end
  
  if HasTag(WeaponData, "Ultra") then
    ScreenPrint("\230\151\160\230\179\149\230\155\180\230\141\162\230\152\190\232\181\171\230\173\166\229\153\168")
    return
  end
  if HasTag(WeaponData, "Condemn") then
    ScreenPrint("\230\151\160\230\179\149\230\155\180\230\141\162\229\164\132\229\136\145\230\173\166\229\153\168")
    return
  end
  local IsMelee = HasTag(WeaponData, "Melee")
  local NewWeapons = {}
  table.insert(NewWeapons, {WeaponId = WeaponId, Weight = 1.5})
  for _WeaponId, _Weapon in pairs(self.Weapons) do
    if not _Weapon.IsChild then
      if _Weapon:HasTag("Ultra") or _Weapon:HasTag("Condemn") then
        table.insert(NewWeapons, {WeaponId = _WeaponId, Weight = 3})
      elseif IsMelee then
        if not _Weapon:HasTag("Melee") then
          table.insert(NewWeapons, {WeaponId = _WeaponId, Weight = 2})
        end
      elseif not _Weapon:HasTag("Ranged") then
        table.insert(NewWeapons, {WeaponId = _WeaponId, Weight = 1})
      end
    end
  end
  table.sort(NewWeapons, function(a, b)
    return a.Weight < b.Weight
  end)
  local CurSkill = self:GetCurrentSkill()
  if CurSkill then
    self:StopSkill()
  end
  self:ClearWeapon()
  for _, WeaponInfo in pairs(NewWeapons) do
    local Weapon = self:AddWeapon(WeaponInfo.WeaponId)
    Weapon:UnBindWeaponFromHand()
    Weapon:ShouldHideWeapon(true, true)
    Weapon:UnBindWeaponFromHand()
  end
  self:ChangeUsingWeaponByType("Melee")
end

function PlayerCommonInterface:AnimIdleStart()
end

function PlayerCommonInterface:StartJump()
  self:PlayerDoJump()
  if self.NeedJumpEvent then
    EventManager:FireEvent(EventID.OnJumpPressed)
  end
end

function PlayerCommonInterface:SetDebugDrawTest(Debugable)
  _G.DrawDebugTest = Debugable
end

function PlayerCommonInterface:SetCanInteractiveTrigger(bIsCanTrigger, Tag)
  local Tag = Tag or "Default"
  self.DisableInteractiveTriggerTagMap = self.DisableInteractiveTriggerTagMap or {}
  if bIsCanTrigger then
    self.DisableInteractiveTriggerTagMap[Tag] = nil
  else
    self.DisableInteractiveTriggerTagMap[Tag] = true
  end
  local bForbidInteractiveTrigger = nil ~= next(self.DisableInteractiveTriggerTagMap)
  if self.bForbidInteractiveTrigger == bForbidInteractiveTrigger then
    return
  end
  self.bForbidInteractiveTrigger = bForbidInteractiveTrigger
  if self.InteractiveTriggerComponent then
    self.InteractiveTriggerComponent:SetIsCanTrigger(not bForbidInteractiveTrigger)
  end
end

function PlayerCommonInterface:CheckCanInteractiveTrigger()
  return not self.bForbidInteractiveTrigger
end

function PlayerCommonInterface:RefreshRegionNameInfo(UId, ObjId)
  local Name = ""
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RegionAvatars = Avatar.RegionAvatars or {}
    local OtherAvatar = RegionAvatars[ObjId]
    Name = OtherAvatar and OtherAvatar.AvatarInfo.Nickname
  end
  local Member, Pos = TeamController:GetModel():GetTeamMember(UId)
  self:EnableHeadWidget("Name", false)
  local Style = "Player"
  if 0 == Pos or not Pos then
    Style = nil
  end
  self:EnableHeadWidget("Name", true, Name, Style, Pos)
end

function PlayerCommonInterface:RefreshTitleInfo(ObjId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RegionAvatars = Avatar.RegionAvatars or {}
  local OtherAvatar = RegionAvatars[ObjId]
  if not OtherAvatar or not OtherAvatar.AvatarInfo then
    return
  end
  local PrefixId = OtherAvatar.AvatarInfo.TitleBefore
  local SuffixId = OtherAvatar.AvatarInfo.TitleAfter
  local TitleFrameId = OtherAvatar.AvatarInfo.TitleFrame
  print(_G.LogTag, "RefreshTitleInfo", PrefixId, SuffixId, TitleFrameId)
  self:RefreshTitle(PrefixId, SuffixId, TitleFrameId)
end

function PlayerCommonInterface:EnableTitle(PrefixId, SuffixId, TitleFrameId)
  self:EnableHeadWidget("Title", true, PrefixId, SuffixId, TitleFrameId)
end

function PlayerCommonInterface:DisableTitle()
  self:EnableHeadWidget("Title", false)
end

function PlayerCommonInterface:RefreshTitle(PrefixId, SuffixId, TitleFrameId)
  self:DisableTitle()
  self:EnableTitle(PrefixId, SuffixId, TitleFrameId)
end

function PlayerCommonInterface:InitBattleWheelForbidGroup()
  local ActionAllow = {
    W = true,
    A = true,
    S = true,
    D = true,
    OpenBattleWheel = true,
    Fire = true
  }
  local KeyboardMap = DataMgr.KeyboardMap
  for ActionName, _ in pairs(KeyboardMap) do
    if not ActionAllow[ActionName] then
      self:AddToActionGroups("BattleWheelForbid", ActionName)
    end
  end
end

function PlayerCommonInterface:DisablePlayerInputInDeliver(bDisable)
  UIManager(self):SetBannedActionCallback("InDeliver", bDisable)
end

return PlayerCommonInterface
