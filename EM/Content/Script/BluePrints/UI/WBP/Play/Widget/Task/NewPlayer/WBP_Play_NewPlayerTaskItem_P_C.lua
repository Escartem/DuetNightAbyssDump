require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.Play.Widget.Task.NewPlayer.NewPlayerTaskItemView"
}

function M:Construct()
  self:InitItemView()
end

function M:OnListItemObjectSet(Content)
  Content.OwnerPanel = self
  self.Parent = Content.Parent
  self.QuestId = Content.QuestId
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  self:AddInputMethodChangedListen()
  local PlayerAvatar = GWorld:GetAvatar()
  local TaskConfigData = DataMgr.StarterQuestDetail[self.QuestId]
  if not PlayerAvatar or not TaskConfigData then
    self:RefreshContentView(true)
  else
    local TaskServerData = PlayerAvatar.StarterQuests[self.QuestId]
    self:RefreshContentView(false, Content, TaskConfigData, TaskServerData)
    self:UpdateUIStyleInPlatform(true)
  end
end

function M:ReceiveReward()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  PlayerAvatar:StarterQuestGetReward(self.QuestId)
end

function M:GoToSystem()
  local TaskConfigData = DataMgr.StarterQuestDetail[self.QuestId]
  PageJumpUtils:JumpToTargetPageByJumpId(TaskConfigData.JumpUIId)
end

function M:SwitchToKeyAndMouseAnimation(IsWait, IsSwitch)
  if not IsSwitch or IsWait and self:IsAnimationPlaying(self.In) then
    return
  end
  local IsTaskFinish = self:IsPlayerTaskFinish()
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
  self:StopAllAnimations()
  self:PlayAnimation(IsTaskFinish and self.Recived or self.Normal)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if self.Item_Reward_1:HasAnyFocus() or self.Item_Reward_2:HasAnyFocus() then
    self:UpdatKeyDisplay("RewardWidget")
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse or self.Parent.SelectItem ~= self then
    self:SwitchToKeyAndMouseAnimation(true, IsUseKeyAndMouse)
    self:UpdateUIStyleInPlatform(true)
  else
    self:OnSelect()
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if self.Mobile then
    return
  end
  if not IsUseKeyAndMouse and self:HasFocusedDescendants() then
    IsUseKeyAndMouse = true
  end
  if IsUseKeyAndMouse then
    self.Key_Controller_Item:SetVisibility(ESlateVisibility.Hidden)
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Goto:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Key_Controller_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_Controller_Item:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
    self.Btn_Goto:SetGamePadImg("A")
    self.Btn_Goto:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Reward:SetGamePadImg("A")
    self.Btn_Reward:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnSelect()
  if not self:IsAnimationPlaying(self.In) then
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
  end
  self:UpdateUIStyleInPlatform(false)
end

function M:OnUnselect()
  if not self:IsAnimationPlaying(self.In) then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
  self:UpdateUIStyleInPlatform(true)
  if self.FocusTypeName == "RewardWidget" then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
    if StyleOfPlay then
      StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    end
    self.FocusTypeName = nil
  end
end

function M:OnFocusReceived(MyGeometry, MouseEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent:OnSelectChange(self)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    local CurInputDevice = UIUtils.UtilsGetCurrentInputType()
    self:SwitchToKeyAndMouseAnimation(false, CurInputDevice == ECommonInputType.MouseAndKeyboard)
    if self.Parent.SelectItem == self and CurInputDevice == ECommonInputType.Gamepad then
      self:PlayAnimation(self.Hover)
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadLeftThumbstick then
    local ItemReward = self.IsTwoReward and self.Item_Reward_1 or self.Item_Reward_2
    if not ItemReward:HasAnyUserFocus() then
      ItemReward:SetFocus()
      self:UpdatKeyDisplay("RewardWidget")
      IsEventHandled = true
    else
      self:SetFocus()
      self:UpdatKeyDisplay("SelfWidget")
      IsEventHandled = true
    end
  elseif InKeyName == Const.GamepadFaceButtonDown then
    if self:IsTaskRewardNotReceive() then
      self:ReceiveReward()
    elseif self:IsGoToSystem() then
      self:GoToSystem()
    end
  elseif InKeyName == Const.GamepadFaceButtonRight then
    if self.Item_Reward_1:HasAnyUserFocus() or self.Item_Reward_2:HasAnyUserFocus() then
      self:SetFocus()
      self:UpdatKeyDisplay("SelfWidget")
      IsEventHandled = true
    end
  elseif InKeyName == Const.GamepadFaceButtonUp then
    IsEventHandled = false
  elseif self.Item_Reward_1:HasAnyUserFocus() or self.Item_Reward_2:HasAnyUserFocus() then
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:UpdatKeyDisplay(FocusTypeName)
  if self.Mobile or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  if "RewardWidget" == FocusTypeName then
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_CheckDetails"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
  elseif "SelfWidget" == FocusTypeName then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(false)
  else
    local BottomKeyInfo = {}
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
  end
  if self.Parent.SelectItem == self then
    self.Parent:SwitchGamepadKeyShow("RewardWidgetDetail" ~= FocusTypeName and "RewardWidget" ~= FocusTypeName, FocusTypeName)
  end
  self.FocusTypeName = FocusTypeName
end

AssembleComponents(M)
return M
