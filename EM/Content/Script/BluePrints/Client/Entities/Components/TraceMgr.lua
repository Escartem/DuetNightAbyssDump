local Component = {}

function Component:ReportClientTrace(msg)
  self:CallServerMethod("ReportClientTrace", msg)
end

return Component
