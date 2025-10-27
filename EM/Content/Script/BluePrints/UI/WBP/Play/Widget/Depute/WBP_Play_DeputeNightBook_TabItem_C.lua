require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
end

function M:Construct()
  M.Super.Construct(self)
  self.IsPC = CommonUtils.GetDeviceTypeByPlatformName(CapturePanel) == "PC"
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:SelectCell()
  if self.IsSelect then
    return
  end
  self.IsSelect = true
  self:AddTimer(0.01, function()
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.List_NightBookItem:NavigateToIndex(0)
      self:UpdatKeyDisplay(true)
    end
  end, false, 0, "DeputeNightBook_TabItemListView_OnClicked")
  self.Parent:RefreshRewardInfoList(self.DungeonData.Name)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Parent = Content.Parent
  self.Root = Content.Root
  self.Index = Content.Index
  self.DungeonData = Content.DungeonData
  self.List_NightBookItem = Content.List_NightBookItem
  self.Level = Content.Level
  Content.UI = self
  self:InitItemContent()
  self.OwningList = UE4.UUserListEntryLibrary.GetOwningListView(self)
  if self.OwningList and self.Parent.SelectCellIndex == self.Index then
    self.OwningList:ScrollIndexIntoView(self.Index - 1)
    self:OnClickedCell()
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
  self.IsSelect = false
  self:PlayAnimation(self.Normal)
end

function M:InitItemContent()
  if self.DungeonData then
    self.Text_LvNum:SetText(GText(self.DungeonData.Name))
    if PageJumpUtils:CheckDungeonCondition(self.DungeonData.Condition) then
      self.IsUnLocked = false
      self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
      self:StopAllAnimations()
      if self.Parent.SelectCellIndex ~= self.Index then
        self:PlayAnimation(self.Normal)
      end
    else
      self.IsUnLocked = true
      self.Image_Lock:SetVisibility(ESlateVisibility.Visible)
      self:StopAllAnimations()
      self:PlayAnimation(self.Lock)
    end
  end
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:OnClickedCell()
end

function M:OnClickedCell()
  if self.IsUnLocked then
    PageJumpUtils:CheckDungeonCondition(self.DungeonData.Condition, true)
    return
  end
  if self.IsSelect then
    return
  end
  if self.Parent then
    self.Parent:OnClickedCell(self.Content)
  end
end

function M:OnPressed()
  if self.IsUnLocked then
    return
  end
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
  if self.IsUnLocked then
    return
  end
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnHovered()
  if self.IsUnLocked then
    return
  end
  if not self.IsPC then
    return
  end
  self:UpdatKeyDisplay()
  self:StopAllAnimations()
  if not self.IsSelect then
    self:PlayAnimation(self.Hover)
  end
end

function M:OnUnhovered()
  if self.IsUnLocked then
    return
  end
  if self.IsSelect or not self.IsPC then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnCellUnSelect()
  if self.IsUnLocked then
    return
  end
  self:StopAllAnimations()
  self.IsSelect = false
  self:PlayAnimation(self.Normal)
end

function M:RefreshDungeonRewards()
  self.List_NightBookItem:ClearListItems()
  local MonsterRewardDataList = {}
  for _, id in pairs(self.DungeonData.MonRewardIdList) do
    local RewardData = DataMgr.ModDungeonMonReward[id]
    table.insert(MonsterRewardDataList, RewardData)
  end
  table.sort(MonsterRewardDataList, function(A, B)
    return A.Sequence < B.Sequence
  end)
  local loadedItemCount = 0
  for Index, RewardData in ipairs(MonsterRewardDataList) do
    local Content = self:CreateRewardContent(RewardData)
    self.List_NightBookItem:AddItem(Content)
    if self:IsExistTimer(self.NextFrameListEmpty) then
      self:RemoveTimer(self.NextFrameListEmpty)
    end
    self.NextFrameListEmpty = self:AddTimer(0.01, function()
      local ItemUIs = self.List_NightBookItem:GetDisplayedEntryWidgets()
      local RestCount = UIUtils.GetListViewContentMaxCount(self.List_NightBookItem, ItemUIs, true) - ItemUIs:Length()
      for i = 1, RestCount do
        self:CreateAndAddEmptyItem()
      end
      self.List_NightBookItem:ScrollToTop()
    end, false, 0, "DeputeNightBook_TabItemListView")
  end
end

function M:CreateAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.IsEmpty = true
  self.List_NightBookItem:AddItem(Content)
end

function M:CreateRewardContent(RewardData)
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.MonRewardData = RewardData
  Content.Root = self.Root
  Content.IsEmpty = false
  Content.Parent = self.Parent
  return Content
end

function M:UpdatKeyDisplay()
  local Item = UIManager(self):GetUIObj("StyleOfPlay")
  if not Item then
    return
  end
  local BottomKeyInfo = {}
  if self.IsSelect then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.Root.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
  else
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.Root.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
  end
  Item:UpdateOtherPageTab(BottomKeyInfo)
end

return M
