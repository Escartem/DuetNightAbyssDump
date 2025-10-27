require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = {}
M._components = {
  "BluePrints.UI.WBP.Armory.ActorController.Armory_WeaponActorComponent",
  "BluePrints.UI.WBP.Armory.ActorController.Armory_PetActorComponent",
  "BluePrints.UI.WBP.Armory.ActorController.Armory_ActorAppearanceComponent",
  "BluePrints.UI.WBP.Armory.ActorController.Armory_SceneActorComponent",
  "BluePrints.UI.WBP.Armory.ActorController.Armory_CharActorComponent"
}
local SelfObjCount = 0

function M:SwitchArmoryCamera(IsArmoryCamera, Duration)
  if not self.ArmoryHelper then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if not Player then
    return
  end
  if IsArmoryCamera then
    self.ViewActor = self.ArmoryPlayer or self.ArmoryWeapon
    self.ArmoryHelper:SetViewActor(self.ViewActor)
    if self.ArmoryPlayer then
      self.PlayerOriginalRootTrans = self.ArmoryPlayer.Mesh:K2_GetComponentToWorld()
      self.ArmoryHelper.OriginalRootTrans = self.PlayerOriginalRootTrans
      local CameraTrans = self:LoadOpenArmoryCameraInfo(self.ArmoryPlayer)
      self.ArmoryHelper:SetCameraStartTrans(CameraTrans, Player.CharCameraComponent.FieldOfView, self.ArmoryPlayer)
    elseif self.ArmoryWeapon or self.IsArmoryWeaponLoading then
    end
  else
    local StartTransform, StartLocation, StartRotation, _Duration = self:LoadCloseArmoryCameraInfo()
    Duration = Duration or _Duration
    
    local function OnRecoverEnd()
      self:OnRecorverCameraEnd()
    end
    
    self.ArmoryHelper:RecorverCamera(nil, OnRecoverEnd, Duration, StartTransform, StartLocation, StartRotation)
  end
end

function M:LoadOpenArmoryCameraInfo(Player)
  local CameraTrans
  local Data = self:GetCameraData()["Char_" .. Player:GetBattleCharBodyType()]
  if Data and DataMgr.GlobalConstant.ArmoryCameraX then
    local PlayerTransform = self.ArmoryPlayer.Mesh:GetSocketTransform("Root", ERelativeTransformSpace.RTS_World)
    local EndCameraPos = FVector(Data.Location[1], Data.Location[2], Data.Location[3])
    local EndCameraRot = FRotator(Data.Rotation[2], Data.Rotation[3], Data.Rotation[1])
    CameraTrans = FTransform()
    local Location = EndCameraPos + FVector(DataMgr.GlobalConstant.ArmoryCameraX.ConstantValue, DataMgr.GlobalConstant.ArmoryCameraY.ConstantValue, DataMgr.GlobalConstant.ArmoryCameraZ.ConstantValue)
    CameraTrans.Translation = UE4.UKismetMathLibrary.TransformLocation(PlayerTransform, Location)
    CameraTrans.Rotation = UKismetMathLibrary.FindLookAtRotation(CameraTrans.Translation, PlayerTransform.Translation)
    CameraTrans.Rotation = UE4.UKismetMathLibrary.TransformRotation(PlayerTransform, EndCameraRot):ToQuat()
  else
    CameraTrans = Player.CharCameraComponent:K2_GetComponentToWorld()
  end
  return CameraTrans
end

function M:LoadCloseArmoryCameraInfo()
  local StartTransform, StartLocation, StartRotation, Duration
  if DataMgr.GlobalConstant.ArmoryExitX then
    StartTransform = FTransform()
    local CameraTrans = self.ArmoryHelper.RecoverEndTransform or StartTransform
    StartLocation = FVector(DataMgr.GlobalConstant.ArmoryExitX.ConstantValue, DataMgr.GlobalConstant.ArmoryExitY.ConstantValue, DataMgr.GlobalConstant.ArmoryExitZ.ConstantValue)
    StartTransform.Translation = UE4.UKismetMathLibrary.TransformLocation(CameraTrans, StartLocation)
    StartTransform.Rotation = CameraTrans.Rotation
    Duration = Duration or DataMgr.GlobalConstant.ArmoryExitTime.ConstantValue
    StartLocation = FVector(0, 0, 0)
    StartRotation = FRotator(0, 0, 0)
  end
  return StartTransform, StartLocation, StartRotation, Duration
end

