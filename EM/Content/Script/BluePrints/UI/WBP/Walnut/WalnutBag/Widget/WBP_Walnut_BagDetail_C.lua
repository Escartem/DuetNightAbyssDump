require("UnLua")
local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  self:InitBaseInfo()
end

function M:InitBaseInfo()
  self.Text_Method:SetText(GText("UI_Tips_Obtining"))
  self.Key_Check:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    },
    Desc = GText("UI_Controller_Check")
  })
  self.ScrollBox_Detail:SetControlScrollbarInside(true)
end

function M:ResetInfo()
end

function M:SetOwner(ParentWidget)
  self.ParentWidget = ParentWidget
end

function M:RefreshItemDetails(WalnutInfo)
  if nil == WalnutInfo then
    return
  end
  local WalnutId = WalnutInfo.Id
  local WalnutConfigData = DataMgr.Walnut[WalnutId]
  if WalnutConfigData then
    local WalnutTypeConfigData = DataMgr.WalnutType[WalnutConfigData.WalnutType]
    local NumberOrder, NumberOrderString = WalnutConfigData.WalnutNumber, ""
    if NumberOrder < 10 then
      NumberOrderString = "00" .. tostring(NumberOrder)
    elseif NumberOrder < 100 and NumberOrder >= 10 then
      NumberOrderString = "0" .. tostring(NumberOrder)
    else
      NumberOrderString = tostring(NumberOrder)
    end
    self.Text_Name:SetText(GText(WalnutConfigData.Name))
    self.Text_RewardDesc:SetText(GText("UI_Reward_Walnut_Preview"))
    if WalnutInfo.Count <= 0 then
      self.Text_Hold:SetText(GText("UI_Walnut_Not_Get"))
      self.Num_Hold:SetText("")
      self.Text_Hold_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Text_Hold:SetText(GText("UI_NUM_NAME"))
      self.Num_Hold:SetText(tostring(WalnutInfo.Count))
      self.Text_Hold_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Text_Total:SetText(GText("UI_Walnut_CompleteCount"))
    self.Num_Total:SetText(tostring(WalnutInfo.ConsumeRecord))
    local RewardLv = WalnutConfigData.RewardLv
    local PerCentGold, PerCentSilver, PerCentBronze = ItemUtils.GetWalnutItemPercent(WalnutId)
    local PerCentGoldA, PerCentGoldB = math.modf(PerCentGold * 100)
    local PerCentSilverA, PerCentSilverB = math.modf(PerCentSilver * 100)
    local PerCentBronzeA, PerCentBronzeB = math.modf(PerCentBronze * 100)
    for index, value in ipairs(RewardLv) do
      if 1 == index then
        self.Reward_1st.Num_Percent:SetText(PerCentGoldA)
        PerCentGoldB = math.floor(PerCentGoldB * 100 + 0.5)
        self.Reward_1st.Num_Float:SetText(PerCentGoldB)
        self:GenerateRewardShowInfo(WalnutConfigData, 1, 1, self.Item_1st)
      elseif 2 == index then
        self.Reward_2nd.Num_Percent:SetText(PerCentSilverA)
        PerCentSilverB = math.floor(PerCentSilverB * 100 + 0.5)
        self.Reward_2nd.Num_Float:SetText(PerCentSilverB)
        self:GenerateRewardShowInfo(WalnutConfigData, 2, 1, self.Item_2nd_1)
        self:GenerateRewardShowInfo(WalnutConfigData, 3, 1, self.Item_2nd_2)
      else
        self.Reward_3rd.Num_Percent:SetText(PerCentBronzeA)
        PerCentBronzeB = math.floor(PerCentBronzeB * 100 + 0.5)
        self.Reward_3rd.Num_Float:SetText(PerCentBronzeB)
        self:GenerateRewardShowInfo(WalnutConfigData, 4, 1, self.Item_3rd_1)
        self:GenerateRewardShowInfo(WalnutConfigData, 5, 1, self.Item_3rd_2)
        self:GenerateRewardShowInfo(WalnutConfigData, 6, 1, self.Item_3rd_3)
      end
    end
    self:RefreshAccessMethod(WalnutTypeConfigData, WalnutConfigData)
    self.Text_Describe:SetText(GText("WALNUT_FUNCTION"))
    self:RefreshIconAsset(false, WalnutTypeConfigData, WalnutId)
    if WalnutTypeConfigData then
      self.Text_LongDescribe:SetText(GText(WalnutTypeConfigData.IpDes))
      self.Text_LongDescribe:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Text_LongDescribe:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    DebugPrint("InitItemDetails fail, not find in Walnut Datable, WalnutId is", WalnutId)
  end
  if self.bIsNeedPlayResolveAnim then
    self:PlayAnimationForward(self.In)
    self.bIsNeedPlayResolveAnim = false
  else
    self:PlayAnimationForward(self.Refresh)
  end
