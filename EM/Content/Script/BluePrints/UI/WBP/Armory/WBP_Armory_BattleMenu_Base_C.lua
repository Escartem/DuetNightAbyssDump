require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:CheckNeedAutoFocusWithInputType()
  return false
end

function M:Construct()
  self.Btn_Config:SetText(GText("UI_STAT_Sigil_Weapon_Config"))
  self.Btn_Wipe:SetText(GText("UI_Clear_BattleWheel"))
  self.Tips_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Empty:SetText(GText("UI_Slot_Empty"))
  self.WS_Tips:SetActiveWidgetIndex(0)
  self.BattleWheelWidgets = {
    self.Battle_Menu,
    self.Battle_Menu_R,
    self.Battle_Menu_L
  }
  self.WheelWidgetsForTick = {
    self.Battle_Menu_L,
    self.Battle_Menu,
    self.Battle_Menu_R
  }
  self.CurWheelWidgets = {
    self.Battle_Menu_L,
    self.Battle_Menu,
    self.Battle_Menu_R
  }
  self.CurWheelBtns = {
    self.Button_Menu_L,
    self.Button_Menu_M,
    self.Button_Menu_R
  }
  self.CurWheelBtns[1]:SetVisibility(UIConst.VisibilityOp.Visible)
  self.CurWheelBtns[2]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.CurWheelBtns[3]:SetVisibility(UIConst.VisibilityOp.Visible)
  self.CurWheelWidget = self.Battle_Menu
  self.SlotNumberPerWheel = 8
  self.WheelNumer = 3
  self.IsShowTips = false
  self.NoneContent = {}
  self:CreateWheelAnimationVariable()
  for Idx, value in pairs(self.BattleWheelWidgets) do
    value.bIsFocusable = true
    value.WheelIdx = Idx
    value:PreInitByParam({
      BehaviourType = UIConst.BATTLE_MENU_BEHAVIOUR_TYPE.ARMOURY_BATTLE_MENU
    })
    value:SetVisibility(UIConst.VisibilityOp.Visible)
    value:SetTipText(GText("UI_Armory_BattleBag"))
    value:SetWSNum(value.WheelIdx)
    value:EnableEvents(true, true, true)
    value:SetWheelRadius(130, 400)
    value:SetWheelMiddleStyle(0)
    self:EnableWheelWidgetPointerDetection(value, false)
    local Params = {
      OnSlotClickedEvent = self.OnWheelSlotClicked,
      OnSlotRightMouseClickedEvent = self.OnWheelSlotRightMouseClicked,
      OnSlotHoverChangedEvent = self.OnWheelSlotHoverChanged,
      OnSlotDropedEvent = self.OnWheelSlotDroped,
      OnSlotItemExchangedEvent = self.OnWheelSlotItemExchanged,
      OnDragCancelledEvent = self.OnWheelDragCancelled,
      OnSchemeClickedEvent = self.OnSwitchWheelPlan
    }
    self:OnModifyWheelInitParams(Params)
    value:BindEvents(self, Params)
    
    function value.InstallSoundFunc(Content)
      if not Content or not Content.UnitId then
        return
      end
      AudioManager(self):PlayItemSound(self, Content.UnitId, "Equip", Content.Type)
    end
  end
  self:InitDispatcher()
  self.List_Item.BP_OnItemClicked:Clear()
  self.List_Item.BP_OnItemClicked:Add(self, self.OnListItemClicked)
  self.List_Item.BP_OnItemSelectionChanged:Clear()
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnListItemSelectionChanged)
  self.List_Item.BP_OnEntryInitialized:Clear()
  self.List_Item.BP_OnEntryInitialized:Add(self, self.OnEntryInitialized)
  self.OrderByAttrNames = {"Rarity", "UnitId"}
  self.Arr_OrderBy = {
    "UI_RARITY_NAME"
  }
  local Params = {}
  self:OnModifySortWidgetParams(Params)
  self:UnbindAllFromAnimationFinished(self.Auto_Out)
  self:BindToAnimationFinished(self.Auto_Out, {
    self,
    self.OnOutAnimFinished
  })
  self:UnbindAllFromAnimationFinished(self.Auto_In)
  self:BindToAnimationFinished(self.Auto_In, {
    self,
    self.OnInAnimFinished
  })
  
  local function OnWheelBtnClicked(Btn)
    if Btn == self.CurWheelBtns[1] then
      self:OnWheelToLeftBtnClicked()
    elseif Btn == self.CurWheelBtns[3] then
      self:OnWheelToRightBtnClicked()
    end
  end
  
  self.Button_Menu_L.OnClicked:Clear()
  self.Button_Menu_R.OnClicked:Clear()
  self.Button_Menu_M.OnClicked:Clear()
  self.Button_Menu_L.OnClicked:Add(self, function()
    OnWheelBtnClicked(self.Button_Menu_L)
  end)
  self.Button_Menu_R.OnClicked:Add(self, function()
    OnWheelBtnClicked(self.Button_Menu_R)
  end)
  self.Button_Menu_M.OnClicked:Add(self, function()
    OnWheelBtnClicked(self.Button_Menu_M)
  end)
  self.Arrow_L.Btn.OnClicked:Clear()
  self.Arrow_L.Btn.OnClicked:Add(self, self.OnWheelToLeftBtnClicked)
  self.Arrow_R.Btn.OnClicked:Clear()
  self.Arrow_R.Btn.OnClicked:Add(self, self.OnWheelToRightBtnClicked)
  self.Button_BG.OnClicked:Clear()
  self.Button_BG.OnClicked:Add(self, self.OnButtonBGClicked)
  self.Btn_Wipe:BindEventOnClicked(self, self.OnClearWheelBtnClicked)
  self.Btn_Config:BindEventOnClicked(self, self.OnWeaponConfigBtnClicked)
  self.Filters = {
    {"All"},
    {"BattleItem"},
    {
      "GestureItem"
    },
    {
      "PhantomItem",
      "PhantomItem_Empty"
    }
  }
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    self:OnEmptyListItemContentCreated(Content)
    return Content
  end)
end

function M:OnEmptyListItemContentCreated(Content)
end

function M:EnableWheelWidgetPointerDetection(WheelWidget, bEnable)
  WheelWidget:EnablePointerDetection(bEnable)
end

function M:OnModifyWheelInitParams(Params)
end

function M:OnModifySortWidgetParams(Params)
end

function M:OnWheelSlotHoverChanged(LastSlot, CurrentSlot)
end

