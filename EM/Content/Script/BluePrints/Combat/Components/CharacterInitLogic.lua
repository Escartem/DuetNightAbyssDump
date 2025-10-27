local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local MiscUtils = require("Utils.MiscUtils")
local Component = {}

function Component:RegisterInfo(Info)
  if Info then
    self.InfoForInit = Info
  end
  self:TryInitCharacterInfo("InitInfo")
end

function Component:OnRep_ServerBornInfo()
  self.BornInfo = EffectResults.UnpackEffectStruct(self.ServerBornInfo)
end

function Component:OnRep_ServerInitSuccessOld()
  if self.ServerInitSuccess == true then
    print(_G.LogTag, "OnRep_ServerInitSuccess")
    self.InfoForInit = self:GetInfoForInit()
    if self.IsFromCache then
      self.InfoForInit.InitType = "FromCache"
    end
    self:SetActorHideTag("login", true)
    self:TryInitCharacterInfo("InitInfo")
  end
end

function Component:GetInfoForInit()
  return {
    RoleId = self.CurrentRoleId,
    UnitId = self.UnitId,
    ShadowModelId = self.ShadowModelId
  }
end

function Component:BeginInitInfo()
  print(_G.LogTag, "BeginInitInfo")
  if self.InitSuccess then
    Battle(self):ShowBattleError("CharacterInitLogic InitSuccess is true, do not init again", self.InitSuccess)
    return
  end
  self:InitCharacterInfo()
end

function Component:InitCharacterInfoForRegionPlayer(Info)
  Info = Info or self.InfoForInit
  if not Info then
    print(_G.LogTag, "InitInfo is nil")
    return
  end
  self.CacheInfo = Info
  if Info.AppearanceSuit then
    self.CurrentSkinId = Info.AppearanceSuit.SkinId
  else
    self.CurrentSkinId = Info.SkinId
  end
  self.ShadowModelId = Info.ShadowModelId or 0
  self:PreInitInfo(Info)
  local PreloadComp = self:GetCharPreloadComp()
  if PreloadComp then
    local Ids = self:ColletctPartMeshIds(Info.AppearanceSuit)
    PreloadComp:PreloadAssetsForRegionPlayer(Ids, {
      self,
      self.RegionPlayerPendingInit
    })
  else
    self:RegionPlayerPendingInit()
  end
end

function Component:ColletctPartMeshIds(AppearanceSuitInfo)
  if not self.CharacterFashion then
    return {}
  end
  local PartMeshIds = {}
  self.CharacterFashion:ColletctPartMeshIds(AppearanceSuitInfo, PartMeshIds)
  return PartMeshIds
end

function Component:RegionPlayerPendingInit()
  print(_G.LogTag, "RegionPlayerPendingInit")
  if not self.CacheInfo then
    return
  end
  local Info = self.CacheInfo
  if not self.InitSuccess then
    self:RealInitInfo(Info)
  end
end

function Component:InitCharacterInfo(Info)
  Info = Info or self.InfoForInit
  if not Info then
    print(_G.LogTag, "InitInfo is nil")
    return
  end
  self.CacheInfo = Info
  self:PreInitInfo(Info)
  if not self.InitSuccess and IsEmptyTable(self.WaitInitTags) then
    self:RealInitInfo(Info)
  end
end

function Component:AuthorityPreInitInfo(Info)
  if 0 == self.Eid then
    if Info.Eid ~= nil then
      self:SetEid(Info.Eid)
    else
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      self:SetEid(GameMode:GetBattleEid())
    end
  end
  self:SetDirectSource(Info.DirectSource and Info.DirectSource.Eid)
  self:RawRemoveAllBuff()
  self:DestroyActorOnDead_CPP(false)
  self:ClearSkill()
  self:ClearAttrs()
end

function Component:ClientPreInitInfo(Info)
end

