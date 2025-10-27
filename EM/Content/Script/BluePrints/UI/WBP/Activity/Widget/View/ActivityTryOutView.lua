local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
require("UnLua")
local M = {}

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
  local TitleWidget = self.Title:GetChildAt(0)
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

function M:RefreshPageStaticView(ActivityConfigData, PageConfigData, PageServerData, InfoClickFunction, GachaClickFunction, GoToTargetPageFunction, RewardGetClickFunction, ViewCharDetailFunction, SelectCharFunction, StuffDetailOpenFunction)
  if ActivityConfigData.EventNameBPPath then
    self.Title:ClearChildren()
    local TitleWidget = UIManager(self):CreateWidget(ActivityConfigData.EventNameBPPath)
    TitleWidget.Text_Title:SetText(GText(ActivityConfigData.EventName))
    self.Title:AddChildToOverlay(TitleWidget)
    self.Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Desc:SetText(GText(ActivityConfigData.EventDes))
  self.Text_Desc_White:SetText(GText(ActivityConfigData.EventDes))
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_EventPortal_RewardPreview"))
  if #self.AllActivityIds > 1 then
    for index = 1, ActivityCommon.MaxTryOutItemCount do
      local CharItemWidget = self["CharacterItem_" .. index]
      local ActivityId = self.AllActivityIds[index]
      if ActivityId then
        local ActivityServerData = PageServerData[ActivityId]
        local CharItemPageConfigData = DataMgr.CharTrialEvent[ActivityId]
        local InfoData = {
          Index = index,
          ActivityId = ActivityId,
          CharId = CharItemPageConfigData.CharId,
          SkinId = CharItemPageConfigData.SkinId,
          ClickCallback = SelectCharFunction,
          bIsSelected = self.CurActivityId == ActivityId,
          bIsHavePlayed = ActivityServerData and ActivityServerData:IsFinished()
        }
        CharItemWidget:Init(InfoData, self)
        CharItemWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        CharItemWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
    self.HB_Character:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.HB_Character:SetVisibility(UIConst.VisibilityOp.Collapsed)
    ActivityReddotHelper.TrySubReddotCount(ActivityUtils, self.AllActivityIds[1], "New")
  end
  local ActivityRewardId, RewardDataList = PageConfigData.TrialReward, {}
  local AllRewardList = RewardUtils:GetRewards(ActivityRewardId, nil)
  local FinalRewardList = ActivityCommon.GenerateAllRewardIds(AllRewardList)
  for _, Value in pairs(FinalRewardList) do
    local ItemId, RewardInfo = Value.ItemId, Value.ItemInfo
    if RewardInfo then
      local RewardObject = {}
      RewardObject.Id = ItemId
      RewardObject.Icon = ItemUtils.GetItemIconPath(ItemId, RewardInfo.TableName)
      RewardObject.ItemType = RewardInfo.TableName
      RewardObject.Rarity = RewardInfo.Rarity or RewardInfo[RewardInfo.TableName .. "Rarity"] or 0
      RewardObject.OnMenuOpenChangedEvents = {Obj = self, Callback = StuffDetailOpenFunction}
      RewardObject.IsShowDetails = true
      if RewardInfo.Quantity then
        if #RewardInfo.Quantity > 1 then
          RewardObject.Count = RewardInfo.Quantity[1]
          RewardObject.MaxCount = RewardInfo.Quantity[2]
        else
          RewardObject.Count = RewardInfo.Quantity[1]
        end
      else
        RewardObject.Count = RewardInfo.ItemCount
      end
      RewardObject.UIName = "ActivityTryOutPage"
      RewardObject.ParentWidget = self
      table.insert(RewardDataList, RewardObject)
    end
  end
  local ActivityServerData = PageServerData[self.CurActivityId]
  for Index = 1, ActivityCommon.MaxTryOutItemCount do
    local SubWidget = self["Item_" .. Index]
    local FillData = RewardDataList[Index]
    if FillData then
      FillData.bHasGot = ActivityServerData and ActivityServerData:IsGetReward()
      SubWidget:Init(FillData)
    else
      SubWidget:Init({Id = 0})
    end
  end
  if PageConfigData.GachaTabId then
    self.Group_Gacha:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Gacha:SetText(GText("UI_GameEvent_GachaPortal"))
  elseif PageConfigData.InterfaceJumpId and not UE.AHotUpdateGameMode.IsGlobalPak() then
    self.Group_Gacha:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Gacha:SetText(GText("UI_SkinTrial_JumptoShop"))
  else
    self.Group_Gacha:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.AvatarNeedAnchor:ClearChildren()
  if PageConfigData.WalnutId then
    local ActivityTryOutAvatarNeedWidget = UIManager(self):_CreateWidgetNew("ActivityTryOutAvatarNeed")
    if nil ~= ActivityTryOutAvatarNeedWidget then
      self.ActivityTryOutAvatarNeedWidget = ActivityTryOutAvatarNeedWidget
      ActivityTryOutAvatarNeedWidget:Init(PageConfigData.WalnutId)
      self.AvatarNeedAnchor:AddChildToOverlay(ActivityTryOutAvatarNeedWidget)
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
  self.Btn_Gacha:SetGamePadImg("X")
  self.Btn_Buy.Key_Shop:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.TryOutChar_Title:Init(PageConfigData.CharId, PageConfigData.SkinId, PageConfigData.ColorVarName, ViewCharDetailFunction, self)
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_TrialReward"))
  self.Btn_Goto:SetText(GText("UI_GameEvent_TrialPortal"))
  self.Btn_Goto:SetGamePadImg("A")
  self.Btn_Reward:SetText(GText("UI_GameEvent_TrialRewardClaim"))
  self.Btn_Reward:SetGamePadImg("Y")
  self.Btn_Reward:SetGamePadIconVisible(true)
  self.Text_Progressing:SetText(GText("UI_GameEvent_TrialToBeFinished"))
  self.Text_Got:SetText(GText("UI_GameEvent_TrialRewardClaimed"))
  self:UnBindAllClickFunction()
  self:BindAllClickFunction(InfoClickFunction, GachaClickFunction, GoToTargetPageFunction, RewardGetClickFunction)
  self:InitUIInfoByPlatform()
  self.Btn_Buy:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end)
  self.Btn_Goto:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/confirm_click", nil, nil)
  end)
