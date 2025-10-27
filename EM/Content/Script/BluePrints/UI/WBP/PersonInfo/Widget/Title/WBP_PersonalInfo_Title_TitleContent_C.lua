require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()
local Handled = UE4.UWidgetBlueprintLibrary.Handled()
local EnableLog = false
local ScreenPrint = DebugPrint

function M:Initialize()
  self.OriginalPreItemCount = 0
  self.OriginalSuffixItemCount = 0
  self.FullFillCount = 0
  self.CenterOffset = 0
  self.SelectPrefixTitleItem = nil
  self.SelectSuffixTitleItem = nil
  self.SuffixTitleContents = nil
  self.PrefixTitleContents = nil
  self.LoopStartIdx = nil
  self.LoopEndIdx = nil
  self.AnalogControlProgress = 0
  self.IsFocusPrefix = true
  self.MinObjCount = 16
  self.AnalogControlSpeed = self.AnalogControlSpeed or 10
  self.AnalogControlProgress = 0
end

function M:Construct()
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.AnalogControlCd = 0.2
  self:SetFocus()
end

function M:InitBaseView()
  local Avatar = GWorld:GetAvatar()
  local PrefixTitles = {}
  self.PrefixTitles = PrefixTitles
  local SuffixTitles = {}
  self.SuffixTitles = SuffixTitles
  local AllTitles = Avatar.Titles
  self.UsedPrefixTitleID = Avatar.TitleBefore
  self.UsedSuffixTitleID = Avatar.TitleAfter
  self.UsedPrefixTitle = nil
  self.UsedSuffixTitle = nil
  for index, value in pairs(AllTitles) do
    if DataMgr.Title[index] then
      local TitleData = DataMgr.Title[index]
      local TitleContent = {
        Name = TitleData.Name,
        TitleID = TitleData.TitleID
      }
      if TitleData.IfSuffix then
        table.insert(SuffixTitles, TitleContent)
      else
        table.insert(PrefixTitles, TitleContent)
      end
    end
  end
  table.sort(PrefixTitles, function(a, b)
    return a.TitleID < b.TitleID
  end)
  table.sort(SuffixTitles, function(a, b)
    return a.TitleID < b.TitleID
  end)
  local PrefixTitleContents = {}
  local SuffixTitleContents = {}
  self.SuffixTitleContents = SuffixTitleContents
  self.PrefixTitleContents = PrefixTitleContents
  local ItemContent = 0
  while ItemContent < self.MinObjCount do
    local EmptyTitle1 = NewObject(UIUtils.GetCommonItemContentClass())
    EmptyTitle1.Name = "-"
    EmptyTitle1.TitleID = -1
    EmptyTitle1.RealIndex = #PrefixTitleContents + 1
    if -1 == self.UsedPrefixTitleID and self.UsedPrefixTitle == nil then
      self.UsedPrefixTitle = EmptyTitle1
    end
    self.List_Title01:AddItem(EmptyTitle1)
    table.insert(PrefixTitleContents, EmptyTitle1)
    for index, value in pairs(PrefixTitles) do
      local PrefixTitle = NewObject(UIUtils.GetCommonItemContentClass())
      PrefixTitle.Name = value.Name
      PrefixTitle.TitleID = value.TitleID
      PrefixTitle.RealIndex = #PrefixTitleContents + 1
      self.List_Title01:AddItem(PrefixTitle)
      table.insert(PrefixTitleContents, PrefixTitle)
      if self.UsedPrefixTitleID == value.TitleID and self.UsedPrefixTitle == nil then
        self.UsedPrefixTitle = PrefixTitle
      end
    end
    ItemContent = #PrefixTitleContents
  end
  ItemContent = 0
  while ItemContent < self.MinObjCount do
    local EmptyTitle2 = NewObject(UIUtils.GetCommonItemContentClass())
    EmptyTitle2.Name = "-"
    EmptyTitle2.TitleID = -1
    EmptyTitle2.RealIndex = 1
    if -1 == self.UsedSuffixTitleID and nil == self.UsedSuffixTitle then
      self.UsedSuffixTitle = EmptyTitle2
    end
    self.List_Title02:AddItem(EmptyTitle2)
    table.insert(SuffixTitleContents, EmptyTitle2)
    for index, value in pairs(SuffixTitles) do
      local SuffixTitle = NewObject(UIUtils.GetCommonItemContentClass())
      SuffixTitle.Name = value.Name
      SuffixTitle.TitleID = value.TitleID
      SuffixTitle.RealIndex = #SuffixTitleContents + 1
      self.List_Title02:AddItem(SuffixTitle)
      table.insert(SuffixTitleContents, SuffixTitle)
      if self.UsedSuffixTitleID == value.TitleID and nil == self.UsedSuffixTitle then
        self.UsedSuffixTitle = SuffixTitle
      end
    end
    ItemContent = #SuffixTitleContents
  end
  self.OriginalPreItemCount = #PrefixTitleContents
  self.OriginalSuffixItemCount = #SuffixTitleContents
  local fakeidx = 0
  self.List_Title01.OnCreateEmptyContent:Bind(self, function(self)
    fakeidx = fakeidx + 1
    local obj = NewObject(UIUtils.GetCommonItemContentClass())
    obj.Name = fakeidx + 1
    return obj
  end)
  self.List_Title02.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self.List_Title01:SetIsEnableScrollAnimation(true)
  self.List_Title02:SetIsEnableScrollAnimation(true)
  self.List_Title01:RequestLoopListInit()
  self.List_Title02:RequestLoopListInit()
  self:BindListViewEvents()
  self:AddTimer(0.1, function()
    self:CalculateLayoutParams()
    self:InitSelect()
  end, nil, nil, nil, true)
  if EnableLog then
    self:AddTimer(1, function()
      local currentOffset = self.List_Title01:GetScrollOffset()
      ScreenPrint("\228\189\141\231\189\174\230\138\165\230\151\182:currentOffset:" .. currentOffset .. "\229\144\142\230\156\128  " .. self.List_Title02:GetScrollOffset())
    end, true, nil, nil, true)
  end
