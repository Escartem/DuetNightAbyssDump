require("UnLua")
local M = Class()

function M:GetConfig_NPC(Owner, Config)
  Config.bEnableSCO = true
  if IsDedicatedServer(Owner) and IsAuthority(Owner) then
    Config.bEnableURO = false
  else
    Config.bEnableURO = true
  end
  Config.bEnableSAO = true
  local UROSkipMap = TMap(0.0, 0)
  UROSkipMap:Add(0.003, 3)
  UROSkipMap:Add(0.002, 4)
  UROSkipMap:Add(0.001, 5)
  UROSkipMap:Add(5.0E-4, 8)
  Config.UROMap = UROSkipMap
  Config.bEnableTicklod = not Owner:IsInStory()
  Config.TickLodFlag = ETickObjectFlag.FLAG_ALL ~ ETickObjectFlag.FLAG_SKMESHCOMPONENT ~ ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT
  Config.bEnableHiddenBudget = true
  Config.bEnableMeshLODBudget = false
end

function M:GetConfig_All(Owner, Config)
  Config.bEnableSCO = true
  if IsDedicatedServer(Owner) and IsAuthority(Owner) then
    Config.bEnableURO = false
  else
    Config.bEnableURO = Owner:IsRealMonster() and not Owner:IsBossMonster() and true
  end
  Config.bEnableSAO = true
  local UROSkipMap = TMap(0.0, 0)
  UROSkipMap:Add(0.003, 3)
  UROSkipMap:Add(0.002, 4)
  UROSkipMap:Add(0.001, 5)
  UROSkipMap:Add(5.0E-4, 8)
  Config.UROMap = UROSkipMap
  Config.bEnableTicklod = not Owner.Data.DisableTicklod and not Owner:IsPhantom()
  Config.TickLodFlag = ETickObjectFlag.FLAG_ALL ~ ETickObjectFlag.FLAG_SKMESHCOMPONENT ~ ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT
  Config.bEnableEMBudget = false
  Config.bEnableMeshLODBudget = false
  Config.bEnableReplicatedOptimization = true
  Config.bEnableDynamicShadowBudget = true
  return Config
end

return M
