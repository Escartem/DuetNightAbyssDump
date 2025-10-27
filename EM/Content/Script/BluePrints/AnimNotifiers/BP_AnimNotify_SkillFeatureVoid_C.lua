local M = Class()

function M:Received_Notify(MeshComp, Animation)
  local PlayerCharacter = MeshComp:GetOwner()
  if not PlayerCharacter then
    return false
  end
  PlayerCharacter.SkillFeature = true
  if PlayerCharacter.AddTimer then
    PlayerCharacter:AddTimer(self:GetSequenceDuration(), function(InPlayer)
      InPlayer.SkillFeature = false
    end, false, 0, "SkillFeature")
  end
  if IsStandAlone(self) or IsClient(self) then
    self:DoFeature(MeshComp)
  end
  return true
end

return M
