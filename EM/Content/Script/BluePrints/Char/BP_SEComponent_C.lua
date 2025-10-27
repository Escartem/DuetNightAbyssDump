require("UnLua")
local BP_SEComponent_C = Class()

function BP_SEComponent_C:PlayGroupFMODSe(GroupName, Mesh, HitedLocation, SocketName)
  local PlayFMODSoundTransform = Mesh:GetSocketTransform(SocketName, UE4.ERelativeTransformSpace.RTS_Component)
  local Effects = self.FMODEventEffects:Find(GroupName)
  for i, v in pairs(Effects.Effects) do
    local FMODEvent = v.AudioEvent
    UEPrint(UE4.UKismetSystemLibrary.GetDisplayName(FMODEvent))
    UE4.UFMODBlueprintStatics.PlayEventAtLocation(self, FMODEvent, PlayFMODSoundTransform, true)
  end
end

return BP_SEComponent_C
