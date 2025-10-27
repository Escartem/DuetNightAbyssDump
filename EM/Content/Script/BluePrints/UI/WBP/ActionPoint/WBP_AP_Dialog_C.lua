require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
local TimeUtils = require("Utils.TimeUtils")

function M:Construct()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.RecoverItemId = 204
  self.ActionPointId = 103
  self.MoonStoneId = 100
  self.ActionPointData = self:GetResourceContent(self.ActionPointId)
  self.Close_Area.OnClicked:Add(self, self.CloseSelf)
  self.ItemCost_1.Btn_Area.OnClicked:Add(self, self.OnClickMoonStone)
  self.ItemCost_2.Btn_Area.OnClicked:Add(self, self.OnClickResource)
  self.ItemCost_3:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ItemCost_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
  self.CurrentCount = 1
  self.Btn_Confirm:BindEventOnClicked(self, self.BtnConfirmClicked)
  self:SetRestoreInfo()
  self:InitItemCost()
  local Avatar = GWorld:GetAvatar()
  self:SetAPInfo(Avatar.ActionPoint, DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue, DataMgr.GlobalConstant.HaveCostMax.ConstantValue)
  self:InitNumInput()
  if self:GetMaxCount() > 0 then
    self:SetResourcePurchaseInfo()
    self.ItemCost_2:PlayAnimation(self.ItemCost_2.Clicked)
  else
    self:SetMoonStonePurchaseInfo()
    self.ItemCost_1:PlayAnimation(self.ItemCost_1.Clicked)
  end
  self.Time_AllStore:SetTimeText(GText("UI_ActionPoint_FullyRecover"), nil)
  self.Text_Max:SetText(GText("UI_ActionPoint_MaximumActionPoint"))
  self:UnbindAllFromAnimationFinished(self.Out)
  self:PlayAnimation(self.In)
  self:InitCommonKey()
  self:SetFocus()
  self:AddInputMethodChangedListen()
  self:AddDispatcher(EventID.OnChangeActionPoint, self, self.RefreshContent)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:OnClickMoonStone()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  self:SetMoonStonePurchaseInfo()
end

function M:OnClickResource()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  self:SetResourcePurchaseInfo()
end

function M:InitNumInput()
  local MinValue = 1
  local InitValue = 1
  local MaxUseCount = self:GetMaxUseCount()
  local MaxCount = self:GetMaxCount()
  local MaxValue
  if MaxUseCount > MaxCount then
    MaxValue = MaxCount
  else
    MaxValue = MaxUseCount
  end
  if 0 == MaxCount then
    InitValue = 0
    MinValue = 0
  end
  self.Com_NumInput:Init({
    MaxValue = MaxValue,
    MinValue = MinValue,
    InitValue = InitValue,
    MinusBtnCallback = self.OnClickMinus,
    AddBtnCallback = self.OnClickAdd,
    MinBtnCallback = self.OnClickMin,
    MaxBtnCallback = self.OnClickMax,
    AddBtnForbidCallback = self.OnClickFobidAdd,
    MaxBtnForbidCallback = self.OnClickFobidMax,
    IsNotAllowTextFieldInput = true,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus",
      Max = "event:/ui/common/click_btn_addMulti",
      Add = "event:/ui/common/click_btn_add",
      Mini = "event:/ui/common/click_btn_addMulti"
    },
    OwnerPanel = self
  })
end

function M:InitItemCost()
  local ResourceData = self:GetResourceContent(self.MoonStoneId)
  ResourceData.NotCountFormat = true
  self.ItemCost_1:Init(ResourceData)
  ResourceData = self:GetResourceContent(self.RecoverItemId)
  ResourceData.NotCountFormat = true
  self.ItemCost_2:Init(ResourceData)
end

function M:RefreshContent()
  local Avatar = GWorld:GetAvatar()
  self:SetAPInfo(Avatar.ActionPoint, DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue, DataMgr.GlobalConstant.HaveCostMax.ConstantValue)
  local MaxUseCount = self:GetMaxUseCount()
  local MaxCount = self:GetMaxCount()
  local MinValue = 1
  local InitValue = 1
  if MaxCount < 1 then
    MinValue = 0
    InitValue = 0
  end
  self.Com_NumInput:OverrideValueLimit(InitValue, MaxUseCount, MinValue, true)
  self:InitItemCost()
  self.CurrentCount = 1
  self:UpdateItemPanel()
