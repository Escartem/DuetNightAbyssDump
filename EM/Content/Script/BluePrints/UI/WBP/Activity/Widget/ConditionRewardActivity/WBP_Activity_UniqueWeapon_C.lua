require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.WBP.Activity.Widget.ConditionRewardActivity.ConditionRewardActiviyBase"
})

function M:InitUI()
  local ActivityConfigData = self:GetPageConfigData()
  local RewardId = ActivityConfigData.EventReward
  local RewardData = DataMgr.Reward[RewardId]
  local ItemId = RewardData.Id[1]
  local Count = RewardUtils:GetCount(RewardData.Count[1])
  local Icon = ItemUtils.GetItemIcon(ItemId, RewardData.Type[1])
  local Rarity = ItemUtils.GetItemRarity(ItemId, RewardData.Type[1])
  local ItemType = RewardData.Type[1]
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
  self.Com_Item:Init(RewardObject)
  self.WS_Btn:SetActiveWidgetIndex(1)
  self.Activity_TimeView = self.Activity_Time.Com_Time
  self.Text_ActivityDescView = self.Text_Desc
  if DataMgr.EventMain[ActivityConfigData.EventId].EventNameBPPath then
    self.Title:ClearChildren()
    local TitleWidget = UIManager(self):CreateWidget(DataMgr.EventMain[ActivityConfigData.EventId].EventNameBPPath)
    TitleWidget.Text_Title:SetText(GText(DataMgr.EventMain[ActivityConfigData.EventId].EventName))
    self.Title:AddChildToOverlay(TitleWidget)
    self.Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitCommonUI()
  self.FocusWidgetName = "CheckRewardView"
  self.IsSelectItem = false
  self.IsOpenTip = false
  if self.IsCanGetReward then
    self.Ws_Btn:SetActiveWidgetIndex(0)
    self.Btn_Reward:ForbidBtn(false)
    self.Btn_Reward:SetText(GText("UI_GameEvent_ClaimReward"))
  else
    self.Ws_Btn:SetActiveWidgetIndex(0)
    self.Btn_Reward:ForbidBtn(true)
    self.Btn_Reward:SetText(GText("UI_GameEvent_ToBeFinished"))
  end
  if self.IsComplete or self.IsGetReward then
    self.Ws_Btn:SetActiveWidgetIndex(1)
    self.Text_Got:SetText(GText("UI_GameEvent_HasClaimed"))
  end
  self.Btn_Reward.Button_Area.OnClicked:Add(self, self.OnBtnClick)
  self.TryOutChar_Title:Init(ActivityConfigData.Weapon, self.ViewWeaponDetailFunction, self)
  self.Btn_Reward:SetGamePadIconVisible(true)
  self.Btn_Reward:SetGamePadImg("X")
end

function M:ViewWeaponDetailFunction()
  local PageConfigData = self:GetPageConfigData()
  local WeaponId = PageConfigData.Weapon
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = {WeaponId},
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewArmory
  })
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

function M:UpdateUIByInputDevice(CurInputDeviceType)
  if CurInputDeviceType == ECommonInputType.Gamepad then
    self.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(1)
  elseif CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(0)
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("CheckRewardView", nil)
    end
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
    self.Com_Item:SetFocus()
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("SelectView", self.Com_Item)
    end
    self.IsSelectItem = true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self:OnBtnClick()
  elseif "Gamepad_Special_Left" == InKeyName then
    self:ViewWeaponDetailFunction()
  end
  return IsEventHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName and self.IsSelectItem and self.IsOpenTip == false then
    self.IsSelectItem = false
    IsHandled = true
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("CheckRewardView", nil)
      ActivityMain:SetFocus()
    end
  end
  if IsHandled then
    return UIUtils.Handled
  end
end

return M
