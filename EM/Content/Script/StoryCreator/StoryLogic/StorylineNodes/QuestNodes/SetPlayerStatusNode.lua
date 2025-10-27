local SetPlayerStatusNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")
local MiscUtils = require("Utils.MiscUtils")

function SetPlayerStatusNode:Init()
  self.HPPercent = -1.0
  self.ESPercent = -1.0
  self.SPPercent = -1.0
  self.BuffList = {}
  self.RecoverPlayer = false
end

function SetPlayerStatusNode:Execute()
  local Avatar = GWorld:GetAvatar()
  local GameInstance = GWorld.GameInstance
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  local PlayerCharacter = PlayerController:GetMyPawn()
  if PlayerCharacter:IsDead() and self.RecoverPlayer == true then
    PlayerCharacter:Recovery()
  end
  PlayerCharacter:AddHp(self:CalcModifyAttrPercentChangeValue(PlayerCharacter, "Hp", self.HPPercent))
  PlayerCharacter:AddEnergyShield(self:CalcModifyAttrPercentChangeValue(PlayerCharacter, "ES", self.ESPercent), nil)
  Battle(PlayerCharacter):AddSpToTarget(PlayerCharacter, PlayerCharacter, MiscUtils.Round(self:CalcModifyAttrPercentChangeValue(PlayerCharacter, "Sp", self.SPPercent)), EChangedSpReason.FromBP)
  for _, Buff in pairs(self.BuffList) do
    Battle(PlayerCharacter):AddBuffToTarget(PlayerCharacter, PlayerCharacter, Buff.Id, Buff.LastTime, Buff.Value, nil)
  end
end

function SetPlayerStatusNode:Clear()
end

function SetPlayerStatusNode:CalcModifyAttrPercentChangeValue(Target, AttrName, AttrPercent)
  if AttrPercent < 0.0 then
    return 0.0
  end
  AttrPercent = math.clamp(AttrPercent, 0.0, 1.0)
  local SourceAttrValue = Target:GetAttr(AttrName)
  local TargetAttrValue = Target:GetAttr("Max" .. AttrName) * AttrPercent
  local ChangeAttrValue = TargetAttrValue - SourceAttrValue
  return ChangeAttrValue
end

return SetPlayerStatusNode