end

function M:UpdateProgressAP(AddedAP)
  if self.SliderCapture then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.AP_Over:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local ActionPoint = Avatar.ActionPoint
  local AddMaterial = self.Progress_AP_Add:GetDynamicMaterial()
  local NowMaterial = self.Progress_AP_Now:GetDynamicMaterial()
  local NowPercent = math.min(ActionPoint / DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue, 1)
  NowMaterial:SetScalarParameterValue("Percent", NowPercent)
  local AddPercent = math.min((ActionPoint + AddedAP) / DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue, 1)
  AddMaterial:SetScalarParameterValue("Percent", AddPercent)
  self:PlayAnimation(self.Preview_Now)
  self.AddMaterialPercent = AddPercent
  self.NowMaterialPercent = NowPercent
  self.APOver = false
  if ActionPoint + AddedAP > DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue then
    self.APOver = true
    self.AP_Over:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Bg_Progress_1:SetVisibility(UE4.ESlateVisibility.Visible)
    local OverMaxValue = DataMgr.GlobalConstant.HaveCostMax.ConstantValue - DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue
    AddMaterial = self.Progress_AP_Over_Add:GetDynamicMaterial()
    NowMaterial = self.Progress_AP_Over:GetDynamicMaterial()
    AddPercent = math.min((ActionPoint - DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue + AddedAP) / OverMaxValue)
    NowPercent = math.min((ActionPoint - DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue) / OverMaxValue)
    AddMaterial:SetScalarParameterValue("Percent", AddPercent)
    NowMaterial:SetScalarParameterValue("Percent", NowPercent)
    if ActionPoint + AddedAP > DataMgr.GlobalConstant.HaveCostMax.ConstantValue then
      self:PlayAnimation(self.Preview_Exceed)
      self:PlayAnimation(self.Preview_ExceedLoop, nil, 0)
    else
      self:StopAnimation(self.Preview_Exceed)
      self:StopAnimation(self.Preview_ExceedLoop)
      self:PlayAnimation(self.Preview_Over)
    end
    self.OverAddMaterialPercent = AddPercent
    self.OverNowMaterialPercent = NowPercent
  else
    self.Bg_Progress_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:GetResourceContent(ResourceId)
  local Avatar = GWorld:GetAvatar()
  local Content = {}
  Content.Parent = self
  Content.Icon = DataMgr.Resource[ResourceId].Icon
  Content.Rarity = DataMgr.Resource[ResourceId].Rarity or 0
  Content.Count = Avatar.Resources:QueryResourceCount(ResourceId) or 0
  Content.UseParam = DataMgr.Resource[ResourceId].UseParam
  Content.ResourceName = DataMgr.Resource[ResourceId].ResourceName
  Content.Id = ResourceId
  if self.MoonStoneId == ResourceId then
    Content.IsMoonStone = true
  end
  return Content
end

function M:SetAPInfo(Current, Total, Max)
  self.Num_AP_Now:SetText(Current)
  self.Num_AP_Total:SetText(Total)
  self.Num_AP_Max:SetText(Max)
  if Current < DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue then
    self.Bg_Progress_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Bg_Progress_1:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:SetRestoreInfo()
  self.Text_NextStore:SetText(GText("UI_ActionPoint_NextRecover"))
  self.Text_RestoreAll:SetText(GText("UI_ActionPoint_FullyRecover"))
end

