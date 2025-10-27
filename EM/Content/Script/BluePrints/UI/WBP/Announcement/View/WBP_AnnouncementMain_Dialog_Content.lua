require("UnLua")
local UIUtils = require("Utils.UIUtils")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
local Utils = require("Utils")
local ReddotNames = {
  "SystemAnnouncement",
  "ActivityAnnouncement",
  "NewsAnnouncement"
}
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  M.Super.Construct(self)
  self:SetUpFixedText()
  if AnnounceCommon.bUseWeb then
    self.WebContent:SetVisibility(UIConst.VisibilityOp.Visible)
    self.SizeBox_ContentRoot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WebContent:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.SizeBox_ContentRoot:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  local ReconnectSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Loading_Reconnect)
  local Offset = ReconnectSlot:GetOffsets()
  Offset.Bottom = -37
  Offset.Left = 330
  ReconnectSlot:SetOffsets(Offset)
  self.Loading_Reconnect.Base:SetRenderOpacity(1)
  if self.WebContent.BindUObject then
    self.WebContent:BindUObject("obj", self, true)
  end
  self.WebContent.OnLoadCompleted:Add(self, function()
    local function Callback()
      self.Loading_Reconnect:Close()
      
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        if self._HasLinkImage then
          self.WebContent:SetVisibility(UE4.ESlateVisibility.Visible)
          self.List_Announcement:SetNavigationRuleCustom(EUINavigation.Right, {
            self,
            self.OnListAnnouncementNavigationRight
          })
        else
          self.WebContent:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
          self.List_Announcement:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        end
        self._HasLinkImage = false
      else
        self.WebContent:SetVisibility(UE4.ESlateVisibility.Visible)
      end
    end
    
    if self:IsExistTimer(self._WebDelay) then
      self:RemoveTimer(self._WebDelay)
    end
    local _, TimerKey = self:AddTimer(1, Callback)
    self._WebDelay = TimerKey
  end)
  self.WebContent.OnLoadError:Add(self, function()
    self.Loading_Reconnect:Close()
    self.WebContent:SetVisibility(UIConst.VisibilityOp.Visible)
  end)
  self.List_Announcement.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Conf = nil
    Content.IsSelected = false
    Content.Parent = self
    return Content
  end)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self:ShowGoBtn(false)
  self.WebContent:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnWebContentNavigationLeft
  })
  self.List_Announcement:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnListAnnouncementNavigationRight
  })
end

