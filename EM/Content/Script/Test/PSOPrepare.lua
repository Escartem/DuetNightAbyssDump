local MiscUtils = require("Utils.MiscUtils")
local PrepareManager = Class()

function PrepareManager:Initialize(Initializer)
  print(_G.LogTag, "PSOPrepare Initialize", os.date("%Y-%m-%d %H:%M:%S", os.time()))
  self.Avatar = Initializer
  self.ClientAvatar = self.Avatar:GetClientAvatar()
  self.LocOffset = FVector(800, 0, 0)
  self.Player = self.Avatar.Player
  self.PlayerController = self.Player:GetController()
  self.GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  self.EventMgr = self.GameMode.EMGameState.EventMgr
  self.TimerNames = {}
end

function PrepareManager:DoPrepare(QualityLevel, UnitType)
  local QualityLevel = QualityLevel and tonumber(QualityLevel) or 0
  UEMGameInstance.SetOverallScalabilityLevel(QualityLevel)
  local Func = self["Prepare" .. UnitType]
  if Func then
    Func(self)
  else
    print(_G.LogTag, "PSOPrepare UnitType not supported", UnitType)
    return
  end
end

function PrepareManager:GenSquare(Loc, num)
  local centerX = Loc.X
  local centerY = Loc.Y
  local z = Loc.Z
  local points = {}
  local step = 100
  local sideLength = math.ceil(math.sqrt(num)) * step
  local half = sideLength / 2
  for i = 0, sideLength, step do
    for j = 0, sideLength, step do
      local x = centerX - half + i
      local y = centerY - half + j
      if num >= #points then
        table.insert(points, FVector(x, y, z))
      else
        break
      end
    end
  end
  return points
end

function PrepareManager:CommonPrepare(UnitType)
  local Location = self.Player:K2_GetActorLocation()
  local Data = DataMgr[UnitType]
  local NewLocaltion = Location + self.LocOffset
  local NewRotation = UE4.UKismetMathLibrary.FindLookAtRotation(NewLocaltion, Location)
  local Points = self:GenSquare(NewLocaltion, CommonUtils.Size(Data))
  local sub_index = 1
  for UnitId, Info in pairs(Data) do
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = UnitId
    Context.UnitType = UnitType
    Context.Loc = Points[sub_index]
    Context.Rotation = NewRotation
    Context.Creator = self.GameMode.FixedCreator
    Context.IntParams:Add("Level", 1)
    Context.BoolParams:Add("FixLocation", true)
    self.EventMgr:CreateUnitNew(Context, false)
    sub_index = sub_index + 1
  end
end

function PrepareManager:PrepareMonster()
  local Location = self.Player:K2_GetActorLocation()
  local Data = DataMgr.Monster
  local NewLocaltion = Location + FVector(0, 200, 0)
  local NewRotation = UE4.UKismetMathLibrary.FindLookAtRotation(NewLocaltion, Location)
  local Idx = 1
  local MonsterIdList = CommonUtils.Keys(Data)
  self.Avatar:ServerBattleCommand("MaxHp", self.Player.Eid)
  self.Player:AddTimer(5, function()
    if Idx > CommonUtils.Size(MonsterIdList) then
      self.Player:RemoveTimer("PSOPrepareMonster")
      return
    end
    if Idx > 1 then
      self.Avatar:ServerBattleCommand("KillMonster", self.Player.Eid, nil)
    end
    local MonsterId = MonsterIdList[Idx]
    local MonsterData = Data[MonsterId]
    local IsNotRelease = MonsterData.IsNotRelease or false
    if not IsNotRelease then
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitId = tonumber(MonsterId)
      Context.UnitType = "Monster"
      Context.Loc = Location
      Context.Rotation = NewRotation
      Context.IntParams:Add("Level", 1)
      Creator = UE4.UGameplayStatics.GetGameMode(self.EventMgr).FixedCreator
      Context.Creator = Creator
      Context.BoolParams:Add("FixLocation", true)
      self.EventMgr:CreateUnitNew(Context, false)
      print(_G.LogTag, "PSOPrepare PrepareMonster MonsterId", MonsterId)
    else
      print(_G.LogTag, "PSOPrepare PrepareMonster IsNotRelease", MonsterId)
    end
    Idx = Idx + 1
  end, true, 1, "PSOPrepareMonster", true)
end

function PrepareManager:PrepareNpc()
  self:CommonPrepare("Npc")
end

function PrepareManager:PreparePet()
  self:CommonPrepare("Pet")
end

