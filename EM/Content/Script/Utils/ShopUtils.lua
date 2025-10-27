require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local MonthCardModel = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local M = {}

function M:IsCanOpenPay(bOpen)
  return true
end

function M:GetSDKRegisterRegionCode()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return "CN"
  end
  local RegionCode = Avatar.SdkRegisterRegionCode
  if not RegionCode or "" == RegionCode then
    RegionCode = "CN"
  end
  return RegionCode
end

function M:GetRegionCode()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return "CN"
  end
  local RegionCode = Avatar.SdkLoginRegionCode
  if not RegionCode or "" == RegionCode then
    RegionCode = "CN"
  end
  return RegionCode
end

function M:GetCurrencyType()
  local RegionCode = self:GetRegionCode()
  assert(DataMgr.CountryRegionCode[RegionCode], "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\229\156\176\229\140\186:" .. RegionCode)
  return DataMgr.CountryRegionCode[RegionCode].MoneySymbol
end

function M:GetCurrencyPrice()
  local RegionCode = self:GetRegionCode()
  assert(DataMgr.CountryRegionCode[RegionCode], "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\229\156\176\229\140\186:" .. RegionCode)
  return "Price" .. DataMgr.CountryRegionCode[RegionCode].MoneyCode
end

function M:HasFreeShop(ShopType)
  local ItemIds = {}
  for _, MainTabId in pairs(DataMgr.Shop[ShopType].MainTabId) do
    local Data = DataMgr.ShopItem2ShopTab[MainTabId]
    assert(Data, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\229\149\134\229\159\142\228\184\187\233\161\181\231\173\190:" .. MainTabId)
    for _, ShopItemData in pairs(Data) do
      for _, ItemId in pairs(ShopItemData) do
        if self:IsFree(ItemId) then
          table.insert(ItemIds, ItemId)
        end
      end
    end
  end
  return #ItemIds > 0, ItemIds
end

function M:HasNewShop(ShopType)
  local ItemIds = {}
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false, ItemIds
  end
  for _, MainTabId in pairs(DataMgr.Shop[ShopType].MainTabId) do
    local Data = DataMgr.ShopItem2ShopTab[MainTabId]
    assert(Data, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\229\149\134\229\159\142\228\184\187\233\161\181\231\173\190:" .. MainTabId)
    for _, ShopItemData in pairs(Data) do
      for _, ItemId in pairs(ShopItemData) do
        if Avatar:CheckShopItemEnhanceRedDot(ItemId) then
          table.insert(ItemIds, ItemId)
        end
      end
    end
  end
  return #ItemIds > 0, ItemIds
end

function M:IsFree(ShopItemId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if 0 == self:GetShopItemPrice(ShopItemId) and Avatar:CheckShopItemCanPurchase(ShopItemId) then
    return true
  end
  return false
end

function M:GetShopItemCutoffData(ShopItemId)
  if not DataMgr.ShopItem2Cutoff[ShopItemId] then
    return
  end
  for _, CutoffId in pairs(DataMgr.ShopItem2Cutoff[ShopItemId]) do
    local CutoffData = DataMgr.Cutoff[CutoffId]
    local NowTime = TimeUtils.NowTime()
    if not (not (NowTime > CutoffData.CutoffStartTime) or CutoffData.CutoffEndTime) or NowTime < CutoffData.CutoffEndTime then
      return CutoffData
    end
  end
end

function M:GetShopItemPrice(ShopItemId)
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  assert(ShopItemData, "\229\149\134\229\147\129\228\184\141\229\173\152\229\156\168\239\188\154" .. ShopItemId)
  if DataMgr.ShopItem2PayGoods[ShopItemId] then
    local PayGoodData = DataMgr.PayGoods[DataMgr.ShopItem2PayGoods[ShopItemId]]
    assert(PayGoodData, "\229\133\133\229\128\188\229\149\134\229\147\129\229\175\185\229\186\148\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. DataMgr.ShopItem2PayGoods[ShopItemId])
    local PriceType = self:GetCurrencyPrice()
    local Price = PayGoodData[PriceType]
    return Price
  end
  local CutoffData = self:GetShopItemCutoffData(ShopItemId)
  if CutoffData then
    return CutoffData.CutoffPrice or ShopItemData.Price
  else
    return ShopItemData.Price
  end
end

function M:GetShopItemPurchaseLimit(ShopItemId)
  if not ShopItemId then
    return 0
  end
  local Avatar = GWorld:GetAvatar()
  local ShopData = DataMgr.ShopItem[ShopItemId]
  local ShopNetData = Avatar.ShopItems[ShopItemId]
  local PurchaseLimit
  if not ShopNetData or not ShopNetData.RemainPurchaseTimes then
    if ShopData then
      PurchaseLimit = ShopData.PurchaseLimit
    end
  else
    PurchaseLimit = ShopNetData.RemainPurchaseTimes
  end
  return PurchaseLimit or -1
end

function M:GetShopItemCanShow(ShopItemId)
  assert(DataMgr.ShopItem[ShopItemId], "\229\149\134\229\147\129\228\184\141\229\173\152\229\156\168\239\188\154" .. ShopItemId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar:CheckIsEffective(ShopItemId) then
    return false
  end
  if 0 == self:GetShopItemPurchaseLimit(ShopItemId) and not DataMgr.ShopItem[ShopItemId].RefreshTime and not DataMgr.ShopItem[ShopItemId].SoldOutDisplay then
    return false
  end
  if Avatar:CheckShopItemHasRequire(ShopItemId) then
    return false
  end
  if Avatar:CheckShopItemHasRexclusionGroup(ShopItemId) then
    return false
  end
  if Avatar:CheckShopItemUnique(ShopItemId) and not DataMgr.ShopItem[ShopItemId].SoldOutDisplay then
    return false
  end
  return true
end

function M:RefreshShopRefreshTime(RefreshTime, Widget)
  local ShopRefreshBeginTime = CommonConst.ShopRefreshBeginTime
  local StartTime = os.time({
    year = ShopRefreshBeginTime[1],
    month = ShopRefreshBeginTime[2],
    day = ShopRefreshBeginTime[3],
    hour = ShopRefreshBeginTime[4],
    min = ShopRefreshBeginTime[5],
    sec = ShopRefreshBeginTime[6]
  })
  local NextRefreshTimeTable = os.date("*t", StartTime)
  local CurrentTime = TimeUtils.NowTime()
  local Interval = 0
  local timeDifference = 0
  local RemainRefreshTime = 0
  if RefreshTime.HOUR then
    Interval = RefreshTime.HOUR * 60 * 60
    timeDifference = CurrentTime - StartTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.DAY then
    Interval = RefreshTime.DAY * 60 * 60 * 24
    timeDifference = CurrentTime - StartTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.WEEK then
    StartTime = StartTime - CommonConst.SECOND_IN_WEEKDAY
    local refresh_hms = CommonConst.GAME_REFRESH_HMS
    local LastRefreshTime = TimeUtils.NextWeeklyRefreshTime(StartTime, refresh_hms)
    Interval = RefreshTime.WEEK * 7 * 60 * 60 * 24
    timeDifference = CurrentTime - LastRefreshTime
    RemainRefreshTime = Interval - timeDifference % Interval
  elseif RefreshTime.MONTH then
    while M:IsLaterThanNow(NextRefreshTimeTable) == false do
      if NextRefreshTimeTable.month + RefreshTime.MONTH > 12 then
        NextRefreshTimeTable.year = NextRefreshTimeTable.year + 1
        NextRefreshTimeTable.month = NextRefreshTimeTable.month + RefreshTime.MONTH - 12
      else
        NextRefreshTimeTable.month = NextRefreshTimeTable.month + RefreshTime.MONTH
      end
    end
    local NextRefreshTime = os.time(NextRefreshTimeTable)
    RemainRefreshTime = os.difftime(NextRefreshTime, TimeUtils.NowTime())
  end
  local RemainTimeStr = M:GetRefreshTimeStr(RemainRefreshTime)
  Widget:SetText(RemainTimeStr)
end

function M:GetRefreshTimeStr(RefreshTime)
  local RemainTimeStr = ""
  local TimeCount = 0
  if RefreshTime > 86400 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), math.floor(RefreshTime / 86400))
    RefreshTime = RefreshTime % 86400
  end
  if RefreshTime > 3600 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), math.floor(RefreshTime / 3600))
    RefreshTime = RefreshTime % 3600
  end
  if RefreshTime > 60 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), math.floor(RefreshTime / 60))
    RefreshTime = RefreshTime % 60
  end
  if RefreshTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), RefreshTime)
  end
  return RemainTimeStr
