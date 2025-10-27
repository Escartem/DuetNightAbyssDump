local ShowBlackScreenHeadPhoneNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function ShowBlackScreenHeadPhoneNode:Init()
  self.Tag = "ShowBlackScreenHeadPhoneNode"
  self.HeadPhoneWidget = nil
  self.HeadPhoneWidgetSystemUIName = "BlackScreenHeadPhone"
  self.BlendInTime = 1.0
  self.BlendOutTime = 1.0
  self.DelayTime = 3.0
end

function ShowBlackScreenHeadPhoneNode:Execute(Callback)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager and Callback then
    Callback()
    return
  end
  self.HeadPhoneWidget = UIManager:LoadUINew(self.HeadPhoneWidgetSystemUIName)
  if not IsValid(self.HeadPhoneWidget) and Callback then
    Callback()
    return
  end
  local InitContent = {}
  InitContent.Node = self
  InitContent.BlendInTime = self.BlendInTime
  InitContent.BlendOutTime = self.BlendOutTime
  self.HeadPhoneWidget:Init(InitContent)
  self:SetPlayerCharacterInputEnabled(false)
  self.HeadPhoneWidget:PlayInAnimation(self.BlendInTime)
  self.PlayOutTimer = GWorld.GameInstance:AddTimer(self.BlendInTime + self.DelayTime, function()
    if (not self or not self.HeadPhoneWidget) and Callback then
      Callback()
      return
    end
    self.HeadPhoneWidget:PlayOutAnimation(self.BlendOutTime)
  end)
  self.EndTimer = GWorld.GameInstance:AddTimer(self.BlendInTime + self.DelayTime + self.BlendOutTime, function()
    if (not self or not self.HeadPhoneWidget) and Callback then
      Callback()
      return
    end
    self.HeadPhoneWidget:StopAllAnimations()
    if Callback then
      Callback()
      return
    end
  end)
end

function ShowBlackScreenHeadPhoneNode:SetPlayerCharacterInputEnabled(bNewEnabled)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(PlayerCharacter) then
    return
  end
  if bNewEnabled then
    PlayerCharacter:RemoveDisableInputTag(self.Tag)
  else
    PlayerCharacter:AddDisableInputTag(self.Tag)
  end
end

function ShowBlackScreenHeadPhoneNode:Clear()
  self:SetPlayerCharacterInputEnabled(true)
  if IsValid(self.HeadPhoneWidget) then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if not UIManager and Callback then
      Callback(false)
      return
    end
    UIManager:UnLoadUI(self.HeadPhoneWidgetSystemUIName)
    self.HeadPhoneWidget = nil
  end
  if self.PlayOutTimer then
    GWorld.GameInstance:RemoveTimer(self.PlayOutTimer)
    self.PlayOutTimer = nil
  end
  if self.EndTimer then
    GWorld.GameInstance:RemoveTimer(self.EndTimer)
    self.EndTimer = nil
  end
end

function ShowBlackScreenHeadPhoneNode:OnQuestlineFinish()
end

function ShowBlackScreenHeadPhoneNode:OnQuestlineSuccess()
end

function ShowBlackScreenHeadPhoneNode:OnQuestlineFail()
end

return ShowBlackScreenHeadPhoneNode
