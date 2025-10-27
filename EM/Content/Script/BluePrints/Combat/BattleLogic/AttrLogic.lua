local Component = {}

function Component:AddTN(Source, Target, Change)
  Target:AddTN(Change)
end

return Component
