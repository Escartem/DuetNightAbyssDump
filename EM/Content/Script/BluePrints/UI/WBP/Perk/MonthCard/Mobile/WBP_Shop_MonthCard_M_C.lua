require("UnLua")
local MonthCardModel = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local M = Class({
  "BluePrints.UI.WBP.Perk.MonthCard.View.MonthCardBaseView"
})

function M:Construct()
  self:InitBaseView()
end

function M:InitBannerPage(BannerId)
  self.BannerId = BannerId
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/shop_gift_pack_page_in", nil, nil)
  self:RefreshPageView()
end

function M:Close()
  self:PlayAnimation(self.Out)
  M.Super.Close(self)
  self:OnViewClose()
end

return M
