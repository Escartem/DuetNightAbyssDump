require("Unlua")
local M = Class("BluePrints.Item.MiniGame.BP_MiniGame_C")

function M:GetMonsterAnimTrans()
  return self.MonsterPosition:K2_GetComponentToWorld()
end

function M:TriggerFunctionOnSelf()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if self.IsGameSuccess or self.AlwaysSuccess then
    if GameMode:IsInDungeon() and GameMode:DungeonCheckCanExitAlert() then
      GameMode:TriggerActiveGameModeState(Const.ExitStateAlert)
      self:ChangeState("Manual", 0, self.Data.FirstStateId)
      self.OpenState = false
      return
    end
    if GameMode:IsInRegion() and GameMode:RegionCheckCanExitAlert(self.ClanId) then
      local ClanMgr = GameMode:GetClan(self.ClanId)
      if not ClanMgr then
        return
      end
      ClanMgr:ExitAlert()
    end
  end
end

function M:GetCanOpen()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState:IsInDungeon() then
    if GameState:GetGameModeState() == EGameModeState.ERunning then
      self.CanOpen = false
    else
      self.CanOpen = GameState:GetInCommonAlert()
    end
    return
  end
  if GameState:IsInRegion() then
    self.CanOpen = UE4.UGameplayStatics.GetGameMode(self):RegionCheckCanExitAlert(self.ClanId)
    return
  end
end

return M
