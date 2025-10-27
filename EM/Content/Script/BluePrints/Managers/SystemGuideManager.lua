local SystemGuideManager = {}
SystemGuideManager.GuideDic = {}
SystemGuideManager.GuideUnfinishedDic = {}
SystemGuideManager.GuideQueue = {}
SystemGuideManager.IsGuideStoryRunning = false
SystemGuideManager.RunningId = -1
SystemGuideManager.bOpenDebug = false
SystemGuideManager.GuideEventList = {}

function SystemGuideManager:AddListenerSystemGuide()
  self:ClearSystemGuideData()
  self:InitSystemGuideData()
  self:RemoveSystemGuideEvents()
  self:AddSystemGuideEvents()
end

function SystemGuideManager:AddSystemGuideEvents()
  self:AddSystemGuideEvent(EventID.SystemGuideEnterRegion, self.EnterRegionEvent)
  self:AddSystemGuideEvent(EventID.SystemGuideExitRegion, self.ExitRegionEvent)
  self:AddSystemGuideEvent(EventID.SystemGuideEnterDungeon, self.EnterDungeonEvent)
  self:AddSystemGuideEvent(EventID.SystemGuideExitDungeon, self.ExitDungeonEvent)
  self:AddSystemGuideEvent(EventID.LoadUI, self.LoadUIEvent)
  self:AddSystemGuideEvent(EventID.UnLoadUI, self.UnLoadUIEvent)
  self:AddSystemGuideEvent(EventID.QuestFinished, self.FinishQuestEvent)
  self:AddSystemGuideEvent(EventID.QuestChainFinished, self.FinishQuestChainEvent)
  self:AddSystemGuideEvent(EventID.OnSystemUnlockEnding, self.UIUnlockRuleIdsFinishedEvent)
  self:AddSystemGuideEvent(EventID.OnBecomeViewTarget, self.OnBecomeViewTarget)
  self:AddSystemGuideEvent(EventID.OnEndViewTarget, self.OnEndViewTarget)
  self:AddSystemGuideEvent(EventID.SetInputMode, self.SetInputModeEvent)
  self:AddSystemGuideEvent(EventID.ImpressionTalk, self.ImpressionTalkEvent)
  self:AddSystemGuideEvent(EventID.TalkComp, self.TalkCompEvent)
  self:AddSystemGuideEvent(EventID.OnSystemUnlockWorkingStart, self.SystemUnlockWorkingStartEvent)
  self:AddSystemGuideEvent(EventID.OnSystemUnlockWorkingEnd, self.SystemUnlockWorkingEndEvent)
  self:AddSystemGuideEvent(EventID.FirstSeenTag, self.FirstSeenTagEvent)
  self:AddSystemGuideEvent(EventID.FirstDynQuest, self.FirstDynQuest)
  self:AddSystemGuideEvent(EventID.FirstPanFixTalk, self.FirstPanFixTalk)
  self:AddSystemGuideEvent(EventID.ConditionComplete, self.ConditionCompleteEvent)
end

function SystemGuideManager:IsNeedAddListener(EventId)
  for key, value in pairs(self.GuideUnfinishedDic) do
    if (EventId == EventID.SystemGuideEnterRegion or EventId == EventID.SystemGuideExitRegion) and value.Data.IsInRegion ~= nil then
      return true
    elseif (EventId == EventID.SystemGuideEnterDungeon or EventId == EventID.SystemGuideExitDungeon) and nil ~= value.Data.EnterDungeon then
      return true
    elseif (EventId == EventID.LoadUI or EventId == EventID.UnLoadUI) and nil ~= value.Data.OpenInterface then
      return true
    elseif EventId == EventID.QuestFinished and nil ~= value.Data.FinishQuest then
      return true
    elseif EventId == EventID.QuestChainFinished and nil ~= value.Data.FinishQuestChain then
      return true
    elseif EventId == EventID.OnSystemUnlockEnding and nil ~= value.Data.UIUnlockRule then
      return true
    elseif EventId == EventID.SetInputMode and nil ~= value.Data.PlayerInControl then
      return true
    elseif EventId == EventID.ImpressionTalk and "ImpressionTalk" == value.Data.SpecialCondition then
      return true
    elseif EventId == EventID.TalkComp and "ImpressionTalk" ~= value.Data.SpecialCondition then
      return true
    elseif EventId == EventID.OnSystemUnlockWorkingStart or EventId == EventID.OnSystemUnlockWorkingEnd then
      return true
    elseif EventId == EventID.FirstSeenTag and nil ~= value.Data.FirstSeenTag then
      return true
    elseif EventId == EventID.FirstDynQuest and value.Data.SpecialCondition == "FirstDynQuest" then
      return true
    elseif EventId == EventID.FirstPanFixTalk and value.Data.SpecialCondition == "FirstPanFixTalk" then
      return true
    elseif EventId == EventID.ConditionComplete and nil ~= value.Data.ConditionCheck then
      return true
    elseif EventId == EventID.OnEndViewTarget then
      return true
    elseif EventId == EventID.OnBecomeViewTarget then
      return true
    end
  end
  return false
