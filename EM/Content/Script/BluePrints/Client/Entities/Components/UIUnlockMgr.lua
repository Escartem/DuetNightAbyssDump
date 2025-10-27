local Component = {}

function Component:EnterWorld()
  if not self.bUIUnlockMgrInitialized then
    self:Init()
  end
end

function Component:Init()
  self.bUIUnlockMgrInitialized = true
  self.bEndNormalUnlockUITask = true
  self.ConditionFirstMetEvents = {}
  self.ConditionMetCache = {}
  self.FirstTimeUnlockUIQueue = {}
  self.FirstTimeUnlockSubUIQueue = {}
  self.CacheUnlockRuleIdsArray = TSet("")
  self.HasBindUIUnlockRules = {}
  self.BindUIUnlockKeys = {}
  self.bInRegion_UIUnlock = false
  self.bInLoading_UIUnlock = false
  self.bInDeliverBlack_UIUnlock = false
  self.bInImmersiveTalk_UIUnlock = false
  self.bCrackUnlockAllSystems = false
  self.bGMHideUnlockPopup = false
  self.CrackedUnlockSystems = {}
  self.DelegateKey_UIUnlock = 0
  self:BindUIUnlockDelegates()
  self:AddListenEvents()
end

function Component:LeaveWorld()
  self.logger.info("UIUnlockMgr LeaveWorld")
  EventManager:RemoveEvent(EventID.EnterRegion, self)
  EventManager:RemoveEvent(EventID.ExitRegion, self)
  EventManager:RemoveEvent(EventID.InLoading, self)
  EventManager:RemoveEvent(EventID.OnLoginSuccess, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainStart, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, self)
  EventManager:RemoveEvent(EventID.EnterImmersiveTalk, self)
  EventManager:RemoveEvent(EventID.LeaveImmersiveTalk, self)
  self:UnBindAllOnUIFirstUnlockAnimation()
end

function Component:BindOnUIFirstTimeUnlock(UIUnlockRuleId, Callback)
  local UnlockInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  local ConditionId = UnlockInfo.ConditionId
  self.ConditionFirstMetEvents[ConditionId] = self.ConditionFirstMetEvents[ConditionId] or {}
  local Events = self.ConditionFirstMetEvents[ConditionId]
  self.DelegateKey_UIUnlock = self.DelegateKey_UIUnlock + 1
  Events[self.DelegateKey_UIUnlock] = Callback
  return self.DelegateKey_UIUnlock
end

function Component:UnBindOnUIFirstTimeUnlock(UIUnlockRuleId, Key)
  local UnlockInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  local ConditionId = UnlockInfo.ConditionId
  self.ConditionFirstMetEvents[ConditionId] = self.ConditionFirstMetEvents[ConditionId] or {}
  local Events = self.ConditionFirstMetEvents[ConditionId]
  Events[Key] = nil
end

function Component:CheckUIUnlocked(UIUnlockRuleId, bShowFailed)
  if not UIUnlockRuleId then
    return true
  end
  if self.bCrackUnlockAllSystems then
    return true
  elseif self.CrackedUnlockSystems[UIUnlockRuleId] then
    return true
  end
  return self:CheckUIUnlocked_Internal(UIUnlockRuleId, bShowFailed)
end

function Component:CheckSystemUICanOpen(UIUnlockRuleId)
  local UIUnlockInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  local FailedIdIndex = {}
  if not UIUnlockInfo or UIUnlockInfo.OpenConditionId == nil then
    return true
  end
  local Avatar, UIOpenConditionId = GWorld:GetAvatar(), UIUnlockInfo.OpenConditionId
  for Index, Id in pairs(UIOpenConditionId) do
    if not ConditionUtils.CheckCondition(Avatar, Id) then
      table.insert(FailedIdIndex, Index)
    end
  end
  return 0 == #FailedIdIndex, FailedIdIndex
end