function M:SetMoonStonePurchaseInfo()
  if self.SetCheckNotifyKey then
    self:RemoveTimer(self.SetCheckNotifyKey, false)
  end
  self.SetCheckNotifyKey = self:AddTimer(0.1, function()
    self.ItemCost_1.Btn_Area:SetCheckedNoNotify(true)
    self.SetCheckNotifyKey = nil
  end, false, 0, nil, true)
  if self.ItemCost_2.Btn_Area:IsChecked() then
    self.ItemCost_2.Btn_Area:SetCheckedNoNotify(false)
  end
  local Avatar = GWorld:GetAvatar()
  self.Btn_Confirm:SetText(GText("UI_ActionPoint_Purchase"))
  self.Text_Times:SetText(GText("UI_ActionPoint_RemainPurchaseTimes"))
  local MaxPurchaseCount = #DataMgr.ActionPointPrice
  local RemainCount = MaxPurchaseCount - Avatar.PurchaseActionPointCount
  self.Times_Total:SetText(MaxPurchaseCount)
  self.Times_Now:SetText(RemainCount)
  if 0 == RemainCount then
    self.Times_Now:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
  else
    self.Times_Now:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("34A981"))
  end
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  local ConfigData = {
    OwnerWidget = self,
    TextContent = GText("UI_ActionPoint_PurchasePriceText"),
    ClickCallback = self.QaClickCallBack,
    OnMenuOpenChangedCallBack = self.OnMenuOpenChangedCallBack
  }
  self.Btn_Qa:Init(ConfigData)
  local ResourceData = self:GetResourceContent(self.MoonStoneId)
  self.Item_Cost:Init({
    NotInteractive = true,
    Id = self.RecoverItemId,
    Icon = ResourceData.Icon,
    ItemType = "Resource"
  })
  self.Item_AP:Init({
    NotInteractive = true,
    Id = self.ActionPointId,
    Icon = self.ActionPointData.Icon,
    ItemType = "Resource"
  })
  if Avatar.PurchaseActionPointCount + 1 <= #DataMgr.ActionPointPrice then
    local PurchasePrice = DataMgr.ActionPointPrice[Avatar.PurchaseActionPointCount + 1].PurchasePrice
    self.Text_Cost:SetText(string.format(GText("UI_ActionPoint_PurchaseAP"), tostring(PurchasePrice), tostring(DataMgr.GlobalConstant.ActionPointRecoveryPurchase.ConstantValue)))
    self:UpdateProgressAP(DataMgr.GlobalConstant.ActionPointRecoveryPurchase.ConstantValue)
    self.MinusNum_Cost:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF99"))
    self.WidgetSwitcher_Function:SetActiveWidgetIndex(0)
  else
    self.Text_Cost:SetText(GText(""))
  end
  if 0 == RemainCount then
    self.Text_NotEnough:SetText(GText("UI_ActionPoint_PurchaseTimeShortage"))
    self.WidgetSwitcher_Function:SetActiveWidgetIndex(1)
    self:UpdateProgressAP(0)
  end
  self.IsMoonStoneSelected = true
end

function M:OnMenuOpenChangedCallBack(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self.Key_Qa:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Confirm:SetGamepadIconVisibility(false)
      self:ChangeCloseShortKeyText(GText("UI_CTL_CloseTips"))
    else
      self.Key_Qa:SetVisibility(UIConst.VisibilityOp.Visible)
      self:InitGamepadView()
      self.Btn_Confirm:SetGamepadIconVisibility(true)
      self:ChangeCloseShortKeyText(GText("UI_Controller_Close"))
    end
  end
end

function M:QaClickCallBack(IsChecked)
end

function M:SetResourcePurchaseInfo()
  if self.SetCheckNotifyKey then
    self:RemoveTimer(self.SetCheckNotifyKey, false)
  end
  self.SetCheckNotifyKey = self:AddTimer(0.01, function()
    self.ItemCost_2.Btn_Area:SetCheckedNoNotify(true)
  end, false, 0, nil, true)
  if self.ItemCost_1.Btn_Area:IsChecked() then
    self.ItemCost_1.Btn_Area:SetCheckedNoNotify(false)
  end
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.Btn_Confirm:SetText(GText("UI_ActionPoint_Use"))
  local ResourceData = self:GetResourceContent(self.RecoverItemId)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.Item_Cost:Init({
    NotInteractive = true,
    Id = self.RecoverItemId,
    Icon = ResourceData.Icon,
    ItemType = "Resource",
    HandleMouseDown = true
  })
  self.Item_AP:Init({
    NotInteractive = true,
    Id = self.ActionPointId,
    Icon = self.ActionPointData.Icon,
    ItemType = "Resource",
    HandleMouseDown = true
  })
  self:UpdateItemPanel()
  self.IsMoonStoneSelected = false
end

function M:UpdateItemPanel(bInit)
  local MaxCount = self:GetMaxUseCount()
  self.CurrentCount = math.max(1, math.min(MaxCount, self.CurrentCount))
  if MaxCount <= 0 then
    self.Times_Now:SetText("-")
    self.Times_Total:SetText("-")
    self.Times_Now:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("00000099"))
  else
    self.Times_Now:SetText(tostring(self.CurrentCount))
    self.Times_Total:SetText(tostring(MaxCount))
    self.Times_Now:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("34A981"))
  end
  local ResourceData = self:GetResourceContent(self.RecoverItemId)
  if self:GetMaxCount() < 1 then
    self.Text_Cost:SetText(GText(""))
  else
    self.Text_Cost:SetText(string.format(GText("UI_ActionPoint_RecoverAP"), tostring(self.CurrentCount), tostring(self.CurrentCount * ResourceData.UseParam)))
  end
  self.Text_Times:SetText(GText("UI_ActionPoint_UsageNumber"))
  self:UpdateProgressAP(self.CurrentCount * ResourceData.UseParam)
  if ResourceData.Count < self.CurrentCount then
    self:UpdateProgressAP(0)
    self.MinusNum_Cost:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
    self.WidgetSwitcher_Function:SetActiveWidgetIndex(1)
    self.Text_NotEnough:SetText(string.format(GText("UI_ActionPoint_ItemShortage"), GText(ResourceData.ResourceName)))
  else
    self.MinusNum_Cost:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF99"))
    self.WidgetSwitcher_Function:SetActiveWidgetIndex(0)
  end
