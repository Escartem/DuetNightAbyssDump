require("UnLua")
local NumberModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")
local WBP_Archive_Reward_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Archive_Reward_C:Construct()
  self.Super.Construct(self)
  self.CantGetAll = false
  self:Init()
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  ReddotManager.AddListener("ArchiveReward", self, self.RefreshBtnGetAll)
  self.Text_Progress:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Archive_Reward_C:Destruct()
  self.Super.Destruct(self)
  ReddotManager.RemoveListener("ArchiveReward", self)
  if self.CurFocusedRewardItem then
    self.CurFocusedRewardItem:StopHover()
    self.CurFocusedRewardItem = nil
  end
  self:ClearListenEvent()
  self.List_Tab:ClearListItems()
  self.List_Reward:ClearListItems()
end

function WBP_Archive_Reward_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Type = (...)
  local SelectIndex
  if self.Type then
    SelectIndex = self.Type2Index[self.Type]
  end
  SelectIndex = SelectIndex or 1
  self.List_Tab:ScrollIndexIntoView(SelectIndex - 1)
  self:AddTimer(0.01, function()
    self.List_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local Item = self.List_Tab:GetItemAt(SelectIndex - 1)
    self.Text_Progress:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if Item then
      self.List_Tab:BP_NavigateToItem(Item)
      Item.Entry:OnCellClicked()
    end
  end, false, 0, "SelectRewardTab", true)
end

function WBP_Archive_Reward_C:Init()
  self:InitNormalInfo()
  self:InitListTabInfo()
  self:InitBtnInfo()
  self.List_Reward:SetControlScrollbarInside(true)
  self.List_Tab:SetControlScrollbarInside(true)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_Reward_C:InitNormalInfo()
  self.ArchiveType2Name = {
    [1001] = "Character",
    [1002] = "Melee",
    [1003] = "Ranged",
    [1004] = "Resource",
    [1005] = "Read",
    [1006] = "Enemy"
  }
  self.Text_Title:SetText(GText("UI_ArchiveCollectionReward"))
  self.Btn_GetAll:SetText(GText("UI_Archive_CollectionClaimAll"))
end

function WBP_Archive_Reward_C:InitBtnInfo()
  self.Btn_GetAll:BindEventOnClicked(self, self.GetAllRewards)
  self.Btn_Close:BindEventOnClicked(self, self.OnClickClose)
  
  local function EmptyFunction()
  end
  
  self.Btn_Close:TryOverrideSoundFunc(EmptyFunction)
end

function WBP_Archive_Reward_C:InitListTabInfo()
  self.List_Tab.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self.List_Tab:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.List_Tab:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnUINavigation
  })
  self.List_Reward:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnUINavigation
  })
  local SortedArchiveInfo = {}
  self.Type2Index = {}
  for _, Data in pairs(DataMgr.ArchiveInfo) do
    table.insert(SortedArchiveInfo, Data)
  end
  table.sort(SortedArchiveInfo, function(a, b)
    return a.ArchiveType < b.ArchiveType
  end)
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.List_Tab:ClearListItems()
  for Index, ArchiveInfo in ipairs(SortedArchiveInfo) do
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self
    Obj.Index = Index
    Obj.Type = ArchiveInfo.ArchiveType
    Obj.Title = ArchiveInfo.ArchiveTitle
    Obj.Step = ArchiveInfo.ArchiveStep
    Obj.RewardId = ArchiveInfo.RewardId
    self.List_Tab:AddItem(Obj)
    self.Type2Index[ArchiveInfo.ArchiveType] = Index
  end
end

function WBP_Archive_Reward_C:RefreshListRewardInfo(Item)
  if self.SelectedContent then
    self.SelectedContent.Entry:UnSelected()
  end
  self.SelectedContent = Item.Content
  self.SelectedContent.Entry:Selected()
  self:RealRefreshListRewardInfo(self.SelectedContent.Type)
end

