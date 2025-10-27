require("UnLua")
local M = {}

function M:GetKeyName(ActionName, CurrentInputDevice)
  local InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionKeys = UE4.TArray(UE4.FInputActionKeyMapping)
  InputSetting:GetActionMappingByName(ActionName, ActionKeys)
  for i, KeyMap in pairs(ActionKeys) do
    local key = KeyMap.Key
    for i, v in pairs(CurrentInputDevice) do
      if UE4.UKismetInputLibrary["Key_Is" .. v](key) then
        local res = UE4.UFormulaFunctionLibrary.Key_GetFName(key)
        local res_TextMap_index = string.gsub(res, " ", "_")
        return res_TextMap_index, v
      end
    end
  end
  return nil, nil
end

function M:GetFinalContentText(ContentText, CurrentInputDevice)
  local strs = M:AnalyzeText(ContentText, "&")
  local final_str = ""
  for i, v in pairs(strs) do
    if string.find(v, "&") then
      local KeyType
      local ActionName = string.sub(v, 2, -2)
      local Key
      Key, KeyType = M:GetKeyName(ActionName, CurrentInputDevice)
      if "KeyboardKey" == KeyType then
        Key = "" ~= GText(Key) and GText(Key) or Key
        final_str = final_str .. "<Highlight>" .. Key .. "</>"
      elseif "MouseButton" == KeyType or "GamepadKey" == KeyType then
        final_str = final_str .. "<img id=\"" .. Key .. "\"></>"
      end
    else
      final_str = final_str .. v
    end
  end
  return final_str
end

function M:AnalyzeText(MessageContent, MatchSymbol)
  if not MatchSymbol then
    return {}
  end
  local match_res = {}
  local match_word = string.gmatch(MessageContent, MatchSymbol .. "%w+" .. MatchSymbol)
  for word in match_word, nil, nil, nil do
    local start_index, end_index = string.find(MessageContent, word)
    table.insert(match_res, string.sub(MessageContent, 1, start_index - 1))
    table.insert(match_res, word)
    MessageContent = string.sub(MessageContent, end_index + 1)
  end
  table.insert(match_res, MessageContent)
  return match_res
end

return M
