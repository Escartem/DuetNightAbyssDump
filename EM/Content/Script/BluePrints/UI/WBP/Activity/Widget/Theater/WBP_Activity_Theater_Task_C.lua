require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local PreConsumeCount = 5
local LongPressTimerInterval = 0.1
local LongPressThreshold = 0.8
local TheaterTaskEventId = DataMgr.TheaterConstant.EventId.ConstantValue
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")

function M:Construct()
  self.Super.Construct(self)
  self:PlayAnimation(self.In)
  self.ListView_Task.OnListViewScrolled:Add(self, self.OnListViewTaskScrolled)
  self.List_Delivery.BP_OnEntryInitialized:Add(self, self.OnListDeliveryItemInited)
  self.Btn_Auto.Button_Area.OnClicked:Add(self, self.OnBtnAutoClicked)
  self.Btn_Auto:SetText(GText("\232\135\170\229\138\168\233\128\137\230\139\169"))
  self.Btn_Delivery.Button_Area.OnClicked:Add(self, self.OnBtnDeliveryClicked)
  self.Button_Hit.OnClicked:Add(self, self.OnButtonHitClicked)
  self.Panel_Bag:SetVisibility(ESlateVisibility.Collapsed)
  self.View_left_btns:SetVisibility(ESlateVisibility.Visible)
  self.bListExpand = false
  self:InitUI()
  self:InitPreConsumeList()
end

function M:OnListDeliveryItemInited(Content, EntryUI)
  self:OnPreConsumeListGenerated(Content, EntryUI)
end

function M:OnButtonHitClicked()
  self:OnExpandList(false, false)
end

function M:OnBtnAutoClicked()
  local bAutoSelect = true
  local Content = self.ListWidgets[1].Content
  if Content and Content.Count and Content.Count > 0 then
    bAutoSelect = false
  end
  if bAutoSelect then
    self:OnAutoSelectClick()
  else
    self:ClearListItems()
  end
end

function M:OnAutoSelectClick()
  DebugPrint("OnAutoSelectClick")
end

function M:OnBtnDeliveryClicked()
end

function M:OnListViewTaskScrolled()
  UIUtils.UpdateListArrow(self.ListView_Task, self.Arrow_UP, self.Arrow_Down)
end

function M:InitUI()
  self.Text_Title01:SetText(GText("TheaterOnline_Donate_Reward"))
  self.Text_Title02:SetText(GText("TheaterOnline_Donate_Progress"))
  self.Text_Title03:SetText(GText("TheaterOnline_Donate_Puy"))
  self.Tab:Init({
    DynamicNode = {"Back"},
    StyleName = "Text",
    TitleName = GText("TheaterOnline_Donate_Name"),
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  })
  self:UpdateBottomKeyInfo()
  self.View_left_btns:ClearListItems()
  for i = 1, 3 do
    local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
    ItemContent.Index = i
    ItemContent.ParentWidget = self
    ItemContent.IsLock = false
    self.View_left_btns:AddItem(ItemContent)
  end
  self:AddTimer(0.01, function()
    self:OnBtnItemClicked(1)
  end)
  local ConfigData = {}
  ConfigData.OwnerWidget = self
  ConfigData.MenuPlacement = EMenuPlacement.MenuPlacement_CenteredAboveAnchor
  
  function ConfigData.SoundFunc()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  ConfigData.TextContent = GText("TheaterOnline_Donate_Explain")
  self.Tip_Award:Init(ConfigData)
end

function M:OnBtnItemClicked(Index)
  if self.SelectedIndex == Index then
    return
  end
  self:UpdatePage(Index)
  if self.SelectedIndex then
    local Item = self.View_left_btns:GetItemAt(self.SelectedIndex - 1)
    Item.UI:StopAllRegularAnimations()
    Item.UI:PlayAnimation(Item.UI.Normal)
  end
  self.SelectedIndex = Index
  local Item = self.View_left_btns:GetItemAt(Index - 1)
  Item.UI:StopAllRegularAnimations()
  Item.UI:PlayAnimation(Item.UI.Click)
end

function M:UpdatePage(Index)
  self:SetupTaskListView(Index)
  self:InitFilteredContents(Index)
  self:FillListItem()
  self:InitRewardListView(Index)
  self:InitPreConsumeList()
end

