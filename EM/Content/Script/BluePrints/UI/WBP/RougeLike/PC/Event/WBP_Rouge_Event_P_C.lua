require("UnLua")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.DialogueList = {}
  self.Btn_Next.OnClicked:Add(self, self.OnIteratorDialogue)
  self.CanInteractChoices = true
  
  function self.Callback()
    if self.NextEventId then
      self.StoryPath = DataMgr.RougeLikeRoom[self.NextEventId].EventStoryline
      self.NextEventId = nil
      self.CurStory = GWorld.StoryMgr:RunStory(self.StoryPath, nil, nil, self.Callback, self.Callback)
    elseif type(self.ArchiveInfo) == "table" and not self.IsRealClose then
      self:ReplayThisEvent()
    else
      self:Close()
    end
  end
  
  self:BindToAnimationFinished(self.Slow_In, {
    self,
    function()
      self.CurStory = GWorld.StoryMgr:RunStory(self.StoryPath, nil, nil, self.Callback, self.Callback)
    end
  })
  self:BindToAnimationFinished(self.Fast_In, {
    self,
    function()
      self.CurStory = GWorld.StoryMgr:RunStory(self.StoryPath, nil, nil, self.Callback, self.Callback)
    end
  })
  self.List_Chat:ClearChildren()
  local Avatar = GWorld:GetAvatar()
  self.CoinId = Avatar and Avatar:GetCurrentRougeLikeTokenId() or 0
  self.IsSkipping = false
  self.CanInteractDialogue = false
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  local Param = (...)
  if Param[1] then
    self.RoomId = Param[1]
  elseif GWorld.RougeLikeManager then
    self.RoomId = GWorld.RougeLikeManager.RoomId
  end
  if Param[2] then
    self.StoryId = Param[2]
  end
  if Param[3] then
    self.ArchiveInfo = Param[3]
    if type(self.ArchiveInfo) == "table" then
      self.IsArchiveEvent = true
    end
  end
  if Param[4] then
    self.IsClientEvent = Param[4]
  end
  if Param[5] then
    self.HideResourceBar = Param[5]
  end
  DebugPrint(self.RoomId, "\230\136\191\233\151\180ID")
  self:SetFocus()
  self:InitListenEvent()
  if self.StoryId then
    self.StoryPath = DataMgr.RougeLikeStoryEvent[self.StoryId].EventStoryline
  else
    self.StoryPath = DataMgr.RougeLikeRoom[self.RoomId].EventStoryline
  end
  DebugPrint("\232\175\187\229\143\150\231\154\132StoryPath", self.StoryPath)
  self:InitBagBtn()
  self:InitSkipBtn()
  self:InitResourceBar()
  self:UpdateBottomKeyInfo()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_show", "SwitchRougeEvent", nil)
  local EventBG, RoomTypeName, RoomName
  if self.StoryId then
    EventBG = DataMgr.RougeLikeStoryEvent[self.StoryId].EventMainIcon
    RoomTypeName = DataMgr.RougeLikeStoryEvent[self.StoryId].StoryEventType
    RoomName = DataMgr.RougeLikeStoryEvent[self.StoryId].StoryEventName
    self.Panel_StoryEvent:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_NormalEvent:SetVisibility(ESlateVisibility.Collapsed)
  else
    EventBG = DataMgr.RougeLikeRoom[self.RoomId].EventMainIcon
    local RoomType = DataMgr.RougeLikeRoom[self.RoomId].RoomType
    RoomTypeName = DataMgr.RougeLikeRoomType[RoomType].Name
    RoomName = DataMgr.RougeLikeRoom[self.RoomId].Name
    self.Panel_StoryEvent:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_NormalEvent:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if EventBG then
    self.LastEventBG = EventBG
    UE.UResourceLibrary.LoadObjectAsync(self, EventBG, {
      self,
      M.OnEventBGIconLoadFinish
    })
  end
  self.Text_Type:SetText(GText(RoomTypeName))
  self.Text_Name:SetText(GText(RoomName))
  if self.ArchiveInfo then
    self:InitArchiveGroup()
    if self.IsArchiveEvent then
      self:InitEventList()
    else
      self.VB_List:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Text_EventEmpty:SetText(GText("RLArchive_EventUnlock"))
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:InitResourceBar()
  if self.HideResourceBar then
    self.Panel_ResourceBar:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Panel_ResourceBar:ClearChildren()
  self.ResourceBarWidget = self:CreateWidgetNew("ResourceBarNode")
  self.Panel_ResourceBar:AddChild(self.ResourceBarWidget)
  self.ResourceBarWidget:InitResourceBar({
    self.CoinId
  })
  local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic")
  self.ResourceBarWidget:SetGamePadKeyImgByPath(ResourceBarIcon)