end

function SystemGuideManager:TryRemoveUnusedListener()
  if #self.GuideEventList > 0 then
    for i = #self.GuideEventList, 1, -1 do
      local EventID = self.GuideEventList[i]
      if self:IsNeedAddListener(EventID) == false then
        table.remove(self.GuideEventList, i)
        EventManager:RemoveEvent(EventID, self)
        DebugPrint("SystemGuide EventManager:RemoveEvent:", EventID)
      end
    end
  end
end

function SystemGuideManager:AddSystemGuideEvent(EventID, EventFunc)
  if self:IsNeedAddListener(EventID) then
    table.insert(self.GuideEventList, EventID)
    EventManager:AddEvent(EventID, self, EventFunc)
    DebugPrint("SystemGuide EventManager:AddEvent:", EventID)
  end
end

function SystemGuideManager:RemoveSystemGuideEvents()
  if #self.GuideEventList > 0 then
    for i = 1, #self.GuideEventList do
      EventManager:RemoveEvent(self.GuideEventList[i], self)
    end
  end
  self.GuideEventList = {}
  DebugPrint("SystemGuide EventManager:RemoveAllEvents")
end

function SystemGuideManager:ClearSystemGuideData()
  DebugPrint("SystemGuide ClearSystemGuideData")
  self.GuideDic = {}
  self.GuideUnfinishedDic = {}
  self.GuideQueue = {}
  self.IsGuideStoryRunning = false
  self.RunningId = -1
end

function SystemGuideManager:InitSystemGuideData()
  DebugPrint("SystemGuide InitSystemGuideData")
  self.Avatar = GWorld:GetAvatar()
  if not self.Avatar then
    return
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Platform = "PC"
  else
    self.Platform = "Mobile"
  end
  for key, value in pairs(DataMgr.SystemGuide) do
    local Item = {}
    Item.Data = value
    Item.Finished = false
    Item.FinishedQuest = false
    Item.FinishedQuestChain = false
    Item.UIUnlockRule = false
    Item.FinishedOpenInterface = false
    Item.FinishedEnterDungeon = false
    Item.FinishedEnterRegion = false
    Item.FinishedPlayerInControl = true
    Item.FinishedPreSysGuide = false
    Item.FinishedSpecialCondition = false
    Item.FinishedOutTalkComp = true
    Item.FinishedSystemUnlockWorking = true
    Item.FinishedFirstSeenTag = false
    Item.ConditionCheck = false
    Item.GuideStart = value.GuideStart
    if value.PreSysGuideId == nil then
      Item.FinishedPreSysGuide = true
    end
    if nil == value.FinishQuest then
      Item.FinishedQuest = true
    end
    if nil == value.FinishQuestChain then
      Item.FinishedQuestChain = true
    end
    if value.UIUnlockRule == nil then
      Item.UIUnlockRule = true
    end
    if nil == value.OpenInterface then
      Item.FinishedOpenInterface = true
    end
    if nil == value.EnterDungeon then
      Item.FinishedEnterDungeon = true
    end
    if nil == value.IsInRegion then
      Item.FinishedEnterRegion = true
    end
    if value.ConditionCheck == nil then
      Item.ConditionCheck = true
    end
    if nil == value.SpecialCondition then
      Item.FinishedSpecialCondition = true
    end
    if nil == value.FirstSeenTag then
      Item.FinishedFirstSeenTag = true
    end
    if (nil ~= value.FinishQuest or nil ~= value.FinishQuestChain or value.UIUnlockRule ~= nil) and nil == value.EnterDungeon and nil == value.IsInRegion then
      DebugPrint("Error: EnterDungeon and IsInRegion are all empty -> SysGuideId:" .. value.SysGuideId)
    end
    self.GuideDic[value.SysGuideId] = Item
    self.GuideUnfinishedDic[value.SysGuideId] = Item
  end
  self:InitSystemGuideState()
  for key, value in pairs(DataMgr.SystemGuide) do
    local Item = self.GuideDic[value.SysGuideId]
    local PreItem = self.GuideDic[value.PreSysGuideId]
    if nil ~= PreItem and PreItem.Finished then
      self.GuideDic[value.SysGuideId].FinishedPreSysGuide = true
    end
  end