function M:InitRewardListView(Index)
  self.List_Reward:ClearListItems()
  local RewardId = DataMgr.TheaterDonateStep[TheaterTaskEventId][Index].RewardViewId
  local RewardInfo = DataMgr.RewardView[RewardId]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
      ItemContent.ParentWidget = self
      local ItemId = Ids[i]
      local Count = RewardUtils:GetCount(RewardCount[i])
      local ItemType = TableName[i]
      local Rarity = ItemUtils.GetItemRarity(ItemId, ItemType)
      ItemContent.ItemType = ItemType
      ItemContent.Id = ItemId
      ItemContent.Count = Count
      ItemContent.Rarity = Rarity
      ItemContent.Icon = ItemUtils.GetItemIconPath(ItemId, ItemType)
      ItemContent.IsShowDetails = true
      self.List_Reward:AddItem(ItemContent)
    end
  end
end

function M:SetupTaskListView(Index)
  self.Text_Right_Title:SetText(string.format(GText("TheaterOnline_Donate_Step"), Index))
  self.ListView_Task:ClearListItems()
  local TaskList = DataMgr.TheaterDonateStep[TheaterTaskEventId][Index]
  for i = 1, #TaskList.Resource do
    local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
    ItemContent.ParentWidget = self
    ItemContent.Resource = TaskList.Resource[i]
    ItemContent.Num = TaskList.Num[i]
    self.ListView_Task:AddItem(ItemContent)
  end
  self:AddTimer(0.3, function()
    self:OnListViewTaskScrolled()
  end)
  local isLock = false
  if isLock then
    self.Switch_Delivery:SetActiveWidgetIndex(0)
  else
    self.Switch_Delivery:SetActiveWidgetIndex(1)
  end
end

function M:UpdateBottomKeyInfo()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.CloseSelf,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.CloseSelf,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  if not ModController:IsMobile() then
    self.Tab:UpdateBottomKeyInfo(BottomKeyInfo)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.IsClosingUi then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local KeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == KeyName then
    self:CloseSelf()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:CloseSelf()
  if self.bListExpand then
    self:OnExpandList(false, false)
  else
    self.IsClosingUi = true
    self:PlayAnimation(self.Out)
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self.Super.Close(self)
  end
end

function M:InitFilteredContents(Index)
  self.ContentMap = {}
  self.FilteredContents = {}
  local TaskList = DataMgr.TheaterDonateStep[TheaterTaskEventId][Index]
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Avatar.Resources then
    return
  end
  for i = 1, #TaskList.Resource do
    local Resource = Avatar.Resources[TaskList.Resource[i]]
    if Resource then
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.ParentWidget = self
      Obj.Id = Resource.ResourceId
      Obj.ItemType = "Resource"
      Obj.Count = Resource.Count
      Obj.Icon = Resource.Icon
      Obj.OnMouseButtonDownEvent = {
        Obj = self,
        Callback = function()
          if not self:PreviewLevelMax() then
            self:OnPlusStart(Obj)
          else
            UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Max_Level_Achieved"), 1.5)
          end
        end,
        Params = {bIgnoreRightMouseDown = true}
      }
      Obj.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = function()
          self:OnPlusEnd()
        end
      }
      table.insert(self.FilteredContents, Obj)
      self.ContentMap[Resource.ResourceId] = Obj
    end
  end
end

function M:PreviewLevelMax()
  return false
end

function M:FillListItem()
  self.List_Item:ClearListItems()
  self.LastSelectedListContent = nil
  for i, value in ipairs(self.FilteredContents) do
    value.IndexInList = i - 1
    if value.IsSelect then
      self.LastSelectedListContent = value
    end
    self.List_Item:AddItem(value)
  end
  if not self.LastSelectedListContent then
    self.LastSelectedListContent = self.FilteredContents[1]
  end
end

function M:CreateSlotContent(i)
  local EmptyContent = NewObject(UIUtils.GetCommonItemContentClass())
  EmptyContent.Index = i
  self:ReInitSlotContent(EmptyContent)
  return EmptyContent
end

function M:ReInitSlotContent(Content)
  if Content.Index <= self.PreConsumeCount then
    Content.NotInteractive = false
    Content.OnMouseButtonDownEvent = {
      Obj = self,
      Callback = function()
        if Content.UnitId then
          self:OnMinusStart(Content)
        end
      end
    }
    Content.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        if self.IsMobile and Content.SelfWidget then
          Content.SelfWidget.Item:PlayAnimation(Content.SelfWidget.Item.UnHover)
        end
        if Content.UnitId then
          if not self.MinusPressed then
            self:OnItemMinusBtnClick(Content)
          else
            self:OnMinusEnd()
          end
        elseif self.MinusPressed then
          AudioManager(self):PlayItemSound(self, self.MinusContent.UnitId, "Click", self.MinusContent.ItemType)
        else
          AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
          self:OnExpandList(true, false)
        end
        self.MinusPressed = false
      end
    }
    Content.OnMouseEnterEvent = {
      Obj = self,
      Callback = function()
        self.CurrentWidget = Content.SelfWidget
      end
    }
    Content.OnMouseLeaveEvent = {
      Obj = self,
      Callback = function()
        self.CurrentWidget = nil
      end
    }
  else
    Content.NotInteractive = true
    Content.OnMouseButtonUpEvents = nil
  end