function M:InitDispatcher()
  self:AddDispatcher(EventID.OnChangeWheel, self, self.OnWheelChanged)
  self:AddDispatcher(EventID.OnExchangeBattleWheel, self, self.OnWheelItemExchanged)
  self:AddDispatcher(EventID.OnChangeBattleWheel, self, self.OnWheelItemInstalled)
  self:AddDispatcher(EventID.OnTakeOffBattleWheel, self, self.OnWheelItemUninstalled)
  self:AddDispatcher(EventID.OnEquipAssisterWeapon, self, self.OnAssisterWeaponEquiped)
  self:AddDispatcher(EventID.OnWheelNameChanged, self, self.OnWheelNameChanged)
  self:AddDispatcher(EventID.OnWheelItemCleared, self, self.OnWheelItemCleared)
  self:AddDispatcher(EventID.OnTakeOffAssisterWeapon, self, self.OnTakeOffAssisterWeapon)
  self:AddDispatcher(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
end

function M:WheelSlotIdx2ServerSlotIdx(SlotIdx, WheelIdx)
  return ((WheelIdx or self.CurWheelWidget.WheelIdx) - 1) * self.SlotNumberPerWheel + SlotIdx
end

function M:ServerSlotIdx2WheelSlotIdx(ServerSlotIdx)
  return ServerSlotIdx - (self.CurWheelWidget.WheelIdx - 1) * self.SlotNumberPerWheel
end

function M:CalcWheelWidgetAndSlotIdx(SlotIdx)
  local WheelIdx, SlotIdx = self:CalcWheelIdxAndSlotIdx(SlotIdx)
  return self.BattleWheelWidgets[WheelIdx], SlotIdx
end

function M:CalcWheelIdxAndSlotIdx(SlotIdx)
  SlotIdx = SlotIdx - 1
  local WheelIdx = SlotIdx // self.SlotNumberPerWheel + 1
  return WheelIdx, SlotIdx % self.SlotNumberPerWheel + 1
end

function M:SetSlotItem(_SlotIdx, Content)
  if nil == _SlotIdx then
    return
  end
  local WheelWidget, SlotIdx = self:CalcWheelWidgetAndSlotIdx(_SlotIdx)
  WheelWidget:SetSlotItem(SlotIdx, Content)
end

function M:GetSlotItem(_SlotIdx)
  if nil == _SlotIdx then
    return
  end
  local WheelWidget, SlotIdx = self:CalcWheelWidgetAndSlotIdx(_SlotIdx)
  return WheelWidget:GetSlotItem(SlotIdx)
end

function M:SelectSlot(IsSelected, _SlotIdx)
  if nil == _SlotIdx then
    return
  end
  local WheelWidget, SlotIdx = self:CalcWheelWidgetAndSlotIdx(_SlotIdx)
  WheelWidget:SelectSlot(IsSelected, SlotIdx)
end

function M:IsSlotInWheelRight(_SlotIdx)
  if nil == _SlotIdx then
    return
  end
  local WheelWidget, SlotIdx = self:CalcWheelWidgetAndSlotIdx(_SlotIdx)
  return WheelWidget:IsSlotInWheelRight(SlotIdx)
end

function M:InstallSlot(bSuccessful, _SlotIdx, Content)
  if nil == _SlotIdx then
    return
  end
  local WheelWidget, SlotIdx = self:CalcWheelWidgetAndSlotIdx(_SlotIdx)
  WheelWidget:InstallSlot(bSuccessful, SlotIdx, Content)
end

function M:ExchangedItem(bSuccessful, _FromIdx, _ToIdx)
  if nil == _FromIdx or nil == _ToIdx then
    return
  end
  local FromWheelWidget, FromIdx = self:CalcWheelWidgetAndSlotIdx(_FromIdx)
  local ToWheelWidget, ToIdx = self:CalcWheelWidgetAndSlotIdx(_ToIdx)
  local FromContent = FromWheelWidget:GetSlotItem(FromIdx)
  local ToContent = FromWheelWidget:GetSlotItem(ToIdx)
  if FromContent then
    ToWheelWidget:InstallSlot(bSuccessful, ToIdx, FromContent)
  else
    ToWheelWidget:SetSlotItem(ToIdx, nil)
  end
  if ToContent then
    FromWheelWidget:InstallSlot(bSuccessful, FromIdx, ToContent)
  else
    FromWheelWidget:SetSlotItem(FromIdx, nil)
  end
end

function M:OnWheelToLeftBtnClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  AudioManager(self):PlayUISound(nil, "event:/ui/common/combat_bag_change_page", nil, nil)
  self:WheelScrollToRight()
end

function M:OnWheelToRightBtnClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  AudioManager(self):PlayUISound(nil, "event:/ui/common/combat_bag_change_page", nil, nil)
  self:WheelScrollToLeft()
end

function M:ModifyWheelAnimationVariable(Params)
  local TotalDiff = Params.DesiredPanelMainOffset - self.DesiredPanelMainOffset.Right
  local CurDiff = self.CurrentPanelMainOffset.Right - self.DesiredPanelMainOffset.Right
  self.PassedTime_ShowTips = self.ShopTipsAnimationTime * (CurDiff / TotalDiff)
  self.StartPanelMainOffset = self.DesiredPanelMainOffset.Right
  self.StartScaleLR = self.DesiredScaleLR
  self.StartPositionX = self.DesiredPositionX
  self.DesiredScaleLR = Params.DesiredScaleLR
  self.DesiredScaleM = Params.DesiredScaleM
  self.DesiredPositionX = Params.DesiredPositionX
  self.DesiredPanelMainOffset.Right = Params.DesiredPanelMainOffset
  self.Panel_Main.Slot:SetOffsets(self.DesiredPanelMainOffset)
  self.PositionLerpStart = {
    [1] = self.DesiredPositionX,
    [2] = 0,
    [3] = -self.DesiredPositionX
  }
  self.PositionLerpEnd = {
    [1] = {
      [2] = 0,
      [3] = -self.DesiredPositionX
    },
    [2] = {
      [1] = self.DesiredPositionX,
      [3] = -self.DesiredPositionX
    },
    [3] = {
      [2] = 0,
      [1] = self.DesiredPositionX
    }
  }
end

function M:CreateWheelAnimationVariable()
  self.IsWheelScrolling = false
  self.DefaultScaleLR = self.DefaultScaleLR or 0.6
  self.DefaultScaleM = self.DefaultScaleM or 1
  self.DefaultPositionX = self.DefaultPositionX or -600
  self.DefaultPanelMainOffsetRight = 0
  self.DesiredPanelMainOffset = self.Panel_Main.Slot:GetOffsets()
  self.CurrentPanelMainOffset = self.Panel_Main.Slot:GetOffsets()
  self.ShopTipsAnimationTime = self.Tips_In:GetEndTime()
  self.PassedTime_ShowTips = self.ShopTipsAnimationTime
  self:ModifyWheelAnimationVariable({
    DesiredScaleLR = self.DefaultScaleLR,
    DesiredScaleM = self.DefaultScaleM,
    DesiredPositionX = self.DefaultPositionX,
    DesiredPanelMainOffset = self.DefaultPanelMainOffsetRight
  })
  self.WheelAnimationTime = self.WheelAnimationTime or 0.5
  self.PassedTime_WheelScroll = 0
  local ScaleMin, ScaleMax = self.Curve_BattleMenuScale_Left2Middle:GetValueRange()
  self.WheelWidgetScaleMin = ScaleMin
  self.WheelWidgetScaleMax = ScaleMax
  self.EWheelScrollDirection = {Left = 1, Right = 2}
  self.ScrollDirection2WhellIdx = {
    [self.EWheelScrollDirection.Left] = {
      {1, 3},
      {2, 1},
      {3, 2}
    },
    [self.EWheelScrollDirection.Right] = {
      {3, 1},
      {2, 3},
      {1, 2}
    }
  }
  self.ScrollWhellIdx2Direction = {
    {},
    {},
    {}
  }
  for Dir, value in pairs(self.ScrollDirection2WhellIdx) do
    for _, PairIdx in pairs(value) do
      self.ScrollWhellIdx2Direction[PairIdx[2]][PairIdx[1]] = Dir
    end
  end
  self.Curves_Position = {
    [1] = {
      [2] = {
        Curve = self.Curve_BattleMenuPosition_Left2Middle,
        Dir = 1
      },
      [3] = {
        Curve = self.Curve_BattleMenuPosition_Left2Right,
        Dir = 1
      }
    },
    [2] = {
      [1] = {
        Curve = self.Curve_BattleMenuPosition_Left2Middle,
        Dir = -1
      },
      [3] = {
        Curve = self.Curve_BattleMenuPosition_Left2Middle,
        Dir = -1
      }
    },
    [3] = {
      [1] = {
        Curve = self.Curve_BattleMenuPosition_Left2Right,
        Dir = -1
      },
      [2] = {
        Curve = self.Curve_BattleMenuPosition_Left2Middle,
        Dir = -1
      }
    }
  }
  self.Curves_Scale = {
    [1] = {
      [2] = {
        Curve = self.Curve_BattleMenuScale_Left2Middle
      }
    },
    [2] = {
      [1] = {
        Curve = self.Curve_BattleMenuScale_Left2Middle,
        bReverse = -1
      },
      [3] = {
        Curve = self.Curve_BattleMenuScale_Left2Middle,
        bReverse = -1
      }
    },
    [3] = {
      [2] = {
        Curve = self.Curve_BattleMenuScale_Left2Middle
      }
    }
  }
  self.Curves_RenderOpacity = {
    [1] = {
      [2] = {
        Curve = self.Curve_BattleMenuRenderOpacity_Left2Middle
      }
    },
    [2] = {
      [1] = {
        Curve = self.Curve_BattleMenuRenderOpacity_Left2Middle,
        bReverse = -1
      },
      [3] = {
        Curve = self.Curve_BattleMenuRenderOpacity_Left2Middle,
        bReverse = -1
      }
    },
    [3] = {
      [2] = {
        Curve = self.Curve_BattleMenuRenderOpacity_Left2Middle
      }
    }
  }
end

function M:CalcAnimationValue(i, j, _Percent)
  local PositionCurveValue
  local PositionCurveInfo = self.Curves_Position[i][j]
  if PositionCurveInfo then
    PositionCurveValue = PositionCurveInfo.Curve:GetFloatValue(_Percent)
  end
  local Position = UKismetMathLibrary.Lerp(self.PositionLerpStart[i], self.PositionLerpEnd[i][j], PositionCurveValue)
  local ScaleCurveValue
  local ScaleCurveInfo = self.Curves_Scale[i][j]
  if ScaleCurveInfo then
    local Percent
    if ScaleCurveInfo.bReverse then
      Percent = 1 - _Percent
    else
      Percent = _Percent
    end
    ScaleCurveValue = ScaleCurveInfo.Curve:GetFloatValue(Percent)
  else
    ScaleCurveValue = self.WheelWidgetScaleMin
  end
  local Scale = UKismetMathLibrary.Lerp(self.DesiredScaleLR, self.DesiredScaleM, ScaleCurveValue)
  local RenderOpacityCurveValue
  local RenderOpacityCurveInfo = self.Curves_RenderOpacity[i][j]
  if RenderOpacityCurveInfo then
    local Percent
    if RenderOpacityCurveInfo.bReverse then
      Percent = 1 - _Percent
    else
      Percent = _Percent
    end
    RenderOpacityCurveValue = RenderOpacityCurveInfo.Curve:GetFloatValue(Percent)
  else
    RenderOpacityCurveValue = self.WheelWidgetScaleMin
  end
  local RenderOpacity = UKismetMathLibrary.Lerp(self.RenderOpacityLR, self.RenderOpacityM, RenderOpacityCurveValue)
  return Position, Scale, RenderOpacity
end

function M:EndWheelAnimation()
  self.CurWheelWidgets[1].Slot:SetPosition(FVector2D(self.DesiredPositionX, 0))
  self.CurWheelWidgets[2].Slot:SetPosition(FVector2D(0, 0))
  self.CurWheelWidgets[3].Slot:SetPosition(FVector2D(-self.DesiredPositionX, 0))
  self.CurWheelWidgets[1]:SetRenderScale(FVector2D(self.DesiredScaleLR, self.DesiredScaleLR))
  self.CurWheelWidgets[2]:SetRenderScale(FVector2D(self.DesiredScaleM, self.DesiredScaleM))
  self.CurWheelWidgets[3]:SetRenderScale(FVector2D(self.DesiredScaleLR, self.DesiredScaleLR))
  self.CurWheelWidgets[1]:SetRenderOpacity(self.RenderOpacityLR)
  self.CurWheelWidgets[2]:SetRenderOpacity(self.RenderOpacityM)
  self.CurWheelWidgets[3]:SetRenderOpacity(self.RenderOpacityLR)
  self.CurWheelBtns[1]:SetVisibility(UIConst.VisibilityOp.Visible)
  self.CurWheelBtns[2]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.CurWheelBtns[3]:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Arrow_L:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Arrow_R:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.bShowMenuPlan then
    self.BattleMenu_Plan:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.CurWheelWidget:UpdateWheelConfig()
  self:EnableWheelWidgetPointerDetection(self.CurWheelWidget, true)
end

function M:WheelScrollToLeft()
  if self.IsWheelScrolling then
    return
  end
  for key, value in pairs(self.CurWheelWidgets) do
    self.WheelWidgetsForTick[key] = value
  end
  local t = self.CurWheelWidgets[1]
  self.CurWheelWidgets[1] = self.CurWheelWidgets[2]
  self.CurWheelWidgets[2] = self.CurWheelWidgets[3]
  self.CurWheelWidgets[3] = t
  t = self.CurWheelBtns[1]
  self.CurWheelBtns[1] = self.CurWheelBtns[2]
  self.CurWheelBtns[2] = self.CurWheelBtns[3]
  self.CurWheelBtns[3] = t
  self:WheelScrollCommonLogic()
  self.WheelScrollDirection = self.EWheelScrollDirection.Left
  self.IsWheelScrolling = true
end

function M:WheelScrollCommonLogic()
  self:HideItemDetail()
  self.CurWheelWidgets[1].Slot:SetZOrder(0)
  self.CurWheelWidgets[2].Slot:SetZOrder(1)
  self.CurWheelWidgets[3].Slot:SetZOrder(0)
  self.CurWheelWidget = self.CurWheelWidgets[2]
  for key, value in pairs(self.CurWheelWidgets) do
    self:EnableWheelWidgetPointerDetection(value, false)
  end
  for key, value in pairs(self.CurWheelBtns) do
    value:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if self.Arrow_L:IsVisible() then
    self.Arrow_L:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Arrow_R:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if self.bShowMenuPlan then
    self.BattleMenu_Plan:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:WheelScrollToRight()
  if self.IsWheelScrolling then
    return
  end
  for key, value in pairs(self.CurWheelWidgets) do
    self.WheelWidgetsForTick[key] = value
  end
  local t = self.CurWheelWidgets[3]
  self.CurWheelWidgets[3] = self.CurWheelWidgets[2]
  self.CurWheelWidgets[2] = self.CurWheelWidgets[1]
  self.CurWheelWidgets[1] = t
  t = self.CurWheelBtns[3]
  self.CurWheelBtns[3] = self.CurWheelBtns[2]
  self.CurWheelBtns[2] = self.CurWheelBtns[1]
  self.CurWheelBtns[1] = t
  self:WheelScrollCommonLogic()
  self.WheelScrollDirection = self.EWheelScrollDirection.Right
  self.IsWheelScrolling = true
end

local TempPosition = FVector2D(0, 0)
local TempScale = FVector2D(0, 0)

function M:Tick(MyGeometry, InDeltaTime)
  local ShowTipsPercent = 1
  local ScrollAnimPercent = 1
  local TipsAnimPosX = 0
  if self.IsWheelScrolling then
    self.PassedTime_WheelScroll = self.PassedTime_WheelScroll + InDeltaTime
    if self.PassedTime_WheelScroll >= self.WheelAnimationTime then
      ScrollAnimPercent = 1
    else
      ScrollAnimPercent = self.PassedTime_WheelScroll / self.WheelAnimationTime
    end
  end
  if self.IsShowTipsAnimationPlaying then
    self.PassedTime_ShowTips = self.PassedTime_ShowTips + InDeltaTime
    if self.PassedTime_ShowTips >= self.ShopTipsAnimationTime then
      ShowTipsPercent = 1
      self:OnShowTipsAnimationEnd()
    else
      ShowTipsPercent = self.PassedTime_ShowTips / self.ShopTipsAnimationTime
    end
    self.CurrentPanelMainOffset.Right = UKismetMathLibrary.Lerp(self.StartPanelMainOffset, self.DesiredPanelMainOffset.Right, ShowTipsPercent)
    self.Panel_Main.Slot:SetOffsets(self.CurrentPanelMainOffset)
    TempScale.X = UKismetMathLibrary.Lerp(self.StartScaleLR, self.DesiredScaleLR, ShowTipsPercent)
    TempScale.Y = TempScale.X
    TempPosition.X = UKismetMathLibrary.Lerp(self.StartPositionX, self.DesiredPositionX, ShowTipsPercent)
    TipsAnimPosX = TempPosition.X * ScrollAnimPercent
    if not self.IsWheelScrolling then
      self.CurWheelWidgets[1]:SetRenderScale(TempScale)
      self.CurWheelWidgets[3]:SetRenderScale(TempScale)
      self.CurWheelWidgets[1].Slot:SetPosition(TempPosition)
      self.CurWheelWidgets[3].Slot:SetPosition(-TempPosition)
    end
  end
  if not self.IsWheelScrolling then
    return
  end
  self.PassedTime_WheelScroll = self.PassedTime_WheelScroll + InDeltaTime
  if self.PassedTime_WheelScroll >= self.WheelAnimationTime then
    self:OnWheelScrollAnimationEnd()
    return
  end
  local Position, Scale, RendreOpacity, WheelIdx1, WheelIdx2
  for _, value in pairs(self.ScrollDirection2WhellIdx[self.WheelScrollDirection]) do
    WheelIdx1, WheelIdx2 = value[1], value[2]
    Position, Scale, RendreOpacity = self:CalcAnimationValue(WheelIdx1, WheelIdx2, ScrollAnimPercent)
    if self.IsShowTipsAnimationPlaying and self.WheelWidgetsForTick[WheelIdx1] ~= self.CurWheelWidget then
      TempScale.X = (TempScale.X + Scale) / 2
      TempScale.Y = (TempScale.Y + Scale) / 2
      if self.WheelWidgetsForTick[WheelIdx1] == self.CurWheelWidgets[1] then
        TempPosition.X = (TipsAnimPosX + Position) / 2
      else
        TempPosition.X = (-TipsAnimPosX + Position) / 2
      end
    else
      TempPosition.X = Position
      TempScale.X = Scale
      TempScale.Y = Scale
    end
    self.WheelWidgetsForTick[WheelIdx1].Slot:SetPosition(TempPosition)
    self.WheelWidgetsForTick[WheelIdx1]:SetRenderScale(TempScale)
    self.WheelWidgetsForTick[WheelIdx1]:SetRenderOpacity(RendreOpacity)
  end
end

function M:OnWheelScrollAnimationEnd()
  self.IsWheelScrolling = false
  self.PassedTime_WheelScroll = 0
  self:OnWheelAnimationEnd()
end

function M:OnShowTipsAnimationEnd()
  self.IsShowTipsAnimationPlaying = false
  self.CurrentPanelMainOffset.Right = self.DesiredPanelMainOffset.Right
  self.CurWheelWidget:RelayoutPrepass()
  self:OnWheelAnimationEnd()
end

function M:OnWheelAnimationEnd()
  if self.IsShowTipsAnimationPlaying or self.IsWheelScrolling then
    return
  end
  self:EndWheelAnimation()
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.IsPreviewMode = Params.IsPreviewMode
  self.bShowMenuPlan = not Params.bHideWheelPlan
  self.CurrentWheelIndex = Params.ToBattleWheelIndex or ArmoryUtils:GetAvatar().WheelIndex
  self:CreateItemContents()
  self:ResetWheelSlotItems()
  self:HideItemDetail()
  self:ResetWheelPlanName()
  self.FilteredItems = {}
  self:InitFilters()
  self:ResetListView()
  self:EndWheelAnimation()
  self.CurWheelWidget:UpdateWheelConfig()
end

function M:GetWheelPlanName()
  local Avatar = ArmoryUtils:GetAvatar()
  local WheelsName = {}
  for index, value in ipairs(Avatar.WheelsName) do
    local Name = value
    if not Name or "" == Name then
      Name = "UI_Squad_BattleWheel_TITLE" .. index
    end
    table.insert(WheelsName, GText(Name))
  end
  return WheelsName
end

function M:ResetWheelPlanName()
  if not self.bShowMenuPlan then
    self.BattleMenu_Plan:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local WheelsName = self:GetWheelPlanName()
  local Params = {
    Owner = self,
    OnEditBtnClicked = self.OnWheelNameEditBtnClicked,
    OnPlanChanged = self.OnSwitchWheelPlan,
    PlanNames = WheelsName,
    SelectedItemIndex = self.CurrentWheelIndex
  }
  self:OnModifyPlanParams(Params)
  self.BattleMenu_Plan:Init(Params)
end

function M:OnModifyPlanParams(Params)
end

function M:OnWheelNameEditBtnClicked()
  local WheelPlanNames = self:GetWheelPlanName()
  local Data = DataMgr.GlobalConstant.BattleWheelNameMaxLen or {ConstantValue = 14}
  self.NameEditDialog = UIManager(self):ShowCommonPopupUI(100176, {
    EditTextConfig = {
      Text = WheelPlanNames[self.CurrentWheelIndex],
      IsMultiLine = false,
      Owner = self,
      TextLimit = Data.ConstantValue,
      bLimitSpaces = true,
      bNotAllowEmpty = true,
      Events = {
        OnTextChanged = function(Text)
          if Text == WheelPlanNames[self.CurrentWheelIndex] then
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
          else
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
          end
        end
      },
      bNeedCheckStringSensitive = true,
      OnCheckStringSensitive = function(_, bSuccess, Name)
        if bSuccess then
          Name = Name or ""
          if "" ~= Name then
            local Avatar = GWorld:GetAvatar()
            Avatar:ChangeWheelName(Name, self.CurrentWheelIndex)
          else
          end
        end
      end
    }
  }, self)
end

function M:OnWheelNameChanged(Ret, NewName, WheelIndex)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetWheelPlanName()
end

local function AddContent(self, Resource, CharId2Char)
  if not CharId2Char then
    CharId2Char = {}
    local Avatar = ArmoryUtils:GetAvatar()
    for key, value in pairs(Avatar.Chars) do
      CharId2Char[value.CharId] = value
    end
  end
  local Data = Resource:Data()
  if Data and string.match(Data.Type, "BattleItem") then
    local Content = self:NewItemContent(Resource)
    Content.IsNew = ArmoryUtils:TryAddNewResourceReddot(Resource, Resource.ResourceId)
    if Content.IsNew then
      Content.RedDotType = UIConst.RedDotType.NewRedDot
    elseif Content.Upgradeable then
      Content.RedDotType = UIConst.RedDotType.CommonRedDot
    end
    if Content.IsPhantom and CharId2Char[Content.CharId] then
      Content.Char = CharId2Char[Content.CharId]
      Content.Level = Content.Char.Level
      Content.ResourceCount = (GText("UI_LEVEL_NAME") or "") .. Content.Level
    end
    self.BP_ListItemContents:Add(Content)
    self.ContentMap[Content.UnitId] = Content
    table.insert(self.ContentArray, Content)
    Content.ButtonIcon = 1
    
    function Content.OnMouseButtonDownEarly(Widget, Content, MouseEvent)
      return self:OnRightMouseButtonDown(Content, MouseEvent)
    end
    
    Content.OnMouseEnterEvent = {
      Callback = function(_Content)
        if not _Content.Id then
          return
        end
        ArmoryUtils:SetItemReddotRead(_Content, _Content.IsNew)
      end,
      Params = Content
    }
    self:OnListItemContentCreated(Content)
    return Content
  end
end

function M:CreateItemContents()
  self.ContentMap = {}
  self.ContentArray = {}
  self.BP_ListItemContents:Clear()
  local Avatar = ArmoryUtils:GetAvatar()
  local CharId2Char = {}
  for key, value in pairs(Avatar.Chars) do
    CharId2Char[value.CharId] = value
  end
  local NeedWeaponConfitBtn = false
  for Rid, Resource in pairs(Avatar.Resources) do
    local Content = AddContent(self, Resource, CharId2Char)
    if Content and Content.IsPhantom then
      NeedWeaponConfitBtn = true
    end
  end
  if NeedWeaponConfitBtn then
    self.Btn_Config:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Config:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnListItemContentCreated(Content)
end

function M:NewItemContent(ServerData)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Type = CommonConst.DataType.Resource
  Obj.ItemType = CommonConst.DataType.Resource
  Obj.Id = ServerData.ResourceId
  Obj.UnitId = ServerData.ResourceId
  Obj.ResourceCount = 0
  Obj.ResourceSType = ServerData.ResourceSType
  local Data = ServerData:Data()
  if Data.Type == "InfiniteBattleItem" then
    Obj.ResourceCount = ""
    if Obj.ResourceSType == "PhantomItem" then
      Obj.IsPhantom = true
      Obj.ItemDetailsButton01EventInfo = self:CreateOpenPhantomButtonEventInfo(Obj)
      Obj.ItemDetailsButton02EventInfo = self:CreateQuickEquipButtonEventInfo(Obj)
      local BattleCharData = DataMgr.BattleChar[Data.UseParam]
      local Element = BattleCharData and BattleCharData.Attribute
      if Element then
        local IconName = "Armory_" .. Element
        Obj.AttrIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
      end
    else
      Obj.ItemName = GText("INFINITY_SYMBOL")
      Obj.ItemDetailsButton01EventInfo = self:CreateQuickEquipButtonEventInfo(Obj)
      if Obj.ResourceSType == "GestureItem" then
        Obj.ItemDetailsButton02EventInfo = self:CreatePreviewButtonEventInfo(Obj)
      end
    end
  else
    Obj.Count = ServerData.Count
    if Data.BattleItemLimit then
      Obj.ResourceCount = math.min(ServerData.Count, Data.BattleItemLimit)
    end
    Obj.ItemDetailsButton01EventInfo = self:CreateQuickEquipButtonEventInfo(Obj)
  end
  Obj.IsEquiped = false
  Obj.Rarity = Data.Rarity or 0
  Obj.Icon = Data.Icon
  Obj.bEnableDrag = true
  Obj.ParentWidget = self
  Obj.CharId = Data.UseParam
  Obj.MenuPlacement = EMenuPlacement.MenuPlacement_CenteredAboveAnchor
  Obj.CreateDragWidget = self.CreateDragWidget
  return Obj
end

function M:CreatePreviewButtonEventInfo(Content)
  if Content.IsPhantom and not self:IsContentHasWeapon(Content) then
    return nil
  end
  return {
    ButtonClickCallBack = function()
      self:TryOpenPreview(Content)
    end,
    ButtonClickPadKey = "Gamepad_FaceButton_Top",
    ButtonClickText = GText("UI_Preview_Title"),
    ButtonIcon = 1
  }
end

function M:CreateQuickEquipButtonEventInfo(Content)
  if Content.IsPhantom and not self:IsContentHasWeapon(Content) then
    return nil
  end
  return {
    ButtonClickCallBack = function()
      self:TryQuickEquipContent(Content)
    end,
    ButtonClickPadKey = "Gamepad_FaceButton_Left",
    ButtonClickText = GText("UI_Armory_Quick_Equip"),
    ButtonIcon = 1
  }
end

function M:CreateQuickUnequipButtonEventInfo(Content)
  return {
    ButtonClickCallBack = function()
      self:TryQuickUnequipContent(Content)
    end,
    ButtonClickPadKey = "Gamepad_FaceButton_Left",
    ButtonClickText = GText("UI_Armory_Weapon_Remove"),
    ButtonIcon = 1
  }
end

function M:CreateOpenPhantomButtonEventInfo(Content)
  local ButtonClickText
  if not self:IsContentHasWeapon(Content) then
    ButtonClickText = GText("UI_Armory_Weapon_Dispose")
  else
    ButtonClickText = GText("UI_Armory_Weapon_Adjust")
  end
  return {
    ButtonClickCallBack = function()
      self:OpenPhantomWeaponMenu(Content)
    end,
    ButtonClickPadKey = "Gamepad_FaceButton_Top",
    ButtonClickText = ButtonClickText,
    ButtonIcon = 1
  }
end

function M:OnResourcesChanged(ResourceId)
  local Avatar = ArmoryUtils:GetAvatar()
  local Resource = Avatar.Resources[ResourceId]
  if not Resource then
    return
  end
  local Data = Resource:Data()
  if Data and string.match(Data.Type, "BattleItem") then
    local Content = self.ContentMap[ResourceId]
    if Content then
      if Resource:Data().Type ~= "InfiniteBattleItem" then
        local OldCount = Content.Count
        local WheelContent = self.WheelContens[ResourceId]
        if WheelContent then
          Content.Count = Resource.Count - WheelContent.ResourceCount
        else
          Content.Count = Resource.Count
          if Data.BattleItemLimit then
            Content.ResourceCount = math.min(Resource.Count, Data.BattleItemLimit)
          end
        end
        if Content.SelfWidget then
          Content.SelfWidget:SetCount(Content.Count)
        end
        if OldCount ~= Content.Count then
          self:ResetListView()
        end
      end
      if Content.SelfWidget then
        Content.SelfWidget:SetCount(Content.Count)
      end
    else
      AddContent(self, Resource)
      self:ResetListView()
    end
  end
end

function M:ResetWheelSlotItems()
  local Avatar = GWorld:GetAvatar()
  if self.WheelContens then
    for _, Content in pairs(self.WheelContens) do
      Content.IsEquiped = false
      Content.WheelIdx = nil
      Content.SlotIdx = nil
      self:ResetContentButtonInfo(Content)
      local Resource = Avatar.Resources[Content.UnitId]
      local Data = Resource:Data()
      if Data.Type ~= "InfiniteBattleItem" then
        Content.Count = Resource.Count
        if Data.BattleItemLimit then
          Content.ResourceCount = math.min(Resource.Count, Data.BattleItemLimit)
        end
        if Content.SelfWidget then
          Content.SelfWidget:SetCount(Content.Count)
        end
      end
    end
  end
  self.WheelContens = {}
  local CurrentWheel = Avatar.Wheels[self.CurrentWheelIndex]
  for index, Slot in ipairs(CurrentWheel) do
    if nil ~= Slot.ResourceId and 0 ~= Slot.ResourceId then
      local Content = self.ContentMap[Slot.ResourceId]
      self.WheelContens[Slot.ResourceId] = Content
      Content.IsEquiped = true
      Content.WheelIdx, Content.SlotIdx = self:CalcWheelIdxAndSlotIdx(index)
      self:ResetContentButtonInfo(Content)
      local Resource = Avatar.Resources[Content.UnitId]
      if Resource:Data().Type ~= "InfiniteBattleItem" then
        Content.ResourceCount = Slot.ResourceCount
        Content.Count = Resource.Count - Slot.ResourceCount
        if Content.SelfWidget then
          Content.SelfWidget:SetCount(Content.Count)
        end
      end
      self:SetSlotItem(index, Content)
    else
      self:SetSlotItem(index, nil)
    end
  end
  self:UpdateClearBtn()
end

function M:IsContentHasWeapon(Content)
  if Content and Content.IsPhantom then
    local Avatar = GWorld:GetAvatar()
    local WeaponUuid = Avatar.Resources[Content.UnitId].WeaponUuid
    if nil == WeaponUuid or "" == WeaponUuid then
      return false
    else
      return true
    end
  end
end

function M:CreateDragWidget(Content, Slot)
  if not self:CanEquipContent(Content) then
    return
  end
  if not IsValid(self._DragWidget) then
    self._DragWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Armory/Widget/Unit/WBP_Armory_Item_Drag.WBP_Armory_Item_Drag", false)
  end
  local IconDynaMaterial = self._DragWidget.Prop_Icon:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("MainTex", LoadObject(Content.Icon))
  end
  return self._DragWidget
end

function M:ResetListView()
  self.FilteredItems = self:FilterContents(self.ContentArray)
  self:SortContents(self.FilteredItems)
  self:InitListView()
  if self.ItemtDetailContent and self.ContentMap[self.ItemtDetailContent.UnitId] then
    self.ItemtDetailContent = self.ContentMap[self.ItemtDetailContent.UnitId]
  end
end

function M:OnSortListSelectionsChanged(SortBy, SortType)
  self:SortContents(self.FilteredItems)
  self:InitListView()
end

function M:OnSortTypeChanged(SortType)
  self:SortContents(self.FilteredItems)
  self:InitListView()
end

function M:InitFilters()
  self.FiterContents = self.FiterContents or {
    {
      Owner = self,
      OnClicked = self.OnFilterWidgetClicked,
      IsSelected = true
    }
  }
  local FiterWidgets = self.WB_Tab:GetAllChildren():ToTable()
  local Data = DataMgr.BattleWheelTab
  for index, value in ipairs(FiterWidgets) do
    self.FiterContents[index] = self.FiterContents[index] or {
      Owner = self,
      OnClicked = self.OnFilterWidgetClicked,
      IsSelected = false
    }
    local Content = self.FiterContents[index]
    Content.Idx = index
    Content.Icon = Data[index].IconPath
    self:OnFilterContentCreated(Content)
    value:Init(Content)
    if Content.IsSelected then
      self.CurFilterContent = Content
    end
  end
end

function M:OnFilterContentCreated(Content)
end

function M:OnFilterWidgetClicked(Content)
  ArmoryUtils:SetContentIsSelected(self.CurFilterContent, false)
  self.CurFilterContent = Content
  ArmoryUtils:SetContentIsSelected(self.CurFilterContent, true)
  self:ResetListView()
end

function M:FilterContents(Contents)
  local Res = {}
  local FilterStrs = {}
  for index, value in ipairs(self.FiterContents) do
    if value.IsSelected then
      if 1 == index then
        for _, Filter in ipairs(self.Filters) do
          for _, Str in ipairs(Filter) do
            FilterStrs[Str] = 1
          end
        end
        break
      end
      for _, Str in ipairs(self.Filters[index]) do
        FilterStrs[Str] = 1
      end
      break
    end
  end
  for index, Content in ipairs(Contents) do
    if FilterStrs[Content.ResourceSType] then
      if type(Content.Count) ~= "number" then
        if not Content.IsEquiped then
          table.insert(Res, Content)
        end
      elseif Content.Count > 0 then
        table.insert(Res, Content)
      end
    end
  end
  return Res
end

function M:SortContents(InOutContents)
  local SortBy, SortType = 1, CommonConst.DESC
  local SortByAttrNames = {
    self.OrderByAttrNames[SortBy]
  }
  for index, value in ipairs(self.OrderByAttrNames) do
    if index ~= SortBy then
      table.insert(SortByAttrNames, value)
    end
  end
  ArmoryUtils:SortItemContents(InOutContents, SortByAttrNames, SortType, self.CurWeaponContent)
end

function M:InitListView()
  self.List_Item:ClearListItems()
  for index, Obj in ipairs(self.FilteredItems) do
    self.List_Item:AddItem(Obj)
    self:UpdatePhantomItem(Obj)
  end
  if #self.FilteredItems <= 0 then
    self.List_Item:RegenerateAllEntries()
  end
  self:AddTimer(0.01, function()
    self.List_Item:RequestFillEmptyContent()
  end)
end

function M:OnListItemClicked(Content)
  if not Content.Id then
    return
  end
  self:SetItemDetailContent(Content)
end

function M:OnEntryInitialized(Content, Widget)
  Widget.Item.ItemDetails_MenuAnchor:SetRenderTranslation(FVector2D(0, -80))
  self:UpdatePhantomItem(Content)
end

function M:UpdatePhantomItem(Content)
  if Content.IsPhantom then
    local Widget = Content.SelfWidget
    Content.bShadow = not self:IsContentHasWeapon(Content)
    if not Widget then
      return
    end
    Widget:SetShadow(Content.bShadow)
    Widget:SetLevel(nil)
    Widget:SetLevel(Content.Level)
    Widget:SetPhantomWeaponIcon(Content.Id, Content.IsPhantom)
    Widget:SetAttrIcon(Content.AttrIcon)
    Widget:SetRedDot(Content.RedDotType)
  end
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  if not IsSelected or not Content.Id then
    return
  end
  ArmoryUtils:SetItemReddotRead(Content, Content.IsNew)
end

function M:CanEquipContent(Content)
  if Content.IsPhantom and not self:IsContentHasWeapon(Content) then
    if Content.SelfWidget then
      Content.SelfWidget:PlayPhantomJitterAnim()
    end
    AudioManager(self):PlayUISound(nil, "event:/ui/common/err_action_warning", nil, nil)
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_Armory_Weapon_NoAssist"))
    return false
  end
  return true
end

function M:IsPhantomWeaponMenuOpened()
  return IsValid(self.PhantomWeaponMenu)
end

function M:SetPhantomWeaponMenuFocus()
  if self:IsPhantomWeaponMenuOpened() then
    self.PhantomWeaponMenu:SetVisibility(UIConst.VisibilityOp.Visible)
    self.PhantomWeaponMenu:SetFocus()
  end
end

function M:OnWeaponConfigBtnClicked()
  return self:OpenPhantomWeaponMenu()
end

function M:OpenPhantomWeaponMenu(Content)
  self.PhantomWeaponMenu = UIManager(self):LoadUI(nil, "ArmoryBattleMenuWeaponConfig", self.Parent:GetZOrder(), {
    Parent = self.Parent,
    PhantomRId = Content and Content.UnitId,
    OnClosedCbFunc = self.OnPhantomWeaponMenuClosed,
    OnClosedCbObj = self
  })
  return self.PhantomWeaponMenu
end

function M:OnPhantomWeaponMenuClosed(ResourceId)
  self.PhantomWeaponMenu = nil
  self:ResetWheelSlotItems()
  self:ResetPhantomWeapon()
  if self:IsShowingItemDetail() then
    self:SetItemDetailContent(self.ItemtDetailContent)
  end
  self:SetFocus()
end

function M:ResetPhantomWeapon()
  for _, Content in pairs(self.ContentArray) do
    if Content.IsPhantom and not self.WheelContens[Content.UnitId] then
      Content.ItemDetailsButton01EventInfo = self:CreateOpenPhantomButtonEventInfo(Content)
      Content.ItemDetailsButton02EventInfo = self:CreateQuickEquipButtonEventInfo(Content)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetPhantomWeaponIcon(Content.UnitId, Content.IsPhantom)
      Content.SelfWidget.ItemDetailsButton01EventInfo = Content.ItemDetailsButton01EventInfo
      Content.SelfWidget.ItemDetailsButton02EventInfo = Content.ItemDetailsButton02EventInfo
    end
  end
end

function M:ResetContentButtonInfo(Content)
  if Content.IsPhantom then
    Content.ItemDetailsButton01EventInfo = self:CreateOpenPhantomButtonEventInfo(Content)
    if Content.WheelIdx then
      Content.ItemDetailsButton02EventInfo = self:CreateQuickUnequipButtonEventInfo(Content)
    else
      Content.ItemDetailsButton02EventInfo = self:CreateQuickEquipButtonEventInfo(Content)
    end
  else
    if Content.WheelIdx then
      Content.ItemDetailsButton01EventInfo = self:CreateQuickUnequipButtonEventInfo(Content)
    else
      Content.ItemDetailsButton01EventInfo = self:CreateQuickEquipButtonEventInfo(Content)
    end
    if Content.ResourceSType == "GestureItem" then
      Content.ItemDetailsButton02EventInfo = self:CreatePreviewButtonEventInfo(Content)
    else
      Content.ItemDetailsButton02EventInfo = nil
    end
  end
  if Content.SelfWidget then
    Content.SelfWidget.ItemDetailsButton01EventInfo = Content.ItemDetailsButton01EventInfo
    Content.SelfWidget.ItemDetailsButton02EventInfo = Content.ItemDetailsButton02EventInfo
  end
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if self.IsLoaded and self.PhantomWeaponMenu then
    self.PhantomWeaponMenu:SetVisibility(UIConst.VisibilityOp.Visible)
    self.PhantomWeaponMenu:SetFocus()
  end
end

function M:OnBagItemDetailButtonClicked()
  self:OpenPhantomWeaponMenu(self.ItemtDetailContent)
end

function M:OnWheelSlotClicked(CurrentSlotIdx, LastSlotIdx)
  self:SelectWheelSlot(CurrentSlotIdx, LastSlotIdx)
end

function M:OnWheelSlotRightMouseClicked(CurrentSlotIdx, LastSlotIdx)
  local Content = self.CurWheelWidget:GetSlotItem(CurrentSlotIdx)
  if Content then
    self:TryQuickUnequipContent(Content)
  end
end

function M:SelectWheelSlot(CurrentSlotIdx, LastSlotIdx)
  local Content = self.CurWheelWidget:GetSlotItem(CurrentSlotIdx)
  self:SetItemDetailContent(Content, self.CurWheelWidget.WheelIdx, CurrentSlotIdx)
end

function M:SetItemDetailContent(Content, WheelIdx, SlotIdx)
  WheelIdx = Content and Content.WheelIdx or WheelIdx
  SlotIdx = Content and Content.SlotIdx or SlotIdx
  if self.LastItemDetailWheelIdx and (WheelIdx ~= self.LastItemDetailWheelIdx or SlotIdx ~= self.LastItemDetailSlotIdx) then
    self.BattleWheelWidgets[self.LastItemDetailWheelIdx]:SelectSlot(false, self.LastItemDetailSlotIdx)
  end
  self.LastItemDetailWheelIdx = WheelIdx
  self.LastItemDetailSlotIdx = SlotIdx
  if WheelIdx then
    self.BattleWheelWidgets[WheelIdx]:SelectSlot(true, SlotIdx)
  end
  if self.ItemtDetailContent ~= Content then
    ArmoryUtils:SetItemIsSelected(self.ItemtDetailContent, false)
    ArmoryUtils:SetItemIsSelected(Content, true)
  end
  local NewContent = Content or self.NoneContent
  if NewContent == self.ItemtDetailContent then
    return
  end
  self.ItemtDetailContent = NewContent
  self:ShowItemDetail(Content)
end

function M:IsShowingItemDetail()
  return self.IsShowTips
end

function M:UpdateItemDetails(Content)
  if nil == Content or Content == self.NoneContent then
    self.WS_Tips:SetActiveWidgetIndex(1)
    return
  end
  self.WS_Tips:SetActiveWidgetIndex(0)
  AudioManager(self):PlayUISound(nil, "event:/ui/common/tip_show_click", nil, nil)
  self.Tips_Item:HideButtons()
  Content.bHideGamePad = true
  self.Tips_Item:RefreshItemInfo(Content, true)
  self:UpdateItemDetailsButton(Content)
end

function M:UpdateItemDetailsButton(Content)
  self.Tips_Item:InitButton01Event(Content.ItemDetailsButton01EventInfo)
  self.Tips_Item:InitButtonEvent(Content.ItemDetailsButton02EventInfo)
end

function M:ShowItemDetail()
  self:UpdateItemDetails(self.ItemtDetailContent)
  self:StopAnimation(self.Tips_Out)
  self:PlayAnimation(self.Tips_In)
  self.Tips_Item:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.IsShowTips then
    return
  end
  self.IsShowTips = true
  self.IsShowTipsAnimationPlaying = true
  self:ModifyWheelAnimationVariable({
    DesiredScaleLR = self.TipsScaleLR,
    DesiredScaleM = self.DefaultScaleM,
    DesiredPositionX = self.TipsPositionX,
    DesiredPanelMainOffset = self.TipsPanelMainOffset
  })
end

function M:HideItemDetail()
  ArmoryUtils:SetItemIsSelected(self.ItemtDetailContent, false)
  self.CurWheelWidget:ClearSlotSelect()
  self.ItemtDetailContent = nil
  if not self.IsShowTips then
    return
  end
  self.IsShowTips = false
  self.Tips_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.Tips_In)
  self:PlayAnimation(self.Tips_Out)
  self.IsShowTipsAnimationPlaying = true
  self:ModifyWheelAnimationVariable({
    DesiredScaleLR = self.DefaultScaleLR,
    DesiredScaleM = self.DefaultScaleM,
    DesiredPositionX = self.DefaultPositionX,
    DesiredPanelMainOffset = self.DefaultPanelMainOffsetRight
  })
  self.CurWheelWidget:ClearSlotSelect()
