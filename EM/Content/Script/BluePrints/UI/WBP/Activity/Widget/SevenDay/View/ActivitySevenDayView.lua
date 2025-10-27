require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = {}

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
  local TitleWidget = self.Group_Title:GetChildAt(0)
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

function M:RefreshPageStaticView(ActivityConfigData, PageConfigData, InfoClickFunction)
  local TitleBP = "/Game/UI/WBP/Activity/Widget/SevenDay/WBP_Activity_SevenDayTitle.WBP_Activity_SevenDayTitle"
  if ActivityConfigData.EventNameBPPath ~= nil then
    TitleBP = ActivityConfigData.EventNameBPPath
  end
  local TitleWidget = UIManager(self):CreateWidget(TitleBP)
  self.Group_Title:ClearChildren()
  self.Group_Title:AddChildToOverlay(TitleWidget)
  self.Group_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.ActivityTitle = TitleWidget
  local RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems'"
  if nil ~= PageConfigData.RewardBannerBP then
    RewardBannerBP = PageConfigData.RewardBannerBP
  end
  local SevenDayItems = UIManager(self):CreateWidget(RewardBannerBP)
  self.Group_Items:ClearChildren()
  self.SevenDayItems = SevenDayItems
  self.Group_Items:AddChildToOverlay(SevenDayItems)
  self.ActivityTitle.Text_Title:SetText(GText(ActivityConfigData.EventName))
  self.ActivityTitle.Text_ActivityDesc:SetText(GText(ActivityConfigData.EventDes))
  local CharId = PageConfigData.CharInfo
  if nil ~= CharId then
    local BattleCharConfigInfo = DataMgr.BattleChar[CharId]
    if nil ~= BattleCharConfigInfo then
      if BattleCharConfigInfo.Attribute then
        local IconName = "Armory_" .. BattleCharConfigInfo.Attribute
        if IconName then
          local AttrIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
          self.AvatarName.Image_AvatarType:SetBrushResourceObject(AttrIcon)
        end
      end
      self.AvatarName.Text_AvatarDesc:SetText(GText(PageConfigData.CharDes))
      self.AvatarName.Text_AvatarName:SetText(GText(BattleCharConfigInfo.CharName))
      local CharRarity = DataMgr.Char[CharId].CharRarity or 1
      for i = 1, CharRarity do
        self:PlayStarGoldenInAnim(i)
      end
      self.AvatarName:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.AvatarName:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.AvatarName:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.SevenDayItems:InitRewardInfo(PageConfigData, self)
  self:BindAllClickFunction(InfoClickFunction)
  self:AdjustWidgetByPlatform()
end

function M:AdjustWidgetByPlatform()
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  local SuffixStr = "Mobile" == PlatformName and "M" or "P"
end

function M:RefreshPageDynamicView(PageConfigData, PageServerData)
  local AllSignDay = PageConfigData.LoginDuration
  for i = 1, AllSignDay do
    local RewardWidget = self.SevenDayItems["LowItem_" .. i] or self.SevenDayItems.HighItem
    RewardWidget:RefreshRewardByState(PageServerData[i])
    if PageServerData[i] == ActivityUtils.EnumPlayerSignRewardState.SignedNotRecv then
      ActivityUtils.TryAddActivityReddotCommon("Red", self.CurActivityId)
    end
  end
end

function M:BindAllClickFunction(InfoClickFunction)
  self.ActivityTitle.Activity_Time.Btn_Detail:BindEventOnClicked(self, InfoClickFunction)
end

function M:UpdateParentActivityKeyTips(FocusWidgetName, FocusWidgetWidget, bIsFocusToParent)
end

function M:PlayStarGoldenInAnim(Idx)
  local Len = self.AvatarName.HB_Star:GetChildrenCount()
  local Stars = self.AvatarName.HB_Star:GetAllChildren()
  if Idx <= Len then
    Stars[Idx]:BindToAnimationFinished(Stars[Idx].Golden_In, {
      Stars[Idx],
      function()
        Stars[Idx]:UnbindAllFromAnimationFinished(Stars[Idx].In)
        Stars[Idx]:PlayAnimation(Stars[Idx].Loop, 1, 0)
      end
    })
    Stars[Idx]:PlayAnimation(Stars[Idx].Golden_In)
  end
end

function M:RefreshItemStyleView(RewardIndex, RewardState)
  local TargetItem = self.SevenDayItems["LowItem_" .. RewardIndex] or self.SevenDayItems.HighItem
  if nil ~= TargetItem then
    TargetItem:RefreshRewardByState(RewardState)
  end
end

return M
