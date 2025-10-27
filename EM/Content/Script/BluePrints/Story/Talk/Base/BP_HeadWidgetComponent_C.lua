require("UnLua")
local BP_HeadWidgetComponent_C = Class("BluePrints.Common.TimerMgr")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local Const = require("Const")

function BP_HeadWidgetComponent_C:Initialize(Initializer)
  self.OwnerLocation = nil
  self.State = 0
  self.HeadImpressionWidgetMgr = nil
  self.HideTags = {}
end

function BP_HeadWidgetComponent_C:ReceiveBeginPlay()
  self.Owner = self:GetOwner()
  if self.Owner.Eid then
    UIManager(self):AddWidgetComponentToList(self.Owner.Eid, "NPCHeadWidget", self)
  else
    UIManager(self):AddWidgetComponentToList(self.Owner, "NPCHeadWidget", self)
  end
  self.Overridden.ReceiveBeginPlay(self)
end

function BP_HeadWidgetComponent_C:ReceiveEndPlay(EndPlayReason)
  UIManager(self):RemoveWidgetComponentToList(self.Owner.Eid, "NPCHeadWidget")
  self:TryReleaseWidgetInternal()
  self.Owner = nil
end

function BP_HeadWidgetComponent_C:UnsetAttachedWidget(Widget)
  Widget.AttachedWidgetComponent = nil
end

function BP_HeadWidgetComponent_C:GetOrCreateWidget(WidgetName)
  if not self:CheckCanGetWidget(WidgetName) then
    return
  end
  if self.ReleaseTimer then
    self:RemoveTimer(self.ReleaseTimer)
    self.ReleaseTimer = nil
  end
  local Widget = self:GetWidget()
  if IsValid(Widget) then
    return Widget
  end
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if HeadUISubsystem then
    Widget = HeadUISubsystem:TryGetHeadWidget(self)
  end
  if not Widget then
    local Title = "\232\142\183\229\143\150\229\164\180\233\161\182UI\229\164\177\232\180\165"
    local Message = string.format("HeadWidgetComponent\232\142\183\229\143\150\229\164\180\233\161\182Widget\230\151\182\229\164\177\232\180\165 NPCId:%d", self:GetOwner().NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, Title, Message)
    return
  end
  Widget:InitSubWidgets()
  self:SetWidget(Widget)
  Widget:SetAttachedWidget(self)
  Widget:SetWidgetInitBubble(self)
  self:UpdateUniformWidgetHide()
  self:OcclusionTestFuncWithoutAnim()
  return Widget
end

function BP_HeadWidgetComponent_C:CheckCanGetWidget(WidgetName)
  local bRegionClientOnlyShowUI = GWorld.GameInstance and GWorld.GameInstance.bRegionClientOnlyShowUI
  if bRegionClientOnlyShowUI then
    return true
  end
  if ("Impression" == WidgetName or "Name" == WidgetName) and (not (self.Owner and self.Owner.Mesh) or not self.Owner.Mesh.SkeletalMesh) then
    return false
  end
  if not self.Owner then
    return false
  end
  return true
end

function BP_HeadWidgetComponent_C:TryReleaseWidgetInternal()
  self:RemoveOcclusionTestTimer()
  self:SetWidgetRenderOpacity(1.0)
  self.HideTags.Occlusion = nil
  self:CleanTimer()
  local Widget = self:GetWidget()
  if not IsValid(Widget) then
    return
  end
  Widget.HideTags = {}
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if self:GetOwner() and HeadUISubsystem then
    HeadUISubsystem:TryReleaseHeadWidget(self, Widget)
  end
  self:SetWidget(nil)
  Widget:UnsetAttachedWidget()
  self.ReleaseTimer = nil
end

function BP_HeadWidgetComponent_C:EnableWidget(WidgetName, ...)
  local Widget = self:GetOrCreateWidget(WidgetName)
  if not IsValid(Widget) then
    return
  end
  Widget:EnableWidget(WidgetName, ...)
end

