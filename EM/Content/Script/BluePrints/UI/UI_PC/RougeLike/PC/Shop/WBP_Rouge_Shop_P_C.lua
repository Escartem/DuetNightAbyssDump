require("UnLua")
local M = Class("BluePrints.UI.Shop.WBP_Shop_Main_Base_C")
M._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function M:Construct()
  M.Super.Construct(self)
  self.Btn_Bag.Text_Btn:SetText(GText("UI_RougeLike_Bag"))
  self.Btn_Bag.Btn_Click.OnClicked:Add(self, self.OpenRougeBag)
  self.DetailItem.Rouge_SuitSign:BindEventOnMenuOpenChanged(self, self.OnMenuOpenChanged)
  self.DetailItem.Parent = self
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "RougeShopOpenSound", nil)
end

function M:Destruct()
  self.Super.Destruct(self)
  self:HorizontalListViewResize_TearDown()
  self:ClearListenEvent()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:PlayAnimation(self.In)
  self.ShopId, self.Type = ...
  self.Text_RougeShop_Empry:SetText(GText("UI_Rougelike_NoShopItem"))
  self.HasPurchased = false
  self:RougeShopItemSelect()
  self:InitListenEvent()
  self:InitShop()
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnRougeShopItemSelect, self, self.RougeShopItemSelect)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  local PreviousInputDeviceType = self.CurInputDeviceType
  self.CurInputDeviceType = CurInputDevice
  if IsGamePad then
    if nil ~= PreviousInputDeviceType then
      if self.bFocusOnSuit then
        self:FocusOnSuitInfo()
      else
        self:FocusOnPanel()
      end
    end
    if self.Type == "Blessing" then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.DetailItem.Switch_Key:SetActiveWidgetIndex(1)
  else
    self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.DetailItem.Switch_Key:SetActiveWidgetIndex(0)
  end
end

function M:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetCanInteractiveTrigger(false)
end

function M:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetCanInteractiveTrigger(true)
end

function M:InitShop(MainTabIdx, SubTabIdx)
  local ShopType
  if self.Type == "Blessing" then
    self.List_BottomTab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    ShopType = DataMgr.RougeBlessingShop[1].MainName
  elseif self.Type == "Treasure" then
    self.List_BottomTab:SetVisibility(ESlateVisibility.Collapsed)
    ShopType = DataMgr.RougeTreasureShop[1].MainName
  end
  local OverridenTopResouces
  if type(self.GetOverrideTopResource) == "function" then
    OverridenTopResouces = self:GetOverrideTopResource()
  end
  self.Common_Tab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonLeft].KeyText
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonBottom].KeyText
          }
        },
        Desc = GText("UI_CTL_Explain")
      },
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
    },
    TitleName = GText(ShopType),
    OverridenTopResouces = OverridenTopResouces,
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  }, true)
  self:ChangeBottomGamePadInfo(self.bFocusOnDetails)
  self:UpdateShopDetail()
  self:InitTipsInfo()
end

function M:InitTipsInfo()
  if self.CurInputDeviceType == ECommonInputType.Touch then
    return
  end
  if self.Key_GamePad_Bottom then
    self.Key_GamePad_Bottom:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self.Btn_Bag.Key_Bag:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
  self.DetailItem.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
end

