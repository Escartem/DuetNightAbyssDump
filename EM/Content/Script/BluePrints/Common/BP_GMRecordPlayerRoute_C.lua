require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  self.CurrentInterval = 0
  self.Player = self:GetOwner()
  self.LastLocation = FVector(self.Player.CurrentLocation.X, self.Player.CurrentLocation.Y, self.Player.CurrentLocation.Z)
end

function M:ReceiveTick(DeltaSeconds)
  self.CurrentInterval = self.CurrentInterval + DeltaSeconds
  if self.CurrentInterval >= self.TickInterval then
    self.CurrentInterval = 0
    UKismetSystemLibrary.DrawDebugLine(self, self.LastLocation, self.Player.CurrentLocation, self.LineColor, self.Duration, 10)
    self.LastLocation:Set(self.Player.CurrentLocation.X, self.Player.CurrentLocation.Y, self.Player.CurrentLocation.Z)
  end
end

return M