function PrepareManager:PreparePhantom()
  local Location = self.Player:K2_GetActorLocation()
  local Data = DataMgr.Char
  local NewLocaltion = Location + self.LocOffset
  local NewRotation = UE4.UKismetMathLibrary.FindLookAtRotation(NewLocaltion, Location)
  local Points = self:GenSquare(NewLocaltion, CommonUtils.Size(Data))
  local sub_index = 1
  for RoleId, CharInfo in pairs(Data) do
    if not CharInfo.IsNotOpen then
      print(_G.LogTag, "PSOPrepare PreparePhantom RoleId", RoleId)
      local PhantomInfo = DataMgr.Phantom[RoleId] or {}
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitType = "Phantom"
      Context.UnitId = RoleId
      Context.Loc = Points[sub_index]
      Context.Rotation = NewRotation
      Context.Creator = self.GameMode.FixedCreator
      Context.IntParams:Add("RoleId", RoleId)
      Context.IntParams:Add("BTIndex", 0)
      Context.IntParams:Add("PhantomOwnerEid", self.Eid)
      Context.IntParams:Add("Camp", ECampName.Player)
      Context.BoolParams:Add("IsHostage", PhantomInfo.IsHostage)
      Context.IntParams:Add("FixLocationZ", 0)
      Context.IntParams:Add("RegionDataType", 0)
      Context.IntParams:Add("Level", 1)
      Context.BoolParams:Add("FixLocation", true)
      Context:AddLuaTable("AvatarInfo", nil)
      self.Player:CreatePhantomNew(Context, RoleId, true, false, false, 1)
      sub_index = sub_index + 1
    end
  end
end

function PrepareManager:PrepareFX()
  local Location = self.Player:K2_GetActorLocation()
  local NewLocaltion = Location + FVector(0, 200, 0)
  local Folder = "/Game/Asset/Effect/Niagara/"
  local AssetRegistry = UE4.UAssetRegistryHelpers.GetAssetRegistry()
  local NiagaraArray = TArray(UE4.FAssetData)
  local NewRotation = FRotator(0, 0, 0)
  AssetRegistry:GetAssetsByPath(Folder, NiagaraArray, true, false)
  local i = 1
  local LastNiagara
  self.Player:AddTimer(5, function()
    if i > NiagaraArray:Length() then
      return
    end
    if LastNiagara and IsValid(LastNiagara) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(LastNiagara)
    end
    local NiagaraAsset = NiagaraArray:Get(i)
    local path = NiagaraAsset.ObjectPath
    local AssetClass = NiagaraAsset.AssetClass
    if "NiagaraSystem" == AssetClass then
      local NiagaraObject = LoadObject(path)
      if IsValid(NiagaraObject) then
        LastNiagara = self.Player.FXComponent:PlayFX(NiagaraObject, self.Player.Mesh, nil, NewLocaltion, NewRotation, true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Always)
      else
        print(_G.LogTag, os.date("%Y-%m-%d %H:%M:%S", os.time()), "PSOPrepare PrepareFX Invalid", path)
      end
    end
    i = i + 1
  end, true, 1, "PSOPlayFX", true)
end

