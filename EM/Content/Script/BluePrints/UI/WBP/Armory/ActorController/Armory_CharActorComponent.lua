local M = {}
local PlayerActorRefs = {}

function M:Init(Params)
  self.PlayerMontageTimerKeys = {}
  self.PlayerFXTimerKeys = {}
  self.PlayerActorHideTags = {}
end

local function MakeUncalculatedTrans(self)
  return UE4.UKismetMathLibrary.MakeTransform(self.UncalculatedTrans.Translation, self.UncalculatedTrans.Rotation:ToRotator(), FVector(1, 1, 1))
end

local function CalculatePlayerTrans(self, Params)
  local TargetTrans = MakeUncalculatedTrans(self)
  if self.bPreviewSceneLoaded then
    TargetTrans.Translation.Z = TargetTrans.Translation.Z + self.ArmoryPlayer.CapsuleComponent:GetScaledCapsuleHalfHeight() + 2.4
    self.ArmoryPlayer:K2_SetActorRotation(FRotator(0, 90, 0), false, HitResult, false)
  else
    local OriRealPlayerHalfHeight
    local BattleCharData = DataMgr.BattleChar[Params.PreRoleId]
    if BattleCharData and BattleCharData.CapsuleInfo then
      OriRealPlayerHalfHeight = BattleCharData.CapsuleInfo.OriHalfHeight
    end
    OriRealPlayerHalfHeight = OriRealPlayerHalfHeight or Params.PrePlayerCapsuleHalfHeight
    local CapsuleHalfHeightDif = self.ArmoryPlayer.CapsuleComponent:GetScaledCapsuleHalfHeight() - OriRealPlayerHalfHeight
    TargetTrans.Translation.Z = TargetTrans.Translation.Z + CapsuleHalfHeightDif
  end
  self.ArmoryPlayer:K2_SetActorLocation(TargetTrans.Translation, false, HitResult, false)
  self.PlayerOriginalRootTrans = self.ArmoryPlayer.Mesh:K2_GetComponentToWorld()
  self.ArmoryHelper.OriginalRootTrans = self.PlayerOriginalRootTrans
  return TargetTrans
end

