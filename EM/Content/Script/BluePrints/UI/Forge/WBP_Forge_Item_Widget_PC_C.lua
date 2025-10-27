require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ForgeUtils = require("Blueprints.UI.Forge.ForgeUtils")
local TimeUtils = require("Utils.TimeUtils")
local WBP_ForgeItemWidget = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_ForgeItemWidget:Construct()
  self.GameInputSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self.GameInputSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
end

function WBP_ForgeItemWidget:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self.EventStartProduce = nil
  self.EventShowPath = nil
end

function WBP_ForgeItemWidget:OnMouseEnter(MyGeometry, MouseEvent)
end

function WBP_ForgeItemWidget:OnMouseLeave(MyGeometry, MouseEvent)
end

function WBP_ForgeItemWidget:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonDown then
    self.BtnStart:OnBtnPressed()
    self.BtnStart:OnBtnClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  elseif InKeyName == Const.GamepadFaceButtonLeft and self.Content.State == ForgeConst.DraftState.InProgress then
    self:OnBtnCancelClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_ForgeItemWidget:SetGamepadFocus(bFocus)
  if not UIUtils.IsGamepadInput() then
    return
  end
  if bFocus then
    self:PlayAnimation(self.Hover)
    self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.BtnReward:SetGamePadIconVisible(true)
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.BtnStart.WS_Type:SetActiveWidgetIndex(1)
  else
    self:PlayAnimation(self.UnHover)
    self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    self.BtnReward:SetGamePadIconVisible(false)
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.BtnStart.WS_Type:SetActiveWidgetIndex(0)
  end
end

function WBP_ForgeItemWidget:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad and self.Content.OnReceiveFocus then
    self.Content.OnReceiveFocus(self)
  end
  return UIUtils.Handle
end

function WBP_ForgeItemWidget:OnFocusLost(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad and self.Content.OnLostFocus then
    self.Content.OnLostFocus(self)
  end
end

function WBP_ForgeItemWidget:RefreshOpInfoByInputDevice()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    self:InitMobileView()
  else
    self:InitKeyboardView()
  end
end

function WBP_ForgeItemWidget:EnableGamepadBlock(Value)
  if not self.BtnGamepadBlock then
    return
  end
  if Value then
    self.BtnGamepadBlock:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.BtnGamepadBlock:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeItemWidget:InitGamepadView()
  self.Cost_Resource:SwitchToPC()
  self.Cost_Ticket:SwitchToPC()
  self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  self:EnableGamepadBlock(true)
  self.Key_Controller_Cancel:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft
      }
    }
  })
  self.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.BtnReward:SetDefaultGamePadImg("A")
end

function WBP_ForgeItemWidget:InitKeyboardView()
  self:PlayAnimation(self.Normal)
  self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  self:EnableGamepadBlock(false)
  self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Visible)
  self.BtnStart.WS_Type:SetActiveWidgetIndex(0)
  self.BtnReward:SetDefaultGamePadImg("A")
end

function WBP_ForgeItemWidget:InitMobileView()
  self:PlayAnimation(self.Normal)
  self.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Visible)
  self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_ForgeItemWidget:EnterShowItemView()
  self.ItemWidget:SetFocus()
  self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  self:EnableGamepadBlock(false)
end

function WBP_ForgeItemWidget:LeaveShowItemView()
  self.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:EnableGamepadBlock(true)
end

function WBP_ForgeItemWidget:SetHovered(IsSelected)
  if IsSelected then
    self:PlayAnimation(self.State_Hover)
    self.Hover_HighLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Hover_HighLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeItemWidget:OnBtnStartClicked()
  if self.WidgetCurrentState == ForgeConst.DraftState.NotStarted and (not self.Content.IsFoundryEnough or not self.Content.IsResourceEnough) then
    if self.EventShowPath then
      self.EventShowPath()
    else
      DebugPrint("Tianyi@ EventShowPath not bind")
    end
  elseif self.EventStartProduce then
    self.EventStartProduce()
  else
    DebugPrint("Tianyi@ EventStartProduce not bind")
  end
end

