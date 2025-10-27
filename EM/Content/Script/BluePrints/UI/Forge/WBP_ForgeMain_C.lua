require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local CommonConst = require("CommonConst")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local UIUtils = require("Utils.UIUtils")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
local MAX_ITEM_PER_PANEL = 8
local ForgeNPCId = 900001
local ForgeNPCRegionId = 910001
local WBP_ForgeMain_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ForgeMain_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_ForgeMain_C:OnLoaded(...)
  self.KeyboardKeyConfig = {
    [ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Space] = {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Space",
          Owner = self,
          ClickCallback = self.TryBatchComplete
        }
      },
      Desc = GText("UI_Mail_Recieveall")
    },
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
          ImgShortPath = UIConst.GamePadImgKey.SpecialLeft,
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
    [ForgeConst.ControllerFSMStates.NormalPage_NoFocus] = {
      OnEnter = self.OnEnterState_NormalPage_NoFocus
    },
    [ForgeConst.ControllerFSMStates.NormalPage_FocusItem] = {
      OnEnter = self.OnEnterSttae_NormalPage_FocusItem
    },
    [ForgeConst.ControllerFSMStates.NormalPage_ShowItem] = {
      OnEnter = self.OnEnterState_NormalPage_ShowItem,
      OnLeave = self.OnLeaveState_NormalPage_ShowItem
    },
    [ForgeConst.ControllerFSMStates.NormalPage_FocusSort] = {
      OnEnter = self.OnEnterState_NormalPage_FocusSort,
      OnLeave = self.OnLeaveState_NormalPage_FocusSort
    },
    [ForgeConst.ControllerFSMStates.PathPage_Normal] = {
      OnEnter = self.OnEnterState_PathPage_Normal,
      OnLeave = self.OnLeaveState_PathPage_Normal
    }
  })
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  if GameInputModeSubsystem then
    self.GameInputModeSubsystem = GameInputModeSubsystem
  end
  self.Super.OnLoaded(self, ...)
  local Params = (...)
  self:ParseLoadParams(Params)
  self.Sort:Init(self, {
    GText("UI_Select_Kind"),
    GText("UI_Select_Unique")
  }, CommonConst.DESC, {
    OnGetBackFocusWidget = function()
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
      return self.ForgeContent
    end
  })
  self.Sort:BindEventOnSelectionsChanged(self, self.OnSortMethodChanged)
  self.Sort:BindEventOnSortTypeChanged(self, self.OnSortMethodChanged)
  self:InitListenEvent()
  self:InitKeySetting()
  self:InitTabContent()
  self:SetFocus()
  self:EnableTickWhenPaused(true)
  self:HideDraftPathView()
  self:CheckScrollbarVisibility(self.ForgeContent:GetNumItems())
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetActorHideTag("Forge", true)
  Player:SetCanInteractiveTrigger(false)
  self:SwitchCamera(true)
  local Avatar = GWorld:GetAvatar()
  local IsHome = Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
  if IsHome then
    local ForgeNPC = UE4.ANpcCharacter.GetNpc(self, ForgeNPCId)
    if ForgeNPC then
      if ForgeNPC.NPCNameWidgetComponent then
        local NameWidget = ForgeNPC.NPCNameWidgetComponent:GetWidget()
        if NameWidget then
          NameWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
      if ForgeNPC.BubbleWidgetComponent then
        local BubbleWidget = ForgeNPC.BubbleWidgetComponent:GetWidget()
        if BubbleWidget then
          BubbleWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
      ForgeNPC:PlayUITalkAction(21000201)
    end
  else
    local ForgeNPC = UIManager(self):GetUINpcActor(ForgeNPCRegionId)
    ForgeNPC:PlayUITalkAction(21000201)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ForgeMainIn", nil)
  if not self.RefreshTimer then
    self.RefreshTimer = self:AddTimer(0.5, function()
      self:TickRefreshItemsView(ForgeConst.DraftState.InProgress)
    end, true)
  end
  self.Text_Sift:SetText(GText("ModFilter_Title"))
  self.Sift:SetSiftPreviewSideWidget(true)
  self.Sift:SetSiftModelId(1005)
  self.Sift:BindEventOnSelectionsChanged(self, self.OnModFilterChanged)
  self.Sift:ClearSiftSelection()
  self.Sift:SetGamepadKeyVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Receive:SetText(GText("UI_Mail_Recieveall"))
  self.Btn_Receive:SetDefaultGamePadImg("Y")
  self:PlayAnimation(self.In)
  self.Tab:PlayInAnim()
  self.Forging_Path_PC.HasPreInit = false
  self.Entrance_Compendium:Init(self, self.OnCompendiumClicked)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:InitViewByDeviceType()
end

function WBP_ForgeMain_C:BP_GetDesiredFocusTarget()
  if UIUtils.IsGamepadInput() then
    local CurrentState = self.ControllerFSM:Current()
    if CurrentState == ForgeConst.ControllerFSMStates.PathPage_Normal then
      return self.Forging_Path_PC:GetDesiredFocusTarget()
    else
      return self.ForgeContent
    end
  else
    return self
  end
end

function WBP_ForgeMain_C:SetFocus_Lua()
  return self:BP_GetDesiredFocusTarget()
end

function WBP_ForgeMain_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:InitViewByDeviceType()
  self:HandleGamepadRefocus()
end

function WBP_ForgeMain_C:InitViewByDeviceType()
  if UIUtils.IsGamepadInput() then
    self:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    self:InitMobileView()
  else
    self:InitKeyboardView()
  end
end

function WBP_ForgeMain_C:HandleGamepadRefocus()
  if UIUtils.IsGamepadInput() then
    if self.IsShowingDraftPathView then
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.PathPage_Normal)
      if self:HasAnyFocus() then
        self.Forging_Path_PC:SetGamepadFocus()
      end
    else
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
      if self:HasAnyFocus() then
        self:NavigateToFirstEntry()
      end
    end
  end
end