function Component:UnpackAvatarInfoNew(Context)
  local AvatarInfo = Context:GetLuaTable("AvatarInfo")
  if not AvatarInfo then
    return
  end
  self.AvatarInfo = AvatarInfo
  local RoleInfo = AvatarInfo.RoleInfo
  if RoleInfo then
    for Key, Value in pairs(RoleInfo) do
      if type(Value) == "number" then
        if not Context.IntParams:Find(Key) then
          Context.IntParams:Add(Key, Value)
        end
      elseif type(Value) == "boolean" then
        if not Context.BoolParams:Find(Key) then
          Context.BoolParams:Add(Key, Value)
        end
      elseif type(Value) == "table" and not Context:GetLuaTable(Key) then
        Context:AddLuaTable(Key, Value)
      end
    end
  end
  if not Context:GetLuaTable("MeleeWeapon") then
    Context:AddLuaTable("MeleeWeapon", AvatarInfo.MeleeWeapon)
  end
  if not Context:GetLuaTable("RangedWeapon") then
    Context:AddLuaTable("RangedWeapon", AvatarInfo.RangedWeapon)
  end
  if not Context:GetLuaTable("UltraWeapons") then
    Context:AddLuaTable("UltraWeapons", AvatarInfo.UltraWeapons)
  end
end

function Component:UnpackAvatarInfo(Info)
  if Info.UseMasterRole then
    return
  end
  local AvatarInfo = Info.AvatarInfo
  if AvatarInfo then
    for Key, Value in pairs(AvatarInfo) do
      if not Info[Key] then
        Info[Key] = Value
      end
    end
  end
  Info.AvatarInfo = nil
  local RoleInfo = Info.RoleInfo
  if RoleInfo then
    for Key, Value in pairs(RoleInfo) do
      if not Info[Key] then
        Info[Key] = Value
      end
    end
  end
  Info.RoleInfo = nil
end

function Component:PreInitInfo(Info)
  self.FromOtherWorld = Info.FromOtherWorld or false
  self.FromArmory = Info.FromArmory or false
  self.InfoForInit = Info
  if Info.ChangeRole then
    self:ResetIdle()
  end
  self:SetActorHideTag("login", true)
  self:UnpackAvatarInfo(Info)
  if not self.BornInfo then
    self.BornInfo = EffectResults.Result()
  end
  if IsAuthority(self) then
    self:AuthorityPreInitInfo(Info)
  else
    self:ClientPreInitInfo(Info)
  end
  self.InitSuccess = false
  self.UnitId = Info.UnitId
  self.PreRoleId = self.CurrentRoleId
  self:SetCurrentRoleId(Info.RoleId)
  self:SetExtraModelIds()
  self:PreloadSummonMonster(self.PreRoleId)
  self.BattleCharInfo = self:GetDataInfo(self.CurrentRoleId)
  self.WaitInitTags = {}
  self.CacheInfo = Info
  self.bCharacterActive = true
  self.PlayDieEffect = false
  self.PlayBodyAccessoryEffect = false
end

function Component:PreInitAssets(Info)
end

function Component:PrepareWaitInitTags()
  if not self.IsSimplePlayer and self:NeedPreloadAssets() then
    self:SetWaitInitTag(true, Const.CharWaitInitTag.AssetsLoading)
  end
  if not IsEmptyTable(self.WaitInitTags) then
    self:SetCharacterActive(false, "Init")
  end
end

function Component:NeedPreloadAssets()
  if self.GetCharPreloadComp and self:GetCharPreloadComp() then
    return self:GetCharPreloadComp():NeedPreloadAssets()
  end
  return false
end

function Component:NeedCacheLoadAssets()
  local IsPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self)
  if IsPIE then
    return false
  end
  local Res = false
  if self.GetCharPreloadComp and self:GetCharPreloadComp() then
    Res = self:GetCharPreloadComp():NeedCacheLoadAssets()
  end
  if Res then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    print(_G.LogTag, "---NeedCacheLoadAssets---", GameState.bPreloadAssetsReady, self.DelayCacheLoadPlayerAssets)
    if not GameState.bPreloadAssetsReady then
      self.DelayCacheLoadPlayerAssets = true
      Res = false
    end
  end
  return Res
