require("UnLua")
local ModModel = ModController:GetModel()
local Component = {}

function Component:ProcessCharTabExInfo(Info, CharContent, ...)
  if Info then
    CharContent.Info = Info
    if Info.Tag == "Char" then
      self.TargetCharUuid = CharContent.Target.Uuid
    end
    if self.Tag == Info.Tag then
      self.Tag = "Char"
      self.CurTargetTabContent = CharContent
    end
  else
    self.TargetCharUuid = CharContent.Target.Uuid
    if self.Tag == "Char" then
      self.CurTargetTabContent = CharContent
    end
  end
end

function Component:ProcessWeaponTabExInfo(Info, WeaponContent, ...)
  local WeaponTag = (...)
  if Info then
    WeaponContent.IsPhantomWeapon = Info.IsPhantom
    if Info.OwnerChar then
      WeaponContent.OwnerChar = Info.OwnerChar
      local PhantomCharId = Info.OwnerChar.CharId
      WeaponContent.PhantomCharId = PhantomCharId
    end
    if self.Tag == Info.Tag then
      self.Tag = WeaponTag
      self.CurTargetTabContent = WeaponContent
    end
  elseif self.Tag == WeaponTag then
    self.CurTargetTabContent = WeaponContent
  end
end

function Component:GetCurrWeaponOwnerChar()
  local Avatar = ModModel:GetAvatar()
  local Char
  if self.CurTargetTabContent.OwnerChar then
    Char = self.CurTargetTabContent.OwnerChar
  else
    Char = Avatar.Chars[self.TargetCharUuid]
  end
  Char = Char or self.ReplaceChar
  return Char
end

return Component
