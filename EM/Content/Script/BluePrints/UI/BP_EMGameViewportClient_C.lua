require("UnLua")
local M = Class()

function M:OnInputKey_Lua(ControllerId, Key, EventType)
  DebugPrint(LXYTag, "BP_EMGameViewportClient_C:: OnInputKey_Lua", Key.KeyName, EventType)
  if EventType == EInputEvent.IE_Pressed then
    EventManager:FireEvent(EventID.GameViewportInputKeyPressed, Key)
  elseif EventType == EInputEvent.IE_Released then
    EventManager:FireEvent(EventID.GameViewportInputKeyReleased, Key)
  elseif EventType == EInputEvent.IE_Repeat then
    EventManager:FireEvent(EventID.GameViewportInputKeyLongPressed, Key)
  end
end

function M:OnInputAxis_Lua(ControllerId, Key, Delta, DeltaTime, NumSamples, bGamepad)
end

function M:OnViewportSizeChanged_Lua()
  DebugPrint(LXYTag, "BP_EMGameViewportClient_C:: OnViewportSizeChanged_Lua")
  EventManager:FireEvent(EventID.GameViewportSizeChanged)
end

return M