end

function Component:RealInitInfo(Info)
  if IsAuthority(self) and not self.FromOtherWorld then
    self:AuthorityInitInfo(Info)
    self:SnapShotInitInfo(Info)
  end
  self:CommonInitInfo(Info)
  if IsStandAlone(self) or not IsAuthority(self) then
    self:ClientInitInfo(Info)
  end
  self.ServerInitSuccess = true
  self.InitSuccess = true
  self:PostInitInfo(Info)
  if Info.PreReadyCallback then
    Info.PreReadyCallback(self)
  end
  self:OnCharacterReady(Info)
  self:SetIsCharacterReady(true)
  if Info.LoadFinishCallback then
    Info.LoadFinishCallback(self)
  end
  if self:NeedCacheLoadAssets() then
    self:GetCharPreloadComp():CacheLoadAssets()
  end
  if not self:IsMainPlayer() then
    return
  end
  if self.RangedWeapon == nil then
    return
  end
  local RangedWeaponId = self.RangedWeapon.WeaponId
  local WeaponData = DataMgr.BattleWeapon[RangedWeaponId]
  if WeaponData and WeaponData.IsForceEnablePhysics then
    if UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(self:GetWorld(), true) then
      DebugPrint("@gulinan RealInitInfo Enable physics, WeaponId: ", RangedWeaponId)
    end
  elseif UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(self:GetWorld(), false) then
    DebugPrint("@gulinan RealInitInfo Disable physics, WeaponId: ", RangedWeaponId)
  end
end

function Component:PostInitInfo(Info)
  if not self.bCharacterActive then
    self:SetCharacterActive(true, "Init")
  end
  if self:IsMonster() then
    self:DelayAdjustIfPossibleButAlwaysSpawn()
  end
  self.CacheInfo = nil
  if self:IsMainPlayer() then
    self:ClearInputCache()
  end
end

function Component:SetCharacterActive(bActive, Tag)
  self.bCharacterActive = bActive
  if not self.bCharacterActive then
    self:SetActorHideTag(Tag, true)
    self:AddGravityModifier(UE4.EGravityModifierTag.CharInit, 0)
    self:GetMovementComponent().Velocity = FVector(0, 0, 0)
    self.DefaultCapsuleCollisionType = self.CapsuleComponent:GetCollisionEnabled()
    self.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    if self.MonsterHitedCapsule then
      self.DefaultHitCapsuleCollisionType = self.MonsterHitedCapsule:GetCollisionEnabled()
      self.MonsterHitedCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    else
      self.DefaultHitCapsuleCollisionType = ECollisionEnabled.NoCollision
    end
  else
    self:SetActorHideTag(Tag, false)
    self.CapsuleComponent:SetCollisionEnabled(self.DefaultCapsuleCollisionType)
    if self.MonsterHitedCapsule then
      self.MonsterHitedCapsule:SetCollisionEnabled(self.DefaultHitCapsuleCollisionType)
    end
    self:RemoveGravityModifier(UE4.EGravityModifierTag.CharInit)
  end
end

function Component:SetWaitInitTag(bWait, Tag)
  self.WaitInitTags[Tag] = bWait or nil
  if IsEmptyTable(self.WaitInitTags) then
    self:RealInitInfo(self.CacheInfo)
  end
end

function Component:GetWaitInitTag(Tag)
  return not IsEmptyTable(self.WaitInitTags) and self.WaitInitTags[Tag]
end

function Component:CommonInitInfo(Info)
  Battle(self):AddEntity(self.Eid, self)
  self:InitCharacterTag()
  if Info.FromOtherWorld then
  else
    self:AddRoleSkill(self.CurrentRoleId, self:GetSkillInitInfo(Info.SkillInfos))
  end
  self.CurrentSkinId = Info.AppearanceSuit and Info.AppearanceSuit.SkinId or Info.SkinId
  self.ShadowModelId = Info.ShadowModelId or 0
  self:LoadCurrentModel()
  self.EnableAnimGravity = 0
  self.UsingAnimGravity = false
  self.bJetJump = false
  self.EnableAnimFly = false
  if self.BattleCharInfo then
    self.bJetJump = self.BattleCharInfo.EnableJetJump or false
    self.EnableAnimFly = self.BattleCharInfo.EnableAnimFly or false
  end
  print(_G.LogTag, "bJetJump", self.bJetJump)
  self:PlayerCommonInit(Info)