function WBP_Archive_Reward_C:RealRefreshListRewardInfo(ArchiveType)
  local Sum = NumberModel["Get" .. self.ArchiveType2Name[ArchiveType] .. "SumNumber"](NumberModel)
  self:AddListReward(ArchiveType, Sum)
  self:RefreshProgressInfo(ArchiveType, Sum)
  self:RefreshBtnGetAll()
end

function WBP_Archive_Reward_C:AddListReward(ArchiveType, SumNum)
  local ArchiveInfo = DataMgr.ArchiveInfo[ArchiveType]
  local Step = ArchiveInfo.ArchiveStep
  local Index = 1
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.List_Reward:ClearListItems()
  self.List_Reward:ScrollToTop()
  while SumNum >= Index * Step do
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self
    Obj.Index = Index
    Obj.Type = ArchiveInfo.ArchiveType
    Obj.Title = ArchiveInfo.ArchiveTitle
    Obj.Step = ArchiveInfo.ArchiveStep
    Obj.RewardId = ArchiveInfo.RewardId
    self.List_Reward:AddItem(Obj)
    Index = Index + 1
  end
end

function WBP_Archive_Reward_C:RefreshProgressInfo(ArchiveType, SumNum)
  self.CurrentNum = NumberModel:GetCurrentNumber(ArchiveType)
  self.SumNum = SumNum
  self.Text_Progress:SetText(string.format(GText("UI_Archive_CollectionProgress"), self.CurrentNum, self.SumNum))
end

function WBP_Archive_Reward_C:RefreshCurrentNum(ArchiveType)
  self.CurrentNum = NumberModel:GetCurrentNumber(ArchiveType)
  self.Text_Progress:SetText(string.format(GText("UI_Archive_CollectionProgress"), self.CurrentNum, self.SumNum))
end

function WBP_Archive_Reward_C:TryGetAllRewards()
  if self.Btn_GetAll:GetVisibility() ~= UIConst.VisibilityOp.Collapsed and not self.CantGetAll then
    self:GetAllRewards()
  end
end

function WBP_Archive_Reward_C:GetAllRewards()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      self:RefreshItemState()
      
      self:RefreshReddotInfo()
      if not ErrorCode:Check(Ret) then
        return
      end
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        self:SetFocus()
      end, self)
    end
    
    Avatar:GetAllArchiveReward(Callback, self.SelectedContent.Type)
  end
end

function WBP_Archive_Reward_C:RefreshItemState()
  local Items = self.List_Reward:GetDisplayedEntryWidgets()
  for i = 1, Items:Length() do
    local Item = Items:GetRef(i)
    Item:RefreshState()
    Item:RefreshRewardsList()
  end
end

function WBP_Archive_Reward_C:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if CacheDetail[self.SelectedContent.Type] then
    local Num = 0
    for _, _ in pairs(CacheDetail[self.SelectedContent.Type]) do
      Num = Num + 1
    end
    CacheDetail[self.SelectedContent.Type] = nil
    ReddotManager.DecreaseLeafNodeCount("ArchiveReward", Num)
  end
end

function WBP_Archive_Reward_C:RefreshBtnGetAll()
  if not self.SelectedContent then
    self.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if CacheDetail[self.SelectedContent.Type] then
    local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
    if CurInputDevice ~= ECommonInputType.Touch and CurInputDevice ~= ECommonInputType.MouseAndKeyboard then
      self.Btn_GetAll:SetVisibility(ESlateVisibility.HitTestInvisible)
    else
      self.Btn_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Archive_Reward_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      IsEventHandled = true
      self:EnterSelectMode()
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      IsEventHandled = true
      self:TryGetAllRewards()
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_Reward_C:OnReturnKeyDown()
  self:OnClickClose()
end

function WBP_Archive_Reward_C:OnClickClose()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:Close()
end

function WBP_Archive_Reward_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_Reward_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_Reward_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_Reward_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_Reward_C:InitGamepadView()
  self.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    self.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
  self.Btn_GetAll:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  local ItemViews = self.List_Reward:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitGamepadView()
  end
  self:LeaveSelectMode()
  self.Key_01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.IsInSelectState = false
  if self.SelectedContent and UIUtils.HasAnyFocus(self) then
    self.List_Tab:BP_NavigateToItem(self.SelectedContent)
  end