function PrepareManager:PrepareCharSkin()
  self.ClientAvatar:CallServerMethod("GMAddAllChar")
  self.ClientAvatar:CallServerMethod("GMAddAllSkin")
  self.ClientAvatar:CallServerMethod("GMAddAllDressup")
  
  local function UseSkill()
    local SkillIdx = 1
    local CharSkillList = self.ClientAvatar.Chars[self.ClientAvatar.CurrentChar].Skills
    self.Player:AddTimer(1, function()
      if SkillIdx > CommonUtils.Size(CharSkillList) then
        self.Player:RemoveTimer("PSOUseSkill")
      end
      local SkillId = CharSkillList[SkillIdx].SkillId
      local SkillData = DataMgr.Skill[SkillId]
      if not SkillData or SkillData.SkillType ~= "Passive" or SkillData.SkillType ~= "ExtraPassive" then
        print(_G.LogTag, "PSOPrepare UseSkill", SkillIdx, SkillId)
        self.Player:UseSkill(SkillId, 0)
        SkillIdx = SkillIdx + 1
      end
    end, true, 1, "PSOUseSkill", true)
  end
  
  local function RefreshCharCallback(Ret, CharUuid)
    self.ClientAvatar.logger.debug("OnSwitchCurrentChar", Ret, CharUuid)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnSwitchRole, self.ClientAvatar.CurrentChar)
  end
  
  self.ClientAvatar.OnSwitchCurrentChar = RefreshCharCallback
  
  local function RefreshSkinCallback(Ret, CharUuid, AppearanceIndex, SkinId)
    self.ClientAvatar.logger.debug("OnChangeCharAppearanceSkin", Ret)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnCharSkinChanged, Ret, CharUuid, AppearanceIndex, SkinId)
  end
  
  local function RefreshAccessoryCallback(Ret, CharUuid, AppearanceIndex, AccessoryId)
    self.ClientAvatar.logger.debug("OnSetCharAppearanceAccessory", Ret)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnCharAccessorySetted, Ret, CharUuid, AppearanceIndex, AccessoryId)
  end
  
  local AppearanceIndex = 1
  local a = 1
  self.Player:AddTimer(5, function()
    if CommonUtils.Size(self.ClientAvatar.CharAccessorys) <= 1 then
      return
    end
    if a > CommonUtils.Size(self.ClientAvatar.CharAccessorys) then
      self.Player:RemoveTimer("PSOCharAccessory")
    end
    local AccessoryId = self.ClientAvatar.CharAccessorys[a]
    self.ClientAvatar:CallServer("SetCharAppearanceAccessory", function(Ret)
      RefreshAccessoryCallback(Ret, self.ClientAvatar.CurrentChar, AppearanceIndex, AccessoryId)
    end, self.ClientAvatar.CurrentChar, AppearanceIndex, AccessoryId)
    a = a + 1
  end, true, 5, "PSOCharAccessory", true)
  local i = 1
  local j = 1
  self.Player:AddTimer(5, function()
    local CharUuids = CommonUtils.Keys(self.ClientAvatar.Chars)
    if CommonUtils.Size(CharUuids) <= 1 then
      return
    end
    if i > CommonUtils.Size(self.ClientAvatar.Chars) then
      self.Player:RemoveTimer("PSOCharSkin")
    end
    local CharUuid = CharUuids[i]
    local CharInfo = self.ClientAvatar.Chars[CharUuid]
    local CharId = CharInfo.CharId
    local CharData = DataMgr.Char[CharId]
    local SkinIds = CharData.SkinId
    if self.ClientAvatar.CurrentChar ~= CharUuid then
      self.ClientAvatar:SwitchCurrentChar(CharUuid)
    end
    if j > CommonUtils.Size(SkinIds) then
      j = 1
      i = i + 1
    else
      local SkinId = SkinIds[j]
      self.ClientAvatar:CallServer("ChangeCharAppearanceSkin", function(Ret)
        RefreshSkinCallback(Ret, CharUuid, AppearanceIndex, SkinId)
      end, CharUuid, AppearanceIndex, SkinId)
      j = j + 1
    end
  end, true, 5, "PSOCharSkin", true)
end

