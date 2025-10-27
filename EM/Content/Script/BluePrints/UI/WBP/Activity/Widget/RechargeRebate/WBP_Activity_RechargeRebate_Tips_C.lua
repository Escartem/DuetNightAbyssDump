require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
end

function M:Destruct()
  self:UnBindInputMethodChangedDelegate()
  AudioManager(self):SetEventSoundParam(self, "RechargeTipOpen", {ToEnd = 1})
  self.Super.Destruct(self)
end

function M:PlayFadeOut(IsRemoveFromParent)
  self:SetFocus(false)
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "RechargeTipOpen", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function M:PlayFadeIn(TipType)
  self:SetFocus(true)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/fanhuan_sub_panel_open", "RechargeTipOpen", nil)
  self.WS_Tips:SetActiveWidgetIndex(TipType)
  self.BtnClose:Init("Close", self, self.PlayFadeOut)
  if 0 == TipType then
    self:ShowPhoxeneType()
  else
    self:ShowMonthlyCardType()
  end
  self:RefreshUI()
end

function M:InitTips(TipType, ParentUI)
  self.ParentUI = ParentUI
  self.isPC = CommonUtils.GetDeviceTypeByPlatformName() == "PC"
  self.CurInputDevice = UIUtils.UtilsGetCurrentInputType()
  self.LastInputDevice = nil
  self.Key_Close:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_GameEvent_Close")
  })
  self.Key_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PlayFadeIn(TipType)
  self:BindInputMethodChangedDelegate()
end

function M:ShowPhoxeneType()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    self:PlayFadeOut()
    return
  end
  local RefundPhoxeneNum = Avatar.FeeRefund[1] and Avatar.FeeRefund[1].Phoxene or 0
  local ChargeFund = Avatar.TotalRechargeMoney or 0
  self.Text_RechargeTipsTitle:SetText(GText("FeeRefund_Phoxene"))
  self.Item_1:InitItem(false, "Coin1_Small", 1, ChargeFund, RefundPhoxeneNum)
  self.Item_2:InitItem(false, "Coin1_Mid", 2, ChargeFund, RefundPhoxeneNum)
  self.Item_3:InitItem(false, "Coin1_Large", 3, ChargeFund, RefundPhoxeneNum)
  local ProgressPercent = self.Item_1:GetProgress() + self.Item_2:GetProgress() + self.Item_3:GetProgress()
  self.Recharge_ProgressBar:SetPercent(ProgressPercent)
  self.CheckItem_1:InitCheckItem(1, ChargeFund)
  self.CheckItem_2:InitCheckItem(2, ChargeFund)
  self.CheckItem_3:InitCheckItem(3, ChargeFund)
  self.Text_RechargeDetailTitle:SetText(GText("Pay_Addup"))
  self.Text_RechargeDetailNum:SetText(ChargeFund)
  self.Text_RechargeBackDetailDesc:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Com_Cost:InitContent({
    ResourceId = 99,
    CostText = GText("FeeRefund_Addup"),
    Numerator = RefundPhoxeneNum,
    KeyIconName = "LS",
    Owner = self
  })
end

function M:ShowMonthlyCardType()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    self:Close()
    return
  end
  local DayNum = Avatar.FeeRefund[1] and Avatar.FeeRefund[1].MonthlyCard or 0
  local DetailStr = GText("FeeRefund_MonthlyCard_Tips")
  local RemainRechargeCard = math.max(0, 2 - DayNum)
  DetailStr = string.format(DetailStr, tostring(RemainRechargeCard))
  self.Text_MonthCardTipsDetailDesc:SetText(DetailStr)
  DayNum = DayNum * 30
  local TotalMonthlyCard = Avatar:GetMonthlyCardNumForRebate()
  self.Text_MonthCardTipsTitle:SetText(GText("FeeRefund_MonthlyCard"))
  self.Text_DayNumTitle_1:SetText(GText("FeeRefund_Addup_Tips"))
  local Num1, Num2 = math.modf(DayNum / 10)
  self.Text_DayNum_1:SetText(Num1)
  local Num3, _ = math.modf(Num2 * 10)
  self.Text_DayNum_2:SetText(Num3)
  self.Text_DayNumTitle:SetText(GText("UI_GameEvent_TimeRemain_Day"))
  self.Text_MonthCardTipsDetailNum:SetText(GText("FeeRefund_MonthlyCard_Addup") .. TotalMonthlyCard)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:PlayFadeOut()
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.OpenCostTip then
      self.OpenCostTip = nil
      self.Com_Cost:InActivate()
    else
      self:PlayFadeOut()
    end
  end
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    self.Com_Cost:Activate()
    self.OpenCostTip = true
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function M:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function M:OnInputMethodChanged(CurInputDevice, CurGamepadName)
  self.CurInputDevice = CurInputDevice
  self:RefreshUI()
end

function M:RefreshUI()
  if not self.isPC or self.LastInputDevice == self.CurInputDevice then
    return
  end
  self.LastInputDevice = self.CurInputDevice
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Key_Close:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
