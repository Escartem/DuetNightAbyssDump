require("UnLua")
local NumberModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")
local WBP_Rouge_Archive_Reward_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_Archive_Reward_C:Construct()
  self.Super.Construct(self)
  self:Init()
  if not ReddotManager.GetTreeNode("RougeArchiveReward") then
    ReddotManager.AddNode("RougeArchiveReward")
  end
  ReddotManager.AddListener("RougeArchiveReward", self, self.RefreshBtnGetAll)
  self.Text_Progress:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Rouge_Archive_Reward_C:Destruct()
  self.Super.Destruct(self)
  ReddotManager.RemoveListener("RougeArchiveReward", self)
  self:ClearListenEvent()
  self.List_Tab:ClearListItems()
  self.List_Reward:ClearListItems()
end

function WBP_Rouge_Archive_Reward_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Type, self.DataModel = ...
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
      Item.Entry:OnCellClicked()
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(Item.Entry)
    end
  end, false, 0, "SelectRewardTab", true)
  self:PlayAnimation(self.In)
end

function WBP_Rouge_Archive_Reward_C:Init()
  if not self.DataModel then
    self.DataModel = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.Rouge_Archive_DataModel")
    self.DataModel:InitData(GWorld:GetAvatar())
  end
  self:InitNormalInfo()
  self:InitListTabInfo()
  self:InitBtnInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Rouge_Archive_Reward_C:InitNormalInfo()
  self.Text_Title:SetText(GText("UI_ArchiveCollectionReward"))
  self.Btn_GetAll:SetText(GText("UI_Archive_CollectionClaimAll"))
end

function WBP_Rouge_Archive_Reward_C:InitBtnInfo()
  self.Btn_GetAll:BindEventOnClicked(self, self.GetAllRewards)
  self.Btn_Close:BindEventOnClicked(self, self.OnClickClose)
  self.Btn_Close.AudioEventPath = "event:/ui/common/click_btn_return"
end

function WBP_Rouge_Archive_Reward_C:InitListTabInfo()
  self.List_Tab.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self.List_Tab:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnUINavigation
  })
  self.List_Tab:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.List_Reward:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnUINavigation
  })
  self.List_Reward:SetControlScrollbarInside(true)
  local SortedArchiveInfo = {}
  self.Type2Index = {}
  for _, Data in pairs(DataMgr.RLArchiveInfo) do
    table.insert(SortedArchiveInfo, Data)
  end
  table.sort(SortedArchiveInfo, function(a, b)
    return a.RLArchiveType < b.RLArchiveType
  end)
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.List_Tab:ClearListItems()
  for Index, ArchiveInfo in ipairs(SortedArchiveInfo) do
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self
    Obj.Index = Index
    Obj.Type = ArchiveInfo.RLArchiveType
    Obj.Title = ArchiveInfo.RLArchiveTitle
    Obj.Step = ArchiveInfo.RLArchiveStep
    Obj.RewardId = ArchiveInfo.RewardId
    self.List_Tab:AddItem(Obj)
    self.Type2Index[ArchiveInfo.RLArchiveType] = Index
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshListRewardInfo(Item)
  if self.SelectedContent then
    self.SelectedContent.Entry:UnSelected()
  end
  self.SelectedContent = Item.Content
  self.SelectedContent.Entry:Selected()
  self:RealRefreshListRewardInfo(self.SelectedContent.Type)
end

function WBP_Rouge_Archive_Reward_C:RealRefreshListRewardInfo(ArchiveType)
  local Sum = self.DataModel:GetTotalItemNum(ArchiveType)
  self:AddListReward(ArchiveType, Sum)
  self:RefreshProgressInfo(ArchiveType, Sum)
  self:RefreshBtnGetAll()
end

function WBP_Rouge_Archive_Reward_C:AddListReward(ArchiveType, SumNum)
  local ArchiveInfo = DataMgr.RLArchiveInfo[ArchiveType]
  local Index = 1
  local Step = ArchiveInfo.RLArchiveStep
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.List_Reward:ClearListItems()
  while SumNum >= Index * Step do
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self
    Obj.Index = Index
    Obj.Type = ArchiveInfo.RLArchiveType
    Obj.Title = ArchiveInfo.RLArchiveTitle
    Obj.Step = ArchiveInfo.RLArchiveStep
    Obj.RewardId = ArchiveInfo.RewardId
    self.List_Reward:AddItem(Obj)
    Index = Index + 1
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshProgressInfo(ArchiveType, SumNum)
  self.CurrentNum = self.DataModel:GetUnlockedItemNum(ArchiveType)
  self.SumNum = SumNum
  self.Text_Progress:SetText(string.format(GText("UI_Archive_CollectionProgress"), self.CurrentNum, self.SumNum))
