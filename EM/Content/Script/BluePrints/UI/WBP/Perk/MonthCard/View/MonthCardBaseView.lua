require("UnLua")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local MonthCardController = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController")
local MonthCardModel = MonthCardController:GetModel()
local ItemUtil = require("Utils.ItemUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitBaseView()
  self.Btn_CardRefresh:Init({
    OwnerWidget = self,
    TextContent = GText(MonthCardCommon.TextMonthCardDetail),
    SoundFunc = function(obj)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
    end,
    SoundFuncReceiver = self
  })
  self.Btn_Info:Init({
    OwnerWidget = self,
    TextContent = GText(MonthCardCommon.TextMonthCardInfo),
    SoundFunc = function(obj)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
    end,
    SoundFuncReceiver = self
  })
  self.Btn_Buy.OnClicked:Add(self, self.OnBuyBtnClicked)
  self.Btn_Buy.OnHovered:Add(self, self.OnBuyBtnHovered)
  MonthCardController:OnShopMonthCardOpen()
  MonthCardController:RegisterEvent(self)
  self:AddInputMethodChangedListen()
  self.Com_ItemHead:SetDisableAction(true)
end

function M:UpdateStaticWidget()
  self.Text_TitleFront:SetText(GText(MonthCardCommon.TextTitleFront))
  self.Text_TitleBack:SetText(GText(MonthCardCommon.TextTitleBack))
  self.Text_GetTitle:SetText(GText(MonthCardCommon.TextGetReward))
  self.Text_EveryDayGetTitle:SetText(GText(MonthCardCommon.TextEveryDayGetReward))
  self.Text_BtnBuy:SetText(GText(MonthCardCommon.TextBuyButton))
end

function M:UpdateRewardInfo()
  local RewardHeadIcon = MonthCardModel:GetRewardHeadIconInfo()
  local RewardItem = MonthCardModel:GetRewardItem()
  local RewardEveryDayItem = MonthCardModel:GetRewardEveryDayItem()
  local Avatar = MonthCardModel:GetAvatar()
  if RewardHeadIcon then
    local ItemID = RewardHeadIcon.ItemId
    if RewardHeadIcon.ItemType == "HeadFrame" and DataMgr.HeadFrame[ItemID] then
      local Name = GText(DataMgr.HeadFrame[ItemID].Name)
      self.Com_ItemHead:SetHeadFrame(ItemID)
      self.Com_ItemHead:SetHeadIconById(Avatar.HeadIconId)
      self.Text_HeadFrame:SetText(GText(Name))
      self.WS_Item:SetActiveWidgetIndex(0)
    else
      local Name = ItemUtil.GetItemName(ItemID, RewardHeadIcon.ItemType)
      local Icon = ItemUtil.GetItemIcon(ItemID, RewardHeadIcon.ItemType)
      self.Image_ItemIcon:SetBrushResourceObject(Icon)
      self.Text_HeadFrame:SetText(GText(Name))
      self.WS_Item:SetActiveWidgetIndex(1)
    end
  end
  if RewardItem then
    local ItemID = RewardItem.ItemId
    local Icon = ItemUtil.GetItemIcon(ItemID, RewardItem.ItemType)
    local Name = GText(ItemUtil.GetItemName(ItemID, RewardItem.ItemType))
    self.Image_MoonStone:SetBrushResourceObject(Icon)
    self.Text_OnceStone:SetText(Name .. "*" .. RewardItem.Count)
  end
  if RewardEveryDayItem then
    local ItemID = RewardEveryDayItem.ItemId
    local Icon = ItemUtil.GetItemIcon(ItemID, RewardEveryDayItem.ItemType)
    local Name = GText(ItemUtil.GetItemName(ItemID, RewardEveryDayItem.ItemType))
    self.Image_MoonStone_2:SetBrushResourceObject(Icon)
    self.Text_EveryDayStone:SetText(Name .. "*" .. RewardEveryDayItem.Count)
  end
end

function M:UpdateMonthardPurchased()
  local bIsMonthCardPurchased = MonthCardModel:IsMonthCardPurchased()
  if bIsMonthCardPurchased then
    self.Group_CardState:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Group_CardState:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateMonthCardLeftDays()
end

function M:UpdatePrice()
  local MonthCardPrice = MonthCardModel:GetMonthCardPrice()
  local PriceSymbol = MonthCardModel:GetPriceSymbol()
  self.Text_PriceNum:SetText(MonthCardPrice)
  self.Text_PriceNum_Symbol:SetText(PriceSymbol)
end

function M:UpdateMonthCardLeftDays()
  local bIsMonthCardPurchased = MonthCardModel:IsMonthCardPurchased()
  local Com_Time = self.Com_Time
  if bIsMonthCardPurchased then
    local MonthCardLeftDays = MonthCardModel:GetMonthCardLeftDays()
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(MonthCardLeftDays)
    Com_Time.Text_TimeDesc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    Com_Time:SetTimeText(GText(MonthCardCommon.TextLastDay), RemainTimeDict)
    Com_Time.Image_ClockIcon:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    Com_Time.Image_ClockIcon:SetVisibility(UIConst.VisibilityOp.Collapsed)
    Com_Time.Text_TimeDesc:SetVisibility(UIConst.VisibilityOp.Collapsed)
    Com_Time.Text_TimeTitle:SetText(GText(MonthCardCommon.TextNotValidMohthCard))
  end
end

function M:UpdateMonthCardSaleTime()
  local RemainTime = MonthCardModel:GetMonthCardCanPurchaseTime()
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(RemainTime)
  local Com_CardRefreshTime = self.Com_CardRefreshTime
  Com_CardRefreshTime:SetTimeText(GText(MonthCardCommon.TextMonthCardVaildTime), RemainTimeDict)
end

function M:UpdatePurchaseState()
  local bIsMonthCardCanPurchase = MonthCardModel:IsMonthCardCanPurchase()
  self.Btn_Buy:SetForbidden(not bIsMonthCardCanPurchase)
end

function M:OnBuyBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
  if not MonthCardModel:IsMonthCardCanPurchase() then
    self:OnButBtnClickedForbid()
    return
  end
  MonthCardController:TryPurchaseMonthCard()
end

function M:OnBuyBtnHovered()
  if self.Btn_Buy:GetForbidden() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large_crystal", nil, nil)
end

function M:OnButBtnClickedForbid()
  MonthCardController:DisplayForbiddenTip()
end

function M:RefreshPageView()
  self:UpdateStaticWidget()
  self:UpdateRewardInfo()
  self:UpdateMonthardPurchased()
  self:UpdatePrice()
  self:UpdatePurchaseState()
  self:UpdateMonthCardSaleTime()
  self.Btn_Info.Btn_Click:SetChecked(false)
  self.Btn_CardRefresh.Btn_Click:SetChecked(false)
  self.HandleAKeyDown = nil
end

function M:NotifyTimeTick()
  self:UpdateMonthCardSaleTime()
  self:UpdateMonthCardLeftDays()
end

function M:NotifyMonthCardRefresh()
  self:RefreshPageView()
end

function M:NotifyPurchasedRefresh()
  self:UpdateMonthardPurchased()
end

function M:NotifyPurchaseStateRefresh()
  self:UpdatePurchaseState()
end

function M:OnViewClose()
  MonthCardController:OnShopMonthCardClose()
  MonthCardController:UnRegisterEvent(self)
end

function M:PlayAnimationIn()
  self:PlayAnimation(self.In)
end

function M:PlayAnimationOut()
  self:PlayAnimation(self.Out)
end

AssembleComponents(M)
return M