function M:OnOpened()
  if self.IsPreviewMode or self.IsSecondary then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  PlayerCharacter:SetCharacterTag("Interactive")
  PlayerCharacter:SetHoldCrouch(false)
  PlayerCharacter:ResetJumpState_Cpp()
  PlayerCharacter:ResetCapSize()
  PlayerCharacter.PlayerAnimInstance:Montage_Stop(0)
  PlayerCharacter.PlayerAnimInstance:ForceToIdle()
  PlayerCharacter:RemoveClearInputCache()
  PlayerCharacter:GetMovementComponent().bForceStop = true
  PlayerCharacter:LaunchCharacter(FVector(0, 0, 0), true, true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ResetNeedRefreshPlayer()
  if PlayerCharacter.CurrentMasterBan or Avatar.CurrentMasterBan then
    PlayerCharacter:ChangeBackToHero()
  end
  self:SavePlayerInfo()
end

function M:SavePlayerInfo()
  local Avatar = GWorld:GetAvatar()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  local Hp = Player:GetAttr("Hp")
  local ES = Player:GetAttr("ES")
  local Sp = Player:GetAttr("Sp")
  if Avatar.CurrentMasterBan and Avatar.HeroTempInfo then
    Hp = Avatar.HeroTempInfo.RoleInfo.PlayerHp
    ES = Avatar.HeroTempInfo.RoleInfo.PlayerES
    Sp = Avatar.HeroTempInfo.RoleInfo.PlayerSp
  end
  local MaxHp = Player:GetAttr("MaxHp")
  local HpRate = Hp / MaxHp
  local MaxES = Player:GetAttr("MaxES")
  local ESRate = 1
  if MaxES and 0 ~= MaxES then
    ESRate = ES / MaxES
  end
  local MaxSp = Player:GetAttr("MaxSp")
  local SpRate = 1
  if MaxSp and 0 ~= MaxSp then
    SpRate = Sp / MaxSp
  end
  local BulletRate = 1
  local MagazineBulletRate = 1
  local RangedWeapon = Player.RangedWeapon
  if RangedWeapon then
    local BulletNum = RangedWeapon:GetAttr("BulletNum") or 0
    local MagazineBulletNum = RangedWeapon:GetAttr("MagazineBulletNum") or 0
    if Avatar.CurrentMasterBan and Avatar.HeroTempInfo then
      BulletNum = Avatar.HeroTempInfo.RangedWeapon.BulletNum
      MagazineBulletNum = Avatar.HeroTempInfo.RangedWeapon.MagazineBulletNum
    end
    local BulletMax = RangedWeapon:GetAttr("BulletMax")
    if BulletMax and 0 ~= BulletMax then
      BulletRate = (BulletNum + MagazineBulletNum) / BulletMax
    end
    local MagazineCapacity = RangedWeapon:GetAttr("MagazineCapacity")
    if MagazineCapacity and 0 ~= MagazineCapacity then
      MagazineBulletRate = MagazineBulletNum / MagazineCapacity
    end
  end
  self.PlayerInfo = {
    HpRate = HpRate,
    ESRate = ESRate,
    SpRate = SpRate,
    BulletRate = BulletRate,
    MagazineBulletRate = MagazineBulletRate
  }
end

function M:LoadPlayerInfo()
  if not self.PlayerInfo then
    return
  end
  PrintTable({
    LoadPlayerInfo = self.PlayerInfo
  }, 10, "self.PlayerInfo")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if nil == Player then
    return
  end
  local Hp = math.floor(math.max(self.PlayerInfo.HpRate * Player:GetAttr("MaxHp"), 1))
  Player:SetAttr("Hp", Hp)
  local MaxES = Player:GetAttr("MaxES")
  if MaxES and 0 ~= MaxES then
    local ES = math.floor(self.PlayerInfo.ESRate * MaxES)
    Player:SetAttr("ES", ES)
  end
  local MaxSp = Player:GetAttr("MaxSp")
  if MaxSp and 0 ~= MaxSp then
    local Sp = math.floor(self.PlayerInfo.SpRate * MaxSp)
    Player:SetAttr("Sp", Sp)
  end
  local RangedWeapon = Player.RangedWeapon
  if RangedWeapon then
    local BulletMax = RangedWeapon:GetAttr("BulletMax")
    local BulletNum
    if BulletMax and 0 ~= BulletMax then
      BulletNum = math.floor(self.PlayerInfo.BulletRate * BulletMax)
    end
    local MagazineCapacity = RangedWeapon:GetAttr("MagazineCapacity")
    if MagazineCapacity and 0 ~= MagazineCapacity then
      local MagazineBulletNum = math.floor(self.PlayerInfo.MagazineBulletRate * MagazineCapacity)
      MagazineBulletNum = math.min(BulletNum, MagazineBulletNum)
      RangedWeapon:SetAttr("MagazineBulletNum", MagazineBulletNum)
      RangedWeapon:K2_GetAttributesSet():OnRep_MagazineBulletNum()
      BulletNum = BulletNum and BulletNum - MagazineBulletNum
    end
    if BulletNum then
      RangedWeapon:SetAttr("BulletNum", BulletNum)
      RangedWeapon:K2_GetAttributesSet():OnRep_BulletNum()
      RangedWeapon:K2_GetAttributesSet():OnRep_MagazineBulletNum()
    end
    if RangedWeapon:GetWeaponMeleeOrRanged() == "Ranged" and 0 == RangedWeapon:GetAttr("MagazineBulletNum") then
      Battle(self.ViewUI):TriggerBattleEvent(BattleEventName.OnMagazineBulletCleared, RangedWeapon:GetOwner())
    end
    Player:UpdateBulletNumUI()
  end
  EventManager:FireEvent(EventID.RefreshMainPlayerBlood)
  EventManager:FireEvent(EventID.UpdateMainPlayerSp, nil, nil, Player)
end

function M:ChangeCharModel(Info, bIfNoDelay, bNoCharVoice, bForceChange)
  self:BeforeViewActorChanged()
  local PlayCharacter = self:GetPlayerActor(true)
  self.ArmoryHelper:SetViewActor(PlayCharacter)
  self:ResetActorRotation()
  self.ViewActorType = self.ViewActorTypes.Player
  self:HidePlayerActor(self.UIName, false)
  self.ArmoryHelper.OriginalRootTrans = self.PlayerOriginalRootTrans
  local Avatar = self:GetAvatar()
  if not Avatar then
    return
  end
  local Uuid = Info.Uuid
  local Char = Uuid and Avatar.Chars[Uuid]
  local NewCharInfo = Char or Info
  if self.CurrentCharInfo == NewCharInfo and not bForceChange then
    return
  end
  local LastCharId = self.CurrentCharInfo and self.CurrentCharInfo.CharId
  self.CurrentCharInfo = NewCharInfo
  self.CurrentCharFromAvatar = Avatar
  if self.CurrentCharInfo.DumpAppearanceSuit then
    self.CurrentAppearanceInfo = self.CurrentCharInfo:DumpAppearanceSuit(Avatar)
  end
  local CharId
  local AvatarBattleInfo = {}
  local GameMode = UE4.UGameplayStatics.GetGameMode(PlayCharacter)
  PlayCharacter:ClearWeapon()
  if Char and GameMode then
    CharId = Char.CharId
    AvatarBattleInfo = AvatarUtils:GetDefaultBattleInfo(Avatar, {Char = Char})
    AvatarBattleInfo = {AvatarInfo = AvatarBattleInfo}
    AvatarBattleInfo = GameMode:SimplifyInfoForInit(AvatarBattleInfo)
    AvatarBattleInfo.FromArmory = true
    PlayCharacter:InitCharacterInfo(AvatarBattleInfo)
  else
    CharId = Info.CharId
    AvatarBattleInfo.FromOtherWorld = true
    AvatarBattleInfo.FromArmory = true
    PlayCharacter:ChangeRole(CharId, AvatarBattleInfo)
  end
  PlayCharacter:SetCharacterTag("Interactive")
  if PlayCharacter.MeleeWeapon then
    PlayCharacter.MeleeWeapon:SetActorHideTag(self.UIName, true)
  end
  local Gender2RoleIds = DataMgr.Player2RoleId.Player
  if CharId == Gender2RoleIds[1] or CharId == Gender2RoleIds[0] then
    self.IsProtagonist = true
    self.bWaitForNotifyToChangePet = true
  else
    self:ChangePetModel(nil, PlayCharacter)
    self.IsProtagonist = false
    self.bWaitForNotifyToChangePet = false
  end
  if bIfNoDelay then
    self.DelayFrame = 0
  else
    self.DelayFrame = 30
  end
  self.bPlayRoleChangedSound = not bNoCharVoice
  if LastCharId and LastCharId == CharId then
    self.bPlayRoleChangedSound = false
  end
  self.bPlaySameMontage = true
  PlayCharacter:KawaiiSwitch(true)
  if PlayCharacter.PlayerAnimInstance then
    PlayCharacter.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Armory)
  end
  self.ArmoryHelper:OnRoleChanged()
  self:StopPlayerSound()
  if self.OnCharModelChanged then
    self.OnCharModelChanged(self.EventObj)
  end
  return true