end

function M:InitBagBtn()
  if self.HideResourceBar then
    self.Btn_Bag:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if self.Btn_Bag then
    self.Btn_Bag.Text_Btn:SetText(GText("UI_RougeLike_Bag"))
    self.Btn_Bag.Btn_Click.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_small_click", nil, nil)
      UIManager(self):LoadUINew("RougeBag")
    end)
    self.Btn_Bag.Btn_Click.OnHovered:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
    end)
    self.Btn_Bag.Key_Bag:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
  end
end

function M:InitSkipBtn()
  if self.Btn_Skip then
    self.Btn_Skip:BindEventOnClicked(self, self.SkipEvent)
    self.Btn_Skip:SetCurrentTextBlock(GText("UI_TALK_SKIP_MOIILE"))
  end
end

function M:UpdateBottomKeyInfo()
  if self.Btn_Skip then
    if not self.ArchiveInfo then
      self.Btn_Skip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Btn_Skip:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if not self.Com_KeyTips then
    return
  end
  if self.ArchiveInfo then
    self.Com_KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Com_KeyTips:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Com_KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_Controller_Slide")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "X"}
        },
        Desc = GText("UI_TALK_SKIP_MOIILE")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
      }
    })
  else
    self.Com_KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.SkipEvent,
            Owner = self
          }
        },
        Desc = GText("UI_TALK_SKIP"),
        bLongPress = true
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.OnIteratorDialogue,
            Owner = self
          }
        },
        Desc = GText("UI_REGISTER_CONTINUE")
      }
    })
  end
end

function M:HideSkipKeyInfo()
  if self.Btn_Skip then
    self.Btn_Skip:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.IsSkipKeyHide = true
  if not self.Com_KeyTips then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Com_KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_Controller_Slide")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
      }
    })
  else
    if self.Com_KeyTips.Panel_Key:GetChildAt(0) then
      self.Com_KeyTips.Panel_Key:GetChildAt(0):OnButtonReleased()
    end
    self.Com_KeyTips:UpdateKeyInfoNew({})
  end
end

function M:InitArchiveGroup()
  self.Group_Archive:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  local ComTab = self.Com_Tab_P or self.Com_Tab_M
  local TabConfigData = {
    PlatformName = self.PlatformName,
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.ArchiveClose,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_Controller_Slide"),
        bLongPress = false
      },
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.ArchiveClose,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  if self.StoryId then
    TabConfigData.TitleName = string.format(GText("RLArchive_StorySubtitle"), self.Text_Name:GetText())
  else
    TabConfigData.TitleName = string.format(GText("RLArchive_EventSubtitle"), self.Text_Name:GetText())
  end
  ComTab:Init(TabConfigData)
  self.Btn_Bag:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_ResourceBar:SetVisibility(ESlateVisibility.Collapsed)
end