end

function M:UpdateLimitTime(ShopItemEndTime)
  local StartTiem = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(TimeUtils.NowTime())
  local EndTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(ShopItemEndTime)
  local RemainTime = UKismetMathLibrary.Subtract_DateTimeDateTime(EndTime, StartTiem)
  local RemainTimeStr = ""
  local TimeCount = 0
  if UKismetMathLibrary.GetDays(RemainTime) > 0 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(RemainTime))
  end
  if UKismetMathLibrary.GetHours(RemainTime) > 0 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), UKismetMathLibrary.GetHours(RemainTime))
  end
  if UKismetMathLibrary.GetMinutes(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), UKismetMathLibrary.GetMinutes(RemainTime))
  end
  if UKismetMathLibrary.GetSeconds(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), UKismetMathLibrary.GetSeconds(RemainTime))
  end
  return string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr)
end

function M:IsLaterThanNow(Time)
  local CurrentYear = os.date("*t", TimeUtils.NowTime()).year
  local CurrentMonth = os.date("*t", TimeUtils.NowTime()).month
  local CurrentDay = os.date("*t", TimeUtils.NowTime()).day
  local CurrentHour = os.date("*t", TimeUtils.NowTime()).hour
  if CurrentYear > Time.year then
    return false
  elseif CurrentYear == Time.year then
    if CurrentMonth > Time.month then
      return false
    elseif CurrentMonth == Time.month then
      if CurrentDay > Time.day then
        return false
      elseif CurrentDay == Time.day and CurrentHour >= Time.hour then
        return false
      end
    end
  end
  return true