function PrepareManager:PrepareWeaponSkin()
  self.ClientAvatar:CallServerMethod("GMAddAllWeapon")
  self.ClientAvatar:CallServerMethod("GMAddAllWeaponSkin")
  self.ClientAvatar:CallServerMethod("GMAddAllWeaponAccessory")
  
  local function UseAttackSkill(WeaponUuid)
    local WeaponInfo = self.ClientAvatar.Weapons[WeaponUuid]
    local WeaponId = WeaponInfo and WeaponInfo.WeaponId
    local BattleWeaponData = DataMgr.BattleWeapon[WeaponId]
    if not BattleWeaponData then
      return
    end
    local WeaponSkillList = BattleWeaponData.WeaponSkillList or {}
    local AttackSKillId = WeaponSkillList[1]
    self.Player:UseSkill(AttackSKillId, 0)
  end
  
  local function RefreshWeaponCallback(inst, Ret, WeaponTag, WeaponUuid)
    self.ClientAvatar.logger.debug("yc_test OnSwitchWeapon", Ret, WeaponTag, WeaponUuid)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnSwitchWeapon, WeaponTag, WeaponUuid)
    UseAttackSkill(WeaponUuid)
  end
  
  self.ClientAvatar.OnSwitchWeapon = RefreshWeaponCallback
  
  local function RefreshSkinCallback(Ret, WeaponUuid, SkinId)
    self.ClientAvatar.logger.debug("yc_test OnChangeCharAppearanceSkin", Ret, WeaponUuid, SkinId)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnWeaponSkinChanged, Ret, WeaponUuid, SkinId)
    UseAttackSkill(WeaponUuid)
  end
  
  local function RefreshAccessoryCallback(Ret, WeaponUuid, AccessoryId)
    self.ClientAvatar.logger.debug("yc_test OnChangeWeaponAppearanceAccessory", Ret, WeaponUuid, AccessoryId)
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(self.ClientAvatar)
    self.PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(self.ClientAvatar.Eid), AvatarInfo)
    self.Player:ChangeRole(nil, AvatarInfo)
    EventManager:FireEvent(EventID.OnWeaponAccessoryChanged, Ret, WeaponUuid, AccessoryId)
  end
  
  local a = 1
  self.Player:AddTimer(3, function()
    if CommonUtils.Size(self.ClientAvatar.WeaponAccessorys) <= 1 then
      return
    end
    if a > CommonUtils.Size(self.ClientAvatar.WeaponAccessorys) then
      self.Player:RemoveTimer("PSOWeaponAccessory")
    end
    local AccessoryId = self.ClientAvatar.WeaponAccessorys[a]
    self.ClientAvatar:CallServer("ChangeWeaponAppearanceAccessory", function(Ret)
      RefreshAccessoryCallback(Ret, self.ClientAvatar.MeleeWeapon, AccessoryId)
    end, self.ClientAvatar.MeleeWeapon, AccessoryId)
    a = a + 1
  end, true, 3, "PSOWeaponAccessory", true)
  local i = 1
  local j = 1
  local WeaponSkinData = DataMgr.WeaponSkin
  local WeaponSkinIds = CommonUtils.Keys(WeaponSkinData)
  self.Player:AddTimer(4, function()
    local WeaponUuids = CommonUtils.Keys(self.ClientAvatar.Weapons)
    if CommonUtils.Size(WeaponUuids) <= 1 then
      return
    end
    if i > CommonUtils.Size(self.ClientAvatar.Weapons) then
      self.Player:RemoveTimer("PSOWeaponSkin")
    end
    local WeaponUuid = WeaponUuids[i]
    local WeaponInfo = self.ClientAvatar.Weapons[WeaponUuid]
    local WeaponId = WeaponInfo.WeaponId
    local BattleWeaponData = DataMgr.BattleWeapon[WeaponId]
    local WeaponData = DataMgr.Weapon[WeaponId]
    if CommonUtils.HasValue(BattleWeaponData.WeaponTag, CommonConst.WeaponType.MeleeWeapon) then
      if self.ClientAvatar.MeleeWeapon ~= WeaponUuid then
        self.ClientAvatar:SwitchWeapon(CommonConst.WeaponType.MeleeWeapon, WeaponUuid)
      end
    elseif CommonUtils.HasValue(BattleWeaponData.WeaponTag, CommonConst.WeaponType.RangedWeapon) and self.ClientAvatar.RangedWeapon ~= WeaponUuid then
      self.ClientAvatar:SwitchWeapon(CommonConst.WeaponType.RangedWeapon, WeaponUuid)
    end
    local SkinApplicationType = WeaponData.SkinApplicationType
    local WeaponSkinItem = WeaponSkinData[WeaponSkinIds[j]]
    if j > CommonUtils.Size(WeaponSkinIds) then
      j = 1
      i = i + 1
    else
      local CanApply = CommonUtils.HasValue(SkinApplicationType, WeaponSkinItem.ApplicationType) and WeaponSkinItem.SkinId ~= WeaponInfo:GetAppearance().SkinId or false
      if CanApply then
        self.ClientAvatar:CallServer("ChangeWeaponAppearanceSkin", function(Ret)
          RefreshSkinCallback(Ret, WeaponUuid, WeaponSkinItem.SkinId)
        end, WeaponUuid, WeaponSkinItem.SkinId)
      end
      j = j + 1
    end
  end, true, 3, "PSOWeaponSkin", true)
end

function PrepareManager:PrepareGestureItem()
  local ItemTypes = {
    "GestureItem",
    "BattleItem"
  }
  local ItemIds = {}
  for ResourceId, ResourceData in pairs(DataMgr.Resource) do
    local ResourceType = ResourceData.Type
    local ResourceSubType = ResourceData.ResourceSType
    if "InfiniteBattleItem" == ResourceType and CommonUtils.HasValue(ItemTypes, ResourceSubType) then
      self.ClientAvatar:CallServerMethod("GMAddResource", ResourceId, 1)
      table.insert(ItemIds, ResourceId)
    end
  end
  
  local function RefreshChangeGestureCallback(Ret, WheelIndex, SlotId, ResourceId)
    self.ClientAvatar.logger.debug("ChangeBattleWheel", Ret, WheelIndex, SlotId, ResourceId)
    EventManager:FireEvent(EventID.OnChangeBattleWheel, Ret, WheelIndex, SlotId, ResourceId)
  end
  
  local i = 1
  local SlotId = 1
  self.Player:AddTimer(5, function()
    if i > CommonUtils.Size(ItemIds) then
      self.Player:RemoveTimer("PSOGesture")
    end
    local ItemId = ItemIds[i]
    self.ClientAvatar:CallServer("ChangeBattleWheel", function(Ret)
      RefreshChangeGestureCallback(Ret, self.ClientAvatar.WheelIndex, SlotId, ItemId)
    end, self.ClientAvatar.WheelIndex, SlotId, ItemId)
    i = i + 1
    self.ClientAvatar:UseWheelItemInBattle(ItemId)
  end, true, 1, "PSOGesture", true)
end

return PrepareManager