end

function M:OnButtonBGClicked()
  if self:IsShowingItemDetail() then
    self:HideItemDetail()
  end
end

function M:UpdateClearBtn()
  if next(self.WheelContens) then
    self.Btn_Wipe:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Wipe:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnSwitchWheelPlan(WheelIdx)
  if WheelIdx == self.CurrentWheelIndex then
    return
  end
  self.Parent:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ChangeWheel(WheelIdx)
end

function M:OnRightMouseButtonDown(Content, MouseEvent)
  if not UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.RightMouseButton) then
    return
  end
  self:TryQuickEquipContent(Content)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:TryQuickEquipContent(Content, SuccessCallback)
  local ContentInWheel = self.WheelContens[Content.UnitId]
  local TargetWheelIdx, TargetSlotIdx
  if ContentInWheel then
    TargetWheelIdx = ContentInWheel.WheelIdx
    TargetSlotIdx = ContentInWheel.SlotIdx
  else
    TargetSlotIdx = self.CurWheelWidget:FindFirtEmptySlotIdx()
  end
  if TargetSlotIdx then
    self:TryEquipContent(Content, TargetWheelIdx, TargetSlotIdx, SuccessCallback)
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_BattleWheel_Full"))
  end
end

function M:TryEquipContent(Content, WheelIdx, WheelSlotIdx, SuccessCallback)
  if not self:CanEquipContent(Content) then
    return
  end
  if self:IsContentInWheelAndFull(Content) then
    local ResourceServerSlotIdx = self:GetServerSlotIdxByRId(Content.UnitId)
    self:ShowEquippedWarning(ResourceServerSlotIdx, Content)
  else
    local ServerSlotIdx = self:WheelSlotIdx2ServerSlotIdx(WheelSlotIdx, WheelIdx)
    self.SuccessCallbackOnce = SuccessCallback
    local Avatar = GWorld:GetAvatar()
    self.Parent:BlockAllUIInput(true)
    self.EquippedContent = Content
    self.EquippedContentIndex = self.List_Item:GetIndexForItem(Content)
    Avatar:ChangeBattleWheel(self.CurrentWheelIndex, ServerSlotIdx, Content.UnitId)
  end
