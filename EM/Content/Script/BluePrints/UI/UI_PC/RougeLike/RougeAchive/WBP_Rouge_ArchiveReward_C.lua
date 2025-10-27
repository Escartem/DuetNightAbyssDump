local WBP_Rouge_ArchiveReward_C = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_ArchiveReward_C:Construct()
  self.Text_RewardTitle:SetText(GText("UI_RLArchive_Reward"))
end

function WBP_Rouge_ArchiveReward_C:InitView(DataModel)
  self.DataModel = DataModel
  self.Key_Reward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    }
  })
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice()
end

function WBP_Rouge_ArchiveReward_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice or UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = CurGamepadName or UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif self.CurInputDeviceType == UE4.ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardView()
  end
  self.Super.RefreshOpInfoByInputDevice(self, self.CurInputDeviceType, self.CurGamepadName)
end

function WBP_Rouge_ArchiveReward_C:InitGamepadView()
  self.Controller_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Rouge_ArchiveReward_C:InitKeyboardView()
  self.Controller_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Rouge_ArchiveReward_C:SetItemNum(Type)
  local UnlockedItemNum = self.DataModel:GetUnlockedItemNum(Type)
  local TotalItemNum = self.DataModel:GetTotalItemNum(Type)
  self.Text_Reward_Num:SetText(string.format("<H>%d</>/%d", UnlockedItemNum, TotalItemNum))
  self.Text_Reward_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Rouge_ArchiveReward_C:HideItemNum()
  self.Text_Reward_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Rouge_ArchiveReward_C:SetReddot(IsShow)
  self.Reddot:SetVisibility(IsShow and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
end

return WBP_Rouge_ArchiveReward_C