end

function Component:LoadCurrentModel()
  self:GetCharModelComponent():LoadCurrentModel()
end

function Component:AuthorityInitInfo(Info)
  self.UnitType = Info.UnitType
  if not self:IsAIControlled() then
    local Level = Info.Level or 1
    self:SetAttr("Level", Level)
    self:SetCharLevel(Level)
    self:SetAttr("Exp", Info.Exp or 0)
    self:SetAttr("GradeLevel", Info.GradeLevel or Const.DefaultCharGrade)
    self:SetAttr("EnhanceLevel", Info.EnhanceLevel or 0)
    if Info.Camp then
      self:SetCamp(Info.Camp)
    end
  end
  self:SetTableAttr(Info.ReplaceAttrs)
  if self:IsPlayer() then
    self:SetStartLevelId()
    self:SetPlayerInfo(Info)
  else
    self:UpdateCurrentLevelId()
    if self.CurrentLevelId:Length() > 0 then
      self:SetSpawnLevelId(self.CurrentLevelId:Get(1))
    end
  end
  self.AvatarQuestRoleID = Info.AvatarQuestRoleID or 0
end

function Component:SetPlayerInfo(Info)
  self.EndPointTransform = nil
  if Info.PlayerHp then
    self:SetAttr("Hp", math.min(Info.PlayerHp, self:GetAttr("MaxHp")))
    self:CalcHpPercent()
  end
  if Info.PlayerSp then
    self:SetAttr("Sp", math.min(Info.PlayerSp, self:GetAttr("MaxSp")))
  end
  if Info.PlayerEs then
    self:SetAttr("ES", math.min(Info.PlayerES, self:GetAttr("MaxES")))
  end
  if Info.DeathInfo then
    self:SetDeathInfo(Info.DeathInfo)
  end
end

function Component:SnapShotInitInfo(Info)
end

function Component:InitAvatarBuffs()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local PlayerController = self:GetController()
  if GameMode and PlayerController then
    local AvatarEid = PlayerController.AvatarEidStr
    local AvatarInfo = GameMode.AvatarInfos[AvatarEid]
    if not AvatarInfo then
      return
    end
    local AvatarBuffs = AvatarInfo.PlayerInfo.Buffs
    local Battle = Battle(self)
    if AvatarBuffs then
      for _, BuffInfo in pairs(AvatarBuffs) do
        DebugPrint("Tianyi@ BuffInfo: " .. BuffInfo.BuffId .. " StartTime: " .. BuffInfo.StartTime .. " Duration: " .. BuffInfo.Duration .. "SkillLevel: " .. BuffInfo.Level)
        if Battle then
          Battle:AddAvatarBuffToTarget(self, self, BuffInfo.BuffId, -1, 0, BuffInfo.Level)
        end
      end
    end
  end
end

function Component:ClientInitInfo(Info)
  if Info.FromOtherWorld then
    self:SetCharacterTagIdle()
    return
  end
  if self:IsPlayer() and not Info.ChangeRole then
    if self:JudgeIfPlayLevelEnter() and not Info.ChangeRole then
      self:SetCharacterTag("LevelEnter")
      self.ShouldPlayEnterMontage = true
    else
      self:SetCharacterTagIdle()
    end
    self:InitUIWidgetComponent()
    if IsValid(self.BillboardComponent) then
      self.BillboardComponent:InitPlayerBillBoard(self, "Char")
    end
    if self.BP_RecoverInteractiveComponent then
      self.BP_RecoverInteractiveComponent:InitCharInfo()
    end
    if self:IsMainPlayer() and (IsClient(self) or IsStandAlone(self)) then
      self:SetupCameraControlComponent()
      self.UploadBDCTrackInfo = {}
    end
    local PlayerState = self:GetEMPlayerState()
    if PlayerState then
      local WheelIndex = PlayerState.WheelIndex
      DebugPrint("gmy@CharacterInitLogic Component:ClientInitInfo", WheelIndex, self.SquadWheelIndex)
      if WheelIndex > 0 then
        self.SquadWheelIndex = WheelIndex
      else
        self.SquadWheelIndex = -1
      end
    end
  end
  if self:GetLocalRole() == Const.ROLE_AutonomousProxy and self:IsPlayer() then
    self:ServerNotifyAutonomousInit()
  end
