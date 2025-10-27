require("UnLua")
local PersonalTitleUtils = require("Utils.PersonalTitleUtils")
local M = Class({
  "Blueprints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.Super.Initialize(self, Initializer)
  self.AttachedWidgetComponent = nil
  self.bHasInitialized = true
  self.bHasConstruct = false
  self.ExternWidget = {}
end

function M:Construct(...)
  M.Super.Construct(self, ...)
  self.bHasConstruct = true
  if self.EnableParamsPreConstruct then
    self:ConstructRefreshEnable(self.EnableParamsPreConstruct)
    self.EnableParamsPreConstruct = nil
  end
end

function M:InitSubWidgets()
  self.NPC_Bubble_Long:Init(self)
  self.NPC_Bubble_Short:Init(self)
  self.NPC_Impression:Init(self)
  self.NPC_ImpressionShop:Init(self)
  self.Npc_Name_PC:Init(self)
  self.Com_GuidePoint:InitNpcSideQuestBubble(self)
  self.ActiveCount = 0
  self.EnabledWidgets = {}
  self.EnabledWidgets.Name = false
  self.EnabledWidgets.Bubble = false
  self.EnabledWidgets.Impression = false
  self.EnabledWidgets.HeadIcon = false
  self.EnabledWidgets.NpcSideIndicator = false
  self:InitSpecialWidget()
  self.TitleClassPath = nil
  for WidgetName, Widget in pairs(self.ExternWidget) do
    Widget:Init(self)
    self.EnabledWidgets[WidgetName] = false
  end
  self.InTimer = nil
  self.OutTimer = nil
end

function M:TryInsertNewWidget(WidgetName)
  if self.ExternWidget[WidgetName] then
    return self.ExternWidget[WidgetName]
  end
  local WidgetClass = self:GetExternWidgetClass(WidgetName)
  if not WidgetClass then
    return
  end
  local Item = UIManager(self):CreateWidget(WidgetClass)
  self.ExternWidget[WidgetName] = Item
  if "Bubble_Reward" == WidgetName then
    self.Pos_Bubble:AddChildToOverlay(Item)
  else
    self.VB:AddChildToVerticalBox(Item)
  end
  Item:Init(self)
  return self.ExternWidget[WidgetName]
end

function M:EnableWidget(WidgetName, ...)
  if not self:CheckCanWork() then
    return
  end
  self:TryEnableWidget(WidgetName, true, ...)
end

function M:DisableWidget(WidgetName, ...)
  if not self:CheckCanWork() then
    return
  end
  self:TryEnableWidget(WidgetName, false, ...)
end

function M:TryEnableWidget(WidgetName, bEnable, ...)
  if not self:CheckCanWork() then
    return
  end
  local WidgetNameOrign = WidgetName
  if "Long_Bubble" == WidgetName or "Short_Bubble" == WidgetName then
    WidgetName = "Bubble"
  end
  if not not self.EnabledWidgets[WidgetName] == bEnable then
    return
  end
  self.EnabledWidgets[WidgetName] = bEnable
  if not self.bHasConstruct then
    local EnableParams = self.EnableParamsPreConstruct or {}
    self.EnableParamsPreConstruct = EnableParams
    EnableParams[WidgetNameOrign] = table.pack(...)
    return
  end
  self:EnableWidgetInternal(WidgetNameOrign, bEnable, ...)
end

function M:ConstructRefreshEnable(EnableParams)
  local EnabledWidgets = self.EnabledWidgets
  for WidgetName, Param in pairs(EnableParams) do
    local WidgetNameOrign = WidgetName
    if "Long_Bubble" == WidgetName or "Short_Bubble" == WidgetName then
      WidgetName = "Bubble"
    end
    self:EnableWidgetInternal(WidgetNameOrign, EnabledWidgets[WidgetName], table.unpack(Param))
  end
end

function M:EnableWidgetInternal(WidgetName, bEnable, ...)
  if bEnable then
    self.ActiveCount = self.ActiveCount + 1
  else
    self.ActiveCount = self.ActiveCount - 1
  end
  local SpecialWidget = self:TryGetSpecailWidget(WidgetName)
  if IsValid(SpecialWidget) then
    self:EnableSpecialWidget(WidgetName, SpecialWidget, bEnable, ...)
  else
    local Widget = self:TryGetWidget(WidgetName)
    if IsValid(Widget) then
      if bEnable then
        Widget:OnEnabled(...)
      else
        Widget:OnDisabled(...)
      end
    end
  end
  if self.AttachedWidgetComponent then
    self.AttachedWidgetComponent:OnChangeActiveWidgets(self.ActiveCount)
  end
end

function M:CheckCanWork()
  return self.bHasInitialized
end

function M:TryGetWidget(WidgetName)
  if "Name" == WidgetName then
    return self.NPC_Name_PC
  elseif "Bubble" == WidgetName then
    return self:SelectBubbleWidget()
  elseif "Short_Bubble" == WidgetName then
    return self:SetBubbleWidget(1)
  elseif "Long_Bubble" == WidgetName then
    return self:SetBubbleWidget(0)
  elseif "Impression" == WidgetName then
    return self.NPC_Impression
  elseif "HeadIcon" == WidgetName then
    return self.NPC_ImpressionShop
  elseif "NpcSideIndicator" == WidgetName then
    return self.Com_GuidePoint
  else
    return self:TryInsertNewWidget(WidgetName)
  end
end

function M:PlayHideAnimation(bHidden)
  if not self.AttachedWidgetComponent then
    return
  end
  if bHidden then
    if self.InTimer then
      self:RemoveTimer(self.InTimer)
      self.InTimer = nil
    end
    if not self.OutTimer then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
      self.OutTimer = self:AddTimer(0.33, function()
        self:Hide()
        self.OutTimer = nil
      end)
    end
  else
    self:Show()
    if self.OutTimer then
      self:RemoveTimer(self.OutTimer)
      self.OutTimer = nil
    end
    if not self.InTimer then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
      self.InTimer = self:AddTimer(0.33, function()
        self.InTimer = nil
      end)
    end
  end
end

function M:SelectBubbleWidget()
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  local Owner = self.AttachedWidgetComponent:GetOwner()
  local bUseShortBubble = false
  if HeadUISubsystem and Owner then
    bUseShortBubble = HeadUISubsystem:ShouldUseShortBubble(Owner)
  end
  local ActiveBubbleIdx = bUseShortBubble and 1 or 0
  return self:SetBubbleWidget(ActiveBubbleIdx)
end

function M:SetBubbleWidget(Index)
  local OldIndex = self.NPC_Bubble_Switcher:GetActiveWidgetIndex()
  if OldIndex ~= Index then
    local OldWidget = self.NPC_Bubble_Switcher:GetActiveWidget()
    if IsValid(OldWidget) then
      OldWidget:OnDisabled()
    end
  end
  self.NPC_Bubble_Switcher:SetActiveWidgetIndex(Index)
  return self.NPC_Bubble_Switcher:GetActiveWidget()
end

function M:SetAttachedWidget(AttachedWidgetComponent)
  self.AttachedWidgetComponent = AttachedWidgetComponent
end

function M:UnsetAttachedWidget()
  self.AttachedWidgetComponent = nil
  self.bHasConstruct = false
end

function M:SetWidgetInitBubble()
  self.Com_GuidePoint:InitBubble(self)
end

function M:EnableSpecialWidget(WidgetName, Widget, bEnable, ...)
  if "Title" == WidgetName then
    if bEnable then
      self:EnableTitleWidget(Widget, ...)
    else
      self:DisableTitleWidget(Widget)
    end
  end
end

function M:EnableTitleWidget(Widget, TitlePrefix, TitleSuffix, TitleFrameId)
  UIUtils.SetTitle(self.Title, {
    TitleBefore = TitlePrefix,
    TitleAfter = TitleSuffix,
    TitleFrame = TitleFrameId
  })
end

function M:DisableTitleWidget(Widget)
  self.Title:SetVisibility(UE.ESlateVisibility.Collapsed)
end

function M:InitSpecialWidget()
  self.Title:SetVisibility(UE.ESlateVisibility.Collapsed)
end

function M:TryGetSpecailWidget(WidgetName)
  if "Title" == WidgetName then
    return self.Title
  end
end

return M