function WBP_ForgeItemWidget:UpdateSetTargetBtn(Value)
  self.Btn_SetTarget:SetChecked(Value)
end

function WBP_ForgeItemWidget:OnDraftSetTargetChanged(bIsSelected)
  DebugPrint("Tianyi@ OnSetTarget: " .. tostring(bIsSelected) .. "DraftId = " .. self.Content.Id)
  if bIsSelected then
    local TargetDraftsCount = self.Content.GetDataModel():GetTargetDraftCount()
    local MaxTargetDraftCount = DataMgr.GlobalConstant.ForgeTargetMaxNum.ConstantValue or ForgeConst.DefaultForgeTargetMaxNum
    if TargetDraftsCount >= MaxTargetDraftCount then
      UIManager(self):ShowUITip("CommonToastMain", "\231\155\174\230\160\135\232\174\190\232\174\161\231\168\191\230\149\176\233\135\143\229\183\178\232\190\190\229\136\176\228\184\138\233\153\144")
      self.Btn_SetTarget:SetCheckedNoNotify(false)
      return
    end
    self.Content.GetDataModel():AddDraftToTarget(self.Content.Id)
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_FORGING_TARGET"))
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  else
    self.Content.GetDataModel():RemoveDraftFromTarget(self.Content.Id)
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_FORGING_CANCELTARGET"))
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
  end
  self.Content.IsSetTarget = bIsSelected
end

function WBP_ForgeItemWidget:OnBtnCancelClicked()
  if self.EventCancelProduce then
    self.EventCancelProduce()
  else
    DebugPrint("Tianyi@ EventCancelProduce not bind")
  end
end

function WBP_ForgeItemWidget:InitializeView()
  self:RefreshOpInfoByInputDevice()
  if self.Content.IsEmptyWidget then
    self.Switch:SetActiveWidgetIndex(1)
    return
  else
    self.Switch:SetActiveWidgetIndex(0)
  end
  self:BindUIEvents()
  self.WidgetCurrentState = self.Content.State
  local DraftInfo = DataMgr.Draft[self.Content.Id]
  local Content = ForgeUtils:ConstructItemContentFromDraftId(self.Content.Id)
  Content.IsShowDetails = true
  Content.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChanged
  }
  Content.HandleMouseDown = true
  Content.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = self.OnItemWidgetClicked
  }
  self.ItemWidget:Init(Content)
  self.ItemWidget:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Text_ItemName:SetText(Content.ProductName)
  if DraftInfo.Time <= 0 then
    self.Text_RequiredTime:SetText("-")
  else
    self.Text_RequiredTime:SetText(string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), DraftInfo.Time))
  end
  self:UpdateFoundry(self.Content.Id)
  local AccelerateCostType = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  self.Cost_Ticket:InitContent({
    ResourceId = AccelerateCostType,
    Numerator = 0,
    Denominator = 0,
    bShowDenominator = true,
    HandleMouseDown = true
  })
  self.Text_BluePrintsNumName:SetText(GText("UI_FORGING_BLUEPRINT"))
  self.Text_ItemCurrentOwned:SetText(GText("UI_FORGING_CURRENT"))
  self:RefreshNum()
  if self.Content.State == ForgeConst.DraftState.NotStarted then
    self:SwitchToMaterialView(true)
    self:InitNotStartedView()
    self.Text_Complete:SetRenderOpacity(0)
    self.Text_BatchFinish:SetRenderOpacity(0)
  elseif self.Content.State == ForgeConst.DraftState.InProgress then
    self:SwitchToProgressView(true)
    self:InitInProgressView()
    self.Text_Complete:SetRenderOpacity(0)
    self.Text_BatchFinish:SetRenderOpacity(0)
  elseif self.Content.State == ForgeConst.DraftState.Complete then
    self:SwitchToProgressView(true)
    self:InitCompleteView(false)
    self.Text_Complete:SetRenderOpacity(1)
    self.Text_BatchFinish:SetRenderOpacity(1)
  end
  self.Text_Complete:SetText(GText("UI_FORGING_COMPLETED"))
  self:SetHovered(false)
  self.Panel:SetRenderOpacity(0)
  self:PlayAnimation(self.In)
