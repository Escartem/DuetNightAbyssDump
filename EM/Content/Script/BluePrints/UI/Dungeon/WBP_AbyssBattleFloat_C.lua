require("UnLua")
local WBP_AbyssBattleFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_AbyssBattleFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_AbyssBattleFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.OnRepAbyssBattleCount, self, self.OnRepAbyssBattleCount)
end

function WBP_AbyssBattleFloat_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self.GameState = UE4.UGameplayStatics.GetGameState(self)
  self:OnRepAbyssBattleCount()
  self:SetAbyssBattleVisibility(false)
  self:PlayAnimation(self.In)
end

function WBP_AbyssBattleFloat_C:InitAbyssBattleDisplayText(DisplayText, IsShowBar)
  if "" == DisplayText then
    self.Text_AnnihilateTitle:SetText(GText("DUNGEON_EXTERMINATE_100"))
  else
    self.Text_AnnihilateTitle:SetText(GText(DisplayText))
  end
  if IsShowBar then
    self.Overlay_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Overlay_Bar:SetVisibility(UE4.ESlateVisibility.Hidden)
  end
  self:ResetToDefaultState()
end

function WBP_AbyssBattleFloat_C:OnRepAbyssBattleCount()
  if not self.GameState then
    return
  end
  local MaxNum = self.GameState.AbyssBattleMaxNum or 1
  local Count = self.GameState.AbyssBattleCount or 0
  self.Text_AnnihilateNum:SetText(Count .. "/" .. MaxNum)
  self.Progress_Annihilate:SetPercent(Count / MaxNum)
  if MaxNum <= Count then
    self:PlayAnimation(self.Complete)
    self.Group_Full:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_AbyssBattleFloat_C:ResetToDefaultState()
  self.Group_Full:SetVisibility(UE4.ESlateVisibility.Hidden)
end

function WBP_AbyssBattleFloat_C:SetAbyssBattleVisibility(IsShow)
  if IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_AbyssBattleFloat_C