function M:OnHelperBecomeViewTarget(PC)
  if self.OnFirstBecomeViewTarget then
    self.OnFirstBecomeViewTarget()
    self.OnFirstBecomeViewTarget = nil
    self:HidePlayerActor("ActorController_ChangeViewTarget", false)
    self:HideWeaponActor("ActorController_ChangeViewTarget", false)
    self:HidePetActor("ActorController_ChangeViewTarget", false)
    self:UpdateLighting()
    return
  end
  for key, value in pairs(self.PlayerActorHideTags) do
    if value then
      self:HidePlayerActor(key, true, true)
    end
  end
  self:HidePlayerActor("ActorController_ChangeViewTarget", false)
  self:HideWeaponActor("ActorController_ChangeViewTarget", false)
  self:HidePetActor("ActorController_ChangeViewTarget", false)
  local LastCharModelInfo = self.LastCharModelInfo
  self.LastCharModelInfo = nil
  if not LastCharModelInfo then
    return
  end
  local IsRoleChanged
  if self.IsProtagonist then
    IsRoleChanged = self:ChangeToProtagonist(true, true)
  else
    IsRoleChanged = self:ChangeCharModel(LastCharModelInfo, true, true, true)
    if self.LastCharAppearanceInfo then
      self.ArmoryPlayer.CharacterFashion:InitAppearanceSuit(self.LastCharAppearanceInfo)
    end
  end
  if self.CurrentPetInfo then
    self:ChangePetModel(self.CurrentPetInfo)
  end
  if self.LastArmoryPlayerLoc then
    self.ArmoryPlayer:K2_SetActorLocation(self.LastArmoryPlayerLoc, false, HitResult, false)
  end
  if self.LastArmoryPlayerRot then
    self.ArmoryPlayer:K2_SetActorRotation(self.LastArmoryPlayerRot, false, HitResult, false)
  end
  if self.CurrentWeaponInfo then
    self:ChangeWeaponModel(self.CurrentWeaponInfo)
    if self.LastWeaponAppearanceInfo then
      self:ChangeWeaponAppearance(self.LastWeaponAppearanceInfo)
    end
  end
  self.ArmoryHelper:OnRoleChanged()
  self.bPlaySameMontage = true
  self:SetArmoryMontageTag(self.ArmoryPlayer, self.CurMontageTag, self.LastShowOrHideWeapon)
  self:UpdateLighting()
end

function M:OnHelperEndViewTarget(PC)
  self.LastCharModelInfo = self.CurrentCharInfo
  self.LastCharAppearanceInfo = self.CurrentAppearanceInfo
  self.LastWeaponAppearanceInfo = self.CurrentWeaponAppearanceInfo
  if self.bDestructed then
    return
  end
  for key, value in pairs(self.PlayerActorHideTags) do
    if value then
      self:HidePlayerActor(key, false, true)
    end
  end
  self:HidePlayerActor("ActorController_ChangeViewTarget", true)
  self:HideWeaponActor("ActorController_ChangeViewTarget", true)
  self:HidePetActor("ActorController_ChangeViewTarget", true)
  if IsValid(self.ArmoryPlayer) and self.CurrentCharInfo then
    self.LastArmoryPlayerLoc = self.ArmoryPlayer:K2_GetActorLocation()
    self.LastArmoryPlayerRot = self.ArmoryPlayer:K2_GetActorRotation()
  end
end