function M:UpdateShopDetail(MainTabId)
  local Type = self.Type
  self.ShopItemType = "Shop" .. Type
  local RarityName = Type .. "Rarity"
  local IdName = Type .. "Id"
  local DataName = "RougeLike" .. Type
  local ShopItemData = DataMgr[DataName]
  local RougeLikeManager = GWorld.RougeLikeManager
  if not RougeLikeManager then
    DebugPrint("ZDX RougeLikeManager is nil!")
    return
  end
  if not self.ShopId then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    DebugPrint("ZDX \228\188\160\229\133\165\231\154\132ShopId\228\184\186\231\169\186")
    return
  end
  local ShopItemList = RougeLikeManager.Shop:FindRef(self.ShopId)[self.ShopItemType]
  self.Discount = RougeLikeManager.ShopDiscount or 1
  local ShopDataList = {}
  local NotSoldOutList = {}
  local SoldOutList = {}
  for Id, Count in pairs(ShopItemList) do
    local ItemData = setmetatable({}, {
      __index = ShopItemData[Id]
    })
    if 0 == ShopItemList:FindRef(Id) then
      table.insert(SoldOutList, ItemData)
    else
      table.insert(NotSoldOutList, ItemData)
    end
  end
  
  local function SortFunc(a, b)
    local RarityA, RarityB = a[RarityName] or 0, b[RarityName] or 0
    if RarityA == RarityB then
      local IdA, IdB = a[IdName] or 0, b[IdName] or 0
      return IdA > IdB
    end
    return RarityA > RarityB
  end
  
  table.sort(SoldOutList, SortFunc)
  table.sort(NotSoldOutList, SortFunc)
  for _, ShopData in ipairs(NotSoldOutList) do
    table.insert(ShopDataList, {
      ItemId = ShopData[IdName],
      ItemType = Type,
      IsSoldOut = false
    })
  end
  for _, ShopData in ipairs(SoldOutList) do
    table.insert(ShopDataList, {
      ItemId = ShopData[IdName],
      ItemType = Type,
      IsSoldOut = true
    })
  end
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.TileList_Item:SetVisibility(ESlateVisibility.Visible)
  if 0 == #ShopDataList then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.TileList_Item:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.TileList_Item:ScrollIndexIntoView(0)
  self:StopAttrListFramingIn()
  self.TileList_Item:ClearListItems()
  self.ShopItemNum = #ShopDataList
  for i = 1, self.ShopItemNum do
    local Content = NewObject(self.ShopItemContentClass)
    Content.ShopId = self.ShopId
    Content.ItemId = ShopDataList[i].ItemId
    Content.ShopItemType = ShopDataList[i].ItemType
    Content.IsSoldOut = ShopDataList[i].IsSoldOut
    Content.Discount = self.Discount
    Content.Parent = self
    if 1 == i then
      Content.IsSelect = true
    else
      Content.IsSelect = false
    end
    self.TileList_Item:AddItem(Content)
  end
  if "Blessing" == Type then
    local DefaultSelectContent = ShopDataList[1]
    self.SelectGroupId = DataMgr.RougeLikeBlessing[DefaultSelectContent.ItemId].BlessingGroup
    local IsCanLevelUp = RougeUtils:GetIsCanLevelUp(DefaultSelectContent.ItemId)
    self.IsNeedAddCount = not IsCanLevelUp and not DefaultSelectContent.IsSoldOut
    self.SuitMap = {}
    self:UpdateGroupInfo()
  end
  local XAnchor = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and 1 or 0
  self:HorizontalListViewResize_SetUp(self.Group_Item, self.TileList_Item, 0)
  self:RemoveTimer("AddEmptyContent", true)
  self:AddTimer(0.01, function()
    local XCount, YCount = UIUtils.GetTileViewContentMaxCount(self.TileList_Item, "XY")
    local EmptyItemNum
    if self.ShopItemNum - XCount * YCount <= 0 then
      EmptyItemNum = XCount * YCount - self.ShopItemNum
    else
      EmptyItemNum = XCount - self.ShopItemNum % XCount
    end
    for i = 1, EmptyItemNum do
      local Content = NewObject(self.ShopItemContentClass)
      Content.ItemId = nil
      self.TileList_Item:AddItem(Content)
    end
    self.TileList_Item:RegenerateAllEntries()
    self:AddTimer(0.01, function()
      self:PlayAttrListFramingIn()
      self:FocusOnPanel(true)
    end)
    self:RemoveTimer("AddEmptyContent", true)
  end, false, 0, "AddEmptyContent")
end

function M:PlayAttrListFramingIn()
  self._ListAttrAnimTimerKeys = UIUtils.PlayListViewFramingInAnimation(self, self.TileList_Item, {
    Interval = self.IntervalTime,
    Visibility = UIConst.VisibilityOp.Visible,
    bInteractableInAnim = false
  })
end

function M:StopAttrListFramingIn()
  UIUtils.StopListViewFramingInAnimation(self.TileList_Item, {
    UIState = self,
    TimerKeys = self._ListAttrAnimTimerKeys
  })
end

function M:RougeShopItemSelect(Content, ItemType, ItemId, ShopId, RealPrices, IsSoldOut, IsCanLevelUp)
  self.SelectTreasureId = nil
  if not Content then
    self.DetailItem:SetVisibility(ESlateVisibility.Collapsed)
    return
  else
    self.DetailItem:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.DetailItem:UpdateDetails(ItemType, ItemId, ShopId, RealPrices, IsSoldOut, IsCanLevelUp)
  if self.SelectContent and self.SelectContent ~= Content then
    local EventSoundPath = "event:/ui/roguelike/choose_point_click"
    AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
    self.SelectContent.SelfWidget:SetUnSelect()
    if "Blessing" == ItemType then
      self.IsNeedAddCount = not IsCanLevelUp and not IsSoldOut
      self.SelectGroupId = DataMgr.RougeLikeBlessing[ItemId].BlessingGroup
      local GroupId = DataMgr.RougeLikeBlessing[self.SelectContent.ItemId].BlessingGroup
      if self.SuitMap[GroupId].SelfWidget then
        self.SuitMap[GroupId].SelfWidget:SetSuitSelect(false)
      end
    end
  end
  self.SelectContent = Content
  if "Blessing" == ItemType then
    local GroupId = DataMgr.RougeLikeBlessing[self.SelectContent.ItemId].BlessingGroup
    if self.SuitMap[GroupId].SelfWidget then
      self.SuitMap[GroupId].SelfWidget:SetSuitSelect(true)
    end
  else
    self.SelectTreasureId = ItemId
  end
  self:ChangeBottomGamePadInfo(false)
end

