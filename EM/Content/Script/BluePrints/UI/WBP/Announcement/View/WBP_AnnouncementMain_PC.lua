require("UnLua")
local UIUtils = require("Utils.UIUtils")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.GroupTag = 1
  self.StyleToContent = {}
  self.bNeedRequest, self.HostId = ...
  if self.bNeedRequest == nil then
    self.bNeedRequest = true
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/window_filter_common", "AnnouncementMainOpen", nil)
  self:UpdateAnnoucement()
end

function M:UpdateAnnoucement()
  RunAsyncTask(self, "UpdateAnnoucementTask", function(Coroutine)
    if self.bNeedRequest then
      AnnouncementUtils:GetAnnouncementDataAsync(Coroutine, self.HostId)
    end
    self:RefreshAllAnnouncement()
  end)
end

function M:RefreshAllAnnouncement()
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("game_show_notice")
  local Confs = AnnouncementUtils.Confs
  self.List_Announcement:ClearListItems()
  if not Confs or 0 == #Confs then
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  else
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.CurContent = nil
  for _, Conf in pairs(Confs) do
    if not Conf then
    else
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Conf = Conf
      Content.IsSelected = false
      Content.Parent = self
      if not self.CurContent then
        self.CurContent = Content
        Content.IsSelected = true
      end
      self.List_Announcement:AddItem(Content)
    end
  end
  self:AddTimer(0.01, function()
    local TabUIs = self.List_Announcement:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.List_Announcement, TabUIs) - TabUIs:Length()
    if RestCount <= 0 then
      return
    end
    for i = 1, RestCount do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Conf = nil
      Content.IsSelected = false
      Content.Parent = self
      self.List_Announcement:AddItem(Content)
    end
    self.List_Announcement:RegenerateAllEntries()
    self.List_Announcement:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  end)
end

function M:Construct()
  self.Btn_FullClose.OnClicked:Add(self, self.OnCloseClick)
  self.Common_Button_Close_PC:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Common_Button_Close_PC:BindEventOnClicked(self, function()
    self:Close()
  end)
  self:SetUpFixedText()
end

function M:SetUpFixedText()
  self.Common_DialogTitle_PC.Text_Title:SetText(GText("UI_GameAnnouncement_MainTitle"))
  self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  self.Text_AnnouncementEmpty:SetText(GText("UI_Notice_None"))
  self.HB_TimeLoaction:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self.Btn_FullClose.OnClicked:Remove(self, self.OnCloseClick)
  self.Common_Button_Close_PC:UnBindEventOnClickedByObj(self)
  for _, Widget in pairs(self.StyleToContent) do
    if Widget then
      Widget:RemoveFromParent()
    end
  end
  M.Super.Destruct(self)
end

function M:OnCloseClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:Close()
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "AnnouncementMainOpen", {ToEnd = 1})
  ForceStopAsyncTask(self, "UpdateAnnoucementTask")
  M.Super.Close(self)
end

function M:ChangeMainContent(Content)
  if self.CurrWidget then
    self.CurrWidget:Close()
  end
  self.CurrWidget = self.StyleToContent[Content.Conf.NoticeStyle]
  if not self.CurrWidget then
    self.CurrWidget = self:CreateWidgetNew(AnnounceCommon.StyleToContent[Content.Conf.NoticeStyle])
    self.CurrWidget:AddToParent(self.SizeBox_ContentRoot)
    self.StyleToContent[Content.Conf.NoticeStyle] = self.CurrWidget
  end
  self.SizeBox_ContentRoot:EndInertialScrolling()
  self.SizeBox_ContentRoot:ScrollToStart()
  self.CurrWidget:Open(Content)
end

return M