end

function M:InitSelect()
  local Item = self:GetAutoSelectTitle(true)
  self:ScrollToItem(Item, true)
  self:SelectTitle(Item, true)
  local Item2 = self:GetAutoSelectTitle(false)
  self:ScrollToItem(Item2, false)
  self:SelectTitle(Item2, false)
  self.bHaveInit = true
end

function M:GetAutoSelectTitle(bIsPrefix)
  if bIsPrefix then
    if self.UsedPrefixTitleID and self.UsedPrefixTitle then
      return self.UsedPrefixTitle
    else
      local currentOffset = self.List_Title01:GetScrollOffset()
      local NewItem = self:ItemOffset2SelectContent(currentOffset, true)
      return NewItem
    end
  elseif self.UsedSuffixTitleID and self.UsedSuffixTitle then
    return self.UsedSuffixTitle
  else
    local currentOffset = self.List_Title02:GetScrollOffset()
    local NewItem = self:ItemOffset2SelectContent(currentOffset, false)
    return NewItem
  end
end

function M:BindListViewEvents()
  self.List_Title01.OnListViewScrolled:Add(self, self.OnPrefixTitleScrolled)
  self.List_Title01.OnMouseButtonUp:Add(self, self.OnPrefixTitleMouseUp)
  self.List_Title02.OnListViewScrolled:Add(self, self.OnSuffixTitleScrolled)
  self.List_Title02.OnMouseButtonUp:Add(self, self.OnSuffixTitleMouseUp)
end

function M:CalculateLayoutParams()
  self.FullFillCount = self.List_Title01:GetFullFillItemCount()
  DebugPrint("\231\167\176\229\143\183\231\179\187\231\187\159\239\188\154FullFillCount:" .. self.FullFillCount)
  self.CenterOffset = (self.FullFillCount - 1) / 2
  DebugPrint("\231\167\176\229\143\183\231\179\187\231\187\159\239\188\154CenterOffset:" .. self.CenterOffset)
  self.LoopStartIdx = self.FullFillCount
  self.LoopEndIdx = self.FullFillCount + self.OriginalPreItemCount
  DebugPrint("\231\167\176\229\143\183\231\179\187\231\187\159\239\188\154LoopStartIdx:" .. self.LoopStartIdx .. " LoopEndIdx:" .. self.LoopEndIdx)
  DebugPrint("   \231\167\176\229\143\183\231\179\187\231\187\159OriginalPreItemCount:" .. self.OriginalPreItemCount .. " OriginalSuffixItemCount:" .. self.OriginalSuffixItemCount)