end

function M:IsContentInWheelAndFull(Content)
  local ContentInWheel = self.WheelContens[Content.UnitId]
  if ContentInWheel then
    local Data = DataMgr.Resource[Content.UnitId]
    if Data and Data.BattleItemLimit then
      local Avatar = GWorld:GetAvatar()
      local CurrentWheel = Avatar.Wheels[self.CurrentWheelIndex]
      local Count = 0
      for index, value in ipairs(CurrentWheel) do
        if value.ResourceId == Content.UnitId then
          Count = value.ResourceCount or 0
          break
        end
      end
      if Count >= (Data.BattleItemLimit or 0) then
        return true
      end
    end
  end
end

function M:GetServerSlotIdxByRId(ResourceId)
  local Avatar = GWorld:GetAvatar()
  local CurrentWheel = Avatar.Wheels[self.CurrentWheelIndex]
  for index, value in ipairs(CurrentWheel) do
    if value.ResourceId == ResourceId then
      return index
    end
  end
end

function M:ShowEquippedWarning(ServerSlotIdx, Content)
  AudioManager(self):PlayUISound(nil, "event:/ui/common/err_action_warning", nil, nil)
  self:InstallSlot(false, ServerSlotIdx, Content)
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_BattleWheel_Equipped"))
end

function M:OnWheelSlotDroped(Content, DropedSlot)
  if not Content then
    return
  end
  if Content.WheelIdx and not DropedSlot then
    self:OnWheelDragCancelled(Content)
    return
  end
  local Avatar = GWorld:GetAvatar()
  local ServerSlotIdx = self:WheelSlotIdx2ServerSlotIdx(DropedSlot)
  local ContentInWheel = self.WheelContens[Content.UnitId]
  if ContentInWheel then
    if Content.WheelIdx and Content.WheelIdx ~= self.CurWheelWidget.WheelIdx then
      local FormSlotIdx = self:WheelSlotIdx2ServerSlotIdx(Content.SlotIdx, Content.WheelIdx)
      self.Parent:BlockAllUIInput(true)
      Avatar:ExchangeBattleWheel(self.CurrentWheelIndex, FormSlotIdx, self:WheelSlotIdx2ServerSlotIdx(DropedSlot))
      return
    elseif self:IsContentInWheelAndFull(ContentInWheel) then
      self:ShowEquippedWarning(ServerSlotIdx, Content)
      return
    end
  end
  self.Parent:BlockAllUIInput(true)
  self.EquippedContent = Content
  self.EquippedContentIndex = self.List_Item:GetIndexForItem(Content)
  Avatar:ChangeBattleWheel(self.CurrentWheelIndex, ServerSlotIdx, Content.UnitId)
