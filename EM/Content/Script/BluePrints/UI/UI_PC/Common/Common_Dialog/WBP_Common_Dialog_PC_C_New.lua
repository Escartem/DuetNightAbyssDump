require("UnLua")
local DialogMinHeightWithButton = 136
local DialogMinHeightWithoutButton = 216
local DialogMinWidthNormal = 800
local DialogMinWidthBig = 1100
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0
local WBP_Common_Dialog_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Common_Dialog_PC_C:Initialize()
  self.Super.Initialize(self)
end

function WBP_Common_Dialog_PC_C:OnLoaded(PopupId, Params, ParentWidget)
  self.Super.OnLoaded(self)
  self:AddDispatcher(EventID.UnLoadUI, self, function(self, UIName)
    if IsValid(ParentWidget) and UIName == ParentWidget.WidgetName then
      self:OnClose()
    end
  end)
  self.PopupQueue = self.PopupQueue or {}
end

function WBP_Common_Dialog_PC_C:ShowPopupInterrupt(PopupId, Params, ParentWidget)
  if #self.PopupQueue <= 0 then
    self:ShowPopup(PopupId, Params, ParentWidget)
  end
  table.insert(self.PopupQueue, 1, {
    PopupId,
    Params,
    ParentWidget
  })
  table.insert(self.PopupQueue, 1, {})
  self:OnClose()
end

function WBP_Common_Dialog_PC_C:RemoveFirstItemInPopupQueue()
  table.remove(self.PopupQueue, 1)
end

function WBP_Common_Dialog_PC_C:ShowPopup(PopupId, Params, ParentWidget)
  table.insert(self.PopupQueue, {
    PopupId,
    Params,
    ParentWidget
  })
  if 1 == #self.PopupQueue then
    self:InitView(PopupId, Params, ParentWidget)
  end
end

function WBP_Common_Dialog_PC_C:ShowNextPopup()
  self.PopupQueue = self.PopupQueue or {}
  table.remove(self.PopupQueue, 1)
  if #self.PopupQueue > 0 then
    local PopupParam = self.PopupQueue[1]
    self:SetFocus()
    self:InitView(PopupParam[1], PopupParam[2], PopupParam[3])
  else
    self.Super.Close(self)
  end
end

function WBP_Common_Dialog_PC_C:InitView(PopupId, Params, ParentWidget)
  if ParentWidget then
    self.ParentWidget = ParentWidget
  end
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/window_filter_common", "CommonDialogIn", nil)
  self.CloseMask.OnPressed:Add(self, self.OnCloseMaskClicked)
  self.ResourceBarWidget = {}
  self.ContentWidgetTable = {}
  self.Contents = {}
  self.Tips = {}
  self.Panel_ResourceBar:ClearChildren()
  self.Panel_ResourceBar:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:RefreshView(PopupId, Params)
  if Params and Params.BindScript then
    self.Script = require(Params.BindScript)
    if self.Script then
      self.Script:BindDialogWidget(PopupId, self)
      self.Script:Initialize()
      DebugPrint("Tianyi@ \229\188\185\231\170\151\230\136\144\229\138\159\231\187\145\229\174\154\232\132\154\230\156\172: ", Params.BindScript)
    end
  end
end

function WBP_Common_Dialog_PC_C:RefreshView(PopupId, Params)
  self.ContentWidgetTable = {}
  self:ClearDelegates()
  self.Index2GamepadShortcut = {
    self.Gamepad_Shortcut01,
    self.Gamepad_Shortcut02,
    self.Gamepad_Shortcut03,
    self.Gamepad_Shortcut04,
    self.Gamepad_Shortcut05
  }
  for Index = 1, #self.Index2GamepadShortcut do
    self:HideGamepadShortcut(Index)
  end
  self:HideAllGamepadShortcut()
  local PopupData = DataMgr.CommonPopupUIContext[PopupId]
  if PopupData and PopupData.Style then
    self:UpdateView(PopupData.Style, Params, PopupData)
  else
    DebugPrint("Tianyi@ PopupData is nil")
  end
  self:RefreshOpInfoByInputDevice()
end

function WBP_Common_Dialog_PC_C:InitWidgetView(PopupId, Params)
  self.IsWidgetView = true
  self.ResourceBarWidget = {}
  self.ContentWidgetTable = {}
  self.Contents = {}
  self.Tips = {}
  self.Panel_ResourceBar:ClearChildren()
  self.Panel_ResourceBar:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:RefreshView(PopupId, Params)
  self.CloseMask:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WBP_Com_Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Common_Dialog_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView(self.CurGamepadName)
  else
    self:InitKeyboardView(self.CurGamepadName)
  end
end