end

function M:OnPrefixTitleScrolled(ItemOffset, DistanceRemaining)
  if not self.bHaveInit then
    return
  end
  if self.LastPreListOffSet and math.abs(ItemOffset - self.LastPreListOffSet) < 0.01 then
    self:EndScroll(true, function()
      self:SetToClosestItem(true)
    end)
  end
  self.LastPreListOffSet = ItemOffset
  ScreenPrint("-------------\230\187\154\229\138\168\228\184\173:ItemOffset:" .. ItemOffset .. " DistanceRemaining:" .. DistanceRemaining)
  self:ChangeSelectPrefixTitle()
end

function M:OnSuffixTitleScrolled(ItemOffset, DistanceRemaining)
  ScreenPrint("-------------\230\187\154\229\138\168\228\184\173:ItemOffset:" .. ItemOffset .. " DistanceRemaining:" .. DistanceRemaining)
  if not self.bHaveInit then
    return
  end
  if self.LastSufListOffSet and math.abs(ItemOffset - self.LastSufListOffSet) < 0.01 then
    self:EndScroll(false, function()
      self:SetToClosestItem(false)
    end)
  end
  self.LastSufListOffSet = ItemOffset
  self:ChangeSelectSuffixTitle()
end

function M:ChangeSelectPrefixTitle(Aim)
  local currentOffset = Aim or self.List_Title01:GetScrollOffset()
  local NewItem = self:ItemOffset2SelectContent(currentOffset, true)
  if NewItem == self.SelectPrefixTitleItem then
    return
  end
  self:SelectTitle(NewItem, true)
end

function M:ChangeSelectSuffixTitle()
  local currentOffset = self.List_Title02:GetScrollOffset()
  local NewItem = self:ItemOffset2SelectContent(currentOffset, false)
  if NewItem == self.SelectSuffixTitleItem then
    return
  end
  if nil == NewItem then
    return
  end
  self:SelectTitle(NewItem, false)
end

function M:CancelSelectTitle(Item)
  if Item then
    Item.IsSelected = false
  end
  if Item and Item.UI then
    ScreenPrint("------------\229\143\150\230\182\136\233\128\137\228\184\173\228\186\134 " .. (Item and Item.Name) .. Item.UI.Text_Title:GetText() or " \231\169\186 " .. (Item and Item.ReallyIdx) or " \231\169\186id ")
    Item.UI.Text_Title:SetRenderOpacity(0.4)
  end
end

function M:ScrollandSelectTitle(Item, bIsPrefix)
  local RealIdx = Item.RealIndex
  local list
  if bIsPrefix then
    list = self.List_Title01
  else
    list = self.List_Title02
  end
  list:ScrollIndexIntoView(math.floor(self.FullFillCount - self.CenterOffset + RealIdx + 0.5))
  self:Addtimer(1, function()
    self:SelectTitle(Item, bIsPrefix)
  end, nil, nil, nil, true)
end

function M:SelectTitle(Item, bIsPrefix)
  self:AddTimer(0.01, function()
    self:ReallySelectTitle(Item, bIsPrefix)
  end, nil, nil, bIsPrefix and "\229\137\141\231\188\128" or "\229\144\142\231\188\128", true)
end

