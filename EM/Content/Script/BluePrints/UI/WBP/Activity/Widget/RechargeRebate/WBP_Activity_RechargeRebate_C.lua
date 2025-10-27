require("UnLua")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.CurActivityId = nil
  self.ParentTabId = nil
  self.ActivityConfigData = nil
  self.UpdateEndTimeTimer = nil
  self.TipPage = nil
end

function M:Destruct()
  self.CurActivityId = nil
  self.ParentTabId = nil
  self.ActivityConfigData = nil
  self:RemoveTimer(self.UpdateEndTimeTimer)
  self.UpdateEndTimeTimer = nil
  if self.TipPage then
    self.TipPage:PlayFadeOut(true)
  end
  self:UnBindInputMethodChangedDelegate()
end

function M:GetPageName()
  return DataMgr.EventTab[self.ParentTabId].EventTabName
end

function M:GetActivityId()
  return self.CurActivityId
end

function M:GetParentTabId()
  return self.ParentTabId
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.CurActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.isPC = CommonUtils.GetDeviceTypeByPlatformName() == "PC"
  self.CurInputDevice = UIUtils.UtilsGetCurrentInputType()
  self.LastInputDevice = nil
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  self.ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityEndTime = self.ActivityConfigData.EventEndTime and self.ActivityConfigData.EventEndTime or self.ActivityConfigData.PermanenEventTime
  self:InitEndTime()
  self:InitTitle()
  self:InitItemRelate()
  self:InitQATip()
  self:RefreshUI()
  self:BindInputMethodChangedDelegate()
end

function M:UpdatePage(OperateSrc)
  if OperateSrc == ActivityCommon.AllUpdateTag.ActivityTab then
    self:RefreshUI()
  end
end

function M:InitEndTime()
  if self.Com_Time then
    ActivityUtils.RefreshLeftTime(self, self.Com_Time)
    self.UpdateEndTimeTimer = self:AddTimer(1.0, ActivityUtils.RefreshLeftTime, true, 0, "RefreshLeftTime", true, self.Com_Time)
  end
end

function M:InitTitle()
  local PageMain
  PageMain = UIManager(self):CreateWidget(self.ActivityConfigData.EventNameBPPath)
  if nil == PageMain then
    return
  end
  self.Group_Title:AddChildToOverlay(PageMain)
  PageMain.Text_Title:SetText(GText(self.ActivityConfigData.EventName))
  PageMain.Text_SubTitle:SetText(GText(self.ActivityConfigData.EventSName))
end

function M:InitItemRelate()
  self.Text_RechargeTitle_1:SetText(GText("FeeRefund_Phoxene"))
  self.Text_RechargeTitle_2:SetText(GText("FeeRefund_MonthlyCard"))
  self.DetailItem_1:InitItem(true, "Phoxene")
  self.DetailItem_2:InitItem(true, "MonthlyCard")
  self.Btn_RechargeRebate_1:InitBtn(GText("FeeRefund_Detail_Phoxene"), "X", self, self.ShowPhoxeneDetail)
  self.Btn_RechargeRebate_2:InitBtn(GText("FeeRefund_Detail_MonthlyCard"), "Y", self, self.ShowMonthlyCardDetail)
end

function M:InitQATip()
  self.Text_Qa:SetText(GText("UI_Common_Rule"))
  self.Com_BtnQa:Init({OwnerWidget = self, PopupId = 100163})
  if self.isPC then
    self.Key_Qa:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          Text = nil,
          ImgShortPath = "RS"
        }
      }
    })
  end
end

function M:GetPageConfigData()
  return self.ActivityConfigData
end

function M:ShowPage(IsNeedPlayInAnim)
  if IsNeedPlayInAnim then
    self:PlayFadeIn()
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
  local TitleWidget = self.Group_Title:GetChildAt(0)
  if TitleWidget.In ~= nil then
    TitleWidget:PlayAnimationForward(TitleWidget.In)
  end
end

function M:HidePage()
  if IsNeedPlayOutAnim then
    self:PlayFadeOut()
  end
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:PlayFadeOut(IsRemoveFromParent)
  self:PlayAnimation(self.Out)
  if IsRemoveFromParent then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.RemoveFromParent
    })
  end
end

function M:IsPageInVisible()
  return self:IsVisible()
end

function M:ShowPhoxeneDetail()
  local TipPage = UIManager(self):GetUIObj("RechargeRebateTips")
  if not TipPage then
    TipPage = UIManager(self):LoadUINew("RechargeRebateTips")
    TipPage:InitTips(0, self)
  else
    TipPage:PlayFadeIn(0)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_btn_click_normal", nil, nil)
end

function M:ShowMonthlyCardDetail()
  local TipPage = UIManager(self):GetUIObj("RechargeRebateTips")
  if not TipPage then
    TipPage = UIManager(self):LoadUINew("RechargeRebateTips")
    TipPage:InitTips(1, self)
  else
    TipPage:PlayFadeIn(1)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_btn_click_normal", nil, nil)
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
    self.WS_Qa:SetActiveWidgetIndex(1)
  else
    self.WS_Qa:SetActiveWidgetIndex(0)
  end
end

function M:OnGamePadDown(InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self:ShowPhoxeneDetail()
    return true
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:ShowMonthlyCardDetail()
    return true
  end
  if InKeyName == UIConst.GamePadKey.RightThumb then
    self.Com_BtnQa.Btn_Click.OnClicked:Broadcast()
    return true
  end
  return false
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:OnGamePadButtonDown(InKeyName)
  return false
end

return M
