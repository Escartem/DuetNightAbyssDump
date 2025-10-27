require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ScoreOrCollect = 0
  self.CurTime = 0
  self.CurStar = 0
  self.IsStarTemple = false
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnSetTempleLimit, self, self.OnSetTempleLimit)
  self:AddDispatcher(EventID.OnTempleTimeChanged, self, self.OnTempleTimeChanged)
  self:AddDispatcher(EventID.OnTempleScoreCollectChanged, self, self.OnTempleScoreCollectChanged)
  self:AddDispatcher(EventID.OnTempleEnter, self, self.OnTempleEnter)
  self:AddDispatcher(EventID.OnUpdatePartyRightUI, self, self.OnUpdatePartyRightUI)
  self:AddDispatcher(EventID.OnUpdatePartyLeftUI, self, self.OnUpdatePartyTime)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self:InitInfo()
end

function M:InitInfo()
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
    self.IsCountDown = false
    if self.TempleInfo.SucRule == "CountDown" then
      self.IsCountDown = true
    end
    self:InitTemple()
  elseif self.DungeonInfo.DungeonType == "Party" then
    self.TempleInfo = DataMgr.Party[self.DungeonId]
    self.IsCountDown = false
    self:InitParty()
  end
  for _, T in pairs(DataMgr.TempleEventLevel) do
    if T.TempleId == self.DungeonId and true == T.IsHardMode then
      self.IsHardMode = true
      self:SwitchStarType()
      break
    end
  end
end

function M:InitTemple()
  if not self.IsCountDown then
    self.Text_ScoreNum:SetText(0)
  end
  if not (not (#self.TempleInfo.RewardId <= 1) and self.TempleInfo.RatingRange) or #self.TempleInfo.RatingRange <= 1 then
    self.IsStarTemple = false
    self.VB_Item:SetVisibility(ESlateVisibility.Collapsed)
  elseif #self.TempleInfo.RewardId > 1 and self.TempleInfo.RatingRange and #self.TempleInfo.RatingRange > 1 then
    self.IsStarTemple = true
    self.VB_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:AddTimer(0.01, function()
    self:InitTargetInfo()
  end, false, nil, nil, false)
end

function M:InitParty()
  self.Group_Score:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_TempleGoal:SetVisibility(ESlateVisibility.Collapsed)
  self.IsStarParty = true
  self:AddTimer(0.01, function()
    self:InitPartyTargetInfo()
  end, false, nil, nil, false)
end

function M:OnTempleScoreCollectChanged(Value)
  if not self.IsCountDown then
    local Dif = Value - self.ScoreOrCollect
    if Dif > 0 then
      self.Text_ScoreNumChange:SetText("+" .. Dif)
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Add)
      AudioManager(self):PlayUISound(self, "event:/ui/common/sp_score_add", nil, nil)
    elseif Dif < 0 then
      self.Text_ScoreNumChange:SetText(Dif)
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Minus)
      AudioManager(self):PlayUISound(self, "event:/ui/common/sp_score_dec", nil, nil)
    end
    self.ScoreOrCollect = math.max(0, Value)
    self.Text_ScoreNum:SetText(self.ScoreOrCollect)
    self:CheckStar()
  end
end

function M:InitTargetInfo()
  local TextRule2 = ""
  if self.TempleInfo.SucRule == "Time" then
    TextRule2 = "SECONDS"
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.TempleInfo.SucRule == "CountDown" then
    TextRule2 = "SECONDS"
    if self.TempleInfo.UIShowType and 1 == self.TempleInfo.UIShowType then
      self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_TIME"))
    else
      self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": ")
    end
  elseif self.TempleInfo.SucRule == "Score" then
    TextRule2 = "SCORE"
    self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": ")
  elseif self.TempleInfo.SucRule == "Collect" then
    TextRule2 = "COUNT"
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
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      for i = 1, 3 do
        if self.ScoreOrCollect >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation(self.IsHardMode)
        end
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      for i = 1, 3 do
        if self.CurTime >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation(self.IsHardMode)
        end
      end
    end
  end
