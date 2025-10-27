local WaitingCompleteSysGuideNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitingCompleteSysGuideNode:Init()
  self.SystemGuideId = 0
  self.ListenInterval = 0.5
  self.CallBackFunc = nil
end

function WaitingCompleteSysGuideNode:Execute(Callback)
  self.NodeKey = "WaitingCompleteSysGuideNode_" .. tostring(self.Key)
  self.ListenHandleName = "ListenSystemGuideComplete_" .. tostring(self.Key)
  print("-----------------------------------WaitingCompleteSysGuideNode node start-----------------------------------")
  self.CallBackFunc = Callback
  self.ListenTimer = GWorld.GameInstance:AddTimer(self.ListenInterval, function()
    self:IsCompeleteSystemGuide()
  end, true)
end

function WaitingCompleteSysGuideNode:IsCompeleteSystemGuide()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    if self.ListenTimer then
      GWorld.GameInstance:RemoveTimer(self.ListenTimer)
      self.ListenTimer = nil
    end
    return
  end
  if Avatar.SystemGuides:GetSystemGuide(self.SystemGuideId):IsFinished() then
    if self.ListenTimer then
      GWorld.GameInstance:RemoveTimer(self.ListenTimer)
      self.ListenTimer = nil
    end
    if self.CallBackFunc then
      self.CallBackFunc("Out")
    end
  end
end

function WaitingCompleteSysGuideNode:Clear()
  if self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
end

return WaitingCompleteSysGuideNode