function WBP_ForgeMain_C:InitKeyboardView()
  self.Btn_Receive:SetGamePadIconVisible(false)
  if self.CanBatchComplete then
    self:UpdateKeyboardBottomKeyInfo({
      ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Space,
      ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  else
    self:UpdateKeyboardBottomKeyInfo({
      ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  end
end

function WBP_ForgeMain_C:InitMobileView()
  self.Btn_Receive:SetGamePadIconVisible(false)
end

function WBP_ForgeMain_C:InitGamepadView()
  self.Btn_Receive:SetGamePadIconVisible(true)
end

function WBP_ForgeMain_C:InitNormalPageState()
  self:AddDelayFrameFunc(function()
    if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
      if not self.IsDraftInfosEmpty then
        self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
        self:NavigateToFirstEntry()
      else
        self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_NoFocus)
      end
    end
  end, 10)
end

function WBP_ForgeMain_C:NavigateToFirstEntry()
  if self.ControllerNotAutoFocus then
    self.ControllerNotAutoFocus = nil
    return
  end
  local ForgeItemWidgets = self.ForgeContent:GetDisplayedEntryWidgets()
  local AllItemsNum = self.ForgeContent:GetNumItems()
  local ForgeItemWidgetsNum = ForgeItemWidgets:Num()
  local MinIndex = -1
  for Index = 1, ForgeItemWidgetsNum do
    local Entry = ForgeItemWidgets:GetRef(Index)
    local EntryIndex = self.ForgeContent:GetIndexForItem(Entry.Content)
    if -1 ~= EntryIndex then
      if -1 == MinIndex then
        MinIndex = EntryIndex
      else
        MinIndex = math.min(MinIndex, EntryIndex)
      end
    end
  end
  MinIndex = math.clamp(MinIndex, 0, AllItemsNum - 1)
  self.ForgeContent:NavigateToIndex(MinIndex)
  self.ForgeContent:SetFocus()
end

function WBP_ForgeMain_C:OnEnterSttae_NormalPage_FocusItem()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_ShowItem,
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_ForgeMain_C:OnEnterState_NormalPage_ShowItem()
  if self.CurrentGamepadSelectedItem then
    self:UpdateGamepadBottomKeyInfo({
      ForgeConst.BottomKeyTypes.BottomKey_ShowDetails,
      ForgeConst.BottomKeyTypes.BottomKey_Back
    })
    local CurrentGamepadSelectedEntry = self:GetEntryFromItem(self.CurrentGamepadSelectedItem)
    if CurrentGamepadSelectedEntry then
      CurrentGamepadSelectedEntry:EnterShowItemView()
    end
  else
    DebugPrint(LogTag.Error, "\232\191\155\229\133\165\232\129\154\231\132\166\230\168\161\229\188\143\229\164\177\232\180\165\239\188\140\230\137\190\228\184\141\229\136\176\233\156\128\232\166\129\232\129\154\231\132\166\231\154\132\233\147\184\233\128\160\230\157\161\231\155\174")
    self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
  end
end

function WBP_ForgeMain_C:OnLeaveState_NormalPage_ShowItem(NewStateName)
  local CurrentGamepadSelectedEntry = self:GetEntryFromItem(self.CurrentGamepadSelectedItem)
  if CurrentGamepadSelectedEntry then
    CurrentGamepadSelectedEntry:LeaveShowItemView()
    self:AddTimer(0.1, function()
      CurrentGamepadSelectedEntry:SetFocus()
    end)
  end
end

function WBP_ForgeMain_C:OnEnterState_NormalPage_FocusSort()
  self.Sort:SetFocus()
  self.Sort:SetControllerKeyHidden(true)
  self.Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(true)
  self.Entrance_Compendium:HideGamepadKeyTip(true)
  self.Btn_Receive:SetGamePadIconVisible(false)
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Confirm,
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_ForgeMain_C:OnLeaveState_NormalPage_FocusSort(NewStateName)
  self.Sort:SetControllerKeyHidden(false)
  self.Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(false)
  self.Entrance_Compendium:HideGamepadKeyTip(false)
  self.Btn_Receive:SetGamePadIconVisible(true)
end

function WBP_ForgeMain_C:OnEnterState_NormalPage_NoFocus()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
  self.CurrentGamepadSelectedItem = nil
end

function WBP_ForgeMain_C:OnEnterState_PathPage_Normal()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_ForgeMain_C:OnLeaveState_PathPage_Normal(NewStateName)
end

function WBP_ForgeMain_C:UpdateGamepadBottomKeyInfo(KeyInfoTypeList)
  local KeyInfo = {}
  for Index, Value in ipairs(KeyInfoTypeList) do
    table.insert(KeyInfo, self.GamepadKeyCofig[Value])
  end
  self.Tab:UpdateBottomKeyInfo(KeyInfo)
end

function WBP_ForgeMain_C:UpdateKeyboardBottomKeyInfo(KeyTypeList)
  local KeyInfo = {}
  for _, Value in ipairs(KeyTypeList) do
    table.insert(KeyInfo, self.KeyboardKeyConfig[Value])
  end
  self.Tab:UpdateBottomKeyInfo(KeyInfo)
end

function WBP_ForgeMain_C:OnForgeItemReceiveFocus(Widget)
  if self.CurrentGamepadSelectedItem == Widget.Content then
    return
  end
  if self.CurrentGamepadSelectedItem then
    local CurrentGamepadSelectedEntry = self:GetEntryFromItem(self.CurrentGamepadSelectedItem)
    if CurrentGamepadSelectedEntry then
      CurrentGamepadSelectedEntry:SetGamepadFocus(false)
    end
  end
  Widget:SetGamepadFocus(true)
  self.CurrentGamepadSelectedItem = Widget.Content
  self:UpdateFocusItemSetTargetState()
end

function WBP_ForgeMain_C:HandleGamepadSetTarget()
  if not self.CurrentGamepadSelectedItem then
    return
  end
  local CurrentState = self.ControllerFSM:Current()
  if CurrentState == ForgeConst.ControllerFSMStates.NormalPage_FocusItem and self.CurrentGamepadSelectedItem.State == ForgeConst.DraftState.NotStarted then
    local CurrentGamepadSelectedEntry = self:GetEntryFromItem(self.CurrentGamepadSelectedItem)
    local Value = not self.CurrentGamepadSelectedItem.IsSetTarget
    CurrentGamepadSelectedEntry:UpdateSetTargetBtn(Value)
  end
  self:UpdateFocusItemSetTargetState()
end

function WBP_ForgeMain_C:HandleGamepadBatchComplete()
  self:TryBatchComplete()
end

function WBP_ForgeMain_C:HandleGamepadHideDraftPathView()
  self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
end

function WBP_ForgeMain_C:UpdateFocusItemSetTargetState()
  if not self.CurrentGamepadSelectedItem then
    return
  end
  local CurrentState = self.ControllerFSM:Current()
  if CurrentState == ForgeConst.ControllerFSMStates.NormalPage_FocusItem then
    if self.CurrentGamepadSelectedItem.State == ForgeConst.DraftState.NotStarted then
      if self.CurrentGamepadSelectedItem.IsSetTarget then
        self:UpdateGamepadBottomKeyInfo({
          ForgeConst.BottomKeyTypes.BottomKey_UnSetTarget,
          ForgeConst.BottomKeyTypes.BottomKey_ShowItem,
          ForgeConst.BottomKeyTypes.BottomKey_Back
        })
      else
        self:UpdateGamepadBottomKeyInfo({
          ForgeConst.BottomKeyTypes.BottomKey_SetTarget,
          ForgeConst.BottomKeyTypes.BottomKey_ShowItem,
          ForgeConst.BottomKeyTypes.BottomKey_Back
        })
      end
    else
      self:UpdateGamepadBottomKeyInfo({
        ForgeConst.BottomKeyTypes.BottomKey_ShowItem,
        ForgeConst.BottomKeyTypes.BottomKey_Back
      })
    end
  end
end

function WBP_ForgeMain_C:OnMenuOpenChanged(bIsOpen)
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.Tab:UpdateUIStyleInPlatform(not bIsOpen)
    self.Tab:SetBottomKeyInfoVisible(not bIsOpen)
    self.SubTab_List:UpdateUIStyleInPlatform(not bIsOpen)
    self.Sort:SetControllerKeyHidden(bIsOpen)
    self.Btn_Receive:SetGamePadIconVisible(not bIsOpen)
    self.Entrance_Compendium:HideGamepadKeyTip(bIsOpen)
  end
end

function WBP_ForgeMain_C:OnForgeItemLostFocus(Widget)
  Widget:SetGamepadFocus(false)
  if self.CurrentGamepadSelectedItem == Widget.Content then
    self.CurrentGamepadSelectedItem = nil
  end
end

function WBP_ForgeMain_C:OnForgeItemNavigateUp(Widget)
end

function WBP_ForgeMain_C:OnForgeItemNavigateDown(Widget)
end

function WBP_ForgeMain_C:OnForgeItemWidgetClicked(Widget)
  local DraftId = Widget.Content.Id
  local IsNotSeen = Widget.Content.IsNotSeen
  if IsNotSeen then
    Widget.Content.IsNotSeen = false
    ForgeModel:MarkDraftAsSeen(DraftId)
    self:RefreshSingleItemData(Widget.Content)
    Widget:RefreshView()
  end
end

function WBP_ForgeMain_C:OnSortMethodChanged()
  self:UpdateForgeContent()
end

function WBP_ForgeMain_C:ParseLoadParams(Params)
  if not Params then
    return
  end
  if Params.NotDelayAddListItem then
    self:SetNotDelayAddListItem(true)
  end
end

function WBP_ForgeMain_C:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
  AudioManager(self):PlaySystemUIBGM("event:/bgm/cbt02/0041_story_jiaojiao_tiejiang", nil, "ForgeMain")
  if self.IsShowingDraftPathView then
    self.Forging_Path_PC:Refresh()
  else
    self:TickRefreshItemsView()
  end
  if self.ControllerFSM then
    local Current = self.ControllerFSM:Current()
    if Current == ForgeConst.ControllerFSMStates.NormalPage_ShowItem then
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
    end
  end
end

function WBP_ForgeMain_C:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
end

function WBP_ForgeMain_C:RefreshSingleItemData(ForgeItemContent)
  if ForgeItemContent then
    if ForgeItemContent.IsEmptyWidget then
      return
    end
    local TabType = self:GetCurrentTabType()
    local DraftInfo = ForgeModel:CheckState(ForgeItemContent.Id)
    if not DraftInfo or TabType == ForgeConst.TabType.Producing and DraftInfo.State == ForgeConst.DraftState.NotStarted or DraftInfo.State == ForgeConst.DraftState.NotStarted and DraftInfo.Count <= 0 and not DraftInfo.IsInfinity then
      ForgeItemContent.State = nil
      self.ForgeContent:RemoveItem(ForgeItemContent)
    else
      ForgeItemContent = ForgeModel:ConstructForgeItemContent(ForgeItemContent, DraftInfo)
    end
  end
end

function WBP_ForgeMain_C:TickRefreshItemsView(WidgetState)
  if self.IsShowingDraftPathView then
    self.Forging_Path_PC:TickRefreshDetails()
  else
    local ForgeItemWidgets = self.ForgeContent:GetDisplayedEntryWidgets()
    local Length = ForgeItemWidgets:Length()
    for i = 1, Length do
      local ForgeItemWidget = ForgeItemWidgets:GetRef(i)
      if ForgeItemWidget.Content.IsEmptyWidget then
        break
      end
      if not WidgetState or ForgeItemWidget.WidgetCurrentState == WidgetState then
        self:RefreshSingleItemData(ForgeItemWidget.Content)
        ForgeItemWidget:RefreshView()
      end
    end
  end
end

function WBP_ForgeMain_C:RefreshItemsView()
  if self.IsShowingDraftPathView then
    self.Forging_Path_PC:Refresh()
  else
    local ContentItems = self.ForgeContent:GetListItems()
    for i = 1, ContentItems:Length() do
      local ForgeItem = ContentItems:GetRef(i)
      self:RefreshSingleItemData(ForgeItem)
    end
    local ForgeItemWidgets = self.ForgeContent:GetDisplayedEntryWidgets()
    local Length = ForgeItemWidgets:Length()
    for i = 1, Length do
      local ForgeItemWidget = ForgeItemWidgets:GetRef(i)
      if ForgeItemWidget.Content.IsEmptyWidget then
        break
      end
      ForgeItemWidget:RefreshView()
    end
    local DraftInfos, FilterResult = ForgeModel:GetDatasByFilter(self:GetCurrentTabType(), self:GetCurrentSubTabType(), self.CommonFilterData)
    self:ShowEmptyPage(#DraftInfos <= 0, FilterResult)
    self:CheckScrollbarVisibility(#DraftInfos)
    self:CheckShouldAddEmptyItem()
    self:UpdateBatchCompleteButton()
  end
end

function WBP_ForgeMain_C:UpdateBatchCompleteButton()
  local TabType = self:GetCurrentTabType()
  local Items = self.DraftInfosCache
  local ItemNum = #self.DraftInfosCache
  if ItemNum <= 0 then
    self.Btn_Receive:ForbidBtn(true)
    return
  end
  for _, Item in pairs(Items) do
    local DraftId = Item.Id
    local DraftInfo = ForgeModel:CheckState(DraftId)
    if DraftInfo and DraftInfo.State == ForgeConst.DraftState.Complete then
      self.CanBatchComplete = true
      self.Btn_Receive:ForbidBtn(false)
      if UIUtils.IsKeyboardInput() then
        self:UpdateKeyboardBottomKeyInfo({
          ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Space,
          ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc
        })
      end
      return
    end
  end
  self.CanBatchComplete = false
  self.Btn_Receive:ForbidBtn(true)
  if UIUtils.IsKeyboardInput() then
    self:UpdateKeyboardBottomKeyInfo({
      ForgeConst.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  end
end

function WBP_ForgeMain_C:UpdateSiftButton()
  local TabType = self:GetCurrentTabType()
  if TabType == ForgeConst.TabType.Mod then
    self.Panel_Sift:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Sift:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeMain_C:InitListenEvent()
  self:AddDispatcher(EventID.OnStartProduce, self, self.OnStartProduce)
  self:AddDispatcher(EventID.OnCompleteProduce, self, self.OnCompleteProduce)
  self:AddDispatcher(EventID.OnCompleteBatchProduce, self, self.OnCompleteProduce)
  self:AddDispatcher(EventID.OnAccerateProduce, self, self.OnAccerateProduce)
  self:AddDispatcher(EventID.OnCancelProduce, self, self.OnCancelProduce)
  self:AddDispatcher(EventID.OnBlueComplete, self, self.OnBlueComplete)
  self.Btn_Receive:BindEventOnClicked(self, self.RequestBatchComplete)
  self.ForgeContent.BP_OnEntryInitialized:Add(self, self.OnForgeContentEntryInit)
  self.ForgeContent.BP_OnItemClicked:Add(self, self.OnForgeContentItemClicked)
end

function WBP_ForgeMain_C:InitKeySetting()
  self.SwitchTab_LeftKey = "Q"
  self.SwitchTab_RightKey = "E"
  self.SwitchSubTab_LeftKey = "A"
  self.SwitchSubTab_RightKey = "D"
  self.LeftMouseButton = "LeftMouseButton"
  self.RightMouseButton = "RightMouseButton"
  self.EscapeKey = "Escape"
  self.OpenForgeKey = DataMgr.KeyboardMap.OpenForge.Key
  self.BatchCompeleteKey = "SpaceBar"
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.EscapeKey] = self.OnReturnKeyDown
  self.KeyDownEvent[self.OpenForgeKey] = self.OnReturnKeyDown
  self.KeyDownEvent[self.BatchCompeleteKey] = self.TryBatchComplete
  self.KeyDownEvent[self.SwitchTab_LeftKey] = function()
    self.Tab:TabToLeft()
  end
  self.KeyDownEvent[self.SwitchTab_RightKey] = function()
    self.Tab:TabToRight()
  end
  self.KeyDownEvent[self.SwitchSubTab_LeftKey] = function()
    self.SubTab_List:TabToLeft()
  end
  self.KeyDownEvent[self.SwitchSubTab_RightKey] = function()
    self.SubTab_List:TabToRight()
  end
end

function WBP_ForgeMain_C:ShowDraftPathView(DraftId)
  self.Panel_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Path:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Forging_Path_PC:Init(DraftId, self, ForgeModel)
  self.Forging_Path_PC.OnClosedCallback = {
    self,
    self.HandleCloseDraftPathView
  }
  self.Forging_Path_PC.OnDetailsViewBtnStartClickedCallback = {
    self,
    self.OnDraftBtnStartClicked
  }
  self.Forging_Path_PC.OnDetailsViewBtnCancelClickedCallback = {
    self,
    self.OnDraftBtnCancelClicked
  }
  self.Forging_Path_PC.OnFocusToDetailsView = {
    self,
    self.OnFocusToPathDetailsView
  }
  self.Forging_Path_PC.OnFocusToPathView = {
    self,
    self.OnFocusToPathView
  }
  self.IsShowingDraftPathView = true
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.PathPage_Normal)
    self.Forging_Path_PC:SetGamepadFocus()
  end
end

function WBP_ForgeMain_C:HandleCloseDraftPathView()
  if UIUtils.IsGamepadInput() then
    self:HandleGamepadHideDraftPathView()
  end
  self:HideDraftPathView()
end

function WBP_ForgeMain_C:HideDraftPathView()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.ForgeContent:SetFocus()
  end
  self.Panel_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Path:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsShowingDraftPathView = false
  self:TickRefreshItemsView()
end

function WBP_ForgeMain_C:Handle_PreviewKeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  local CurrentState = self.ControllerFSM:Current()
  if CurrentState == ForgeConst.ControllerFSMStates.NormalPage_FocusItem then
    if InKeyName == Const.GamepadSpecialLeft then
      if self.CurrentGamepadSelectedItem then
        self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_ShowItem)
        IsEventHandled = true
      end
    elseif InKeyName == Const.GamepadFaceButtonLeft and self.CurrentGamepadSelectedItem then
      local CurrentItemState = self.CurrentGamepadSelectedItem.State
      if CurrentItemState == ForgeConst.DraftState.InProgress then
        self:OnDraftBtnCancelClicked(self.CurrentGamepadSelectedItem.Id)
      else
        self:HandleGamepadSetTarget()
      end
      IsEventHandled = true
    end
  elseif CurrentState == ForgeConst.ControllerFSMStates.NormalPage_ShowItem and (InKeyName == Const.GamepadDPadUp or InKeyName == Const.GamepadDPadDown) then
    IsEventHandled = true
  end
  return IsEventHandled
end

function WBP_ForgeMain_C:Handle_KeyDownOnGamePad(InKeyName)
  DebugPrint("Tianyi@ HandleKeyDownOnGamePad", InKeyName, self.ControllerFSM:Current())
  local IsEventHandled = false
  local CurrentState = self.ControllerFSM:Current()
  if CurrentState == ForgeConst.ControllerFSMStates.NormalPage_ShowItem then
    if InKeyName == Const.GamepadFaceButtonRight then
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
      self.ForgeContent:SetFocus()
      IsEventHandled = true
    end
  elseif CurrentState == ForgeConst.ControllerFSMStates.NormalPage_FocusItem or CurrentState == ForgeConst.ControllerFSMStates.NormalPage_NoFocus then
    if InKeyName == Const.GamepadLeftTrigger then
      if self.TabIdx2SubTabType[self.TabIndex] then
        self.SubTab_List:TabToLeft()
      end
      IsEventHandled = true
    elseif InKeyName == Const.GamepadRightTrigger then
      if self.TabIdx2SubTabType[self.TabIndex] then
        self.SubTab_List:TabToRight()
      end
      IsEventHandled = true
    elseif InKeyName == Const.GamepadLeftThumbstick then
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusSort)
      IsEventHandled = true
    elseif InKeyName == Const.GamepadSpecialRight then
      self:OnCompendiumClicked()
      IsEventHandled = true
    elseif InKeyName == Const.GamepadFaceButtonUp then
      self:HandleGamepadBatchComplete()
      IsEventHandled = true
    end
  elseif CurrentState == ForgeConst.ControllerFSMStates.NormalPage_FocusSort then
    if InKeyName == Const.GamepadFaceButtonRight then
      self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
      self.ForgeContent:SetFocus()
      IsEventHandled = true
    elseif InKeyName == Const.GamepadRightThumbstick then
      IsEventHandled = true
    end
  elseif CurrentState == ForgeConst.ControllerFSMStates.PathPage_Normal and InKeyName == Const.GamepadFaceButtonUp then
    IsEventHandled = self.Forging_Path_PC:HandleTipPreviewDetails(InKeyName)
  end
  IsEventHandled = IsEventHandled or self.Tab:Handle_KeyEventOnGamePad(InKeyName)
  return IsEventHandled
end

function WBP_ForgeMain_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsHandled = self:Handle_PreviewKeyDownOnGamePad(InKeyName)
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_ForgeMain_C:OnKeyDown(MyGeometry, InKeyEvent)
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

function WBP_ForgeMain_C:BindReddotTreeEvents()
  ReddotManager.AddListener(ForgeConst.NewdotNodeName.Root, self, self.UpdateNewReddotState)
  for TabIdx, TabType in pairs(self.TabIdx2TabType) do
    local SubTabs = self.TabIdx2SubTabType[TabIdx]
    if SubTabs then
      for SubTabIdx, SubTabType in pairs(SubTabs) do
        ReddotManager.AddListener(ForgeConst.ReddotNodeName[SubTabType], self, function()
          self:UpdateSubTabReddot(TabIdx, SubTabIdx)
        end)
        ReddotManager.AddListener(ForgeConst.NewdotNodeName[SubTabType], self, function()
          self:UpdateSubTabReddot(TabIdx, SubTabIdx)
        end)
      end
    end
    ReddotManager.AddListener(ForgeConst.ReddotNodeName[TabType], self, function()
      self:UpdateTabReddot(TabIdx)
    end)
    ReddotManager.AddListener(ForgeConst.NewdotNodeName[TabType], self, function()
      self:UpdateTabReddot(TabIdx)
    end)
  end
end

function WBP_ForgeMain_C:UnBindReddotTreeEvents()
  for _, NodeName in pairs(ForgeConst.ReddotNodeName) do
    ReddotManager.RemoveListener(NodeName, self)
  end
  for _, NodeName in pairs(ForgeConst.NewdotNodeName) do
    ReddotManager.RemoveListener(NodeName, self)
  end
end

function WBP_ForgeMain_C:UpdateNewReddotState()
  local NewDotCount = ReddotManager.GetTreeNode(ForgeConst.NewdotNodeName.Root).Count
  if NewDotCount > 0 then
    self.Entrance_Compendium.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Entrance_Compendium.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeMain_C:UpdateTabReddot(TabIdx)
  DebugPrint("Tianyi@ UpdateTabReddot", TabIdx)
  local TabType = self.TabIdx2TabType[TabIdx]
  local ReddotNode = ReddotManager.GetTreeNode(ForgeConst.ReddotNodeName[TabType])
  local NewdotNode = ReddotManager.GetTreeNode(ForgeConst.NewdotNodeName[TabType])
  local ShowNormalReddot = ReddotNode.Count > 0
  local ShowNewReddot = NewdotNode.Count > 0
  self.Tab:ShowTabRedDot(TabIdx, ShowNewReddot and not ShowNormalReddot, ShowNormalReddot)
end

function WBP_ForgeMain_C:UpdateSubTabReddot(TabIdx, SubTabIdx)
  DebugPrint("Tianyi@ UpdateSubTabReddot", TabIdx, SubTabIdx)
  if not (self.TabIndex == TabIdx and self.TabIdx2SubTabType[TabIdx]) or not self.TabIdx2SubTabType[TabIdx][SubTabIdx] then
    return
  end
  local SubTabType = self.TabIdx2SubTabType[TabIdx][SubTabIdx]
  local SubTabReddotNode = ReddotManager.GetTreeNode(ForgeConst.ReddotNodeName[SubTabType])
  local SubTabNewdotNode = ReddotManager.GetTreeNode(ForgeConst.NewdotNodeName[SubTabType])
  local ShowNormalReddot = SubTabReddotNode.Count > 0
  local ShowNewReddot = SubTabNewdotNode.Count > 0
  self.SubTab_List:ShowTabRedDot(SubTabIdx, ShowNewReddot and not ShowNormalReddot, ShowNormalReddot)
end

function WBP_ForgeMain_C:InitTabContent()
  local AllTabInfo = {}
  self.TabIdx2DataIdx = {}
  self.TabIdx2TabType = {}
  self.TabIdx2SubTabType = {}
  for i = 1, #DataMgr.ForgeTab do
    table.insert(self.TabIdx2DataIdx, i)
  end
  table.sort(self.TabIdx2DataIdx, function(DataIdx_1, DataIdx_2)
    return DataMgr.ForgeTab[DataIdx_1].Sequence > DataMgr.ForgeTab[DataIdx_2].Sequence
  end)
  for TabIdx = 1, #DataMgr.ForgeTab do
    local DataIdx = self.TabIdx2DataIdx[TabIdx]
    local TabData = DataMgr.ForgeTab[DataIdx]
    self.TabIdx2TabType[TabIdx] = TabData.ProductType
    self.TabIdx2SubTabType[TabIdx] = ForgeConst.TabType2SubTabType[TabData.ProductType]
    table.insert(AllTabInfo, {
      Text = GText(TabData.TabName),
      TabId = TabIdx,
      IconPath = TabData.Icon
    })
  end
  local TabConfigData = {
    TitleName = GText("MAIN_UI_FORGE"),
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "Text",
    Tabs = AllTabInfo,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BackCallback = self.OnClose,
    BottomKeyInfo = {},
    OwnerPanel = self
  }
  self.Tab:Init(TabConfigData)
  self.Tab:BindEventOnTabSelected(self, self.OnTabItemSelected)
  local SubTabConfigData = {
    LeftKey = "A",
    RightKey = "D",
    Tabs = {}
  }
  self.SubTab_List:Init(SubTabConfigData)
  self.SubTab_List:BindEventOnTabSelected(self, self.OnSubTabItemSelected)
  self.Tab:SelectTab(1)
  self:BindReddotTreeEvents()
end

function WBP_ForgeMain_C:SetTargetSubTabIndex(SubTabIndex)
  self.TargetSubTabIndex = SubTabIndex
end

function WBP_ForgeMain_C:GetTargetSubTabIndex()
  return self.TargetSubTabIndex
end

function WBP_ForgeMain_C:OnTabItemSelected(TabWidget)
  local PrevTabType = self:GetCurrentTabType()
  self.TabIndex = TabWidget.Idx
  if self.TabIdx2SubTabType[self.TabIndex] then
    local AllSubTabInfo = {}
    for Index, SubTabType in ipairs(self.TabIdx2SubTabType[self.TabIndex]) do
      local SubTabReddotNode = ReddotManager.GetTreeNode(ForgeConst.ReddotNodeName[SubTabType])
      local SubTabNewdotNode = ReddotManager.GetTreeNode(ForgeConst.NewdotNodeName[SubTabType])
      local ShowNormalReddot = SubTabReddotNode.Count > 0
      local ShowNewReddot = SubTabNewdotNode.Count > 0
      local SubTabInfo = {
        Text = GText(ForgeConst.SubTabTitleName[SubTabType]),
        TabId = Index,
        ShowRedDot = ShowNormalReddot,
        IsNew = ShowNewReddot
      }
      table.insert(AllSubTabInfo, SubTabInfo)
    end
    self.SubTab_List:UpdateTabs(AllSubTabInfo)
    local TargetSubIndex = self:GetTargetSubTabIndex()
    if TargetSubIndex then
      self.SubTab_List:SelectTab(self.TargetSubTabIndex)
      self:SetTargetSubTabIndex(false)
    else
      self.SubTab_List:SelectTab(1)
    end
    self:AddWidgetHiddenTag(self.Panel_SubTab, false, "ShowSubTab")
    self:AddWidgetHiddenTag(self.Spacer_Up, false, "ShowSubTab")
  else
    self.SubTabIndex = nil
    self.SubTab_List:UpdateTabs({})
    self:UpdateForgeContent()
    self:AddWidgetHiddenTag(self.Panel_SubTab, true, "ShowSubTab")
    self:AddWidgetHiddenTag(self.Spacer_Up, true, "ShowSubTab")
  end
  if self.IsShowingDraftPathView then
    self.Forging_Path_PC:OnClose()
  end
  self.Sift:ClearSiftSelection()
end

function WBP_ForgeMain_C:OnSubTabItemSelected(TabWidget)
  self.SubTabIndex = TabWidget.Idx
  self:UpdateForgeContent()
end

function WBP_ForgeMain_C:UpdateForgeContent()
  if self.TabIndex then
    self.CurrentGamepadSelectedItem = nil
    local TabType = self:GetCurrentTabType()
    local SubTabType = self:GetCurrentSubTabType()
    local FilterData
    if TabType == ForgeConst.TabType.Mod then
      FilterData = self.CommonFilterData
    end
    local DraftInfos, FilterResult = ForgeModel:GetDatasByFilter(TabType, SubTabType, FilterData)
    self.IsDraftInfosEmpty = #DraftInfos <= 0
    if not self.IsDraftInfosEmpty then
      local CurSortBy, SortType = self.Sort:GetSortInfos()
      ForgeModel:SortDraftDatas(DraftInfos, TabType, SubTabType, CurSortBy, SortType)
    end
    self:ShowEmptyPage(self.IsDraftInfosEmpty, FilterResult)
    self:BeginAddForgeContentItem(DraftInfos)
    self:UpdateBatchCompleteButton()
    self:UpdateSiftButton()
    self:InitNormalPageState()
  end
end

function WBP_ForgeMain_C:GetMaxItemNumPerPanel()
  if self.MaxItemNumPerPanel then
    return self.MaxItemNumPerPanel
  end
  if self.ForgeContent:GetNumItems() > 0 then
    local ForgeItemWidgets = self.ForgeContent:GetDisplayedEntryWidgets()
    if 0 ~= ForgeItemWidgets:Length() then
      self.MaxItemNumPerPanel = UIUtils.GetListViewContentMaxCount(self.ForgeContent, ForgeItemWidgets)
      return self.MaxItemNumPerPanel
    else
      return MAX_ITEM_PER_PANEL
    end
  else
    return MAX_ITEM_PER_PANEL
  end
end

function WBP_ForgeMain_C:CheckScrollbarVisibility(ItemNum)
  if ItemNum <= self:GetMaxItemNumPerPanel() then
    self.ForgeContent:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.ForgeContent:SetScrollbarVisibility(UE4.ESlateVisibility.Visible)
  end
end

function WBP_ForgeMain_C:CheckShouldAddEmptyItem()
  local ItemsNum = self.ForgeContent:GetNumItems()
  local MaxItemNumPerPanel = self:GetMaxItemNumPerPanel()
  while ItemsNum < MaxItemNumPerPanel do
    local Obj = NewObject(self.ForgeItemContentClass)
    Obj.IsEmptyWidget = true
    self.ForgeContent:AddItem(Obj)
    ItemsNum = ItemsNum + 1
    DebugPrint("Tianyi@ Items num not enough. Add empty item")
  end
end

function WBP_ForgeMain_C:ShowEmptyPage(bShow, FilterResult)
  local IsGamepad = self.CurInputDeviceType == UE4.ECommonInputType.Gamepad
  if bShow then
    self.ForgeContent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not FilterResult.HasFilterItem then
      self:AddWidgetHiddenTag(self.Panel_Bottom, true, "EmptyPage")
      self:AddWidgetHiddenTag(self.Panel_SubTab, true, "EmptyPage")
      self:AddWidgetHiddenTag(self.Spacer_Up, true, "EmptyPage")
      self:AddWidgetHiddenTag(self.Spacer_Down, true, "EmptyPage")
    end
    local TabType = self:GetCurrentTabType()
    if TabType == ForgeConst.TabType.Producing then
      self.Text_EmptyText:SetText(GText("UI_FORGE_NOFORGING"))
      self.Text_WorldText:SetText(EnText("UI_FORGE_NOFORGING"))
    elseif TabType == ForgeConst.TabType.ToBeProduced then
      self.Text_EmptyText:SetText(GText("UI_FORGE_NOREADY"))
      self.Text_WorldText:SetText(EnText("UI_FORGE_NOREADY"))
    elseif self.Sift:IsSifted() then
      self.Text_EmptyText:SetText(GText("Forge_Blueprint_ConditionsAreNot"))
      self.Text_WorldText:SetText(EnText("Forge_Blueprint_ConditionsAreNot"))
    else
      self.Text_EmptyText:SetText(GText("UI_FORGING_EMPTY"))
      self.Text_WorldText:SetText(EnText("UI_FORGING_EMPTY"))
    end
    if IsGamepad then
      self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    end
  else
    self:AddWidgetHiddenTag(self.Panel_Bottom, false, "EmptyPage")
    self:AddWidgetHiddenTag(self.Panel_SubTab, false, "EmptyPage")
    self:AddWidgetHiddenTag(self.Spacer_Up, false, "EmptyPage")
    self:AddWidgetHiddenTag(self.Spacer_Down, false, "EmptyPage")
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.ForgeContent:SetVisibility(UE4.ESlateVisibility.Visible)
    if IsGamepad then
      self.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
    end
  end
end

function WBP_ForgeMain_C:SetNotDelayAddListItem(Value)
  self.NotDelayAddListItem = Value
end

function WBP_ForgeMain_C:GetNotDelayAddListItem()
  return self.NotDelayAddListItem
end

function WBP_ForgeMain_C:AddSingleItemToContent(DraftInfo, IsEmpty)
  local Obj = NewObject(self.ForgeItemContentClass)
  if IsEmpty then
    Obj.IsEmptyWidget = true
    self.ForgeContent:AddItem(Obj)
  else
    Obj = ForgeModel:ConstructForgeItemContent(Obj, DraftInfo)
    Obj.IsEmptyWidget = false
    
    function Obj.OnReceiveFocus(Widget)
      self:OnForgeItemReceiveFocus(Widget)
    end
    
    function Obj.OnLostFocus(Widget)
      self:OnForgeItemLostFocus(Widget)
    end
    
    function Obj.OnNavigateUp(Widget)
      self:OnForgeItemNavigateUp(Widget)
    end
    
    function Obj.OnNavigateDown(Widget)
      self:OnForgeItemNavigateDown(Widget)
    end
    
    function Obj.OnMenuOpenChanged(bIsOpen)
      self:OnMenuOpenChanged(bIsOpen)
    end
    
    function Obj.OnItemWidgetClicked(Widget)
      self:OnForgeItemWidgetClicked(Widget)
    end
    
    self.ForgeContent:AddItem(Obj)
  end
end

function WBP_ForgeMain_C:BeginAddForgeContentItem(DraftInfos)
  self.ForgeContent:ClearListItems()
  self.DraftInfosCache = DraftInfos
  if #DraftInfos <= 0 then
    return
  end
  if self.DelayToShowContentItemTimer then
    self:RemoveTimer(self.DelayToShowContentItemTimer)
  end
  if self:GetNotDelayAddListItem() then
    self:AddForgeContentItem(DraftInfos)
    self:SetNotDelayAddListItem(false)
  else
    self:DelayAddForgeContentItem(DraftInfos)
  end
end

function WBP_ForgeMain_C:AddForgeContentItem(DraftInfos)
  local MaxItemNumPerPanel = self:GetMaxItemNumPerPanel()
  for ItemIndex, DraftInfo in ipairs(DraftInfos) do
    self:AddSingleItemToContent(DraftInfo, false)
  end
  for i = #DraftInfos + 1, MaxItemNumPerPanel do
    self:AddSingleItemToContent({}, true)
  end
  self:CheckScrollbarVisibility(#DraftInfos)
end

function WBP_ForgeMain_C:DelayAddForgeContentItem(DraftInfos)
  self.DelayItemIndex = 1
  self.DelayToShowContentItemTimer = self:AddTimer(0.06, function()
    local DraftInfo = self.DraftInfosCache[self.DelayItemIndex]
    if self.DelayItemIndex > #self.DraftInfosCache then
      if self.DelayItemIndex <= self:GetMaxItemNumPerPanel() then
        self:AddSingleItemToContent(DraftInfo, true)
        self.DelayItemIndex = self.DelayItemIndex + 1
      else
        self.ForgeContent:SetEmptyGridItemCount(self:GetMaxItemNumPerPanel() - #self.DraftInfosCache)
        self:RemoveTimer(self.DelayToShowContentItemTimer)
        self.DelayToShowContentItemTimer = nil
      end
      return
    end
    self:CheckScrollbarVisibility(#self.DraftInfosCache)
    self:AddSingleItemToContent(DraftInfo, false)
    self.DelayItemIndex = self.DelayItemIndex + 1
  end, true)
end

function WBP_ForgeMain_C:IsDelayAddingForgeContentItem()
  return self.DelayToShowContentItemTimer
end

function WBP_ForgeMain_C:OnForgeContentEntryInit(Item, Widget)
  function Widget.EventStartProduce()
    self:OnDraftBtnStartClicked(Item.ID)
  end
  
  function Widget.EventCancelProduce()
    self:OnDraftBtnCancelClicked(Item.ID)
  end
  
  function Widget.EventShowPath()
    self:OnDraftShowPath(Item.ID)
  end
  
  self:RefreshSingleItemData(Item)
  Widget.Content = Item
  Widget:InitializeView()
end

function WBP_ForgeMain_C:OnForgeContentItemClicked(Item)
  if Item.State == ForgeConst.DraftState.Complete then
    self:RequestCompleteProduce(Item.Id)
  end
end

function WBP_ForgeMain_C:SetEnableBtnStartClicked(Value)
  self.DisableBtnStartClicked = not Value
end

function WBP_ForgeMain_C:OnDraftBtnStartClicked(DraftId)
  if self.DisableBtnStartClicked then
    return
  end
  DebugPrint("Tianyi@ OnDraftBtnStartClicked, DraftId = " .. DraftId)
  local DraftInfo = ForgeModel:CheckState(DraftId)
  if DraftInfo then
    if DraftInfo.State == ForgeConst.DraftState.NotStarted then
      if DraftInfo.CanProduce then
        local CostItemList
        if DraftInfo.ModAsMaterial then
          CostItemList = ForgeModel:ChooseCostItems(DraftId)
          if nil == CostItemList then
            DebugPrint(ErrorTag, "CostModList is nil, there must be something wrong!")
            return
          end
        end
        self:ShowStartProduceConfirmWindowWithItem(DraftId, CostItemList)
      else
      end
    elseif DraftInfo.State == ForgeConst.DraftState.InProgress then
      self:ShowAccerateProduceConfirmWindow(DraftId)
    elseif DraftInfo.State == ForgeConst.DraftState.Complete then
      self:RequestCompleteProduce(DraftId)
    end
  else
    DebugPrint("Tianyi@ Can not Found DraftInfo! It must be something wrong!")
  end
end

function WBP_ForgeMain_C:OnDraftShowPath(DraftId)
  DebugPrint("Tianyi@ OnDraftShowPath, DraftId = " .. DraftId)
  self:ShowDraftPathView(DraftId)
end

function WBP_ForgeMain_C:OnDraftBtnCancelClicked(DraftId)
  local DraftInfo = ForgeModel:CheckState(DraftId)
  if DraftInfo and DraftInfo.State == ForgeConst.DraftState.InProgress then
    self:ShowCancelProduceConfirmWindow(DraftId)
  end
end

function WBP_ForgeMain_C:OnFocusToPathDetailsView()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Confirm,
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_ForgeMain_C:OnFocusToPathView()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_ForgeMain_C:NavigateToTab(TabIndex, SubTabIndex)
  if self.Tab.CurrentTab == TabIndex then
    return
  end
  self:SetNotDelayAddListItem(true)
  self:SetTargetSubTabIndex(SubTabIndex)
  self.Tab:SelectTab(TabIndex)
end

function WBP_ForgeMain_C:NavigateToTargetDraft(DraftId)
  local IsGamepad = self.CurInputDeviceType == UE4.ECommonInputType.Gamepad
  if self.IsShowingDraftPathView then
    self:HideDraftPathView()
  end
  self.ControllerNotAutoFocus = true
  self:NavigateToTab(1)
  local ListItems = self.ForgeContent:GetListItems()
  local ListItemsNum = ListItems:Num()
  self:AddTimer(0.1, function()
    local TargetObject
    for i = 1, ListItemsNum do
      local ListItem = ListItems:GetRef(i)
      if ListItem.Id == DraftId then
        if IsGamepad then
          self.ForgeContent:NavigateToIndex(i - 1)
        else
          self.ForgeContent:ScrollIndexIntoView(i - 1)
        end
        TargetObject = ListItem
        self:AddTimer(0.1, function()
          local TargetWidget = TargetObject.Widget
          self:PlayEntryScanlineAnim(TargetWidget)
          if IsGamepad then
            TargetWidget:SetFocus()
            self.ControllerFSM:Enter(ForgeConst.ControllerFSMStates.NormalPage_FocusItem)
            self:UpdateFocusItemSetTargetState()
          end
        end)
        break
      end
    end
  end)
end

function WBP_ForgeMain_C:PlayEntryScanlineAnim(Widget)
  if not Widget then
    return
  end
  if self:IsAnimationPlaying(self.In) then
    self:BindToAnimationFinished(self.In, {
      self,
      function()
        if Widget then
          Widget:PlayScanlineAnim()
        end
        self:UnbindAllFromAnimationFinished(self.In)
      end
    })
  else
    Widget:PlayScanlineAnim()
  end
end

function WBP_ForgeMain_C:ContinueCoroutine(co, ...)
  if co then
    local Succeed, Ret = coroutine.resume(co, ...)
    assert(Succeed, Ret)
  end
end

function WBP_ForgeMain_C:ShowStartProduceConfirmWindow(DraftId, HasEquipedMod, co)
  local CommonDialogParams = {}
  local DraftData = DataMgr.Draft[DraftId]
  local PopupData = DataMgr.CommonPopupUIContext[Const.Popup_StartProduce]
  local PopoverText = PopupData.PopoverText
  local ProductName = GText(ForgeModel:GetProductNameByTypeAndId(DraftData.ProductType, DraftData.ProductId))
  if DraftData.ProductNum and DraftData.ProductNum > 1 then
    ProductName = ProductName .. " x" .. tostring(DraftData.ProductNum)
  end
  CommonDialogParams.ShortText = string.format(GText(PopoverText), ProductName)
  CommonDialogParams.HideItemTips = not HasEquipedMod
  
  function CommonDialogParams.RightCallbackFunction()
    self:ContinueCoroutine(co, true, 1)
  end
  
  function CommonDialogParams.LeftCallbackFunction()
    self:ContinueCoroutine(co, false)
  end
  
  self:ShowConfirmWindow(Const.Popup_StartProduce, CommonDialogParams, self)
end

function WBP_ForgeMain_C:ShowStartBatchProduceConfirmWindow(DraftId, co)
  local CommonDialogParams = {}
  local DraftData = DataMgr.Draft[DraftId]
  local PopupData = DataMgr.CommonPopupUIContext[Const.Popup_BatchStartProduce]
  local ProductName = GText(ForgeModel:GetProductNameByTypeAndId(DraftData.ProductType, DraftData.ProductId))
  if DraftData.ProductNum and DraftData.ProductNum > 1 then
    ProductName = ProductName .. " x" .. tostring(DraftData.ProductNum)
  end
  local DraftInfo = ForgeModel:CheckState(DraftId)
  local ForgeItemContent = ForgeModel:ConstructForgeItemContent({}, DraftInfo)
  CommonDialogParams.ForgeItemContent = ForgeItemContent
  CommonDialogParams.DraftInfo = DraftInfo
  
  function CommonDialogParams.RightCallbackFunction(_, PackageData)
    local Result = PackageData.Content_1
    local ProduceCount = Result.Count or 1
    self:ContinueCoroutine(co, true, ProduceCount)
  end
  
  function CommonDialogParams.LeftCallbackFunction()
    self:ContinueCoroutine(co, false)
  end
  
  CommonDialogParams.BindScript = "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_LuaModel.Common_Dialog_LuaModel_BatchProduce"
  self:ShowConfirmWindow(Const.Popup_BatchStartProduce, CommonDialogParams, self)
end

function WBP_ForgeMain_C:ShowStartProduceConfirmWindowWithItem(DraftId, CostItemList)
  CostItemList = CostItemList or {}
  local ImportantModList = {}
  local UseModAsMaterial = false
  local HasLockedMod = false
  local HasUpgradedMod = false
  local HasEquipedMod = false
  local ShouldShowBatchProduceWindow = DataMgr.Draft[DraftId].Batch
  for _, Item in ipairs(CostItemList) do
    local IsImportant = false
    if Item.Type == "Mod" then
      UseModAsMaterial = true
      if Item.IsLock then
        HasLockedMod = true
        IsImportant = true
      end
      if Item.Level > 0 then
        HasUpgradedMod = true
        IsImportant = true
      end
      if Item.IsEquipped then
        HasEquipedMod = true
      end
      if IsImportant then
        table.insert(ImportantModList, Item)
      end
    end
  end
  local AsyncFunc = coroutine.create(function()
    local co = coroutine.running()
    local Succeed, Count
    if UseModAsMaterial then
      if HasLockedMod then
        self:ShowHasLockedModConfirmWindow(DraftId, ImportantModList, HasEquipedMod, co)
        Succeed, Count = coroutine.yield()
        if false == Succeed then
          return
        end
      elseif HasUpgradedMod then
        self:ShowHasUpgradedModConfirmWindow(DraftId, ImportantModList, HasEquipedMod, co)
        Succeed, Count = coroutine.yield()
        if false == Succeed then
          return
        end
      else
        self:ShowStartProduceConfirmWindow(DraftId, HasEquipedMod, co)
        Succeed, Count = coroutine.yield()
        if false == Succeed then
          return
        end
      end
    elseif ShouldShowBatchProduceWindow then
      self:ShowStartBatchProduceConfirmWindow(DraftId, co)
      Succeed, Count = coroutine.yield()
      if false == Succeed then
        return
      end
    else
      self:ShowStartProduceConfirmWindow(DraftId, false, co)
      Succeed = coroutine.yield()
      if false == Succeed then
        return
      end
    end
    self:RequestStartProduce(DraftId, CostItemList or {}, Count or 1)
  end)
  local Succeed, Ret = coroutine.resume(AsyncFunc)
  assert(Succeed, Ret)
end

function WBP_ForgeMain_C:ShowImportantItemCostConfirmWindow(DraftId, ImportantItemList, PopupId, HasEquipedMod, co)
  local CommonDialogParams = {}
  local DraftData = DataMgr.Draft[DraftId]
  local PopupData = DataMgr.CommonPopupUIContext[PopupId]
  local PopoverText = PopupData.PopoverText
  local ProductName = GText(ForgeModel:GetProductNameByTypeAndId(DraftData.ProductType, DraftData.ProductId))
  if DraftData.ProductNum and DraftData.ProductNum > 1 then
    ProductName = ProductName .. " x" .. tostring(DraftData.ProductNum)
  end
  CommonDialogParams.ItemList = {}
  for _, ImportantMod in ipairs(ImportantItemList) do
    table.insert(CommonDialogParams.ItemList, {
      ItemType = "Mod",
      ItemId = ImportantMod.Id,
      ItemUuid = ImportantMod.Uuid,
      ItemNum = ImportantMod.Count
    })
  end
  CommonDialogParams.LargeSizeItem = true
  CommonDialogParams.ShortText = string.format(GText(PopoverText), ProductName)
  CommonDialogParams.HideItemTips = not HasEquipedMod
  
  function CommonDialogParams.RightCallbackFunction()
    self:ContinueCoroutine(co, true)
  end
  
  function CommonDialogParams.LeftCallbackFunction()
    self:ContinueCoroutine(co, false)
  end
  
  self:ShowConfirmWindow(PopupId, CommonDialogParams, self)
end

function WBP_ForgeMain_C:ShowHasLockedModConfirmWindow(DraftId, ImportantModList, HasEquipedMod, co)
  self:ShowImportantItemCostConfirmWindow(DraftId, ImportantModList, Const.Popup_ConfirmLockedMod, HasEquipedMod, co)
end

function WBP_ForgeMain_C:ShowHasUpgradedModConfirmWindow(DraftId, ImportantModList, HasEquipedMod, co)
  self:ShowImportantItemCostConfirmWindow(DraftId, ImportantModList, Const.Popup_ConfirmUpgradedMod, HasEquipedMod, co)
end

function WBP_ForgeMain_C:ShowCancelProduceConfirmWindow(DraftId)
  local CommonDialogParams = {}
  local CancelParams = {
    ReturnItemList = {}
  }
  local DraftInfo = ForgeModel:GetDraftInfoById(DraftId)
  local CompleteNum = DraftInfo.DraftCompleteNum
  local DoingNum = DraftInfo.DraftDoingNum
  local DraftData = DataMgr.Draft[DraftId]
  for _, ResItem in ipairs(DraftData.Resource) do
    local ItemId = ResItem.Id
    local ItemNum = ResItem.Num * DoingNum
    local ItemType = ResItem.Type or "Resource"
    table.insert(CancelParams.ReturnItemList, {
      ItemId = ItemId,
      ItemNum = ItemNum,
      ItemType = ItemType
    })
  end
  for FoundryId, FoundryCost in pairs(DraftData.FoundryCost) do
    table.insert(CancelParams.ReturnItemList, {
      ItemId = FoundryId,
      ItemNum = FoundryCost * DoingNum,
      ItemType = "Resource"
    })
  end
  if CompleteNum > 0 then
    CancelParams.CompleteItem = {
      ItemId = DraftData.ProductId,
      ItemNum = DraftData.ProductNum * CompleteNum,
      ItemType = DraftData.ProductType
    }
  end
  CommonDialogParams.CancelParams = CancelParams
  
  function CommonDialogParams.RightCallbackFunction()
    self:RequestCancelProduce(DraftId)
  end
  
  self:ShowConfirmWindow(Const.Popup_CancelProduce, CommonDialogParams, self)
end

function WBP_ForgeMain_C:ShowAccerateProduceConfirmWindow(DraftId)
  local CommonDialogParams = {}
  local PopupData = DataMgr.CommonPopupUIContext[Const.Popup_AccerateProduce]
  local PopoverText = PopupData.PopoverText
  local AccelerateCostType = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  CommonDialogParams.ShortText = string.format(GText(PopoverText), GText(ForgeModel:GetProductNameByTypeAndId("Resource", AccelerateCostType)), ForgeModel:GetAccerateCost(DraftId))
  
  function CommonDialogParams.RightCallbackFunction()
    self:RequestAccerateProduce(DraftId)
  end
  
  self:ShowConfirmWindow(Const.Popup_AccerateProduce, CommonDialogParams, self)
end

function WBP_ForgeMain_C:ShowCompleteProduceWindow(DraftIDs)
  local Params = {}
  local WeaponIds = {}
  for DraftId, CompleteNum in pairs(DraftIDs) do
    local DraftData = DataMgr.Draft[DraftId]
    local ItemId = DraftData.ProductId
    local ItemNum = DraftData.ProductNum * CompleteNum
    local ItemType = DraftData.ProductType .. "s"
    if DraftData.ProductType == "Weapon" then
      local WeaponData = DataMgr.Weapon[ItemId]
      if WeaponData and WeaponData.WeaponRarity >= 5 then
        table.insert(WeaponIds, ItemId)
      end
    end
    Params[ItemType] = Params[ItemType] or {}
    Params[ItemType][ItemId] = ItemNum
  end
  self:SetEnableBtnStartClicked(false)
  
  local function Callback()
    self:RefreshItemsView()
    self:SetInputUIOnly(true)
    self:SetEnableBtnStartClicked(true)
  end
  
  self:ShowGetItemWindow(Params, Callback)
end

function WBP_ForgeMain_C:ShowCancelProduceWindow(DraftId, InCount, Count)
  local Params = {}
  local DraftData = DataMgr.Draft[DraftId]
  if Count and Count > 0 then
    local ItemId = DraftData.ProductId
    local ItemNum = DraftData.ProductNum
    local ItemType = DraftData.ProductType .. "s"
    Params[ItemType] = Params[ItemType] or {}
    Params[ItemType][ItemId] = ItemNum
  end
  if InCount and InCount > 0 then
    for Index, ResItem in ipairs(DraftData.Resource) do
      local ItemId = ResItem.Id
      local ItemType = (ResItem.Type or "Resource") .. "s"
      local ItemNum = ResItem.Num * InCount
      Params[ItemType] = Params[ItemType] or {}
      Params[ItemType][ItemId] = ItemNum
    end
    for FoundryId, FoundryCount in pairs(DraftData.FoundryCost) do
      Params.Resources = Params.Resources or {}
      Params.Resources[FoundryId] = FoundryCount * InCount
    end
  end
  
  local function Callback()
    self:RefreshItemsView()
    self:SetInputUIOnly(true)
  end
  
  self:ShowGetItemWindow(Params, Callback)
end

function WBP_ForgeMain_C:ShowConfirmWindow(PopupId, Params, ParentWidget)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(PopupId, Params, ParentWidget)
end

function WBP_ForgeMain_C:ShowGetItemWindow(Params, Callback)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Params, false, Callback, self)
end

function WBP_ForgeMain_C:RequestStartProduce(DraftId, CostItemList, ProduceNum)
  local PlayerAvatar = GWorld:GetAvatar()
  local SelectParam = {}
  if CostItemList and #CostItemList > 0 then
    for _, Item in ipairs(CostItemList) do
      if Item.Type == "Mod" then
        if not SelectParam.Mod then
          SelectParam.Mod = {}
        end
        SelectParam.Mod[Item.Id] = SelectParam.Mod[Item.Id] or {}
        SelectParam.Mod[Item.Id][Item.Uuid] = Item.Count
        DebugPrint("Tianyi@ Uuid = " .. CommonUtils.Str2ObjId(Item.Uuid))
      end
    end
    DebugPrint("Tianyi@ RequstStartProduce, CostItemList = ")
    PrintTable(SelectParam, 10)
  end
  PlayerAvatar:StartProduct(DraftId, SelectParam, ProduceNum)
  self:BlockAllUIInput(true)
  if ForgeModel:IsDraftSetTarget(DraftId) then
    ForgeModel:RemoveDraftFromTarget(DraftId)
  end
end

function WBP_ForgeMain_C:TryBatchComplete()
  if self.CanBatchComplete then
    self:RequestBatchComplete()
  end
end

function WBP_ForgeMain_C:RequestBatchComplete()
  local TabType = self:GetCurrentTabType()
  local SubTabType = self:GetCurrentSubTabType()
  local CurrentCompeletedDraftIds = ForgeModel:GetCompletedDraftIdsByFilter(TabType, SubTabType)
  local PlayerAvatar = GWorld:GetAvatar()
  PlayerAvatar:GetAllDraftCompleteReward(CurrentCompeletedDraftIds)
  self:BlockAllUIInput(true)
end

function WBP_ForgeMain_C:RequestCancelProduce(DraftId)
  local PlayerAvatar = GWorld:GetAvatar()
  PlayerAvatar:CancelProduct(DraftId)
  self:BlockAllUIInput(true)
end

function WBP_ForgeMain_C:RequestAccerateProduce(DraftId)
  local PlayerAvatar = GWorld:GetAvatar()
  PlayerAvatar:AccelerateProduct(DraftId)
  self:BlockAllUIInput(true)
end

function WBP_ForgeMain_C:RequestCompleteProduce(DraftId)
  local PlayerAvatar = GWorld:GetAvatar()
  PlayerAvatar:CompleteProduct(DraftId)
  self:BlockAllUIInput(true)
end

function WBP_ForgeMain_C:OnStartProduce(DraftId, Ret)
  DebugPrint("Tianyi@ ForgeMain: StartProduce ", DraftId)
  if not ErrorCode:Check(Ret) then
    self:BlockAllUIInput(false)
    return
  end
  ForgeModel:OnDraftStartProduce(DraftId)
  self:RefreshItemsView()
  self:BlockAllUIInput(false)
end

function WBP_ForgeMain_C:OnCompleteProduce(DraftIds, Ret)
  DebugPrint("Tianyi@ ForgeMain: CompleteProduce ", DraftId)
  if not ErrorCode:Check(Ret) then
    self:BlockAllUIInput(false)
    return
  end
  self:ShowCompleteProduceWindow(DraftIds)
  self:UpdateBatchCompleteButton()
  self:BlockAllUIInput(false)
end

function WBP_ForgeMain_C:OnCancelProduce(DraftId, Ret, InCount, Count)
  DebugPrint("Tianyi@ OnCancelProduce " .. DraftId .. " " .. Ret)
  if not ErrorCode:Check(Ret) then
    self:BlockAllUIInput(false)
    return
  end
  ForgeModel:OnDraftCancelProduce(DraftId)
  self:RefreshItemsView()
  self:ShowCancelProduceWindow(DraftId, InCount, Count)
  self:BlockAllUIInput(false)
end

function WBP_ForgeMain_C:OnBlueComplete(DraftId)
  self:RefreshItemsView()
  self:UpdateBatchCompleteButton()
end

function WBP_ForgeMain_C:OnAccerateProduce(DraftId, Ret)
  if not ErrorCode:Check(Ret) then
    self:BlockAllUIInput(false)
    return
  end
  self:RefreshItemsView()
  self:UpdateBatchCompleteButton()
  self:BlockAllUIInput(false)
end

function WBP_ForgeMain_C:OnReturnKeyDown()
  if self.IsShowingDraftPathView then
    self.Forging_Path_PC:OnBtnCloseClicked()
  else
    self:OnClose()
  end
end

function WBP_ForgeMain_C:SwitchCamera(bNpcCamera)
  local Avatar = GWorld:GetAvatar()
  local IsHome = Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
  if IsHome then
    UIManager(self):SwitchFixedCamera(bNpcCamera, ForgeNPCId, "Forge", self, "ForgeMain")
  else
    UIManager(self):SwitchUINpcCamera(bNpcCamera, "ForgeMain", ForgeNPCRegionId, {bDestroyNpc = true, IsHaveInOutAnim = false})
  end
end

function WBP_ForgeMain_C:OnClose()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self.IsClosing then
    return
  end
  self.IsClosing = true
  self:PlayAnimation(self.Out)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetActorHideTag("Forge", false)
  local Avatar = GWorld:GetAvatar()
  local IsHome = Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
  if IsHome then
    self:SwitchCamera()
    local ForgeNPC = UE4.ANpcCharacter.GetNpc(self, ForgeNPCId)
    if ForgeNPC then
      if ForgeNPC.NPCNameWidgetComponent then
        local NameWidget = ForgeNPC.NPCNameWidgetComponent:GetWidget()
        if NameWidget then
          NameWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
      if ForgeNPC.BubbleWidgetComponent then
        local BubbleWidget = ForgeNPC.BubbleWidgetComponent:GetWidget()
        if BubbleWidget then
          BubbleWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
      ForgeNPC:PlayUITalkAction(21000202)
    end
  else
    self:SwitchCamera()
  end
  AudioManager(self):SetEventSoundParam(self, "ForgeMainIn", {ToEnd = 1})
  ForgeModel:ClearNewRedDots()
end

function WBP_ForgeMain_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    local Avatar = GWorld:GetAvatar()
    local IsHome = Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
    self:Close()
  end
end

function WBP_ForgeMain_C:OnModFilterChanged(SelectedItems, ItemDatas)
  self.CommonFilterData = {FilterSelectedItems = SelectedItems, FilterItemDatas = ItemDatas}
  self:UpdateForgeContent()
end

function WBP_ForgeMain_C:Close()
  self:RemoveDispatcher(EventID.OnStartProduce)
  self:RemoveDispatcher(EventID.OnCompleteProduce)
  self:RemoveDispatcher(EventID.OnAccerateProduce)
  self:UnBindReddotTreeEvents()
  EventManager:FireEvent(EventID.OnMainUIReddotUpdate)
  self.Super.Close(self)
end

function WBP_ForgeMain_C:Destruct()
  AudioManager(self):StopSystemUIBGM("ForgeMain")
  self.RemoveTimer(self.RefreshTimer)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:SetCanInteractiveTrigger(true)
  end
  self:EnableTickWhenPaused(false)
  self.Super.Destruct(self)
end

function WBP_ForgeMain_C:ShowError(ErrorCode)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowError(ErrorCode)
end

function WBP_ForgeMain_C:EnableTickWhenPaused(Value)
  local TweenActor = UE4.ALTweenActor.GetLTweenInstance(self:GetWorld())
  if Value then
    if TweenActor then
      TweenActor:SetTickableWhenPaused(true)
    end
  elseif TweenActor then
    TweenActor:SetTickableWhenPaused(false)
  end
end

function WBP_ForgeMain_C:GetCurrentTabType()
  local TabType = self.TabIdx2TabType[self.TabIndex]
  return TabType
end

function WBP_ForgeMain_C:GetCurrentSubTabType()
  local SubTabType = self.SubTabIndex and self.TabIdx2SubTabType[self.TabIndex][self.SubTabIndex] or nil
  return SubTabType
end

function WBP_ForgeMain_C:GetEntryFromItem(Item)
  if Item then
    local ItemIndex = self.ForgeContent:GetIndexForItem(Item)
    local Entry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.ForgeContent, ItemIndex)
    return Entry
  end
  return nil
end

function WBP_ForgeMain_C:AddWidgetHiddenTag(Widget, IsHide, Tag)
  self.WidgetHiddenTags = self.WidgetHiddenTags or {}
  if not self.WidgetHiddenTags[Widget] then
    self.WidgetHiddenTags[Widget] = {}
  end
  if IsHide then
    self.WidgetHiddenTags[Widget][Tag] = true
  else
    self.WidgetHiddenTags[Widget][Tag] = nil
  end
  if next(self.WidgetHiddenTags[Widget]) then
    Widget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    Widget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ForgeMain_C:OnCompendiumClicked()
  local UI = UIManager(self):LoadUINew("ForgeCompenduim", self:GetCurrentTabType())
end

AssembleComponents(WBP_ForgeMain_C)
return WBP_ForgeMain_C
