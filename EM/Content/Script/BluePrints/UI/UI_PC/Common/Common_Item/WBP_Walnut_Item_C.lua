require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_item_Universal_L_C"
})

function M:InitData(Content)
  M.Super.InitData(self, Content)
  self.bAllUseAsyncLoadWidget = false
  self.Content.StuffType = self.ItemType
  self.bDontRemoveSubWidget = true
end

function M:InitCompView()
  M.Super.InitCompView(self)
  if self.ItemType == "EmptyGrid" then
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.Collapsed)
    return
  else
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:RefreshItemsViewWithStateTag()
  if (not self.Count or self.Count <= 0) and self.CountWidget and IsValid(self.CountWidget) then
    self:ClearBackGroundHeight(true)
  end
end

function M:SetItemMinus(bMinus)
  self.Super.SetItemMinus(self, bMinus)
  self.Content.bMinus = bMinus
end

function M:SetStuffStyleByStateTag(Content)
  local StateTagInfo = Content.StateTagInfo
  if nil == StateTagInfo then
    self:RefreshItemsViewWithStateTag({Name = "Normal"}, Content)
    return
  end
  if nil ~= self.Content and nil ~= self.Content.StateTagInfo then
    if self.Content.StateTagInfo.Name == "IsToChoose" then
      self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    elseif self.Content.StateTagInfo.Name == "InSelectList" then
      self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    end
  end
  self:RefreshItemsViewWithStateTag(Content)
end

function M:RefreshItemsViewWithStateTag(Content)
  self:SetItemMinus(false)
  Content = Content or self.Content
  local StateTagInfo = Content.StateTagInfo or {}
  if StateTagInfo.Name == "IsToChoose" then
    if StateTagInfo.ExtraData ~= nil then
      self:SetSelectNum(Utils.FormatNumber(StateTagInfo.ExtraData[1], true), Utils.FormatNumber(StateTagInfo.ExtraData[2], true))
      self:SetItemMinus(true)
      self.MinusWidget.Btn_Minus:UnBindEventOnClicked(self, self.CancelSelectClick)
      self.MinusWidget.Btn_Minus:BindEventOnClicked(self, self.CancelSelectClick)
      self:SetItemMoney(StateTagInfo.ExtraData[4], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
    end
    self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif StateTagInfo.Name == "InSelectList" then
    if StateTagInfo.ExtraData ~= nil then
      self:SetItemMinus(true)
      self.MinusWidget.Btn_Minus:UnBindEventOnClicked(self, self.CancelSelectClick)
      self.MinusWidget.Btn_Minus:BindEventOnClicked(self, self.CancelSelectClick)
      self:SetSelectNum(Utils.FormatNumber(StateTagInfo.ExtraData[1], true), Utils.FormatNumber(StateTagInfo.ExtraData[2], true))
      self:SetItemMoney(StateTagInfo.ExtraData[4], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
    end
    self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif StateTagInfo.Name == "Normal" then
    if StateTagInfo.ExtraData ~= nil then
      self:SetSelectNum(0, Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      self:SetItemMoney(StateTagInfo.ExtraData[3], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[2] + 0.5), true))
      self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
    else
      self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    end
  end
  self:SetItemShowGrey(StateTagInfo.IsShowGrey)
end

function M:CheckAndSetVisibility(WidgetComp, VisibilityOp)
  if self.WidgetMap[WidgetComp] then
    WidgetComp:SetVisibility(VisibilityOp)
    return true
  end
  return false
end

function M:SetItemShowGrey(bShowGrey)
  if bShowGrey then
    self:SetItemConflict(true)
  else
    self:SetItemConflict(false)
  end
end

function M:CancelSelectClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if self.ParentWidget ~= nil and self.Content.StateTagInfo then
    local AllCount = #self.Content.StateTagInfo.ExtraData
    if type(self.Content.StateTagInfo.ExtraData[AllCount]) == "function" then
      self.Content.StateTagInfo.ExtraData[AllCount](self.ParentWidget, self.Content.Uuid)
    else
      DebugPrint("StateTagInfo.ExtraData[AllCount] Not function!")
    end
  end
end

function M:SetItemConflict(bConflict)
  self:_SetItemConflictImpl(bConflict, GText("UI_Tips_CantSell"))
end

function M:SetItemMoney(CurrencyId, CurrencyNum)
  if CurrencyId and CurrencyNum then
    if not self.WidgetMap[self.MoneyWidget] then
      self.MoneyWidget = self:CreateWidgetNew("ComItemMoney")
    end
    local CoinIcon = LoadObject(DataMgr.Resource[CurrencyId].Icon)
    self.MoneyWidget.Img_Coin:SetBrushResourceObject(CoinIcon)
    self.MoneyWidget.Text_Cost:SetText(CurrencyNum)
    self:AddWidgetToNode(self.MoneyWidget)
    self:AddTimer(0.01, function()
      if self.ComItemNewReddot and self.WidgetMap[self.ComItemNewReddot] and self.ComItemNewReddot:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
        self.ComItemNewReddot:RemoveFromParent()
        self.ComItemNewReddot = self:CreateWidgetNew("ComItemNewReddot")
        self:AddWidgetToNode(self.ComItemNewReddot)
      end
    end)
  elseif self.WidgetMap[self.MoneyWidget] then
    self:RemoveWidgetFromNode(self.MoneyWidget)
  end
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.ItemType == "EmptyGrid" then
    return UWidgetBlueprintLibrary.Handled()
  end
  return M.Super.OnMouseButtonDown(self, MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.ItemType == "EmptyGrid" then
    return UWidgetBlueprintLibrary.Handled()
  end
  return M.Super.OnMouseButtonUp(self, MyGeometry, MouseEvent)
end

return M
