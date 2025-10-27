require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local WBP_Rouge_RewardInfo_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_RewardInfo_C:Construct()
  self.IsHovering = false
  self.IsPressing = false
  self.CurWeeklyMaxScore = 0
  self.RemainRefreshTime = nil
  self.Btn_Reward.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Reward.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Reward.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Reward.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn_Reward.OnClicked:Add(self, self.OnBtnClicked)
  self:RefreshInfo()
  self:SetTimer()
  if not ReddotManager.GetTreeNode("RougeLikeReward") then
    ReddotManager.AddNode("RougeLikeReward")
  end
  ReddotManager.AddListener("RougeLikeReward", self, self.SetState)
end

function WBP_Rouge_RewardInfo_C:RefreshInfo()
  self:SetInfo()
end

function WBP_Rouge_RewardInfo_C:SetInfo()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RougeLikeRewardId = Avatar.RougeLike.WeeklyRewardId
    local RewardInfo = DataMgr.RougeLikeReward[RougeLikeRewardId]
    if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
      self.CurWeeklyMaxScore = Avatar.RougeLike.WeeklyTotalScore
      local MaxScore = #RewardInfo.Reward * RewardInfo.EachGradePoints
      if MaxScore < self.CurWeeklyMaxScore then
        self.CurWeeklyMaxScore = MaxScore
      end
      self.Text_Score:SetText(self.CurWeeklyMaxScore)
      self.Text_MaxScore:SetText(MaxScore)
    end
  end
end

function WBP_Rouge_RewardInfo_C:SetState()
  local CacheDetail = ReddotManager.GetTreeNode("RougeLikeReward")
  if not CacheDetail then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if CacheDetail.Count and CacheDetail.Count > 0 then
    self:PlayAnimation(self.Reward)
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.Normal)
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Rouge_RewardInfo_C:SetTimer()
  self:Refresh()
  self:AddTimer(1, self.Refresh, true, 0, "RefreshRouge_RewardInfoTimer", true)
end

function WBP_Rouge_RewardInfo_C:Refresh()
  local refresh_hms = CommonConst.GAME_REFRESH_HMS
  local NextRefreshTime = TimeUtils.NextWeeklyRefreshTime(nil, refresh_hms)
  local CurrentTime = TimeUtils.NowTime()
  local RemainRefreshTime = NextRefreshTime - CurrentTime
  if self.RemainRefreshTime and RemainRefreshTime > self.RemainRefreshTime then
    self:RefreshInfo()
  end
  self.RemainRefreshTime = RemainRefreshTime
  local RemainTimeStr = ""
  local TimeCount = 0
  if RemainRefreshTime > 86400 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Day"), math.floor(RemainRefreshTime / 86400))
    RemainRefreshTime = RemainRefreshTime % 86400
  end
  if RemainRefreshTime > 3600 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Hour"), math.floor(RemainRefreshTime / 3600))
    RemainRefreshTime = RemainRefreshTime % 3600
  end
  if RemainRefreshTime > 60 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Minute"), math.floor(RemainRefreshTime / 60))
    RemainRefreshTime = RemainRefreshTime % 60
  end
  if RemainRefreshTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Second"), RemainRefreshTime)
  end
  self.Text_RemainTime:SetText(RemainTimeStr)
end

function WBP_Rouge_RewardInfo_C:OnBtnHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/gift_button_hover", nil, nil)
  self.IsHovering = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_RewardInfo_C:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_RewardInfo_C:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_RewardInfo_C:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_RewardInfo_C:OnBtnClicked()
  if self.Parent and self.Parent.IsClosing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/gift_button_click", nil, nil)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local RougeReward = UIManager:LoadUINew("RougeReward")
  RougeReward.RougeRewardInfo = self
end

function WBP_Rouge_RewardInfo_C:Destruct()
  self:RemoveTimer("RefreshRewardTimer")
  ReddotManager.RemoveListener("RougeLikeReward", self)
end

return WBP_Rouge_RewardInfo_C
