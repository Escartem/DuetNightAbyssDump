local Component = {}

function Component:TryCreateDefaultSquad()
  DebugPrint("TryCreateDefaultSquad")
  if self.Squad:Length() > 0 then
    return
  end
  self:CallServerMethod("ClientTryCreateDefaultSquad")
end

function Component:CreateSquad(Callback, Info)
  DebugPrint("CreateSquad")
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("CreateSquad", cb, self.Squad:Length() + 1, Info)
end

function Component:DeleteSquad(Callback, Index)
  DebugPrint("DeleteSquad", Index)
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("DeleteSquad", cb, Index)
end

function Component:UpdateSquad(Callback, Index, Info)
  DebugPrint("UpdateSquad", Index)
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("UpdateSquad", cb, Index, Info)
end

function Component:SwitchSquad(Callback, CallbackObj, SourceIndex, TargetIndex)
  DebugPrint("SwitchSquad")
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(CallbackObj, ret)
    end
  end
  
  self:CallServer("SwitchSquad", cb, SourceIndex, TargetIndex)
end

function Component:tttt()
  self:UpdateSquad(nil, 1, {Name = "SnowMoon01"})
end

function Component:_OnPropChangeSquad()
  DebugPrint("Squad update", self.Squad:Length())
  local SquadMain = UIManager(self):GetUI("SquadMainUINew")
  if SquadMain and not SquadMain.IsDraging then
    if SquadMain.IsInSortState then
      SquadMain:SwitchToSquadList(false)
    else
      SquadMain:SwitchToSquadList(true)
    end
  end
end

function Component:GetSquadCreateInfoByNow(SquadName)
  self.logger.debug("GetSquadCreateInfoByNow")
  return {
    Name = SquadName,
    Char = self.CurrentChar,
    ModSuit = self.Chars[self.CurrentChar].ModSuitIndex,
    MeleeWeapon = self.MeleeWeapon,
    MeleeWeaponModSuit = self.Weapons[self.MeleeWeapon].ModSuitIndex,
    RangedWeapon = self.RangedWeapon,
    RangedWeaponModSuit = self.Weapons[self.RangedWeapon].ModSuitIndex,
    WheelIndex = self.WheelIndex,
    Pet = self.CurrentPet
  }
end

function Component:CreateTempSquad()
  return self.Squad:CreateSquad(self:GetSquadCreateInfoByNow("TempSquad"))
end

function Component:SwitchSquadAutoPhantom(NewState)
  print(_G.LogTag, "SwitchSquadAutoPhantom", NewState)
  self:CallServerMethod("SwitchSquadAutoPhantom", NewState)
end

return Component
