local M = Class()

function M:ShowDeath(Monster)
  Monster:ShowDeath(self.DissolveDuration / self.TimeDilation)
end

return M