end

function M:OnWheelSlotItemExchanged(FromContent, ToContent, FromSlotIdx, ToSlotIdx)
  if not FromSlotIdx or not ToSlotIdx then
    return
  end
  self.Parent:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ExchangeBattleWheel(self.CurrentWheelIndex, self:WheelSlotIdx2ServerSlotIdx(FromSlotIdx), self:WheelSlotIdx2ServerSlotIdx(ToSlotIdx))
end

function M:TryQuickUnequipContent(Content)
  if self.WheelContens[Content.UnitId] then
    self:OnWheelDragCancelled(Content, Content.SlotIdx)
  end
end

function M:OnWheelDragCancelled(Content, SlotIdx, SuccessCallback)
  if not Content then
    return
  end
  local CancelledSlotIdx = self:WheelSlotIdx2ServerSlotIdx(Content.SlotIdx, Content.WheelIdx)
  self.Parent:BlockAllUIInput(true)
  self.SuccessCallbackOnce = SuccessCallback
  local Avatar = GWorld:GetAvatar()
  Avatar:TakeOffBattleWheel(self.CurrentWheelIndex, CancelledSlotIdx)
end

function M:OnTakeOffAssisterWeapon(Ret, AssisterId, WeaponUuid)
  self:OnAssisterWeaponEquiped(Ret, AssisterId, WeaponUuid)