end

function M:CanPurchase(ShopItemData, PriceType, Price)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  ShopItemData.PurchaseFailRes = 0
  local ShopItemRemainTimes = self:GetShopItemPurchaseLimit(ShopItemData.ItemId)
  if 0 == ShopItemRemainTimes then
    ShopItemData.PurchaseFailRes = 1
    return false
  end
  if Avatar:CheckShopItemUnique(ShopItemData.ItemId) then
    ShopItemData.PurchaseFailRes = 6
    return false
  end
  if ShopItemData.UnlockLevel and Avatar.Level < ShopItemData.UnlockLevel then
    ShopItemData.PurchaseFailRes = 3
    return false
  end
  if DataMgr.ShopItem2PayGoods[ShopItemData.ItemId] then
    return true
  end
  local PriceCount = Avatar.Resources[PriceType] and Avatar.Resources[PriceType].Count or 0
  if Price > PriceCount then
    if ShopItemData.PriceType == CommonConst.Coins.Coin1 then
      local totalCount = PriceCount + (Avatar.Resources[CommonConst.Coins.Coin4] and Avatar.Resources[CommonConst.Coins.Coin4].Count or 0)
      if Price <= totalCount then
        ShopItemData.PurchaseFailRes = 4
      else
        ShopItemData.PurchaseFailRes = 5
      end
      return true
    elseif ShopItemData.PriceType == CommonConst.Coins.Coin4 then
      ShopItemData.PurchaseFailRes = 5
      return true
    end
    ShopItemData.PurchaseFailRes = 2
    return false
  end
  return true
end