function Component:CheckUIUnlocked_Internal(UIUnlockRuleId, bShowFailed)
  local UIUnlockInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  if not UIUnlockInfo then
    GWorld.logger.error("@@@ \230\137\128\230\159\165\232\175\162\232\167\163\233\148\129\231\154\132UIUnlockRuleId\228\184\141\229\156\168\232\161\168\229\134\133:" .. tostring(UIUnlockRuleId))
    return false
  end
  bShowFailed = bShowFailed or false
  local Res = self:CheckSystemUnlocked(UIUnlockRuleId)
  if not Res then
    ConditionUtils:CheckShowFailed(UIUnlockInfo.ConditionId, false, bShowFailed)
  end
  return Res
end

function Component:OnSystemFirstTimeUnlock(UIUnlockRuleId)
  local SystemInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  if SystemInfo.UnlockPopupType == "Light" then
    table.insert(self.FirstTimeUnlockSubUIQueue, UIUnlockRuleId)
  else
    table.insert(self.FirstTimeUnlockUIQueue, UIUnlockRuleId)
  end
  DebugPrint("@@@UIUnlockMgr OnSystemFirstTimeUnlock", UIUnlockRuleId)
  self:TryStartUIUnlockTask()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI:InitBtnList()
  end
end

function Component:AddListenEvents()
  EventManager:AddEvent(EventID.EnterRegion, self, self.OnEnterRegion_UIUnlockMgr)
  EventManager:AddEvent(EventID.ExitRegion, self, self.OnExitRegion_UIUnlockMgr)
  EventManager:AddEvent(EventID.InLoading, self, self.InLoading_UIUnlockMgr)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainStart, self, self.OnLevelDeliverBlackCurtainStart)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, self, self.OnLevelDeliverBlackCurtainEnd)
  EventManager:AddEvent(EventID.EnterImmersiveTalk, self, self.OnEnterImmersiveTalk)
  EventManager:AddEvent(EventID.LeaveImmersiveTalk, self, self.OnLeaveImmersiveTalk)
end

function Component:OnEnterRegion_UIUnlockMgr()
  DebugPrint("@@@UIUnlockMgrEnterRegion")
  self.bInRegion_UIUnlock = true
  self:TryStartUIUnlockTask()
end

function Component:OnExitRegion_UIUnlockMgr()
  DebugPrint("@@@UIUnlockMgr ExitRegion")
  self.bInRegion_UIUnlock = false
end

function Component:InLoading_UIUnlockMgr()
  DebugPrint("@@@UIUnlockMgr InLoading")
  self.bInLoading_UIUnlock = true
end

function Component:HandleCloseLoadingEvent_WhileSystemUnlock()
  DebugPrint("@@@UIUnlockMgr CloseLoading")
  self.bInLoading_UIUnlock = false
  self:TryStartUIUnlockTask()
  if GWorld.IsDev then
    GWorld.GameInstance:GetAvatar():AutoExecuteGM()
  end
end

function Component:OnLevelDeliverBlackCurtainStart()
  DebugPrint("@@@UIUnlockMgr Begin LevelDeliverBlack ")
  self.bInDeliverBlack_UIUnlock = true
end

function Component:OnLevelDeliverBlackCurtainEnd()
  DebugPrint("@@@UIUnlockMgr End LevelDeliverBlack ")
  self.bInDeliverBlack_UIUnlock = false
  self:TryStartUIUnlockTask()
end

function Component:OnEnterImmersiveTalk()
  DebugPrint("@@@UIUnlockMgr OnEnterImmersiveTalk")
  self.bInImmersiveTalk_UIUnlock = true
end

function Component:OnLeaveImmersiveTalk()
  DebugPrint("@@@UIUnlockMgr OnLeaveImmersiveTalk")
  self.bInImmersiveTalk_UIUnlock = false
  self:TryStartUIUnlockTask()
end