end

function Component:ClientPlayEnterMontage()
  if not self.ShouldPlayEnterMontage then
    return
  end
  local Callback = {
    OnCompleted = self.OnLevelEnterComplete,
    OnInterrupted = self.OnLevelEnterInterrupted
  }
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
  end
  if self.NpcAnimInstance then
    self.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
  end
  self:PlayActionMontage("Interactive/LevelFinish", "LevelEnter_Montage", Callback)
end

function Component:FormatWeaponInfo(TempWeapon, DumpWeaponInfo)
  TempWeapon.SlotData = {}
  TempWeapon.ModData = {}
  TempWeapon.ModPassives = nil
  TempWeapon.SkillInfos = nil
  TempWeapon.ReplaceAttrs = nil
  TempWeapon.EnhanceLevel = DumpWeaponInfo.EnhanceLevel or 0
  TempWeapon.WeaponId = DumpWeaponInfo.WeaponId or 0
  TempWeapon.GradeLevel = DumpWeaponInfo.GradeLevel or 0
  TempWeapon.AppearanceInfo = DumpWeaponInfo
  TempWeapon.AppearanceInfo.EnhanceLevel = nil
  TempWeapon.AppearanceInfo.GradeLevel = nil
end

function Component:OnCharacterReady(Info)
  self:SetActorHideTag("login", false)
  if Info.FromOtherWorld then
    if Info.IsDungeonEnd then
      self:ServerSetUpWeapons(Info.MeleeWeapon, Info.RangedWeapon, Info.UltraWeapons)
    elseif Info.RegionWeaponInfo then
      local MeleeWeapon = {}
      self:FormatWeaponInfo(MeleeWeapon, Info.RegionWeaponInfo.MeleeWeapon)
      local RangedWeapon = {}
      self:FormatWeaponInfo(RangedWeapon, Info.RegionWeaponInfo.RangedWeapon)
      self:ServerSetUpWeapons(MeleeWeapon, RangedWeapon, nil)
      if Info.ShowWeapon then
        self:ChangeUsingWeaponByType(Info.ShowWeapon)
      end
    end
    self:HandleModelFashion()
    self.Overridden.OnCharacterReady(self)
    self.Overridden.ReceiveBeginPlay(self)
    self:ReceiveOnCharacterReady()
    return
  end
  self:GetBossDestructableComponent()
  local IsAut = IsAuthority(self)
  if IsAut then
    if not self:IsSummonMonster() then
      self:ServerSetRoleMod(Info.RoleId, Info.ModPassives, false)
    end
    PrintTable({
      ZJYINFOINFO = Info.MeleeWeapon
    }, 100)
    self:ServerSetUpWeapons(Info.MeleeWeapon, Info.RangedWeapon, Info.UltraWeapons)
    self:InitAllWeaponModifier(Info.ReplaceAttrs)
    self:ServerSetUpAccessories()
    self:ServerSetUpDestructableBody()
    self:InitAvatarBuffs(Info)
    if Info.Pet and self:IsPlayer() then
      local PetId = Info.Pet.PetId
      local CurBattlePet = self:GetBattlePet()
      if PetId then
        local AffixList = TArray(0)
        if Info.Pet.EntryIds then
          for i, EntryId in ipairs(Info.Pet.EntryIds) do
            local Data = DataMgr.PetEntry[EntryId]
            if Data then
              AffixList:Add(EntryId)
            end
          end
        end
        if CurBattlePet and 0 ~= CurBattlePet.BattlePetId then
          self:ServerRemoveBattlePet()
        end
        local PetLevel = Info.Pet.PetLevel or 1
        self:ServerSetBattlePetAndAffixList(PetId, PetLevel, AffixList, true)
      end
    end
  elseif self.GetAccessories then
    for _, Accessory in pairs(self:GetAccessories()) do
      Accessory:InitAccessoryInfo(Accessory.AccessoryId)
    end
  end
  print(_G.LogTag, "LXZ OnCharacterReady", self:GetName(), self:IsMainPlayer(), Info.ChangeRole)
  if self:IsMainPlayer() and not Info.ChangeRole then
    local FXPreloadGameInstanceSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UE4.UFXPreloadGameInstanceSubsystem)
    if FXPreloadGameInstanceSubsystem then
      local ModelId = self:GetCharModelComponent():GetCurrentModelId()
      local ModelData = DataMgr.Model[ModelId]
      local Prefix = ModelData.MontagePrefix
      if Prefix and string.find(Prefix, "_") == string.len(Prefix) then
        Prefix = string.sub(Prefix, 1, -2)
        FXPreloadGameInstanceSubsystem:PreloadCharacterFX(Prefix)
      end
    end
    self:AddInteractiveTrigger()
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local LoadingUI = GameInstance:GetLoadingUI()
    if LoadingUI and LoadingUI.bIsInLoading then
      self:SetCanInteractiveTrigger(false, "Loading")
    end
    self:SetInteractiveTriggerDistance(self:GetAttr("DropDistance"))
  end
  if self:IsPlayer() and not Info.ChangeRole then
    local function ClientTryEndLoading()
      local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
      
      if not GameState.PlayerReady then
        GameState.PlayerReady = true
        GameState:TryEndLoading("PlayerReady")
      end
    end
    
    if IsAuthority(self) then
      self:InitRegionBattleStateObject()
      if self:GetController() then
        local GameMode = UE4.UGameplayStatics.GetGameMode(self)
        local AvatarEidStr = self:GetController().AvatarEidStr
        if GameMode.LevelLoader and not GameMode.AlreadyInit then
          GameMode.LevelLoader:SetInitTrans(self:GetOwner())
        end
        GameMode:OnCharacterReady(AvatarEidStr, self)
        GameMode:TryTriggerOnInit(AvatarEidStr)
        if GameMode:GetDungeonComponent() then
          self:CreatePhantomBySquad(AvatarEidStr, GameMode)
        end
      end
    else
      ClientTryEndLoading()
    end
    if IsStandAlone(self) then
      ClientTryEndLoading()
    end
  end
  if IsDedicatedServer(self) and IsAuthority(self) then
    self.ServerBornInfo = self.BornInfo:ToEffectStruct()
  end
  self:ZeroComboCount(UE4.EClearComboReason.Timelimit)
  self:HandleModelFashion()
  self:RefreshActorHideTag()
  self.Overridden.OnCharacterReady(self)
  self.Overridden.ReceiveBeginPlay(self)
  self:ReceiveOnCharacterReady()
  if not self:IsMainPlayer() and (self:IsPlayer() or self:IsPhantom()) then
    EventManager:FireEvent(EventID.ShowTeammateBloodUI, self.Eid, self:IsPlayer(), self)
  end
  if self:IsMainPlayer() then
    if Info.ChangeRole then
      EventManager:FireEvent(EventID.ChangeRole)
    end
    local Controller = self:GetController()
    Controller:ForbidWeapon()
    if IsClient(self) or IsStandAlone(self) then
      self:InitSceneStartUI()
    end
    EventManager:FireEvent(EventID.OnMainCharacterInitReady, self.Eid)
    EventManager:FireEvent(EventID.OnCharacterInitSuitRecover)
  else
    EventManager:FireEvent(EventID.OnCharacterInitReady, self.Eid)
  end
  if self:IsPhantom() then
    EventManager:FireEvent(EventID.OnPhantomInitReady, self.Eid)
  end
  if Info.ChangeRole then
    self.WeaponPos = Const.Shoulder
    if not self:IsNPC() then
      self.EMAnimInstance = self.Mesh:GetAnimInstance()
      if self.EMAnimInstance and not self.EMAnimInstance.Begining then
        self.EMAnimInstance:AnimInstanceRestart()
      end
    else
      self.NpcAnimInstance = self.Mesh:GetAnimInstance()
      if self.NpcAnimInstance and not self.NpcAnimInstance.Begining then
        self.NpcAnimInstance:AnimInstanceRestart()
      end
    end
  end
  self.InfoForInit.ChangeRole = true
