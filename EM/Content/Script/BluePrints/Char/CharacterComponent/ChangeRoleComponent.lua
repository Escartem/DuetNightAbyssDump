local Component = {}

function Component:ChangeRole(RoleId, AvatarInfo)
  DebugPrint("BuffLogic ChangeRole", tostring(RoleId))
  if not IsStandAlone(self) then
    PrintTable({
      Error = "\229\164\154\228\186\186\232\129\148\230\156\186\230\168\161\229\188\143\228\184\141\232\131\189\230\141\162\228\186\186"
    })
    return
  end
  AvatarInfo = AvatarInfo or AvatarUtils:GetDefaultAvatarInfo()
  self:RealChangeRole(RoleId, AvatarInfo)
  self:SetupCameraControlComponent()
end

function Component:RealChangeRole(RoleId, AvatarInfo)
  if self.ClearMaterialEffect then
    self:ClearMaterialEffect()
  end
  self:GetCharPreloadComp():ReleaseCacheAssets()
  self:DestroyPlayerPreloadSummon()
  self:QuickRecovery(true)
  self:RealChangeRoleByAvatarInfo(RoleId, AvatarInfo)
end

function Component:RealChangeRoleByAvatarInfo(RoleId, AvatarInfo)
  self:GetCharPreloadComp():ReleaseCacheAssets()
  self.BornInfo = nil
  local InfoForInit = {
    Camp = "Player",
    RoleId = RoleId,
    ChangeRole = true,
    AvatarInfo = AvatarInfo
  }
  self:InitCharacterInfo(InfoForInit)
end

return Component