function M:OnOpened(Duration)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self.ViewUI)
  local UIManager = GameInstance:GetGameUIManager()
  if not IsValid(self.ArmoryHelper) then
    self.ArmoryHelper = UIManager:CreateUIActorCameraHelper(UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0))
  end
  if IsValid(self.ArmoryHelper) then
    self.ArmoryHelper:BindViewTargetEvents({
      OnBecomeViewTarget = self.OnHelperBecomeViewTarget,
      OnEndViewTarget = self.OnHelperEndViewTarget
    }, self)
    self:UpdateCameraPPSetting()
    self.ArmoryHelper.ArchivePreview = false
    self.ArmoryHelper.PersonalPreview = false
    if self.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewArmory then
      self.ArmoryHelper.ArchivePreview = true
    elseif self.EPreviewSceneType == CommonConst.EPreviewSceneType.PersonInfo then
      self.ArmoryHelper.PersonalPreview = true
    end
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if not Player then
    return
  end
  self:TryLoadPreviewScene()
  self.UncalculatedTrans = self.PreviewSceneTrans or Player:GetTransform()
  local Trans = UKismetMathLibrary.MakeTransform(self.UncalculatedTrans.Translation, FRotator(0), FVector(1))
  Trans.Translation.Z = Trans.Translation.Z + 90
  Trans.Translation.Y = Trans.Translation.Y + 90
  Trans.Rotation = self.UncalculatedTrans.Rotation
  self.ArmoryHelper:K2_SetActorTransform(Trans, false, nil, false)
  self:HideRealPlayer(true)
  self.OpenDuration = Duration
  
  function self.OnFirstBecomeViewTarget()
    self:InitActors()
  end
  
  if self.ArmoryHelper then
    local Controller = UE4.UGameplayStatics.GetPlayerController(self.ViewUI, 0)
    Controller:SetViewTargetWithBlend(self.ArmoryHelper, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  end
end

function M:InitActors()
  if self.CurrentCharInfo then
    self:GetPlayerActor(true)
  elseif self.CurrentWeaponInfo then
    self:SetSingleWeaponCameraStartInfo(self.CurrentWeaponInfo)
    self:ChangeSingleWeapon(self.CurrentWeaponInfo, true)
  elseif self.CurrentPetInfo then
    self:ChangeToProtagonist(true)
  end
  self:SwitchArmoryCamera(true, self.OpenDuration)
end

function M:HideRealPlayer(bHide)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if not Player then
    return
  end
  Player:SetActorHideTag(self.UIName, bHide)
  Player.CharCameraComponent:SetComponentTickEnabled(not bHide)
  if self.IsCharActorFistCreated then
    local UIManager = UIManager(self.ViewUI)
    UIManager:HideOrShowPlayerFX(Player, bHide, self.UIName)
    if self.ArmoryPlayer and self.IsCharActorFistCreated then
      UIManager:SetTargetActorState(bHide, self.ArmoryPlayer, self.UIName)
    end
  end
end

function M:CalcArmoryCameraTag(Type, Tag, Behavior, ExtraTag)
  local CameraTag1, CameraTag2, CameraTag3, CameraTag4 = "", "", "", ""
  if self.ViewUI.IsListExpanded then
    CameraTag3 = "Switch"
  end
  CameraTag3 = ExtraTag or CameraTag3
  if Type == CommonConst.ArmoryType.Char then
    CameraTag1 = Type
    CameraTag2 = Behavior
    if Behavior == CommonConst.ArmoryType.Mod then
      CameraTag3 = nil
    elseif Behavior == CommonConst.ArmoryTag.Appearance then
      if not Tag or Tag == CommonConst.ArmoryType.Char then
        CameraTag2 = Behavior
      else
        CameraTag2 = Tag
      end
    elseif Behavior == CommonConst.ArmoryTag.Files then
      CameraTag2 = Behavior
    elseif Behavior == CommonConst.ArmoryTag.Char then
      CameraTag2 = nil
    end
  elseif Type == CommonConst.ArmoryType.Weapon then
    CameraTag1 = Type
    if Tag and string.find(Tag, CommonConst.ArmoryTag.UWeapon) then
      CameraTag2 = "Ultra"
      if Behavior == CommonConst.ArmoryType.Mod then
        CameraTag3 = Behavior
      end
      CameraTag4 = self.ArmoryPlayer.CurrentRoleId
    elseif Behavior == CommonConst.ArmoryType.Mod then
      CameraTag2 = Behavior
      CameraTag3 = nil
    elseif Behavior == CommonConst.ArmoryTag.Grade then
      CameraTag2 = self.ArmoryPlayer.PlayerAnimInstance.IdleTag
      CameraTag3 = Behavior
    else
      CameraTag2 = self.ArmoryPlayer.PlayerAnimInstance.IdleTag
    end
    if Behavior == CommonConst.ArmoryTag.Appearance then
      CameraTag3 = "Color"
    end
  elseif Type == CommonConst.ArmoryType.Pet then
    local Avatar = GWorld:GetAvatar() or {Sex = 1}
    if 1 == Avatar.Sex then
      CameraTag1 = "Nvzhu"
    else
      CameraTag1 = "Nanzhu"
    end
    if "Entry" == Behavior then
      CameraTag2 = Behavior
    end
    CameraTag4 = Type
  else
    CameraTag1 = CommonConst.ArmoryType.Char
  end
  return CameraTag1, CameraTag2, CameraTag3, CameraTag4
end

function M:CalcArmoryMontageTag(Type, Tag, Behavior)
  local bShowOrHideWeapon, MontageTag
  if Type == CommonConst.ArmoryType.Char then
    if Behavior == CommonConst.ArmoryType.Mod then
      MontageTag = Const.ArmoryIdleTags.Armory_Mod
      bShowOrHideWeapon = false
    elseif Behavior == CommonConst.ArmoryTag.Skill then
      MontageTag = Const.ArmoryIdleTags.Armory
    elseif Behavior == CommonConst.ArmoryTag.Grade then
      MontageTag = Const.ArmoryIdleTags.Armory_Grade
    elseif Behavior == CommonConst.ArmoryTag.Appearance then
      MontageTag = nil
    else
      MontageTag = Const.ArmoryIdleTags.Armory
    end
  elseif Type == CommonConst.ArmoryType.Weapon then
    if Behavior == CommonConst.ArmoryType.Mod then
      MontageTag = Const.ArmoryIdleTags.Armory_Mod
      if Tag and string.find(Tag, CommonConst.ArmoryTag.UWeapon) then
        bShowOrHideWeapon = false
      else
        bShowOrHideWeapon = true
      end
    elseif Tag and string.find(Tag, CommonConst.ArmoryTag.UWeapon) then
      MontageTag = "Ultra"
    else
      MontageTag = Tag
    end
  elseif Type == CommonConst.ArmoryType.Pet then
    MontageTag = Const.ArmoryIdleTags.Armory_Pet
  else
    MontageTag = Const.ArmoryIdleTags.Armory_Mod
  end
  return MontageTag, bShowOrHideWeapon
end

function M:SetMontageAndCamera(Type, Tag, Behavior, ExtraTag)
  if not IsValid(self.ViewUI) then
    return
  end
  if not self.ArmoryPlayer then
    return
  end
  local ArmoryPlayer = self.ArmoryPlayer
  self.LastMontageAndCameraType = Type
  self.LastMontageAndCameraTag = Tag
  self.LastMontageAndCameraBehavior = Behavior
  self.LastExtraTag = ExtraTag
  if self.DelayFrame and self.DelayFrame > 0 then
    ArmoryPlayer:SetArmoryTag("None")
    self:HidePlayerActor(self.UIName, true)
    self.LastMontageTag, self.bShowOrHideWeapon = self:CalcArmoryMontageTag(self.LastMontageAndCameraType, self.LastMontageAndCameraTag, self.LastMontageAndCameraBehavior)
    self:PlayDisappearFX(ArmoryPlayer.FXComponent, function()
      if self.bClosed or self.bDestructed then
        return
      end
      self:PlayAppearFX(ArmoryPlayer.FXComponent)
      self:HidePlayerActor(self.UIName, false)
      self:RealPlayMontageAndCamera(ArmoryPlayer, self.LastMontageTag, self.bShowOrHideWeapon, self.LastDelayCameraTags)
    end)
  else
    self:RealPlayMontageAndCamera(ArmoryPlayer)
  end
end

function M:PlayDisappearFX(FXComponent, OnFXFinished)
  local DelayFrame = self.DelayFrame
  self.DelayFrame = nil
  local IsLastDisappearFXPlaying = self.DisappearFXPlaying
  self.bWatingForDelayFrame = true
  if FXComponent and not IsLastDisappearFXPlaying and not self.bNoDisappearFX then
    AudioManager(self.ViewUI):PlayUISound(self.ViewUI, "event:/ui/common/role_disappear", nil, nil)
    local Params = {bTickEvenWhenPaused = true, NotAttached = true}
    if self.bPreviewSceneLoaded then
      Params.UseAbsoluteLocation = true
      local Loc = self:GetPreviewSceneTrans().Translation
      Params.Location = {
        Loc.X,
        Loc.Y,
        Loc.Z
      }
    end
    FXComponent:PlayEffectByIDParams(302, Params)
    self.DisappearFXPlaying = true
  end
  if IsLastDisappearFXPlaying then
    return
  end
  self.LTweenHandle_PlayDisappearFX = UE4.ULTweenBPLibrary.DelayFrameCall(self.ViewUI, DelayFrame or 0, function()
    self.LTweenHandle_PlayDisappearFX = nil
    self.DisappearFXPlaying = false
    self.bWatingForDelayFrame = false
    self.bNoDisappearFX = false
    if OnFXFinished then
      OnFXFinished()
    end
  end)
  local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle_PlayDisappearFX)
  if LTweenActor then
    LTweenActor:SetTickableWhenPaused(true)
  end
