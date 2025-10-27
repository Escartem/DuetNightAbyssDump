require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  EventManager:AddEvent(EventID.OnCanonScoreAdd, self, self.AddScore)
  self:SetDungeonId()
  self.ContinueTime = 1.5
  self.CountDownNum = 3
  self.JitterEndTime = self.Text_AddNum_Jitter:GetEndTime()
  local PaotaiMiniGame = DataMgr.PaotaiMiniGame or {}
  if PaotaiMiniGame[self.DungeonId] then
    self.Text_FortTitle:SetText(GText(PaotaiMiniGame[self.DungeonId].DungeonName))
  end
  self.Text_Num:SetText(self.Id)
  self.Text_TaskInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Score:SetText(GText("PaotaiGame_PresentScore"))
  self:HideTaskBar()
  self:HideFortBack()
  self:HideCharLevelUp()
  self:InitEsc()
  self:SetSorceInfo()
  self:PlayInAnimation()
  self:StartCountDown()
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnCanonScoreAdd, self)
  self:RemoveTimer("CanonTimer")
  self:RemoveTimer("CanonPlayOutAnimation")
  self:RemoveTimer("CanonBegionCountDown")
end

function M:Init(Parent)
  self.Parent = Parent
  self.Parent:HideSelf(true)
  self.Parent:HidePaotaiName(true)
end

function M:SetDungeonId()
  self.Id = nil
  self.DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local PaotaiMiniGame = DataMgr.PaotaiMiniGame or {}
  if PaotaiMiniGame[self.DungeonId] then
    self.Id = PaotaiMiniGame[self.DungeonId].Id
  end
end

function M:SetSorceInfo()
  self.Num_Score:SetText(0)
  if self.DungeonId then
    local PaotaiMiniGame = DataMgr.PaotaiMiniGame
    local Info = PaotaiMiniGame[self.DungeonId]
    for Index, Des in pairs(Info.LeveDes) do
      self["WBP_Dungeon_TempleItem_" .. Index].Level = Info.Level[Index]
      self["WBP_Dungeon_TempleItem_" .. Index]:SetTargetInfo(string.format(GText(Des), Info.Level[Index]))
    end
  end
end

function M:SetTimer()
  if self.DungeonId then
    local PaotaiMiniGame = DataMgr.PaotaiMiniGame
    local Info = PaotaiMiniGame[self.DungeonId]
    self.SumTime = Info.TotalTime
    self.RemainTime = self.SumTime
    self:SetTime(self.RemainTime)
    self:AddTimer(1, self.RefreshTime, true, 0, "CanonTimer", false)
  end
end

function M:SetTime(Time)
  if Time >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(Time))
    self.Text_Time:SetText(TimeStr)
  end
end

function M:RefreshTime()
  self.RemainTime = self.RemainTime - 1
  if self.RemainTime < 0 then
    self.RemainTime = 0
  end
  self:SetTime(self.RemainTime)
  if 0 == self.RemainTime then
    EventManager:FireEvent(EventID.EndCanonMiniGame)
    self:RemoveTimer("CanonTimer")
  end
end

function M:PlayInAnimation()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnimation()
  self:PlayAnimation(self.Out)
end

function M:StartCountDown()
  self:InitializeData(self.CountDownNum)
  self:AddTimer(self.CountDownNum, function()
    self:PlayOutAnimation()
    self.Parent:HideSelf(false)
    self:SetTimer()
    EventManager:FireEvent(EventID.CanonBegionCountFinish)
  end, false, 0, "CanonPlayOutAnimation", false)
end

function M:InitializeData(Duration)
  if self.TimerHandle then
    self:RemoveTimer("CanonBegionCountDown", false)
    self.TimerHandle = nil
  end
  self.TimerHandle = self:AddTimer(1, self.CountDownTick, true, 0, "CanonBegionCountDown", false)
  self.CountDownTime = math.floor(Duration - 1)
  self.CountDown.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown", nil, nil)
end

function M:CountDownTick()
  self.CountDownTime = math.floor(self.CountDownTime - 1)
  self.CountDown.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  if 0 == self.CountDownTime then
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown_end", nil, nil)
    self:OnCountDownEnd()
  elseif self.CountDownTime > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown", nil, nil)
  end
end

function M:OnCountDownEnd()
  self:RemoveTimer("CanonBegionCountDown", false)
  self.TimerHandle = nil
end

function M:AddScore(TotalScore, Score)
  if Score > 0 then
    self.Num_Score:SetText(TotalScore)
    if self:IsAnimationPlaying(self.Text_AddNum_In) then
      self:SetTimerAddScoreTimer()
    else
      if self:IsAnimationPlaying(self.Text_AddNum_Out) then
        self:StopAnimation(self.Text_AddNum_Out)
      end
      self:PlayAnimation(self.Text_AddNum_In)
      self:SetTimerAddScoreTimer()
    end
    self:TryToPlayJitterAnimation(Score)
    for Index = 1, 3 do
      self:RefreshStar(TotalScore, Index)
    end
  end
end

function M:SetTimerAddScoreTimer()
  self:AddTimer(self.ContinueTime, function()
    self:PlayAnimation(self.Text_AddNum_Out)
  end, false, 0, "AddScoreTimer", false)
end

function M:TryToPlayJitterAnimation(Score)
  if self:IsAnimationPlaying(self.Text_AddNum_Jitter) then
    local CurTime = self:GetAnimationCurrentTime(self.Text_AddNum_Jitter)
    if CurTime > 0.1 then
      self:PlayAnimation(self.Text_AddNum_Jitter)
      self.AddedScore = Score
    else
      self.AddedScore = self.AddedScore + Score
    end
  else
    self:PlayAnimation(self.Text_AddNum_Jitter)
    self.AddedScore = Score
  end
  self.Text_AddNum:SetText("+" .. self.AddedScore)
end

function M:InitEsc()
  self.Btn_Esc.bForceInvisible = nil
  self.Btn_Esc.Btn_top.OnClicked:Add(self, self.OpenEsc)
  self.Btn_Esc:LoadImage(11)
end

function M:OpenEsc()
  UIUtils.OpenEsc()
end

function M:RefreshStar(Score, Index)
  local StarItem = self["WBP_Dungeon_TempleItem_" .. Index]
  Score = Score or 0
  if not StarItem.StarLight and Score >= StarItem.Level then
    StarItem.StarLight = true
    if StarItem:IsPlayingAnimation(StarItem.Normal) then
      StarItem:StopAnimation(StarItem.Normal)
    end
    StarItem:PlayStarAnimation()
  end
end

function M:HideTaskBar()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if BattleMain then
    BattleMain.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:HideFortBack()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if BattleMain then
    BattleMain.Pos_FortBack:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:HideCharLevelUp()
  local CharLevelUpUI = UIManager(self):GetUIObj("CharLevelUp")
  if CharLevelUpUI then
    CharLevelUpUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
