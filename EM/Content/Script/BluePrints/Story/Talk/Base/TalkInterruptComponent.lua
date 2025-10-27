require("UnLua")
local ETalkType = require("BluePrints.Story.Talk.Base.ETalkType")
local ETalkInterruptType = require("BluePrints.Story.Talk.Base.ETalkInterruptType")
local TalkInterruptComponent = {}

function TalkInterruptComponent.New()
  local TalkInterruptComponent_C = setmetatable({}, {__index = TalkInterruptComponent})
  TalkInterruptComponent_C.CachedInterrupteTyps = {}
  return TalkInterruptComponent_C
end

function TalkInterruptComponent:Clear()
end

function TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, InterruptType)
  local Res = {}
  if self.CachedInterrupteTyps[TalkType .. InterruptType] then
    return self.CachedInterrupteTyps[TalkType .. InterruptType]
  else
  end
  local InterruptInfo = DataMgr.TalkInterrupt[TalkType]
  for _, Type in pairs(ETalkType) do
    local Info = InterruptInfo[Type] or ETalkInterruptType.Blocked
    if Info == InterruptType then
      table.insert(Res, Type)
    end
  end
  self.CachedInterrupteTyps[TalkType .. InterruptType] = Res
  return Res
end

return TalkInterruptComponent