end

function M:PlayAppearFX(FXComponent)
  if FXComponent and not self.bNoDisappearFX then
    AudioManager(self.ViewUI):PlayUISound(self.ViewUI, "event:/ui/common/role_appear", nil, nil)
    local Params = {bTickEvenWhenPaused = true, NotAttached = true}
    if self.bPreviewSceneLoaded then
      Params.UseAbsoluteLocation = true
      local Loc = self.PreviewSceneTrans.Translation
      Params.Location = {
        Loc.X,
        Loc.Y,
        Loc.Z
      }
    end
    FXComponent:PlayEffectByIDParams(301, Params)
  end
end

function M:RealPlayMontageAndCamera(ArmoryPlayer, MontageTag, bShowOrHideWeapon, CameraTags)
  if nil == MontageTag then
    MontageTag, bShowOrHideWeapon = self:CalcArmoryMontageTag(self.LastMontageAndCameraType, self.LastMontageAndCameraTag, self.LastMontageAndCameraBehavior)
  end
  self:SetArmoryMontageTag(ArmoryPlayer, MontageTag, bShowOrHideWeapon)
  if CameraTags then
    self:SetArmoryCameraTag(table.unpack(CameraTags))
  else
    local Tags = {
      self:CalcArmoryCameraTag(self.LastMontageAndCameraType, self.LastMontageAndCameraTag, self.LastMontageAndCameraBehavior, self.LastExtraTag)
    }
    if next(Tags) then
      self:SetArmoryCameraTag(table.unpack(Tags))
    end
  end