end

function WBP_ForgeItemWidget:BindUIEvents()
  if self.HasBindUIEvents then
    return
  end
  self.BtnStart:UnBindEventOnClickedByObj(self)
  self.BtnStart:BindEventOnClicked(self, self.OnBtnStartClicked)
  self.BtnReward:UnBindEventOnClickedByObj(self)
  self.BtnReward:BindEventOnClicked(self, self.OnBtnStartClicked)
  self.Btn_Cancel:UnBindEventOnClickedByObj(self)
  self.Btn_Cancel:BindEventOnClicked(self, self.OnBtnCancelClicked)
  self.Btn_SetTarget.OnCheckStateChanged:Add(self, self.OnDraftSetTargetChanged)
  self.HasBindUIEvents = true
end

function WBP_ForgeItemWidget:InitNotStartedView()
  self.WidgetCurrentState = ForgeConst.DraftState.NotStarted
  self.Switch_Btn:SetActiveWidgetIndex(0)
  self.ProduceProgress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.MaterialNumber:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Complete:SetRenderOpacity(0)
  self.Text_BatchFinish:SetRenderOpacity(0)
  self.Mark:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_SetTarget:SetCheckedNoNotify(self.Content.IsSetTarget)
  self.Switch_Show:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Switch_Show:SetActiveWidgetIndex(0)
  self:UpdateFoundry(self.Content.Id)
  self:UpdateMaterial()
end

function WBP_ForgeItemWidget:InitInProgressView()
  self.WidgetCurrentState = ForgeConst.DraftState.InProgress
  local DraftInfo = DataMgr.Draft[self.Content.Id]
  self.Switch_Btn:SetActiveWidgetIndex(0)
  self.BtnStart:SetText(GText("UI_COMMONPOP_TITLE_100018"))
  self.BtnStart:SetVisibility(UE4.ESlateVisibility.Visible)
  self.LastTime:SetVisibility(UE4.ESlateVisibility.Visible)
  self.MaterialNumber:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.ProduceProgress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Complete:SetRenderOpacity(0)
  self.Text_BatchFinish:SetRenderOpacity(0)
  self.Switch_Show:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Switch_Show:SetActiveWidgetIndex(1)
  self.VX_glowfire:ActivateSystem(true)
  self.Mark:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_SetTarget:SetCheckedNoNotify(self.Content.IsSetTarget)
  self:UpdateFoundry(self.Content.Id)
  self:UpdatePercent()
end

function WBP_ForgeItemWidget:InitCompleteView(bShouldPlayCompleteAnim)
  self.WidgetCurrentState = ForgeConst.DraftState.Complete
  self.ProduceProgress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Bar_Produce:SetPercent(1.0)
  self.LastTime:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Switch_Show:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Mark:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_SetTarget:SetCheckedNoNotify(self.Content.IsSetTarget)
  self.BtnStart:SetText(GText("UI_Achievement_GetReward"))
  self.BtnReward:SetText(GText("UI_Achievement_GetReward"))
  self.Switch_Btn:SetActiveWidgetIndex(1)
  local Str = string.format("(<Highlight>%d</>/%d)", self.Content.DraftCompleteNum, self.Content.DraftCompleteNum)
  self.Text_BatchFinish:SetText(Str)
  self:PlayAnimation(self.BtnShow_Complete)
  if bShouldPlayCompleteAnim then
    self:PlayAnimation(self.Change_Complete)
    AudioManager(self):PlayUISound(self, "event:/ui/common/produce_complete", nil, nil)
  else
    self:SetAnimationCurrentTime(self.Change_Complete, 2.0)
  end
  self:UpdateFoundry(self.Content.Id)
end

function WBP_ForgeItemWidget:RefreshNum()
  local DraftInfo = DataMgr.Draft[self.Content.Id]
  self.Text_BluePrintsNumName:SetText(GText("UI_FORGING_BLUEPRINT"))
  if DraftInfo.IsInfinity then
    self.Text_BluePrintsNum:SetText("<Img id=\"Infinity\" height=\"36\" width=\"28\"/>")
  else
    self.Text_BluePrintsNum:SetText(tostring(FormatNumber(self.Content.Count, true)))
  end
  self.Text_ItemOwnedNum:SetText(tostring(FormatNumber(self.Content.ProductCount, true)))
  if self.Content.IsNotSeen then
    self.ItemWidget:SetRedDot(UIConst.RedDotType.NewRedDot)
  else
    self.ItemWidget:SetRedDot(nil)
  end