function WBP_Common_Dialog_PC_C:InitKeyboardView(CurGamepadName)
  self.Switcher_Text:SetActiveWidgetIndex(0)
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.InitKeyboardView then
      ContentWidget:InitKeyboardView()
    end
  end
end

function WBP_Common_Dialog_PC_C:InitGamepadView(CurGamepadName)
  self.Switcher_Text:SetActiveWidgetIndex(1)
  local ForceShow = self.Params.ShowBKeyClose
  local HasCloseBtn = not self.PopupData.NotShowCloseButton
  local HasQuitTip = self.PopupData.ShowQuitTip
  local HasButtonBar = self.ButtonBar
  if nil ~= ForceShow then
    self:ShowGamepadCloseBtn(ForceShow)
  else
    self:ShowGamepadCloseBtn((HasCloseBtn or HasQuitTip) and not HasButtonBar)
  end
  if self.Params and self.Params.AutoFocus and self.VB_Node:GetChildrenCount() > 2 then
    local Widget = self.VB_Node:GetChildAt(1)
    Widget:SetFocus()
  end
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.InitGamepadView then
      ContentWidget:InitGamepadView()
    end
  end
end

function WBP_Common_Dialog_PC_C:AddEventListener(EventName, ListenerObj, ListenerFunc)
  if not self.EventListenerMap[EventName] then
    self.EventListenerMap[EventName] = {}
  end
  table.insert(self.EventListenerMap[EventName], {ListenerObj = ListenerObj, ListenerFunc = ListenerFunc})
end

function WBP_Common_Dialog_PC_C:RemoveEventListener(EventName)
  self.EventListenerMap[EventName] = nil
end

function WBP_Common_Dialog_PC_C:BroadcastDialogEvent(EventName, ...)
  local EventListeners = self.EventListenerMap[EventName]
  if EventListeners then
    for _, Listener in ipairs(EventListeners) do
      Listener.ListenerFunc(Listener.ListenerObj, ...)
    end
  end
end

function WBP_Common_Dialog_PC_C:ClearDelegates()
  self.CloseBtnCallbackObj = nil
  self.CloseBtnCallbackFunction = nil
  self.OnCloseCallbackObj = nil
  self.OnCloseCallbackFunction = nil
  self.OnKeyDownCallbackObj = nil
  self.OnKeyDownCallbackFunction = nil
  self.OnMouseDownCallbackObj = nil
  self.OnMouseDownCallbackFunction = nil
  self.OnKeyUpCallbackObj = nil
  self.OnKeyUpCallbackFunction = nil
  self.RightBtnCallbackObj = nil
  self.RightBtnClickedCallback = nil
  self.ForbiddenRightBtnCallbackObj = nil
  self.ForbiddenRightBtnClickedCallback = nil
  self.DontCloseWhenRightBtnClicked = false
  self.LeftBtnCallbackObj = nil
  self.LeftBtnClickedCallback = nil
  self.ForbiddenLeftBtnCallbackObj = nil
  self.ForbiddenLeftBtnClickedCallback = nil
  self.DontCloseWhenLeftBtnClicked = false
  self.DontPlayOutAnimation = false
  self.DontFocusParentWidget = false
  self.IsClosing = false
end