function BP_HeadWidgetComponent_C:DisableWidget(WidgetName, ...)
  local Widget = self:GetWidget()
  if Widget then
    Widget:DisableWidget(WidgetName, ...)
  end
end

function BP_HeadWidgetComponent_C:NeedForceInit()
  return 0 == self.State
end

function BP_HeadWidgetComponent_C:OnChangeActiveWidgets(State)
  self.State = State
  if 0 == State then
    if not self.ReleaseTimer then
      self.ReleaseTimer = self:AddTimer(0.3, self.TryReleaseWidgetInternal)
    end
  else
    self:AddOcclusionTestTimer()
  end
end

function BP_HeadWidgetComponent_C:UpdateUniformWidgetHide()
  local bHidden = self:IsHidden()
  local Widget = self:GetWidget()
  if IsValid(Widget) then
    if bHidden then
      Widget:Hide()
    else
      Widget:Show()
    end
  end
end

function BP_HeadWidgetComponent_C:SetUniformWidgetHideTags(Tags)
  self.HideTags = Tags
  self:UpdateUniformWidgetHide()
end

function BP_HeadWidgetComponent_C:SetUniformWidgetHideTag(bHidden, Tag)
  self:UpdateTag(bHidden, Tag)
  self:UpdateUniformWidgetHide()
end

function BP_HeadWidgetComponent_C:SetUniformWidgetHideWithAnim(bHidden, Tag)
  local Widget = self:GetWidget()
  if self:CheckAndUpdateTag(bHidden, Tag) and IsValid(Widget) then
    Widget:PlayHideAnimation(bHidden)
  end
  self:TriggerAllSpecialSideIndicatorUIObjVisible(bHidden)
end

function BP_HeadWidgetComponent_C:TriggerAllSpecialSideIndicatorUIObjVisible(bHeadHidden)
  if not self.Owner then
    return
  end
  local UI = UIManager(self):GetUIObj("UnSpecialSide_" .. tostring(self.Owner.UnitId))
  if UI and true == bHeadHidden then
    UI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif UI and false == bHeadHidden then
    UI:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function BP_HeadWidgetComponent_C:IsHidden()
  return not IsEmptyTable(self.HideTags)
end

function BP_HeadWidgetComponent_C:UpdateTag(bHidden, Tag)
  if bHidden then
    self.HideTags[Tag] = 1
  else
    self.HideTags[Tag] = nil
  end
end

function BP_HeadWidgetComponent_C:CheckAndUpdateTag(bHidden, Tag)
  local bCache = self:IsHidden()
  self:UpdateTag(bHidden, Tag)
  return bCache ~= self:IsHidden()
end

function BP_HeadWidgetComponent_C:SetWidgetRenderOpacity(Opacity)
  local Widget = self:GetWidget()
  if IsValid(Widget) then
    Widget.Root:SetRenderOpacity(Opacity)
  end
end

local function CalculateBubbleTime(Text, bShortBubble)
  local Language = CommonConst.SystemLanguage
  local Size = 3.0
  if Language == CommonConst.SystemLanguages.EN then
    Size = 2.0
  end
  local Len = string.len(Text) / 3.0
  local LineCount = Len / (bShortBubble and 10 or 22)
  return math.max(LineCount * Const.BubbleTimePerLine, Const.BubbleTimePerLine)
end

function BP_HeadWidgetComponent_C:EnableBubbleWidget(TextMapId, Time, bShortBubble)
  local WidgetName = "Long_Bubble"
  if bShortBubble then
    WidgetName = "Short_Bubble"
  end
  self:DisableWidget(WidgetName)
  if self.DisableBubbleTimer then
    self:RemoveTimer(self.DisableBubbleTimer)
    self.DisableBubbleTimer = nil
  end
  local Text = GText(TextMapId)
  if Time and Time < 0 then
    Time = CalculateBubbleTime(Text, bShortBubble)
  end
  self:EnableWidget(WidgetName, Text, nil, Time)
  if Time and Time >= 0 then
    self.DisableBubbleTimer = self:AddTimer(Time, function()
      self:DisableWidget(WidgetName)
    end, false)
  end
end

return BP_HeadWidgetComponent_C