function M:InitEventList()
  self.VB_List:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.List_EventTab:ClearListItems()
  local CurIndex
  for Index, Data in ipairs(self.ArchiveInfo) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Index = Index - 1
    Obj.IsUnlocked = Data.IsUnlocked
    Obj.Name = Data.Name
    Obj.EventId = Data.EventId
    Obj.IsSelected = Obj.EventId == self.RoomId
    Obj.Parent = self
    self.List_EventTab:AddItem(Obj)
    if Obj.IsSelected then
      CurIndex = Index - 1
    end
  end
  self:AddDelayFrameFunc(function()
    self.List_EventTab:SetSelectedIndex(CurIndex)
  end, 2)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
    local CurScrollOffset = self.List_Chat:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - a, 0, self.List_Chat:GetScrollOffsetOfEnd())
    self.List_Chat:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  local IsRepeat = UKismetInputLibrary.InputEvent_IsRepeat(InputEvent)
  if IsRepeat then
    return UIUtils.UnHandled
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "SpaceBar" == InKeyName and not self.ArchiveInfo then
    IsEventHandled = true
    if not self.IsSkipKeyHide then
      self:SetFocus()
      self.Com_KeyTips.Panel_Key:GetChildAt(0):OnButtonPressed(nil, true, 0, 0.5)
    end
  end
  if IsEventHandled then
    return UIUtils.Handled
  else
    return UIUtils.UnHandled
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint(InKeyName, "@zyh")
  if InKeyName == Const.GamepadSpecialRight then
    UIManager(self):LoadUINew("RougeBag")
  elseif InKeyName == Const.GamepadFaceButtonLeft and not self.ArchiveInfo and not self.IsSkipKeyHide then
    self:SkipEvent()
  elseif InKeyName == Const.GamepadRightThumbstick then
    self.ResourceBarWidget:SetLastFocusWidget(self.FirstSelectItem or self.Btn_Next)
    self.ResourceBarWidget:SetFocus()
  elseif ("Escape" == InKeyName or InKeyName == Const.GamepadFaceButtonRight) and self.ArchiveInfo then
    self:ArchiveClose()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint(InKeyName, "OnKeyUp @zyh")
  if "SpaceBar" == InKeyName and not self.ArchiveInfo then
    if not self.IsSkipKeyHide then
      self.Com_KeyTips.Panel_Key:GetChildAt(0):OnButtonReleased()
    end
    self:OnIteratorDialogue()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(...)
  if self.ArchiveInfo then
    self:PlayAnimation(self.Fast_In)
  else
    self:PlayAnimation(self.Slow_In)
  end
  self:PlayAnimation(self.Loop, 0, 0)
  self.Event:PlayAnimation(self.Event.Loop, 0, 0)
end

function M:OnEventBGIconLoadFinish(Object)
  if IsValid(self) and Object then
    if self.StoryId then
      local StoryEventMat = self.Img_StoryEvent:GetDynamicMaterial()
      StoryEventMat:SetTextureParameterValue("MainTex", Object)
    else
      local EventItemMat = self.Event.Img_Icon:GetDynamicMaterial()
      local EventBgMat = self.Img_Event:GetDynamicMaterial()
      local EventIconColorMat = self.Event.Img_Icon_Color:GetDynamicMaterial()
      EventItemMat:SetTextureParameterValue("IconMap", Object)
      EventBgMat:SetTextureParameterValue("IconMap", Object)
      EventIconColorMat:SetTextureParameterValue("DissolveTex", Object)
      local EventOldItemMat = self.Event_Old.Img_Icon:GetDynamicMaterial()
      local EventOldIconColorMat = self.Event_Old.Img_Icon_Color:GetDynamicMaterial()
      EventOldItemMat:SetTextureParameterValue("IconMap", Object)
      EventOldIconColorMat:SetTextureParameterValue("DissolveTex", Object)
      local EventStackItemMat = self.Event_Stack.Img_Icon:GetDynamicMaterial()
      local EventStackIconColorMat = self.Event_Stack.Img_Icon_Color:GetDynamicMaterial()
      EventStackItemMat:SetTextureParameterValue("IconMap", Object)
      EventStackIconColorMat:SetTextureParameterValue("DissolveTex", Object)
    end
  end
end

function M:OnLastEventBGIconLoadFinish(Object)
  if not Object or not IsValid(self) then
    return
  end
  local StoryEventMat = self.Img_StoryEvent_F:GetDynamicMaterial()
  StoryEventMat:SetTextureParameterValue("MainTex", Object)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnHomeBaseBtnPlayAnim, self, self.SetFocusWhenCloseAward)
  self:AddDispatcher(EventID.OnRougeDisplayDialogue, self, self.OnRougeDisplayDialogue)
  self:AddDispatcher(EventID.OnRougeDisplayOptions, self, self.OnRougeDisplayOptions)
  self:AddDispatcher(EventID.OnRougeEventGetToken, self, self.OnRougeGetToken)
