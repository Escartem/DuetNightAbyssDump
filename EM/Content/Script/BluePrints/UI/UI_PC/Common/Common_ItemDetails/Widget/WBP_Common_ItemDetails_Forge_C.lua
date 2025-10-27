require("UnLua")
local WBP_Common_ItemDetails_Forge_C = Class("BluePrints.UI.BP_UIState_C")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local TimeUtils = require("Utils.TimeUtils")
local ForgeUtils = require("Blueprints.UI.Forge.ForgeUtils")

function WBP_Common_ItemDetails_Forge_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Common_ItemDetails_Forge_C:InitGamepadView()
  self.BtnReward:SetDefaultGamePadImg("A")
  self.BtnReward:SetGamePadIconVisible(true)
  self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Common_ItemDetails_Forge_C:InitKeyboardView()
  self.BtnReward:SetGamePadIconVisible(false)
  self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Common_ItemDetails_Forge_C:InitView(DraftInfo, Controller, OnDetailsViewBtnStartClickedCallback, OnDetailsViewBtnCancelClickedCallback)
  self.WidgetCurrentState = DraftInfo.State
  self.Controller = Controller
  self.CurrentDraftInfo = DraftInfo
  self.OnDetailsViewBtnStartClickedCallback = OnDetailsViewBtnStartClickedCallback
  self.OnDetailsViewBtnCancelClickedCallback = OnDetailsViewBtnCancelClickedCallback
  self.Text_ForgingComplete:SetText(GText("UI_FORGING_COMPLETED"))
  if DraftInfo.CostTime <= 0 then
    self.Text_RequiredTime:SetText("-")
  else
    self.Text_RequiredTime:SetText(string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), math.floor(DraftInfo.CostTime / 60)))
  end
  local AccelerateCostType = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  self.Cost_Ticket:InitContent({
    ResourceId = AccelerateCostType,
    Numerator = 0,
    Denominator = 0,
    bShowDenominator = true
  })
  if DraftInfo.State == ForgeConst.DraftState.NotStarted then
    self:InitNotStartedView(DraftInfo)
  elseif DraftInfo.State == ForgeConst.DraftState.InProgress then
    self:SwitchToProgressView(true)
    self:InitInProgressView(DraftInfo)
  elseif DraftInfo.State == ForgeConst.DraftState.Complete then
    self:SwitchToCompleteView(true)
    self:InitCompleteView(DraftInfo)
  end
  self.BtnStart:UnBindEventOnClickedByObj(self)
  self.BtnStart:BindEventOnClicked(self, self.OnBtnStartClicked)
  self.BtnReward:UnBindEventOnClickedByObj(self)
  self.BtnReward:BindEventOnClicked(self, self.OnBtnStartClicked)
  self.Btn_Cancel:UnBindEventOnClickedByObj(self)
  self.Btn_Cancel:BindEventOnClicked(self, self.OnBtnCancelClicked)
  self.Key_Controller_Cancel:CreateGamepadKey(UIConst.GamePadImgKey.FaceButtonLeft)
  self.Cost:SwitchToPC()
  self.Cost_Ticket:SwitchToPC()
  local GameInputSubsystem = UIManager(self):GetGameInputModeSubsystem()
  if GameInputSubsystem then
    GameInputSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self:RefreshOpInfoByInputDevice()
end

function WBP_Common_ItemDetails_Forge_C:RefreshView(DraftInfo)
  self.CurrentDraftInfo = DraftInfo
  if DraftInfo.State == ForgeConst.DraftState.NotStarted then
    if self.WidgetCurrentState ~= DraftInfo.State then
      self:SwitchToMaterialView(false)
      self:InitNotStartedView(DraftInfo)
    end
  elseif DraftInfo.State == ForgeConst.DraftState.InProgress then
    if self.WidgetCurrentState ~= DraftInfo.State then
      self:InitInProgressView(DraftInfo)
      self:SwitchToProgressView(false)
    else
      self:UpdatePercent()
    end
  elseif DraftInfo.State == ForgeConst.DraftState.Complete and self.WidgetCurrentState ~= DraftInfo.State then
    self:SwitchToCompleteView(false)
    self:InitCompleteView(DraftInfo, true)
  end