end

function M:StopPlayerSound()
  local Player = self:GetPlayerActor()
  if Player then
    local _AudioManager = AudioManager(self)
    _AudioManager:StopSound(Player, "ArmoryRoleVoice")
    _AudioManager:StopSound(Player, self.UIName)
    _AudioManager:RemoveCharacterFromEndStopAndLoopPlayRecordMapWhenCharacterEndPlay(Player, 0)
  end
end

function M:ChangeToProtagonist(bIfNoDelay, bNoCharVoice)
  local IsRoleChanged
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.ProtagonistCharInfo = self.ProtagonistCharInfo or {
    CharId = DataMgr.Player2RoleId.Player[Avatar.Sex]
  }
  IsRoleChanged = self:ChangeCharModel(self.ProtagonistCharInfo, bIfNoDelay, bNoCharVoice)
  local PlayCharacter = self:GetPlayerActor(true)
  if PlayCharacter.CharacterFashion then
    for key, value in pairs(CommonConst.CharAccessoryTypes) do
      PlayCharacter.CharacterFashion:ChangeAccessory(nil, value)
    end
    if PlayCharacter.PartsMesh then
      PlayCharacter.PartsMesh:SetVisibility(true, false)
    end
  end
  return IsRoleChanged
end

function M:GetPlayerActor(bCreate)
  if self.ArmoryPlayer == nil and bCreate then
    self:CreatePlayerActor()
  end
  return self.ArmoryPlayer
end

function M:DoSomethingWithPlayer()
end

function M:CreatePlayerActor()
  local UIManager = UIManager(self.ViewUI)
  local IsCharActorFistCreated
  self.ArmoryPlayer, IsCharActorFistCreated = UIManager:CreateOrGetArmoryPlayerActor(self.CurrentCharInfo, self:GetAvatar())
  self.ArmoryPlayer:ForceClearActorHideTag()
  PlayerActorRefs[self] = self.ArmoryPlayer
  local Params = {}
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  Params.PreRoleId = Player.CurrentRoleId
  Params.PrePlayerCapsuleHalfHeight = Player.CapsuleComponent:GetScaledCapsuleHalfHeight()
  if not IsCharActorFistCreated and self.CurrentCharInfo then
    self:ChangeCharModel(self.CurrentCharInfo, true, nil, true)
  end
  self.CurrentAppearanceInfo = self.ArmoryPlayer.InfoForInit and self.ArmoryPlayer.InfoForInit.AppearanceSuit
  if self.ArmoryPlayer.MeleeWeapon then
    self.ArmoryPlayer.MeleeWeapon:SetActorHideTag(self.UIName, true)
  end
  if IsValid(UIManager.ArmoryWeapon) then
    UIManager.ArmoryWeapon:SetActorHideTag(self.UIName, true)
  end
  self.ArmoryPlayer:KawaiiSwitch(true)
  if self.ArmoryPlayer.PlayerAnimInstance then
    self.ArmoryPlayer.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Armory)
  end
  self.ArmoryPlayer:SetCharacterTag("Interactive")
  self.ArmoryPlayer.IsInArmory = true
  self.ArmoryPlayer:K2_SetActorTransform(Player:GetTransform(), false, nil, false)
  self.ArmoryHelper:SetPlayer(self.ArmoryPlayer)
  self.ArmoryHelper:SetViewActor(self.ArmoryPlayer)
  if not self.bPreviewSceneLoaded then
    local Trans = self.ArmoryHelper:OpenArmoryTransformCheck()
    if Trans then
      self.UncalculatedTrans = Trans
    end
  end
  CalculatePlayerTrans(self, Params)