end

function M:OnRougeDisplayDialogue(DialogueData)
  self.CanInteractDialogue = true
  local DialogueId = DialogueData.DialogueId
  local TalkActorName = GText(DataMgr.Dialogue[DialogueId].SpeakNpcName)
  local TalkActorId = DialogueData.TalkActorId
  if not TalkActorName and TalkActorId then
    TalkActorName = self:GetDialogueSpeakerName(DialogueData)
  end
  local CurrentTalkType = DataMgr.Dialogue[DialogueId].RougeTalkActorType
  DebugPrint("\229\155\158\232\176\131OnRougeDisplayDialogue", "\232\175\180\232\175\157\232\128\133\228\191\161\230\129\175\239\188\154", TalkActorName, TalkActorId, CurrentTalkType, "\232\175\180\232\175\157\229\134\133\229\174\185:", DialogueData.Content)
  local RougeDialogueMainIcon = DataMgr.Dialogue[DialogueId].RougeDialogueMainIcon
  if RougeDialogueMainIcon then
    self.RougeDialogueMainIcon = RougeDialogueMainIcon
    self:PlayAnimation(self.Story_Change)
    UE.UResourceLibrary.LoadObjectAsync(self, self.RougeDialogueMainIcon, {
      self,
      M.OnEventBGIconLoadFinish
    })
    UE.UResourceLibrary.LoadObjectAsync(self, self.LastEventBG, {
      self,
      M.OnLastEventBGIconLoadFinish
    })
    self.LastEventBG = self.RougeDialogueMainIcon
  end
  self:AddDialogue(TalkActorName, CurrentTalkType, DialogueData.Content)
  if not self.ArchiveInfo and self.IsSkipKeyHide then
    self.IsSkipKeyHide = false
    self:UpdateBottomKeyInfo()
  end
  if self.IsSkipping and DialogueData.IsLastText then
    self:StopSkipEvent()
  end
end

function M:AddDialogue(TalkActorName, CurrentTalkType, Content, IsAnswer)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_line_pop_up", nil, nil)
  local OneChatInfo = {
    TalkActorName = TalkActorName,
    CurrentTalkType = CurrentTalkType,
    Content = Content,
    IsAnswer = IsAnswer,
    Parent = self
  }
  local OneChatItem
  if IsAnswer then
    OneChatItem = UE4.UWidgetBlueprintLibrary.Create(self, self.ChatSelectionItem)
  else
    OneChatItem = UE4.UWidgetBlueprintLibrary.Create(self, self.ChatItem)
  end
  self.List_Chat:AddChild(OneChatItem)
  OneChatItem:InitUI(OneChatInfo)
  self.LastChatItem = OneChatItem
  self.Arrow:SetVisibility(ESlateVisibility.HitTestInvisible)
  if not IsAnswer then
    self:AddDelayFrameFunc(function()
      self.List_Chat:ScrollWidgetIntoView(self.LastChatItem, true)
    end, 2)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local FocusItem
    FocusItem = type(self.ArchiveInfo) == "table" and self.List_EventTab or self.Btn_Next
    FocusItem:SetFocus()
  end
end

