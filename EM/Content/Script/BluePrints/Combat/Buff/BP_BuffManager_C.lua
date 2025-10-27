require("UnLua")
local BP_BuffManager_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Combat.Buff.BuffsChanged"
})
local FBuffArray = UE.FBuffArray

function BP_BuffManager_C:Initialize(Initializer)
  if BP_BuffManager_C.BuffPropertys then
    return
  end
  BP_BuffManager_C.BuffPropertys = {}
  local LuaOverrideBuffProperties = TArray(0)
  local OverrideProperties = BP_BuffManager_C.GetOverrideProperties()
  local BuffPropNameTable = DataMgr.BuffConverts.BuffPropNameTable
  for Index, Value in ipairs(OverrideProperties) do
    if BP_BuffManager_C["OnBuffsChanged_" .. Value] then
      local BuffPropId = BuffPropNameTable[Value]
      LuaOverrideBuffProperties:Add(BuffPropId)
      BP_BuffManager_C.BuffPropertys[BuffPropId] = BP_BuffManager_C["OnBuffsChanged_" .. Value]
    end
  end
  require("EMLuaConst").LuaOverrideBuffProperties = LuaOverrideBuffProperties
end

function BP_BuffManager_C:ReceiveBeginPlay()
  self.Owner = self:GetOwner()
end

function BP_BuffManager_C:InitBPVarsForBuff(Buff)
  local BuffConfig = DataMgr.Buff[Buff.BuffId]
  if BuffConfig and BuffConfig.BPVars then
    for VarName, Value in pairs(BuffConfig.BPVars) do
      Buff[VarName] = Value
    end
  end
end

function BP_BuffManager_C:OnBuffsChanged_New(BuffPropertiesInfo)
  BuffPropertiesInfo = BuffPropertiesInfo:ToTable()
  local BuffPropNameTable = DataMgr.BuffConverts.BuffPropNameTable
  for Index, Info in ipairs(BuffPropertiesInfo) do
    local PropId = Info.BuffPropId
    if BP_BuffManager_C.BuffPropertys[PropId] then
      local PropName = BuffPropNameTable[Info.BuffPropId]
      local AllInfo = {}
      for i = 1, Info.BuffIds:Num() do
        local BuffId = Info.BuffIds:Get(i)
        local BuffConfigInfo = DataMgr.Buff[BuffId][PropName]
        table.insert(AllInfo, {BuffId, BuffConfigInfo})
      end
      BP_BuffManager_C.BuffPropertys[PropId](self, AllInfo)
    end
  end
end

function BP_BuffManager_C:GetBuffsSnapshot()
  local Now = UE4.UGameplayStatics.GetTimeSeconds(self)
  local BuffsSnapshot = {}
  for _, Buff in pairs(self.Buffs) do
    local ShouldRecord = true
    local BuffTypes = Buff:GetBuffType()
    ShouldRecord = ShouldRecord and not Buff.IsReadyKill
    ShouldRecord = ShouldRecord and Buff.SourceEid == self.Owner.Eid
    ShouldRecord = ShouldRecord and BuffTypes:Contains(Const.RougeLikeBuff) == true
    if ShouldRecord then
      local BuffRecord = {}
      BuffRecord.BuffId = Buff.BuffId
      BuffRecord.LastTime = Buff.LeftTime
      BuffRecord.bForever = Buff.bForever
      BuffRecord.Layer = Buff.Layer
      BuffRecord.FreeLayer = Buff.FreeLayer
      BuffRecord.Value = Buff.Value
      if Buff.MergeRule2 == UE4.EBuffMergeRule2.MergeRule_NewFree then
        local FreeLayerInfos = {}
        local BuffFreeLayers = Buff:GetFreeLayers()
        local LayerNum = BuffFreeLayers:Num()
        for i = 1, LayerNum do
          local FreeLayer = BuffFreeLayers:GetRef(i)
          if FreeLayer.SourceEid == self.Owner.Eid then
            table.insert(FreeLayerInfos, {
              Value = FreeLayer.Value,
              LastTime = FreeLayer.StartTime + FreeLayer.LastTime - Now,
              bForever = FreeLayer.bForever
            })
          end
        end
        BuffRecord.FreeLayerInfos = FreeLayerInfos
      end
      table.insert(BuffsSnapshot, BuffRecord)
    end
  end
  return BuffsSnapshot
end

function BP_BuffManager_C:HasDestructParts(Invincible, CurrentLockHp)
  self.Owner.BillBoardComponent:OnBuffChange_LockHp(Invincible, nil, CurrentLockHp)
end

return BP_BuffManager_C
