require("UnLua")
local M = Class("BluePrints.UI.Shop.Banner.WBP_Shop_Banner_Base_C")

function M:Construct()
  M.Super.Construct(self)
  local BannerTab = self:GetBannerTabData("WBP_Shop_Banner_SkinSaiqi01")
  local PageConfigData = BannerTab and DataMgr.CharTrialEvent[BannerTab.ActivityId]
  if not PageConfigData then
    return
  end
  self.PageConfig = PageConfigData
  self.BannerTab = BannerTab
  self.TryOut_Title_SkinSaiqi01.Text_Title:SetText(GText(BannerTab.Text1))
  self.Text_ActivityDesc:SetText(GText(BannerTab.Text2))
  self.TryOutChar_Title:Init(PageConfigData.CharId, PageConfigData.SkinId, PageConfigData.ColorVarName, nil, self)
  self.Text_BtnGoto:SetText(GText("UI_Controller_Go"))
  self.Btn_Goto.OnClicked:Add(self, self.OnGoToInterface)
  self.Btn_Goto.OnHovered:Add(self, self.OnGoToHovered)
  self.EndTime = self.BannerTab.EndTime
end

return M
