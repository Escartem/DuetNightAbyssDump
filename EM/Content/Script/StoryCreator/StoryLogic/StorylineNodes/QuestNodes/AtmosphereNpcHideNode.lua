local AtmosphereNpcHideNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function AtmosphereNpcHideNode:Init()
  self.IsHide = false
  self.AtmosphereTagList = {}
end

function AtmosphereNpcHideNode:Start(Context)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if GameMode and GameMode.GameState then
    for _, Tag in pairs(self.AtmosphereTagList) do
      GameMode.GameState:HideCustomNpcsByAtmosphereTag(self.IsHide, Tag)
    end
  end
  self:Finish()
end

function AtmosphereNpcHideNode:OnQuestlineSuccess()
  self.Context:SaveSuitUpdateData("UpdateSuitTable2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.NpcHideShowTag, self.AtmosphereTagList, self.IsHide)
end

return AtmosphereNpcHideNode