function M:ReallySelectTitle(Item, bIsPrefix)
  if bIsPrefix then
    if Item == self.SelectPrefixTitleItem then
      return
    end
  elseif Item == self.SelectSuffixTitleItem then
    return
  end
  if Item.UI then
    ScreenPrint("------------\231\156\159\230\173\163\229\136\135\230\141\162\228\186\134 " .. (bIsPrefix and "\229\137\141\231\188\128  " or "\229\144\142\231\188\128  ") .. "\230\151\167\231\154\132Item " .. (self.SelectPrefixTitleItem and self.SelectPrefixTitleItem.Name or " \231\169\186 ") .. (self.SelectPrefixTitleItem and self.SelectPrefixTitleItem.UI and self.SelectPrefixTitleItem.UI.Text_Title:GetText() or " \231\169\186 ") .. " \230\150\176\231\154\132Item" .. Item.Name .. Item.UI.Text_Title:GetText())
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/roll_list_change", nil, nil)
  if bIsPrefix then
    self:CancelSelectTitle(self.SelectPrefixTitleItem)
    self.SelectPrefixTitleItem = Item
    self.SelectPrefixID = self.SelectPrefixTitleItem.TitleID
    self.SelectPrefixTitleItem.IsSelected = true
  else
    self:CancelSelectTitle(self.SelectSuffixTitleItem)
    self.SelectSuffixTitleItem = Item
    self.SelectSuffixID = self.SelectSuffixTitleItem.TitleID
    self.SelectSuffixTitleItem.IsSelected = true
  end
  if Item.UI then
    Item.UI.Text_Title:SetRenderOpacity(1)
  end
  self.FatherPage:OnTietleContentChange(self.SelectPrefixID, self.SelectSuffixID)
  if Item.IsNew then
    Item.UI:SetNotNew()
    local list
    if bIsPrefix then
      list = self.List_Title01
    else
      list = self.List_Title02
    end
    local GetDisplayedEntryWidgets = list:GetDisplayedEntryWidgets()
    for index, value in pairs(GetDisplayedEntryWidgets) do
      if value.Item and value.Item.TitleID == Item.TitleID then
        value:SetNotNew()
      end
    end
  end
end

function M:OnSelectTitleChange()
  self.SelectSuffixID = self.SelectSuffixTitleItem.TitleID
  self.SelectPrefixID = self.SelectPrefixTitleItem.TitleID
end

function M:GetCurrentSelectTitle()
  self.UsedPrefixTitle = self.SelectPrefixTitleItem
  self.UsedSuffixTitle = self.SelectSuffixTitleItem
  return self.SelectPrefixID, self.SelectSuffixID
end

function M:ItemOffset2SelectContent(currentOffset, IsPrefix)
  local SelectIdx = currentOffset + self.CenterOffset
  SelectIdx = math.floor(SelectIdx + 0.5)
  if IsPrefix then
    SelectIdx = SelectIdx % self.OriginalPreItemCount
    return self.List_Title01:GetItemAt(SelectIdx)
  else
    SelectIdx = SelectIdx % self.OriginalSuffixItemCount
    return self.List_Title02:GetItemAt(SelectIdx)
  end
end

function M:OnPrefixTitleMouseUp()
  self:SetToClosestItem(true)
end

function M:OnSuffixTitleMouseUp()
  self:SetToClosestItem(false)
end

function M:ScrollToItem(Item, IsPrefix)
  local List, OriginalItemCount
  if IsPrefix then
    List = self.List_Title01
    OriginalItemCount = self.OriginalPreItemCount
  else
    List = self.List_Title02
    OriginalItemCount = self.OriginalSuffixItemCount
  end
  local currentOffset = List:GetScrollOffset()
  if currentOffset < self.LoopStartIdx then
    if IsPrefix then
      currentOffset = self.OriginalPreItemCount + currentOffset
    else
      currentOffset = self.OriginalSuffixItemCount + currentOffset
    end
  end
  local CurrentIten
  if IsPrefix then
    CurrentIten = self.SelectPrefixTitleItem
  else
    CurrentIten = self.SelectSuffixTitleItem
  end
  local ScroolIndex
  ScreenPrint(CurrentIten and CurrentIten.RealIndex or self.LoopStartIdx .. "ssss" .. Item.RealIndex)
  ScroolIndex = math.floor(Item.RealIndex + self.CenterOffset)
  List:SetScrollOffset(ScroolIndex)
  DebugPrint("ScrollToItem" .. ScroolIndex .. "\231\155\174\229\137\141\229\129\143\231\167\187" .. List:GetScrollOffset() .. "\233\128\137\228\184\173item\231\154\132realidx")
