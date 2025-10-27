local Component = {}

function Component:ClientAddWeapon(Weapon)
  if 0 == self.Weapons:Num() then
    self.Tag2WeaponId:Clear()
    self.LastWeaponIds = {}
  end
  self:RawAddWeapon(Weapon)
  local WeaponData = DataMgr.BattleWeapon[Weapon.WeaponId]
  if WeaponData then
    local bIsUltra = Weapon:HasTag("Ultra")
    for _, WeaponTag in pairs(WeaponData.WeaponTag) do
      if bIsUltra then
        self.Tag2WeaponId:Add("Ultra", Weapon.WeaponId)
      else
        self.Tag2WeaponId:Add(WeaponTag, Weapon.WeaponId)
      end
    end
  end
  if self.WeaponNum > 0 and self.Weapons:Num() == self.WeaponNum then
    self:InitWeaponHideState()
  end
  return Weapon
end

function Component:ChangeUsingWeaponById(WeaponId)
  self.WeaponPos = Const.Shoulder
  if not WeaponId then
    self:RealChangeUsingWeapon(nil)
    self.EMAnimInstance.WeaponTagFloat = 0
    self.WeaponTagFloat = 0
    return
  end
  local NewWeapon = self:GetWeapon(WeaponId)
  assert(NewWeapon, UE4.UKismetSystemLibrary.GetDisplayName(self) .. "\230\178\161\230\156\137\229\175\185\229\186\148\227\128\144" .. tostring(WeaponId) .. "\227\128\145\231\154\132\230\173\166\229\153\168")
  if self.UsingWeapon and self.UsingWeapon.WeaponId == NewWeapon.WeaponId then
    return
  end
  if self.UsingWeapon and self.UsingWeapon:HasTag("Melee") then
    self:ZeroComboCount(UE4.EClearComboReason.ChangeWeapon)
  end
  self:BindWeaponToHand(NewWeapon)
  self:RealChangeUsingWeapon(NewWeapon)
  NewWeapon:ShouldHideWeapon(true)
end

function Component:GetMonsterFirstWeapon()
  local WeaponId = self.Data.WeaponId and self.Data.WeaponId[1]
  if not WeaponId then
    return
  end
  return self:GetWeapon(WeaponId)
end

function Component:ServerChangeMonsterWeapon(ChangeReason)
  if not self:IsMonster() then
    return
  end
  local WeaponIndex = self.Data.ChangeWeaponParams[ChangeReason]
  if not WeaponIndex then
    return
  end
  self.LastWeaponIndex = self.WeaponIndex
  self.WeaponIndex = WeaponIndex
  if 0 == WeaponIndex then
  end
  if self.LastWeaponIndex then
    local LastWeaponIndex = self.Data.WeaponId[self.LastWeaponIndex]
  end
  local LastWeaponWeapon = self:GetWeapon(self.LastWeaponIndex)
  if LastWeaponWeapon then
    LastWeaponWeapon:ShouldHideWeapon(true)
  end
  local WeaponId = self.Data.WeaponId[WeaponIndex]
  self:ChangeUsingWeaponById(WeaponId)
  self:GetOwnBlackBoardComponent():SetValueAsInt("WeaponIndex", WeaponIndex)
end

function Component:SetUpCondemnWeapon()
  local WeaponId = self:GetCondemnWeaponId()
  if not WeaponId then
    return
  end
  local Weapon = self:AddWeapon(WeaponId)
  if not Weapon then
    return
  end
  Weapon:ShouldHideWeapon(true)
  Weapon:UnBindWeaponFromHand(true, true)
  Weapon:DeactivateSkills()
end

function Component:SpawnShowWeapon(WeaponId, Transform, ReplaceAttrs, SkillInfos, AppearanceInfo, WeaponInfo)
  local _Data = DataMgr.BattleWeapon[WeaponId]
  local WeaponClass = UE4.UClass.Load(_Data.WeaponBlueprint)
  assert(WeaponClass, "\230\137\190\228\184\141\229\136\176\229\177\149\231\164\186\230\173\166\229\153\168\232\147\157\229\155\190:" .. tostring(_Data.WeaponBlueprint))
  local NewShowWeapon = self:GetWorld():SpawnActor(WeaponClass, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, self, nil)
  NewShowWeapon:InitWeaponInfo(WeaponId, false, ReplaceAttrs, SkillInfos, AppearanceInfo, WeaponInfo)
  return NewShowWeapon
end

function Component:SpawnShowWeaponAsync(WeaponId, Transform, ReplaceAttrs, SkillInfos, AppearanceInfo, WeaponInfo, OnLoaded)
  local _Data = DataMgr.BattleWeapon[WeaponId]
  local AssetPath = _Data.WeaponBlueprint
  assert(AssetPath, "\229\177\149\231\164\186\230\173\166\229\153\168\232\183\175\229\190\132\228\184\186\231\169\186\239\188\140WeaponId = " .. tostring(WeaponId))
  self._ShowWeaponRequestId = (self._ShowWeaponRequestId or 0) + 1
  local ThisRequestId = self._ShowWeaponRequestId
  UE4.UResourceLibrary.LoadClassAsync(self, AssetPath, {
    self,
    function(_, ClassObject)
      if ThisRequestId ~= self._ShowWeaponRequestId then
        DebugPrint("[\229\177\149\231\164\186\230\173\166\229\153\168] \229\188\130\230\173\165\229\138\160\232\189\189\232\162\171\229\143\150\230\182\136")
        return
      end
      if not ClassObject then
        DebugPrint("\229\188\130\230\173\165\229\138\160\232\189\189\229\177\149\231\164\186\230\173\166\229\153\168\229\164\177\232\180\165: ", AssetPath)
        return
      end
      local NewShowWeapon = self:GetWorld():SpawnActor(ClassObject, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, self, nil)
      NewShowWeapon.bIsShow = true
      local co = coroutine.create(function()
        NewShowWeapon:InitWeaponInfo(WeaponId, false, ReplaceAttrs, SkillInfos, AppearanceInfo, WeaponInfo, true)
        coroutine.yield()
        if ThisRequestId ~= self._ShowWeaponRequestId then
          NewShowWeapon:K2_DestroyActor()
          DebugPrint("[\229\177\149\231\164\186\230\173\166\229\153\168] \229\188\130\230\173\165\229\138\160\232\189\189\232\162\171\229\143\150\230\182\136")
          return
        end
        NewShowWeapon:OnWeaponReady()
        if OnLoaded then
          OnLoaded(NewShowWeapon)
        end
      end)
      EventManager:AddEvent(EventID.OnShowWeaponLoadFinished, self, self.OnShowWeaponLoadFinished)
      self.ShowWeaponCoroutines = self.ShowWeaponCoroutines or {}
      self.ShowWeaponCoroutines[NewShowWeapon] = co
      coroutine.resume(co)
    end
  })
end

function Component:OnShowWeaponLoadFinished(ShowWeapon)
  if not self.ShowWeaponCoroutines or next(self.ShowWeaponCoroutines) == nil then
    EventManager:RemoveEvent(EventID.OnShowWeaponLoadFinished, self)
    return
  end
  if self.ShowWeaponCoroutines[ShowWeapon] then
    coroutine.resume(self.ShowWeaponCoroutines[ShowWeapon])
  end
end

return Component
