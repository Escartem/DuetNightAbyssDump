local Component = {}

function Component:BattleCheck(AvatarBattleInfo)
  self.logger.debug("BattleCheck")
  PrintTable(AvatarBattleInfo)
end

return Component