end

function M:InitPartyTargetInfo()
  self.Text_CompletionRateNum:SetText("0%")
  self.Text_RankTitle:SetText(GText("UI_Party_Parkour_Ranking"))
  self.Text_CompletionRateTitle:SetText(GText("UI_Party_Parkour_FinishingRate"))
end

function M:OnSetTempleLimit(Limit, Value)
  self.Limit = Limit
  if "TIME" == Limit then
    self.TimeThreshold = Value
    self.CurTime = Value
    local Time = self:GetTimeStr(Value)
    if self.IsCountDown then
      if 1 == self.TempleInfo.UIShowType then
        self.Text_ScoreNum:SetText(self:GetTimeStr(0))
      else
        self.Text_ScoreNum:SetText(Time)
      end
    end
  elseif self.IsCountDown then
    self.Text_ScoreNum:SetText(Value)
  end
end

function M:CheckStar()
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      if self.CurStar > 0 and self.ScoreOrCollect < self.TempleInfo.RatingRange[self.CurStar] then
        self["TempleItem_" .. self.CurStar]:PlayLossAnimation(self.IsHardMode)
        self.CurStar = self.CurStar - 1
        AudioManager(self):PlayUISound(self, "event:/ui/common/sp_goal_disable", nil, nil)
      elseif self.CurStar < 3 and self.ScoreOrCollect >= self.TempleInfo.RatingRange[self.CurStar + 1] then
        self["TempleItem_" .. self.CurStar + 1]:PlayStarAnimation(self.IsHardMode)
        self.CurStar = self.CurStar + 1
        AudioManager(self):PlayUISound(self, "event:/ui/common/sp_goal_enable", nil, nil)
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      if self.CurStar > 0 and self.CurTime < self.TempleInfo.RatingRange[self.CurStar] then
        self["TempleItem_" .. self.CurStar]:PlayLossAnimation(self.IsHardMode)
        self.CurStar = self.CurStar - 1
        AudioManager(self):PlayUISound(self, "event:/ui/common/sp_goal_disable", nil, nil)
      elseif self.CurStar < 3 and self.CurTime >= self.TempleInfo.RatingRange[self.CurStar + 1] then
        self["TempleItem_" .. self.CurStar + 1]:PlayStarAnimation(self.IsHardMode)
        self.CurStar = self.CurStar + 1
        AudioManager(self):PlayUISound(self, "event:/ui/common/sp_goal_enable", nil, nil)
      end
    end
  end
end

function M:OnTempleEnter()
  self.CurStar = 0
  if self.IsStarTemple then
    if self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
      for i = 1, 3 do
        if self.ScoreOrCollect >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation(self.IsHardMode)
        else
          self["TempleItem_" .. i]:PlayNormalAnimation()
        end
      end
    elseif self.TempleInfo.SucRule == "CountDown" then
      for i = 1, 3 do
        if self.CurTime >= self.TempleInfo.RatingRange[i] then
          self.CurStar = i
          self["TempleItem_" .. i]:PlayStarAnimation(self.IsHardMode)
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

function M:OnUpdatePartyTime(PartyTime)
  if not self.PartyStarUIStart then
    return
  end
  self.Text_ScoreNum:SetText(self:GetTimeStr(self.TimeThreshold - PartyTime))
  self.CurTime = PartyTime
  local RemainTime = self.TimeThreshold - self.CurTime
  if self.GameState and self.GameState.CurPlayerComplete then
    DebugPrint("zzz \229\183\178\229\136\176\231\187\136\231\130\185")
    return
  end
  if self.CurStar > 0 and RemainTime < self.TempleInfo.RatingRange[self.CurStar] then
    self["TempleItem_" .. self.CurStar]:PlayLossAnimation(false)
    self.CurStar = self.CurStar - 1
    AudioManager(self):PlayUISound(self, "event:/ui/common/sp_goal_disable", nil, nil)
  end