end

function M:GetScrollIndexbyRealIdx(RealIdx, IsUp)
  if IsUp then
    return RealIdx - 3 + self.FullFillCount
  else
    return RealIdx + 3 + self.FullFillCount
  end
end

function M:SetToClosestItem(IsPrefix)
  local List, OriginalItemCount
  if IsPrefix then
    List = self.List_Title01
    OriginalItemCount = self.OriginalPreItemCount
  else
    List = self.List_Title02
    OriginalItemCount = self.OriginalSuffixItemCount
  end
  local currentOffset = List:GetScrollOffset()
  if OriginalItemCount < currentOffset then
    currentOffset = currentOffset - OriginalItemCount
  end
  ScreenPrint("-------------\229\174\154\228\189\141\229\136\176\230\156\128\232\191\145\233\161\185:currentOffset:" .. currentOffset)
  List:SetCurrentScrollOffset(currentOffset)
  local aim = math.floor(currentOffset + 0.5)
  aim = math.floor(aim + 0.5)
  List:SetScrollOffset(aim)
end

function M:EndScroll(bIsPrefix, EndCallBack)
  local List
  if bIsPrefix then
    List = self.List_Title01
  else
    List = self.List_Title02
  end
  local aim = math.floor(List:GetScrollOffset() + 0.5)
  List:ScrollIndexIntoView(aim)
  self:AddTimer(0.01, function()
    List:BP_CancelScrollIntoView()
    List:SetScrollOffset(aim)
  end)
  if EndCallBack then
    EndCallBack(self)
  end
end

function M:SetItemToMiddle(item, bIsPrefix)
  local CurrentItem
  if bIsPrefix then
    CurrentItem = self.SelectPrefixTitleItem
  else
    CurrentItem = self.SelectSuffixTitleItem
  end
  if item.RealIndex > (CurrentItem.RealIndex or self.LoopStartIdx) then
    self:ScrollDownToItem(CurrentItem, bIsPrefix)
  else
    self:ScrollUpToItem(CurrentItem, bIsPrefix)
  end
end