end

function M:InitPreConsumeList()
  self.SelectedCount = 0
  self.PreConsumeCount = PreConsumeCount
  self.PreConsumeList = {}
  self.ListWidgets = {}
  self.MinusPressed = false
  self.MinusPressTime = 0
  self.MinusContent = nil
  self.MinusTimer = nil
  self.CurrentWidget = nil
  for i = 1, PreConsumeCount do
    local EmptyContent = self:CreateSlotContent(i)
    table.insert(self.PreConsumeList, EmptyContent)
  end
  self.List_Delivery:ClearListItems()
  for _, Content in pairs(self.PreConsumeList) do
    self.List_Delivery:AddItem(Content)
  end
end

function M:CopyItemToConsumeList(AddContent)
  self.SelectedCount = self.SelectedCount + 1
  self.PreConsumeList = {}
  local PreConsumeArray = self.ListWidgets
  local Avatar = GWorld:GetAvatar()
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if i == self.SelectedCount then
      local Target = Avatar.Resources[AddContent.Id]
      assert(Target and Target.Count > 0, "\233\128\154\231\148\168\230\157\144\230\150\153\228\184\141\229\173\152\229\156\168\230\136\150\229\183\178\232\128\151\229\176\189")
      Content = ArmoryUtils:NewResourceItemContent(Target)
      Content.Count = 1
      Content.Index = i
      self:ReInitSlotContent(Content)
    end
    table.insert(self.PreConsumeList, Content)
  end
  self:UpdatePreConsumeList(self.PreConsumeList)
end

function M:OnItemMinusBtnClick(DelContent)
  if not DelContent then
    return
  end
  self.PreConsumeList = {}
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if Content.Index == DelContent.Index then
    else
      if Content.Index > DelContent.Index then
        Content.Index = Content.Index - 1
        self:ReInitSlotContent(Content)
      end
      table.insert(self.PreConsumeList, Content)
    end
  end
  for i = #self.PreConsumeList + 1, PreConsumeCount do
    local EmptyContent = self:CreateSlotContent(i)
    EmptyContent.bEmpty = true
    table.insert(self.PreConsumeList, EmptyContent)
  end
  self.SelectedCount = self.SelectedCount - 1
  self:UpdatePreConsumeList(self.PreConsumeList)
end

function M:OnMinusStart(Content)
  if not self.MinusPressed then
    self.MinusPressed = true
    self.MinusPressTime = 0
    self.MinusContent = Content or self:GetCurrentContent()
    self.MinusTimer = self:AddTimer(LongPressTimerInterval, self.UpdateMinus, true, 0, nil, true)
    self:RemoveCurrentContent()
  end
end

function M:OnMinusEnd()
  if self.MinusPressed then
    self.MinusPressed = false
    if self.MinusTimer then
      self:RemoveTimer(self.MinusTimer)
      self.MinusTimer = nil
    end
  end
end

function M:UpdateMinus()
  if self.MinusPressed then
    self.MinusPressTime = self.MinusPressTime + LongPressTimerInterval
    if self.MinusPressTime >= LongPressThreshold then
      self:RemoveCurrentContent()
    end
  end
end

function M:RemoveCurrentContent()
  local Content = self.MinusContent
  if not Content or not Content.UnitId then
    return
  end
  Content.Count = Content.Count - 1
  self:SetResourceCount(Content.UnitId, Content.Count)
  if Content.Count > 0 then
    Content.SelfWidget:SetCount(Content.Count)
  else
    self:OnItemMinusBtnClick(Content)
    if self.MinusTimer then
      self:RemoveTimer(self.MinusTimer)
      self.MinusTimer = nil
    end
  end
end

function M:GetCurrentContent()
  return self.CurrentWidget and self.CurrentWidget.Content
end

function M:SetResourceCount(ResourceId, Cnt)
  local Content = self.ContentMap[ResourceId]
  if not Content or not Content.SelfWidget then
    return
  end
  local Widget = Content.SelfWidget
  Widget:SetSelectNum(Cnt > 0 and Cnt or nil)
end

function M:ClearResourceCnt()
  for Uuid, _ in pairs(self.ContentMap or {}) do
    self:SetResourceCount(Uuid, 0)
  end