end

function M:RefreshIconAsset(bIsAsync, WalnutTypeConfigData, WalnutId)
  self.Walnut_Number:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if bIsAsync then
    UE.UResourceLibrary.LoadObjectAsync(self, WalnutTypeConfigData.Icon, {
      self,
      function(self, IconObj)
        if IconObj then
          self.Icon_Walnut:SetBrushResourceObject(IconObj)
        end
      end
    })
  else
    self.Icon_Walnut:SetBrushResourceObject(LoadObject(DataMgr.Walnut[WalnutId].Icon))
  end
end

function M:GenerateRewardShowInfo(WalnutConfigData, Rarity, Index, ItemWidget)
  local RewardId = WalnutConfigData.Id[Rarity]
  local RewardType = WalnutConfigData.Type[Rarity]
  local RewarCount = WalnutConfigData.Count[Rarity][Index]
  local RewardConfigData = DataMgr[RewardType][RewardId]
  if nil ~= RewardConfigData then
    local RewardData = {
      Id = RewardId,
      Icon = RewardConfigData.Icon,
      Type = RewardType,
      Count = RewarCount,
      Rarity = RewardConfigData.Rarity
    }
    self:FillWithRewardStuffData(ItemWidget, RewardData)
  end
end

function M:FillWithRewardStuffData(ItemWidget, RewardData)
  local Icon = RewardData.Icon
  ItemWidget:Init({
    Id = RewardData.Id,
    Icon = Icon,
    ItemType = RewardData.Type,
    Rarity = RewardData.Rarity,
    Count = RewardData.Count,
    UIName = WalnutBagCommon.UIName,
    IsShowDetails = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
  })
  ItemWidget:BindEvents(self, {
    OnMenuOpenChanged = self.OnStuffMenuOpenChanged
  })
end

function M:RefreshAccessMethod(WalnutTypeConfigData, WalnutConfigData)
  self.AllMethodSubWidgetList = {}
  if not WalnutConfigData.AccessKey then
    self.HB_Hint_Access:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Method:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Method:ClearChildren()
    for _, Access in pairs(WalnutConfigData.AccessKey) do
      PageJumpUtils:GetItemAccess(self, WalnutConfigData.WalnutId, WalnutBagCommon.WalnutTypeName, Access, WalnutBagCommon.UIName)
    end
    PageJumpUtils:SortAccessItem(self.Method)
    local AllMethodCount = self.Method:GetChildrenCount()
    for index = 1, AllMethodCount do
      local TestWidget = self.Method:GetChildAt(index - 1)
      if TestWidget and not TestWidget.IsText then
        table.insert(self.AllMethodSubWidgetList, TestWidget)
      end
    end
    local AllCanNavigateAccessCount = #self.AllMethodSubWidgetList
    for index, TargetWidget in ipairs(self.AllMethodSubWidgetList) do
      if TargetWidget then
        TargetWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        TargetWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        if 1 == AllCanNavigateAccessCount then
          TargetWidget:SetNavigationRuleCustom(EUINavigation.Up, {
            self,
            self.DoCustomNavigationWithMethod
          })
          TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        elseif 1 == index then
          TargetWidget:SetNavigationRuleCustom(EUINavigation.Up, {
            self,
            self.DoCustomNavigationWithMethod
          })
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Down, self.AllMethodSubWidgetList[index + 1])
        elseif index == AllCanNavigateAccessCount then
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Up, self.AllMethodSubWidgetList[index - 1])
          TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        else
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Up, self.AllMethodSubWidgetList[index - 1])
          TargetWidget:SetNavigationRuleExplicit(EUINavigation.Down, self.AllMethodSubWidgetList[index + 1])
        end
      end
    end
    if AllMethodCount <= 0 then
      self.HB_Hint_Access:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Method:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.HB_Hint_Access:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Method:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if self.ParentWidget then
    if bIsOpen then
      self.ParentWidget:RefreshBottomKeyInfo("NotAnyKey")
    else
      self.ParentWidget:RefreshBottomKeyInfo("ViewStuff")
    end
  end
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
  if IsUseGamePad and not self:IsInGamePadViewMode() then
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIsNeedPlayResolveAnim(bIsNeedPlay)
  self.bIsNeedPlayResolveAnim = bIsNeedPlay