end

function WBP_Common_ItemDetails_Forge_C:SetCantForge()
  self:PlayAnimation(self.DisCast)
  self.Switch_Type:SetActiveWidgetIndex(2)
  self.Text_NoPath:SetText(GText("UI_FORGING_CANTFORGE"))
end

function WBP_Common_ItemDetails_Forge_C:SetDraftNotEnough()
  self.Text_LackOfMaterial:SetText(GText("UI_FORGING_NODRAFT"))
  if 1 == self.Switch_Type:GetActiveWidgetIndex() then
    return
  end
  self:PlayAnimation(self.LimitedCast)
  self.Switch_Type:SetActiveWidgetIndex(1)
end

function WBP_Common_ItemDetails_Forge_C:ShowForgingPage()
  self.Switch_Type:SetActiveWidgetIndex(0)
end

function WBP_Common_ItemDetails_Forge_C:OnBtnStartClicked()
  if self.OnDetailsViewBtnStartClickedCallback then
    self.OnDetailsViewBtnStartClickedCallback(self.Controller)
  end
end

function WBP_Common_ItemDetails_Forge_C:OnBtnCancelClicked()
  if self.OnDetailsViewBtnCancelClickedCallback then
    self.OnDetailsViewBtnCancelClickedCallback(self.Controller)
  end
end

function WBP_Common_ItemDetails_Forge_C:InitNotStartedView(DraftInfo)
  self.WidgetCurrentState = ForgeConst.DraftState.NotStarted
  self:UpdateFoundry(DraftInfo.Id)
  if self.CurrentDraftInfo.CanProduce then
    self.BtnStart:SetText(GText("UI_FORGING_START"))
    self.Switch_Btn:SetActiveWidgetIndex(0)
    self.Switch_Material:SetActiveWidgetIndex(0)
    self.Cost:SetIsEnough(true)
    self:PlayAnimation(self.CastNormal)
    self.Switch_Type:SetActiveWidgetIndex(0)
  elseif not self.CurrentDraftInfo.IsFoundryEnough and self.CurrentDraftInfo.IsResourceEnough then
    self.Switch_Btn:SetActiveWidgetIndex(2)
    self.Text_Tips_MaterialNotEnough:SetText(GText("UI_FORGING_CASH_NOTENOUGH"))
    self.Cost:SetIsEnough(false)
    self:PlayAnimation(self.CastNormal)
    self.Switch_Type:SetActiveWidgetIndex(0)
  else
    self:PlayAnimation(self.LimitedCast)
    self.Switch_Type:SetActiveWidgetIndex(1)
    self.Cost:SetIsEnough(true)
    self.Text_LackOfMaterial:SetText(GText("UI_FORGING_MATERIAL_NOTENOUGH"))
  end
  self.VX_glowfire:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Common_ItemDetails_Forge_C:InitInProgressView(DraftInfo)
  self.WidgetCurrentState = ForgeConst.DraftState.InProgress
  self.Switch_Btn:SetActiveWidgetIndex(0)
  self.Switch_Material:SetActiveWidgetIndex(1)
  self.BtnStart:SetText(GText("UI_COMMONPOP_TITLE_100018"))
  self.BtnStart:SetVisibility(UE4.ESlateVisibility.Visible)
  self.VX_glowfire:ActivateSystem(true)
  self.VX_glowfire:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:UpdateFoundry(DraftInfo.Id)
  self:UpdatePercent()
end

function WBP_Common_ItemDetails_Forge_C:InitCompleteView(DraftInfo, bShouldPlayCompleteAnim)
  self.WidgetCurrentState = ForgeConst.DraftState.Complete
  self.Bar_Progress:SetPercent(1.0)
  self.BtnStart:SetText(GText("UI_Achievement_GetReward"))
  self.BtnReward:SetText(GText("UI_Achievement_GetReward"))
  self.VX_glowfire:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:UpdateFoundry(self.CurrentDraftInfo.Id)
  if bShouldPlayCompleteAnim then
    AudioManager(self):PlayUISound(self, "event:/ui/common/produce_complete", nil, nil)
  end
