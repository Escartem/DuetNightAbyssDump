local PersonalTitleUtils = {}

function PersonalTitleUtils.GetTitleName(TitleId)
  local TitleData = DataMgr.Title
  local Title = TitleData[TitleId]
  return Title and GText(Title.Name)
end

function PersonalTitleUtils.GetTitleContent(PrefixId, SuffixId)
  local PrefixTitle = PersonalTitleUtils.GetTitleName(PrefixId)
  local SuffixTitle = PersonalTitleUtils.GetTitleName(SuffixId)
  return (PrefixTitle or " ") .. (SuffixTitle or " ")
end

function PersonalTitleUtils.GetTitleFramePath(TitleFrameId)
  local TitleFrame = DataMgr.TitleFrame[TitleFrameId]
  if TitleFrame then
    if TitleFrame.FramePath then
      return TitleFrame.FramePath
    else
      DebugPrint(ErrorTag, "\229\189\147\229\137\141TitleFrameId FramePath\228\184\186\231\169\186", TitleFrameId)
    end
  else
    DebugPrint(ErrorTag, "\228\184\141\229\173\152\229\156\168\229\189\147\229\137\141TitleFrameId", TitleFrameId)
  end
end

return PersonalTitleUtils
