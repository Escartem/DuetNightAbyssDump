require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.WBP.Activity.Widget.ConditionRewardActivity.ConditionRewardActiviyBase"
})

function M:InitUI()
  local ActivityConfigData = self:GetPageConfigData()
  self.List_Reward:ClearListItems()
  local PreViewReward, RewardContentList = ActivityConfigData.EventReward, {}
  if nil == PreViewReward then
    self.Group_RewardView:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.List_Reward.OnCreateEmptyContent:Unbind()
    self.List_Reward.OnCreateEmptyContent:Bind(self, function(self)
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = 0
      return Content
    end)
    local RewardInfo = DataMgr.Reward[PreViewReward]
    if nil == self.RewardList then
      self.RewardList = {}
    end
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        Content.Id = ItemId
        Content.ItemType = ItemType
        Content.Count = Count
        Content.Rarity = Rarity
        Content.Icon = DataMgr[ItemType][ItemId].Icon
        Content.IsShowDetails = true
        Content.ParentWidget = self
        Content.OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.MenuOpenChangedEvent
        }
        table.insert(RewardContentList, Content)
      end
    end
    for _, ItemContent in ipairs(RewardContentList) do
      self.List_Reward:AddItem(ItemContent)
    end
    self.List_Reward:RequestFillEmptyContent()
  end
  self.Activity_TimeView = self.Activity_Time
  self.Text_ActivityDescView = self.Text_ActivityDesc
  self.Text_ActivityDescView_White = self.Text_ActivityDesc_White
  if DataMgr.EventMain[ActivityConfigData.EventId].EventNameBPPath then
    self.Group_TitleAnchor:ClearChildren()
    local TitleWidget = UIManager(self):CreateWidget(DataMgr.EventMain[ActivityConfigData.EventId].EventNameBPPath)
    TitleWidget.Text_Title:SetText(GText(DataMgr.EventMain[ActivityConfigData.EventId].EventName))
    TitleWidget.Text_SubTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_TitleAnchor:AddChildToOverlay(TitleWidget)
    self.Group_TitleAnchor:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Group_TitleAnchor:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitCommonUI()
  self.FocusWidgetName = "CheckRewardView"
  self.IsSelectItem = false
  self.IsOpenTip = false
  if self.IsCanGetReward then
    self.WS:SetActiveWidgetIndex(0)
    self.Btn_Get.Text_TrainingLevelGetAll:SetText(GText("UI_GameEvent_ClaimReward"))
  else
    self.Ws:SetActiveWidgetIndex(1)
    self.Btn_Get.Text_TrainingLevelGetAll:SetText(GText("UI_GameEvent_ToBeFinished"))
    self.Text_Lock:SetText(GText(ActivityConfigData.RewardUnlockTips))
  end
  if self.IsComplete or self.IsGetReward then
    self.Ws:SetActiveWidgetIndex(2)
    self.Text_Complete:SetText(GText("UI_GameEvent_HasClaimed"))
  end
  self.Btn_Get.Btn_TrainingLevelGetAll.OnClicked:Add(self, self.OnBtnClick)
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_EventPortal_RewardPreview"))
  self.Key_RewardTitle:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
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
    self.Btn_Get.Key_GetAll:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Visible)
  elseif CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.Btn_Get.Key_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.IsSelectItem = false
  end
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
    IsEventHandled = false
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
    self.IsSelectItem = true
    IsEventHandled = self:EnterStuffViewMode()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.IsSelectItem then
      IsEventHandled = self:LeaveStuffViewMode()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom and self.IsSelectItem == false then
    self:OnBtnClick()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:EnterStuffViewMode()
  if self.IsHideReward then
    return false
  end
  if self.FocusWidgetName == "CheckRewardDetailView" then
    return self:LeaveStuffViewMode()
  end
  self.List_Reward:SetFocus()
  self.FocusWidgetName = "CheckRewardDetailView"
  self.FocusWidgetWidget = self.List_Reward
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips(self.FocusWidgetName, self.FocusWidgetWidget)
  end
  self:OnUpdateSubUIViewStyle(false, true)
  return true
end

function M:LeaveStuffViewMode()
  self.IsSelectItem = false
  if self.FocusWidgetName == nil then
    return false
  end
  self.FocusWidgetName = nil
  self.FocusWidgetWidget = nil
  self.List_Reward:BP_ClearSelection()
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips()
    self.ParentWidget:SetFocus()
  end
  self:OnUpdateSubUIViewStyle(true, true)
  return true
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad, bIsWithButton)
  if IsUseGamePad then
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_Get.Key_GetAll:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Get.Key_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:GetSupportCommonSubItemWidget()
  local CommonSubItemWidget = self.Group_LimitTimeReward:GetChildAt(0)
  return CommonSubItemWidget
end

function M:GetSupportsKeyDownSubWidget()
  local ChildItemSubWidget = self.Group_Task:GetChildAt(0)
  ChildItemSubWidget = ChildItemSubWidget or self.Group_TaskProgress:GetChildAt(0)
  ChildItemSubWidget = ChildItemSubWidget or self.Group_Common_SubItem:GetChildAt(0)
  return ChildItemSubWidget
end

function M:MenuOpenChangedEvent(IsOpened, Content)
  if ModController:IsMobile() then
    return
  end
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  self.LastFocusWidget = Content.SelfWidget
  if IsOpened then
    self.IsOpenTip = true
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("EmptyView")
    end
  else
    self.IsOpenTip = false
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("CheckRewardDetailView")
    end
    self.LastFocusWidget:SetFocus()
  end
end

function M:ShowPage(IsNeedPlayInAnim)
  if IsNeedPlayInAnim then
    self:PlayFadeIn()
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
  local TitleWidget = self.Group_TitleAnchor:GetChildAt(0)
  if TitleWidget.In ~= nil then
    TitleWidget:PlayAnimationForward(TitleWidget.In)
  end
end

return M