end

function WBP_ForgeItemWidget:RefreshView()
  self:RefreshNum()
  if self.Content.State == ForgeConst.DraftState.NotStarted then
    if self.WidgetCurrentState ~= self.Content.State then
      self:InitNotStartedView()
      self:SwitchToMaterialView(false)
    else
      self:UpdateMaterial()
    end
  elseif self.Content.State == ForgeConst.DraftState.InProgress then
    if self.WidgetCurrentState ~= self.Content.State then
      self:InitInProgressView()
      self:SwitchToProgressView(false)
    else
      self:UpdatePercent()
    end
  elseif self.Content.State == ForgeConst.DraftState.Complete and self.WidgetCurrentState ~= self.Content.State then
    self:SwitchToProgressView(true)
    self:InitCompleteView(true)
  end
end

function WBP_ForgeItemWidget:UpdateMaterial()
  if self.WidgetCurrentState ~= ForgeConst.DraftState.NotStarted then
    return
  end
  for Index = 1, 4 do
    local Widget = self.Material:GetChildAt(Index - 1)
    if not Widget then
      Widget = self:CreateWidgetNew("ComItemUniversalM")
      self.Material:AddChild(Widget)
    end
    local ResInfo = self.Content.ResourcesNeed[Index]
    if ResInfo then
      local ResType = ResInfo.Type or "Resource"
      local ResId = ResInfo.ResId
      local ResourceData = DataMgr.Resource[ResId]
      local ResRarity = ItemUtils.GetItemRarity(ResId, ResType)
      local ResourceIcon = ItemUtils.GetItemIconPath(ResId, ResType)
      Widget:Init({
        UIName = "ForgeMain",
        IsShowDetails = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        Id = ResId,
        ItemType = ResType,
        Rarity = ResRarity,
        Icon = ResourceIcon,
        Count = ResInfo.Have,
        NeedCount = ResInfo.Required,
        OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.OnMenuOpenChanged
        },
        HandleMouseDown = true
      })
      Widget:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      Widget:Init({Id = 0, HandleMouseDown = true})
      Widget:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
  end
  if not self.Content.IsFoundryEnough then
    self.Cost_Resource:SetIsEnough(false)
  else
    self.Cost_Resource:SetIsEnough(true)
  end
  self.BtnStart:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.Content.CanProduce then
    self.BtnStart:SetText(GText("UI_FORGING_START"))
    self.BtnStart:SetTextColor(self.BtnStart.Color_Forge)
    self.BtnStart.WS_Type:SetActiveWidgetIndex(0)
    self.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.BtnStart:SetText(GText("UI_FORGING_PATH"))
    self.BtnStart:SetTextColor(self.BtnStart.Color_Path)
    self.BtnStart.WS_Type:SetActiveWidgetIndex(1)
    self.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeItemWidget:OnMenuOpenChanged(IsOpen)
  if self.Content.OnMenuOpenChanged then
    self.Content.OnMenuOpenChanged(IsOpen)
  end
end