end

function M:InitUIInfoByPlatform()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LT"}
      }
    })
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RT"}
      }
    })
    self.Key_RewardTitle:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  else
  end
end

function M:CancelCharSelectView()
  local LastCharItemWidget = self["CharacterItem_" .. self.CurSelectIndex]
  if LastCharItemWidget then
    LastCharItemWidget:SetIsSelected(false)
  end
end

function M:BindAllClickFunction(InfoClickFunction, GachaClickFunction, GoToTargetPageFunction, RewardGetClickFunction)
  self.Activity_Time.Btn_Detail:BindEventOnClicked(self, InfoClickFunction)
  self.Btn_Gacha:BindEventOnClicked(self, GachaClickFunction)
  self.Btn_Buy:BindEventOnClicked(self, GachaClickFunction)
  self.Btn_Goto:BindEventOnClicked(self, GoToTargetPageFunction)
  self.Btn_Reward:BindEventOnClicked(self, RewardGetClickFunction)
end

function M:UnBindAllClickFunction()
  self.Activity_Time.Btn_Detail:UnBindEventOnClickedByObj(self)
  self.Btn_Gacha:UnBindEventOnClickedByObj(self)
  self.Btn_Buy:UnBindEventOnClickedByObj(self)
  self.Btn_Goto:UnBindEventOnClickedByObj(self)
  self.Btn_Reward:UnBindEventOnClickedByObj(self)
end

function M:RefreshPageDynamicView(ActivityServerData)
  local bGetReward, bFinished = false, false
  if ActivityServerData then
    bGetReward = ActivityServerData:IsGetReward()
    bFinished = ActivityServerData:IsFinished()
  end
  for Index = 1, ActivityCommon.MaxTryOutItemCount do
    local SubWidget = self["Item_" .. Index]
    SubWidget:SetIsGot(bGetReward)
  end
  if bGetReward then
    self.WS_Btn:SetActiveWidgetIndex(2)
  elseif bFinished then
    self.WS_Btn:SetActiveWidgetIndex(1)
  else
    self.WS_Btn:SetActiveWidgetIndex(0)
  end
  if #self.AllActivityIds > 1 then
    for index = 1, ActivityCommon.MaxTryOutItemCount do
      local CurCharItemWidget = self["CharacterItem_" .. index]
      if CurCharItemWidget then
        if index == self.CurSelectIndex then
          CurCharItemWidget:SetIsPlayed(bFinished)
          CurCharItemWidget:SetIsSelected(true)
        else
          CurCharItemWidget:SetIsSelected(false)
        end
      end
    end
  end
end

function M:RefreshItemStyleView(ActivityServerData)
  self:RefreshPageDynamicView(ActivityServerData)
end

return M