end

function SystemGuideManager:InitSystemGuideState()
  for key, value in pairs(DataMgr.SystemGuide) do
    local Item = self.GuideDic[value.SysGuideId]
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Item.Finished = Avatar.SystemGuides:GetSystemGuide(value.SysGuideId):IsFinished()
      if Item.Finished then
        self:RemoveFinishedItemById(value.SysGuideId)
        local NextGuideIds = self:GetItemByPreSysGuideId(value.SysGuideId)
        if #NextGuideIds > 0 then
          for i = 1, #NextGuideIds do
            self.GuideDic[NextGuideIds[i]].FinishedPreSysGuide = true
          end
        end
      end
      if Item.Data.FinishQuest ~= nil and Avatar:IsQuestFinished(Item.Data.FinishQuest) then
        Item.FinishedQuest = true
      end
      if nil ~= Item.Data.FinishQuestChain and Avatar:IsQuestChainFinished(Item.Data.FinishQuestChain) then
        Item.FinishedQuestChain = true
      end
      if nil ~= Item.Data.UIUnlockRule then
        local bUnlocked = Avatar:CheckUIUnlocked_Internal(Item.Data.UIUnlockRule)
        if bUnlocked and Avatar:HasUIUnlockTask() == false then
          Item.UIUnlockRule = true
        end
      end
      if nil ~= Item.Data.OpenInterface then
        local Interface = UIManager(GWorld.GameInstance):GetUIObj(Item.Data.OpenInterface)
        if nil ~= Interface and false == Interface:IsHide() then
          Item.FinishedOpenInterface = true
        end
      end
    end
  end
end

function SystemGuideManager:InitCondition()
  for key, value in pairs(DataMgr.SystemGuide) do
    local Item = self.GuideDic[value.SysGuideId]
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Item.Finished = Avatar.SystemGuides:GetSystemGuide(value.SysGuideId):IsFinished()
      if Item.Finished then
        return
      end
      if Item.Data.ConditionCheck ~= nil then
        local Res = ConditionUtils.CheckCondition(Avatar, Item.Data.ConditionCheck)
        Item.ConditionCheck = Res
      end
    end
  end
end

function SystemGuideManager:SendDataToServer(GuideId)
  self:TryRemoveUnusedListener()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("ERROR:Avatar == nil SendDataToServer:" .. GuideId)
    return
  end
  Avatar:FinishSystemGuide(GuideId)
  print(_G.LogTag, GuideId, "SystemGuideFinished")
end

function SystemGuideManager:FinishSystemGuideCallback(Ret, RewardReturn)
  DebugPrint("SystemGuideFinished callback", Ret, RewardReturn)
  if nil == RewardReturn then
    return
  end
  UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", UIConst.ZORDER_ABOVE_SystemGuide, nil, nil, nil, RewardReturn)
end

