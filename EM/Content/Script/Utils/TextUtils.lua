local EWildcardClassification = {Story = "Story"}

local function Localize(TextMapId, Language)
  Language = Language or CommonConst.SystemLanguage or CommonConst.SystemLanguages.Default
  if nil == TextMapId then
    return nil
  end
  if nil == Language then
    return nil
  end
  local TextMap = DataMgr["TextMap_" .. Language]
  local TextMapData = TextMap[TextMapId]
  if nil == TextMapData then
    return TextMapId
  end
  local LocalizedText = TextMapData[Language]
  if nil == LocalizedText then
    return TextMapId
  end
  return LocalizedText
end

local function ReplaceWildcards(TextMapId, Text)
  if nil == TextMapId then
    return Text
  end
  local TextMapData = DataMgr.TextMapWildcard[TextMapId]
  if nil == TextMapData then
    return Text
  end
  local ReplacedWildcardsText = Text
  if TextMapData.WildcardClassification == EWildcardClassification.Story then
    local WildcardSubsystem = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
    if IsValid(WildcardSubsystem) then
      ReplacedWildcardsText = WildcardSubsystem:ReplaceWildcard(Text)
    end
  end
  return ReplacedWildcardsText
end

local M = {}

function M:GetDisplayText(Text, Language)
  local DisplayText = Localize(Text, Language)
  DisplayText = ReplaceWildcards(Text, DisplayText)
  return DisplayText
end

return M
