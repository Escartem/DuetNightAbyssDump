require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = {}

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
  local TitleWidget = self.Group_TitleAnchor:GetChildAt(0)
  if TitleWidget.In ~= nil then
    TitleWidget:PlayAnimationForward(TitleWidget.In)
  end
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

function M:HidePage(IsNeedPlayOutAnim)
  if IsNeedPlayOutAnim then
    self:PlayFadeOut()
  end
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ShowPage(IsNeedPlayInAnim)
  if IsNeedPlayInAnim then
    self:PlayFadeIn()
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:IsPageInVisible()
  return self:IsVisible()
end

function M:RefreshPageStaticView(ActivityConfigData, PageConfigData, InfoClickFunction, ShopClickFunction, GoToTargetPageFunction, StuffDetailOpenFunction, GoToTaskClickFunction, GoToMoreClickFunction)
  local PlayerAvatar = GWorld:GetAvatar()
  local TitleWidget = UIManager(self):CreateWidget(ActivityConfigData.EventNameBPPath)
  self:UpdateEventTitleInfo(ActivityConfigData, TitleWidget, PlayerAvatar)
  self.Group_TitleAnchor:ClearChildren()
  self.Group_TitleAnchor:AddChildToOverlay(TitleWidget)
  self.Group_TitleAnchor:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if ActivityConfigData.EventRule then
    self.Text_ActivityDescTitle:SetText(GText("UI_Common_Rule"))
    self.Com_BtnExplanation:SetVisibility(UIConst.VisibilityOp.VisibilityOp)
    self.Group_ActivityQa:SetVisibility(UIConst.VisibilityOp.VisibilityOp)
  else
    self.Com_BtnExplanation:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_ActivityQa:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_ActivityDesc:SetText(GText(ActivityConfigData.EventDes))
  self.Text_ActivityDesc_White:SetText(GText(ActivityConfigData.EventDes))
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_EventPortal_RewardPreview"))
  self.List_Reward.OnCreateEmptyContent:Unbind()
  self.List_Reward.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = 0
    return Content
  end)
  self.List_Reward:ClearListItems()
  local PreViewReward, RewardContentList = PageConfigData.RewardPreview, {}
  if nil == PreViewReward then
    self.Group_RewardView:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local AllRewardList = RewardUtils:GetRewardViewInfoById(PreViewReward)
    for i, RewardInfo in ipairs(AllRewardList) do
      if RewardInfo then
        local RewardIcon = ItemUtils.GetItemIconPath(RewardInfo.Id, RewardInfo.Type)
        local RewardContent = self:NewItemContent(RewardInfo.Type, RewardInfo.Id, RewardIcon, RewardInfo.Rarity or 1, RewardInfo.Quantity, StuffDetailOpenFunction)
        table.insert(RewardContentList, RewardContent)
      end
    end
    for _, ItemContent in ipairs(RewardContentList) do
      self.List_Reward:AddItem(ItemContent)
    end
    self.List_Reward:RequestFillEmptyContent()
  end
  if PageConfigData.EventShop then
    self.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
      self.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if PageConfigData.TaskId then
    self.Group_BtnTask:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Group_BtnTask:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if PageConfigData.ShowBtnMore then
    self.Size_More:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Size_More:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local IsLock = false
  local IsComplete = false
  if PageConfigData.JumpFinishCondition and ConditionUtils.CheckCondition(PlayerAvatar, PageConfigData.JumpFinishCondition) then
    IsComplete = true
  end
  if PageConfigData.JumpUnlockCondition and not ConditionUtils.CheckCondition(PlayerAvatar, PageConfigData.JumpUnlockCondition) then
    IsLock = true
  end
  self.WS:SetVisibility(UIConst.VisibilityOp.VisibilityOp)
  self.Group_Reward:SetVisibility(UIConst.VisibilityOp.VisibilityOp)
  if IsLock then
    self.WS:SetActiveWidgetIndex(1)
  elseif IsComplete then
    self.WS:SetActiveWidgetIndex(2)
    self.Text_Complete:SetText(GText(PageConfigData.JumpFinishDes))
  else
    if nil == PageConfigData.JumpUIId then
      self.IsHideReward = true
      self.WS:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Group_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    elseif nil ~= PageConfigData.IsUseTabJumpBtn and PageConfigData.IsUseTabJumpBtn == false then
      self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.WS:SetActiveWidgetIndex(0)
  end
  self.Group_Task:ClearChildren()
  self.Group_TaskProgress:ClearChildren()
  self.Group_Common_SubItem:ClearChildren()
  self.Group_LimitTimeReward:ClearChildren()
  if ActivityConfigData.PretextTasks1 or ActivityConfigData.PretextTasks2 then
    local TaskWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Activity/Widget/PreTask/WBP_Activity_PreTask_Item.WBP_Activity_PreTask_Item")
    TaskWidget:InitPage(ActivityConfigData.EventId)
    if TaskWidget and TaskWidget:IsNeedShow() then
      self.Group_Task:AddChildToOverlay(TaskWidget)
    else
      local TaskProcessWidget = UIManager(self):CreateWidget(PageConfigData.SubBPPath2)
      if TaskProcessWidget then
        if type(TaskProcessWidget.InitPage) == "function" then
          TaskProcessWidget:InitPage(ActivityConfigData.EventId)
        else
          TaskProcessWidget:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
        end
        self.Group_TaskProgress:AddChildToOverlay(TaskProcessWidget)
      end
    end
  elseif PageConfigData.SubBPPath2 then
    self.Group_Task:ClearChildren()
    self.Group_TaskProgress:ClearChildren()
    local SpecialWidget = UIManager(self):CreateWidget(PageConfigData.SubBPPath2)
    if SpecialWidget.Init then
      SpecialWidget:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
    end
    local Slot = self.Group_Common_SubItem:AddChildToOverlay(SpecialWidget)
    Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  end
  local AbyssSeasonId = PlayerAvatar.CurrentAbyssSeasonId
  local AbyssSeasonConfig = DataMgr.AbyssSeasonList[AbyssSeasonId]
  if AbyssSeasonConfig then
    local AbyssActivityId = AbyssSeasonConfig.EventId
    if ActivityConfigData.EventId == AbyssActivityId then
      local AbyssWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Activity/Widget/Abyss/WBP_Activity_Abyss_Character.WBP_Activity_Abyss_Character")
      if AbyssWidget.Init then
        AbyssWidget:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
      end
      local Slot = self.Group_Common_SubItem:AddChildToOverlay(AbyssWidget)
      Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
  end
  local RewardWidget = UIManager(self):CreateWidget(PageConfigData.RewardBPPath)
  if PageConfigData.RewardBPPath and not ActivityUtils.CheckIsPermanentEvent(ActivityConfigData.EventId) then
    if RewardWidget.Init then
      RewardWidget:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
    end
    local Slot = self.Group_LimitTimeReward:AddChildToOverlay(RewardWidget)
    Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  end
  self.Text_Lock:SetText(GText(PageConfigData.JumpUnlockTips))
  self.Btn_Confirm:SetText(GText("UI_GameEvent_EventPortal_Goto"))
  self.Btn_Confirm:SetGamePadImg("A")
  self:BindAllClickFunction(InfoClickFunction, ShopClickFunction, GoToTargetPageFunction, GoToTaskClickFunction, GoToMoreClickFunction)
  self:InitUIInfoByPlatform()
  local CallbackInfo = {
    Obj = self,
    Func = function(self, Count, RdType, RdName)
      local bShowRed = 1 == ActivityUtils.GetReddotCachInfoByKey("Red", self.CurActivityId)
      self.Btn_Confirm:EMShowReddot(bShowRed, EReddotType.Normal, 0)
    end
  }
  ActivityReddotHelper.RemoveReddotListenByEventId(self.CurActivityId, self)
  ActivityReddotHelper.AddReddotListenByEventId(self.CurActivityId, CallbackInfo)
  self.Btn_Buy:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end)
  self.Btn_Confirm:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/confirm_click", nil, nil)
  end)
