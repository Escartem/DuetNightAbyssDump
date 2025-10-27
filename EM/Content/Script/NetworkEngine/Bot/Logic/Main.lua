local MainCo = {}

function MainCo:MainCo()
  self:CoSleep((self.ID - UE.URobotInstance.GetIntFromCMD("-LogicRobotStartID=")) * 0.1)
  self:MainCoNewAccountLoopLogin()
  self:log("MainCo done")
end

function MainCo:MainCoNewAccountLoopLogin()
  while true do
    self:MainCoLogin()
    self:DisConnect()
    self:CoSleep(2)
  end
end

return MainCo
