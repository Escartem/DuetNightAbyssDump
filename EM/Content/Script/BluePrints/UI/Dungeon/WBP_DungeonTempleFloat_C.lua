require("UnLua")
local WBP_DungeonTempleFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonTempleFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ScoreOrCollect = 0
  self.CurTime = 0
  self.CurStar = 0
  self.IsStarTemple = false
end

function WBP_DungeonTempleFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.OnSetTempleLimit, self, self.OnSetTempleLimit)
  self:AddDispatcher(EventID.OnTempleTimeChanged, self, self.OnTempleTimeChanged)
  self:AddDispatcher(EventID.OnTempleScoreCollectChanged, self, self.OnTempleScoreCollectChanged)
  self:AddDispatcher(EventID.OnTempleEnter, self, self.OnTempleEnter)
end

function WBP_DungeonTempleFloat_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self:InitInfo()
end

function WBP_DungeonTempleFloat_C:InitInfo()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return
  end
  self.DungeonId = GameInstance:GetCurrentDungeonId()
  self.DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not self.DungeonInfo then
    return
  end
  if self.DungeonInfo.DungeonType == "Temple" then
    self.TempleInfo = DataMgr.Temple[self.DungeonId]
    self:InitTemple()
  end
end

function WBP_DungeonTempleFloat_C:InitTemple()
  self.HB_Time:SetVisibility(ESlateVisibility.Hidden)
  self.HB_ScoreNum:SetVisibility(ESlateVisibility.Hidden)
  self.Text_ScoreNum:SetText(0)
  if not (not (#self.TempleInfo.RewardId <= 1) and self.TempleInfo.RatingRange) or #self.TempleInfo.RatingRange <= 1 then
    self.IsStarTemple = false
    self.VB_Item:SetVisibility(ESlateVisibility.Collapsed)
  elseif #self.TempleInfo.RewardId > 1 and self.TempleInfo.RatingRange and #self.TempleInfo.RatingRange > 1 then
    self.IsStarTemple = true
    self.VB_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.IsCountDown = false
  if self.TempleInfo.SucRule == "CountDown" then
    self.IsCountDown = true
  else
    self:InitTargetInfo()
  end
end

function WBP_DungeonTempleFloat_C:OnTempleTimeChanged(CurrentTime, ThresholdTime)
  local Time = ThresholdTime - CurrentTime
  local ChangeValue = Time - self.CurTime
  if ChangeValue > 1 then
    self.Text_TimeNumChange:SetText("+" .. ChangeValue)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Time_Add)
  elseif ChangeValue < -1 then
    self.Text_TimeNumChange:SetText(ChangeValue)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Time_Minus)
  end
  if self.TempleInfo.SucRule == "Time" then
    self.Text_Time:SetText(self:GetTimeStr(CurrentTime))
  end
  if self.Limit == "TIME" then
    self.CurTime = Time
    if Time >= 0 then
      self.Text_Time:SetText(self:GetTimeStr(Time))
    end
  end
  self:CheckStar()
end

function WBP_DungeonTempleFloat_C:OnSetTempleLimit(Limit, Value)
  self.Limit = Limit
  self.HB_Time:SetVisibility(ESlateVisibility.Visible)
  if "TIME" == Limit then
    self.TimeThreshold = Value
    self.CurTime = Value
    local Time = self:GetTimeStr(Value)
    self.Text_Time:SetText(Time)
  else
    self.Text_Time:SetText(Value)
  end
  if self.IsCountDown then
    self:InitTargetInfo()
  end
end

function WBP_DungeonTempleFloat_C:OnTempleScoreCollectChanged(Value)
  local Dif = Value - self.ScoreOrCollect
  if Dif > 0 then
    self.Text_ScoreNumChange:SetText("+" .. Dif)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Add)
  elseif Dif < 0 then
    self.Text_ScoreNumChange:SetText(Dif)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Minus)
  end
  self.ScoreOrCollect = math.max(0, Value)
  self.Text_ScoreNum:SetText(self.ScoreOrCollect)
  self:CheckStar()
