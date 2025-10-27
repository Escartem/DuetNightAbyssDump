require("UnLua")
require("DataMgr")
require("Utils")
local BP_FXComponent_C = Class()

function BP_FXComponent_C:PlayEffectByIDParams(EffectID, EffectParam)
  local PlayEffectParam = self:GetPlayEffectParams(EffectID)
  if EffectParam then
    if EffectParam.Location then
      if not EffectParam.UseAbsoluteLocation and not EffectParam.socket then
        PlayEffectParam.Location:Set(EffectParam.Location[1] + PlayEffectParam.Location.X, EffectParam.Location[2] + PlayEffectParam.Location.Y, EffectParam.Location[3] + PlayEffectParam.Location.Z)
      else
        PlayEffectParam.Location:Set(EffectParam.Location[1], EffectParam.Location[2], EffectParam.Location[3])
      end
    end
    if EffectParam.Rotation then
      if not EffectParam.UseAbsoluteLocation and not EffectParam.socket then
        PlayEffectParam.Rotation:Set(EffectParam.Rotation[2] + PlayEffectParam.Rotation.Pitch, EffectParam.Rotation[3] + PlayEffectParam.Rotation.Yaw, EffectParam.Rotation[1] + PlayEffectParam.Rotation.Roll)
      else
        PlayEffectParam.Rotation:Set(EffectParam.Rotation[2], EffectParam.Rotation[3], EffectParam.Rotation[1])
      end
    end
    if EffectParam.RandomRotation then
      PlayEffectParam.Rotation:Set(EffectParam.RandomRotation[2] + PlayEffectParam.Rotation.Pitch, EffectParam.RandomRotation[3] + PlayEffectParam.Rotation.Yaw, EffectParam.RandomRotation[1] + PlayEffectParam.Rotation.Roll)
    end
    if EffectParam.scale then
      PlayEffectParam.Scale:Set(EffectParam.scale[1], EffectParam.scale[2], EffectParam.scale[3])
    end
    local Attrs = {
      "UseAbsoluteLocation",
      "NotAttached",
      "AimSaveLoc",
      "AimFrom",
      "TargetEid",
      "IsUseParentScale",
      "FXSource",
      "SaveLocation"
    }
    for k, v in pairs(Attrs) do
      if EffectParam[v] then
        PlayEffectParam[v] = EffectParam[v]
      end
    end
    if EffectParam.socket then
      PlayEffectParam.SocketName = EffectParam.socket
    end
    if EffectParam.Component then
      PlayEffectParam.Component = EffectParam.Component
    end
    if EffectParam.bTickEvenWhenPaused then
      PlayEffectParam.bTickEvenWhenPaused = EffectParam.bTickEvenWhenPaused
    end
    if EffectParam.AttachLocation then
      PlayEffectParam.AttachRule = EffectParam.AttachLocation
    end
  end
  local FxObject = self:PlayEffectByIDInternal(EffectID, PlayEffectParam)
  return FxObject
end

function BP_FXComponent_C:GetPlayCircleFxDecalCNParamName(OutInnterRadiusName, OutOutsideRadiusName, OutAngelName)
  return "\229\134\133\229\190\132", "\229\164\150\229\190\132", "\232\167\146\229\186\166"
end

return BP_FXComponent_C
