local msgpack = require("msgpack_core")
local Component = {}

function Component:_GetParamentsTable(_Data)
  local ParamentsTable
  if _Data.EffectId then
    local EffectInfo = DataMgr.SkillEffects[_Data.EffectId]
    if EffectInfo then
      ParamentsTable = EffectInfo.TaskEffects[_Data.Index] or {}
    end
    _Data.Index = nil
    _Data.EffectId = nil
  end
  return ParamentsTable
end

function Component:ExecuteEffectResults(EffectStruct)
  local Str = EffectStruct:GetResult()
  if not Str then
    return
  end
  local Result = msgpack.unpack(Str)
  self.ClientExec = true
  for _, _Data in pairs(Result) do
    local ParamentsTable = self:_GetParamentsTable(_Data)
    for _, Args in pairs(_Data) do
      for Func, Content in pairs(Args) do
        local f = self["Play_" .. Func]
        assert(f, "\228\184\141\229\173\152\229\156\168\229\135\189\230\149\176:Play_" .. Func)
        f(self, Content, ParamentsTable)
      end
    end
  end
  self.ClientExec = false
end

function Component:Play_CutToughness(Content, ParamentsTable)
  local Source = self:GetEntity(Content.SourceEid)
  local CauseHit = Content.CauseHit
  local CutTnEffectParams = UE4.FCutTNEffectParams()
  CutTnEffectParams.Value = ParamentsTable.Value
  CutTnEffectParams.bForceHit = ParamentsTable.ForceHit
  CutTnEffectParams.HitRule = ParamentsTable.CauseHit
  CutTnEffectParams.NotRotateWhenHit = ParamentsTable.NotRotateWhenHit
  if CauseHit then
    local HitRule = DataMgr.HitPerformanceData[CauseHit]
    for Index, TargetEid in ipairs(Content.HitTargets) do
      local CauseHitType = Content.CauseHitTypes[Index]
      local HitType = Content.HitTypes[Index]
      if TargetEid and CauseHitType and HitType then
        local Target = self:GetEntity(TargetEid)
        if not Target then
        else
          Target:ApplyEffectHitPerformance_Cpp(Source, HitType, CauseHitType, CutTnEffectParams)
        end
      end
    end
    if Content.DeadTargets then
      self:AddRadialForceForDead(Source, HitRule, Content.DeadTargets)
    end
  end
end

function Component:Play_GatherTargets(Content, ParamentsTable)
  local Source = self:GetEntity(Content.SourceEid)
  if not Source then
    return
  end
  local HitTargets = Content.HitTargets
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target then
      Target:GatherToSource(Source, ParamentsTable.GatherPoint, ParamentsTable.TargetSocketName, ParamentsTable.GatherSpeed, ParamentsTable.StopDistance, ParamentsTable.Acceleration)
    end
  end
end

function Component:Play_PlaySE(Content, ParamentsTable)
  local SourceEid = Content.SourceEid
  local Source = self:GetEntity(SourceEid)
  if not Source then
    return
  end
  if Content.ExtraParams and Content.ExtraParams.SceneSe then
    Source:ApplyHitPerformSe(Source, ParamentsTable, Content.ExtraParams)
  end
  local HitTargets = Content.HitTargets
  if not HitTargets then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target then
      Target:ApplyHitPerformSe(Source, ParamentsTable, Content.ExtraParams)
    end
  end
end

function Component:Play_SkillMove(Content, ParamentsTable)
  local HitTargets = Content.HitTargets
  for _, Eid in pairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target then
      if ParamentsTable.DisableRootMotion then
        Target:DisableRootMotion(ESourceTags.SkillMove)
      end
      local MoveX = ParamentsTable.MoveX or 0
      local MoveY = ParamentsTable.MoveY or 0
      local MoveZ = ParamentsTable.MoveZ or 0
      if ParamentsTable.CanSkillRangeModify then
        local SkillRangeModity = Target:GetAttrByConstrain(EAttrName.SkillRange)
        MoveX = MoveX * SkillRangeModity
        MoveY = MoveY * SkillRangeModity
        MoveZ = MoveZ * SkillRangeModity
      end
      Target:SetMoveInfo_Lua(ESourceTags.SkillMove, ParamentsTable.TotalTime, MoveX, MoveY, MoveZ)
      Target:AddTimer_Combat(ParamentsTable.TotalTime, function()
        if not UKismetSystemLibrary.IsValid(Target) then
          return
        end
        if ParamentsTable.DisableRootMotion then
          Target:EnableRootMotion(ESourceTags.SkillMove)
        end
        Target:ClearMoveInfo_Lua(ESourceTags.SkillMove)
      end, false, 0)
    end
  end
end

function Component:Play_Disarm(Content, ParamentsTable)
  local DisarmParam = Content.DisarmParam
  local Source = self:GetEntity(Content.SourceEid)
  if not Source then
    return
  end
  for i, Param in ipairs(DisarmParam) do
    local Target = self:GetEntity(Param.Eid)
    if Target and Param.DisarmHitMontage then
      local HitLogicComp = Target:GetOrAddHitLogicComp()
      if HitLogicComp and HitLogicComp:_GetHitMontage(Param.DisarmHitMontage) then
        local HitParams = UE4.FHitParams()
        HitParams.CauseHitName = "LightHit"
        HitParams.CauseHitType = Const.CauseHitTypeNormal
        HitParams.OverrideMontageSuffix = Param.DisarmHitMontage
        Target:ProcessHit("LightHit", Source, HitParams)
      end
    end
  end
end

return Component
