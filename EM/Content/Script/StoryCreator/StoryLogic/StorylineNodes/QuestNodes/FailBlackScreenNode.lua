local FailBlackScreenNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function FailBlackScreenNode:Init()
  self.Text = ""
  self.FadeInTime = 0
  self.FadeOutTime = 0
  self.ContinueTime = 0
  self.Tag = "FailBlackScreenNode"
  self.BlackScreenContinueTimer = nil
end

function FailBlackScreenNode:Execute(Callback)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    Callback()
    return
  end
  
  local function OnFailBlackScreenContinueFinish()
    self:BlackScreenContinueFinishClear()
    Callback()
  end
  
  local function FailBlackScreenContinue()
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if IsValid(PlayerCharacter) then
      PlayerCharacter:SetEmoIdleEnabled(false)
    end
    self:SetMonstersVisibility(false)
    TalkSubsystem():InterruptAllLightTask()
    self.BlackScreenContinueTimer = GWorld.GameInstance:AddTimer(self.ContinueTime, OnFailBlackScreenContinueFinish, false, nil, nil, true)
  end
  
  local Params = {}
  Params.BlackScreenHandle = self.Tag
  Params.BlackScreenText = GText(self.Text)
  Params.InAnimationObj = self
  Params.InAnimationCallback = FailBlackScreenContinue
  Params.InAnimationPlayTime = self.FadeInTime
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = nil
  Params.OutAnimationPlayTime = self.FadeOutTime
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(PlayerCharacter) then
    PlayerCharacter:AddDisableInputTag(self.Tag)
  end
  UIManager:SetBannedActionCallback("BlackScreen", true, self.Tag)
  UIManager:ShowCommonBlackScreen(Params)
end

function FailBlackScreenNode:SetMonstersVisibility(bNewVisibility)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not IsValid(GameState) then
    return
  end
  GameState:HideAllRealMonsters(not bNewVisibility, self.Tag)
end

function FailBlackScreenNode:BlackScreenContinueFinishClear()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(PlayerCharacter) then
    PlayerCharacter:RemoveDisableInputTag(self.Tag)
    PlayerCharacter:SetEmoIdleEnabled(true)
  end
  self:SetMonstersVisibility(true)
  self.BlackScreenContinueTimer = nil
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:SetBannedActionCallback("BlackScreen", false, self.Tag)
  UIManager:HideCommonBlackScreen(self.Tag)
end

function FailBlackScreenNode:Clear()
  if self.BlackScreenContinueTimer then
    self:BlackScreenContinueFinishClear()
  end
end

return FailBlackScreenNode
