local MonitorPlayerStatusNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function MonitorPlayerStatusNode:Init()
  self.ListenInterval = 0.5
  self.ListenHPPercent = false
  self.ListenESPercent = false
  self.ListenSPPercent = false
  self.ListenDead = false
end

function MonitorPlayerStatusNode:Execute(Callback)
  if self.ListenHPPercent or self.ListenESPercent or self.ListenSPPercent or self.ListenDead then
    self.Callback = Callback
    self:StartListen()
  else
    self:StopListen(false)
  end
end

function MonitorPlayerStatusNode:Clear()
  self:StopListen(false)
end

function MonitorPlayerStatusNode:StartListen()
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.ListenTarget = PlayerCharacter
  self.ListenPercentMap = {}
  if self.ListenHPPercent then
    self:AddListenPercent("Hp")
  end
  if self.ListenESPercent then
    self:AddListenPercent("ES")
  end
  if self.ListenSPPercent then
    self:AddListenPercent("Sp")
  end
  self.ExecuteTimer = GWorld.GameInstance:AddTimer(self.ListenInterval, function()
    self:LoopListen()
  end, true)
end

function MonitorPlayerStatusNode:LoopListen()
  if not self.ListenTarget then
    self:StopListen(false)
  end
  for _, ListenAttr in pairs(self.ListenPercentMap) do
    local NowPercent = self.ListenTarget:GetAttr(ListenAttr.Name) / self.ListenTarget:GetAttr(ListenAttr.MaxName)
    if NowPercent ~= ListenAttr.RecordPercent then
      self:StopListen(true)
    end
  end
  if self.ListenDead and self.ListenTarget:IsDead() then
    self:StopListen(true)
  end
end

function MonitorPlayerStatusNode:StopListen(TriggerCallback)
  DebugPrint("Tianyi@ MonitorPlayerStatus StopListen")
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
  if TriggerCallback and self.Callback then
    DebugPrint("Tianyi@ MonitorPlayerStatus StopListen TriggerCallback")
    self.Callback()
  end
end

function MonitorPlayerStatusNode:AddListenPercent(AttrName)
  local ListenAttr = {
    Name = AttrName,
    MaxName = "Max" .. AttrName
  }
  ListenAttr.RecordPercent = self.ListenTarget:GetAttr(ListenAttr.Name) / self.ListenTarget:GetAttr(ListenAttr.MaxName)
  table.insert(self.ListenPercentMap, ListenAttr)
end

return MonitorPlayerStatusNode
