require("UnLua")
local M = Class()

function M:GetSceneNo_Lua()
  return WorldTravelSubsystem():GetCurrentSceneId()
end

function M:RecordDamageTrack(DamageEvent)
  local Source = Battle(self):GetEntity(DamageEvent.SourceEid)
  local AttackerID, AttackerName
  if IsValid(Source) then
    AttackerID = Source.UnitId or "null"
    if Source.UnitName then
      AttackerName = Source.UnitName
    elseif Source.InfoForInit and Source.InfoForInit.UnitName then
      AttackerName = Source.InfoForInit.UnitName
    else
      AttackerName = "null"
    end
  else
    AttackerID = "null"
    AttackerName = "null"
  end
  self:RecordDamageTrack_Cpp(DamageEvent, AttackerID, AttackerName)
end

function M:RecordDoDamageTrack(DamageEvent)
  local Target = Battle(self):GetEntity(DamageEvent.TargetEid)
  local MonsterId = "null"
  if IsValid(Target) then
    MonsterId = tostring(Target.UnitId) or "null"
  end
  self:RecordDoDamageTrack_Cpp(DamageEvent, MonsterId)
end

function M:GetUploadBDCTrackStructCommonInfo_Lua(BonesId, MapId, Position)
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  if not PlayerCharacter then
    return false
  end
  if not PlayerCharacter.InfoForInit then
    return false
  end
  BonesId = PlayerCharacter.InfoForInit.RoleId
  MapId = WorldTravelSubsystem():GetCurrentSceneId()
  Position = PlayerCharacter:K2_GetActorLocation()
  return true
end

return M
