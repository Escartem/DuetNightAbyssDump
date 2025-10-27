local Component = {}

function Component:FilterTargetIgnoreSeekEnemy(Targets)
  local NewTargets = TArray(AActor)
  for _, Target in pairs(Targets) do
    if Target and IsValid(Target) and not Target.IgnoreSeekEnemy then
      NewTargets:Add(Target)
    end
  end
  return NewTargets
end

return Component
