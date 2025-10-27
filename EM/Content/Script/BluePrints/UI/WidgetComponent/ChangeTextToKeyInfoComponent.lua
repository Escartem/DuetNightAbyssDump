require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ChangeTextToKeyInfoComponent = Class()

function ChangeTextToKeyInfoComponent:AnalyzeText(MessageContent, MatchSymbol)
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

function ChangeTextToKeyInfoComponent:GetFinalContentText(ContentText)
  local strs = self:AnalyzeText(ContentText, "&")
  local final_str = ""
  local CurrentGamepadName = ""
  if self:GetGameInstance() and self:GetGameInstance().CurInputDeviceName then
    CurrentGamepadName = self:GetGameInstance().CurInputDeviceName
  end
  for i, v in pairs(strs) do
    if string.find(v, "&") then
      local KeyType
      local ActionName = string.sub(v, 2, -2)
      local Key
      Key, KeyType = self:GetKeyName(ActionName)
      if Key and KeyType then
        local KeyInfo = DataMgr.KeyboardText[Key]
        local KeyWidth = KeyInfo and KeyInfo.KeyImgWidth or 48
        local KeyHeight = KeyInfo and KeyInfo.KeyImgHeight or 48
        if "GamepadKey" == KeyType then
          final_str = final_str .. "<img id=\"" .. Key .. "\" platform=\"" .. CurrentGamepadName .. "\" width=\"" .. KeyWidth .. "\" height=\"" .. KeyHeight .. "\"></>"
        else
          final_str = final_str .. "<img id=\"" .. Key .. "\" width=\"" .. KeyWidth .. "\" height=\"" .. KeyHeight .. "\"></>"
        end
      end
    else
      final_str = final_str .. v
    end
  end
  return final_str
end

function ChangeTextToKeyInfoComponent:GetKeyName(ActionName)
  local InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionKeys = UE4.TArray(UE4.FInputActionKeyMapping)
  InputSetting:GetActionMappingByName(ActionName, ActionKeys)
  for i, KeyMap in pairs(ActionKeys) do
    local key = KeyMap.Key
    for i, v in pairs(self.CurrentInputDevice) do
      if UE4.UKismetInputLibrary["Key_Is" .. v](key) then
        local res = UE4.UFormulaFunctionLibrary.Key_GetFName(key)
        local res_TextMap_index = string.gsub(res, " ", "_")
        return res_TextMap_index, v
      end
    end
  end
  return nil, nil
end

function ChangeTextToKeyInfoComponent:AnalyzeGuideDesc(MessageContent, GuideDescValues)
  local match_word = string.gmatch(MessageContent, "#%d")
  for word in match_word, nil, nil, nil do
    local index = string.sub(word, -1)
    local desc = GuideDescValues[tonumber(index)]
    desc = string.gsub(desc, "#", "DataMgr.")
    desc = SkillUtils.SplitEval(desc, "$")
    MessageContent = string.gsub(MessageContent, word, desc)
  end
  return MessageContent
end

return ChangeTextToKeyInfoComponent