end

function WBP_DungeonTempleFloat_C:InitTargetInfo()
  local TextRule2 = ""
  if self.TempleInfo.SucRule == "Time" then
    TextRule2 = "SECONDS"
  elseif self.TempleInfo.SucRule == "CountDown" then
    TextRule2 = "SECONDS"
  elseif self.TempleInfo.SucRule == "Score" then
    TextRule2 = "SCORE"
    self.HB_ScoreNum:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": ")
  elseif self.TempleInfo.SucRule == "Collect" then
    TextRule2 = "COUNT"
    self.HB_ScoreNum:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": ")
  end
  if self.IsStarTemple then
    for i = 3, 1, -1 do
      local TextInfo = ""
      local Target = self.TempleInfo.RatingRange[i]
      if 0 == Target then
        TextInfo = GText("UI_TEMPLE_SUCRULE_ZERO")
      elseif self.TempleInfo.SucRule == "CountDown" and self.TempleInfo.UIShowType and self.TempleInfo.UIShowType > 0 and self.TimeThreshold and self.TimeThreshold > 0 then
        TextInfo = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_" .. self.TempleInfo.UIShowType), self.TimeThreshold - Target)
      elseif "SCORE" == TextRule2 or "COUNT" == TextRule2 then
        TextInfo = GText("UI_TEMPLE_SUCRULE_" .. string.upper(self.TempleInfo.SucRule)) .. Target
      else
        TextInfo = GText("UI_TEMPLE_SUCRULE_" .. string.upper(self.TempleInfo.SucRule)) .. Target .. GText("UI_TEMPLE_MEASURE_" .. TextRule2)
      end
      self["TempleItem_" .. i]:SetTargetInfo(TextInfo)
      self["TempleItem_" .. i]:PlayNormalAnimation()
    end
  end
  self.Text_TempleTitle:SetText(GText("UI_TEMPLE_" .. self.DungeonId))
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      for i = 1, 3 do
        if self.ScoreOrCollect >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation()
        end
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      for i = 1, 3 do
        if self.CurTime >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation()
        end
      end
    end
  end
end

function WBP_DungeonTempleFloat_C:CheckStar()
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      if self.CurStar > 0 and self.ScoreOrCollect < self.TempleInfo.RatingRange[self.CurStar] then
        self["TempleItem_" .. self.CurStar]:PlayLossAnimation()
        self.CurStar = self.CurStar - 1
      elseif self.CurStar < 3 and self.ScoreOrCollect >= self.TempleInfo.RatingRange[self.CurStar + 1] then
        self["TempleItem_" .. self.CurStar + 1]:PlayStarAnimation()
        self.CurStar = self.CurStar + 1
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      if self.CurStar > 0 and self.CurTime < self.TempleInfo.RatingRange[self.CurStar] then
        self["TempleItem_" .. self.CurStar]:PlayLossAnimation()
        self.CurStar = self.CurStar - 1
      elseif self.CurStar < 3 and self.CurTime >= self.TempleInfo.RatingRange[self.CurStar + 1] then
        self["TempleItem_" .. self.CurStar + 1]:PlayStarAnimation()
        self.CurStar = self.CurStar + 1
      end
    end
  end
end

function WBP_DungeonTempleFloat_C:OnTempleEnter()
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      for i = 1, 3 do
        if self.ScoreOrCollect >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation()
        else
          self["TempleItem_" .. i]:PlayNormalAnimation()
        end
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      for i = 1, 3 do
        if self.CurTime >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation()
        else
          self["TempleItem_" .. i]:PlayNormalAnimation()
        end
      end
    end
  end
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Point_Add)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Point_Minus)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Time_Add)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Time_Minus)
end

return WBP_DungeonTempleFloat_C