function WBP_Common_Dialog_PC_C:UpdateView(PopupStyleID, Params, PopupData)
  if PopupStyleID and not PopupData then
    PopupData = {Style = PopupStyleID}
  end
  self.ContentWidgetTable = {}
  self.EventListenerMap = {}
  self.PackageFuncs = {}
  self.Contents = {}
  self.CurItemIndex = nil
  self.PopupData = PopupData
  self.Params = Params or {}
  for k, v in pairs(PopupData.ExtraParams or {}) do
    self.Params[k] = v
  end
  local PopupStyle = DataMgr.CommonPopupUIStyle[PopupStyleID]
  if not PopupStyle then
    DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176 " .. tostring(PopupStyleID) .. " \229\175\185\229\186\148\231\154\132\229\188\185\231\170\151\230\160\183\229\188\143")
    return
  end
  self.PopupStyle = PopupStyle
  if Params then
    self.CloseBtnCallbackObj = Params.CloseBtnCallbackObj
    self.CloseBtnCallbackFunction = Params.CloseBtnCallbackFunction
    self.OnCloseCallbackObj = Params.OnCloseCallbackObj
    self.OnCloseCallbackFunction = Params.OnCloseCallbackFunction
    self.OnKeyDownCallbackObj = Params.OnKeyDownCallbackObj
    self.OnKeyDownCallbackFunction = Params.OnKeyDownCallbackFunction
    self.OnMouseDownCallbackObj = Params.OnMouseDownCallbackObj
    self.OnMouseDownCallbackFunction = Params.OnMouseDownCallbackFunction
    self.OnKeyUpCallbackObj = Params.OnKeyUpCallbackObj
    self.OnKeyUpCallbackFunction = Params.OnKeyUpCallbackFunction
    self.DontPlayOutAnimation = Params.DontPlayOutAnimation
    self.DontFocusParentWidget = Params.DontFocusParentWidget
  end
  self.Pos_Btn:ClearChildren()
  local ButtonBarWidgetName
  if Params and Params.ButtonBarName then
    ButtonBarWidgetName = Params.ButtonBarName
  elseif PopupStyle.ShowLeftButton or PopupStyle.ShowRightButton or PopupStyle.ShowFlipPage then
    ButtonBarWidgetName = "Dialog_Button"
  end
  self.ButtonBar = nil
  if ButtonBarWidgetName then
    local ButtonBar = self:CreateContentWidget(ButtonBarWidgetName)
    if ButtonBar then
      self.Pos_Btn:AddChild(ButtonBar)
      ButtonBar:InitContent(Params, PopupData, self)
      local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(ButtonBar)
      OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      self:RegisterContentWidget("Dialog_Button", ButtonBar)
      self.ButtonBar = ButtonBar
    end
  end
  if Params then
    self.LeftBtnCallbackObj = Params.LeftCallbackObj
    self.LeftBtnClickedCallback = Params.LeftCallbackFunction
    self.ForbiddenLeftBtnCallbackObj = Params.ForbiddenLeftCallbackObj
    self.ForbiddenLeftBtnClickedCallback = Params.ForbiddenLeftCallbackFunction
    self.DontCloseWhenLeftBtnClicked = Params.DontCloseWhenLeftBtnClicked
    self.RightBtnCallbackObj = Params.RightCallbackObj
    self.RightBtnClickedCallback = Params.RightCallbackFunction
    self.ForbiddenRightBtnCallbackObj = Params.ForbiddenRightCallbackObj
    self.ForbiddenRightBtnClickedCallback = Params.ForbiddenRightCallbackFunction
    self.DontCloseWhenRightBtnClicked = Params.DontCloseWhenRightBtnClicked
  end
  self.Pos_Title:ClearChildren()
  local DialogTitle
  if PopupStyle.UseTabTitle then
    DialogTitle = self:CreateContentWidget("Dialog_Title_SubTab")
  else
    DialogTitle = self:CreateContentWidget("Dialog_Title")
  end
  if DialogTitle then
    self.Pos_Title:AddChild(DialogTitle)
    DialogTitle:InitContent(Params, PopupData, self)
    DialogTitle:BindOnCloseButtonClicked(self, self.OnCloseBtnClicked)
    local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(DialogTitle)
    OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    self:RegisterContentWidget("DialogTitle", DialogTitle)
    self.DialogTitle = DialogTitle
  end
  for i = 1, self.VB_Node:GetChildrenCount() - 2 do
    self.VB_Node:RemoveChildAt(1)
  end
  if PopupStyle.ShowContent then
    self.VB_Node:RemoveChildAt(self.VB_Node:GetChildrenCount() - 1)
    local ContentWidget
    for Index, ContentTypeIdx in ipairs(PopupStyle.ShowContent) do
      if Params and Params.UseCachedWidget and Params.UseCachedWidget[Index] then
        ContentWidget = Params.UseCachedWidget[Index]
      else
        ContentWidget = self:CreateContentWidget(ContentTypeIdx)
      end
      if ContentWidget then
        self.VB_Node:AddChild(ContentWidget)
        self:RegisterContentWidget(ContentTypeIdx, ContentWidget)
        table.insert(self.Contents, ContentWidget)
      end
    end
    self.VB_Node:AddChild(self.Spacer_VBNode_Botton)
  end
  self.Pos_Tips:ClearChildren()
  if PopupStyle.ShowTip then
    self.Pos_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    for Index, ContentTypeIdx in ipairs(PopupStyle.ShowTip) do
      local TipWidget = self:CreateContentWidget(ContentTypeIdx)
      if TipWidget then
        self.Pos_Tips:AddChild(TipWidget)
        self:RegisterContentWidget(ContentTypeIdx, TipWidget)
        table.insert(self.Tips, TipWidget)
      else
        DebugPrint("Tianyi@ \229\156\168\229\188\185\231\170\151\230\142\167\228\187\182\232\161\168\228\184\173\230\137\190\228\184\141\229\136\176ContentId: " .. ContentTypeIdx)
      end
    end
    local AllChildrend = self.Pos_Tips:GetAllChildren()
    local Length = AllChildrend:Length()
    for i = 1, Length do
      local TipWidget = AllChildrend:GetRef(i)
      local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(TipWidget)
      OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    end
  else
    self.Pos_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Pos_BGEffect:ClearChildren()
  if PopupStyle.ShowBG then
    local BGWidget = UIManager(self):_CreateWidgetNew(PopupStyle.ShowBG)
    if BGWidget then
      self.Pos_BGEffect:AddChild(BGWidget)
    else
      DebugPrint(LogTag.Error, "Tianyi@ \229\136\155\229\187\186BG\230\142\167\228\187\182\229\164\177\232\180\165", PopupStyle.ShowBG)
    end
  end
  local AllChildrend = self.VB_Node:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 2, Length - 1 do
    local ContentWidget = AllChildrend:GetRef(i)
    if ContentWidget.PreInitContent then
      ContentWidget:PreInitContent(Params, PopupData, self)
    end
    if ContentWidget.PackageData then
      local function PackageFunc()
        return ContentWidget.PackageKey or "Content_" .. i - 1, ContentWidget:PackageData()
      end
      
      table.insert(self.PackageFuncs, PackageFunc)
    end
  end
  local AllChildrend = self.Pos_Tips:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 1, Length do
    local TipWidget = AllChildrend:GetRef(i)
    if TipWidget.PreInitContent then
      TipWidget:PreInitContent(Params, PopupData, self)
    end
    if TipWidget.PackageData then
      local function PackageFunc()
        return TipWidget.PackageKey or "Tip_" .. i, TipWidget:PackageData()
      end
      
      table.insert(self.PackageFuncs, PackageFunc)
    end
  end
  local AllChildrend = self.VB_Node:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 2, Length - 1 do
    local ContentWidget = AllChildrend:GetRef(i)
    if ContentWidget.InitContent then
      ContentWidget:InitContent(Params, PopupData, self)
    end
  end
  local AllChildrend = self.Pos_Tips:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 1, Length do
    local TipWidget = AllChildrend:GetRef(i)
    if TipWidget.InitContent then
      TipWidget:InitContent(Params, PopupData, self)
    end
  end
  local TopResources
  if PopupData and PopupData.TabCoin then
    TopResources = PopupData.TabCoin
  end
  if Params and Params.ShowParentTabCoin and self.ParentWidget then
    local ConfigName = self.ParentWidget.ConfigName
    if ConfigName and DataMgr.SystemUI[ConfigName] then
      local SystemUIConfig = DataMgr.SystemUI[ConfigName]
      TopResources = SystemUIConfig.TabCoin
      TopResources = self.ParentWidget.GetOverrideTopResource and self.ParentWidget:GetOverrideTopResource() or TopResources
    end
  end
  if TopResources then
    local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic")
    self.TopResourcePanel:SetVisibility(UE4.ESlateVisibility.Visible)
    self.WBP_Com_Tab_Node_ResourceBar:InitResourceBar(TopResources)
    self.WBP_Com_Tab_Node_ResourceBar:SetGamePadKeyImgByPath(ResourceBarIcon)
    self.WBP_Com_Tab_Node_ResourceBar:SetLastFocusWidget(self)
  else
    self.TopResourcePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if Params and Params.bHideDialogItem then
    self:BroadcastDialogEvent(DialogEvent.HideDialogItem, Params)
  end
  self.CloseMask.OnClicked:Clear()
  if PopupData.ShowQuitTip then
    self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
    self.Text_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.CloseMask.OnPressed:Add(self, self.OnCloseMaskClicked)
    self.CloseMask:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Text_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.CloseMask:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if PopupStyle.ShowContent then
    local AllChildrend = self.VB_Node:GetAllChildren()
    local Length = AllChildrend:Length()
    for i = 2, Length - 1 do
      local ContentWidget = AllChildrend:GetRef(i)
      if ContentWidget.PostInitContent then
        ContentWidget:PostInitContent(Params, PopupData, self)
      end
    end
  end
  if Params and Params.CountDownParams then
    local CountDownName = Params.CountDownParams.Name
    local CountDownRemainTime = Params.CountDownParams.RemainTime
    local CountDownTimeIconPath = Params.CountDownParams.TimeIcon
    local CountDownEndTime = TimeUtils.NowTime() + CountDownRemainTime
    self.Panel_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:AddTimer(1, function()
      local CurrentTime = TimeUtils.NowTime()
      if CurrentTime > CountDownEndTime then
        self:RemoveTimer("DialogCountDown")
        return
      end
      local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(CountDownEndTime)
      self.CountDown:SetTimeText(CountDownName, RemainTimeDict, CountDownTimeIconPath)
    end, true, -1, "DialogCountDown")
  else
    self.Panel_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:AutofitDialog(PopupStyle)