end

function M:ResetActorRotation()
  self.ArmoryHelper:ResetRotation()
  local ArmoryPet = self:GetPetActor()
  if ArmoryPet and ArmoryPet.SkeletalMesh then
    ArmoryPet.SkeletalMesh:K2_SetRelativeRotation(FRotator(0, 0, 0), false, nil, false)
  end
end

function M:BindEvent(Obj, Events)
  Events = Events or {}
  self.EventObj = Obj
  self.OnPlayPetFresnel = Events.OnPlayPetFresnel
  self.OnCharModelChanged = Events.OnCharModelChanged
end

function M:SetArmoryMontageTag(Player, Tag, bShowOrHideWeapon)
  self.bShowOrHideWeapon = bShowOrHideWeapon
  Tag = Tag or "None"
  self.LastMontageTag = Tag
  if self.bWatingForDelayFrame then
    return
  end
  local bPlay = true
  if self.LastMontageTag == self.CurMontageTag and not self.bPlaySameMontage then
    bPlay = false
  end
  if bPlay then
    self:ResetActorRotation()
    self.bPlaySameMontage = false
    self.CurMontageTag = Tag
    Player.UsingWeapon = nil
    if "Ultra" == Tag and not Player:GetWeaponByWeaponTag(Tag, 1) then
      self:AddPlayerUltraWeapons(Player)
    end
    Player:SetArmoryTag(Tag)
  end
  self.LastShowOrHideWeapon = self.bShowOrHideWeapon
  if self.bShowOrHideWeapon == true then
    self:ChangePlayerWeaponByType(self.LastMontageAndCameraTag, Player)
    if Player.UsingWeapon then
      Player:UnBindWeaponFromHand()
    end
  elseif self.bShowOrHideWeapon == false then
    self:ChangePlayerWeaponByType(nil, Player)
  end
  if self.bPlayRoleChangedSound and Tag == Const.ArmoryIdleTags.Armory then
    AudioManager(self.ViewUI):PlayFMODSoundByID(Player, 213, Player, "None", {
      bFollowSocket = true,
      bPlayAs2D = true,
      EventKey = "ArmoryRoleVoice"
    })
  end
  self.bPlayRoleChangedSound = false
  if bPlay or self.bShowOrHideWeapon then
    CommonUtils:SetActorTickableWhenPaused(Player, true)
    if Player.MeleeWeapon then
      CommonUtils:SetActorTickableWhenPaused(Player.MeleeWeapon, true)
      self:SetAccessoriesTickableWhenPaused(Player.MeleeWeapon.Accessories)
    end
    if Player.RangedWeapon then
      CommonUtils:SetActorTickableWhenPaused(Player.RangedWeapon, true)
      self:SetAccessoriesTickableWhenPaused(Player.RangedWeapon.Accessories)
    end
    if Player.UltraWeapon then
      CommonUtils:SetActorTickableWhenPaused(Player.UltraWeapon, true)
      self:SetAccessoriesTickableWhenPaused(Player.UltraWeapon.Accessories)
    end
  end
end

function M:SetAccessoriesTickableWhenPaused(Accessories)
  if Accessories then
    for _, value in pairs(Accessories) do
      CommonUtils:SetActorTickableWhenPaused(value, true)
    end
  end
end

function M:SetExCameraOffset(Offset)
  self.ExCameraOffset = Offset
end

