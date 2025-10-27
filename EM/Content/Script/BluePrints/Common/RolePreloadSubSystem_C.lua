require("Unlua")
require("Const")
local AssetPathTable = require("Utils.PreloadAssetPath")
local M = Class()
local PIELoadLimit = false
local PIELoadLimitNum = 5
local bUseAssetPathStaticData = true
UE4.URolePreloadGameInstanceSubsystem.SetUseAssetPathStaticData(bUseAssetPathStaticData)
local DungeonPreloadOutTime = 15
UE4.URolePreloadGameInstanceSubsystem.SetDungeonPreloadOutTime(DungeonPreloadOutTime)

function M:Init_Lua()
  self:SetMaxAsyncLoadNum(15)
  self.DungeonAssetsPreloading = false
  self.DungeonAssetsPreloadFinishCb = nil
  self.OutTimeHandle = nil
end

function M:GetUseAssetPathStaticData()
  return bUseAssetPathStaticData
end

function M:EnableOptimization()
  return Const.EnableDungeonAssetsPreload
end

function M:EnablePIELimit()
  local IsPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self)
  return PIELoadLimit and IsPIE
end

function M:CacheDungeonPhantomAssets_Lua(UnitId)
  if not UnitId then
    return
  end
  local Paths = self:GetPathsTable()
  local BPMeshs = self:PreparePhantomAllBPMesh(UnitId)
  local Montages = self:CommonPrepareAllBattleMontage(EObjType.PhantomCharacter, UnitId)
  Paths = Paths + BPMeshs + Montages
  self:BuildDungeonRoleAssetRequest_Lua(UnitId, Paths)
end

function M:CommonPrepareMonSkillEffects(UnitId)
  local AllData = require("Utils.MonsterEffectsPath")
  if not AllData then
    return {}
  end
  local MonsterData = DataMgr.Monster[UnitId]
  if nil == MonsterData then
    return {}
  end
  UnitId = MonsterData.BattleRoleId
  local RetPathTable = {}
  if AllData[UnitId] and not IsEmptyTable(AllData[UnitId]) then
    for _, v in pairs(AllData[UnitId]) do
      local EffectPath = DataMgr.VisualEffect[v]
      if EffectPath and EffectPath.EffectPath then
        table.insert(RetPathTable, FEMLoadPath(EffectPath.EffectPath))
      end
    end
  end
  return RetPathTable
end

function M:CommonPreparePlayerSkillEffects(UnitId)
  local AllData = require("Utils.PlayerEffectsPath")
  if not AllData then
    return {}
  end
  local RetPathTable = {}
  local EffectsTable = AllData[UnitId]
  if EffectsTable and not IsEmptyTable(EffectsTable) then
    for _, v in ipairs(EffectsTable) do
      table.insert(RetPathTable, FEMLoadPath(v))
    end
  end
  return RetPathTable
end

function M:CommonPrepareAllMontage(ObjType, UnitId)
  local ModelData = self:GetModelData(ObjType, UnitId)
  if nil == ModelData then
    return {}
  end
  if not ModelData.MontageFolder then
    return {}
  end
  local MontageFolder = ModelData.MontageFolder
  local AssetStringIndex = UE4.UKismetStringLibrary.FindSubstring(MontageFolder, "Asset/")
  MontageFolder = UE4.UKismetStringLibrary.GetSubstring(MontageFolder, AssetStringIndex, UE4.UKismetStringLibrary.Len(MontageFolder))
  local _, Paths = self.GetFolderAssetPaths(MontageFolder)
  return Paths:ToTable()
end

function M:CommonPrepareAllExceptBattleMontage(ObjType, UnitId)
  return {}
end

function M:GetModelData(ObjType, UnitId)
  if ObjType == EObjType.MonsterCharacter then
    local Data = DataMgr.Monster[UnitId]
    local ModelData = DataMgr.Model[Data.ModelId]
    return ModelData
  elseif ObjType == EObjType.PhantomCharacter then
    local PhantomData = DataMgr.Phantom[UnitId]
    local PhantomRoleInfo = DataMgr.BattleChar[PhantomData.BattleRoleId]
    local ModelData = DataMgr.Model[PhantomRoleInfo.ModelId]
    return ModelData
  elseif ObjType == EObjType.PlayerCharacter then
    local PlayerRoleInfo = DataMgr.BattleChar[UnitId]
    local ModelData = DataMgr.Model[PlayerRoleInfo.ModelId]
    return ModelData
  elseif ObjType == EObjType.NpcCharacter then
    local NpcData = DataMgr.Npc[UnitId]
    local ModelData = NpcData and NpcData.ModelId and DataMgr.Model[NpcData.ModelId]
    return ModelData
  else
    return nil
  end
end

function M:GetPathsTable()
  local Paths = setmetatable({}, {
    __add = function(Paths, newtable)
      for i = 1, #newtable do
        table.insert(Paths, #Paths + 1, newtable[i])
      end
      return Paths
    end
  })
  return Paths
end

function M:CacheDungeonGameAssetsOuter_Test(FinishCallback)
  self.DungeonAssetsPreloading = true
  self.DungeonAssetsPreloadFinishCb = FinishCallback
  self.LoadingUnitNum = 0
  self.DungeonLoadingRequests = {}
  self:EnableLimitLoadNum(false)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.Players = GameState and GameState:GetAllPlayer():ToTable()
  if self.Players then
    for _, PlayerCharacter in pairs(self.Players) do
      self:PreloadPlayerAssets(PlayerCharacter)
      self:PreloadSummonAssets(PlayerCharacter.CurrentRoleId)
    end
  else
    DebugPrint("CacheDungeonGameAssetsOuter  Can Not Find PlayerInfo!!!!!!!!!!!!!!!")
  end
  local MonsterIds = {7002001, 7003001}
  if MonsterIds and #MonsterIds > 0 then
    for i = 1, #MonsterIds do
      self:CacheDungeonMonsterAssets_Lua(MonsterIds[i], true)
    end
  end
  if self.OutTimeHandle then
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.OutTimeHandle)
    self.OutTimeHandle = nil
  end
  
  local function OutTimeFunc()
    GWorld.logger.errorlog("wzj- \229\137\175\230\156\172\232\181\132\230\186\144\233\162\132\229\138\160\232\189\189\232\182\133\230\151\182, \232\182\133\230\151\182\230\151\182\233\151\180:" .. DungeonPreloadOutTime .. "\231\167\146")
    self:PreloadDungeonGameAssetsFinished_Lua()
  end
  
  self.OutTimeHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({self, OutTimeFunc}, DungeonPreloadOutTime, false, 0)
  self:ConsumeDungeonRoleAssetRequest_Lua()
  return true
end

return M
