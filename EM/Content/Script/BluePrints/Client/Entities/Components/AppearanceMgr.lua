local Component = {}

function Component:CheckWeaponSkinEnough(CheckData)
  for WeaponSkinId, Count in pairs(CheckData) do
    local WeaponSkin = self.OwnedWeaponSkins[WeaponSkinId]
    if not WeaponSkin then
      return false
    end
  end
  return true
end

function Component:CheckWeaponAccessoryEnough(CheckData)
  for WeaponAccessoryId, Count in pairs(CheckData) do
    if not self.WeaponAccessorys:HasValue(WeaponAccessoryId) then
      return false
    end
  end
  return true
end

function Component:CheckSkinEnough(CheckData)
  for CharSkinId, Count in pairs(CheckData) do
    local SkinInfo = DataMgr.Skin[CharSkinId]
    if not SkinInfo or not SkinInfo.CharId then
      return false
    end
    local CharId = SkinInfo.CharId
    local CharInfo = DataMgr.Char[CharId]
    if not CommonUtils.HasValue(CharInfo.SkinId, CharSkinId) then
      return false
    end
    local CommonChar = self.CommonChars[CharId]
    if CommonChar then
      if CommonChar.OwnedSkins[CharSkinId] == nil then
        return false
      end
    else
      local OtherCharSkin = self.OtherCharSkins[CharId]
      if not OtherCharSkin then
        return false
      end
      if not OtherCharSkin:HasValue(CharSkinId) then
        return false
      end
    end
  end
  return true
end

function Component:CheckCharAccessoryEnough(CheckData)
  if next(CheckData) == nil then
    return true
  end
  for CharAccessoryId, _ in pairs(CheckData) do
    if not DataMgr.CharAccessory[CharAccessoryId] then
      return false
    end
    if not self.CharAccessorys:HasValue(CharAccessoryId) then
      return false
    end
  end
  return true
end

function Component:AddNewCharAppearance()
  local function Callback(Ret)
    DebugPrint("ZJT_ AddNewCharAppearance ", Ret)
  end
  
  self:CallServer("AddNewCharAppearance", Callback, self.CurrentChar)
end

function Component:SwitchCurrentCharAppearance(CharUuid, AppearanceIndex)
  CharUuid = CharUuid or self.CurrentChar
  
  local function Callback(Ret)
    DebugPrint("ZJT_ SwitchCurrentCharAppearance", Ret)
    EventManager:FireEvent(EventID.OnCharAppearanceChanged, Ret, CharUuid, AppearanceIndex)
  end
  
  self:CallServer("SwitchCurrentCharAppearance", Callback, CharUuid, AppearanceIndex)
end

function Component:SetCharAppearanceAccessory(CharUuid, AppearanceIndex, AccessoryId)
  CharUuid = CharUuid or self.CurrentChar
  
  local function Callback(Ret)
    DebugPrint("ZJT_ SetCharAppearanceAccessory ", Ret)
    EventManager:FireEvent(EventID.OnCharAccessorySetted, Ret, CharUuid, AppearanceIndex, AccessoryId)
  end
  
  self:CallServer("SetCharAppearanceAccessory", Callback, CharUuid, AppearanceIndex, AccessoryId)
end

function Component:RemoveCharAppearanceAccessory(CharUuid, AppearanceIndex, AccessoryId)
  CharUuid = CharUuid or self.CurrentChar
  
  local function Callback(Ret)
    DebugPrint("ZJT_ RemoveCharAppearanceAccessory ", Ret)
    EventManager:FireEvent(EventID.OnCharAccessoryRemoved, Ret, CharUuid, AppearanceIndex, AccessoryId)
  end
  
  self:CallServer("RemoveCharAppearanceAccessory", Callback, CharUuid, AppearanceIndex, AccessoryId)
end

function Component:SetCharSkinShowPart(CharUuid, SkinId, IsShowPartMesh)
  local function Callback(Ret)
    self.logger.debug("ZJT_ 1 SetCharSkinShowPart ServerCallClient ", Ret, CharUuid, SkinId, IsShowPartMesh)
    
    EventManager:FireEvent(EventID.OnCharShowPartMesh, Ret, CharUuid, SkinId, IsShowPartMesh)
  end
  
  self:CallServer("SetCharSkinShowPart", Callback, CharUuid, SkinId, IsShowPartMesh)
end

function Component:ChangeCharAppearanceSkin(CharUuid, AppearanceIndex, SkinId)
  local function Callback(Ret)
    DebugPrint("ZJT_ ChangeCharAppearanceSkin ", Ret)
    
    EventManager:FireEvent(EventID.OnCharSkinChanged, Ret, CharUuid, AppearanceIndex, SkinId)
  end
  
  self:CallServer("ChangeCharAppearanceSkin", Callback, CharUuid, AppearanceIndex, SkinId)
end

function Component:SetCharCornerVisibility(CharUuid, AppearancIndex, IsVisible)
  CharUuid = CharUuid or self.CurrentChar
  
  local function Callback(Ret)
    DebugPrint("ZJT_ SetCharCornerVisibility ", Ret)
    EventManager:FireEvent(EventID.OnCharCornerVisibilityChanged, Ret, CharUuid, AppearancIndex, IsVisible)
  end
  
  self:CallServer("SetCharCornerVisibility", Callback, CharUuid, AppearancIndex, IsVisible)
end

