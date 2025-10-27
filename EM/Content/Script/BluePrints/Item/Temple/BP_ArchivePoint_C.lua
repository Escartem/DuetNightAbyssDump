local M = Class("BluePrints.Item.BP_CombatItemBase_C")
M.UseTimes = 0

function M:OnPlayerEnter(Player)
  self.IsEntering = true
  if true == self.HasEntered then
    return
  end
  self.HasEntered = true
  self.IsArchivePointActive = true
  self.UseTimes = self.UseTimes + 1
  DebugPrint(Player:GetName(), "Player Enter ArchivePoint =============================")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local TempleGameMode = GameMode:GetDungeonComponent().GameMode
  if nil ~= TempleGameMode then
    DebugPrint("==============TriggerGameModeEvent: OnStageStart====================")
    GameMode:TriggerGameModeEvent("OnStageStart", self.ArchiveID, self.UseTimes)
    self:OnFX()
  else
    self:AddTimer(0.1, function()
      local TempleGameMode = GameMode:GetDungeonComponent().GameMode
      if nil ~= TempleGameMode then
        DebugPrint("==============TriggerGameModeEvent: OnStageStart==Delay==================")
        GameMode:TriggerGameModeEvent("OnStageStart", self.ArchiveID, self.UseTimes)
        self:OnFX()
        self:RemoveTimer("OnStageStart")
      else
        DebugPrint("==============TriggerGameModeEvent: OnStageStart==Wait==================")
      end
    end, true, 0, "OnStageStart", true)
  end
end

function M:OnPlayerLeave(Player)
  self.IsEntering = false
end

function M:OnFX()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:ArchiveShowFX()
  end
end

function M:ResetInfo()
  if self.IsEntering == true then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    DebugPrint("============ResetInfo==TriggerGameModeEvent: OnStageStart====================")
    GameMode:TriggerGameModeEvent("OnStageStart", self.ArchiveID)
    self:OnFX()
    return
  end
  self.UseTimes = 0
  self.HasEntered = false
  self.IsArchivePointActive = false
  self:OnFXClose()
  DebugPrint("==============================================OnFXClose=====MaxArchiveID,self.ArchiveID", "nil", self.ArchiveID)
end

return M
