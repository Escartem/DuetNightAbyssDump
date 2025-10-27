require("UnLua")
local RewardModel = require("BluePrints.UI.WBP.Activity.Widget.FeinaEvent.WBP_Activity_FeinaEvent_Reward_Model")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = Class({
  "Blueprints.UI.BP_UIState_C"
})

function M:Init()
  self:SetText(GText("PermanenEventReward"))
  self:BindEventOnClicked(self, self.OpenReward)
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:AddInputMethodChangedListen()
  end
  if not ReddotManager.GetTreeNode("FeinaEventReward") then
    ReddotManager.AddNode("FeinaEventReward")
  end
  if not self.AddListenerFinish then
    self.AddListenerFinish = true
    ReddotManager.AddListener("FeinaEventReward", self, self.RefreshReddot)
  end
  self:RefreshReddot()
end

function M:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  if not CacheDetail then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    local IsEmpty = true
    for _, __ in pairs(CacheDetail) do
      IsEmpty = false
      break
    end
    if not IsEmpty then
      self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
      ActivityReddotHelper.TrySubReddotCount(ActivityUtils, CommonConst.FeinaEventId, "Red")
    end
  end
end

function M:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
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

function M:Destruct()
  self:RemoveInputMethodChangedListen()
  self.Super.Destruct(self)
end

function M:SetText(Text)
  self.Text_Reward:SetText(Text)
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:OnBtnHovered()
  self.IsHovering = true
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Normal)
  else
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
  end
end

function M:OnBtnClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/gift_entrance_btn_click", nil, nil)
  if self.Obj and self.Func then
    if self.Params then
      self.Func(self.Obj, table.unpack(self.Params))
    else
      self.Func(self.Obj)
    end
  end
end

function M:OpenReward()
  RewardModel:OpenReward(self)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self:InitGamepadView()
  end
  self.CurInputDeviceType = CurInputDevice
end

function M:InitKeyBoardView()
  self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitGamepadView()
  self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:HandleKeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    IsEventHandled = true
    self:OnBtnClicked()
  end
  return IsEventHandled
end

function M:OnUpdateSubUIViewStyle(IsEnter)
  if IsEnter then
    self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
