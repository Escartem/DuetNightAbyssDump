require("UnLua")
local M = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.CurTime = 0
end

function M:AddTaskToOverlay(BattleMainUI)
  self.Super.AddTaskToOverlay(self, BattleMainUI)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return
  end
  local DungeonId = GameInstance:GetCurrentDungeonId()
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  if DungeonInfo.DungeonType == "Temple" then
    BattleMainUI:SetOverrideInfo(BattleMainUI.SizeMap_Normal, BattleMainUI.Task_Normal)
  elseif DungeonInfo.DungeonType == "Party" then
    BattleMainUI:SetOverrideInfo(BattleMainUI.SizeMap_MutTemple, BattleMainUI.Task_MutTemple)
  end
  BattleMainUI.RetainerBox_0:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.OnSetTempleLimit, self, self.OnSetTempleLimit)
  self:AddDispatcher(EventID.OnTempleTimeChanged, self, self.OnTempleTimeChanged)
  self:AddDispatcher(EventID.OnTempleEnter, self, self.OnTempleEnter)
  self:AddDispatcher(EventID.OnUpdatePartyLeftUI, self, self.OnUpdatePartyLeftUI)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  EventManager:FireEvent(EventID.OnTempleRightUI)
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
    self:InitTemple()
  elseif self.DungeonInfo.DungeonType == "Party" then
    self.TempleInfo = DataMgr.Party[self.DungeonId]
    if self.TempleInfo.SucRule == "Parkour" then
      EventManager:FireEvent(EventID.OnPartyProgressStart)
    end
    self:InitParty()
  end
end

function M:InitTemple()
  self.IsCountDown = false
  if self.TempleInfo.SucRule == "CountDown" then
    self.IsCountDown = true
    self.HB_Time:SetVisibility(ESlateVisibility.Collapsed)
  elseif 1 == self.TempleInfo.UIHideFailCond then
    self.HB_Time:SetVisibility(ESlateVisibility.Collapsed)
    self:InitTargetInfo()
  else
    self.HB_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:InitTargetInfo()
  end
  self.Combo = UIManager(self):GetUIObj("BattleCombo")
  if self.Combo ~= nil and 1 == self.TempleInfo.UIHideCombo then
    self.Combo:SetRenderOpacity(0)
  end
  local UIBattleMain = UIManager(self):GetUI("BattleMain")
  if UIBattleMain then
    self:AddTimer(1, function()
      UIBattleMain.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
    end, false, nil, nil, false)
  end
end

function M:InitParty()
  self.IsCountDown = false
  self.HB_Time:SetVisibility(ESlateVisibility.Collapsed)
  self:InitPartyTargetInfo()
  self.Combo = UIManager(self):GetUIObj("BattleCombo")
  if self.Combo ~= nil and 1 == self.TempleInfo.UIHideCombo then
    self.Combo:SetRenderOpacity(0)
  end
  self.Text_Time:SetText(self:GetTimeStr(0))
  local UIBattleMain = UIManager(self):GetUI("BattleMain")
  if UIBattleMain then
    self:AddTimer(1, function()
      UIBattleMain.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
    end, false, nil, nil, false)
  end
end

function M:OnTempleTimeChanged(CurrentTime, ThresholdTime)
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
end

function M:OnSetTempleLimit(Limit, Value)
  self.Limit = Limit
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

function M:InitTargetInfo()
  local TextRule2 = ""
  if self.TempleInfo.SucRule == "Time" then
    TextRule2 = "SECONDS"
  elseif self.TempleInfo.SucRule == "CountDown" then
    TextRule2 = "SECONDS"
  elseif self.TempleInfo.SucRule == "Score" then
    TextRule2 = "SCORE"
  elseif self.TempleInfo.SucRule == "Collect" then
    TextRule2 = "COUNT"
  end
  self.Text_TempleTitle:SetText(GText("DUNGEON_NAME_" .. self.DungeonId))
  self.Text_TempleDescTitle:SetText(GText("UI_TEMPLE_" .. self.DungeonId))
  if 1 == self.TempleInfo.UIHideDes then
    self.Text_TempleDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_TempleDesc:SetText(GText("UI_TEMPLE_DES_" .. self.DungeonId))
  end
end

function M:InitPartyTargetInfo()
  self.Text_TempleTitle:SetText(GText("DUNGEON_NAME_" .. self.DungeonId))
  self.Text_TempleDescTitle:SetText(GText("UI_PARTY_" .. self.DungeonId))
  self.Text_TempleDesc:SetText(GText("UI_PARTY_DES_" .. self.DungeonId))
end

function M:OnTempleEnter()
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Point_Add)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Point_Minus)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Time_Add)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Time_Minus)
end

function M:OnUpdatePartyLeftUI(Time)
  self.Text_Time:SetText(self:GetTimeStr(Time))
end

return M