end

function WBP_Rouge_Archive_Reward_C:RefreshCurrentNum(ArchiveType)
  self.CurrentNum = self.DataModel:GetUnlockedItemNum(ArchiveType)
  self.Text_Progress:SetText(string.format(GText("UI_Archive_CollectionProgress"), self.CurrentNum, self.SumNum))
end

function WBP_Rouge_Archive_Reward_C:TryGetAllRewards()
  if self.Btn_GetAll:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    self:GetAllRewards()
  end
end

function WBP_Rouge_Archive_Reward_C:GetAllRewards()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Errorcode, Rewards)
      self:RefreshItemState()
      
      self:RefreshReddotInfo()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        self:SetFocus()
      end, self)
    end
    
    Avatar:GetRougeLikeManualReward(Callback, self.SelectedContent.Type, -1)
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshItemState()
  local Items = self.List_Reward:GetDisplayedEntryWidgets()
  for i = 1, Items:Length() do
    local Item = Items:GetRef(i)
    Item:RefreshState()
    Item:RefreshRewardsList()
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
  if CacheDetail[self.SelectedContent.Type] then
    local Num = 0
    for _, _ in pairs(CacheDetail[self.SelectedContent.Type]) do
      Num = Num + 1
    end
    CacheDetail[self.SelectedContent.Type] = nil
    ReddotManager.DecreaseLeafNodeCount("RougeArchiveReward", Num)
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshBtnGetAll()
  if not self.SelectedContent then
    self.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
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

function WBP_Rouge_Archive_Reward_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Left" == InKeyName then
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

function WBP_Rouge_Archive_Reward_C:OnReturnKeyDown()
  self:OnClickClose()
end

function WBP_Rouge_Archive_Reward_C:OnClickClose()
  self:Close()
end

function WBP_Rouge_Archive_Reward_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Archive_Reward_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Archive_Reward_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_Archive_Reward_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_Archive_Reward_C:InitGamepadView()
  self.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    self.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  local ItemViews = self.List_Reward:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitGamepadView()
  end
  self.Key_01:SetVisibility(ESlateVisibility.Collapsed)
  self.IsInSelectState = false
  self.Btn_GetAll:SetGamePadIconVisible(true)
  if self.SelectedContent and UIUtils.HasAnyFocus(self) then
    self.List_Tab:BP_NavigateToItem(self.SelectedContent)
  end
end

function WBP_Rouge_Archive_Reward_C:InitKeyboardView()
  self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.HitTestInvisible then
    self.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
  local ItemViews = self.List_Reward:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitKeyboardView()
  end
end

function WBP_Rouge_Archive_Reward_C:InitWidgetInfoInGamePad()
  self.Key_02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.Key_02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key_03:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
  self.Btn_GetAll:SetDefaultGamePadImg("X")
end

function WBP_Rouge_Archive_Reward_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_Rouge_Archive_Reward_C:ClickListItemWhenSelectItemChanged(Content)
  if Content and Content.Entry then
    Content.Entry:OnCellClicked()
  end
end

function WBP_Rouge_Archive_Reward_C:OnUINavigation(NavigationDirection)
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

function WBP_Rouge_Archive_Reward_C:TryChangeCurFocusedRewardItem(RewardItem)
  if self.CurFocusedRewardItem then
    self.CurFocusedRewardItem:StopHover()
  end
  self.CurFocusedRewardItem = RewardItem
  self.CurFocusedRewardItem:BeginHover()
end

function WBP_Rouge_Archive_Reward_C:NavigateToFirstDisplayedItem(List)
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

function WBP_Rouge_Archive_Reward_C:OnMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self:UpdateUIStyle(false)
      self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
      self:UpdateUIStyle(true)
    end
  end
end

function WBP_Rouge_Archive_Reward_C:UpdateUIStyle(IsVisible)
  if IsVisible then
    self.CantGetAll = false
  else
    self.CantGetAll = true
  end
end

function WBP_Rouge_Archive_Reward_C:BP_GetDesiredFocusTarget()
  if self.SelectedContent then
    self.List_Tab:BP_NavigateToItem(self.SelectedContent)
    return self.SelectedContent.Entry
  else
    return self.List_Tab
  end
end

return WBP_Rouge_Archive_Reward_C
