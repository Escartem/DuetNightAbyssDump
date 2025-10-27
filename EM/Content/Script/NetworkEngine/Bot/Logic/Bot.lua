require("UnLua")
local Bot = Class()

function Bot:log(...)
  print("[" .. self.printCtx .. "]", ...)
end

function Bot:Initialize(Initializer)
  self.printCtx = "Robot:" .. tostring(self)
  self:log("Unlua Bind Success")
end

function Bot:LuaInit()
  self:log("Bot:LuaInit")
end

function Bot:LuaRun()
  self:log("Bot:LuaRun")
  coroutine.resume(coroutine.create(self.MainCo), self)
end

function Bot:LuaTick(DeltaTime)
end

local merge = require("NetworkEngine.Bot.merge")
merge(Bot, "NetworkEngine.Bot.Logic.Main", "NetworkEngine.Bot.Logic.Lib", "NetworkEngine.Bot.Logic.component.net", "NetworkEngine.Bot.Logic.component.prop", "NetworkEngine.Bot.Logic.component.login", "NetworkEngine.Bot.Logic.component.battle")
return Bot