end

function M:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = true
  DebugPrint("Handle_KeyDownOnGamePad", InKeyName, self:IsInGamePadViewMode())
  if InKeyName == UIConst.GamePadKey.SpecialLeft then
    if self:IsInGamePadViewMode() then
      self:LeaveGamePadViewMode()
    else
      self:EnterGamePadViewMode()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self:IsInGamePadViewMode() then
      self:LeaveGamePadViewMode()
    else
      IsEventHandled = false
    end
  else
    IsEventHandled = self:IsInGamePadViewMode()
  end
  return IsEventHandled
end

function M:DoCustomNavigationWithStuff(EUINavigation)
  local TargetNavigateWidget
  if self.AllMethodSubWidgetList and #self.AllMethodSubWidgetList > 0 then
    TargetNavigateWidget = self.AllMethodSubWidgetList[1]
    if self.ParentWidget then
      self.ParentWidget:RefreshBottomKeyInfo("ViewMethod")
    end
  end
  return TargetNavigateWidget
end

function M:DoCustomNavigationWithMethod(EUINavigation)
  if self.ParentWidget then
    self.ParentWidget:RefreshBottomKeyInfo("ViewStuff")
  end
  return self.Item_3rd_1
end

function M:EnterGamePadViewMode()
  self.Item_1st:SetFocus()
  self:UpdateUIStyleInPlatform(false)
  if self.ParentWidget then
    self.ParentWidget:UpdateUIStyleInPlatform(false)
    self.ParentWidget:RefreshBottomKeyInfo("ViewStuff")
  end
end

function M:LeaveGamePadViewMode()
  if self.ParentWidget then
    self.ParentWidget:SetFocus()
    self.ParentWidget:UpdateUIStyleInPlatform(true)
    self.ParentWidget:RefreshBottomKeyInfo()
  end
  self:UpdateUIStyleInPlatform(true)
end

function M:IsInGamePadViewMode()
  local PlayerController = self:GetOwningPlayer()
  if self.Item_1st:HasUserFocus(PlayerController) then
    return true
  elseif self.Item_2nd_1:HasUserFocus(PlayerController) then
    return true
  elseif self.Item_2nd_2:HasUserFocus(PlayerController) then
    return true
  elseif self.Item_3rd_1:HasUserFocus(PlayerController) then
    return true
  elseif self.Item_3rd_2:HasUserFocus(PlayerController) then
    return true
  elseif self.Item_3rd_3:HasUserFocus(PlayerController) then
    return true
  end
  if self.AllMethodSubWidgetList then
    for _, TargetWidget in ipairs(self.AllMethodSubWidgetList) do
      if TargetWidget and (TargetWidget:HasUserFocus(PlayerController) or TargetWidget:HasUserFocusedDescendants(PlayerController)) then
        return true
      end
    end
  end
  return false
end

return M