function Component:ChangeWeaponAppearanceAccessory(WeaponUuid, AccessoryId)
  self.logger.debug("ChangeWeaponAppearanceAccessory Start", CommonUtils.ObjId2Str(WeaponUuid), AccessoryId)
  
  local function callback(Ret)
    self.logger.debug("ChangeWeaponAppearanceAccessory callback", Ret, AccessoryId)
    EventManager:FireEvent(EventID.OnWeaponAccessoryChanged, Ret, WeaponUuid, AccessoryId)
  end
  
  self:CallServer("ChangeWeaponAppearanceAccessory", callback, WeaponUuid, AccessoryId)
end

function Component:ChangeWeaponAppearanceSkin(WeaponUuid, SkinId)
  self.logger.debug("ChangeWeaponAppearanceSkin Start", CommonUtils.ObjId2Str(WeaponUuid), SkinId)
  
  local function callback(Ret)
    self.logger.debug("ChangeWeaponAppearanceSkin callback", Ret, SkinId)
    EventManager:FireEvent(EventID.OnWeaponSkinChanged, Ret, WeaponUuid, SkinId)
  end
  
  self:CallServer("ChangeWeaponAppearanceSkin", callback, WeaponUuid, SkinId)
end

function Component:SwitchCurrentWeaponSkinColorPlan(WeaponUuid, SkinId, NewPlanIndex)
  self.logger.debug("SwitchCurrentWeaponSkinColorPlan Start", CommonUtils.ObjId2Str(WeaponUuid), SkinId, NewPlanIndex)
  
  local function callback(Ret)
    self.logger.debug("SwitchCurrentWeaponSkinColorPlan callback", Ret, SkinId, NewPlanIndex)
    EventManager:FireEvent(EventID.OnWeaponSkinColorPlanChanged, Ret, WeaponUuid, SkinId, NewPlanIndex)
  end
  
  self:CallServer("SwitchCurrentWeaponSkinColorPlan", callback, WeaponUuid, SkinId, NewPlanIndex)
end

function Component:ChangeWeaponSkinColors(WeaponUuid, SkinId, PlanIndex, NewColorWithPart)
  self.logger.debug("ChangeWeaponSkinColors Start", CommonUtils.ObjId2Str(WeaponUuid), SkinId)
  
  local function callback(Ret)
    EventManager:FireEvent(EventID.OnWeaponColorsChanged, Ret, WeaponUuid, SkinId, PlanIndex, NewColorWithPart)
    self.logger.debug("ChangeWeaponSkinColors callback", Ret, SkinId, PlanIndex)
  end
  
  self:CallServer("ChangeWeaponSkinColors", callback, WeaponUuid, SkinId, PlanIndex, NewColorWithPart)
end

function Component:ChangeWeaponSkinSpecialColor(WeaponUuid, SkinId, PlanIndex, NewColor)
  self.logger.debug("ChangeWeaponSkinSpecialColor Start", CommonUtils.ObjId2Str(WeaponUuid), SkinId, PlanIndex, NewColor)
  
  local function callback(Ret)
    self.logger.debug("ChangeWeaponSkinSpecialColor callback", Ret, SkinId)
    EventManager:FireEvent(EventID.OnWeaponColorsChanged, Ret, WeaponUuid, SkinId, PlanIndex, NewColor)
  end
  
  self:CallServer("ChangeWeaponSkinSpecialColor", callback, WeaponUuid, SkinId, PlanIndex, NewColor)
end

function Component:UpdateCharAppearanceSuitName(CharUuid, AppearanceIndex, NewName)
  local function Callback(Ret)
    self.logger.debug("ZJT_ UpdateCharAppearanceSuitName ", Ret, NewName)
    
    EventManager:FireEvent(EventID.OnCharAppearanSuitRenamed, Ret, CharUuid, AppearanceIndex, NewName)
  end
  
  self:CallServer("UpdateCharAppearanceSuitName", Callback, CharUuid, AppearanceIndex, NewName)
end

function Component:UpdateWeaponAppearanceSuitName(WeaponUuid, NewName)
  local function Callback(Ret)
    self.logger.debug("ZJT_ UpdateWeaponAppearanceSuitName ", Ret, NewName)
    
    EventManager:FireEvent(EventID.OnWeaponAppearanSuitRenamed, Ret, WeaponUuid, NewName)
  end
  
  self:CallServer("UpdateWeaponAppearanceSuitName", Callback, WeaponUuid, NewName)
end

function Component:SwitchCurrentCharSkinColorPlan(SkinId, NewPlanIndex)
  local function Callback(Ret)
    self.logger.debug("ZJT_ ServerCallClient SwitchCurrentCharSkinColorPlan ", Ret, SkinId, NewPlanIndex)
    
    EventManager:FireEvent(EventID.OnCharSkinColorPlanChanged, Ret, SkinId, NewPlanIndex)
  end
  
  self:CallServer("SwitchCurrentCharSkinColorPlan", Callback, SkinId, NewPlanIndex)
end

function Component:ChangeCharSkinColors(SkinId, NewColorWithPart, PlanIndex)
  PlanIndex = PlanIndex or 1
  if not (type(NewColorWithPart) == "table" and SkinId) or not DataMgr.Skin[SkinId] then
    return
  end
  
  local function Callback(Ret)
    self.logger.debug("ChangeCharSkinColors, Ret", Ret, SkinId, NewColorWithPart)
    EventManager:FireEvent(EventID.OnCharColorsChanged, Ret, SkinId, NewColorWithPart)
  end
  
  self:CallServer("ChangeCharSkinColors", Callback, SkinId, PlanIndex, NewColorWithPart)
end

return Component
