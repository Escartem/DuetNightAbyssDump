require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:PlayAnimation(self.In)
  if ShopUtils:GetSDKRegisterRegionCode() == "JP" then
    self.Group_JPRecharge:SetVisibility(ESlateVisibility.Visible)
    self.Btn_JPRechargeLink.Button_Area.OnClicked:Add(self, self.OpenJPUrl)
    self.JumPUrl = DataMgr.PolicyLink.PaymentPolicyJP.ChinaCN
    self.Text_JPRecharge:SetText(GText("UI_Shop_JP_Link"))
  elseif ShopUtils:GetSDKRegisterRegionCode() == "KR" then
    self.Group_JPRecharge:SetVisibility(ESlateVisibility.Visible)
    self.Btn_JPRechargeLink.Button_Area.OnClicked:Add(self, self.OpenJPUrl)
    self.JumPUrl = DataMgr.PolicyLink.PaymentPolicyKR.ChinaCN
    self.Text_JPRecharge:SetText(GText("UI_Shop_KR_Link"))
  else
    self.Group_JPRecharge:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitRechargeInfo(RechargeInfo)
  for i = 1, 6 do
    assert(RechargeInfo[i], "\229\149\134\229\159\142\229\133\133\229\128\188\233\161\181\233\157\162\229\149\134\229\147\129\230\149\176\231\155\174\233\148\153\232\175\175\239\188\140\230\156\170\230\137\190\229\136\176\231\172\172" .. i .. "\228\184\170\229\149\134\229\147\129")
    local Widget = self["Recharge_Item_" .. i]
    local PriceType = ShopUtils:GetCurrencyPrice()
    local Price = DataMgr.PayGoods[DataMgr.ShopItem2PayGoods[RechargeInfo[i].ItemId]][PriceType]
    local Count = DataMgr.ShopItem[RechargeInfo[i].ItemId].TypeNum
    Widget:SetRechargeItemCost(RechargeInfo[i], Price, Count)
  end
end

function M:OpenJPUrl()
  UE4.UKismetSystemLibrary.LaunchURL(self.JumPUrl)
end

return M