function WBP_ForgeItemWidget:UpdatePercent()
  if self.WidgetCurrentState ~= ForgeConst.DraftState.InProgress then
    return
  end
  local CurrentTime = TimeUtils.NowTime()
  local DurationTime = CurrentTime - self.Content.StartTime
  local RestTime = self.Content.TotalTime - DurationTime
  if RestTime > 0 then
    local DurationPercent = DurationTime / (DurationTime + RestTime)
    local Hour, Minute, Second = ForgeUtils:SecondsToHMS(RestTime)
    local TimeStr = string.format("%02d:%02d:%02d", Hour, Minute, Second)
    local RemainTimeDict = {}
    if Hour >= 1 then
      table.insert(RemainTimeDict, {TimeType = "Hour", TimeValue = Hour})
      table.insert(RemainTimeDict, {TimeType = "Min", TimeValue = Minute})
    else
      table.insert(RemainTimeDict, {TimeType = "Min", TimeValue = Minute})
      table.insert(RemainTimeDict, {TimeType = "Sec", TimeValue = Second})
    end
    self.LastTime:SetTimeText("", RemainTimeDict)
    self.Bar_Produce:SetPercent(DurationPercent)
    self:UpdateProgressVXPosition()
  end
  local Str = string.format("(<Highlight>%d</>/%d)", self.Content.DraftCompleteNum, self.Content.DraftDoingNum + self.Content.DraftCompleteNum)
  self.Text_BatchProduce:SetText(Str)
  self:UpdateAccerateTickets()
end

function WBP_ForgeItemWidget:UpdateAccerateTickets()
  local AccelerateCostType = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  local FoundryData = DataMgr.Resource[AccelerateCostType]
  if FoundryData then
    local Avatar = GWorld:GetAvatar()
    local Cost = self.Content.GetDataModel():GetAccerateCost(self.Content.Id)
    local Count = Avatar:GetResourceNum(AccelerateCostType)
    self.Cost_Ticket:SetCost(Cost, Count)
    if Cost > Count then
      self.Switch_Btn:SetActiveWidgetIndex(2)
      self.Text_Tips_MaterialNotEnough:SetText(GText("UI_FORGING_ACCELERATE_NOTENOUGH"))
    else
      self.Switch_Btn:SetActiveWidgetIndex(0)
      self.BtnStart.WS_Type:SetActiveWidgetIndex(0)
      self.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.BtnStart:SetTextColor(self.BtnStart.Color_Forge)
    end
  end
end

function WBP_ForgeItemWidget:UpdateFoundry(DraftId)
  if self.Content.State == ForgeConst.DraftState.NotStarted then
    local DraftInfo = DataMgr.Draft[DraftId]
    if DraftInfo.FoundryCost then
      self.Cost_Resource:SetVisibility(UE4.ESlateVisibility.Visible)
      for FoundryId, CostNum in pairs(DraftInfo.FoundryCost) do
        local FoundryData = DataMgr.Resource[FoundryId]
        if FoundryData then
          self.Cost_Resource:InitContent({
            ResourceId = FoundryId,
            Numerator = CostNum,
            HandleMouseDown = true,
            IsGamePadIconVisible = false
          })
          break
        end
      end
      self.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.CostTimePanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Cost_Resource:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif self.WidgetCurrentState == ForgeConst.DraftState.InProgress then
    self:UpdateAccerateTickets()
    self.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.CostTimePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.CostTimePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ForgeItemWidget:SwitchToMaterialView(IsImmediately)
  self:StopAllAnimations()
  if IsImmediately then
    self.Material:SetRenderOpacity(1)
    self.ProduceProgress:SetRenderOpacity(0)
  else
    self:PlayAnimation(self.Change_ProgressBar, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
  end
  self.Material:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_ForgeItemWidget:SwitchToProgressView(IsImmediately)
  self:StopAllAnimations()
  if IsImmediately then
    self.Material:SetRenderOpacity(0)
    self.ProduceProgress:SetRenderOpacity(1)
  else
    self:PlayAnimation(self.Change_ProgressBar, 0, 1)
  end
  self.Material:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end

function WBP_ForgeItemWidget:OnItemWidgetClicked()
  if self.Content.OnItemWidgetClicked then
    self.Content.OnItemWidgetClicked(self)
  end
end

function WBP_ForgeItemWidget:UpdateProgressVXPosition()
  local GlowfireCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.VX_glowfire)
  local ScrollBarSize = USlateBlueprintLibrary.GetLocalSize(self.Bar_Produce:GetCachedGeometry())
  GlowfireCanvasSlot:SetPosition(FVector2D(ScrollBarSize.X * self.Bar_Produce.Percent, 0))
end

function WBP_ForgeItemWidget:PlayScanlineAnim()
  self:PlayAnimation(self.Scanline)
end

return WBP_ForgeItemWidget
