require("UnLua")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_item_Universal_L_C"
})
local LongPressInterval = 0.15

function M:InitData(Content)
  Content.OnMouseButtonDownEvent = {
    Obj = self,
    Callback = self.OnPressed
  }
  Content.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = self.OnReleased
  }
  Content.OnMouseLeaveEvent = {
    Obj = self,
    Callback = self.OnLeaved
  }
  M.Super.InitData(self, Content)
  self.Content.StuffType = self.ItemType
  self.bDontRemoveSubWidget = true
  self.bAllUseAsyncLoadWidget = false
  self.HoldStartTime = 0
  self.bIsHolding = false
  self.HoldTimerName = "HoldAddStuffTimer_Bag_Item" .. self:GetName()
  self.bIsLongPress = false
  self.bHasTriggeredHoldAction = false
  self.ClickInterval = 1
  self.bForbidPressAccelerate = false
  self.HoldStartDelayHandle = nil
  self.HoldLoopHandle = nil
  self.HoldReduceHandle = nil
  self.PressGen = 0
  self.bIsDragging = false
  self.DragThreshold = 10
  self.DragStartPos = {X = 0, Y = 0}
end

function M:InitCompView()
  M.Super.InitCompView(self)
  if self.ItemType == "EmptyGrid" then
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.Collapsed)
    return
  elseif self.ItemType == CommonConst.DataType.Weapon then
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif self.ItemType == CommonConst.DataType.Mod then
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    self:UpdateModItem()
  else
    self:CheckAndSetVisibility(self.LevelWidget, UIConst.VisibilityOp.Collapsed)
    self:CheckAndSetVisibility(self.CountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:RefreshItemsViewWithStateTag()
  self:SetTreasureMapDigable(false, false)
  local ItemConf = DataMgr.Resource[self.Content.StuffId]
  if self.ItemType == CommonConst.DataType.Resource and ItemConf and ItemConf.ResourceSType == "TreasureMap" then
    local Conf = DataMgr.Explore_Treasure[self.Content.StuffId]
    if not Conf then
      DebugPrint(ErrorTag, "\232\151\143\229\174\157\229\155\190\233\129\147\229\133\183\230\178\161\230\156\137\228\184\142\230\142\162\231\180\162\231\187\132\229\133\179\232\129\148\239\188\129\239\188\129\239\188\129 \233\129\147\229\133\183ID: ", self.Content.StuffId)
    else
      self.RarelyId = Conf.ExploreGroupId
      local Explore = GWorld:GetAvatar().Explores[self.RarelyId]
      local bDigable = (not Explore or not Explore:IsComplete()) and true
      self:SetTreasureMapDigable(true, bDigable)
    end
  end
end

function M:IsInSaleOrResolveState()
  local State = self.ParentWidget and self.ParentWidget.BagCurState
  return State == BagCommon.AllBagState.ChooseSaleState or State == BagCommon.AllBagState.WeaponResolveState
end

function M:StopHoldTimers()
  if self.HoldStartDelayHandle then
    self:RemoveTimer(self.HoldStartDelayHandle)
  end
  if self.HoldLoopHandle then
    self:RemoveTimer(self.HoldLoopHandle)
  end
  if self.HoldReduceHandle then
    self:RemoveTimer(self.HoldReduceHandle)
  end
  self.HoldStartDelayHandle, self.HoldLoopHandle, self.HoldReduceHandle = nil, nil, nil
end

function M:OnPressed()
  if self.ItemType == "EmptyGrid" then
    return
  end
  if not self:IsInSaleOrResolveState() then
    return
  end
  if self.Content.Price < 0 then
    return
  end
  self.bIsDragging = false
  local pos = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  local x = pos and pos.X or 0
  local y = pos and pos.Y or 0
  self.DragStartPos = {X = x, Y = y}
  self.ParentWidget.HoldGlobalToken = self.ParentWidget.HoldGlobalToken or 0
  self.ParentWidget.HoldOwner = self.ParentWidget.HoldOwner or nil
  if self.ParentWidget.HoldOwner and self.ParentWidget.HoldOwner ~= self then
    local prev = self.ParentWidget.HoldOwner
    prev.bIsHolding = false
    prev.bIsLongPress = false
    prev:StopHoldTimers()
  end
  self:StopAllAnimations()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC and self.Item and self.Item.Press then
    self.Item:PlayAnimation(self.Item.Press)
  end
  self.ParentWidget.HoldOwner = self
  self.ParentWidget.HoldGlobalToken = self.ParentWidget.HoldGlobalToken + 1
  local globalTok = self.ParentWidget.HoldGlobalToken
  self.bIsHolding = true
  self.bIsLongPress = false
  self.HoldStartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.PressGen = (self.PressGen or 0) + 1
  local gen = self.PressGen
  if self.HoldStartDelayHandle then
    self:RemoveTimer(self.HoldStartDelayHandle)
  end
  self.HoldStartDelayHandle = self:AddTimer(LongPressInterval, function()
    if not self.bIsHolding or self.PressGen ~= gen or self.ParentWidget.HoldOwner ~= self or self.ParentWidget.HoldGlobalToken ~= globalTok or self.bIsDragging then
      self.HoldStartDelayHandle = nil
      return
    end
    self.bIsLongPress = true
    self.HoldStartDelayHandle = nil
    self:StartHoldAddStuff(gen, globalTok)
  end, false, 0, self.HoldTimerName .. "_StartDelay")
end

function M:OnReleased()
  if self.ItemType == "EmptyGrid" then
    return
  end
  AudioManager(self):PlayItemSound(self, self.Id, "Click", self.ItemType)
  if not self:IsInSaleOrResolveState() then
    self:TriggerClickCallback(0)
    return
  end
  if self.Content.Price < 0 then
    UIManager(self):ShowError(7014, nil, UIConst.Tip_CommonToast)
    return
  end
  if self.ParentWidget.HoldOwner == self then
    self.ParentWidget.HoldGlobalToken = self.ParentWidget.HoldGlobalToken + 1
    self.ParentWidget.HoldOwner = nil
  end
  self.bIsHolding = false
  self:StopHoldTimers()
  if self.bIsLongPress then
    if not self.bHasTriggeredHoldAction then
      self.bIsLongPress = false
    else
      self.bIsLongPress = false
      self.bHasTriggeredHoldAction = false
      return
    end
  end
  if self.ParentWidget.BagCurState == BagCommon.AllBagState.WeaponResolveState then
    if self.Content.StateTagInfo and self.Content.StateTagInfo.Name ~= "IsToChoose" then
      self:TriggerClickCallback(1)
    else
      self:TriggerClickCallback(0)
    end
  else
    self:TriggerClickCallback(1)
  end
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  if not self.bIsHolding then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  local pos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
  local dx = (pos.X or 0) - (self.DragStartPos.X or 0)
  local dy = (pos.Y or 0) - (self.DragStartPos.Y or 0)
  local dist2 = dx * dx + dy * dy
  if dist2 >= self.DragThreshold * self.DragThreshold then
    self.bIsDragging = true
    self.bIsLongPress = false
    self.bHasTriggeredHoldAction = false
    self:StopHoldTimers()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnLeaved()
  self.bIsDragging = false
  if not self:IsInSaleOrResolveState() then
    return
  end
  if self.ParentWidget.HoldOwner == self then
    self.ParentWidget.HoldGlobalToken = self.ParentWidget.HoldGlobalToken + 1
    self.ParentWidget.HoldOwner = nil
  end
  self.bIsHolding = false
  if self.HoldStartDelayHandle then
    self:RemoveTimer(self.HoldStartDelayHandle)
  end
  if self.HoldLoopHandle then
    self:RemoveTimer(self.HoldLoopHandle)
  end
  if self.HoldReduceHandle then
    self:RemoveTimer(self.HoldReduceHandle)
  end
  self.HoldStartDelayHandle, self.HoldLoopHandle, self.HoldReduceHandle = nil, nil, nil
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self.bIsDragging = false
  if not self.Content or self.NotInteractive or self.Content.IsShowTips or self:IsInAnimationPlaying() then
    return
  end
  if self.Content.IsSelect then
    if self.OnMouseLeaveEvent and self.OnMouseLeaveEvent.Callback then
      self.OnMouseLeaveEvent.Callback(self.OnMouseLeaveEvent.Obj, self.OnMouseLeaveEvent.Params)
    end
    return
  end
  self.bMouseButtonDown = false
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.UnHover)
end

