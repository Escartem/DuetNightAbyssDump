require("UnLua")
local Component = Class()

function Component:GetCurrentModelInfo()
  return DataMgr.Model[self.Owner.ModelId]
end

function Component:GetCurrentKawaiiLinkLayer(Id)
  local ModelId = Id
  ModelId = ModelId or DataMgr.BattleChar[self.CurrentRoleId].ModelId
  if not DataMgr.Model[ModelId] then
    return
  end
  local LinkLayerPath = DataMgr.Model[ModelId].LinkLayerPath
  return LinkLayerPath
end

function Component:GetNPCServerSkinIdByUnitId(NpcId)
  if not NpcId or not DataMgr.Npc[NpcId] then
    return
  end
  local NpcInfo = DataMgr.Npc[NpcId]
  if NpcInfo.NpcType ~= "Show" or not NpcInfo.CharId then
    return
  end
  local CharId = NpcInfo.CharId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local SkinId
  for key, Char in pairs(Avatar.Chars) do
    if Char.CharId == CharId then
      local Appearance = Char.AppearanceSuits[Char.CurrentAppearanceIndex]
      SkinId = Appearance.SkinId
      break
    end
  end
  local CommonChar = Avatar.CommonChars[CharId]
  local Skin = CommonChar.OwnedSkins[SkinId]
  local SkinInfo = DataMgr.Skin[SkinId]
  if not SkinInfo or not SkinInfo.NpcSkinModelId then
    return
  end
  local ModelId = SkinInfo.NpcSkinModelId
  return ModelId
end

function Component:GetRotationMontagePath()
  local ModelData = DataMgr.Model[self:GetCurrentModelId()]
  return ModelData.MontageFolder .. "Locomotion/" .. ModelData.MontagePrefix .. "Rotation_Montage"
end

function Component:HaveBodyId()
  return self.Owner and self.Owner.BodyId
end

return Component