end

function Component:HandleModelFashion()
  print(_G.LogTag, "HandleModelFashionHandleModelFashion111")
  if not IsStandAlone(self) and not IsClient(self) then
    return
  end
  print(_G.LogTag, "HandleModelFashionHandleModelFashion")
  self.CharacterFashion:CreateAllDynamicMaterialNew()
end

function Component:GetBossDestructableComponent()
  local PartComponents = self:K2_GetComponentsByClass(UDestructableBodyComponent:StaticClass())
  if 0 == PartComponents:Num() then
    return
  end
  self.DestructParts = {}
  for Id, _Comp in pairs(PartComponents) do
    self.DestructParts[_Comp.PartId] = _Comp
  end
  if not self.SocketMap then
    self.SocketMap = {}
  end
  if not self.HpNum then
    self.HpNum = 0
  end
  self.MaxHpNum = PartComponents:Num()
end

function Component:PlayerCommonInit(Info)
  if self:IsPlayer() or self:IsPhantom() then
    self:SetupActionLogicPramas()
    self:InitAnimIntanceParam()
    self:InitAppearanceSuit(Info.AppearanceSuit or self.BornInfo.AppearanceSuit)
  end
end

function Component:GetNewSkinId(Context)
  if not Context then
    return CurrentSkinId
  end
  local Info = Context:GetLuaTable("AppearanceSuit") or self.BornInfo.AppearanceSuit
  if Info and Info.SkinId then
    return Info.SkinId
  end
  return CurrentSkinId