function SystemGuideManager:GetItemByUIKey(UIKey)
  local GuideIds = {}
  if nil == UIKey then
    DebugPrint("SystemGuide GetItemByUIKey UIKey Is nil")
    return GuideIds
  end
  for key, value in pairs(self.GuideUnfinishedDic) do
    if UIKey == value.Data.OpenInterface then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByDungeonId(DungeonId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if DungeonId == value.Data.EnterDungeon then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByRegion()
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if 1 == value.Data.IsInRegion then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByPlayerInControl()
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if 1 == value.Data.PlayerInControl then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByOutTalkComp()
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if value.Data.SpecialCondition ~= "ImpressionTalk" then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemBySystemUnlockWorking()
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    table.insert(GuideIds, value.Data.SysGuideId)
  end
  return GuideIds
end

function SystemGuideManager:GetItemBySpecialCondition(Condition)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if Condition == value.Data.SpecialCondition then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByQuestId(QuestId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if QuestId == value.Data.FinishQuest then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByQuestChainId(QuestChainId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if QuestChainId == value.Data.FinishQuestChain then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByUIUnlockRuleId(UIUnlockRuleId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if UIUnlockRuleId == value.Data.UIUnlockRule then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByPreSysGuideId(GuideId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if GuideId == value.Data.PreSysGuideId then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByFirstSeenTag(FirstSeenTag)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if FirstSeenTag == value.Data.FirstSeenTag then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:GetItemByConditionCheck(ConditionId)
  local GuideIds = {}
  for key, value in pairs(self.GuideUnfinishedDic) do
    if ConditionId == value.Data.ConditionCheck then
      table.insert(GuideIds, value.Data.SysGuideId)
    end
  end
  return GuideIds
end

function SystemGuideManager:TryRunStoryByGuideId(Source, GuideId, IsDelay)
  if GuideId == self.RunningId then
    return
  end
  if not self.Avatar then
    return
  end
  if self.GuideDic[GuideId].Finished == false and self.GuideDic[GuideId].IsBroken ~= true and self.GuideDic[GuideId].FinishedPreSysGuide and self.GuideDic[GuideId].FinishedQuest and self.GuideDic[GuideId].FinishedQuestChain and self.GuideDic[GuideId].UIUnlockRule and self.GuideDic[GuideId].FinishedOpenInterface and self.GuideDic[GuideId].FinishedEnterDungeon and self.GuideDic[GuideId].FinishedEnterRegion and self.GuideDic[GuideId].FinishedPlayerInControl and self.GuideDic[GuideId].FinishedSpecialCondition and self.GuideDic[GuideId].FinishedOutTalkComp and self.GuideDic[GuideId].FinishedFirstSeenTag and self.GuideDic[GuideId].ConditionCheck and self.GuideDic[GuideId].FinishedSystemUnlockWorking and 0 == self.GuideDic[GuideId].GuideStart then
    if true ~= IsDelay then
      table.insert(self.GuideQueue, GuideId)
    end
    if false == self.IsGuideStoryRunning then
      self:RunStory(self.GuideDic[GuideId].Data)
    end
  elseif IsDelay and self.RunningId ~= GuideId then
    self:GuideQueueRemove(GuideId, "TryRunStoryByGuideIdDelay")
  elseif self.Platform == "PC" and self.bOpenDebug then
    PrintTable(self.GuideDic[GuideId], 3, "SystemGuide TryRunSourceFail")
  end
end

function SystemGuideManager:PrintDataInfo(Data, Guide)
end

function SystemGuideManager:GuideQueueRemove(GuideId, Source)
  if #self.GuideQueue > 0 then
    for j = 1, #self.GuideQueue do
      if self.GuideQueue[j] == GuideId and self.RunningId ~= GuideId then
        table.remove(self.GuideQueue, j)
        DebugPrint("SystemGuideQueueRemove:" .. GuideId .. ",Source:" .. (Source or ""))
      end
    end
    if #self.GuideQueue > 0 then
      self:TryRunStoryByGuideId("GuideQueueNext,RemoveId:" .. GuideId, self.GuideQueue[1], true)
    else
      UIManager():FallbackAfterLoadingMgr()
    end
  end
end

function SystemGuideManager:LoadUIEvent(UIKey)
  DebugPrint("SystemGuide LoadUIEvent UIKey:", UIKey)
  self:ShowUIEvent(UIKey)
end

function SystemGuideManager:ShowUIEvent(UIKey)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide ShowUIEvent UIKey:", UIKey)
  local GuideIds = self:GetItemByUIKey(UIKey)
  if "BattleMain" == UIKey then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if Player and Player.CleanInputWhenEnterTalk then
      Player:CleanInputWhenEnterTalk(false)
    end
  end
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedOpenInterface = true
      self:TryRunStoryByGuideId("LoadUIEvent:" .. UIKey, GuideIds[i])
    end
  end
end

function SystemGuideManager:UnLoadUIEvent(UIKey)
  DebugPrint("SystemGuide UnLoadUIEvent UIKey:", UIKey)
  self:HideUIEvent(UIKey)
end

function SystemGuideManager:HideUIEvent(UIKey)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide HideUIEvent UIKey:", UIKey)
  local GuideIds = self:GetItemByUIKey(UIKey)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedOpenInterface = false
      if #self.GuideQueue > 0 then
        for j = 1, #self.GuideQueue do
          if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
            table.remove(self.GuideQueue, j)
            DebugPrint("SystemGuideQueueRemoveUnLoadUIEvent:" .. GuideIds[i])
          end
        end
      end
    end
  end
end

function SystemGuideManager:EnterRegionEvent()
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide EnterRegionEvent")
  local GuideIds = self:GetItemByRegion()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedEnterRegion = true
      self:TryRunStoryByGuideId("EnterRegionEvent", GuideIds[i])
    end
  end
end

function SystemGuideManager:ExitRegionEvent()
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide ExitRegionEvent")
  local GuideIds = self:GetItemByRegion()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedEnterRegion = false
      if #self.GuideQueue > 0 then
        for j = 1, #self.GuideQueue do
          if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
            table.remove(self.GuideQueue, j)
            DebugPrint("SystemGuideQueueRemoveExitRegionEvent:" .. GuideIds[i])
          end
        end
      end
    end
  end
end

function SystemGuideManager:EnterDungeonEvent(DungeonId)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide EnterDungeonEvent DungeonId:", DungeonId)
  EventManager:FireEvent(EventID.SystemGuideExitRegion)
  local GuideIds = self:GetItemByDungeonId(DungeonId)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedEnterDungeon = true
      self:TryRunStoryByGuideId("EnterDungeonEvent,DungeonId:" .. DungeonId, GuideIds[i])
    end
  end
end

function SystemGuideManager:ExitDungeonEvent(DungeonId)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide ExitDungeonEvent DungeonId:", DungeonId)
  local GuideIds = self:GetItemByDungeonId(DungeonId)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedEnterDungeon = false
      if #self.GuideQueue > 0 then
        for j = 1, #self.GuideQueue do
          if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
            table.remove(self.GuideQueue, j)
            DebugPrint("SystemGuideQueueRemoveExitDungeonEvent:" .. GuideIds[i])
          end
        end
      end
    end
  end
end

function SystemGuideManager:SystemUnlockWorkingStartEvent()
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide SystemUnlockWorkingStartEvent")
  local GuideIds = self:GetItemBySystemUnlockWorking()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedSystemUnlockWorking = false
      if #self.GuideQueue > 0 then
        for j = 1, #self.GuideQueue do
          if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
            table.remove(self.GuideQueue, j)
            DebugPrint("SystemGuideQueueRemoveSystemUnlockWorkingStartEvent:" .. GuideIds[i])
          end
        end
      end
    end
  end
end

function SystemGuideManager:SystemUnlockWorkingEndEvent()
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide SystemUnlockWorkingEndEvent")
  local GuideIds = self:GetItemBySystemUnlockWorking()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedSystemUnlockWorking = true
      self:TryRunStoryByGuideId("SystemUnlockWorkingEndEvent:", GuideIds[i])
    end
  end
end

function SystemGuideManager:FirstSeenTagEvent(FirstSeenTag)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide FirstSeenTagEvent ", FirstSeenTag)
  local GuideIds = self:GetItemByFirstSeenTag(FirstSeenTag)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedFirstSeenTag = true
      self:TryRunStoryByGuideId("FirstSeenTagEvent:" .. FirstSeenTag, GuideIds[i])
    end
  end
end

function SystemGuideManager:FirstDynQuest()
  if self.Invalid then
    return
  end
  DebugPrint("Systemguide FirstDynQuest")
  local GuideIds = self:GetItemBySpecialCondition("FirstDynQuest")
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedSpecialCondition = true
      self:TryRunStoryByGuideId("FirstDynQuest", GuideIds[i])
    end
  end
end

function SystemGuideManager:FirstPanFixTalk()
  if self.Invalid then
    return
  end
  DebugPrint("Systemguide FirstPanFixTalk")
  local GuideIds = self:GetItemBySpecialCondition("FirstPanFixTalk")
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedSpecialCondition = true
      self:TryRunStoryByGuideId("FirstPanFixTalk", GuideIds[i])
    end
  end
end

function SystemGuideManager:ConditionCompleteEvent(ConditionId)
  if self.Invalid then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DebugPrint("Systemguide ConditionCheck", ConditionId)
  local Res = ConditionUtils.CheckCondition(Avatar, ConditionId)
  local GuideIds = self:GetItemByConditionCheck(ConditionId)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].ConditionCheck = Res
      self:TryRunStoryByGuideId("ConditionCheck", GuideIds[i])
    end
  end
end

function SystemGuideManager:FinishSystemGuideEvent(GuideId)
  DebugPrint("SystemGuide FinishSystemGuideEvent GuideId:", GuideId)
  self.GuideDic[GuideId].Finished = true
  self:RemoveFinishedItemById(GuideId)
  self:SendDataToServer(GuideId)
  local NextGuideIds = self:GetItemByPreSysGuideId(GuideId)
  if #NextGuideIds > 0 then
    for i = 1, #NextGuideIds do
      self.GuideDic[NextGuideIds[i]].FinishedPreSysGuide = true
      self:TryRunStoryByGuideId("FinishedPreSysGuide:" .. GuideId, NextGuideIds[i])
    end
  end
end

function SystemGuideManager:FinishQuestEvent(QuestId)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide FinishQuestEvent Id:", QuestId)
  local GuideIds = self:GetItemByQuestId(QuestId)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedQuest = true
      self:TryRunStoryByGuideId("FinishQuestEvent", GuideIds[i])
    end
  end
end

function SystemGuideManager:FinishQuestChainEvent(QuestChainId)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide FinishQuestChainEvent Id:", QuestChainId)
  local GuideIds = self:GetItemByQuestChainId(QuestChainId)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedQuestChain = true
      self:TryRunStoryByGuideId("FinishQuestChainEvent", GuideIds[i])
    end
  end
end

function SystemGuideManager:UIUnlockRuleIdsFinishedEvent(Ids)
  for _, Id in pairs(Ids:ToTable()) do
    self:UIUnlockRuleIdFinishedEvent(Id)
  end
end

function SystemGuideManager:UIUnlockRuleIdFinishedEvent(Id)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide UIUnlockRuleIdFinishedEvent Id:", Id)
  local GuideIds = self:GetItemByUIUnlockRuleId(Id)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].UIUnlockRule = true
      self:TryRunStoryByGuideId("UIUnlockRuleIdFinishedEvent", GuideIds[i])
    end
  end
end

function SystemGuideManager:UIUnlockRuleIdUnFinishedEvent(Id)
  if self.Invalid then
    return
  end
  DebugPrint("SystemGuide UIUnlockRuleIdUnFinishedEvent Id:", Id)
  local GuideIds = self:GetItemByUIUnlockRuleId(Id)
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].UIUnlockRule = false
      if #self.GuideQueue > 0 then
        for j = 1, #self.GuideQueue do
          if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
            table.remove(self.GuideQueue, j)
            DebugPrint("UIUnlockRuleIdUnFinishedEvent:" .. GuideIds[i])
          end
        end
      end
    end
  end
end

function SystemGuideManager:OnBecomeViewTarget()
  self.OnBecomeView = true
  self:SetInputModeEvent(self.IsUIOnly)
end

function SystemGuideManager:OnEndViewTarget()
  self.OnBecomeView = false
  self:SetInputModeEvent(self.IsUIOnly)
end

function SystemGuideManager:SetInputModeEvent(IsUIOnly)
  if self.Invalid then
    return
  end
  self.IsUIOnly = IsUIOnly
  DebugPrint("SystemGuide SetInputModeEvent IsUIOnly:", IsUIOnly)
  local GuideIds = self:GetItemByPlayerInControl()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      if not IsUIOnly and self.OnBecomeView then
        self.GuideDic[GuideIds[i]].FinishedPlayerInControl = true
        self:TryRunStoryByGuideId("SetInputModeEvent:IsUIOnly==False", GuideIds[i])
      else
        self.GuideDic[GuideIds[i]].FinishedPlayerInControl = false
        if #self.GuideQueue > 0 then
          for j = 1, #self.GuideQueue do
            if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
              table.remove(self.GuideQueue, j)
              DebugPrint("SystemGuideQueueRemoveSetInputModeEvent:" .. GuideIds[i])
            end
          end
        end
      end
    end
  end
end

function SystemGuideManager:TalkCompEvent(IsInTalkComp)
  DebugPrint("Systemguide TalkCompEvent IsInTalkComp:", IsInTalkComp)
  if self.Invalid then
    return
  end
  local GuideIds = self:GetItemByOutTalkComp()
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      if false == IsInTalkComp then
        self.GuideDic[GuideIds[i]].FinishedOutTalkComp = true
        self:TryRunStoryByGuideId("TalkCompEvent:IsInTalkComp==False", GuideIds[i])
      else
        self.GuideDic[GuideIds[i]].FinishedOutTalkComp = false
        if #self.GuideQueue > 0 then
          for j = 1, #self.GuideQueue do
            if self.GuideQueue[j] == GuideIds[i] and self.RunningId ~= GuideIds[i] then
              table.remove(self.GuideQueue, j)
              DebugPrint("SystemGuideQueueRemoveTalkCompEvent:" .. GuideIds[i])
            end
          end
        end
      end
    end
  end
end

function SystemGuideManager:ImpressionTalkEvent()
  if self.Invalid then
    return
  end
  DebugPrint("Systemguide ImpressionTalkEvent")
  local GuideIds = self:GetItemBySpecialCondition("ImpressionTalk")
  if #GuideIds > 0 then
    for i = 1, #GuideIds do
      self.GuideDic[GuideIds[i]].FinishedSpecialCondition = true
      self:TryRunStoryByGuideId("ImpressionTalkEvent", GuideIds[i])
    end
  end
end

function SystemGuideManager:RunStory(Data)
  local StoryLinePath = Data.GuideStoryline
  local FinishGuideType = Data.GuideEnd
  local GuideId = Data.SysGuideId
  DebugPrint("RunStory,GuideId:" .. GuideId)
  if 1 == DataMgr.SystemGuide[GuideId].PlayerInControl then
    local CurMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(GWorld.GameInstance:GetWorld())
    DebugPrint("GuideId:", GuideId, "CurMode:", CurMode, "PlayerInControl Systemguide RunStory")
    if "UIOnly" == CurMode then
      DebugPrint("GuideId:", GuideId, "CurMode:", CurMode, "PlayerInControl Systemguide RunStory Error ")
      self:SetInputModeEvent(true)
      self:GuideQueueRemove(GuideId, "PlayerInControlRunStoryError")
      return
    end
  end
  local Quest = DataMgr.SystemGuide[GuideId].UIUnlockRule
  if nil ~= Quest then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:HasUIUnlockTask() then
      DebugPrint("GuideId:", GuideId, "Quest:", Quest, "HasUIUnlockTask Systemguide RunStory Error ")
      self:UIUnlockRuleIdUnFinishedEvent(Quest)
      self:GuideQueueRemove(GuideId, "HasUIUnlockTaskRunStoryError")
      return
    end
  end
  DebugPrint("RunStory,SystemGuideId:" .. GuideId)
  local GuideChannel = DataMgr.SystemGuide[GuideId].GuideChannel
  if not GuideChannel then
    DebugPrint("\229\188\149\229\175\188\231\188\186\229\176\145\233\128\154\233\129\147\233\133\141\231\189\174", GuideId)
    return
  end
  self.RunningId = GuideId
  self.IsGuideStoryRunning = true
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  self.Flow = FlowManager:CreateFlow(GuideChannel)
  self.Flow.OnBegin:Add(self.Flow, function()
    EventManager:FireEvent(EventID.OnGuideStart, GuideId)
    if 0 == FinishGuideType then
      self:FinishSystemGuideEvent(GuideId)
      
      local function Callback()
        self:RemoveFlow()
        self.RunningId = -1
        self.IsGuideStoryRunning = false
        self:GuideQueueRemove(GuideId, "FinishSystemGuideEvent,FinishGuideType == 0")
        EventManager:FireEvent(EventID.OnGuideEnd, GuideId)
        self:SetFocusOnGamepad()
      end
      
      GWorld.StoryMgr:RunStory(StoryLinePath, nil, nil, Callback, Callback)
      DebugPrint("SystemGuideManagerRunStory", StoryLinePath, GuideId, FinishGuideType)
    elseif 1 == FinishGuideType then
      local function EndCallback()
        self:RemoveFlow()
        
        self.RunningId = -1
        self.IsGuideStoryRunning = false
        self:GuideQueueRemove(GuideId, "FinishSystemGuideEvent,FinishGuideType == 1")
        self:FinishSystemGuideEvent(GuideId)
        EventManager:FireEvent(EventID.OnGuideEnd, GuideId)
        self:SetFocusOnGamepad()
      end
      
      local function StopCallback()
        self:RemoveFlow()
        self.RunningId = -1
        self.IsGuideStoryRunning = false
        self:GuideQueueRemove(GuideId, "FinishSystemGuideEvent,FinishGuideType == 1")
        EventManager:FireEvent(EventID.OnGuideEnd, GuideId)
        self:SetFocusOnGamepad()
      end
      
      GWorld.StoryMgr:RunStory(StoryLinePath, nil, nil, EndCallback, StopCallback)
      DebugPrint("SystemGuideManagerRunStory", StoryLinePath, GuideId, FinishGuideType)
    end
  end)
  FlowManager:AddFlow(self.Flow)
end

function SystemGuideManager:SetFocusOnGamepad()
  local bIsGamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  if not bIsGamepad then
    return
  end
  local TopUI = UIManager(GWorld.GameInstance):GetWidgetObjInTopStack()
  if TopUI and TopUI:GetUIConfigName() == "ForgeMain" then
    TopUI = UIManager(GWorld.GameInstance):GetLastestAndFocusableUIWidgetObj()
  end
  if nil ~= TopUI then
    TopUI:SetFocus()
  end
end

function SystemGuideManager:RemoveFlow()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  FlowManager:RemoveFlow(self.Flow)
  self.Flow = nil
end

function SystemGuideManager:RemoveCurStl()
  local GuideId = self.RunningId
  if -1 ~= GuideId then
    self.GuideDic[GuideId].IsBroken = true
  end
end

function SystemGuideManager:GMEnforceFinishAllSysGuide()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, value in pairs(DataMgr.SystemGuide) do
    local Item = self.GuideDic[value.SysGuideId]
    if nil == Item then
      DebugPrint("ERROR:SystemGuideManager Item is nil, SysGuideId:", value.SysGuideId)
    else
      Item.Finished = Avatar.SystemGuides:GetSystemGuide(value.SysGuideId):IsFinished()
      if not Item.Finished then
        Item.Finished = true
        self:RemoveFinishedItemById(value.SysGuideId)
        self:SendDataToServer(value.SysGuideId)
      end
    end
  end
end

function SystemGuideManager:RemoveFinishedItemById(Id)
  for key, value in pairs(self.GuideUnfinishedDic) do
    if value.Data.SysGuideId == Id then
      self.GuideUnfinishedDic[key] = nil
      DebugPrint("SystemGuide RemoveFinishedItemById:", Id)
    end
  end
end

function SystemGuideManager:RunGuideById(GuideId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Finish = Avatar.SystemGuides:GetSystemGuide(GuideId):IsFinished()
  if Finish then
    return
  end
  if self.GuideDic[GuideId] and self.GuideDic[GuideId].GuideStart then
    local GuideStart = self.GuideDic[GuideId].GuideStart
    if 0 == GuideStart then
      return
    end
    if self.GuideDic[GuideId].Finished == false and self.GuideDic[GuideId].IsBroken ~= true and self.GuideDic[GuideId].FinishedPreSysGuide and self.GuideDic[GuideId].FinishedQuest and self.GuideDic[GuideId].FinishedQuestChain and self.GuideDic[GuideId].UIUnlockRule and self.GuideDic[GuideId].FinishedOpenInterface and self.GuideDic[GuideId].FinishedEnterDungeon and self.GuideDic[GuideId].FinishedEnterRegion and self.GuideDic[GuideId].FinishedPlayerInControl and self.GuideDic[GuideId].FinishedSpecialCondition and self.GuideDic[GuideId].FinishedOutTalkComp and self.GuideDic[GuideId].FinishedFirstSeenTag and self.GuideDic[GuideId].ConditionCheck and self.GuideDic[GuideId].FinishedSystemUnlockWorking then
      self:RunStory(self.GuideDic[GuideId].Data)
    elseif self.Platform == "PC" and self.bOpenDebug then
      PrintTable(self.GuideDic[GuideId], 3, "SystemGuide TryRunSourceFail")
    end
  end
end

return SystemGuideManager
