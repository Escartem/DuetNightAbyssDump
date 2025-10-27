require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local ChallengeRewardReddotName = "JJGameTask_Challenge_Reddot"

function M:Construct()
  self.CacheKey = "ChallengeScoreItem" .. self.Count
  self.Btn_Click.OnClicked:Add(self, self.OnClick)
  ReddotManager.AddListenerEx(ChallengeRewardReddotName, self, self.UpdateChallengeReddot)
end

function M:Destruct()
  self.Btn_Click.OnClicked:Clear()
  ReddotManager.RemoveListener(ChallengeRewardReddotName, self)
end

function M:Init(Params)
  self.Owner = Params.Owner
  self.Count = Params.Count
  self.Index = Params.Index
  self.RewardId = Params.RewardId
  self.CanGet = Params.CanGet
  self.IsReceived = Params.IsReceived
  self.CacheKey = Params.CacheKey
  self.Text_Score:SetText(Params.Count)
  self.MidTermConst = DataMgr.MidTermGoalConstant
  self.MidTermGoalEventId = self.MidTermConst.MidTermGoalEventId.ConstantValue
end

function M:UpdateChallengeReddot(Count)
  self.Avatar = GWorld:GetAvatar()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if not CacheData then
    return
  end
  if CacheData[self.CacheKey] and Count > 0 then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Hidden)
  end
end

function M:OnClick()
  if not self.CanGet then
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_gift_btn_click_disable", nil, nil)
    local Params = {
      Count = self.Count,
      Index = self.Index,
      ActivityId = self.MidTermGoalEventId,
      BackFocusWidget = self.Owner.List_Challenge
    }
    UIManager(self):ShowCommonPopupUI(100101, Params, self)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_gift_btn_click", nil, nil)
    self.Owner:OnChallengeRewardGet(self)
  end
end

return M