function M:Purchase(ShopItemData, ParentWidget)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if DataMgr.ShopItem2PayGoods[ShopItemData.ItemId] then
    if 0 == ShopItemData.PurchaseFailRes then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return false
      end
      if not HeroUSDKSubsystem():IsHeroSDKEnable() then
        local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
        GMFunctionLibrary.ExecConsoleCommand(GWorld.GameInstance, "sgm pgi " .. DataMgr.ShopItem2PayGoods[ShopItemData.ItemId])
        return
      end
      Avatar:RequestPay(DataMgr.ShopItem2PayGoods[ShopItemData.ItemId], function(ret, OrderId, CallbackUrl)
        if not ErrorCode:Check(ret) then
          return
        end
        local PaymentParameters = FHeroUPaymentParameters()
        PaymentParameters.goodsId = DataMgr.ShopItem2PayGoods[ShopItemData.ItemId]
        PaymentParameters.cpOrder = OrderId
        PaymentParameters.callbackUrl = CallbackUrl
        local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
        HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
        local TrackInfo = {}
        TrackInfo.product_id = DataMgr.ShopItem2PayGoods[ShopItemData.ItemId]
        if ShopItemData.ItemId then
          TrackInfo.item_id = ShopItemData.ItemId
          TrackInfo.product_type = DataMgr.ShopItem[ShopItemData.ItemId].ItemType
        end
        TrackInfo.game_order_id = OrderId
        TrackInfo.order_create_time = TimeUtils.NowTime()
        HeroUSDKSubsystem(self):UploadTrackLog_Lua("charge_client", TrackInfo)
      end)
    else
      UIManager(self):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    end
    return
  end
  if 0 ~= ShopItemData.PurchaseFailRes then
    if 1 == ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    elseif 2 == ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[ShopItemData.PriceType].ResourceName)), 1.0)
    elseif 3 == ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), ShopItemData.UnlockLevel), 1.0)
    elseif 6 == ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1.0, "CommonToastMain")
    elseif 4 == ShopItemData.PurchaseFailRes then
      local PopUpId = 100136
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      local ItemName = ItemUtils:GetDropName(ShopItemData.TypeId, ShopItemData.ItemType)
      local PriceCount = Avatar.Resources[ShopItemData.PriceType] and Avatar.Resources[ShopItemData.PriceType].Count or 0
      local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
      if string.find(PopoverText, "&ResourceName&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName1&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName2&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ItemName))
      end
      if string.find(PopoverText, "&Num1&") then
        PopoverText = string.gsub(PopoverText, "&Num1&", ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount)
      end
      if string.find(PopoverText, "&Num2&") then
        PopoverText = string.gsub(PopoverText, "&Num2&", ParentWidget.CurrentCount)
      end
      
      local function Confirm()
        local Coin4Count = 0
        if Avatar.Resources[CommonConst.Coins.Coin4] then
          Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4].Count
        end
        if Coin4Count < ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount then
          local function JumpToShop()
            PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
          end
          
          local Params = {}
          Params.Title = GText("UI_COMMONPOP_TITLE_100137")
          Params.ShortText = GText("UI_COMMONPOP_TEXT_100137")
          Params.LeftCallbackObj = self
          Params.RightCallbackObj = self
          Params.RightCallbackFunction = JumpToShop
          UIManager(self):ShowCommonPopupUI(100137, Params, self)
        else
          self:SendExchangeRequest(ShopItemData.ItemId, ParentWidget.CurrentCount)
        end
      end
      
      local ItemList = {}
      local Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4] and Avatar.Resources[CommonConst.Coins.Coin4].Count or 0
      table.insert(ItemList, {
        ItemId = CommonConst.Coins.Coin4,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Coin4Count,
        ItemNeed = ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount
      })
      local Params = {
        RightCallbackFunction = Confirm,
        ItemList = ItemList,
        ShortText = PopoverText
      }
      UIManager(self):ShowCommonPopupUI(PopUpId, Params)
    elseif 5 == ShopItemData.PurchaseFailRes then
      local function JumpToShop()
        PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
      end
      
      local Params = {}
      Params.Title = GText("UI_COMMONPOP_TITLE_100138")
      Params.ShortText = GText("UI_COMMONPOP_TEXT_100198")
      Params.LeftCallbackObj = ParentWidget
      Params.RightCallbackObj = ParentWidget
      Params.RightCallbackFunction = JumpToShop
      UIManager(self):ShowCommonPopupUI(100137, Params, ParentWidget.ParentWidget)
    end
    return
  end
  local ShopMain = UIManager(self):GetUIObj("ShopMain")
  ShopMain:BlockAllUIInput(true)
  Avatar:PurchaseShopItem(ShopItemData.ItemId, 1)
end

function M:SendPurchaseRequest(ShopItemId, CurrentCount)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:PurchaseShopItem(ShopItemId, CurrentCount)
  local ShopMain = UIManager(self):GetUIObj("ShopMain")
  local ShopActivity = UIManager(self):GetUIObj("ActivityShop")
  local CommonShopActivity = UIManager(self):GetUIObj("ShopActivity")
  if ShopMain then
    ShopMain:BlockAllUIInput(true)
  end
  if ShopActivity then
    ShopActivity:BlockAllUIInput(true)
  end
  if CommonShopActivity then
    CommonShopActivity:BlockAllUIInput(true)
  end
end