end

function WBP_Common_Dialog_PC_C:BP_GetDesiredFocusTarget()
  local ContentWidgetDesiredFocusTarget
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.HandleDialogFocused then
      ContentWidgetDesiredFocusTarget = ContentWidget:HandleDialogFocused()
      if ContentWidgetDesiredFocusTarget then
        DebugPrint("Tianyi@ \229\188\185\231\170\151\230\142\167\228\187\182: " .. ContentWidget:GetName() .. " Handle\228\186\134\229\188\185\231\170\151\231\154\132\232\129\154\231\132\166, \230\150\176\232\129\154\231\132\166\228\184\186: " .. ContentWidgetDesiredFocusTarget:GetName())
        break
      end
    end
  end
  return ContentWidgetDesiredFocusTarget
end

function WBP_Common_Dialog_PC_C:PrintVBNode()
  local Length = self.VB_Node:GetChildrenCount()
  for i = 0, Length - 1 do
    local Child = self.VB_Node:GetChildAt(i)
    DebugPrint("Tianyi Child " .. tostring(i) .. " : " .. tostring(Child.Name))
  end
end

function WBP_Common_Dialog_PC_C:AutofitDialog()
  if self.Pos_Btn:GetChildrenCount() <= 0 then
    self.Bg_Switch:SetActiveWidgetIndex(1)
    self.Switcher_Light:SetActiveWidgetIndex(1)
    self.Size_Bg:SetMinDesiredHeight(DialogMinHeightWithoutButton)
  else
    self.Bg_Switch:SetActiveWidgetIndex(0)
    self.Switcher_Light:SetActiveWidgetIndex(0)
    self.Size_Bg:SetMinDesiredHeight(DialogMinHeightWithButton)
  end
  if self.PopupStyle.BigSize then
    self.Size_Bg:SetMinDesiredWidth(DialogMinWidthBig)
  else
    self.Size_Bg:SetMinDesiredWidth(DialogMinWidthNormal)
  end
  local AllChildrend = self.Pos_Tips:GetAllChildren()
  local Length = AllChildrend:Length()
  local HasTipWidgetVisible = false
  for i = 1, Length do
    local TipWidget = AllChildrend:GetRef(i)
    local WidgetVisibility = TipWidget:GetVisibility()
    if WidgetVisibility == UE4.ESlateVisibility.Visible or WidgetVisibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      HasTipWidgetVisible = true
      break
    end
  end
  if self.PopupStyle.ShowTip and HasTipWidgetVisible then
    self.Spacer_VBNode_Top:SetSize(UE4.FVector2D(0, self.Spacer_VBNode_Top_Y_Large))
    self.Spacer_VBNode_Botton:SetSize(UE4.FVector2D(0, self.Spacer_VBNode_Botton_Y_Large))
  else
    self.Spacer_VBNode_Top:SetSize(UE4.FVector2D(0, self.Spacer_VBNode_Top_Y_Normal))
    self.Spacer_VBNode_Botton:SetSize(UE4.FVector2D(0, self.Spacer_VBNode_Botton_Y_Normal))
  end