end

function Component:NewPlayerCommonInit(Context)
  if self:IsPlayer() or self:IsPhantom() then
    self:SetupActionLogicPramas()
    self:InitAnimIntanceParam()
    self:InitAppearanceSuit(Context:GetLuaTable("AppearanceSuit") or self.BornInfo.AppearanceSuit)
  end
end

function Component:InitAnimIntanceParam()
  if self.EMAnimInstance then
    local ModelId = self:GetCharModelComponent():GetCurrentModelId()
    local ModelData = DataMgr.Model[ModelId]
    if self.EMAnimInstance.RunStopStartTime then
      self.EMAnimInstance.RunStopStartTime = ModelData.RunStopStartTime or Const.RunStopStartTime
    end
    self:InitKawaiiParams(ModelData)
  end
  if self.NpcAnimInstance then
    local ModelId = self:GetCharModelComponent():GetCurrentModelId()
    local ModelData = DataMgr.Model[ModelId]
    self.NpcAnimInstance.RunStopStartTime = ModelData.RunStopStartTime or Const.RunStopStartTime
    self:InitKawaiiParams(ModelData)
  end
end

function Component:InitKawaiiParams(ModelData)
  if self.PlayerAnimInstance then
    if not ModelData.KawaiiIdList then
      local PlayerAnimInstance = self.PlayerAnimInstance
      local DefaultKawaiiLayer = UE4.EKawaiiLayerState.EKLS_Default
      if PlayerAnimInstance.ArtDebugSwitch then
        DefaultKawaiiLayer = UE4.EKawaiiLayerState.EKLS_Battle
      end
      PlayerAnimInstance:SetKawiiLayerState(DefaultKawaiiLayer)
      return
    end
    for i, v in pairs(ModelData.KawaiiIdList) do
      if DataMgr.KawaiiParams[v] then
        local KawaiiType = DataMgr.KawaiiParams[v].KawaiiType
        self.KawaiiIdMap:Add(KawaiiType, v)
        print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", KawaiiType, v)
      end
    end
    self.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
  end
  if self.NpcAnimInstance then
    if ModelData.KawaiiIdList then
      for i, v in pairs(ModelData.KawaiiIdList) do
        if DataMgr.KawaiiParams[v] then
          local KawaiiType = DataMgr.KawaiiParams[v].KawaiiType
          self.KawaiiIdMap:Add(KawaiiType, v)
          print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", KawaiiType, v)
        end
      end
    end
    self.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
  end