function M:SendExchangeRequest(ShopItemId, CurrentCount, NotShow)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function Callback(Ret, ShopItemId, Count, PackRewards)
    EventManager:FireEvent(EventID.OnPurchaseShopItem, Ret, ShopItemId, CurrentCount)
    local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if ShopMain then
      ShopMain:BlockAllUIInput(false)
    end
    if Ret == ErrorCode.RET_SUCCESS then
      local ShopItemData = DataMgr.ShopItem[ShopItemId]
      if not NotShow then
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemSingle")
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemPackage")
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(ShopItemData.ItemType, ShopItemData.TypeId, ShopItemData.TypeNum * Count, PackRewards, ShopItemData.IsSpPopup)
      end
      EventManager:FireEvent(EventID.OnPurchaseShopItemSuccess, Ret, ShopItemData.TypeId, CurrentCount, PackRewards)
    elseif Ret == ErrorCode.RET_SHOPITEM_IS_NOT_VALID then
      UIManager(GWorld.GameInstance):UnLoadUI("ShopItemSingle")
      UIManager(GWorld.GameInstance):UnLoadUI("ShopItemPackage")
      UIManager(GWorld.GameInstance):ShowError(Ret, 1.0, "CommonToastMain")
    elseif Ret == ErrorCode.RET_SHOPITEM_MONEY_NEEDED_NOT_ENOUGH then
      UIManager(GWorld.GameInstance):ShowError(Ret, 1.0, "CommonToastMain")
    elseif Ret == ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO then
      UIManager(GWorld.GameInstance):ShowError(Ret, 1.0, "CommonToastMain")
    end
    if ShopMain then
      ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap, true, true)
    end
  end
  
  Avatar:PurchaseShopItemUseCoin1(ShopItemId, CurrentCount, Callback)
end

local ForbiddenBannerBp = {WBP_Shop_Banner_MonthCard = true}

function M:GetBannerInfo()
  local BannerData = {}
  local SoldOutBannerData = {}
  local Time = TimeUtils.NowTime()
  local bForbiddenPurchase = not self:IsCanOpenPay(true)
  for _, v in pairs(DataMgr.ShopBannerTab) do
    if (not bForbiddenPurchase or not ForbiddenBannerBp[v.Bp]) and Time >= v.StartTime and (not v.EndTime or Time <= v.EndTime) then
      if v.SoldOutSinkBanner and v.ItemId and 0 == self:GetShopItemPurchaseLimit(v.ItemId) or v.IsMonthlyCardBanner and MonthCardModel:IsMonthCardPurchased() then
        table.insert(SoldOutBannerData, v)
      else
        table.insert(BannerData, v)
      end
    end
  end
  table.sort(BannerData, function(a, b)
    return a.Sequence < b.Sequence
  end)
  table.sort(SoldOutBannerData, function(a, b)
    return a.Sequence < b.Sequence
  end)
  local Res = {}
  for _, ShopData in ipairs(BannerData) do
    table.insert(Res, ShopData)
  end
  for _, ShopData in ipairs(SoldOutBannerData) do
    table.insert(Res, ShopData)
  end
  return Res
end

function M:GetComplexInfo()
  local ComplexData = {}
  for _, v in pairs(DataMgr.ComplexTab) do
    table.insert(ComplexData, v)
  end
  table.sort(ComplexData, function(a, b)
    return a.EntrySort > b.EntrySort
  end)
  return ComplexData
end

function M:GetShopSkinList()
  local Shop = UIManager(self):GetLastJumpPage()
  if Shop then
    return Shop.Index2ShopSkin, Shop.ShopSkin2Index, Shop.SkinCount
  end
  local ShopMain = UIManager(self):GetUIObj("ShopMain")
  if ShopMain then
    return ShopMain.Index2ShopSkin, ShopMain.ShopSkin2Index, ShopMain.SkinCount
  end
  local ShopActivity = UIManager(self):GetUIObj("ActivityShop")
  if ShopActivity then
    return ShopActivity.Index2ShopSkin, ShopActivity.ShopSkin2Index, ShopActivity.SkinCount
  end
  local CommonShopActivity = UIManager(self):GetUIObj("ShopActivity")
  if CommonShopActivity then
    return CommonShopActivity.Index2ShopSkin, CommonShopActivity.ShopSkin2Index, CommonShopActivity.SkinCount
  end
  return nil
end

function M:GetShopItemDataById(Id, ShopItemType, bCheck)
  local TypeId2ShopItems = DataMgr.TypeId2ShopItem[ShopItemType]
  TypeId2ShopItems = TypeId2ShopItems and TypeId2ShopItems[Id]
  local ShopItemId, ShopItemData
  if TypeId2ShopItems then
    local Priority
    for _, value in pairs(TypeId2ShopItems) do
      local Data = DataMgr.ShopItem[value]
      if Data and (nil == Priority or Priority < (Data.IsAccessItem or Priority)) then
        local bChecked
        if bCheck then
          Data = setmetatable({}, {__index = Data})
          bChecked = self:GetShopItemCanShow(value) and self:CanPurchase(Data, nil, 0)
        else
          bChecked = true
        end
        if bChecked then
          Priority = Data.IsAccessItem
          ShopItemId = value
          ShopItemData = Data
        end
      end
    end
  end
  return ShopItemId, ShopItemData
end

return M