end

function WBP_Common_Dialog_PC_C:PackageResult()
  if self.Script and self.Script.PackageData then
    local Data = self.Script:PackageData()
    if Data then
      return Data
    end
  end
  local Result = {}
  for _, Func in ipairs(self.PackageFuncs) do
    local PackageName, PackageValue = Func()
    if PackageName and PackageValue then
      Result[PackageName] = PackageValue
    end
  end
  return Result
end

function WBP_Common_Dialog_PC_C:OnMouseButtonDown(MyGeometry, InPointerEvent)
  local IsContentWidgetHandled = false
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.OnContentMouseButtonDown then
      IsContentWidgetHandled = ContentWidget:OnContentMouseButtonDown(MyGeometry, InPointerEvent)
      if IsContentWidgetHandled then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
    end
  end
  if self.OnMouseDownCallbackFunction then
    self.OnMouseDownCallbackFunction(self.OnMouseDownCallbackObj, MyGeometry, InPointerEvent)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Common_Dialog_PC_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsContentWidgetHandled = false
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.OnContentPreviewKeyDown then
      IsContentWidgetHandled = ContentWidget:OnContentPreviewKeyDown(MyGeometry, InKeyEvent)
      if IsContentWidgetHandled then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Common_Dialog_PC_C:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if self.IsClosing then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.OnKeyDownCallbackFunction then
    self.OnKeyDownCallbackFunction(self.OnKeyDownCallbackObj, InKeyName)
  end
  local IsContentWidgetHandled = false
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.OnContentKeyDown then
      IsContentWidgetHandled = ContentWidget:OnContentKeyDown(MyGeometry, InKeyEvent)
      if IsContentWidgetHandled then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
    end
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    local res = self:ProcessGamepadKeydown(InKeyName)
    if res then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  elseif "Escape" == InKeyName and not self.Params.DisableEscClose then
    if self.IsClosing then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    if self.CloseBtnCallbackFunction then
      local Data = self:PackageResult()
      self.CloseBtnCallbackFunction(self.CloseBtnCallbackObj, Data)
    end
    self:OnClose()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Common_Dialog_PC_C:ProcessGamepadKeydown(InKeyName)
  local ButtonBar = self:GetButtonBar()
  local RightBtnKey = Const.GamepadFaceButtonDown
  if self.Params and self.Params.RightGamepadKey then
    RightBtnKey = self.Params.RightGamepadKey
  end
  local LeftBtnKey = Const.GamepadFaceButtonRight
  if self.Params and self.Params.LeftGamepadKey then
    LeftBtnKey = self.Params.LeftGamepadKey
  end
  if InKeyName == Const.GamepadFaceButtonRight and self.GamepadCloseBtnIndex then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
    self:OnCloseBtnClicked()
    return true
  elseif InKeyName == RightBtnKey then
    if self.PopupStyle.ShowRightButton then
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
      if ButtonBar then
        ButtonBar:SimulateRightBtnClick()
      end
      return true
    end
  elseif InKeyName == LeftBtnKey then
    if ButtonBar then
      ButtonBar:SimulateLeftBtnClick()
    end
    return true
  elseif InKeyName == Const.GamepadRightThumbstick then
    self.WBP_Com_Tab_Node_ResourceBar:FocusToResource()
    return true
  end
  return false