function M:SetArmoryCameraTag(Tag1, Tag2, Tag3, Tag4)
  DebugPrint("gmy@Armory_ActorController M:SetArmoryCameraTag", Tag1, Tag2, Tag3, Tag4)
  self.LastCameraTags = {
    Tag1 or "",
    Tag2 or "",
    Tag3 or "",
    Tag4 or ""
  }
  if self.bWatingForDelayFrame then
    self.LastDelayCameraTags = {
      Tag1 or "",
      Tag2 or "",
      Tag3 or "",
      Tag4 or ""
    }
    return
  end
  self.LastDelayCameraTags = nil
  if self.ArmoryPlayer then
    Tag1 = Tag1 or ""
    Tag2 = "0" == Tag2 and "_" .. self.ArmoryPlayer.PlayerAnimInstance.IdleTag or Tag2 and "" ~= Tag2 and "_" .. Tag2 or ""
    Tag3 = Tag3 and "" ~= Tag3 and "_" .. Tag3 or ""
    Tag4 = Tag4 and "" ~= Tag4 and "_" .. Tag4
  local Tag = Tag1 .. Tag2 .. Tag3 .. Tag4
  DebugPrint("gmy@Armory_ActorController M:SetArmoryCameraTag111", Tag)
  local Data = self:GetCameraData()[Tag]
  if not Data then
    Tag = "Default"
    Data = self:GetCameraData()[Tag]
  end
  local Location = FVector(Data.Location[1], Data.Location[2], Data.Location[3])
  local Rotation = FRotator(Data.Rotation[2], Data.Rotation[3], Data.Rotation[1])
  local OffsetVector = FVector(0, 0, 0)
  local OffsetRotator = FRotator(0, 0, 0)
  local CurrentRoleId = self.ArmoryPlayer and self.ArmoryPlayer.CurrentRoleId or self.ArmoryWeapon.WeaponId
  if Data.LocationOffset then
    local OffsetData = Data.LocationOffset[CurrentRoleId]
    if OffsetData then
      OffsetVector = FVector(OffsetData[1], OffsetData[2], OffsetData[3])
    end
  end
  if Data.RotationOffset then
    local OffsetData = Data.RotationOffset[CurrentRoleId]
    if OffsetData then
      OffsetRotator = OffsetRotator + FRotator(OffsetData[2], OffsetData[3], OffsetData[1])
    end
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self.ViewUI) == "Mobile" then
    local MobileLocationOffset
    if Data.MobileLocationOffset then
      MobileLocationOffset = Data.MobileLocationOffset[CurrentRoleId] or Data.MobileLocationOffset[0]
    end
    if MobileLocationOffset then
      OffsetVector = OffsetVector + FVector(MobileLocationOffset[1], MobileLocationOffset[2], MobileLocationOffset[3])
    end
    local MobileRotationOffset
    if Data.MobileRotationOffset then
      MobileLocationOffset = Data.MobileRotationOffset[CurrentRoleId] or Data.MobileRotationOffset[0]
    end
    if MobileRotationOffset then
      OffsetRotator = OffsetRotator + FRotator(MobileRotationOffset[2], MobileRotationOffset[3], MobileRotationOffset[1])
    end
  end
  if Data.AccessoryLocationOffset and self.CameraOffsetAccessoryId then
    local OffsetData = Data.AccessoryLocationOffset[self.CameraOffsetAccessoryId]
    if OffsetData then
      OffsetVector = OffsetVector + FVector(OffsetData[1], OffsetData[2], OffsetData[3])
    end
  end
  self.CameraOffsetAccessoryId = nil
  self.LastExCameraOffset = self.ExCameraOffset
  if self.ExCameraOffset then
    OffsetVector = OffsetVector + self.ExCameraOffset
    self.ExCameraOffset = nil
  end
  Location = Location + OffsetVector
  Rotation = Rotation + OffsetRotator
  local Time = self._FixedCameraTransTimeOnce or Data.Time or 0
  self._FixedCameraTransTimeOnce = nil
  local StartPos, EndPos = self.ArmoryHelper:TransformCamera(Location, Rotation, Time, Data.Ease)
  local ForwardLocation = Data.ForwardLocation
  local BackwardLocation = Data.BackwardLocation
  if ForwardLocation or BackwardLocation then
    if ForwardLocation then
      ForwardLocation = FVector(ForwardLocation[1], ForwardLocation[2], ForwardLocation[3])
    else
      ForwardLocation = Location
    end
    if BackwardLocation then
      BackwardLocation = FVector(BackwardLocation[1], BackwardLocation[2], BackwardLocation[3])
    else
      BackwardLocation = Location
    end
    BackwardLocation = BackwardLocation + OffsetVector
    ForwardLocation = ForwardLocation + OffsetVector
    self.ArmoryHelper:SetCameraScrollRange(ForwardLocation, BackwardLocation, 0.5, Data.Ease)
    self.ArmoryHelper.EnableCameraScrolling = true
  else
    self.ArmoryHelper.EnableCameraScrolling = false
  end
  local FOV = CommonUtils:FocalLengthToFOV(Data.CameraFocal or 22)
  self.ArmoryHelper:StartFOVAnim(FOV, Time, Data.Ease)
  if self.bPreviewSceneLoaded and self.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewCommon then
    self:StartPreviewBGAnimation(Data.PreviewBGPos, Time)
  end
  if "Default" ~= Tag then
    if self.LastApplyCameraTag and self.LastApplyCameraTag ~= Tag and StartPos then
      local CameraDistance = (StartPos - EndPos):Size()
      if CameraDistance > 150 then
        AudioManager(self.ViewUI):StopSound(self.ArmoryHelper, "ArmoryCameraMoveShort")
        AudioManager(self.ViewUI):PlayUISound(self.ArmoryHelper, "event:/ui/common/whoosh_cam_move_long", "ArmoryCameraMoveLong", nil)
      elseif CameraDistance > 1 then
        AudioManager(self.ViewUI):StopSound(self.ArmoryHelper, "ArmoryCameraMoveLong")
        AudioManager(self.ViewUI):PlayUISound(self.ArmoryHelper, "event:/ui/common/whoosh_cam_move_short", "ArmoryCameraMoveShort", nil)
      end
    end
    self.LastApplyCameraTag = Tag
  end
