require("UnLua")
local Bot = Class()
local Conf = {
  LoginHost = 308,
  DungeonID = 1001,
  Version = 1
}

function Bot:Initialize(Initializer)
end

local BotID = 0

function Bot:Unlua_Start()
  BotID = BotID + 1
  self.BotID = BotID
  coroutine.resume(coroutine.create(self.Co_Main), self)
end

function Bot:Unlua_Tick(DeltaTimes)
end

function Bot:Co_Main()
  self:log_info("Co_Main Start")
  if not self:Login(308) then
    self:log_error("login failed")
    return
  end
  UE.UKismetSystemLibrary.Delay(self, 5)
  self.Avatar = self.GameInstance:GetAvatar():GetClientAvatar()
  if not self:EnterDS(4, 0) then
    self:log_error("enter DS failed")
    return
  end
  while true do
    self:MoveRandom()
    self:BulletJump()
    self:LightAttack()
    UE.UKismetSystemLibrary.Delay(self, 1)
    self:DoubleJump()
    self:LightAttack()
    UE.UKismetSystemLibrary.Delay(self, 1)
    self:HeavyAttack()
    self:BulletJump()
  end
end

function Bot:Co_TestScene()
  UE.UKismetSystemLibrary.Delay(self, 10 * self.BotID)
  self:OpenLevel("127.0.0.1:17777", "")
  self:WaitTravelComplete(10)
  if not self.bTravelSuccess then
    self:log_error("Travel Failed")
    return
  end
  while true do
    self:MoveRandom()
    self:BulletJump()
  end
end

function Bot:Login(HostNum)
  self:log_info("Start Login" .. tostring(self.BotID))
  self:OpenLevel("Login", "")
  self:WaitTravelComplete(10)
  if not self.bTravelSuccess then
    self:log_error("Travel Failed")
    return false
  end
  local UIManger = self.GameInstance:GetGameUIManager()
  local LoginMain = UIManger:LoadUINew("LoginMainPage")
  LoginMain:DevLoginServer(HostNum, tostring(self.BotID))
  self:WaitTravelComplete(10)
  if not self.bTravelSuccess then
    self:log_error("Travel Failed")
    return false
  end
  self:log_info("Login Complete" .. tostring(self.BotID))
  return true
end

function Bot:EnterDS(DungeonID, Version)
  self:log_info("Start EnterDS" .. tostring(self.BotID))
  self.Avatar:GMEnterDsVersion(DungeonID, Version)
  self:WaitTravelComplete(10)
  if not self.bTravelSuccess then
    self:log_error("Travel Failed")
    return false
  end
  return true
end

function Bot:BulletJump()
  self:PressKey("LeftControl")
  self:PressKey("SpaceBar")
  self:ReleaseKey("SpaceBar")
  self:ReleaseKey("LeftControl")
end

function Bot:DoubleJump()
  self:PressKey("SpaceBar")
  self:ReleaseKey("SpaceBar")
  self:PressKey("SpaceBar")
  self:ReleaseKey("SpaceBar")
end

function Bot:LightAttack()
  self:PressKey("LeftMouseButton")
  self:ReleaseKey("LeftMouseButton")
end

function Bot:HeavyAttack()
  self:PressKey("LeftMouseButton")
  UE.UKismetSystemLibrary.Delay(self, 0.5)
  self:ReleaseKey("LeftMouseButton")
end

function Bot:MoveRandom()
  local KeyMap = {}
  KeyMap[1] = "W"
  KeyMap[2] = "A"
  KeyMap[3] = "S"
  KeyMap[4] = "D"
  math.randomseed(os.time() + self.BotID)
  local n = math.random(1, 4)
  self:PressKey(KeyMap[n])
  UE.UKismetSystemLibrary.Delay(self, 4)
  self:ReleaseKey(KeyMap[n])
end

return Bot