function M:TriggerClickCallback(Count)
  if self.Content.ClickCallback and type(self.Content.ClickCallback) == "function" then
    if Count > 0 then
      self.Content.AddNum = Count
      if self.Content.StateTagInfo and self.Content.StateTagInfo.Name ~= "InSelectList" then
        self.ParentWidget.HoverItem = self.Content
        self.ParentWidget:RefreshBottomKeyInfo("ChooseSaleState")
      end
    end
    self.Content.ClickCallback(self.ParentWidget, self.Content)
  end
end

function M:StartHoldAddStuff(gen, globalTok)
  if self.HoldLoopHandle then
    self:RemoveTimer(self.HoldLoopHandle)
  end
  local handle
  handle = self:AddTimer(0.1, function()
    if not self.bIsHolding or self.PressGen ~= gen or self.ParentWidget.HoldOwner ~= self or self.ParentWidget.HoldGlobalToken ~= globalTok or self.bIsDragging then
      if handle then
        self:RemoveTimer(handle)
      end
      if self.HoldLoopHandle == handle then
        self.HoldLoopHandle = nil
      end
      return
    end
    local PressTime = UE4.UGameplayStatics.GetRealTimeSeconds(self) - self.HoldStartTime
    local AddCount = self:GetChangeCount(PressTime)
    local CurCount, MaxCount = 0, 0
    local Info = self.Content.StateTagInfo
    local Extra = Info and Info.ExtraData
    if Info and Extra then
      if Info.Name == "InSelectList" then
        CurCount = Extra[1] or 0
        MaxCount = Extra[2] or 0
      else
        MaxCount = Extra[1] or 0
      end
    end
    local FinalCount = math.min(CurCount + AddCount, MaxCount)
    local Delta = FinalCount - CurCount
    if Delta > 0 then
      self.bHasTriggeredHoldAction = true
      self:TriggerClickCallback(Delta)
    end
  end, true, 0, self.HoldTimerName)
  self.HoldLoopHandle = handle