end

function M:FixedCameraTransTimeOnce(Time)
  self._FixedCameraTransTimeOnce = Time
end

function M:UpdateCameraPPSetting()
  self.ViewUI:AddTimer(0.1, function()
    self.ArmoryHelper:ClearPPSetting()
    if self.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewArmory then
      self.ArmoryHelper:UpdatePPSetting(1)
    elseif self.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewCommon then
      self.ArmoryHelper:UpdatePPSetting(2)
    else
      self.ArmoryHelper:UpdatePPSetting(0)
    end
  end)
end

function M:GetCameraData()
  local SystemUI = DataMgr.SystemUI
  if self.UIName == SystemUI.ArmoryMain.UIName or self.UIName == SystemUI.ArmoryDetail.UIName then
    return DataMgr.ArmoryCameraData
  elseif self.UIName == SystemUI.PersonInfoPageMain.UIName then
    return DataMgr.PersonalPageCameraData
  elseif self.UIName == SystemUI.SquadMainUI.UIName then
    return DataMgr.SquadCameraData
  elseif self.UIName == SystemUI.BattlePassMain.UIName or self.UIName == SystemUI.BattlePassPurchase.UIName or self.UIName == SystemUI.CharSkinPreview.UIName then
    return DataMgr.BattlePassCameraData
  elseif self.UIName == SystemUI.SkinPreview.UIName then
    return DataMgr.SkinPreviewCameraData
  else
    return DataMgr.ArmoryCameraData
  end
end

function M:OnDragging(CursorDelta)
  local ArmoryPet = self:GetPetActor()
  if ArmoryPet and ArmoryPet.SkeletalMesh then
    CursorDelta = CursorDelta or {X = 0}
    local DeltaRotation = FRotator(0, math.clamp(-CursorDelta.X, -20, 20), 0)
    ArmoryPet.SkeletalMesh:K2_AddRelativeRotation(DeltaRotation, false, nil, false)
  else
    self.ArmoryHelper:OnDragging(CursorDelta)
  end
end

function M:OnScrolling(DeltaMove)
  self.ArmoryHelper:OnScrolling(DeltaMove)
end

function M:OnRecorverCameraEnd()
  self:BeforeDestruct()
  if self.Event_OnRecorverCameraEnd then
    self.Event_OnRecorverCameraEnd.Func(self.Event_OnRecorverCameraEnd.Obj)
  end
end

function M:BeforeDestruct()
end

function M:OnClosed()
  if self.bClosed then
    return
  end
  self.bClosed = true
  self:RecoverCamera()
  self:OnClosed_Implementation()
end

function M:OnClosed_Implementation()
  try({
    exec = function()
      self:ChangeRealPlayerInfo()
      self:HideRealPlayer(false)
      self:Component_OnClosed()
    end,
    catch = function(err)
      local trace = debug.traceback()
      err = err or ""
      DebugPrint("Error:" .. "\n" .. trace)
    end
  })