end

function WBP_Archive_Reward_C:InitKeyboardView()
  if self.CurFocusedRewardItem then
    self.CurFocusedRewardItem:StopHover(true)
    self.CurFocusedRewardItem = nil
  end
  self:LeaveSelectMode()
  self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.HitTestInvisible then
    self.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.Btn_GetAll:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
  local ItemViews = self.List_Reward:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitKeyboardView()
  end
end

function WBP_Archive_Reward_C:InitWidgetInfoInGamePad()
  self.Key_01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckReward")
  })
  self.Key_02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.Key_02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_03:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
  self.Btn_GetAll:SetDefaultGamePadImg("X")
end

function WBP_Archive_Reward_C:EnterOrLeaveSelectMode(Entry)
  if self.IsInSelectState then
    self:LeaveSelectMode(Entry)
  else
    self:EnterSelectMode(Entry)
  end
end

function WBP_Archive_Reward_C:EnterSelectMode(Entry)
  if self.IsInSelectState then
    return
  end
  Entry = Entry or self:NavigateToFirstDisplayedItem(self.List_Reward)
  self.Key_01:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  Entry:UpdateUIStyle(false)
  local Rewards = Entry.List_Reward:GetDisplayedEntryWidgets()
  local FirstReward = Rewards:GetRef(1)
  FirstReward:SetFocus()
  self.IsInSelectState = true
end

function WBP_Archive_Reward_C:LeaveSelectMode(Entry)
  if not self.IsInSelectState then
    return
  end
  if not Entry then
    local Items = self.List_Reward:GetDisplayedEntryWidgets()
    Entry = Items:GetRef(1)
  end
  self.IsInSelectState = false
  self.Key_01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_02:SetVisibility(ESlateVisibility.Collapsed)
  Entry:UpdateUIStyle(true)
  self.List_Reward:BP_NavigateToItem(Entry.Content)
end

function WBP_Archive_Reward_C:LeaveSelectModeOrClose(Entry)
  if not self.IsInSelectState then
    self:OnReturnKeyDown()
  else
    self:LeaveSelectMode(Entry)
  end
end

function WBP_Archive_Reward_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_Archive_Reward_C:ClickListItemWhenSelectItemChanged(Content)
  if Content and Content.Entry then
    Content.Entry:OnCellClicked()
  end
end

function WBP_Archive_Reward_C:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    if self.CurFocusedRewardItem then
      self.CurFocusedRewardItem:StopHover()
      self.CurFocusedRewardItem = nil
    end
    return self.SelectedContent.Entry
  elseif NavigationDirection == EUINavigation.Right then
    return self:NavigateToFirstDisplayedItem(self.List_Reward)
  end
end

function WBP_Archive_Reward_C:TryChangeCurFocusedRewardItem(RewardItem)
  if self.CurFocusedRewardItem then
    self.CurFocusedRewardItem:StopHover()
  end
  self.CurFocusedRewardItem = RewardItem
  self.CurFocusedRewardItem:BeginHover()
end

function WBP_Archive_Reward_C:NavigateToFirstDisplayedItem(List)
  local ItemUIs = List:GetDisplayedEntryWidgets()
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
      List:BP_NavigateToItem(TargetWidget.Content)
      return TargetWidget
    end
  end
  return List
end

function WBP_Archive_Reward_C:BP_GetDesiredFocusTarget()
  if self.SelectedContent then
    self.List_Tab:BP_NavigateToItem(self.SelectedContent)
    return self.SelectedContent.Entry
  else
    return self.List_Tab
  end
end

function WBP_Archive_Reward_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:UpdateUIStyle(false)
    self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
    self:UpdateUIStyle(true)
  end
end

function WBP_Archive_Reward_C:UpdateUIStyle(IsVisible)
  if IsVisible then
    self.CantGetAll = false
    self.Btn_GetAll:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.CantGetAll = true
    self.Btn_GetAll:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return WBP_Archive_Reward_C