function Component:CheckCanStartUnlockTask()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.bInRegion_UIUnlock = Avatar:IsInBigWorld()
    DebugPrint("@@@UIUnlockMgr UseAvatar InBigWorld")
  end
  DebugPrint("@@@UIUnlockMgr CheckCanStartUnlockTask", self.bInRegion_UIUnlock, not self.bInLoading_UIUnlock, not self.bInDeliverBlack_UIUnlock, not self.bInImmersiveTalk_UIUnlock)
  return self.bInRegion_UIUnlock and not self.bInLoading_UIUnlock and not self.bInDeliverBlack_UIUnlock and not self.bInImmersiveTalk_UIUnlock
end

function Component:HasUIUnlockTask()
  local bRes = not IsEmptyTable(self.FirstTimeUnlockUIQueue)
  DebugPrint("@@@UIUnlockMgr Check HasUIUnlockTask", bRes)
  return bRes
end

function Component:TryStartUIUnlockTask()
  DebugPrint("@@@UIUnlockMgr TryStartUIUnlockTask", self:CheckCanStartUnlockTask())
  if not self:CheckCanStartUnlockTask() then
    return
  end
  local Key, UIUnlockRuleId = next(self.FirstTimeUnlockUIQueue)
  if not UIUnlockRuleId then
    if not self.bEndNormalUnlockUITask then
      local SystemUnlockGuideWidget = UIManager(GWorld.GameInstance):GetUIObj("SystemUnlockGuide")
      if SystemUnlockGuideWidget then
        SystemUnlockGuideWidget:Close()
      end
      DebugPrint("@@@UIUnlockMgr End ShowNormal UIUnlockGuide")
      for _, Value in pairs(self.FirstTimeUnlockSubUIQueue) do
        self.CacheUnlockRuleIdsArray:Add(Value)
      end
      self:EndUIUnlockTask()
    end
    Key, UIUnlockRuleId = next(self.FirstTimeUnlockSubUIQueue)
    if not self.bHasFireEvent then
      EventManager:FireEvent(EventID.OnSystemUnlockWorkingEnd)
      self.bHasFireEvent = true
    end
  else
    self.bEndNormalUnlockUITask = false
    self.bHasNoramUIUnlockTask = true
    self.bHasFireEvent = false
    EventManager:FireEvent(EventID.OnSystemUnlockWorkingStart)
    self:OnSystemFirstTimeUnlock_Internal(UIUnlockRuleId, function()
      self.FirstTimeUnlockUIQueue[Key] = nil
      self.bUnlockTaskWorking = false
      self.CacheUnlockRuleIdsArray:Add(UIUnlockRuleId)
      self:TryStartUIUnlockTask()
    end)
    return
  end
  if not UIUnlockRuleId then
    if not self.bHasNoramUIUnlockTask and not self.bEndSubUnlockUITask then
      self:EndUIUnlockTask()
    end
    self.bHasNoramUIUnlockTask = false
    self.bEndSubUnlockUITask = true
    self.bHasFireEvent = false
    UIManager(GWorld.GameInstance):UnLoadUINew("SubSystemUnlock")
    self:RemoveSubsystemUIFromParent()
  else
    self.bEndSubUnlockUITask = false
    self:OnSystemFirstTimeUnlock_Internal(UIUnlockRuleId, function()
      if not self:CheckCanStartUnlockTask() then
        return
      end
      self.FirstTimeUnlockSubUIQueue[Key] = nil
      self.bUnlockTaskWorking = false
      if not self.bHasNoramUIUnlockTask and not self.bEndSubUnlockUITask then
        self.CacheUnlockRuleIdsArray:Add(UIUnlockRuleId)
      end
      self:TryStartUIUnlockTask()
    end)
  end
end