end

function WBP_Common_Dialog_PC_C:OnKeyUp(MyGeometry, InKeyEvent)
  if self.IsClosing then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  for _, ContentWidget in pairs(self.ContentWidgetTable) do
    if ContentWidget.OnContentKeyUp then
      local IsContentWidgetHandled = ContentWidget:OnContentKeyUp(MyGeometry, InKeyEvent)
      if IsContentWidgetHandled then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
    end
  end
  if self.OnKeyUpCallbackFunction then
    self.OnKeyUpCallbackFunction(self.OnKeyUpCallbackObj, InKeyName)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Common_Dialog_PC_C:OnLeftBtnClicked()
  if self.IsClosing then
    return
  end
  if not self.PopupStyle.ShowLeftButton then
    return
  end
  self:BroadcastDialogEvent(DialogEvent.OnLeftBtnClicked)
  if self.LeftBtnClickedCallback then
    local Data = self:PackageResult()
    self.LeftBtnClickedCallback(self.LeftBtnCallbackObj, Data, self)
  end
  if self.DontCloseWhenLeftBtnClicked then
    return
  end
  self:OnClose()
end

function WBP_Common_Dialog_PC_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    if IsValid(self.ParentWidget) and self.ParentWidget.bIsFocusable and not self.DontFocusParentWidget then
      if type(self.ParentWidget.SetFocus_Lua) == "function" then
        self.ParentWidget:SetFocus_Lua()
      else
        self.ParentWidget:SetFocus()
      end
    end
    self:ShowNextPopup()
  end
end

function WBP_Common_Dialog_PC_C:OnRightBtnClicked()
  if self.IsClosing then
    return
  end
  if not self.PopupStyle.ShowRightButton then
    return
  end
  self:BroadcastDialogEvent(DialogEvent.OnRightBtnClicked)
  if self.RightBtnClickedCallback then
    local Data = self:PackageResult()
    self.RightBtnClickedCallback(self.RightBtnCallbackObj, Data, self)
  end
  if self.DontCloseWhenRightBtnClicked then
    return
  end
  self:OnClose()
end

function WBP_Common_Dialog_PC_C:OnCloseMaskClicked()
  if not self.PopupData.ShowQuitTip or UIManager(self):IsHaveMenuAnchorOpen() then
    return
  end
  self:OnCloseBtnClicked()
end

function WBP_Common_Dialog_PC_C:OnCloseBtnClicked()
  if self.CloseBtnCallbackFunction then
    local Data = self:PackageResult()
    self.CloseBtnCallbackFunction(self.CloseBtnCallbackObj, Data, self)
  end
  self:OnClose()
end

function WBP_Common_Dialog_PC_C:OnForbiddenLeftBtnClicked()
  if self.IsClosing then
    return
  end
  if self.ForbiddenLeftBtnClickedCallback then
    local Data = self:PackageResult()
    self.ForbiddenLeftBtnClickedCallback(self.ForbiddenLeftBtnCallbackObj, Data, self)
  elseif self.PopupData and self.PopupData.NoButtonForbiddenToast then
    UIManager(self):ShowUITip("CommonToastMain", GText(self.PopupData.NoButtonForbiddenToast))
  end
end

