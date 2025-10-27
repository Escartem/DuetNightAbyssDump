local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function M:Init()
  self.FadeTime = 0
  self.FadeType = "FadeIn"
  self.Tag = "CommonBlackFadeInOutNode"
end

function M:Execute(Callback)
  DebugPrint("------------ CommonBlackFadeInOutNode Execute------------------")
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    Callback()
    return
  end
  if self.FadeType == "FadeIn" then
    UIManager:HideCommonBlackScreen(self.Tag)
    UIManager:ShowCommonBlackScreen({
      BlackScreenHandle = self.Tag,
      InAnimationObj = self,
      InAnimationPlayTime = self.FadeTime,
      InAnimationCallback = function()
        self:SetPlayerCharacterInputEnabled(false)
        self:SetPlayerCharacterEmoIdleEnabled(false)
        self:SetMonstersVisibility(false)
        Callback()
      end,
      IsPlayOutWhenLoaded = false
    })
  else
    self:SetPlayerCharacterInputEnabled(true)
    self:SetPlayerCharacterEmoIdleEnabled(true)
    self:SetMonstersVisibility(true)
    UIManager:HideCommonBlackScreen(self.Tag)
    UIManager:ShowCommonBlackScreen({
      BlackScreenHandle = self.Tag,
      OutAnimationObj = self,
      OutAnimationPlayTime = self.FadeTime,
      OutAnimationCallback = function()
        UIManager:HideCommonBlackScreen(self.Tag)
        Callback()
      end,
      IsPlayOutWhenLoaded = true
    })
  end
end

function M:Clear()
end

function M:SetPlayerCharacterInputEnabled(bNewEnabled)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(PlayerCharacter) then
    return
  end
  if bNewEnabled then
    PlayerCharacter:RemoveDisableInputTag(self.Tag)
    UIManager(GWorld.GameInstance):SetBannedActionCallback("BlackScreen", false)
  else
    PlayerCharacter:AddDisableInputTag(self.Tag)
    UIManager(GWorld.GameInstance):SetBannedActionCallback("BlackScreen", true)
  end
end

function M:SetPlayerCharacterEmoIdleEnabled(bNewEnabled)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(PlayerCharacter) then
    return
  end
  PlayerCharacter:SetEmoIdleEnabled(bNewEnabled)
end

function M:SetMonstersVisibility(bNewVisibility)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not IsValid(GameState) then
    return
  end
  GameState:HideAllRealMonsters(not bNewVisibility, self.Tag)
  GameState:HideAllPhantom(not bNewVisibility, self.Tag)
end

return M
