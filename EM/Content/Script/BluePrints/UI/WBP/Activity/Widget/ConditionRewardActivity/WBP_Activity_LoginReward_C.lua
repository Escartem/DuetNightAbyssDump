require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.WBP.Activity.Widget.ConditionRewardActivity.ConditionRewardActiviyBase"
})

function M:InitUI()
  for i = 1, 2 do
    local ItemWidget = self["LoginReward_Item0" .. i]
    local RewardId = self:GetPageConfigData().EventReward
    local RewardData = DataMgr.Reward[RewardId]
    local ItemId = RewardData.Id[i]
    local Count = RewardUtils:GetCount(RewardData.Count[i])
    local Icon = ItemUtils.GetItemIcon(ItemId, RewardData.Type[i])
    local Rarity = ItemUtils.GetItemRarity(ItemId, RewardData.Type[i])
    local ItemType = RewardData.Type[i]
    local RewardObject = {}
    RewardObject.ParentWidget = self
    RewardObject.StuffClickCallback = self.OnViewStuffDetailClick
    RewardObject.CommonType = ""
    RewardObject.ItemType = ItemType
    RewardObject.Index = 1
    RewardObject.Id = ItemId
    RewardObject.Count = Count
    RewardObject.Icon = Icon
    RewardObject.Rarity = Rarity or 1
    RewardObject.IsShowDetails = true
    RewardObject.UIName = "ActivityLoginRewardItem"
    ItemWidget:FillWithData(RewardObject)
  end
  self.WS_Btn:SetActiveWidgetIndex(1)
  self.Activity_TimeView = self.LoginReward_Title.Activity_Time
  self.Text_ActivityDescView = self.LoginReward_Title.Text_ActivityDesc
  self.Text_TitleView = self.LoginReward_Title.Text_Title
  self:InitCommonUI()
  self.FocusWidgetName = "CheckRewardView"
  self.IsSelectItem = false
  self.IsOpenTip = false
  self.Key_BtnSign:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  if self.IsCanGetReward then
    self.Ws_Btn:SetActiveWidgetIndex(1)
    self.Btn_Click:SetForbidden(false)
    self.Text_Btn:SetText(GText("UI_GameEvent_ClaimReward"))
  else
    self.Ws_Btn:SetActiveWidgetIndex(0)
    self.Btn_Click:SetForbidden(true)
    self.Text_Doing:SetText(GText("UI_GameEvent_ToBeFinished"))
  end
  if self.IsComplete or self.IsGetReward then
    self.Ws_Btn:SetActiveWidgetIndex(2)
    self.Btn_Click:SetForbidden(true)
    self.Text_Got:SetText(GText("UI_GameEvent_HasClaimed"))
  end
  self.LoginReward_Item01:PlayAnimationByType(self.IsCanGetReward, self.IsComplete or self.IsGetReward)
  self.LoginReward_Item02:PlayAnimationByType(self.IsCanGetReward, self.IsComplete or self.IsGetReward)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClick)
end

function M:OnViewStuffDetailClick(IsOpenDetail, RewardItem)
  self.IsOpenTip = IsOpenDetail
  if ModController:IsMobile() then
    return
  end
  if IsOpenDetail then
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("EmptyView")
    end
  else
    RewardItem:SetFocus()
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("SelectView")
    end
  end
end

function M:GetCurFocusWidgetInfo()
  self:UpdateUIByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  return self.FocusWidgetName, self.FocusWidgetWidget
end

function M:UpdateUIByInputDevice(CurInputDeviceType)
  if CurInputDeviceType == ECommonInputType.Gamepad then
    self.WS_BtnSign:SetActiveWidgetIndex(1)
    if self.IsGetReward then
      self.Key_BtnSign:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Key_BtnSign:SetVisibility(ESlateVisibility.Visible)
    end
  elseif CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.WS_BtnSign:SetActiveWidgetIndex(0)
    self.Key_BtnSign:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
  end
  return IsEventHandled
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    self.LoginReward_Item01:SetFocus()
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("SelectView")
    end
    self.IsSelectItem = true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self:OnBtnClick()
  end
  return IsEventHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName and self.IsSelectItem and self.IsOpenTip == false then
    self:SetFocus()
    self.IsSelectItem = false
    IsHandled = true
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("CheckRewardView")
    end
  end
  if IsHandled then
    return UIUtils.Handled
  end
end

return M
