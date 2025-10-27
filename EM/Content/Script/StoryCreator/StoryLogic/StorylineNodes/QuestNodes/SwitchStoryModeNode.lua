local SwitchStoryModeNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function SwitchStoryModeNode:Init()
  self.LastStoryMode = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  self.LastStoryMode = PlayerController:GetStoryModeState()
  self.IsOpen = false
end

function SwitchStoryModeNode:Execute()
  DebugPrint("-----------------------------------SwitchStoryModeNode-----------------------------------", self.IsOpen)
  self:SetStoryModeInternal(self.IsOpen)
end

function SwitchStoryModeNode:SetStoryModeInternal(bEnable)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  PlayerController:SetStoryModeState(bEnable)
end

function SwitchStoryModeNode:OnQuestlineSuccess()
  self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.SwitchStoryMode, "IsInStoryMode", self.IsOpen)
end

function SwitchStoryModeNode:OnQuestlineFail()
  DebugPrint("SwitchStoryModeNode On QuestlineFail,\232\191\152\229\142\159\229\137\167\230\131\133\230\168\161\229\188\143\239\188\140\232\191\152\229\142\159\228\184\186", self.LastStoryMode)
  self:SetStoryModeInternal(self.LastStoryMode)
end

return SwitchStoryModeNode