end

function M:OnExpandList(bExpandList, bRefreshList)
  if self.bListExpand == bExpandList then
    return
  end
  self.bListExpand = bExpandList
  if bExpandList then
    self:PlayAnimation(self.Bag_In)
    self.View_left_btns:SetVisibility(ESlateVisibility.Collapsed)
  else
    self:PlayAnimation(self.Bag_Out)
    self.View_left_btns:SetVisibility(ESlateVisibility.Visible)
  end
end

function M:UpdatePreConsumeList(PreConsumeList)
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local NewContent = PreConsumeList[i]
    Widget:Init(NewContent)
    self:OnPreConsumeListGenerated(NewContent, Widget)
  end
  if self.CurrentWidget then
    self.CurrentWidget.Item:PlayAnimation(self.CurrentWidget.Item.Hover)
  end
end

function M:OnPreConsumeListGenerated(Content, Widget)
  local Index = Content.Index
  self.ListWidgets[Index] = Widget
  local LastWidget = Index > 1 and self.ListWidgets[Index - 1] or nil
  if Content.Index <= self.PreConsumeCount then
    if LastWidget then
      LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, Widget)
      Widget:SetNavigationRuleExplicit(EUINavigation.Left, LastWidget)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    end
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  else
    Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
  if not Content.UnitId then
    Widget:SetAdd(not Content.NotInteractive)
    Widget:SetItemMinus(false)
  else
    Widget:SetAdd(false)
    Widget:SetItemMinus(true)
    local MinusBtn = Widget.MinusWidget and Widget.MinusWidget.Btn_Minus
    if not MinusBtn then
      return
    end
    MinusBtn:BindEventOnPressed(self, self.OnMinusStart, Content)
    MinusBtn:BindEventOnReleased(self, self.OnMinusEnd)
  end
end

function M:ClearListItems()
  self.PreConsumeList = {}
  for i = PreConsumeCount, 1, -1 do
    local EmptyContent = self:CreateSlotContent(PreConsumeCount - i + 1)
    table.insert(self.PreConsumeList, EmptyContent)
  end
  self:UpdatePreConsumeList(self.PreConsumeList)
  self:ClearResourceCnt()
  self.SelectedCount = 0
end

function M:OnPlusStart(Content)
  if not self.PlusPressed then
    self.PlusPressed = true
    self.PlusPressTime = 0
    self.PlusContent = Content
    self.PlusTimer = self:AddTimer(LongPressTimerInterval, self.UpdatePlus, true, 0, nil, true)
    self:AddResource()
  end
end

function M:OnPlusEnd()
  if self.PlusPressed then
    if self.PlusTimer then
      self:RemoveTimer(self.PlusTimer)
      self.PlusTimer = nil
    end
    self.PlusPressed = false
  end
end

function M:UpdatePlus()
  if self.PlusPressed then
    self.PlusPressTime = self.PlusPressTime + LongPressTimerInterval
    if self.PlusPressTime >= LongPressThreshold then
      self:AddResource()
    end
  end
end

function M:FindSelectedContent(Id)
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if Content.UnitId and Content.UnitId == Id then
      return Content
    end
  end
  return nil
end

function M:GetConsumeContents()
  local PreConsumeArray = self.ListWidgets
  local ConsumeContents = {}
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    table.insert(ConsumeContents, Content)
  end
  return ConsumeContents
end

function M:AddResource()
  local PlusContent = self.PlusContent
  if not PlusContent then
    return
  end
  local CurContent = self:FindSelectedContent(PlusContent.Id)
  local emptyIndex
  local ConsumeContents = self:GetConsumeContents()
  for i = 1, self.PreConsumeCount do
    if not ConsumeContents[i].UnitId then
      emptyIndex = i
      break
    end
  end
  if not CurContent and emptyIndex then
    self:CopyItemToConsumeList(PlusContent)
    self:SetResourceCount(PlusContent.Id, 1)
  elseif not CurContent and not emptyIndex then
    return
  else
    if self:PreviewLevelMax() then
      if not self.bAutoSelecting then
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Max_Level_Achieved"), 1.5)
      end
      if self.PlusTimer then
        self:RemoveTimer(self.PlusTimer)
        self.PlusTimer = nil
      end
      return
    end
    if CurContent.Count < PlusContent.Count then
      CurContent.Count = CurContent.Count + 1
      CurContent.SelfWidget:SetCount(CurContent.Count)
      self:SetResourceCount(CurContent.UnitId, CurContent.Count)
    end
  end
end

return M