end

function M:UpdateEventTitleInfo(ActivityConfigData, TitleWidget, PlayerAvatar)
  if not TitleWidget then
    return
  end
  TitleWidget.Text_Title:SetText(GText(ActivityConfigData.EventName))
  if ActivityConfigData.EventSName then
    TitleWidget.Text_SubTitle:SetText(GText(ActivityConfigData.EventSName))
  end
end

function M:BindAllClickFunction(InfoClickFunction, ShopClickFunction, GoToTargetPageFunction, GoToTaskClickFunction, GoToMoreClickFunction)
  self.Btn_Buy:BindEventOnClicked(self, ShopClickFunction)
  self.Btn_Confirm:BindEventOnClicked(self, GoToTargetPageFunction)
  self.BtnTask:BindEventOnClicked(self, GoToTaskClickFunction)
  self.Com_BtnMore:BindEventOnClicked(self, GoToMoreClickFunction)
  local BtnExplanationConfigData = {}
  BtnExplanationConfigData.ClickCallback = InfoClickFunction
  BtnExplanationConfigData.OwnerWidget = self
  BtnExplanationConfigData.Desc = "UI_Common_Rule"
  
  function BtnExplanationConfigData.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  self.Com_BtnExplanation:Init(BtnExplanationConfigData)
end

function M:InitUIInfoByPlatform()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Btn_Buy.Key_Shop:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
    self.Key_Task:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
    self.Key_More:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
    self.Key_RewardTitle:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
    self.Com_BtnExplanation.Com_KeyImg:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
  else
  end
end

function M:RefreshPageDynamicView()
  self.List_Reward:ScrollIndexIntoView(0)
end

function M:NewItemContent(ItemType, ItemId, Icon, Rarity, Quantity, OpenFunction)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.ItemType = ItemType
  Obj.UnitId = ItemId
  Obj.Rarity = Rarity
  Obj.Icon = Icon
  Obj.IsShowDetails = true
  Obj.OnMenuOpenChangedEvents = {Obj = self, Callback = OpenFunction}
  Obj.UIName = "ActivityJumpPage"
  if Quantity then
    if #Quantity > 1 then
      Obj.Count = Quantity[1]
      Obj.MaxCount = Quantity[2]
    else
      Obj.Count = Quantity[1]
    end
  end
  return Obj
end

return M
