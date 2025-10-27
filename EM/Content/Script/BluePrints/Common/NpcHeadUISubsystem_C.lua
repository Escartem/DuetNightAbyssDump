require("UnLua")
local NpcHeadUISubsystem = Class()

function NpcHeadUISubsystem:OnInitialize()
  EventManager:AddEvent(EventID.OnChangeTaskIndicator, self, self.OnChangeTaskIndicator)
  EventManager:AddEvent(EventID.EnterImmersiveTalk, self, self.OnEnterImmersiveTalk)
  EventManager:AddEvent(EventID.LeaveImmersiveTalk, self, self.OnLeaveImmersiveTalk)
  self.HideTags = {}
  self.HideTagsCache = {}
  self.HeadWidgetComps = {}
end

function NpcHeadUISubsystem:HideAllNpcHeadUI(bHidden, Tag)
  if bHidden then
    self.HideTags[Tag] = 1
  else
    self.HideTags[Tag] = nil
  end
  self.bIsHeadUIHidden = not IsEmptyTable(self.HideTags)
  for NpcId, HeadWidgetComponent in pairs(self.HeadWidgetComps) do
    if IsValid(HeadWidgetComponent) then
      HeadWidgetComponent:SetUniformWidgetHideTag(bHidden, Tag)
    end
  end
end

function NpcHeadUISubsystem:HideNpcHeadUI(NpcId, bHidden, Tag)
  local HeadWidgetComponent = self.HeadWidgetComps[NpcId]
  if IsValid(HeadWidgetComponent) then
    HeadWidgetComponent:SetUniformWidgetHideTag(bHidden, Tag)
  else
    local HideTag = self.HideTagsCache[NpcId] or {}
    self.HideTagsCache[NpcId] = HideTag
    if bHidden then
      HideTag[Tag] = 1
    else
      HideTag[Tag] = nil
    end
  end
end

function NpcHeadUISubsystem:RegisterHeadWidgetComp(NpcId, HeadWidgetComponent)
  if not IsValid(HeadWidgetComponent) then
    return
  end
  if not NpcId then
    return
  end
  self.HeadWidgetComps[NpcId] = HeadWidgetComponent
  local HideTags = self.HideTagsCache[NpcId]
  if HideTags then
    HeadWidgetComponent:SetUniformWidgetHideTags(HideTags)
    self.HideTagsCache[NpcId] = nil
  end
  for Tag, bHidden in pairs(self.HideTags) do
    HeadWidgetComponent:SetUniformWidgetHideTag(true, Tag)
  end
end

function NpcHeadUISubsystem:UnRegisterHeadWidgetComp(NpcId)
  if not NpcId then
    return
  end
  self.HeadWidgetComps[NpcId] = nil
end

function NpcHeadUISubsystem:OnChangeTaskIndicator(InMaps)
  local InMapNpc = {}
  if InMaps then
    for _, NpcId in pairs(InMaps) do
      self:HideNpcHeadUI(NpcId, true, "Mission")
      InMapNpc[NpcId] = true
    end
  end
  for NpcId, HeadWidgetComponent in pairs(self.HeadWidgetComps) do
    if not InMapNpc[NpcId] then
      self:HideNpcHeadUI(NpcId, false, "Mission")
    end
  end
  for NpcId, Tags in pairs(self.HideTagsCache) do
    if not InMapNpc[NpcId] then
      self:HideNpcHeadUI(NpcId, false, "Mission")
    end
  end
end

function NpcHeadUISubsystem:OnEnterImmersiveTalk()
  self:HideAllNpcHeadUI(true, "ImmersiveTalk")
end

function NpcHeadUISubsystem:OnLeaveImmersiveTalk()
  self:HideAllNpcHeadUI(false, "ImmersiveTalk")
end

function NpcHeadUISubsystem:OnNpcEndPlay_Lua(Npc)
  if not IsValid(Npc) then
    return
  end
  self:UnRegisterHeadWidgetComp(Npc.NpcId)
end

function NpcHeadUISubsystem:OnDeinitialize()
  EventManager:RemoveEvent(EventID.OnChangeTaskIndicator, self)
  EventManager:RemoveEvent(EventID.EnterImmersiveTalk, self)
  EventManager:RemoveEvent(EventID.LeaveImmersiveTalk, self)
end

return NpcHeadUISubsystem