function WBP_Common_Dialog_PC_C:OnForbiddenRightBtnClicked()
  if self.IsClosing then
    return
  end
  if self.ForbiddenRightBtnClickedCallback then
    local Data = self:PackageResult()
    self.ForbiddenRightBtnClickedCallback(self.ForbiddenRightBtnCallbackObj, Data, self)
  elseif self.PopupData and self.PopupData.YesButtonForbiddenToast then
    UIManager(self):ShowUITip("CommonToastMain", GText(self.PopupData.YesButtonForbiddenToast))
  end
end

function WBP_Common_Dialog_PC_C:PlaySound(SoundFile, SoundEventName, Params)
  AudioManager(self):PlayUISound(self, SoundFile, SoundEventName, nil)
  if Params then
    AudioManager(self):SetEventSoundParam(self, SoundEventName, Params)
  end
end

function WBP_Common_Dialog_PC_C:CreateContentWidget(WidgetName)
  local ContentData = DataMgr.CommonDialogContent[WidgetName]
  if not ContentData then
    DebugPrint("Tianyi@ \229\156\168\229\188\185\231\170\151\230\142\167\228\187\182\232\161\168\228\184\173\230\137\190\228\184\141\229\136\176ContentId: " .. WidgetName)
    return nil
  end
  local ContentBPPath = ContentData.BPPath
  if ContentBPPath then
    local ContentWidget = UIManager(self):CreateWidget(ContentBPPath, false)
    if ContentWidget.SetContentWidgetName then
      ContentWidget:SetContentWidgetName(WidgetName)
    end
    return ContentWidget
  end
  return nil
end

function WBP_Common_Dialog_PC_C:RegisterContentWidget(ContentWidgetName, ContentWidget)
  if ContentWidgetName then
    if self.ContentWidgetTable[ContentWidgetName] then
      DebugPrint("Tianyi@ \233\135\141\229\164\141\230\179\168\229\134\140\230\142\167\228\187\182\239\188\154" .. ContentWidgetName)
    end
    self.ContentWidgetTable[ContentWidgetName] = ContentWidget
  else
    DebugPrint("Tianyi@ ContentWidget:" .. ContentWidget:GetName() .. "\230\178\161\230\156\137\232\174\190\231\189\174ContentWidgetName, \228\185\159\232\174\184\230\152\175\230\156\170\231\187\167\230\137\191DialogContentBase\231\177\187?")
  end
end

function WBP_Common_Dialog_PC_C:GetContentWidgetByName(WidgetName)
  return self.ContentWidgetTable[WidgetName]
end

function WBP_Common_Dialog_PC_C:GetTitle()
  return self.DialogTitle
end

function WBP_Common_Dialog_PC_C:GetButtonBar()
  return self.ButtonBar
end

function WBP_Common_Dialog_PC_C:ForbidLeftBtn(IsForbid)
  local ButtonBar = self:GetButtonBar()
  if ButtonBar then
    ButtonBar:ForbidLeftBtn(IsForbid)
  end
end

function WBP_Common_Dialog_PC_C:ForbidRightBtn(IsForbid)
  local ButtonBar = self:GetButtonBar()
  if ButtonBar then
    ButtonBar:ForbidRightBtn(IsForbid)
  end
end

function WBP_Common_Dialog_PC_C:ShowDialogTip(DialogItemIndex, bShouldPlayAnim)
  self:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
    DialogItemIndex = DialogItemIndex,
    bHideDialogItem = false,
    bShouldPlayAnim = bShouldPlayAnim
  })
end

function WBP_Common_Dialog_PC_C:HideDialogTip(DialogItemIndex, bShouldPlayAnim)
  self:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
    DialogItemIndex = DialogItemIndex,
    bHideDialogItem = true,
    bShouldPlayAnim = bShouldPlayAnim
  })
end

function WBP_Common_Dialog_PC_C:GetGamepadShortcutByIndex(Index)
  return self.Index2GamepadShortcut[Index]
end

function WBP_Common_Dialog_PC_C:InitGamepadShortcut(Params, TargetIndex)
  local Index, Widget = self:DispatchGamepadShortcut(TargetIndex)
  if not Index or not Widget then
    return
  end
  Widget:CreateCommonKey(Params)
  Widget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  return Index
end

function WBP_Common_Dialog_PC_C:HideGamepadShortcut(Index)
  local GamepadShortcut = self:GetGamepadShortcutByIndex(Index)
  if GamepadShortcut then
    GamepadShortcut:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Common_Dialog_PC_C:HideAllGamepadShortcut()
  local GamepadShortcutNum = #self.Index2GamepadShortcut
  for Index = 1, GamepadShortcutNum do
    self:HideGamepadShortcut(Index)
  end
end

