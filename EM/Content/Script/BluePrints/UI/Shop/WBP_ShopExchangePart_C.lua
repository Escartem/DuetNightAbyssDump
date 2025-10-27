require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local TipsWidgetName = {Item_Tip3 = 1, Item_Currency = 2}

function M:Construct()
  self.CurrentCount = 0 == self:GetMaxCount() and 0 or 1
  self:InitCommonWidget()
  self.Text_Exchange:SetText(GText("UI_Shop_ExchangeAmount") .. ":")
  self.Text_ExchangeTitleLeft:SetText(GText("RESOURCE_NAME_99") .. " x1")
  self.Text_ExchangeTitleRight:SetText(GText("UI_SHOP_SUBTAB_NAME_YUESHI") .. " x1")
  self:UpdatePricePanel()
  self:AddTimer(0.01, function()
    if 0 == self:GetMaxCount() then
      self.Owner:ShowDialogTip(TipsWidgetName.Item_Tip3)
      self.Owner:HideDialogTip(TipsWidgetName.Item_Currency)
    else
      self.Owner:ShowDialogTip(TipsWidgetName.Item_Currency)
      self.Owner:HideDialogTip(TipsWidgetName.Item_Tip3)
      self:UpdateCost(1)
    end
    self.Owner.WBP_Com_Tab_Node_ResourceBar:SetResourceBarVisibility(100, false)
  end)
end

function M:PreInitContent(Params, PopupData, Owner)
  M.Super.PreInitContent(self, Params, PopupData, Owner)
  if 0 == self:GetMaxCount() then
    self.Owner.ButtonBar.Btn_Yes:SetText(GText("UI_GameEvent_Goto"))
    self:BindDialogEvent(DialogEvent.OnRightBtnClicked, self.OnBuyBtnClicked)
  else
    self.Owner.ButtonBar.Btn_Yes:SetText(GText("UI_Exchange_Use"))
    self:BindDialogEvent(DialogEvent.OnRightBtnClicked, self.OnExchangeBtnClicked)
  end
end

function M:Destroy()
  self:UnbindDialogEvent(DialogEvent.OnRightBtnClicked)
end

function M:InitCommonWidget()
  local ConfigData = {
    InitValue = self.CurrentCount,
    ClickInterval = 1,
    MinValue = 0 == self:GetMaxCount() and 0 or 1,
    MaxValue = self:GetMaxCount(),
    OwnerPanel = self,
    MinusBtnCallback = self.MinusBtnCallback,
    AddBtnCallback = self.AddBtnCallback,
    SliderChangeCallback = self.SliderChangeCallback,
    EnableMiniBtn = true,
    EnableMaxBtn = true
  }
  self.Com_Slider:Init(ConfigData)
end

function M:UpdateCost(Cost)
  if not self.Owner then
    return
  end
  local CurrencyWidget = self.Owner:GetContentWidgetByName("Item_Currency")
  if not IsValid(CurrencyWidget) then
    return
  end
  local Widgets = CurrencyWidget.HB_Item:GetAllChildren()
  local ChildCurrencyWidget = Widgets:GetRef(1)
  if not IsValid(ChildCurrencyWidget) then
    return
  end
  local Params = {
    ResourceId = 99,
    Denominator = Cost,
    Numerator = Cost
  }
  ChildCurrencyWidget:InitContent(Params)
end

function M:OnExchangeBtnClicked()
  local Avatar = GWorld:GetAvatar()
  
  local function TransformCallBack(Count)
    local ItemId = 100
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded("Resource", ItemId, Count, nil, false, nil, self, false)
    local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if ShopMain then
      ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap)
    end
  end
  
  Avatar:TransformCoin4ToCoin1(self.CurrentCount, TransformCallBack)
end

function M:OnBuyBtnClicked()
  PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
end

function M:MinusBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdatePricePanel()
end

function M:AddBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdatePricePanel()
end

function M:SliderChangeCallback(Value)
  self.CurrentCount = Value
  self:UpdatePricePanel()
end

function M:UpdatePricePanel()
  local MaxCount = self:GetMaxCount()
  if MaxCount <= 0 then
    self.Num_Exchange:SetText("-")
    self.Num_Max_1:SetText("-")
  else
    self.Num_Exchange:SetText(tostring(self.CurrentCount))
    self.Num_Max_1:SetText(tostring(MaxCount))
  end
  self:UpdateCost(self.CurrentCount)
end

function M:GetMaxCount()
  local MaxValue = 0
  local Data = DataMgr.Resource[99]
  local Avatar = GWorld:GetAvatar()
  if Avatar and Data then
    local Resource = Avatar.Resources[99] or {Count = 0}
    MaxValue = Resource.Count
  end
  return MaxValue
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  return IsEventHandled
end

function M:OnContentKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadUp(InKeyName)
  end
  return IsEventHandled
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  return IsEventHandled
end

function M:OnGamePadUp(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  return IsEventHandled
end

return M
