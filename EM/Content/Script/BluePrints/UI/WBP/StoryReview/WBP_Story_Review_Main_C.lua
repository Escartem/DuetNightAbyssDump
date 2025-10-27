require("UnLua")
local StoryReviewUtils = require("BluePrints.UI.WBP.StoryReview.StoryReviewUtils")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Callback = (...)
  self:BindEvents()
  self:InitReviewItem()
  self.Text_Review:SetText(GText("UI_TALK_Review"))
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:ReviewIsMobile()
  return CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
end

function M:CreateTalkItem(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Text.WBP_Story_Review_Text"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  self.Scroll_Box:AddChild(TalkWidget)
  local DialogueId = TalkData.DialogueId
  local DialogueConfig = DataMgr.Dialogue[DialogueId]
  TalkWidget.Text_Title:SetText(TalkData.SpeakerName or "")
  local TalkBtn = TalkWidget.Item_Btn
  if DialogueConfig.VoiceName then
    TalkBtn:InitVoiceBtn(TalkData.DialogueId)
    TalkBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local Content = TalkUtils:DialogueIdToContent(DialogueId)
  TalkWidget.Text_Details:SetText(Content)
  TalkWidget.Text_Details:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  TalkWidget.Text_Title:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  TalkWidget.Text_Content:SetVisibility(UE4.ESlateVisibility.Collapsed)
  return TalkWidget
end

function M:CreateBlackScreenItem(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Title.WBP_Story_Review_Title"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  self.Scroll_Box:AddChild(TalkWidget)
  local DialogueId = TalkData.DialogueId
  local Content = TalkUtils:DialogueIdToContent(DialogueId)
  TalkWidget.Text_Title:SetText(Content)
  return TalkWidget
end

function M:CreateVoiceoverItem(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Text.WBP_Story_Review_Text"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  self.Scroll_Box:AddChild(TalkWidget)
  local DialogueId = TalkData.DialogueId
  local DialogueConfig = DataMgr.Dialogue[DialogueId]
  local TalkBtn = TalkWidget.Item_Btn
  if DialogueConfig.VoiceName then
    TalkBtn:InitVoiceBtn(TalkData.DialogueId)
    TalkBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local Content = TalkUtils:DialogueIdToContent(DialogueId)
  TalkWidget.Text_Content:SetText(Content)
  TalkWidget.Text_Details:SetVisibility(UE4.ESlateVisibility.Collapsed)
  TalkWidget.Text_Title:SetVisibility(UE4.ESlateVisibility.Collapsed)
  TalkWidget.Text_Content:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  return TalkWidget
end

function M:CreateNormalOption(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Interaction.WBP_Story_Review_Interaction"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  self.Scroll_Box:AddChild(TalkWidget)
  TalkWidget:InitData(TalkData, self)
  local TalkBtn = TalkWidget.Item_Btn
  if not TalkData.Options or 1 == #TalkData.Options and TalkData.Options[1] == TalkData.HighLightDialogueId then
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    TalkBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    TalkBtn:InitOptionBtn(TalkWidget, self)
  end
  TalkWidget.List:ClearListItems()
  local Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
  Content.DialogueId = TalkData.HighLightDialogueId
  Content.HighDialogueId = TalkData.HighLightDialogueId
  TalkWidget.List:AddItem(Content)
  TalkWidget.List_1:ClearListItems()
  if TalkData.Options and #TalkData.Options > 0 then
    local ItemCount = 0
    for i = 1, #TalkData.Options do
      if TalkData.HighLightDialogueId ~= TalkData.Options[i] then
        Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
        Content.DialogueId = TalkData.Options[i]
        Content.HighDialogueId = TalkData.HighLightDialogueId
        Content.IsSelected = TalkData.PreOptions[TalkData.Options[i]]
        TalkWidget.List_1:AddItem(Content)
        ItemCount = ItemCount + 1
      end
    end
    TalkWidget.ItemCount = ItemCount
  end
  TalkWidget.List_1:SetRenderOpacity(0)
  TalkWidget.List_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  TalkWidget.HB:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local WidgetSize = TalkWidget.Panel.Slot:GetSize()
  local WidgetSizeX = WidgetSize.X
  TalkWidget.Panel.Slot:SetSize(FVector2D(WidgetSizeX, TalkWidget.NormalPanelSizeY))
  return TalkWidget
end

function M:CreateImpressionValueOption(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Interaction.WBP_Story_Review_Interaction"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  TalkWidget:InitData(TalkData, self)
  self.Scroll_Box:AddChild(TalkWidget)
  local TalkBtn = TalkWidget.Item_Btn
  if not TalkData.Options or 1 == #TalkData.Options and TalkData.Options[1] == TalkData.HighLightDialogueId then
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    TalkBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    TalkBtn:InitOptionBtn(TalkWidget, self)
  end
  TalkWidget.List:ClearListItems()
  local Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
  local HighLightDialogueId = TalkData.HighLightDialogueId
  Content.DialogueId = HighLightDialogueId
  Content.HighDialogueId = HighLightDialogueId
  TalkWidget.List:AddItem(Content)
  TalkWidget.List_1:ClearListItems()
  if TalkData.Options and #TalkData.Options > 0 then
    local ItemCount = 0
    for i = 1, #TalkData.Options do
      if TalkData.HighLightDialogueId ~= TalkData.Options[i] then
        Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
        Content.DialogueId = TalkData.Options[i]
        Content.HighDialogueId = HighLightDialogueId
        Content.IsSelected = TalkData.PreOptions[TalkData.Options[i]]
        TalkWidget.List_1:AddItem(Content)
        ItemCount = ItemCount + 1
      end
    end
    TalkWidget.ItemCount = ItemCount
  end
  TalkWidget.List_1:SetRenderOpacity(0)
  TalkWidget.List_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  TalkWidget.HB:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  local WidgetSize = TalkWidget.Panel.Slot:GetSize()
  local WidgetSizeX = WidgetSize.X
  local DialogueConfig = DataMgr.Dialogue[HighLightDialogueId]
  local ImpressionPlusConfig = DataMgr.ImpressionPlus[DialogueConfig.ImprPlusId]
  local RegionConfig = DataMgr.Region[ImpressionPlusConfig.RegionId]
  TalkWidget.Panel.Slot:SetSize(FVector2D(WidgetSizeX, TalkWidget.ImpressionPanelSizeY))
  TalkWidget.Text_Name:SetText(GText(RegionConfig.RegionName))
  local ImpressionConfig = DataMgr.ImpressionConfig[TalkData.ImpressionConfigId]
  local Interval = TalkData.AddValue and "+" or "-"
  TalkWidget.Text_Num:SetText(GText(ImpressionConfig.StatusName) .. Interval .. TalkData.AddValue)
  local IconTexture = LoadObject(ImpressionConfig.StatusCommonIcon)
  local ImgMat = TalkWidget.Img_Icon:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconTex", IconTexture)
  return TalkWidget
end

function M:CreateImpressionCheckOption(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Impression.WBP_Story_Review_Impression"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  TalkWidget:InitData(TalkData, self)
  self.Scroll_Box:AddChild(TalkWidget)
  local TalkBtn = TalkWidget.Item_Btn
  if not TalkData.Options or 1 == #TalkData.Options and TalkData.Options[1] == TalkData.HighLightDialogueId then
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    TalkBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    TalkBtn:InitOptionBtn(TalkWidget, self)
  end
  TalkWidget.List_Item:ClearListItems()
  local Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
  local HighLightDialogueId = TalkData.HighLightDialogueId
  Content.DialogueId = HighLightDialogueId
  Content.HighDialogueId = HighLightDialogueId
  Content.ImpressionConfigId = TalkData.ImpressionConfigId
  Content.PlayerValue = TalkData.PlayerValue
  TalkWidget.List_Item:AddItem(Content)
  TalkWidget.List_Item_1:ClearListItems()
  if TalkData.Options and #TalkData.Options > 0 then
    local ItemCount = 0
    for i = 1, #TalkData.Options do
      if TalkData.HighLightDialogueId ~= TalkData.Options[i] then
        Content = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Interaction_Item.BP_Review_Interaction_Item"))
        Content.DialogueId = TalkData.Options[i]
        Content.HighDialogueId = TalkData.HighLightDialogueId
        Content.IsSelected = TalkData.PreOptions[TalkData.Options[i]]
        Content.ImpressionConfigId = TalkData.ImpressionConfigId
        Content.PlayerValue = TalkData.PlayerValue
        TalkWidget.List_Item_1:AddItem(Content)
        ItemCount = ItemCount + 1
      end
    end
    TalkWidget.ItemCount = ItemCount
  end
  TalkWidget.List_Item_1:SetRenderOpacity(0)
  TalkWidget.List_Item_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Both = 0
  if TalkData.FailCheckData and #TalkData.FailCheckData > 0 then
    TalkWidget.Panel_L:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    TalkWidget.Size_Box:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    for i = 1, #TalkData.FailCheckData do
      local Content_1 = NewObject(LoadClass("/Game/UI/WBP/Story_Review/Widget/BP_Review_Impression_Item.BP_Review_Impression_Item"))
      Content_1.Result = false
      Content_1.Value = TalkData.FailCheckData[i]
      TalkWidget.List_Num:AddItem(Content_1)
    end
    Both = Both + 1
  else
    TalkWidget.Panel_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    TalkWidget.Size_Box:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if TalkData.SuccessCheckData and #TalkData.SuccessCheckData > 0 then
    TalkWidget.Panel_R:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    TalkWidget.ItemNum:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    TalkWidget.ItemNum.Text_Num:SetText(TalkData.SuccessCheckData[1])
    Both = Both + 1
  else
    TalkWidget.Panel_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
    TalkWidget.ItemNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if 2 == Both then
    TalkWidget.Line:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    TalkWidget.Line:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local WidgetSize = TalkWidget.Panel_Parcel.Slot:GetSize()
  local WidgetSizeX = WidgetSize.X
  TalkWidget.Panel_Parcel.Slot:SetSize(FVector2D(WidgetSizeX, TalkWidget.CheckPanelSizeY))
  return TalkWidget
end

function M:CreateCutShowTalk(TalkData)
  local FilePath = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Performance.WBP_Story_Review_Performance"
  local TalkWidget = UIManager(self):CreateWidget(FilePath, false)
  self.Scroll_Box:AddChild(TalkWidget)
  TalkWidget.VB_Text:ClearChildren()
  local Widgets = {}
  local DialogueInfos = TalkData.DialogueInfo or {}
  for _, DialogueInfo in ipairs(DialogueInfos) do
    local Review_Text = "/Game/UI/WBP/Story_Review/Widget/WBP_Story_Review_Text.WBP_Story_Review_Text"
    local TextWidget = UIManager(self):CreateWidget(Review_Text, false)
    TextWidget.ParentWidget = TalkWidget
    table.insert(Widgets, TextWidget)
    TalkWidget.VB_Text:AddChild(TextWidget)
    local DialogueId = DialogueInfo.DialogueId
    TextWidget.Text_Title:SetText(DialogueInfo.SpeakerName or "")
    local TalkBtn = TextWidget.Item_Btn
    TalkBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    local Content = TalkUtils:DialogueIdToContent(DialogueId)
    TextWidget.Text_Details:SetText(Content)
    TextWidget.Text_Details:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    TextWidget.Text_Title:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    TextWidget.Text_Content:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if 0 == #DialogueInfos then
    TalkWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  return TalkWidget, Widgets
end

function M:UpdateFocusItem(FocusItem)
  self.FocusItem = FocusItem
  self:UpdateBottomTips(FocusItem and FocusItem.Item_Btn and FocusItem.Item_Btn.BtnState or "")
end

function M:HandleScrollViewItemNavigation(NavigationTable)
  self.NavigationTable = NavigationTable or {}
  local Length = #NavigationTable
  local PreNavigationItem
  for Index = 1, Length do
    local CurNavigationItem = NavigationTable[Index]
    if 1 ~= Index then
      CurNavigationItem:SetNavigationRuleCustom(EUINavigation.Up, {
        self,
        function()
          self:UpdateFocusItem(self.NavigationTable[Index - 1])
          if not CurNavigationItem.ParentWidget and self.FocusItem.ParentWidget then
            self:AddDelayFrameFunc(function()
              self.NavigationTable[Index - 1].GamePadBtn:SetFocus()
            end, 2)
            self:AddDelayFrameFunc(function()
              self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
            end, 4)
            self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
            return self.FocusItem.ParentWidget
          end
          return self.NavigationTable[Index - 1].GamePadBtn
        end
      })
      local PreItem = PreNavigationItem
      PreNavigationItem:SetNavigationRuleCustom(EUINavigation.Down, {
        self,
        function()
          self:UpdateFocusItem(self.NavigationTable[Index])
          if not PreItem.ParentWidget and self.FocusItem.ParentWidget then
            self:AddDelayFrameFunc(function()
              self.NavigationTable[Index].GamePadBtn:SetFocus()
            end, 2)
            self:AddDelayFrameFunc(function()
              self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
            end, 4)
            self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
            return self.FocusItem.ParentWidget
          end
          return self.NavigationTable[Index].GamePadBtn
        end
      })
      if Index == Length then
        CurNavigationItem:SetNavigationRuleCustom(EUINavigation.Down, {
          self,
          function()
            self:UpdateFocusItem(CurNavigationItem)
            return CurNavigationItem.GamePadBtn
          end
        })
      end
    else
      CurNavigationItem:SetNavigationRuleCustom(EUINavigation.Up, {
        self,
        function()
          self:UpdateFocusItem(CurNavigationItem)
          return CurNavigationItem.GamePadBtn
        end
      })
    end
    PreNavigationItem = CurNavigationItem
  end
end

function M:InitReviewItem()
  self.Empty.Text_Empty:SetText(GText("UI_StoryReview_Dialogue_None"))
  self.Scroll_Box:ClearChildren()
  local ReviewDataList = StoryReviewUtils.GetReviewDataList()
  local FinalWidget
  local NavigationRule = {}
  for i = 1, #ReviewDataList do
    local ReviewData = ReviewDataList[i]
    local Widget, Widgets
    if ReviewData.DialogueStyle == "Talk" then
      Widget = self:CreateTalkItem(ReviewData)
    elseif ReviewData.DialogueStyle == "BlackScreen" then
      Widget = self:CreateBlackScreenItem(ReviewData)
    elseif ReviewData.DialogueStyle == "Voiceover" then
      Widget = self:CreateVoiceoverItem(ReviewData)
    elseif ReviewData.DialogueStyle == "Normal" then
      Widget = self:CreateNormalOption(ReviewData)
    elseif ReviewData.DialogueStyle == "ImpressionValue" then
      Widget = self:CreateImpressionValueOption(ReviewData)
    elseif ReviewData.DialogueStyle == "ImpressionCheck" then
      Widget = self:CreateImpressionCheckOption(ReviewData)
    elseif ReviewData.DialogueStyle == "CutShow" and ReviewData.DialogueInfo and #ReviewData.DialogueInfo > 0 then
      Widget, Widgets = self:CreateCutShowTalk(ReviewData)
      Widget = Widgets and Widgets[#Widgets] or nil
    end
    if Widgets then
      for Index = 1, #Widgets do
        table.insert(NavigationRule, Widgets[Index])
      end
    elseif Widget then
      table.insert(NavigationRule, Widget)
    end
    if Widget and (Widget.List or Widget.List_Item) then
      local List = Widget.List or Widget.List_Item
      List:DisableScroll(true)
      List = Widget.List_1 or Widget.List_Item_1
      List:DisableScroll(true)
    end
    FinalWidget = Widget or FinalWidget
  end
  self:UpdateBottomTips(FinalWidget and FinalWidget.Item_Btn and FinalWidget.Item_Btn.BtnState or "")
  if FinalWidget then
    self.FocusItem = FinalWidget
    self.FocusItem.IsFocus = true
    self.FocusItem.GamePadBtn:SetFocus()
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
  self:HandleScrollViewItemNavigation(NavigationRule)
  self:AddDelayFrameFunc(function()
    self.Scroll_Box:ScrollToEnd()
  end, 4)
  self.Scroll_Box:ScrollToEnd()
  self:UpdateGamepadInteraction()
end

function M:BindEvents()
  self.BtnClose.Btn_Close.OnClicked:Add(self, self.Close)
end

function M:UpdateGamepadInteraction()
  for Index, v in pairs(self.NavigationTable) do
    if self.NavigationTable[Index].GamePadBtn then
      self.NavigationTable[Index].GamePadBtn:SetVisibility(not UIUtils.IsGamepadInput() and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function M:ScrollToEnd()
  if self.FocusItem == self.NavigationTable[#self.NavigationTable] then
    self:AddDelayFrameFunc(function()
      self.Scroll_Box:ScrollToEnd()
    end, 2)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Bottom" == InKeyName and self.FocusItem and self.FocusItem.Item_Btn then
    self.FocusItem.Item_Btn:InvokeClick()
    if self.FocusItem.Item_Btn.BtnState == "Option" then
      self.FocusItem:SetFocus()
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:AddDelayFrameFunc(function()
        self.FocusItem.GamePadBtn:SetFocus()
      end, 3)
      self:AddDelayFrameFunc(function()
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      end, 5)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:UpdateCurrentFocusWidgetPos(Frame)
  self:AddDelayFrameFunc(function()
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end, Frame)
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightStick_Up" == InKeyName then
    if self.ScrollState == "Up" then
      self.ScrollState = nil
    end
  elseif "Gamepad_RightStick_Down" == InKeyName then
    if self.ScrollState == "Down" then
      self.ScrollState = nil
    end
  elseif "V" == InKeyName or "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName or "Gamepad_Special_Left" == InKeyName then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:UpdateBottomTips(GamePadTipState)
  if not self.Com_KeyTips then
    return
  end
  local PanelKey = self.Com_KeyTips.Panel_Key
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  PanelKey:ClearChildren()
  if not IsGamePad then
    local BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    PanelKey:AddChild(BottomKeyWidget)
    BottomKeyWidget:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.CloseForBottom,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    })
  elseif GamePadTipState and "" ~= GamePadTipState then
    local TextStr = ""
    if "Audio" == GamePadTipState then
      TextStr = GText("UI_CTL_Play/Pause")
    else
      TextStr = GText("UI_CTL_Squad_Expand")
    end
    local BottomKeyWidget1 = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    local BottomKeyWidget2 = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    BottomKeyWidget1:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = TextStr
    })
    BottomKeyWidget2:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_OPTION_Swicth_Close")
    })
    PanelKey:AddChild(BottomKeyWidget1)
    PanelKey:AddChild(BottomKeyWidget2)
  else
    local BottomKeyWidget1 = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    BottomKeyWidget1:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_OPTION_Swicth_Close")
    })
    PanelKey:AddChild(BottomKeyWidget1)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self:UpdateGamepadInteraction()
  for i, v in ipairs(self.NavigationTable) do
    if v.UpdateGameInputDevice then
      v:UpdateGameInputDevice()
    end
  end
  self:UpdateBottomTips(self.FocusItem and self.FocusItem.Item_Btn and self.FocusItem.Item_Btn.BtnState or "")
  self:RefreshChangeFocusItemOnGamePad()
end

function M:RefreshChangeFocusItemOnGamePad()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  if not IsGamePad then
    return
  end
  local ScrollGeometry = self.Scroll_Box:GetCachedGeometry()
  local ViewportSize = USlateBlueprintLibrary.GetAbsoluteSize(ScrollGeometry)
  local ScrollBoxAbsPos = UUIFunctionLibrary.GetGeometryAbsolutePosition(ScrollGeometry)
  local ScrollTop = ScrollBoxAbsPos.Y
  local ScrollBottom = ScrollBoxAbsPos.Y + ViewportSize.Y
  local Children = self.NavigationTable
  local FistVisibilityItem
  for i = 1, #Children do
    local Child = Children[i]
    local ChildGeometry = Child:GetCachedGeometry()
    local ChildSize = USlateBlueprintLibrary.GetAbsoluteSize(ChildGeometry)
    local ChildAbsPos = UUIFunctionLibrary.GetGeometryAbsolutePosition(ChildGeometry)
    local ChildTop = ChildAbsPos.Y
    local ChildBottom = ChildAbsPos.Y + ChildSize.Y
    local IsVisible = ScrollTop <= ChildTop and ScrollBottom >= ChildBottom
    if Child == self.FocusItem and IsVisible then
      FistVisibilityItem = Child
      break
    end
    if IsVisible and not FistVisibilityItem then
      FistVisibilityItem = Child
    end
  end
  if FistVisibilityItem then
    FistVisibilityItem.GamePadBtn:SetFocus()
  end
end

function M:Destruct()
  if self.Callback then
    self.Callback()
  end
  M.Super.Destruct(self)
end

function M:Close()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  M.Super.Close(self)
end

function M:CloseForBottom()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  M.Super.Close(self)
end

return M