function M:OnRougeDisplayOptions(OptionTexts)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_select_btn_show", nil, nil)
  self.CanInteractDialogue = false
  self.Arrow:SetVisibility(ESlateVisibility.Collapsed)
  self.OptionTexts = OptionTexts
  self.WBox_Selection:ClearChildren()
  self.OptionsNum = CommonUtils.Size(OptionTexts)
  for Index = 1, self.OptionsNum do
    local SelectResultDesc, SelectId
    if self.StoryId then
      if DataMgr.RougeLikeStoryEvent[self.StoryId].SelectResultDesc and DataMgr.RougeLikeStoryEvent[self.StoryId].SelectResultDesc[Index] then
        SelectResultDesc = GText(DataMgr.RougeLikeStoryEvent[self.StoryId].SelectResultDesc[Index])
      end
    elseif OptionTexts[Index].IsKeyOption then
      SelectId = DataMgr.RougeLikeRoom[self.RoomId].EventSelect[tonumber(Index)]
      SelectResultDesc = GText(DataMgr.RougeLikeEventSelect[SelectId].SelectResultDesc)
    end
    local IsKeyOption = OptionTexts[Index].IsKeyOption
    local SelectionInfo = {
      SelectionText = OptionTexts[Index].Text,
      IsKeyOption = IsKeyOption,
      DescribeText = SelectResultDesc,
      SelectId = SelectId,
      DialogueId = OptionTexts[Index].DialogueId,
      SelectIndex = Index,
      IsFromArchive = self.ArchiveInfo,
      Parent = self
    }
    local SelectionItem
    if SelectionInfo.IsKeyOption and SelectResultDesc then
      SelectionItem = UE4.UWidgetBlueprintLibrary.Create(self, self.EventSelectItem)
    else
      SelectionItem = UE4.UWidgetBlueprintLibrary.Create(self, self.EventSelectItemNormal)
    end
    self.WBox_Selection:AddChild(SelectionItem)
    SelectionItem:InitUI(SelectionInfo)
    if 1 == Index then
      self.FirstSelectItem = SelectionItem
    end
    if type(self.ArchiveInfo) == "table" then
      SelectionItem.Btn_Click:SetNavigationRuleExplicit(EUINavigation.Left, self.List_EventTab)
      self.List_EventTab:SetNavigationRuleExplicit(EUINavigation.Right, self.FirstSelectItem)
    end
  end
  self:AddDelayFrameFunc(function()
    if self.FirstSelectItem then
      self.FirstSelectItem.Btn_Click:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    end
  end, 2)
  self:AddTimer(self.FirstSelectItem.In:GetEndTime(), function()
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.FirstSelectItem then
      self.FirstSelectItem.Btn_Click:SetFocus()
    end
    self.List_Chat:ScrollWidgetIntoView(self.LastChatItem, true)
  end)
  if self.OptionsNum > 1 and not self.ArchiveInfo then
    self:HideSkipKeyInfo()
  end
  if self.IsSkipping then
    if 1 == self.OptionsNum and not OptionTexts[self.OptionsNum].IsLastOption then
      self.FirstSelectItem:OnBtnClicked()
    else
      self:StopSkipEvent()
    end
  end
end

function M:OnIteratorDialogue()
  if not self.CanInteractDialogue then
    return
  end
  if self.LastChatItem then
    self.LastChatItem:SetRenderOpacity(0.5)
  end
  DebugPrint("Iterator\232\162\171\231\130\185\229\135\187")
  EventManager:FireEvent(EventID.OnRougeIteratorDialogue)
end

function M:ChooseEvent(EventId, EventName, IsUnlocked, Index, Item)
  if EventId == self.RoomId then
    return
  else
    self.RoomId = EventId
    self.StoryPath = DataMgr.RougeLikeRoom[EventId].EventStoryline
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/difficulty_click", nil, nil)
  self.Text_Name:SetText(GText(EventName))
  self.List_EventTab:SetSelectedIndex(Index)
  self.List_EventTab:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_Chat:ClearChildren()
  self.WBox_Selection:ClearChildren()
  self.FirstSelectItem = nil
  self:PlayAnimation(self.Change)
  local ComTab = self.Com_Tab_P or self.Com_Tab_M
  local TitleName = string.format(GText("RLArchive_EventSubtitle"), GText(DataMgr.RougeLikeRoom[EventId].Name))
  ComTab:UpdateTopTitle(TitleName)
  if IsUnlocked then
    self.CanInteractDialogue = true
    self.Event:PlayAnimation(self.Event.Normal)
    self.Event_Old:PlayAnimation(self.Event_Old.Normal)
    self.Event_Stack:PlayAnimation(self.Event_Stack.Normal)
    self.Panel_Info:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
    if ComTab.UpdateBottomKeyInfo then
      ComTab:UpdateBottomKeyInfo({
        {
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "RV"}
          },
          Desc = GText("UI_Controller_Slide"),
          bLongPress = false
        },
        {
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "A"}
          },
          Desc = GText("UI_Tips_Ensure"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.ArchiveClose,
              Owner = self
            }
          },
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      })
    end
  else
    self.CanInteractDialogue = false
    self.Event:PlayAnimation(self.Event.Lock)
    self.Event_Old:PlayAnimation(self.Event_Old.Lock)
    self.Event_Stack:PlayAnimation(self.Event_Stack.Lock)
    self.Panel_Info:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if ComTab.UpdateBottomKeyInfo then
      ComTab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.ArchiveClose,
              Owner = self
            }
          },
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      })
    end
  end
  self.NextEventId = EventId
  GWorld.StoryMgr:StopStoryline(self.CurStory)
