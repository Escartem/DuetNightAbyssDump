local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
M._components = {
  "BluePrints.UI.Settlement.DungeonSettlementComponent"
}

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.BattleInfo, self.Callback = ...
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not self.BattleInfo then
    return
  end
  local Describe = ""
  if Avatar:IsInDungeon() then
    local DungeonInfo = self:GetDungeonInfo(self.BattleInfo)
    Describe = self:GetDungeonName(DungeonInfo)
  elseif Avatar:IsInHardBoss() then
    Describe = GText(DataMgr.HardBossMain[self.BattleInfo.HardBossId].HardBossName)
  end
  self.Text_Describe:SetText(DungeonName)
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.EndReminder
  })
  self:PlayAnimation(self.Out)
end

function M:EndReminder()
  if self.Callback then
    self.Callback()
  end
  self:Close()
end

AssembleComponents(M)
return M
