require("UnLua")
local WBP_Forging_Compendium_C = Class("BluePrints.UI.BP_UIState_C")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
WBP_Forging_Compendium_C._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}
local CompendiumState = {NormalPage = 1, FocusSort = 2}

function WBP_Forging_Compendium_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local PrevSelectedTab = (...) or 1
  self.KeyboardKeyConfig = {
    [ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc] = {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          Owner = self,
          ClickCallback = self.OnClose
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.GamepadKeyCofig = {
    [ForgeConst.BottomKeyTypes.BottomKey_Back] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_Confirm] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_ShowItem] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.DPadLeft,
          Owner = self
        }
      },
      Desc = GText("UI_Controller_CheckItems")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_ShowDetails] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
          Owner = self
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_SetTarget] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Forging_Set")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_UnSetTarget] = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Forging_Unset")
    }
  }
  self.ControllerFSM = ControllerFSM.New(self, {
    [CompendiumState.NormalPage] = {
      OnEnter = self.OnEnterState_NormalPage
    },
    [CompendiumState.FocusSort] = {
      OnEnter = self.OnEnterState_FocusSort,
      OnLeave = self.OnLeaveState_FocusSort
    }
  })
  self.IsNeedSearchInStack = true
  self.Sort:Init(self, {
    GText("UI_Select_Kind"),
    GText("UI_Select_Unique")
  }, CommonConst.DESC, {
    OnGetBackFocusWidget = function()
      self.ControllerFSM:Enter(CompendiumState.NormalPage)
      return self.List_Item
    end
  })
  self.Sort:BindEventOnSelectionsChanged(self, self.OnSortMethodChanged)
  self.Sort:BindEventOnSortTypeChanged(self, self.OnSortMethodChanged)
  self:InitKeySetting()
  self:InitTab(PrevSelectedTab)
  self.List_Item:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  self.List_Item:SetControlScrollbarInside(true)
  self.Btn_Mask.OnClicked:Add(self, function(self)
    self:ShowItemDetailsPanel(false)
  end)
  self:ShowItemDetailsPanel(false)
  self:RefreshOpInfoByInputDevice()
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ForgeCompendiumIn", nil)
end

function WBP_Forging_Compendium_C:HandleGamepadRefocus()
  if UIUtils.IsGamepadInput() then
    self.ControllerFSM:Enter(CompendiumState.NormalPage)
    if self:HasAnyFocus() then
      self.List_Item:NavigateToIndex(0)
      self.List_Item:SetFocus()
    end
  end
end

function WBP_Forging_Compendium_C:OnEnterState_NormalPage()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_Forging_Compendium_C:OnEnterState_FocusSort()
  self.Sort:SetFocus()
  self.Sort:SetControllerKeyHidden(true)
  self.ItemDetails.Btn01_Mod:OverrideGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  self.ItemDetails.Btn01_Mod:SetGamepadIconVisibility(false)
  self.ItemDetails.Btn02_Mod:OverrideGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  self.ItemDetails.Btn02_Mod:SetGamepadIconVisibility(false)
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Confirm,
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_Forging_Compendium_C:OnLeaveState_FocusSort()
  self.ItemDetails.Btn01_Mod:OverrideGamePadVisibility(nil)
  self.ItemDetails.Btn01_Mod:SetGamepadIconVisibility(true)
  self.ItemDetails.Btn02_Mod:OverrideGamePadVisibility(nil)
  self.ItemDetails.Btn02_Mod:SetGamepadIconVisibility(true)
  self.Sort:SetControllerKeyHidden(false)
end

function WBP_Forging_Compendium_C:InitKeySetting()
  self.SwitchTab_LeftKey = "Q"
  self.SwitchTab_RightKey = "E"
  self.EscapeKey = "Escape"
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.EscapeKey] = self.OnReturnKeyDown
  self.KeyDownEvent[self.SwitchTab_LeftKey] = function()
    self.Tab:TabToLeft()
  end
  self.KeyDownEvent[self.SwitchTab_RightKey] = function()
    self.Tab:TabToRight()
  end
end

function WBP_Forging_Compendium_C:OnSortMethodChanged()
  self:UpdateCompendiumContent()
end

