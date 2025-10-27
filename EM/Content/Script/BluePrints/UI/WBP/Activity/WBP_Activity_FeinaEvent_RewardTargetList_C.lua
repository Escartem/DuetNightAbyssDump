require("UnLua")
local WBP_Activity_FeinaEvent_RewardTargetList_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Activity_FeinaEvent_RewardTargetList_C:Construct()
  self.IsSelect = false
  self.AddListenerFinish = false
  self.List_Item:ClearListItems()
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:OnListItemObjectSet(Content)
  self.List_Item:ClearListItems()
  self.List_Item:DisableScroll(true)
  Content.Entry = self
  self.Content = Content
  self.Content.Entry = self
  self.DungeonId = Content.DungeonId
  local RewardInfo = DataMgr.FeinaEventDungeon[self.DungeonId]
  self:Init(RewardInfo)
  self.Text_Title:SetText(GText(self.Content.Title))
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:OnListNavigateBoundary(NavigationDirection)
  return self.Content.Root:NavigateToNextDisplayedItem()
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:OnListNavigateBoundaryUp(NavigationDirection)
  return self.Content.Root:NavigateToPreviousDisplayedItem()
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:Init(RewardInfo)
  self.Text_Title:SetText(GText(RewardInfo.DungeonName))
  for Index, Des in pairs(RewardInfo.Level) do
    local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self.Content.Root
    Obj.Index = Index
    Obj.LevelDes = RewardInfo.LevelDes[Index]
    Obj.DungeonId = self.DungeonId
    Obj.Num = RewardInfo.Level[Index]
    Obj.RewardId = RewardInfo.Reward[Index]
    Obj.Type = self.Content.Root.Type
    self.List_Item:AddItem(Obj)
  end
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:InitKeyboardView()
  local ItemViews = self.List_Item:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitKeyboardView()
  end
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:InitGamepadView()
  local ItemViews = self.List_Item:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitGamepadView()
  end
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:NavigateToFisrtItem()
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.List_Item:SetFocus()
    self.List_Item:SetSelectedIndex(1)
  end
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:NavigateToFirstDisplayedItem()
  local ItemUIs = self.List_Item:GetDisplayedEntryWidgets()
  if ItemUIs:Length() > 0 then
    local TargetWidget
    for i = 1, ItemUIs:Length() do
      local Widget = ItemUIs:GetRef(i)
      local Index = Widget.Content.Index
      if Index and (not TargetWidget or Index < TargetWidget.Content.Index) then
        TargetWidget = Widget
      end
    end
    if TargetWidget then
      self.List_Item:BP_NavigateToItem(TargetWidget.Content)
      return TargetWidget
    end
  end
  return self.List_Item
end

function WBP_Activity_FeinaEvent_RewardTargetList_C:OnFocusLost(InFocusEvent)
end

return WBP_Activity_FeinaEvent_RewardTargetList_C