end

function WBP_Common_ItemDetails_Forge_C:UpdateFoundry(DraftId)
  if self.WidgetCurrentState == ForgeConst.DraftState.NotStarted then
    local DraftInfo = DataMgr.Draft[DraftId]
    if DraftInfo.FoundryCost then
      self.Cost:SetVisibility(UE4.ESlateVisibility.Visible)
      for FoundryId, CostNum in pairs(DraftInfo.FoundryCost) do
        local FoundryData = DataMgr.Resource[FoundryId]
        if FoundryData then
          self.Cost:InitContent({ResourceId = FoundryId, Numerator = CostNum})
          break
        end
      end
      self.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.CostTimePanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Cost:SetVisibility(UE4.ESlateVisibility.Visible)
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

function WBP_Common_ItemDetails_Forge_C:UpdateAccerateTickets()
  local AccelerateCostType = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  local FoundryData = DataMgr.Resource[AccelerateCostType]
  if FoundryData then
    local Cost = self.Controller.ForgeModel:GetAccerateCost(self.CurrentDraftInfo.Id)
    local Avatar = GWorld:GetAvatar()
    local Count = Avatar:GetResourceNum(AccelerateCostType)
    self.Cost_Ticket:SetCost(Cost, Count)
    if Cost > Count then
      self.Switch_Btn:SetActiveWidgetIndex(2)
      self.Text_Tips_MaterialNotEnough:SetText(GText("UI_FORGING_ACCELERATE_NOTENOUGH"))
    else
      self.Switch_Btn:SetActiveWidgetIndex(0)
    end
  end
end

function WBP_Common_ItemDetails_Forge_C:SwitchToMaterialView(IsImmediately)
  if IsImmediately then
    self:PlayAnimation(self.CastNormal, self.CastNormal:GetEndTime())
  else
    self:PlayAnimation(self.CastNormal)
  end
  self.Switch_Type:SetActiveWidgetIndex(0)
  if UIUtils.IsGamepadInput() then
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Common_ItemDetails_Forge_C:SwitchToProgressView(IsImmediately)
  if IsImmediately then
    self:PlayAnimation(self.CastProgress, self.CastProgress:GetEndTime() - 0.05)
  else
    self:PlayAnimation(self.CastProgress)
  end
  self.Switch_Type:SetActiveWidgetIndex(0)
  if UIUtils.IsGamepadInput() then
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Common_ItemDetails_Forge_C:SwitchToCompleteView(IsImmediately)
  if IsImmediately then
    self:PlayAnimation(self.CastComplete, self.CastComplete:GetEndTime() - 0.05)
  else
    self:PlayAnimation(self.CastComplete)
  end
  self.Switch_Type:SetActiveWidgetIndex(0)
  if UIUtils.IsGamepadInput() then
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Common_ItemDetails_Forge_C:UpdatePercent()
  if self.WidgetCurrentState ~= ForgeConst.DraftState.InProgress then
    return
  end
  local CurrentTime = TimeUtils.NowTime()
  local DurationTime = CurrentTime - self.CurrentDraftInfo.StartTime
  local RestTime = self.CurrentDraftInfo.TotalTime - DurationTime
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
    self.Bar_Progress:SetPercent(DurationPercent)
    self:UpdateProgressVXPosition()
  else
    self.LastTime:SetTimeText("")
  end
  self:UpdateAccerateTickets()
end

function WBP_Common_ItemDetails_Forge_C:UpdateProgressVXPosition()
  local GlowfireCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.VX_glowfire)
  local ScrollBarSize = USlateBlueprintLibrary.GetLocalSize(self.Bar_Progress:GetCachedGeometry())
  GlowfireCanvasSlot:SetPosition(FVector2D(ScrollBarSize.X * self.Bar_Progress.Percent, 0))
end

function WBP_Common_ItemDetails_Forge_C:SetGamepadButtonKeyVisible(bVisible)
  if bVisible then
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Common_ItemDetails_Forge_C