end

function M:ReplayThisEvent()
  self.NextEventId = self.RoomId
  self.List_EventTab:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.FirstSelectItem = nil
  self:PlayAnimation(self.Text_Out)
  self:AddTimer(self.Text_Out:GetEndTime(), function()
    self.List_Chat:ClearChildren()
    self.WBox_Selection:ClearChildren()
    self:PlayAnimation(self.Text_In)
    self:AddTimer(self.Text_In:GetEndTime(), function()
      self.CanInteractDialogue = true
    end)
    self.CurStory = GWorld.StoryMgr:RunStory(self.StoryPath, nil, nil, self.Callback, self.Callback)
    self.CanInteractDialogue = false
    self.NextEventId = nil
  end)
end

function M:ChooseItem(SelectIndex, IsKeyOption, DialogueId, Content)
  DebugPrint("\230\137\128\233\128\137\229\186\143\229\143\183:", SelectIndex)
  assert(GWorld:GetAvatar(), "\230\151\160\230\179\149\229\143\150\229\190\151Avatar")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(GameMode, "GameMode\228\184\141\229\173\152\229\156\168")
  self.CanInteractChoices = false
  local CurrentTalkType = DataMgr.Dialogue[DialogueId].RougeTalkActorType
  local TalkActorId = DataMgr.Dialogue[DialogueId].SpeakNpcId
  local TalkActorName
  if TalkActorId then
    TalkActorName = GText(DataMgr.Npc[TalkActorId].UnitName)
  end
  self:AddDialogue(TalkActorName, CurrentTalkType, Content, true)
  self.FirstSelectItem = nil
  if self.StoryId then
    if IsKeyOption and not self.ArchiveInfo and not self.IsClientEvent then
      GWorld:GetAvatar():SelectStoryEvent(SelectIndex, function()
        self.CanInteractChoices = true
        self.IsStoryEvent = true
        self.IsDelayDialogue = true
        GWorld:GetAvatar():PassStory()
        EventManager:FireEvent(EventID.OnRougeChooseOption, SelectIndex)
      end)
    else
      self.CanInteractChoices = true
      self.IsDelayDialogue = true
      self.IsStoryEvent = true
      EventManager:FireEvent(EventID.OnRougeChooseOption, SelectIndex)
    end
  elseif IsKeyOption and not self.ArchiveInfo and not self.IsClientEvent then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    local Player = PlayerController:GetMyPawn()
    local Eid = Player.MechanismEid
    local Mechanism = Battle(self):GetEntity(Eid)
    if Mechanism then
      Mechanism:EndInteractive(Player, true)
    end
    GWorld:GetAvatar():SelectEvent(SelectIndex, function(ret)
      self.CanInteractChoices = true
      self.IsDelayDialogue = true
      local CurrentEventId = GWorld.RougeLikeManager.EventId
      DebugPrint("\229\189\147\229\137\141\228\186\139\228\187\182ID\228\184\186\239\188\154", CurrentEventId)
      if CurrentEventId > 0 then
        local GameModeEvent = DataMgr.RougeLikeEventSelect[CurrentEventId].GameModeEvent
        if GameModeEvent then
          GameMode:PostCustomEvent(GameModeEvent)
        end
      end
      EventManager:FireEvent(EventID.OnRougeChooseOption, SelectIndex)
    end)
  else
    self.IsDelayDialogue = true
    self.CanInteractChoices = true
    EventManager:FireEvent(EventID.OnRougeChooseOption, SelectIndex)
  end
  self.List_EventTab:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:SkipEvent()
  if self.IsSkipping then
    return
  end
  self.IsSkipping = true
  if self.SkippingTimer then
    return
  end
  if self.FirstSelectItem and 1 == self.OptionsNum and not self.OptionTexts[self.OptionsNum].IsLastOption then
    self.FirstSelectItem:OnBtnClicked()
  end
  self.SkippingTimer = self:AddTimer(0.01, function()
    self:OnIteratorDialogue()
  end, true, nil, "SkippingEvent")