function M:OnBeforePopup(RawUrl, Frame)
  RawUrl = AnnouncementUtils:UrlDecode(RawUrl)
  local NewUrl = string.lower(RawUrl)
  DebugPrint("\231\156\139\231\156\139Url\230\152\175\229\149\165 ", NewUrl)
  if string.find(NewUrl, "opengamesystem|") then
    DebugPrint("\229\186\148\232\175\165\230\152\175\230\137\190\229\136\176\228\186\134\231\179\187\231\187\159\232\183\179\232\189\172\231\154\132\229\133\179\233\148\174\229\173\151\228\186\134")
    if self.ShowTag ~= AnnounceCommon.ShowTag.InGame then
      DebugPrint(ErrorTag, "\232\175\165\229\133\172\229\145\138\231\177\187\229\158\139\228\184\141\230\152\175\226\128\156\230\184\184\230\136\143\229\134\133\229\133\172\229\145\138\226\128\157\239\188\140\228\184\141\229\133\129\232\174\184\231\179\187\231\187\159\232\183\179\232\189\172\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\140\229\133\172\229\145\138\230\160\135\233\162\152\239\188\154", self.CurContent.Conf.NoticeTitle)
    end
    local OpenGameSystemInfo = string.split(NewUrl, "opengamesystem|")
    OpenGameSystemInfo = string.split(OpenGameSystemInfo[#OpenGameSystemInfo], ",")
    OpenGameSystemInfo = string.split(OpenGameSystemInfo[1], "\239\188\140")
    local SystemId = tonumber(OpenGameSystemInfo[1])
    if DataMgr.MainUI[SystemId].AnnouncementMain == "AnnouncementMain" then
      DebugPrint(ErrorTag, "\229\133\172\229\145\138\228\184\141\229\135\134\232\135\170\229\183\177\232\183\179\232\135\170\229\183\177")
      return
    end
    if SystemId then
      function self.Owner.OnCloseCallbackFunction()
        UIUtils.OpenSystem(SystemId, "ResumeAnnouncementMain")
      end
      
      self.Owner:OnCloseBtnClicked()
    else
      DebugPrint(ErrorTag, "\232\175\165\229\133\172\229\145\138\231\154\132\232\183\179\232\189\172\232\182\133\233\147\190\230\142\165\230\160\188\229\188\143\228\184\141\229\175\185\239\188\140\228\184\141\229\133\129\232\174\184\231\179\187\231\187\159\232\183\179\232\189\172\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\140\229\133\172\229\145\138\230\160\135\233\162\152\239\188\154", self.CurContent.Conf.NoticeTitle)
    end
    return
  end
  if not string.endswith(NewUrl, "nil") and AnnounceCommon.PlatformName ~= "android" then
    UE4.UKismetSystemLibrary.LaunchURL(RawUrl)
  end
end

function M:Destruct()
  for _, Widget in pairs(self.StyleToContent) do
    if Widget then
      Widget:RemoveFromParent()
    end
  end
  if self:IsExistTimer(self._WebDelay) then
    self:RemoveTimer(self._WebDelay)
  end
  self:UnbindDialogEvent(DialogEvent.OnTitleTabSelected)
  if self.WebContent.UnBindUObject then
    self.WebContent:UnbindUObject("obj", self, true)
  end
  self.WebContent.OnLoadCompleted:Clear()
  self.WebContent.OnLoadError:Clear()
  self.CurrUrl = nil
  self.List_Announcement.OnCreateEmptyContent:Unbind()
  M.Super.Destruct(self)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end

function M:SetUpFixedText()
  self.Text_AnnouncementEmpty:SetText(GText("UI_Notice_None"))
end

function M:PreInitContent(Params, PopupData, Owner)
  M.Super.PreInitContent(self, Params, PopupData, Owner)
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.StyleToContent = {}
  self.CurContent = nil
  self.bNeedRequest = Params.bNeedRequest
  self.HostId = Params.HostId
  self.ShowTag = Params.ShowTag
  self.CurrTabIdx = Params.CurrTabIdx
  if nil == self.bNeedRequest then
    self.bNeedRequest = true
  end
  self:BindDialogEvent(DialogEvent.OnTitleTabSelected, function(self, TabWidget)
    self.CurrTabIdx = TabWidget.Idx
    self.CurrUrl = nil
    if self:IsExistTimer(self._WebDelay) then
      self:RemoveTimer(self._WebDelay)
    end
    self:UpdateAnnoucement()
  end)
  for i, NodeName in ipairs(ReddotNames) do
    self:AddReddotListener(NodeName, i)
  end
  
  function self.Owner.CloseBtnCallbackFunction()
    AudioManager(self):SetEventSoundParam(self, "AnnouncementMainOpen", {ToEnd = 1})
    ForceStopAsyncTask(self, "UpdateAnnoucementTask")
    self:StopAllAnimations()
    self:PlayAnimation(self.Out)
    self.WebContent:SetVisibility(UIConst.VisibilityOp.Collapsed)
    for i, NodeName in ipairs(ReddotNames) do
      self:RemoveReddotListener(NodeName)
    end
  end
  
  self:AddDispatcher(EventID.GameViewportSizeChanged, self, function()
    if self.CurContent then
      self:RealLoadWeb(self.CurContent)
    end
  end)
end

function M:AddReddotListener(ReddotName, TabIdx)
  ReddotManager.AddListener(ReddotName, self, function(self, Count)
    if not self.Owner.DialogTitle then
      DebugPrint(ErrorTag, LXYTag, "\229\133\172\229\145\138\229\188\185\231\170\151\231\154\132Tab\229\135\186\233\148\153\239\188\140\230\152\175\229\155\160\228\184\186\233\128\154\231\148\168\229\188\185\231\170\151\231\154\132Tab\229\136\157\229\167\139\229\140\150\230\151\182\229\186\143\230\148\185\228\186\134")
      return
    end
    local NodeConf = DataMgr.ReddotNode[ReddotName]
    local IsNew = 1 == NodeConf.Type and Count > 0
    self.Owner.DialogTitle.Com_Tab:ShowTabRedDot(TabIdx, IsNew, false, false)
  end)
end

function M:RemoveReddotListener(ReddotName)
  ReddotManager.RemoveListener(ReddotName, self)
end

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  AudioManager(self):PlayUISound(self, "event:/ui/common/window_filter_common", "AnnouncementMainOpen", nil)
  self:UpdateAnnoucement()
  self.GoBtnIndex = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Controller_Go")
  })
end

