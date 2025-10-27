local M = Class("BluePrints.Common.TimerMgr")

function M:EnterTrigger()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Condition = ConditionUtils.CheckCondition(Avatar, DataMgr.RegionOnline[self.SubRegionId].OnlineCondition)
  if false == Condition then
    DebugPrint("Condition\228\184\141\230\187\161\232\182\179")
    self.bIsSuccess = false
    return
  end
  local CloseCondition = ConditionUtils.CheckCondition(Avatar, DataMgr.RegionOnline[self.SubRegionId].OfflineCondition)
  if CloseCondition and DataMgr.RegionOnline[self.SubRegionId].OfflineCondition then
    DebugPrint("CloseCondition\230\187\161\232\182\179")
    self.bIsSuccess = false
    return
  end
  if false == self.bIsIdle then
    self:AddTimer(0.1, self.CheckIdleTag, true, 0, "CheckIdleTagTimer")
  else
    self:StartRegionOnline()
  end
end

function M:CheckIdleTag()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if PlayerCharacter:GetCharacterTag() == "Idle" then
    self.bIsIdle = true
    self:StartRegionOnline()
  end
end

function M:StartRegionOnline()
  self:RemoveTimer("CheckIdleTagTimer")
  self:RemoveTimer("RegionOnline")
  if self.bIsSend and self.bIsSuccess then
    local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
    if TimeUI then
      TimeUI:Close()
    end
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:AddEvents()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local ShowWeaponType = PlayerCharacter:GetCurrentShowWeapon()
  if "None" == ShowWeaponType or "" == ShowWeaponType or "none" == ShowWeaponType then
    ShowWeaponType = nil
  end
  Avatar:RequestEnterOnline(self.SubRegionId, ShowWeaponType)
  NPCCreateSubSystem(self):SetIsOnlineState(true)
  SystemGuideManager:RunGuideById(self.GuideId)
  self.bIsSuccess = true
  self.bIsSend = true
  local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
  if TimeUI then
    TimeUI:Close()
  end
  TimeUI = UIManager(self):LoadUINew("RegionOnlineFloat", "In")
  DebugPrint("StartRegionOnline", self.bIsSuccess, self.bIsSend, self:GetName())
end

function M:ExitTrigger()
  DebugPrint("ExitTrigger")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.bIsSuccess == false then
    DebugPrint("\230\178\161\230\156\137\232\167\166\229\143\145\229\140\186\229\159\159\232\129\148\230\156\186", self.bIsSuccess, self:GetName())
    return
  end
  if self.bByEvent then
    local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
    if TimeUI then
      TimeUI:Close()
    end
    self:EndTrigger()
    return
  end
  local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
  if TimeUI then
    TimeUI:OnLoaded("Out", 5)
  else
    TimeUI = UIManager(self):LoadUINew("RegionOnlineFloat", "Out", 5)
  end
  self:AddTimer(5, function()
    local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
    if TimeUI then
      TimeUI:Close()
    end
    self.bIsSend = false
    self.bIsSuccess = false
    self.bIsIdle = false
    self:RemoveEvents()
    Avatar:RequestLeaveOnline(self.SubRegionId)
    DebugPrint("RealExitRegionOnline")
    NPCCreateSubSystem(self):SetIsOnlineState(false)
    self:RemoveTimer("CheckIdleTagTimer")
    self:RemoveTimer("RegionOnline")
  end, false, 0, "RegionOnline")
end

function M:EndTrigger()
  DebugPrint("EndTrigger")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TimeUI = UIManager(self):GetUI("RegionOnlineFloat")
  if TimeUI then
    TimeUI:Close()
  end
  self.bIsSend = false
  self.bIsSuccess = false
  self.bIsIdle = false
  EventManager:RemoveEvent(EventID.StartTalk, self)
  if self.OpenTags and self.OpenTags.Talk ~= nil then
    self.OpenTags.Talk = nil
  end
  Avatar:RequestLeaveOnline(self.SubRegionId)
  NPCCreateSubSystem(self):SetIsOnlineState(false)
  self:RemoveTimer("CheckIdleTagTimer")
  self:RemoveTimer("RegionOnline")
end

function M:AddEvents()
  EventManager:AddEvent(EventID.StartTalk, self, self.CloseTrigger)
  EventManager:AddEvent(EventID.EndTalk, self, self.StartTrigger)
end

function M:RemoveEvents()
  EventManager:RemoveEvent(EventID.StartTalk, self)
  EventManager:RemoveEvent(EventID.EndTalk, self)
end

function M:AddEventsOnBeginPlay()
  EventManager:AddEvent(EventID.SpecialQuestCloseRegionOnline, self, self.CloseTrigger)
  EventManager:AddEvent(EventID.SpecialQuestOpenRegionOnline, self, self.StartTrigger)
end

function M:RemoveEventsOnEndPlay()
  EventManager:RemoveEvent(EventID.SpecialQuestCloseRegionOnline, self)
  EventManager:RemoveEvent(EventID.SpecialQuestOpenRegionOnline, self)
end

function M:StartTrigger(bDisableGameInput, bExitOnline, Tag)
  if not bExitOnline then
    return
  end
  if self.OpenTags == nil then
    self.OpenTags = {}
  end
  self.OpenTags[Tag] = nil
  local Empty = IsEmptyTable(self.OpenTags)
  if not Empty then
    return
  end
  for key, value in pairs(self.Boxes) do
    value:SetGenerateOverlapEvents(true)
  end
  self.bByEvent = false
end

function M:CloseTrigger(bDisableGameInput, bExitOnline, Tag)
  if not bExitOnline then
    return
  end
  if self.OpenTags == nil then
    self.OpenTags = {}
  end
  self.OpenTags[Tag] = 1
  for key, value in pairs(self.Boxes) do
    value:SetGenerateOverlapEvents(false)
  end
  self.bByEvent = true
end

return M