end

function Component:InitAppearanceSuit(AppearanceSuit)
  if AppearanceSuit then
    if self.CharacterFashion then
      self.CharacterFashion:InitAppearanceSuit(AppearanceSuit)
    end
    if self.BornInfo then
      self.BornInfo.AppearanceSuit = AppearanceSuit
    end
  else
    self:ClearAllSuitItem()
  end
end

function Component:SetStartLevelId()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local levelLoader = GameMode:GetLevelLoader()
  if not (levelLoader and levelLoader.enterLevelID) or type(levelLoader.enterLevelID) ~= "string" then
    return
  end
  local array = TArray("")
  array:Add(levelLoader.enterLevelID)
  self:SetCurrentLevelId(array)
end

function Component:JudgeIfPlayLevelEnter()
  if MiscUtils.IsSimulatedProxy(self) then
    return false
  end
  if not GWorld:GetAvatar() then
    return false
  end
  local PlayerState = self:GetEMPlayerState()
  if PlayerState and PlayerState.bIsEMInactive == true then
    DebugPrint("Tianyi@ \233\135\141\232\191\158\228\184\141\233\156\128\232\166\129LevelEnter")
    return false
  elseif not PlayerState then
    DebugPrint("Tianyi@ PlayState is nullptr")
  end
  local LevelName = UE4.UGameplayStatics.GetCurrentLevelName(self, true)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance.NeedPlayTempSceneMonstage then
    GameInstance.NeedPlayTempSceneMonstage = false
    return false
  end
  local CurrentDungeonId = GameInstance and GameInstance:GetCurrentDungeonId()
  if CurrentDungeonId and DataMgr.Dungeon[CurrentDungeonId] and DataMgr.Dungeon[CurrentDungeonId].IsPlayLevelEnter then
    return true
  end
  for i, v in pairs(DataMgr.Dungeon) do
    if string.match(v.DungeonMapFile, LevelName) and v.IsPlayLevelEnter then
      return true
    end
  end
  return false
end

function Component:CleanAllTimer()
  self.Overridden.CleanAllTimer(self)
  self:CleanTimer()
end

function Component:OnCharacterInitSuitRecover()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Avatar = GWorld:GetAvatar()
  EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, self)
  if self:IsMainPlayer() and IsValid(GameMode) and Avatar and Avatar:CheckCurrentSubRegion() and (IsClient(self) or IsStandAlone(self)) then
    GameMode:InitRegionSuit(Avatar, Avatar:GetSubRegionId2RegionId())
  end
end

function Component:SetInteractiveTriggerDistance(NewDropDistance)
  if not IsValid(self.InteractiveTriggerComponent) then
    return
  end
  self.InteractiveTriggerComponent:SetInteractiveTriggerDistance(NewDropDistance)
end

function Component:CreatePhantomBySquad(AvatarEidStr, GameMode)
  local PhantomInfo = GameMode.AvatarInfos[AvatarEidStr].PhantomInfo
  for Index, Data in ipairs(PhantomInfo) do
    if next(Data.RoleInfo) then
      self:CreatePhantom(Data.RoleInfo.RoleId, 1, Data, {IsSpawnBySquad = 1, TeamIndex = Index})
    end
  end
end

return Component