function Component:RemoveSubsystemUIFromParent()
  local BattleMainUI = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
  if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_SubSystemUnlock then
    BattleMainUI.Pos_SubSystemUnlock:ClearChildren()
    BattleMainUI.Pos_SubSystemUnlock:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:EndUIUnlockTask()
  DebugPrint("@@@UIUnlockMgr EndUIUnlockTask")
  self.bUnlockTaskWorking = false
  self.bEndNormalUnlockUITask = true
  if self.CacheUnlockRuleIdsArray:Num() < 1 then
    DebugPrint("@@@UIUnlockMgr EndUIUnlockTask self.CacheUnlockRuleIdsArray:Num() <1")
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI:InitBtnList()
  end
  if self.CacheUnlockRuleIdsArray:Num() > 0 then
    DebugPrint("@@@UIUnlockMgr EndUIUnlockTask", self.CacheUnlockRuleIdsArray:Num())
    DebugPrintTable(self.CacheUnlockRuleIdsArray:ToTable())
    EventManager:FireEvent(EventID.OnSystemUnlockEnding, self.CacheUnlockRuleIdsArray)
  end
  self.CacheUnlockRuleIdsArray = TArray("")
  if self.OnEndUIUnlockTaskOnceDelegate then
  end
end

function Component:OnSystemFirstTimeUnlock_Internal(UIUnlockRuleId, OnFinishedCallback)
  DebugPrint("@@@UIUnlockMgr OnSystemFirstTimeUnlock_Internal ", UIUnlockRuleId)
  OnFinishedCallback = OnFinishedCallback or function()
  end
  local SystemInfo = DataMgr.UIUnlockRule[UIUnlockRuleId]
  if not SystemInfo then
    DebugPrint("@@@UIUnlockMgr No System info found in MainUI.xlsx, UIUnlockRuleId", UIUnlockRuleId)
    OnFinishedCallback()
    return
  end
  if 1 == SystemInfo.IsHideUnlockPopup or self.bGMHideUnlockPopup then
    DebugPrint("@@@UIUnlockMgr \233\154\144\232\151\143UI\232\167\163\233\148\129\232\161\168\231\142\176", UIUnlockRuleId)
    OnFinishedCallback()
    return
  end
  if SystemInfo.UnlockPopupType == "Light" then
    self:ShowSubSystemUnlockUI(SystemInfo, OnFinishedCallback)
  elseif SystemInfo.UnlockPopupType == "Normal" then
    self:ShowSystemUnlockUI(SystemInfo, OnFinishedCallback)
  else
    self:ShowSystemUnlockUI(SystemInfo, OnFinishedCallback)
  end
end

function Component:ShowSystemUnlockUI(SystemInfo, OnFinishedCallback)
  local UIName = "SystemUnlockGuide"
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local SystemUnlockGuideUI = UIManager:GetUIObj(UIName)
  SystemUnlockGuideUI = SystemUnlockGuideUI or UIManager:LoadUINew(UIName)
  if not SystemUnlockGuideUI then
    DebugPrint("@@@UIUnlockMgr Load SystemUnlockGuide UI failed, UIUnlockRuleId", SystemInfo.UIUnlockRuleId)
    OnFinishedCallback()
    return
  end
  SystemUnlockGuideUI:BindOnOutAnimationFinished(OnFinishedCallback)
  SystemUnlockGuideUI:OnWorking(SystemInfo)
end

function Component:ShowSubSystemUnlockUI(SystemInfo, OnFinishedCallback)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  local UnlockUI, IsAlreadyAddToBattleMain = nil, false
  if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_SubSystemUnlock then
    UnlockUI = BattleMainUI.Pos_SubSystemUnlock:GetChildAt(0)
    if UnlockUI then
      IsAlreadyAddToBattleMain = true
    end
  end
  UnlockUI = UnlockUI or UIManager:GetUIObj("SubSystemUnlock")
  UnlockUI = UnlockUI or UIManager:LoadUINew("SubSystemUnlock")
  if not UnlockUI then
    OnFinishedCallback()
    return
  end
  if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_SubSystemUnlock then
    if not IsAlreadyAddToBattleMain then
      BattleMainUI.Pos_SubSystemUnlock:AddChildToOverlay(UnlockUI)
      BattleMainUI.Pos_SubSystemUnlock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      local NormalStateSubTag, SpecialUINameList = UIManager:GetSubTagInNormalState("SubSystemUnlock")
      UIManager:HandleUIWidgetsVisibilityByUIShow("SubSystemUnlock", UnlockUI, NormalStateSubTag, SpecialUINameList)
    end
    UnlockUI:OnWorking(SystemInfo, function()
      self:ShowEnd()
      OnFinishedCallback()
    end)
  else
    self:ShowEnd()
    OnFinishedCallback()
  end
