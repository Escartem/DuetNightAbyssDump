require("UnLua")
local BP_SaiqiSun_C = Class()

function BP_SaiqiSun_C:GetDefaultDis()
  local selfLoc = self:K2_GetActorLocation()
  local PointLoc = self.End:K2_GetComponentLocation()
  self.DefaultDis = (selfLoc - PointLoc):Size()
end

function BP_SaiqiSun_C:GetIntensity()
  if not self.Player then
    return
  end
  local PlayerLoc = self.Player:K2_GetActorLocation()
  local PointLoc = self.End:K2_GetComponentLocation()
  local RealDis = (PlayerLoc - PointLoc):Size()
  local RealIntensity = math.min((1 - RealDis / self.DefaultDis) * self.MaxIntensity, self.MaxIntensity)
  local RealIntensity = math.max(RealIntensity, self.DefaultIntensity)
  return RealIntensity
end

return BP_SaiqiSun_C