end

function M:OnWheelChanged(Ret)
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self.CurrentWheelIndex = GWorld:GetAvatar().WheelIndex
  self:HideItemDetail()
  self:ResetWheelSlotItems()
  self:ResetListView()
  for key, value in pairs(self.BattleWheelWidgets) do
    value:PlayInAnim()
  end
end

function M:OnWheelItemExchanged(Ret, WheelIndex, SlotId, TargetSlotId)
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    self:ExchangedItem(false, SlotId, TargetSlotId)
    return
  end
  self:ExchangedItem(true, SlotId, TargetSlotId)
  self:ResetWheelSlotItems()
  self:SetItemDetailContent(self.ItemtDetailContent)
end

function M:OnWheelItemInstalled(Ret, WheelIndex, SlotId, ResourceId)
  self.Parent:BlockAllUIInput(false)
  local Content = self.ContentMap[ResourceId]
  if not ErrorCode:Check(Ret) then
    self:InstallSlot(false, SlotId, Content)
    return
  end
  self:ResetWheelSlotItems()
  self:ResetListView()
  self:InstallSlot(true, SlotId, Content)
  if Content and Content == self.ItemtDetailContent then
    self:UpdateItemDetails(self.ItemtDetailContent)
  end
  if self.SuccessCallbackOnce then
    self.SuccessCallbackOnce()
  end
