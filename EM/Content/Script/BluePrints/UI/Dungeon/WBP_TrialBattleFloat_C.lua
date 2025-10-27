require("UnLua")
local M = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
end

function M:InitListenEvent()
  self.Super.InitListenEvent(self)
  DebugPrint("thy   InitListenEvent")
  self:AddDispatcher(EventID.OnRepTrialKilledNum, self, self.OnRepTrialKilledNum)
end

function M:SetTrialBattleVisibility(IsShow)
  if IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnRepTrialKilledNum()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.TrialKilledNum = GameState.TrialKilledNum
  self.TrialTotalNum = GameState.TrialTotalNum
  DebugPrint("thy     TrialKilledNum TrialTotalNum", TrialKilledNum, TrialTotalNum)
  self.Text_AnnihilateNum:SetText(self.TrialKilledNum .. "/" .. self.TrialTotalNum)
  self.Progress_Annihilate:SetPercent(self.TrialKilledNum / self.TrialTotalNum)
  if self.TrialKilledNum >= self.TrialTotalNum then
    DebugPrint("thy    RemoveDispatcher")
    self:PlayAnimation(self.Complete)
    self.Group_Full:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:RemoveDispatcher(EventID.OnRepTrialKilledNum)
  end
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self.GameState = UE4.UGameplayStatics.GetGameState(self)
  self.Text_AnnihilateTitle:SetText(GText("UI_CharTrial_TrialGoal"))
  self:OnRepTrialKilledNum()
  self:SetTrialBattleVisibility(false)
  self:PlayAnimation(self.In)
end

return M