function M:UpdateGroupInfo()
  self.List_BottomTab:ClearListItems()
  for _, v in pairs(DataMgr.BlessingGroup) do
    local Content = NewObject(self.GroupInfoContentClass)
    self.SuitMap[v.GroupId] = Content
    Content.GroupId = v.GroupId
    Content.Parent = self
    Content.FocusChanged = self.FocusChanged
    self.List_BottomTab:AddItem(Content)
  end
end

function M:OpenRougeBag()
  UIManager(self):LoadUINew("RougeBag")
  local EventSoundPath = "event:/ui/roguelike/btn_black_small_click"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
end

function M:OnFocusLost(MyGeometry, InFocusEvent)
  self.bFocusOnDetails = false
  self:ChangeBottomGamePadInfo(false)
end

function M:OnReturnKeyDown()
  self:CloseSelf()
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    AudioManager(self):SetEventSoundParam(self, "RougeShopOpenSound", {ToEnd = 1})
    self:Close()
  end
end

function M:Close()
  if self.HasPurchased then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get_Phone")
    else
      EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get")
    end
  end
  self.Super.Close(self)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_FaceButton_Bottom" == InKeyName then
    if self.bFocusOnDetails then
      self.DetailItem:OnCheckDetails()
    else
      self.DetailItem:RougePurchase()
    end
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_KeyEventOnGamePad(InKeyName)
  else
    IsEventHandled = self:Handle_KeyEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = false
  if "Escape" == InKeyName then
    IsEventHandled = true
    self:CloseSelf()
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonRight then
    IsEventHandled = true
    if self.bFocusOnSuit then
      self:FocusOnPanel()
    elseif self.bFocusOnDetails then
      self.TileList_Item:SetFocus()
    else
      self:CloseSelf()
    end
  elseif InKeyName == Const.GamepadLeftThumbstick then
    IsEventHandled = true
    if not self.bFocusOnSuit then
      self:FocusOnSuitInfo()
    end
    if self.SelectTreasureId then
      IsEventHandled = true
      self.DetailItem.Rouge_SuitSign:OnGamePadDown(InKeyName)
    end
  elseif InKeyName == Const.GamepadSpecialRight then
    IsEventHandled = true
    self:OpenRougeBag()
  elseif InKeyName == Const.GamepadRightThumbstick then
    IsEventHandled = true
    self.Common_Tab:Handle_KeyEventOnGamePad(InKeyName)
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    self.DetailItem.Btn_DetailDesc:SetFocus()
  end
  if self.DetailItem.Btn_DetailDesc:HasAnyUserFocus() or self.DetailItem.Rouge_SuitSign:HasAnyUserFocus() or self.DetailItem.Key_SuitSign:HasAnyUserFocus() then
    self.bFocusOnDetails = true
    self:ChangeBottomGamePadInfo(true)
  else
    self.bFocusOnDetails = false
    self:ChangeBottomGamePadInfo(false)
  end
  return IsEventHandled
end

function M:ChangeBottomGamePadInfo(bFoucusOnDetails)
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if CurInputDeviceType == ECommonInputType.Gamepad then
    if not bFoucusOnDetails then
      self.Common_Tab:UpdateSingleBottomKeyInfo(1, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonLeft].KeyText
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      })
      self.Common_Tab:UpdateSingleBottomKeyInfo(2, {})
    else
      self.Common_Tab:UpdateSingleBottomKeyInfo(1, {})
      self.Common_Tab:UpdateSingleBottomKeyInfo(2, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonBottom].KeyText
          }
        },
        Desc = GText("UI_CTL_Explain")
      })
    end
  else
    self.Common_Tab:UpdateSingleBottomKeyInfo(1, {})
    self.Common_Tab:UpdateSingleBottomKeyInfo(2, {})
  end
end

function M:FocusOnPanel(bFirstOpen)
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  local SelectedIndex = 0
  if not bFirstOpen then
    SelectedIndex = self.TileList_Item:GetIndexForItem(self.SelectContent)
  end
  self.TileList_Item:SetSelectedIndex(SelectedIndex)
  self.TileList_Item:SetFocus()
end

function M:FocusOnSuitInfo()
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  if self.SelectGroupId then
    self.List_BottomTab:NavigateToIndex(self.SelectGroupId - 1)
  end
end

function M:FocusChanged(bFocusOnSuit)
  self.bFocusOnSuit = bFocusOnSuit
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if bFocusOnSuit then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:DetailItemOnFocus(bFocus)
  self.bFocusOnDetails = bFocus
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:ChangeBottomGamePadInfo(self.bFocusOnDetails)
  end
end

function M:SetButtomGamePadTipVisibility(Visibility)
  if self.CurInputDeviceType == ECommonInputType.Touch then
    return
  end
  if self.Key_GamePad_Bottom then
    self.Key_GamePad_Bottom:SetVisibility(Visibility)
  end
end

function M:OnMenuOpenChanged(bOpen)
  if not bOpen then
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.DetailItem:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Common_Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(false)
      self.Btn_Bag.Key_Bag:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.TileList_Item:SetFocus()
  else
    self.Common_Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(true)
    self.Btn_Bag.Key_Bag:SetVisibility(ESlateVisibility.Collapsed)
    self.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

AssembleComponents(M)
return M