end

function M:OnWheelItemUninstalled(Ret, WheelIndex, SlotId)
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  local Content = self:GetSlotItem(SlotId)
  self:ResetWheelSlotItems()
  self:ResetListView()
  if Content and self.ItemtDetailContent == Content then
    self:SelectSlot(false, SlotId)
    self:UpdateItemDetails(self.ItemtDetailContent)
  end
  if self.SuccessCallbackOnce then
    self.SuccessCallbackOnce()
  end
end

function M:OnAssisterWeaponEquiped(Ret, AssisterId)
  self:ResetWheelSlotItems()
  self:ResetListView()
  if self.ItemtDetailContent then
    self:ResetContentButtonInfo(self.ItemtDetailContent)
    self:UpdateItemDetails(self.ItemtDetailContent)
  end
end

function M:OnClearWheelBtnClicked()
  UIManager(self):ShowCommonPopupUI(100175, {
    RightCallbackObj = self,
    RightCallbackFunction = function()
      local Avatar = GWorld:GetAvatar()
      self.Parent:BlockAllUIInput(true)
      Avatar:TakeOffAllBattleWheel(self.CurrentWheelIndex)
    end
  })
end

function M:OnWheelItemCleared(Ret, WheelIndex)
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetWheelSlotItems()
  self:ResetListView()
end

function M:TryOpenPreview(Content)
  local ItemData = {}
  ItemData.ItemType = Content.Type
  ItemData.TypeId = Content.Id
  ItemData.SinglePreview = true
  ItemData.HidePurchase = true
  UIManager(self):LoadUINew("SkinPreview", ItemData, self)
end

function M:Destruct()
  if IsValid(self.PhantomWeaponMenu) then
    self.PhantomWeaponMenu:Close()
  end
end

function M:OnScrollingByDrag(MyGeometry, PointerEvent)
  return IsValid(self._DragWidget) and self._DragWidget:IsVisible()
end

function M:PlayInAnim()
  for key, value in pairs(self.BattleWheelWidgets) do
    value:PlayInAnim()
  end
  self:StopAnimation(self.Auto_Out)
  self:PlayAnimation(self.Auto_In)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:PlayOutAnim()
  if IsValid(self.PhantomWeaponMenu) then
    self.PhantomWeaponMenu:Close()
  end
  for key, value in pairs(self.BattleWheelWidgets) do
    value:PlayOutAnim()
  end
  self:StopAnimation(self.Auto_In)
  self:PlayAnimation(self.Auto_Out)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnInAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnOutAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

AssembleComponents(M)
return M