end

function Component:ShowEnd()
  local SystemUIConfig = DataMgr.SystemUI.SubSystemUnlock
  if SystemUIConfig then
    UIManager(self):HandleUIWidgetsVisibilityByUIHide("SubSystemUnlock", "SubSystemUnlock", SystemUIConfig.StateTag)
  end
end

function Component:BindUIUnlockDelegates()
  DebugPrint("@@@UIUnlockMgr UIUnlockMgr BindUIUnlockDelegates")
  if self.bHasBindUIUnlockDelegates then
    return
  end
  self.bHasBindUIUnlockDelegates = true
  EventManager:AddEvent(EventID.OnLoginSuccess, self, self.UIUnlockMgrOnLoginSuccess)
end

function Component:UIUnlockMgrOnLoginSuccess()
  self:BindAllOnUIFirstUnlockAnimation()
end

function Component:BindAllOnUIFirstUnlockAnimation()
  if DataMgr.UIUnlockRule then
    for _, Info in pairs(DataMgr.UIUnlockRule) do
      local UIUnlockRuleId = Info.UIUnlockRuleId
      local bHasBind = self.HasBindUIUnlockRules[UIUnlockRuleId]
      if not bHasBind then
        self.HasBindUIUnlockRules[UIUnlockRuleId] = true
        local Key = self:BindOnUIFirstTimeUnlock(UIUnlockRuleId, function()
          self:OnSystemFirstTimeUnlock(UIUnlockRuleId)
        end)
        table.insert(self.BindUIUnlockKeys, {Key = Key, UIUnlockRuleId = UIUnlockRuleId})
      end
    end
  end
end

function Component:UnBindAllOnUIFirstUnlockAnimation()
  for _, Info in pairs(self.BindUIUnlockKeys or {}) do
    self:UnBindOnUIFirstTimeUnlock(Info.UIUnlockRuleId, Info.Key)
  end
end

function Component:UIUnlockMgrOnConditionComplete(ConditionId)
  DebugPrint("@@@ UIUnlockMgr Received Condition Completed ", ConditionId)
  if self.ConditionMetCache[ConditionId] then
    DebugPrint("UIUnlockMgrOnConditionComplete: \231\179\187\231\187\159\232\167\163\233\148\129\230\148\182\229\136\176\228\186\134\229\144\140\228\184\128Condition\231\154\132\229\164\154\230\172\161\229\174\140\230\136\144\233\128\154\231\159\165: " .. ConditionId)
    return
  end
  if self.ConditionFirstMetEvents[ConditionId] then
    for _, cb in pairs(self.ConditionFirstMetEvents[ConditionId]) do
      if cb then
        cb()
      end
    end
    DebugPrint("@@@ UIUnlockMgr ConditionFirestMetEvents Complete", ConditionId)
  end
  self.ConditionFirstMetEvents[ConditionId] = nil
  self.ConditionMetCache[ConditionId] = true
end

function Component:_OnPropChangeSystemStates(keys)
  local System = keys[1]
  if System then
    print(_G.LogTag, "_OnPropChangeSystemStates", System, self.SystemStates[System])
  end
  if self:CheckSystemUnlocked(System) then
    local UIUnlockInfo = DataMgr.UIUnlockRule[System]
    if UIUnlockInfo then
      self:UIUnlockMgrOnConditionComplete(UIUnlockInfo.ConditionId)
    end
  end
end

function Component:CheckSystemUnlocked(System)
  local State = self.SystemStates[System]
  return 1 == State
end

return Component