end

function M:OnTempleTimeChanged(CurrentTime, ThresholdTime)
  if self.IsCountDown then
    local Time = ThresholdTime - CurrentTime
    local ChangeValue = Time - self.CurTime
    self.CurTime = Time
    if 1 == self.TempleInfo.UIShowType then
      if Time >= 0 then
        self.Text_ScoreNum:SetText(self:GetTimeStr(CurrentTime))
      end
    else
      if ChangeValue > 1 then
        self.Text_ScoreNum:SetText("+" .. ChangeValue)
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Add)
      elseif ChangeValue < -1 then
        self.Text_ScoreNum:SetText(ChangeValue)
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Point_Minus)
      end
      self.CurTime = Time
      if Time >= 0 then
        self.Text_ScoreNum:SetText(self:GetTimeStr(Time))
      end
    end
    self:CheckStar()
  end
end

function M:ConstructInfo()
  self:InitListenEvent()
  self:InitInfo()
end

function M:GetCurrentScore()
  local Points = 0
  if self.TempleInfo.SucRule == "CountDown" then
    if 1 == self.TempleInfo.UIShowType then
      Points = self.TimeThreshold - self.CurTime
    else
      Points = self.CurTime
    end
  elseif self.TempleInfo.SucRule == "Score" or self.TempleInfo.SucRule == "Collect" then
    Points = self.ScoreOrCollect
  else
    Points = self.TimeThreshold - self.CurTime
  end
  return Points
end

function M:OnUpdatePartyRightUI(CompletionRate, Rank, TotalNum)
  if self.Group_Score:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
    self.Group_Score:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.GameState = UE4.UGameplayStatics.GetGameState(self)
    self.TimeThreshold = self.GameState.PartyTimerThreshold
    if self.IsStarParty then
      for i = 3, 1, -1 do
        local TextInfo = ""
        local Target = self.TempleInfo.RatingRange[i]
        if self.TempleInfo.SucRule == "Parkour" then
          TextInfo = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_1"), self.TimeThreshold - Target)
        end
        self["TempleItem_" .. i]:SetTargetInfo(TextInfo)
      end
    end
    if self.TempleInfo.SucRule == "Parkour" then
      self.Group_TempleGoal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      AudioManager(self):PlayUISound(self, "event:/ui/common/multi_player_challenge_score_panel_show", nil, nil)
      self.PartyStarUIStart = true
      self.CurStar = 3
      for i = 1, 3 do
        self["TempleItem_" .. i]:PlayStarAnimation(false)
      end
      self.Text_ScoreTitle:SetText(GText("UI_TEMPLE_TOTAL_COUNTDOWN"))
      self.Text_ScoreNum:SetText(self:GetTimeStr(self.TimeThreshold))
      self:PlayAnimation(self.Rank_In)
    end
  end
  self.Text_CompletionRateNum:SetText(self:GetCompletionRate(CompletionRate) .. "%")
  self.Text_RankNum:SetText(Rank .. "/" .. TotalNum)
end

function M:GetCompletionRate(CompletionRate)
  if CompletionRate < 0 then
    return 0
  end
  local PercentValue = math.floor(CompletionRate * 100)
  if PercentValue > 100 then
    PercentValue = 100
  end
  return PercentValue
end

function M:SwitchStarType()
  for i = 1, 3 do
    local ButtonIconPath_Star = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge.T_Activity_Temple_Solo_Star_Challenge'"
    local Tex_Star = LoadObject(ButtonIconPath_Star)
    local ButtonIconPath_Empty = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge_Empty.T_Activity_Temple_Solo_Star_Challenge_Empty'"
    local Tex_Empty = LoadObject(ButtonIconPath_Empty)
    self["TempleItem_" .. i].Image_Star:SetBrushFromTexture(Tex_Star)
    self["TempleItem_" .. i].Image_Empty:SetBrushFromTexture(Tex_Empty)
  end
end

return M