function WBP_Forging_Compendium_C:InitTab(PrevSelectedTab)
  local AllTabInfo = {}
  self.TabIdx2TabType = {}
  local PrevSelectedTabIdx
  for TabIdx, ForgeTabId in ipairs(ForgeConst.CompendiumTabType) do
    local TabData = DataMgr.ForgeTab[ForgeTabId]
    self.TabIdx2TabType[TabIdx] = TabData.ProductType
    table.insert(AllTabInfo, {
      Text = GText(TabData.TabName),
      TabId = TabIdx,
      IconPath = TabData.Icon
    })
    if TabData.ProductType == PrevSelectedTab then
      PrevSelectedTabIdx = TabIdx
    end
  end
  local TabConfigData = {
    TitleName = GText("UI_Forging_Archive"),
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "Text",
    Tabs = AllTabInfo,
    DynamicNode = {"Back", "BottomKey"},
    BackCallback = self.OnClose,
    BottomKeyInfo = {},
    OwnerPanel = self
  }
  self.Tab:Init(TabConfigData)
  self.Tab:BindEventOnTabSelected(self, self.OnTabItemSelected)
  self.Tab:SelectTab(PrevSelectedTabIdx or 1)
  self.Tab:PlayInAnim()
  self:BindReddotTreeEvents()
end

function WBP_Forging_Compendium_C:BindReddotTreeEvents()
  for TabIdx, TabType in pairs(self.TabIdx2TabType) do
    ReddotManager.AddListener(ForgeConst.NewdotNodeName[TabType], self, function()
      self:UpdateTabReddot(TabIdx)
    end)
  end
end

function WBP_Forging_Compendium_C:UpdateTabReddot(TabIdx)
  local TabType = self.TabIdx2TabType[TabIdx]
  local NewdotNode = ReddotManager.GetTreeNode(ForgeConst.NewdotNodeName[TabType])
  local ShowNewReddot = NewdotNode.Count > 0
  self.Tab:ShowTabRedDot(TabIdx, ShowNewReddot, false)
end

function WBP_Forging_Compendium_C:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if UIUtils.IsGamepadInput() then
    self:InitGamepadView()
    self:HandleGamepadRefocus()
  elseif UIUtils.IsKeyboardInput() then
    self:InitKeyboardView()
  end
end

function WBP_Forging_Compendium_C:InitKeyboardView()
  self:UpdateKeyboardBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc
  })
end

function WBP_Forging_Compendium_C:InitGamepadView()
end

function WBP_Forging_Compendium_C:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  elseif self.KeyDownEvent[InKeyName] then
    self.KeyDownEvent[InKeyName](self)
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_Forging_Compendium_C:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  local CurrentState = self.ControllerFSM:Current()
  if CurrentState == CompendiumState.NormalPage then
    if InKeyName == Const.GamepadLeftThumbstick then
      self.ControllerFSM:Enter(CompendiumState.FocusSort)
      IsEventHandled = true
    elseif InKeyName == Const.GamepadFaceButtonUp then
      self:ShowDraftPath(self.CurSelectedContent.Id)
      IsEventHandled = true
    end
  end
  IsEventHandled = self.Tab:Handle_KeyEventOnGamePad(InKeyName)
  return IsEventHandled
end

function WBP_Forging_Compendium_C:OnTabItemSelected(TabWidget)
  self.TabIndex = TabWidget.Idx
  local TabType = self.TabIdx2TabType[self.TabIndex]
  if not TabType then
    DebugPrint(LogTag.Error, "\230\137\190\228\184\141\229\136\176TabIndex\229\175\185\229\186\148\231\154\132TabType! TabIndex = ", self.TabIndex)
    return
  end
  self:UpdateCompendiumContent(TabType)
  self:ShowItemDetailsPanel(false)
  if UIUtils.IsGamepadInput() then
    self.ControllerFSM:Enter(CompendiumState.NormalPage)
    self:ShowItemDetailsPanel(true)
    self:AddTimer(0.1, function()
      self.List_Item:NavigateToIndex(0)
      self.List_Item:SetFocus()
    end)
  else
    self.List_Item:ScrollIndexIntoView(0)
  end
end

function WBP_Forging_Compendium_C:UpdateCompendiumContent(TabType)
  local TabType = self.TabIdx2TabType[self.TabIndex]
  local FiltedDrafts = ForgeModel:GetCompendiumDatasByFilter(TabType)
  local CurSortBy, SortType = self.Sort:GetSortInfos()
  local SortedFiltedDrafts = ForgeModel:SortCompendiumDatas(FiltedDrafts, TabType, CurSortBy, SortType)
  self.List_Item:ClearListItems()
  self.CurSelectedContent = nil
  for Index, Data in ipairs(SortedFiltedDrafts) do
    local Content = ForgeModel:ConstructForgeCompendiumItemContent(NewObject(UIUtils.GetCommonItemContentClass()), Data)
    Content.OnMouseButtonUpEvent = {
      Obj = self,
      Callback = self.OnArchiveItemSelected,
      Params = {Content}
    }
    Content.OnFocusReceivedEvent = {
      Obj = self,
      Callback = self.OnArchiveItemFocusReceived,
      Params = {Content}
    }
    Content.SoundItemType = "Draft"
    Content.IsHold = not ForgeModel:IsDraftNotSeen(Content.Id)
    if UIUtils.IsGamepadInput() and 1 == Index then
      Content.IsSelect = true
      self:SelectDraftItem(Content)
    end
    self.List_Item:AddItem(Content)
  end
  self.List_Item:RequestPlayEntriesAnim()
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.IsEmpty = true
    return Obj
  end)
  self:HorizontalListViewResize_SetUp(self.Panel_Content, self.List_Item, 0)
  self.List_Item:RequestFillEmptyContent()