end

function M:StopSkipEvent()
  self.IsSkipping = false
  if self.SkippingTimer then
    self:RemoveTimer(self.SkippingTimer)
    self.SkippingTimer = nil
  end
end

function M:CloseExcept(OptionIndex)
  local SelectionNum = self.WBox_Selection:GetChildrenCount()
  for Index = 1, SelectionNum do
    local SelectionItem = self.WBox_Selection:GetChildAt(Index - 1)
    if Index ~= OptionIndex then
      SelectionItem:PlayAnimation(SelectionItem.Out)
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  DebugPrint("@zyh \230\137\167\232\161\140OnUpdateUIStyleByInputTypeChange")
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  self:UpdateBottomKeyInfo()
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  if self.FirstSelectItem then
    self.FirstSelectItem.Btn_Click:SetFocus()
  elseif self.List_EventTab then
    self.List_EventTab:SetFocus()
  else
    self.Btn_Next:SetFocus()
  end
  self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:InitKeyboardView()
  self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SetFocusWhenCloseAward()
  self:SetFocus()
end

function M:OnRougeGetToken(TokenNum)
  DebugPrint("@zyh OnRougeGetToken", TokenNum)
end

function M:Close()
  self:StopAnimation(self.Loop)
  self.Event:StopAnimation(self.Event.Loop)
  if self.IsStoryEvent then
    DebugPrint("@zyh \230\152\175\229\137\167\230\131\133\228\186\139\228\187\182 \229\143\145\233\128\129\228\186\139\228\187\182OnRougeLikeStoryEventEnd")
    EventManager:FireEvent(EventID.OnRougeLikeStoryEventEnd)
  end
  if self.ArchiveInfo then
    EventManager:FireEvent(EventID.CloseFromArchiveStory)
  end
  AudioManager(self):SetEventSoundParam(self, "SwitchRougeEvent", {ToEnd = 1})
  self.Super.Close(self)
end

function M:ArchiveClose()
  self.IsRealClose = true
  GWorld.StoryMgr:StopStoryline(self.CurStory)
end

function M:GetDialogueSpeakerName(DialogueData)
  local Name
  if DialogueData.TalkActorName then
    Name = DialogueData.TalkActorName
  else
    local TalkActorData = DialogueData.TalkActorData
    DebugPrint("@zyh\231\177\187\229\158\139", DialogueData.TalkActorId)
    if not TalkActorData then
      Name = TalkUtils:GetTalkActorName("Npc", DialogueData.TalkActorId)
    else
      Name = TalkUtils:GetTalkActorName(TalkActorData.TalkActorType, TalkActorData.TalkActorId)
    end
  end
  return GText(Name)
end

function M:Destruct()
  self.Super.Destruct(self)
  self.List_Chat:ClearChildren()
  self.WBox_Selection:ClearChildren()
  self.Event:PlayAnimation(self.Event.Normal)
  self.Event_Old:PlayAnimation(self.Event_Old.Normal)
  self.Event_Stack:PlayAnimation(self.Event_Stack.Normal)
  self.Panel_Info:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.SkippingTimer = nil
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

return M