end

function M:Component_OnClosed()
end

function M:RecoverCamera()
  if not self.bNeedEndCamera then
    self:SwitchArmoryCamera(false, 0)
  else
    if self.Event_OnRecorverCameraStart then
      self.Event_OnRecorverCameraStart.Func(self.Event_OnRecorverCameraStart.Obj)
    end
    self:SwitchArmoryCamera(false, nil)
  end
end

function M:OnDestruct()
  if self.bDestructed then
    return
  end
  SelfObjCount = SelfObjCount - 1
  self.bDestructed = true
  if not self.bClosed then
    self:OnClosed_Implementation()
  end
  EventManager:RemoveEvent(EventID.OnWindowResized, self)
  self:Component_OnDestruct()
  self.ArmoryHelper:DestroyViewActorIfNeed()
  if self.LTweenHandle_PlayDisappearFX and IsValid(self.LTweenHandle_PlayDisappearFX) and IsValid(self.ViewUI) then
    ULTweenBPLibrary.KillIfIsTweening(self.ViewUI, self.LTweenHandle_PlayDisappearFX, false)
  end
  if IsValid(self.ArmoryHelper) then
    self.ArmoryHelper:K2_DestroyActor()
  end
  self.ViewUI = nil
end

function M:Component_OnDestruct()
end

function M:ViewTarget()
  if not IsValid(self.ArmoryHelper) then
    return
  end
  local Controller = UE4.UGameplayStatics.GetPlayerController(self.ArmoryHelper, 0)
  Controller:SetViewTargetWithBlend(self.ArmoryHelper, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
end

function M:GetViewTarget()
  return self.ArmoryHelper
end

function M:SetAvatar(Avatar)
  self.Avatar = Avatar
end

function M:GetAvatar()
  return self.Avatar
end

function M:DestoryCreature(Key)
  if self.Creatures[Key] then
    self.Creatures[Key]:DestroyEffectCreature()
    self.Creatures[Key] = nil
  end
end

function M:Init(Params)
  Params = Params or {}
  self.Params = Params
  self.ViewUI = Params.ViewUI
  self.IsPreviewMode = Params.IsPreviewMode
  self.EPreviewSceneType = Params.EPreviewSceneType
  self.PreviewSceneLocation = Params.PreviewSceneLocation
  self.SkyBoxColor = Params.SkyBoxColor
  self.bNeedEndCamera = Params.bNeedEndCamera
  self.Avatar = Params.Avatar or ArmoryUtils:GetAvatar()
  self.CurrentCharInfo = Params.Char
  self.CurrentWeaponInfo = Params.Weapon
  self.CurrentPetInfo = Params.Pet
  self.Event_OnRecorverCameraStart = Params.OnRecorverCameraStart
  self.Event_OnRecorverCameraEnd = Params.OnRecorverCameraEnd
  self.SmoothLoad = Params.SmoothLoad or false
  self.ViewActorTypes = {Player = 1, SingleWeapon = 2}
  self.Creatures = {}
  self.IsSecondary = SelfObjCount > 1
  self.UIName = self.ViewUI:GetUIConfigName()
  if Params.bPlayRoleChangedSound ~= nil then
    self.bPlayRoleChangedSound = Params.bPlayRoleChangedSound
  else
    self.bPlayRoleChangedSound = true
  end
  if self.CurrentPetInfo then
    local Gender2RoleIds = DataMgr.Player2RoleId.Player
    local DummyAvatar = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Prime, {
      CharIds = {
        Gender2RoleIds[self.Avatar.Sex]
      }
    })
    local _, tempChar = next(DummyAvatar.Chars)
    self.CurrentCharInfo = tempChar
  end
  EventManager:AddEvent(EventID.OnWindowResized, self, function(self)
    self.ViewUI:AddTimer(0.3, function()
      if self.LastCameraTags then
        self:SetArmoryCameraTag(table.unpack(self.LastCameraTags))
      end
    end, false, 0, "DelayUpdateCamera", true)
  end)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if not Player then
    return
  end
  print(_G.LogtTag, "Player:RemoveSyncUsingWeapon()")
  Player:RemoveSyncUsingWeapon()
  Player:RemoveSyncLocation()
end

function M:New(Params)
  SelfObjCount = SelfObjCount + 1
  local Obj = {}
  self.__index = self
  setmetatable(Obj, self)
  Obj:Init(Params)
  return Obj
end

AssembleComponents(M)
return M
