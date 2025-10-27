require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.ActiveBossUINum = 0
  self.Boss_1:SetVisibility(ESlateVisibility.Collapsed)
  self.Boss_2:SetVisibility(ESlateVisibility.Collapsed)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local BattleMain = UIManager and UIManager:GetUIObj("BattleMain")
  if BattleMain and BattleMain.Pos_Boss_DoubleLifeBar then
    BattleMain.Pos_Boss_DoubleLifeBar:AddChildToOverlay(self)
  end
end

function M:OnBossDead(Index)
  self.ActiveBossUINum = self.ActiveBossUINum - 1
  if self.ActiveBossUINum <= 0 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    if UIManager then
      UIManager:UnLoadUINew("DoubleBossBlood")
    end
  end
end

function M:ActiveBossUI(Index)
  self.ActiveBossUINum = self.ActiveBossUINum + 1
end

return M