function M:RandomSelectTitle()
  local now = os.clock()
  local seed = os.time() * 1000 + math.floor(now * 1000)
  math.randomseed(seed)
  math.random()
  local randomIdx1 = math.random(1, #self.PrefixTitles)
  local randomItem1 = self.List_Title01:GetItemAt(randomIdx1 + self.FullFillCount)
  local randomIdx2 = math.random(1, #self.SuffixTitles)
  local randomItem2 = self.List_Title02:GetItemAt(randomIdx2 + self.FullFillCount)
  self:ScrollToItem(randomItem1, true)
  self:ScrollToItem(randomItem2, false)
end

function M:ScrollUp(IsPrefix)
  local List, OriginalItemCount
  if IsPrefix then
    OriginalItemCount = self.OriginalPreItemCount
    List = self.List_Title01
  else
    OriginalItemCount = self.OriginalSuffixItemCount
    List = self.List_Title02
  end
  local currentOffset = List:GetScrollOffset()
  local AimOffset = currentOffset - 1
  if AimOffset < self.LoopStartIdx then
    currentOffset = currentOffset + OriginalItemCount
    AimOffset = AimOffset + OriginalItemCount
    List:SetCurrentScrollOffset(currentOffset)
  end
  List:SetCurrentScrollOffset(currentOffset)
  AimOffset = math.floor(AimOffset + 0.5)
  List:SetScrollOffset(AimOffset)
end

function M:ScrollDown(IsPrefix)
  local List, originalItemCount
  if IsPrefix then
    List = self.List_Title01
    originalItemCount = self.OriginalPreItemCount
  else
    List = self.List_Title02
    originalItemCount = self.OriginalSuffixItemCount
  end
  local currentOffset = List:GetScrollOffset()
  if currentOffset > originalItemCount + 1 then
    currentOffset = currentOffset - originalItemCount
    List:SetCurrentScrollOffset(currentOffset)
  end
  local AimOffset = currentOffset + 1
  AimOffset = math.floor(AimOffset + 0.5)
  List:SetScrollOffset(AimOffset)
end

function M:OnGamePadUp()
end

function M:GamepadFocusLeft()
  if self.IsFocusPrefix == true then
    return
  end
  self.IsFocusPrefix = true
  self:PlayAnimation(self.GamePad_SelectL)
end

function M:GamepadFocusRight()
  if self.IsFocusPrefix == false then
    return
  end
  self.IsFocusPrefix = false
  self:PlayAnimation(self.GamePad_SelectR)
end

function M:IsFocusBeforeTitle()
  return self.IsFocusPrefix
end

function M:OnPreViewKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnPreviewGamePadDown(InKeyName)
  end
  return Unhandled
end

function M:OnPreviewGamePadDown(InKeyName)
  if InKeyName == Const.GamepadDPadLeft or InKeyName == Const.LeftStickLeft then
    self:GamepadFocusLeft()
    return true
  elseif InKeyName == Const.GamepadDPadRight or InKeyName == Const.LeftStickRight then
    self:GamepadFocusRight()
    return true
  elseif InKeyName == Const.GamepadDPadUp or InKeyName == Const.Gamepad_RightStick_Up then
    local IsPrefix = self:IsFocusBeforeTitle()
    self:ScrollUp(IsPrefix)
  elseif InKeyName == Const.GamepadDPadDown or InKeyName == Const.Gamepad_RightStick_Down then
    local IsPrefix = self:IsFocusBeforeTitle()
    self:ScrollDown(IsPrefix)
  end
  return Handled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    self.IsGamePad = false
  end
  IsEventHandled = false
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_DPad_Up" == InKeyName then
  elseif "Gamepad_DPad_Down" == InKeyName then
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    if self.FatherPage:IsCanChangeTitle() then
      self.FatherPage:OnComfirmBtnClick()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and self.FatherPage:IsRandomBtnCanClick() then
    self.FatherPage:OnRandomBtnClick()
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.LeftAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    self:OnAnalogAccumulate(DeltaOffset * self.AnalogControlSpeed)
  elseif InKeyName == UIConst.GamePadKey.LeftAnalogX then
    local DeltaOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    if DeltaOffset <= -1 then
      self:ClearnAnalogAccumulate()
      self:GamepadFocusLeft()
    elseif DeltaOffset >= 1 then
      self:ClearnAnalogAccumulate()
      self:GamepadFocusRight()
    end
  end
  return Unhandled
end

function M:OnAnalogSensitiveChange(Delta)
  if not self.IsInCD then
    if Delta > 0.7 then
      self:ScrollDown(self:IsFocusBeforeTitle())
    elseif Delta < -0.7 then
      self:ScrollUp(self:IsFocusBeforeTitle())
    end
    self.IsInCD = true
    self:AddTimer(self.AnalogControlCd or 0.1, function()
      self.IsInCD = false
    end, nil, nil, nil, true)
  else
    self:OnAnalogAccumulate(Delta)
  end
end

function M:OnAnalogAccumulate(Delta)
  self.AnalogControlProgress = self.AnalogControlProgress + Delta
  if self.AnalogControlProgress < -100 then
    self.AnalogControlProgress = 100 + self.AnalogControlProgress
    self:ScrollUp(self:IsFocusBeforeTitle())
  elseif self.AnalogControlProgress > 100 then
    self.AnalogControlProgress = -100 + self.AnalogControlProgress
    self:ScrollDown(self:IsFocusBeforeTitle())
  end
end

function M:ClearnAnalogAccumulate()
  self.AnalogControlProgress = 0
end

function M:InitGamepadView()
  if self.IsFocusPrefix then
    self:PlayAnimation(self.GamePad_SelectL)
  else
    self:PlayAnimation(self.GamePad_SelectR)
  end
  self.Panel_GamepadVX:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:InitKeyboardView()
  self.Panel_GamepadVX:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self:CleanTimer()
end

return M