end

function WBP_Forging_Compendium_C:SelectDraftItem(Content)
  if self.CurSelectedContent == Content then
    return
  end
  self:ShowItemDetailsPanel(true)
  local ItemDetailParam = {}
  ItemDetailParam.ItemId = Content.Id
  ItemDetailParam.ItemType = "Draft"
  ItemDetailParam.bHideGamePad = true
  self.ItemDetails:PlayAnimation(self.ItemDetails.Change)
  self.ItemDetails:RefreshItemInfo(ItemDetailParam, true)
  self.ItemDetails:InitButtonEvent({
    ButtonClickCallBack = function()
      self:ShowDraftPath(Content.Id)
    end,
    ButtonClickText = GText("UI_FORGING_PATH")
  })
  self.ItemDetails.Line:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.CurSelectedContent ~= Content then
    local CurWidget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, self.List_Item:GetIndexForItem(Content))
    if CurWidget then
      CurWidget:SetSelected(true)
    end
    Content.IsSelect = true
    if self.CurSelectedContent then
      local PrevWidget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, self.List_Item:GetIndexForItem(self.CurSelectedContent))
      if PrevWidget then
        PrevWidget:SetSelected(false)
      end
      self.CurSelectedContent.IsSelect = false
    end
    self.List_Item:BP_ClearSelection()
    self.List_Item:BP_SetItemSelection(Content, true)
    self.CurSelectedContent = Content
  end
  if Content.IsNew then
    Content.IsNew = false
    local CurWidget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, self.List_Item:GetIndexForItem(Content))
    if CurWidget then
      CurWidget:SetNew(false)
    end
    ForgeModel:MarkDraftAsSeen(Content.Id)
  end
end

function WBP_Forging_Compendium_C:OnArchiveItemSelected(ItemContent)
  self:SelectDraftItem(ItemContent)
end

function WBP_Forging_Compendium_C:OnArchiveItemFocusReceived(ItemContent)
  if UIUtils.IsGamepadInput() then
    self:SelectDraftItem(ItemContent)
  end
end

function WBP_Forging_Compendium_C:ShowDraftPath(DraftId)
  self.PathWidget = UIManager(self):LoadUINew("ForgePathView", DraftId)
end

function WBP_Forging_Compendium_C:UpdateKeyboardBottomKeyInfo(KeyTypeList)
  local KeyInfo = {}
  for _, Value in ipairs(KeyTypeList) do
    table.insert(KeyInfo, self.KeyboardKeyConfig[Value])
  end
  self.Tab:UpdateBottomKeyInfo(KeyInfo)
end

function WBP_Forging_Compendium_C:UpdateGamepadBottomKeyInfo(KeyInfoTypeList)
  local KeyInfo = {}
  for Index, Value in ipairs(KeyInfoTypeList) do
    table.insert(KeyInfo, self.GamepadKeyCofig[Value])
  end
  self.Tab:UpdateBottomKeyInfo(KeyInfo)
end

function WBP_Forging_Compendium_C:ShowItemDetailsPanel(bIsShow)
  if bIsShow then
    self.ItemDetails:SetVisibility(UE4.ESlateVisibility.Visible)
  elseif not bIsShow then
    self.ItemDetails:SetVisibility(UE4.ESlateVisibility.Hidden)
    if self.CurSelectedContent then
      local PrevWidget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, self.List_Item:GetIndexForItem(self.CurSelectedContent))
      if PrevWidget then
        PrevWidget:SetSelected(false)
      end
      self.CurSelectedContent.IsSelect = false
    end
    self.CurSelectedContent = nil
  end
end

function WBP_Forging_Compendium_C:OnClose()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self.IsClosing then
    return
  end
  self.IsClosing = true
  self:PlayAnimation(self.Out)
  ForgeModel:ClearNewRedDots()
  AudioManager(self):SetEventSoundParam(self, "ForgeCompendiumIn", {ToEnd = 1})
  for _, NodeName in pairs(ForgeConst.NewdotNodeName) do
    ReddotManager.RemoveListener(NodeName, self)
  end
end

function WBP_Forging_Compendium_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

function WBP_Forging_Compendium_C:OnReturnKeyDown()
  self:OnClose()
end

function WBP_Forging_Compendium_C:Destruct()
  self.Super.Destruct(self)
  self:HorizontalListViewResize_TearDown()
end

AssembleComponents(WBP_Forging_Compendium_C)
return WBP_Forging_Compendium_C
