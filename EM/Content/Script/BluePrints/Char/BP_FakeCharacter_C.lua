local M = Class("BluePrints.Char.BP_CharacterBase_C")

function M:Initialize(Initializer)
end

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.InitSuccess = true
  self:ForceSetCanExtractZVelocity()
  self:GetMovementComponent():SetMovementMode(EMovementMode.MOVE_Flying)
end

function M:InitFakeCharacter(Info)
  self.InitInfo = Info
  self.ShadowModelId = Info.ShadowModelId
  self.CurrentRoleId = Info.CurrentRoleId
  self.ModelId = Info.ModelId
  self:GetCharModelComponent():LoadCurrentModel()
end

function M:GetObjType()
  return EObjType.FakeCharacter
end

function M:CheckCanPart()
  return self.InitInfo.CanPart
end

return M