end

function M:GetMaxCount()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 1
  end
  local ResourceCount = Avatar.Resources[self.RecoverItemId] and Avatar.Resources[self.RecoverItemId].Count or 0
  return ResourceCount
end

function M:GetMaxUseCount()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 1
  end
  local ResourceData = self:GetResourceContent(self.RecoverItemId)
  local MaxUseCount = math.min((DataMgr.GlobalConstant.HaveCostMax.ConstantValue - Avatar.ActionPoint) // ResourceData.UseParam, self:GetMaxCount())
  return MaxUseCount
end

function M:UpdateNextRecoverTime()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar.ActionPoint >= DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue then
    self.Time_StoreNext:SetTimeText(GText("UI_ActionPoint_NextRecover"), nil)
    self.Time_AllStore:SetTimeText(GText("UI_ActionPoint_FullyRecover"), nil)
  else
    local now = TimeUtils.NowTime()
    local LastRecoverTime = Avatar.ActionPointLastRecoverTime
    local RecoveryTimeCost = DataMgr.GlobalConstant.CostRecovery.ConstantValue
    local NextRecoverTime = 60 * RecoveryTimeCost + LastRecoverTime
    local NextRecoverRemain = NextRecoverTime - now
    local AllRecoverMax = DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue
    local Re = (AllRecoverMax - Avatar.ActionPoint) * 60 * RecoveryTimeCost
    local AllRecoverRemain = NextRecoverRemain + Re
    local NextStore = self:TimeToStr(NextRecoverRemain)
    local RestoreAll = self:TimeToStr(AllRecoverRemain)
    self.Time_StoreNext:SetTimeText("UI_ActionPoint_NextRecover", NextStore)
    self.Time_AllStore:SetTimeText("UI_ActionPoint_FullyRecover", RestoreAll)
  end
end

function M:TimeToStr(RemainRefreshTime)
  local RemainTimeStr = ""
  local RemainHour = math.floor(RemainRefreshTime / 3600)
  RemainRefreshTime = RemainRefreshTime % 3600
  local RemainMinute = math.floor(RemainRefreshTime / 60)
  RemainRefreshTime = RemainRefreshTime % 60
  local RemainSecond = RemainRefreshTime
  local TimeDict = {}
  if 0 ~= RemainHour then
    table.insert(TimeDict, 1, {TimeType = "Hour", TimeValue = RemainHour})
    table.insert(TimeDict, 2, {TimeType = "Min", TimeValue = RemainMinute})
  else
    table.insert(TimeDict, 1, {TimeType = "Min", TimeValue = RemainMinute})
    table.insert(TimeDict, 2, {TimeType = "Sec", TimeValue = RemainSecond})
  end
  return TimeDict
end

function M:OnClickAdd()
  local MaxCount = self:GetMaxCount()
  self.CurrentCount = math.min(self.CurrentCount + 1, MaxCount < 1 and 1 or MaxCount)
  self:UpdateItemPanel()
end

function M:OnClickFobidAdd()
  if self:GetMaxCount() > self:GetMaxUseCount() then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverMax"))
  end
end

function M:OnClickFobidMax()
  if self:GetMaxCount() > self:GetMaxUseCount() then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverMax"))
  end
end

function M:OnClickMinus()
  self.CurrentCount = math.max(self.CurrentCount - 1, 1)
  self:UpdateItemPanel()
end

function M:OnClickMax()
  local MaxCount = self:GetMaxUseCount()
  self.CurrentCount = MaxCount
  self:UpdateItemPanel()
end

function M:OnClickMin()
  self.CurrentCount = 1
  self:UpdateItemPanel()
end

function M:CloseSelf()
  self:RemoveInputMethodChangedListen()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  local AnimObj = self.Out
  self:BindToAnimationFinished(AnimObj, {
    self,
    self.Close
  })
  self:PlayAnimation(AnimObj)
  local UIState = UIManager(self):GetCurrentState()
  if UIState then
    UIState:SetFocus()
  end
end

function M:BtnConfirmClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local Avatar = GWorld:GetAvatar()
  if self.IsMoonStoneSelected then
    local ResourceData = self:GetResourceContent(self.MoonStoneId)
    local CoinNeededCount = DataMgr.ActionPointPrice[Avatar.PurchaseActionPointCount + 1].PurchasePrice
    local Coin1OwnedCount = ResourceData.Count
    
    local function OpenAPDialog()
    end
    
    if CoinNeededCount > Coin1OwnedCount then
      local Coin4 = CommonConst.Coins.Coin4
      local Coin4OwnedCount = Avatar:GetResourceNum(Coin4)
      local Coin1NeededCount = CoinNeededCount - Coin1OwnedCount
      if Coin4OwnedCount >= Coin1NeededCount then
        local function Confirm()
          Avatar:TransformCoin4ToCoin1(Coin1NeededCount, function()
            local ItemId = 100
            
            UIUtils.ShowGetItemPageAndOpenBagIfNeeded("Resource", ItemId, Coin1NeededCount, nil, false, nil, self, false)
            OpenAPDialog()
          end)
        end
        
        local ItemList = {}
        table.insert(ItemList, {
          ItemId = Coin4,
          ItemType = CommonConst.ItemType.Resource,
          ItemNum = Coin4OwnedCount,
          ItemNeed = Coin1NeededCount
        })
        local PopUpId = 100136
        local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
        if string.find(PopoverText, "&ResourceName&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(ResourceData.ResourceName))
        end
        if string.find(PopoverText, "&ResourceName1&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[Coin4].ResourceName))
        end
        if string.find(PopoverText, "&ResourceName2&") then
          PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ResourceData.ResourceName))
        end
        if string.find(PopoverText, "&Num1&") then
          PopoverText = string.gsub(PopoverText, "&Num1&", Coin1NeededCount)
        end
        if string.find(PopoverText, "&Num2&") then
          PopoverText = string.gsub(PopoverText, "&Num2&", Coin1NeededCount)
        end
        local Params = {
          RightCallbackFunction = Confirm,
          ItemList = ItemList,
          ShortText = PopoverText
        }
        Params.LeftCallbackFunction = OpenAPDialog
        self.Owner:OnClose()
        self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
        return
      elseif UIUtils.IsMenuWorld() then
        local function JumpToShop()
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        end
        
        local Params = {}
        Params.LeftCallbackObj = self
        Params.LeftCallbackFunction = OpenAPDialog
        Params.RightCallbackObj = self
        Params.RightCallbackFunction = JumpToShop
        self.Owner:OnClose()
        self.PopupUI = UIManager(self):ShowCommonPopupUI(100137, Params, self)
      else
        UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BattlePass_BuyLevelLackMoney"))
      end
    else
      self:ClickConfirmPurchase()
    end
  else
    local ResourceData = self:GetResourceContent(self.RecoverItemId)
    local AddedAp = self.CurrentCount * ResourceData.UseParam
    if Avatar.ActionPoint + AddedAp > DataMgr.GlobalConstant.HaveCostMax.ConstantValue then
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverFailure"))
    else
      Avatar:UseResourceInBag(self.RecoverItemId, self.CurrentCount, function()
        self:RefreshContent()
        self:SetResourcePurchaseInfo()
      end)
      self:BindToAnimationFinished(self.Add, {
        self,
        function()
          UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverSuccess"))
          self:UnbindAllFromAnimationFinished(self.Add)
        end
      })
      self:PlayAnimation(self.Add)
      AudioManager(self):PlayUISound(self, "event:/ui/common/energy_point_recover", nil, nil)
    end
  end
end

function M:ClickConfirmPurchase()
  local Avatar = GWorld:GetAvatar()
  if Avatar.ActionPoint + DataMgr.GlobalConstant.ActionPointRecoveryPurchase.ConstantValue > DataMgr.GlobalConstant.HaveCostMax.ConstantValue then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverFailure"))
  else
    Avatar:PurchaseActionPoint(function(ErrorCode)
      if 0 == ErrorCode then
        self:RefreshContent()
        AudioManager(self):PlayUISound(self, "event:/ui/common/energy_point_recover", nil, nil)
        self:SetMoonStonePurchaseInfo()
        self:BindToAnimationFinished(self.Add, {
          self,
          function()
            UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_ActionPoint_RecoverSuccess"))
            self:UnbindAllFromAnimationFinished(self.Add)
          end
        })
        self:PlayAnimation(self.Add)
      end
    end)
  end
end

function M:PlayRecoverAnimation()
  self:PlayAnimation(self.Add)
  self:PlayAnimation(self.Now_Pecent, self.NowMaterialPercent * 0.5)
  self:AddTimer((self.AddMaterialPercent - self.NowMaterialPercent) * 0.5, function()
    self:StopAnimation(self.Now_Pecent)
    local NowMaterial = self.Progress_AP_Now:GetDynamicMaterial()
    NowMaterial:SetScalarParameterValue("Percent", self.AddMaterialPercent)
    if self.APOver then
      self:PlayAnimation(self.Over_Percent, self.OverNowMaterialPercent * 0.5)
      self:AddTimer((self.OverAddMaterialPercent - self.OverNowMaterialPercent) * 0.5, function()
        self:StopAnimation(self.Over_Percent)
        local OverMaterial = self.Progress_AP_Over:GetDynamicMaterial()
        OverMaterial:SetScalarParameterValue("Percent", self.OverAddMaterialPercent)
      end, false, 0, nil, true)
    end
  end, false, 0, nil, true)
end

function M:Tick(MyGeometry, InDeltaTime)
  self:UpdateNextRecoverTime()
end

function M:InitCommonKey()
  self.Key_Qa:CreateCommonKey({
    KeyInfoList = {
      {ImgShortPath = "LS", Type = "Img"}
    }
  })
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
end

function M:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key_Qa:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:ForbidNavigate()
  local SelfFocused = self:HasFocusedDescendants() or self:HasAnyUserFocus()
  local OwnerFocused = self.Owner:HasFocusedDescendants() or self.Owner:HasAnyUserFocus()
  if SelfFocused or OwnerFocused then
    if self.IsMoonStoneSelected then
      self.ItemCost_1:SetFocus()
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.ItemCost_1)
    else
      self.ItemCost_2:SetFocus()
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.ItemCost_2)
    end
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      if self.IsMoonStoneSelected then
        local IsBtnChecked = self.Btn_Qa:IsMenuAnchorOpen()
        if IsBtnChecked then
          self.Btn_Qa:OnViewInfoClick(false)
          self.Btn_Qa.Btn_Click:SetChecked(false)
          self.Btn_Qa:OnViewInfoClicked()
        else
          self.Btn_Qa:OnViewInfoClick(true)
          self.Btn_Qa.Btn_Click:SetChecked(true)
          self.Btn_Qa:OnViewInfoClicked()
        end
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.IsMoonStoneSelected then
        local IsBtnChecked = self.Btn_Qa:IsMenuAnchorOpen()
        if IsBtnChecked then
          IsEventHandled = true
          self.Btn_Qa:OnViewInfoClick(false)
          self.Btn_Qa.Btn_Click:SetChecked(false)
          self.Btn_Qa:OnViewInfoClicked()
        end
      end
    elseif not self.IsMoonStoneSelected then
      IsEventHandled = self.Com_NumInput:Handle_KeyEventOnGamePad(InKeyName)
    end
  end
  if IsEventHandled then
    return UIUtils.Handled
  else
    return UIUtils.UnHandled
  end
end

function M:InitKeyboardView()
  self.Key_Qa:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:RecoverNavigate()
end

function M:ForbidNavigate()
  self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:RecoverNavigate()
  self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

return M
