require("UnLua")
local Utils = require("Utils")
local M = Class({
  "BluePrints.UI.WBP.Announcement.View.WBP_AnnouncementContentBase_PC"
})

function M:Open(Content)
  M.Super.Open(self, Content)
  self.Text_Date:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Details:SetText(Content.Conf.NoticeContent)
  if Content.Conf.NoticeBanner then
    local BannerTex = LoadObject(Content.Conf.NoticeBanner)
    assert(BannerTex, "\229\133\172\229\145\138Banner\233\133\141\231\189\174\229\155\190\232\183\175\229\190\132\233\148\153\232\175\175\239\188\140\229\133\172\229\145\138Id:" .. Content.Conf.NoticeID .. "\233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\239\188\154" .. Content.Conf.NoticeBanner)
    self.Image_Announcement:SetBrushResourceObject(BannerTex)
  end
end

return M