end

function M:GetChangeCount(PressTime)
  local Multiple = 1
  if not self.bForbidPressAccelerate and self.LongPressCurve then
    Multiple = self.LongPressCurve:GetFloatValue(PressTime)
  end
  local StepCount = self.ClickInterval * Multiple
  StepCount = math.floor(StepCount + 0.5)
  local MinValue = 1
  local MaxValue = 99
  local FinalCount = math.max(MinValue, math.min(StepCount, MaxValue))
  return FinalCount
end

function M:SetTreasureMapDigable(bShow, bDigable)
  if not self.Item then
    DebugPrint(ErrorTag, "SetTreasureMapDigable::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
    return
  end
  if bShow then
    if not self.WidgetMap[self.TreasureDigableWidget] then
      self.TreasureDigableWidget = self:CreateWidgetNew("ComTreasureDigable")
    end
    self:AddWidgetToNode(self.TreasureDigableWidget)
    local Index = true == bDigable and 1 or 0
    self.TreasureDigableWidget.WidgetSwitcher_State:SetActiveWidgetIndex(Index)
    self.TreasureDigableWidget.Text_DigHint:SetText(GText("UI_TREASURE_COMPLETE"))
  else
    self:RemoveWidgetFromNode(self.TreasureDigableWidget)
  end
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
      self:SetSelectNum(Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      self:SetItemMinus(true)
      self.MinusWidget.Btn_Minus:UnBindEventOnClicked(self, self.CancelSelectClick)
      self.MinusWidget.Btn_Minus:BindEventOnClicked(self, self.CancelSelectClick)
      if Content.ItemType ~= CommonConst.DataType.Weapon then
        self:SetItemMoney(StateTagInfo.ExtraData[4], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
      end
    end
    self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    if Content.ItemType == CommonConst.DataType.Weapon then
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    else
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  elseif StateTagInfo.Name == "InSelectList" then
    if StateTagInfo.ExtraData ~= nil then
      self:SetSelectNum(Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      self:SetItemMinus(true)
      self.MinusWidget.Btn_Minus.AudioEventPath = "event:/ui/common/click_btn_minusMulti"
      self.MinusWidget.Btn_Minus:UnBindEventOnClicked(self, self.CancelSelectClick)
      self.MinusWidget.Btn_Minus:BindEventOnClicked(self, self.CancelSelectClick)
      if Content.ItemType ~= CommonConst.DataType.Weapon then
        self:SetItemMoney(StateTagInfo.ExtraData[4], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
      end
    end
    self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    if Content.ItemType == CommonConst.DataType.Weapon then
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    else
      self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  elseif StateTagInfo.Name == "Normal" then
    if StateTagInfo.ExtraData ~= nil then
      self:SetSelectNum(0, Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      if Content.StuffType ~= CommonConst.DataType.Weapon then
        self:SetItemMoney(StateTagInfo.ExtraData[3], Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[2] + 0.5), true))
      end
      self:CheckAndSetVisibility(self.MinusWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectWidget, UIConst.VisibilityOp.Collapsed)
      self:CheckAndSetVisibility(self.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      if Content.ItemType == CommonConst.DataType.Weapon then
        self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.Collapsed)
      else
        self:CheckAndSetVisibility(self.MoneyWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
      end
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
  elseif WidgetComp and WidgetComp == self.MoneyWidget then
    WidgetComp:SetVisibility(VisibilityOp)
    return true
  end
  return false
end

function M:SetItemShowGrey(bShowGrey)
  if bShowGrey then
    if self.ItemType == CommonConst.DataType.Weapon then
      self.ShowWarningText = GText("UI_Bag_Decompose_Unable")
    elseif self.ItemType == CommonConst.DataType.Mod then
      self.ShowWarningText = GText("UI_Bag_ModExtract_Forbid")
    else
      self.ShowWarningText = GText("UI_Tips_CantSell")
    end
    self:SetItemConflict(true)
  else
    self:SetItemConflict(false)
  end
end

function M:CancelSelectClick()
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
  self:_SetItemConflictImpl(bConflict, self.ShowWarningText)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.ItemType == "EmptyGrid" then
    return UWidgetBlueprintLibrary.Handled()
  end
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, UE4.EKeys.RightMouseButton) then
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

function M:UpdateModItem()
  local ModId = self.Content.UnitId
  if not ModId then
    return
  end
  local ModDataInfo = DataMgr.Mod[ModId]
  if not ModDataInfo then
    DebugPrint("\232\175\165ModId\232\162\171\231\173\150\229\136\146\229\136\160\228\186\134...", ModId)
    return
  end
  local ModCost, Mod
  if self.Content.Uuid then
    local ModUuid = self.Content.Uuid
    Mod = ModController:GetModel():GetMod(ModUuid)
    if not Mod then
      local Avatar = GWorld:GetAvatar()
      Mod = Avatar.Mods[ModUuid]
    end
    if Mod then
      ModId = Mod.ModId
      ModCost = Mod.Cost
    else
      DebugPrint("UpdateModItem Mod data not find, ModId is", ModId)
    end
  else
    ModId = self.Content.UnitId
    ModDataInfo = DataMgr.Mod[ModId]
    ModCost = ModDataInfo.Cost
  end
  if Mod then
    if Mod.Level and 0 ~= Mod.Level then
      self:SetItemStartLevel(Mod.Level)
    end
    self:ShowModStar(Mod)
  end
end

function M:ShowModStar(Mod)
  if not Mod or not Mod:HasCardLevel() then
    if IsValid(self.ModStarWidget) then
      self.ModStarWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    if not self:CheckAndSetVisibility(self.ModStarWidget, UIConst.VisibilityOp.HitTestInvisible) then
      local Widget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_ModStar.WBP_Com_Item_ModStar")
      local WidgetSlot = self.Node_Widget:AddChild(Widget)
      WidgetSlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      WidgetSlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      self.ModStarWidget = Widget
      self.WidgetMap[Widget] = true
    end
    self.ModStarWidget.List_ModStar:ClearListItems()
    for i = 1, Mod.ModCardLevelMax do
      local StarContent = NewObject(UIUtils.GetCommonItemContentClass())
      StarContent.Idx = i
      StarContent.bActivate = i <= Mod.CurrentModCardLevel
      StarContent.bGolden = false
      self.ModStarWidget.List_ModStar:AddItem(StarContent)
    end
  end
end

function M:HideOrShowTimeLimitWidget(bHide)
  if bHide then
    if not self.WidgetMap[self.TimeLimitWidget] then
      return
    end
    self.TimeLimitWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    if self.WidgetMap[self.TimeLimitWidget] then
      return
    end
    self.TimeLimitWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:SetItemMinus(bMinus)
  self.Super.SetItemMinus(self, bMinus)
  self.Content.bMinus = bMinus
end

function M:SetSelected(IsSelected)
  if self.NotInteractive then
    return
  end
  if self.Content then
    self.Content.IsSelect = IsSelected
  end
  if IsSelected then
    if not self.Item:IsAnimationPlaying(self.Item.Click) then
      self.Item:StopAllAnimations()
      self.Item:PlayAnimation(self.Item.Click)
    end
  else
    self.Item:StopAllAnimations()
    self.Item:PlayAnimation(self.Item.Normal)
  end
end

return M