function WBP_Common_Dialog_PC_C:ShowGamepadShortcut(Index)
  local GamepadShortcut = self:GetGamepadShortcutByIndex(Index)
  if GamepadShortcut then
    GamepadShortcut:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Common_Dialog_PC_C:DispatchGamepadShortcut(TargetIndex)
  if TargetIndex then
    return TargetIndex, self.Index2GamepadShortcut[TargetIndex]
  end
  local GamepadShortcutNum = #self.Index2GamepadShortcut
  for Index = GamepadShortcutNum - 1, 1, -1 do
    if not self:IsGamepadShortcutVisible(Index) then
      return Index, self.Index2GamepadShortcut[Index]
    end
  end
  return nil
end

function WBP_Common_Dialog_PC_C:IsGamepadShortcutVisible(Index)
  local GamepadShortcut = self:GetGamepadShortcutByIndex(Index)
  return GamepadShortcut:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible
end

function WBP_Common_Dialog_PC_C:ShowGamepadCloseBtn(bShow)
  if bShow then
    if self.GamepadCloseBtnIndex then
      return
    end
    self.GamepadCloseBtnIndex = self:InitGamepadShortcut({
      KeyInfoList = {
        {
          Type = "Img",
          ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("B", self.CurGamepadName)
        }
      },
      Desc = GText("UI_Controller_Close")
    }, #self.Index2GamepadShortcut)
  elseif self.GamepadCloseBtnIndex then
    self:HideGamepadShortcut(self.GamepadCloseBtnIndex)
    self.GamepadCloseBtnIndex = nil
  end
end

function WBP_Common_Dialog_PC_C:SetGamepadBtnKeyVisibility(IsShow)
  local ButtonBar = self:GetButtonBar()
  if ButtonBar then
    ButtonBar:SetGamepadBtnKeyVisibility(IsShow)
  end
end

function WBP_Common_Dialog_PC_C:ShowGamepadScrollBtn(bShow)
  if bShow then
    if self.GamepadScrollBtnIndex then
      return
    end
    self.GamepadScrollBtnIndex = self:InitGamepadShortcut({
      KeyInfoList = {
        {
          Type = "Img",
          ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("RV", self.CurGamepadName)
        }
      },
      Desc = GText("UI_Controller_Slide")
    })
  elseif self.GamepadScrollBtnIndex then
    self:HideGamepadShortcut(self.GamepadScrollBtnIndex)
    self.GamepadScrollBtnIndex = nil
  end
end

function WBP_Common_Dialog_PC_C:GetItemIndex()
  if not self.CurItemIndex then
    self.CurItemIndex = 0
  end
  self.CurItemIndex = self.CurItemIndex + 1
  return self.CurItemIndex
end

function WBP_Common_Dialog_PC_C:OnClose()
  if self.IsClosing then
    return
  end
  self.IsClosing = true
  AudioManager(self):SetEventSoundParam(self, "CommonDialogIn", {ToEnd = 1})
  if self.DontPlayOutAnimation then
    self:OnAnimationFinished(self.Out)
  else
    self:PlayAnimation(self.Out)
  end
end

function WBP_Common_Dialog_PC_C:RealClose()
  self.Super.RealClose(self)
  if self.OnCloseCallbackFunction then
    local Data = self:PackageResult()
    self.OnCloseCallbackFunction(self.OnCloseCallbackObj, Data, self)
  end
end

function WBP_Common_Dialog_PC_C:SequenceEvent_ListViewAnim()
  self:BroadcastDialogEvent("PlayAttrListInAnim")
end

function WBP_Common_Dialog_PC_C:UpdateResourceInfos(DialogContent, Res)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DialogContent.Params.ItemList = {}
  for _, ResourceUse in ipairs(Res.ResourceUse) do
    if ResourceUse.Count <= 0 then
    else
      local ResourceId = ResourceUse.ResourceId
      table.insert(DialogContent.Params.ItemList, {
        ItemId = ResourceId,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Avatar.Resources[ResourceId] and Avatar.Resources[ResourceId].Count or 0,
        ItemNeed = ResourceUse.Count
      })
    end
  end
  self:BroadcastDialogEvent("UpdateItemSubSize", DialogContent.Params)
end

function WBP_Common_Dialog_PC_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.ContentWidgetTable then
    for _, ContentWidget in pairs(self.ContentWidgetTable) do
      if ContentWidget.OnContentFocusReceived then
        ContentWidget:OnContentFocusReceived(MyGeometry, InFocusEvent)
      end
    end
  end
  return WBP_Common_Dialog_PC_C.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function WBP_Common_Dialog_PC_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local AllChildrend = self.VB_Node:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 1, Length do
    local ContentWidget = AllChildrend:GetRef(i)
    if ContentWidget.OnContentAnalogValueChanged then
      ContentWidget:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

return WBP_Common_Dialog_PC_C
