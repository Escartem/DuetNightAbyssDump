local M = Class()

function M:TriggerBeAttacked(Monster)
  Monster:TriggerBeAttacked()
end

return M