end

function M:ChangeRealPlayerInfo()
  if self.IsPreviewMode or self.IsSecondary then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if not Player or not Avatar then
    return
  end
  if 0 ~= Avatar.CurrentPet then
    local Pet = Avatar.Pets[Avatar.CurrentPet]
    Player:ServerSetBattlePet(Pet.PetId, Pet:GetSkillLevel(), false)
  end
  if Player.CurrentMasterBan then
    Player:WithChangeBackToHero()
  end
  if Avatar:GetNeedRefreshPlayer() then
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(Avatar)
    local PlayerController = Player:GetController()
    PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(Avatar.Eid), AvatarInfo)
    Player:ChangeRole(nil, AvatarInfo)
    Player:RecoverBanSkills()
    UE4.UPhantomFunctionLibrary.CancelAllPhantom(Player, EDestroyReason.PhantomChangeRole)
    EventManager:FireEvent(EventID.OnSwitchRole, Avatar.CurrentChar)
    Player:SyncLocationImmediately()
  else
    Player:SyncUsingWeaponDelay()
    Player:SyncLocationImmediately()
  end
end

function M:HidePlayerActor(Tag, IsHidden, bDontSaveTag)
  if not IsValid(self.ArmoryPlayer) then
    return
  end
  if not bDontSaveTag then
    self.PlayerActorHideTags[Tag] = IsHidden
  end
  self.ArmoryPlayer:SetActorHideTag(Tag, IsHidden, false, true)
  self.ArmoryPlayer:HideAllEffectCreature(Tag, IsHidden)
end

function M:BeforeViewActorChanged()
  if self.ViewActorType == self.ViewActorTypes.Player then
    self:HidePlayerActor(self.UIName, true)
  end
end

function M:AfterViewActorChanged()
  if self.ViewActorType == self.ViewActorTypes.Player and not self.LTweenHandle_PlayDisappearFX then
    self:HidePlayerActor(self.UIName, false)
  end
end

function M:CharLvUpOrBreakUp()
  local ArmoryPlayer = self.ArmoryPlayer
  ArmoryPlayer.FXComponent:PlayEffectByIDParams(303, {bTickEvenWhenPaused = true, NotAttached = true})
end

function M:StopPlayerMontage()
  for key, value in pairs(self.PlayerMontageTimerKeys) do
    self.ViewUI:RemoveTimer(key)
  end
  self.PlayerMontageTimerKeys = {}
  local Player = self:GetPlayerActor()
  Player:StopMontage()
end

function M:StopPlayerFX()
  for key, value in pairs(self.PlayerFXTimerKeys) do
    self.ViewUI:RemoveTimer(key)
  end
  self.PlayerFXTimerKeys = {}
end

function M:Component_OnClosed()
  self:StopPlayerSound()
  self:HidePlayerActor(self.UIName, true)
end

function M:Component_OnDestruct()
  self.CurrentCharInfo = nil
  for Tag, bIsHidden in pairs(self.PlayerActorHideTags) do
    if bIsHidden then
      self:HidePlayerActor(Tag, false)
    end
  end
  PlayerActorRefs[self] = nil
  local UIManager = UIManager(self.ViewUI)
  if nil == next(PlayerActorRefs) then
    UIManager.ArmoryPlayer = nil
    if self.ArmoryHelper then
      self.ArmoryHelper.bNeedDestroyPlayerActor = true
    end
  end
  if self.IsPreviewMode or self.IsSecondary then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if Player then
    Player:SetCharacterTag("Idle")
    if Player.PlayerAnimInstance then
      Player.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Battle)
    end
  end
  self:LoadPlayerInfo()
end

return M
