local FHideAllBattleEntityComponent = {}

function FHideAllBattleEntityComponent:New(TalkContext)
  local Obj = setmetatable({}, {__index = FHideAllBattleEntityComponent})
  Obj.TalkContext = TalkContext
  return Obj
end

function FHideAllBattleEntityComponent:Execute()
  self.TalkContext:SetAllBattleEntityHidden(true)
end

function FHideAllBattleEntityComponent:Resume()
  self.TalkContext:SetAllBattleEntityHidden(false)
end

return FHideAllBattleEntityComponent
