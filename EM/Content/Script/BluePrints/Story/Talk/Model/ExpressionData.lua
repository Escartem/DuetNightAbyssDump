local ExpressionData_C = {}
local FeishuErrorTitle = "\230\146\173\230\148\190\232\161\168\230\131\133\229\135\186\233\148\153"

function ExpressionData_C.New(ExpressionId)
  local Obj = setmetatable({}, {})
  local FacialData = DataMgr.Facial[ExpressionId]
  if not FacialData then
    local Message = "Facial\232\161\168\228\184\173\230\151\160FacialId:" .. tostring(ExpressionId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, FeishuErrorTitle, Message)
    return Obj
  end
  Obj.ExpressionId = ExpressionId
  return Obj
end

return {ExpressionData_C = ExpressionData_C}
