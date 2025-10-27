require("UnLua")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
local Utils = require("Utils")
local ReddotNodeName = DataMgr.ReddotNode.AnnouncementItems.Name
local Component = {}

function Component:BindForAnnouncement()
  self.Btn_Announcement:Construct()
  self.Btn_Announcement:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Announcement:BindEventOnReleased(self, self.OnClickAnnoucement)
  local HeroUSDKSubsystem = HeroUSDKSubsystem(self)
  local VisibilityTag = HeroUSDKSubsystem:IsHeroSDKEnable() and "Collapsed" or "SelfHitTestInvisible"
  self.Btn_Announcement:SetVisibility(UIConst.VisibilityOp[VisibilityTag])
  ReddotManager.AddListener(ReddotNodeName, self, self.UpdateAnnoucementReddot)
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    self:OpenAnnouncementOnce(true)
  end
end

function Component:UnbindForAnnouncement()
  self.Btn_Announcement:UnBindEventOnReleased(self, self.OnClickAnnoucement)
  ReddotManager.RemoveListener(ReddotNodeName, self)
end

function Component:UpdateAnnoucementReddot(Count)
  self.Btn_Announcement.New:SetEnable(Count > 0)
end

function Component:OpenAnnouncementOnce(bReset)
  self.Btn_Announcement:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.Coroutine or UIManager(self):GetUIObj(DataMgr.SystemUI.AnnouncementMain.UIName) then
    return
  end
  if not self.ServerInfo then
    Utils.Traceback(ErrorTag, "\229\133\172\229\145\138\232\135\170\229\138\168\229\188\185\229\135\186\229\164\177\232\180\165\239\188\140\231\153\187\229\189\149\230\168\161\229\157\151\230\143\144\228\190\155\231\154\132ServerInfo\230\151\160\230\149\136\239\188\129\239\188\129\239\188\129")
    return
  end
  local HostId = self.ServerInfo.hostnum
  if bReset then
    AnnouncementUtils:ResetConf()
  end
  self.Coroutine = nil
  self.Coroutine = coroutine.create(function()
    DebugPrint("[Laixiaoyang]LoginMain::OpenAnnouncementOnce  \232\135\170\229\138\168\229\188\185\229\135\186\230\184\184\230\136\143\229\133\172\229\145\138")
    AnnouncementUtils:TrySetServerAreaNew(HostId)
    if not AnnouncementUtils.bInit then
      AnnouncementUtils:GetAnnouncementDataAsync(AnnounceCommon.ShowTag.InLogin, self.Coroutine, HostId)
    end
    if AnnouncementUtils.HasNewAdd then
      self:OnClickAnnoucement(false)
      AnnouncementUtils:ResetNew()
      HeroUSDKSubsystem(self):MSDKUploadCommonEventByEventName("game_anc")
    end
    self.Coroutine = nil
  end)
  coroutine.resume(self.Coroutine)
end

function Component:ClearOpenAnnouncementAsync()
  ForceStopAsyncTask(self, "OpenAnnouncementAsync")
end

function Component:OnClickAnnoucement(bNeedRequest)
  if nil == bNeedRequest then
    bNeedRequest = not AnnouncementUtils.bInit
  end
  self:ClearOpenAnnouncementAsync()
  RunAsyncTask(self, "OpenAnnouncementAsync", function(Coroutine)
    AnnouncementUtils:OpenAnnouncementMain(AnnounceCommon.ShowTag.InLogin, bNeedRequest, self.ServerInfo.hostnum, self, Coroutine)
  end)
end

return Component
