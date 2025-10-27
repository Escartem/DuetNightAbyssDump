require("UnLua")
local AIBattleMgr = Class()
AIBattleMgr._components = {
  "BluePrints.GameMode.Components.AIAlertComponent",
  "BluePrints.GameMode.Components.DivisionComponent"
}

function AIBattleMgr:AIBattleMgrReceiveBeginPlay()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self:ComponentReceiveBeginPlay()
end

function AIBattleMgr:InitAIBattleMgr()
  self:InitComponent()
  self:ResetRVOParams()
end

function AIBattleMgr:InitComponent()
end

function AIBattleMgr:TickAIBattleMgr(DeltaSeconds)
  if self:GetPlayerNum() <= 0 then
    return
  end
  self.LocAdjustComponent:Tick(DeltaSeconds)
  self:TickComponent(DeltaSeconds)
end

function AIBattleMgr:ResetRVOParams()
  local DefaultTimeToLive = DataMgr.RVOData.DefaultTimeToLive.ParamValue[1]
  local LockTimeAfterAvoid = DataMgr.RVOData.LockTimeAfterAvoid.ParamValue[1]
  local LockTimeAfterClean = DataMgr.RVOData.LockTimeAfterClean.ParamValue[1]
  local DeltaTimeToPredict = DataMgr.RVOData.DeltaTimeToPredict.ParamValue[1]
  local ArtificialRadiusExpansion = DataMgr.RVOData.ArtificialRadiusExpansion.ParamValue[1]
  local HeightCheckMargin = DataMgr.RVOData.HeightCheckMargin.ParamValue[1]
  self:ResetAvoidanceManagerParams(DefaultTimeToLive, LockTimeAfterAvoid, LockTimeAfterClean, DeltaTimeToPredict, ArtificialRadiusExpansion, HeightCheckMargin)
end

AssembleComponents(AIBattleMgr)
return AIBattleMgr