function M:UpdateAnnoucement()
  if self.bNeedRequest then
    ForceStopAsyncTask(self, "UpdateAnnoucementTask")
    RunAsyncTask(self, "UpdateAnnoucementTask", function(Coroutine)
      AnnouncementUtils:GetAnnouncementDataAsync(self.ShowTag, Coroutine, self.HostId)
      self:RefreshAllAnnouncement()
    end)
    self.bNeedRequest = false
  else
    self:RefreshAllAnnouncement()
  end
  self.List_Announcement:NavigateToIndex(0)
  self:AddTimer(0.1, function()
    local Item = self.List_Announcement:GetItemAt(0)
    if Item and Item.Widget then
      Item.Widget:SetFocus()
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    end
  end)
  self:ShowGoBtn(false)
end

function M:RefreshAllAnnouncement()
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("game_show_notice")
  local Confs = AnnouncementUtils:FilterConfForUI(self.CurrTabIdx, self.ShowTag)
  self:RefreshScrollTips()
  self.List_Announcement:ClearListItems()
  if not Confs or 0 == #Confs then
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    return
  else
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  local bFirst = false
  for _, Conf in pairs(Confs) do
    if not Conf then
    else
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Conf = Conf
      Content.IsSelected = false
      Content.Parent = self
      if not bFirst then
        bFirst = true
        Content.IsSelected = true
      end
      self.List_Announcement:AddItem(Content)
    end
  end
  self.List_Announcement:RequestFillEmptyContent()
end

function M:RealLoadWeb(Content)
  AnnouncementUtils:LoadHtmlContent(Content.Conf, function(DummyUrl, HtmlText)
    if DummyUrl == self.CurrUrl then
      return
    end
    self.CurrUrl = DummyUrl
    self.WebContent:LoadUrl(DummyUrl)
    if HtmlText and UIManager(self):GetGameInputModeSubsystem(self):GetCurrentInputType() == ECommonInputType.Gamepad then
      self._HasLinkImage = string.match(HtmlText, "<a%s+[^>]*href%s*=%s*[\"']([^\"']+)[\"'][^>]*>%s*<img") ~= nil
    end
  end, UIManager(self):GetWidgetRenderSize(self.WebContent).X)
end

function M:ChangeMainContent(Content, bForce)
  if AnnounceCommon.bUseWeb then
    if not self.CurContent or self.CurContent.Conf.NoticeID ~= Content.Conf.NoticeID or bForce then
      if self:IsExistTimer(self._WebDelay) then
        self:RemoveTimer(self._WebDelay)
      end
      self.Loading_Reconnect:ExInit(true, true)
      local SlateColor = UE4.UUIFunctionLibrary.StringToSlateColor("151515FF")
      self.Loading_Reconnect.Base:SetColorAndOpacity(SlateColor.SpecifiedColor)
      self:RemoveTimer(self.GetHtmlHandle)
      local _, key = self:AddTimer(0.1, function()
        self:RealLoadWeb(Content)
      end)
      self.GetHtmlHandle = key
    end
    self.CurContent = Content
  else
    if self.CurrWidget then
      self.CurrWidget:Close()
    end
    self.CurrWidget = self.StyleToContent[Content.Conf.NoticeStyle]
    if not self.CurrWidget then
      self.CurrWidget = self:CreateWidgetNew(AnnounceCommon.StyleToContent[Content.Conf.NoticeStyle])
      self.CurrWidget:AddToParent(self.SizeBox_ContentRoot)
      self.StyleToContent[Content.Conf.NoticeStyle] = self.CurrWidget
    end
    self.CurrWidget:Open(Content)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  self.CurInputDevice = CurInputDevice
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self:AddTimer(0.1, function()
      local Item = self.List_Announcement:GetItemAt(0)
      if Item then
        Item.Widget:SetFocus()
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      end
      self.List_Announcement:NavigateToIndex(0)
    end)
    self:ShowGoBtn(false)
    self:RefreshScrollTips()
  end
end

function M:RefreshScrollTips()
  local Confs = AnnouncementUtils:FilterConfForUI(self.CurrTabIdx, self.ShowTag)
  local length = #Confs
  if length > 0 then
    self:ShowGamepadScrollBtn(true)
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * -self.ScrollSpeed
    self.WebContent:ExecuteJavascript("window.scrollBy(0, " .. a .. ");")
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:ShowGoBtn(bShow)
  if bShow then
    self:ShowGamepadShortcut(self.GoBtnIndex)
  else
    self:HideGamepadShortcut(self.GoBtnIndex)
  end
end

function M:OnWebContentNavigationLeft(MyGeometry, InKeyEvent)
  self:ShowGoBtn(false)
  return self.List_Announcement
end

function M:OnListAnnouncementNavigationRight(MyGeometry, InKeyEvent)
  self:ShowGoBtn(true)
  return self.WebContent
end

return M
